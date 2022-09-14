FROM alpine:latest AS builder

RUN apk update && apk upgrade --purge && \
    apk add git imagemagick g++ make && \
    git clone https://github.com/stefanhaustein/TerminalImageViewer.git && \
    cd TerminalImageViewer/src/main/cpp && \
    make && make install

FROM alpine:latest AS tiv
RUN apk add imagemagick # TIV needs imagemagick to work
COPY --from=builder /usr/local/bin/tiv /usr/local/bin/tiv

