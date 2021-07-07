FROM ${DOCKER_ARCH}alpine:latest
LABEL maintainer="Zac Schellhardt <zac@z12t.com>"

RUN \
  apk add \
    --no-cache \
    --repository 'http://dl-cdn.alpinelinux.org/alpine/edge/main' \
    git

#
# Pull source code from GitHub, and run the installer script
#
RUN git clone https://github.com/jekhokie/raspberry-noaa-v2.git \
  && cd raspberry-noaa-v2/

COPY install_and_upgrade.sh /install_and_upgrade.sh
COPY config/settings.yml.sample /config/settings.yml
RUN chmod +x /install_and_upgrade.sh
RUN chmod 700 /config/settings.yml

ENTRYPOINT ["/install_and_upgrade.sh"]
