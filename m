From: Martin Bark <martin@barkynet.com>
Date: Sat, 14 Jul 2018 12:19:38 +0100
Subject: [Buildroot] [PATCH 5/5] support/docker: add an Alpine-3.7 based
 image
In-Reply-To: <9f99ad9f8d86876a7e16185a9025223bc01edf9d.1531463897.git.yann.morin.1998@free.fr>
References: <cover.1531463897.git.yann.morin.1998@free.fr>
 <9f99ad9f8d86876a7e16185a9025223bc01edf9d.1531463897.git.yann.morin.1998@free.fr>
Message-ID: <CAFGQKxeasgYdMq-s1mpehYPFHbc0ChTko6s=kSZMjCbvudiKYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On 13 July 2018 at 07:38, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> No attempt was made at making this image reproducible.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/docker/Dockerfile.alpine-3.7 | 42 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 support/docker/Dockerfile.alpine-3.7
>
> diff --git a/support/docker/Dockerfile.alpine-3.7 b/support/docker/Dockerfile.alpine-3.7
> new file mode 100644
> index 0000000000..e05eb2bd4a
> --- /dev/null
> +++ b/support/docker/Dockerfile.alpine-3.7
> @@ -0,0 +1,42 @@
> +# vi: ft=dockerfile
> +# Note: this dockerfile is not reproducible, because the repository
> +# where we fetch packages from is not pinned to a specific point in
> +# time; i.e. we'll get whatever is current at the moment we build.
> +
> +FROM alpine:3.7
> +
> +LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
> +      vendor="Buildroot" \
> +      description="Container based on Alpine 3.7, with everything needed to run Buildroot already installed"
> +

It's best practice to combine the update and install from a package
manger in one line.  So this should be changed to

RUN apk update && apk add \

Thanks

Martin

> +RUN apk update
> +
> +RUN apk add \
> +    alpine-sdk \
> +    bash \
> +    bc \
> +    bzip2 \
> +    bzr \
> +    cpio \
> +    cvs \
> +    file \
> +    flake8 \
> +    grep \
> +    gzip \
> +    mercurial \
> +    ncurses-dev \
> +    perl \
> +    py2-nose \
> +    py2-pexpect \
> +    python \
> +    rsync \
> +    subversion \
> +    unzip \
> +    wget
> +
> +RUN adduser -h /home/br-user -s /bin/bash -D br-user
> +
> +USER br-user
> +WORKDIR /home/br-user
> +ENV HOME /home/br-user
> +ENV LC_ALL en_US.UTF-8
> --
> 2.14.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
