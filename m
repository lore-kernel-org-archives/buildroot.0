From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 May 2020 07:09:57 +0200
Subject: [Buildroot] [PATCH 4/4 v2] support/docker: add a Fedore-32
 based image
In-Reply-To: <48c45cb866a160ce4cc05b03fdf15237eb346b66.1589751688.git.yann.morin.1998@free.fr>
References: <cover.1589751688.git.yann.morin.1998@free.fr>
 <48c45cb866a160ce4cc05b03fdf15237eb346b66.1589751688.git.yann.morin.1998@free.fr>
Message-ID: <20200518070957.0c4673cc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for doing this work, I did need some Docker images just
yesterday. One comment/question below.

On Sun, 17 May 2020 23:41:40 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

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
> +        git \
> +        mercurial \
> +        ncurses-devel \
> +        perl-ExtUtils-MakeMaker \
> +        perl-Thread-Queue \
> +        python-nose2 \
> +        python-pexpect \
> +        qemu-system-arm \
> +        qemu-system-x86 \

With python-nose2 and python-pexpect, this pulls in a Python
interpreter, which is not strictly a requirement of Buildroot. I know
these are needed to run the runtime tests, and therefore to run the
Gitlab CI stuff. But sometimes we need to do some tests with really the
minimal set of Buildroot dependencies. Same goes with qemu-system-*
packages.

Should we have two sets of Docker images, one with the minimal set of
dependencies, and one that adds the stuff needed for Gitlab CI ? I
believe Docker allows to create some kind of layered "thing" where an
image sits on top of another.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
