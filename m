From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 Jun 2020 22:12:40 +0200
Subject: [Buildroot] [PATCH 4/4 v2] support/docker: add a Fedore-32
 based image
In-Reply-To: <48c45cb866a160ce4cc05b03fdf15237eb346b66.1589751688.git.yann.morin.1998@free.fr>
References: <cover.1589751688.git.yann.morin.1998@free.fr>
 <48c45cb866a160ce4cc05b03fdf15237eb346b66.1589751688.git.yann.morin.1998@free.fr>
Message-ID: <3aff567d-eeaa-2aaf-0760-29854a21a504@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit tittle : Fedore/Fedora

Le 17/05/2020 ? 23:41, Yann E. MORIN a ?crit?:
> Hopefully, this image is reproducible, since we are not using any update
> repository, and from the looks of it, the repository of the release is
> never touched.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Changes v1 -> v2:
>   - fix ordering of packages list  (Ricardo)
> ---
>  support/docker/Dockerfile.fedora-32 | 48 +++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 support/docker/Dockerfile.fedora-32
> 
> diff --git a/support/docker/Dockerfile.fedora-32 b/support/docker/Dockerfile.fedora-32
> new file mode 100644
> index 0000000000..85e5c4ba9c
> --- /dev/null
> +++ b/support/docker/Dockerfile.fedora-32
> @@ -0,0 +1,48 @@
> +# vi: ft=dockerfile
> +# Note: this dockerfile is not reproducible, because the repository
> +# where we fetch packages from is not pinned to a specific point in
> +# time; i.e. we'll get whatever is current at the moment we build.
> +
> +FROM fedora:32
> +
> +LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
> +      vendor="Buildroot" \
> +      description="Container based on Fedora 32, with everything needed to run Buildroot already installed"
> +
> +# Remove the repository with updates, so we only
> +# get packages as they were at time of release.
> +RUN rm -f /etc/yum.repos.d/fedora-updates*.repo && \
> +    dnf -y install \
> +        @development-tools \
> +        bc \
> +        bzip2 \
> +        bzr \
> +        cpio \
> +        cvs \
> +        file \
> +        gcc-c++ \

In order to use x86 toolchains, we should install glibc.i686 package.

> +        git \
> +        mercurial \
> +        ncurses-devel \
> +        perl-ExtUtils-MakeMaker \
> +        perl-Thread-Queue \

> +        python-nose2 \> +        python-pexpect \

There is no such python2 package but instead

python3-nose2
python3-pexpect


> +        qemu-system-arm \
> +        qemu-system-x86 \
> +        rsync \
> +        subversion \

sudo ?

> +        unzip \
> +        wget \
> +        which \
> +    && dnf -y clean all
> +
> +RUN useradd -ms /bin/bash br-user && \
> +    chown -R br-user:br-user /home/br-user && \
> +    printf 'br-user ALL=NOPASSWD: /usr/bin/su -\n' >/etc/sudoers.d/br-user && \
> +    chmod 0440 /etc/sudoers.d/br-user
> +
> +USER br-user
> +WORKDIR /home/br-user
> +ENV HOME /home/br-user
> +ENV LC_ALL C.utf8
> 
