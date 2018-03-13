From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Mar 2018 18:22:28 +0100
Subject: [Buildroot] [PATCH v3 5/7] support/dockerfile: install flake8
In-Reply-To: <1520910585-19097-6-git-send-email-ricardo.martincoski@gmail.com>
References: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
 <1520910585-19097-6-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180313172228.GB4317@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-03-13 00:09 -0300, Ricardo Martincoski spake thusly:
> Use the latest version of the tool because it is actively maintained.
> But use a fixed version of the tool and its dependencies to get stable
> results. It can be manually bumped from time to time.
> 
> Before installing any Python packages, ensure pip, setuptools, and wheel
> are up to date as recommended in the docs [1].
> 
> [1] https://packaging.python.org/tutorials/installing-packages/
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:  (suggested by Yann E. MORIN)
>   - minimise the number of intermediate layers;
>   - explain why install setuptools separately using the latest version
>     (I actually just used the exact command line from the docs and
>     referenced it in the commit log);
>   - use a single package on each line, sorted.
> 
> Changes v1 -> v2:  (suggested by Yann E. MORIN)
>   - install flake8 to the base docker image instead of adding sudo to
>     install tools on the fly.
> ---
>  support/docker/Dockerfile | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index ce3fdd9..f01ac25 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -27,10 +27,19 @@ RUN dpkg --add-architecture i386 && \
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
> +RUN python -m pip install --upgrade pip setuptools wheel && \
> +    pip install -q \
> +        flake8==3.5.0 \
> +        mccabe==0.6.1 \
> +        pycodestyle==2.3.1 \
> +        pyflakes==1.6.0
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
