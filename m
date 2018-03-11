From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Mar 2018 09:51:19 +0100
Subject: [Buildroot] [PATCH v2 5/7] support/dockerfile: install flake8
In-Reply-To: <1520745334-13411-6-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
 <1520745334-13411-6-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180311085119.GA2429@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-03-11 02:15 -0300, Ricardo Martincoski spake thusly:
> Use the latest version of the tool because it is actively maintained.
> But use a fixed version of the tool and its dependencies to get stable
> results. It can be manually bumped from time to time.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Changes v1 -> v2:  (suggested by Yann E. MORIN)
>   - install flake8 to the base docker image instead of adding sudo to
>     install tools on the fly.
> ---
>  support/docker/Dockerfile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index ce3fdd9..f2ba064 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -27,10 +27,15 @@ RUN dpkg --add-architecture i386 && \
>          cvs bzr git mercurial subversion wget \
>          cpio unzip \
>          libncurses5-dev \
> -        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 && \
> +        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 \
> +        python-pip && \
>      apt-get -y autoremove && \
>      apt-get -y clean
>  
> +# For check-flake8
> +RUN pip install -q setuptools
> +RUN pip install -q flake8==3.5.0 mccabe==0.6.1 pycodestyle==2.3.1 pyflakes==1.6.0

Please, run this with a single RUN command, to minimise the inter;ediate
layers.

Also, you need to explain why you install setuptools separately, and why
you don't force the version for it.

Finally, , have a single pacakge on each line, so that it is easier to
maintain.

    RUN pip install -q setuptools && \
        pip install -q \
            flake8==3.5.0 \
            mccabe==0.6.1 \
            pycodestyle==2.3.1 \
            pyflakes==1.6.0

Note: I know the list of deb packages is neither sorted nor one-package
per line, but that's historical; best practices suggest a single package
per line:
    https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#minimize-the-number-of-layers
    https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#sort-multi-line-arguments

Regards,
Yann E. MORIN.

> +
>  # To be able to generate a toolchain with locales, enable one UTF-8 locale
>  RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
>      /usr/sbin/locale-gen
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
