From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 03 Jun 2018 20:21:59 -0300
Subject: [Buildroot] [PATCH 2/5] support/docker: sort the list of
 installed packages
References: <49308956156142d6dab6b7917fcd8429f155ffa5.1528016895.git.yann.morin.1998@free.fr>
Message-ID: <5b147817c2d6_4a712ad8ec78fccc8903e@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Nit: you forgot to use -v2 with format-patch.

On Sun, Jun 03, 2018 at 06:08 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> As suggested in the docker best practices [0], order the package list
> alphabetically, and list only one package per line.
> 
> This will be much usefull later, we need to update the list of installed
> packages, like adding new ones for example.
> 
> [0] https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#sort-multi-line-arguments
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 

'git am' automatically removes this empty line.

> ---
> Changes v1 -> v2:
>   - don't drop python-pip yet  (Ricardo)
> ---
>  support/docker/Dockerfile | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index 8c525f7cf1..fe9e643a34 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -22,13 +22,29 @@ COPY apt-sources.list /etc/apt/sources.list
>  RUN dpkg --add-architecture i386 && \
>      apt-get update -y
>  RUN apt-get install -y --no-install-recommends \
> -        build-essential cmake libc6:i386 g++-multilib \

I missed that when reviewing the first iteration...

> -        bc ca-certificates file locales rsync \
> -        cvs bzr git mercurial subversion wget \
> -        cpio unzip \
> +        bc \
> +        build-essential \
> +        bzr \
> +        ca-certificates \

'cmake' was removed by mistake.

Obviously, since host-cmake will be built when needed, it should not make any
current or upcoming test case to fail. I actually tested with the current test
cases (still running while I write this):
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/23112714
I didn't checked if any current test case is already requiring cmake.

But removing cmake will make any test case that needs it to take longer to run,
as the version seems suitable to be used:

br-user at b976f947b114:~$ cmake --version
cmake version 3.7.2

The build of host-cmake is probably already covered by the autobuilders.
And if we want to have a test case in the test infra for this the best way IMO
is to write a specific test for it.

> +        cpio \
> +        cvs \
> +        file \
> +        g++-multilib \
> +        git \
> +        libc6:i386 \
>          libncurses5-dev \
> -        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 \
> -        python-pip && \
> +        locales \
> +        mercurial \
> +        python-nose2 \
> +        python-pexpect \
> +        python-pip \
> +        qemu-system-arm \
> +        qemu-system-x86 \
> +        rsync \
> +        subversion \
> +        unzip \
> +        wget \
> +        && \
>      apt-get -y autoremove && \
>      apt-get -y clean
>  
> -- 
> 2.14.1

[I am not against using && in a separate line as we discussed in
 http://lists.busybox.net/pipermail/buildroot/2018-June/222901.html .
 With cmake added back to the list please add]
 Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
