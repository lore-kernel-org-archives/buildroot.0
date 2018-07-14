From: Martin Bark <martin@barkynet.com>
Date: Sat, 14 Jul 2018 12:19:10 +0100
Subject: [Buildroot] [PATCH 4/5] support/docker: add an Arch image
In-Reply-To: <b909713a26b89db6eae65efffa7e05a8136fd9df.1531463897.git.yann.morin.1998@free.fr>
References: <cover.1531463897.git.yann.morin.1998@free.fr>
 <b909713a26b89db6eae65efffa7e05a8136fd9df.1531463897.git.yann.morin.1998@free.fr>
Message-ID: <CAFGQKxd62h=khKBwP7RwM1uVsAQybHJVjuxNHfPfmaq3Re83gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On 13 July 2018 at 07:38, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Hopefully, this image is reproducible, since we are using a tagged
> base image, plus a pinned repository mirror.
>
> As for the Debian-stretch Dockerfile, we refresh the repository and
> install packages in two different layers (see commit c4f844ff321
> (support/docker: run apt-get update and apt-get install in two RUNs)
> for in-depth explanations.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/docker/Dockerfile.arch-2018.07.01 | 40 +++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 support/docker/Dockerfile.arch-2018.07.01
>
> diff --git a/support/docker/Dockerfile.arch-2018.07.01 b/support/docker/Dockerfile.arch-2018.07.01
> new file mode 100644
> index 0000000000..65e74d0fdb
> --- /dev/null
> +++ b/support/docker/Dockerfile.arch-2018.07.01
> @@ -0,0 +1,40 @@
> +# vi: ft=dockerfile
> +
> +# When updating this version, please also update it below.
> +FROM base/devel:2018.07.01
> +
> +LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
> +      vendor="Buildroot" \
> +      description="Container based on Arch 2018.07.01, with everything needed to run Buildroot already installed"
> +

It's best practice to combine the update and install from a package
manger in one line.  So this should be

RUN echo 'Server=https://archive.archlinux.org/repos/2018/07/01/$repo/os/$arch'
\
        > /etc/pacman.d/mirrorlist && \
    pacman -Sy --noconfirm \

> +# Pin the repository to a known version
> +RUN echo 'Server=https://archive.archlinux.org/repos/2018/07/01/$repo/os/$arch' \
> +        > /etc/pacman.d/mirrorlist && \
> +    pacman -Sy
> +RUN pacman --noconfirm -S \
> +        bc \
> +        bzr \
> +        cvs \
> +        cpio \
> +        flake8 \
> +        git \
> +        mercurial \
> +        python \
> +        python-nose2 \
> +        python-pexpect \
> +        qemu \
> +        qemu-arch-extra \

If you change to using qemu-headless and qemu-headless-arch-extra
packages it saves about 500MB on the image size

Thanks

Martin

> +        rsync \
> +        subversion \
> +        unzip \
> +        wget
> +
> +RUN sed -i 's/# *\(en_US.UTF-8\)/\1/' /etc/locale.gen \
> +    && /usr/sbin/locale-gen
> +
> +RUN useradd -ms /bin/bash br-user
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
