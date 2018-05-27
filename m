From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 May 2018 18:42:13 +0200
Subject: [Buildroot] [PATCH v3 5/7] support/dockerfile: install flake8
In-Reply-To: <1520910585-19097-6-git-send-email-ricardo.martincoski@gmail.com>
References: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
 <1520910585-19097-6-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180527164213.GD2965@scaer>
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
[--SNIP--]
> +# For check-flake8
> +RUN python -m pip install --upgrade pip setuptools wheel && \

So, back when you submnitted this patch, I ACKed it. But I missed that
this command really means we can't reproduce the docker file, because it
will use versions of pip, setuptools, and wheel that are current at the
time the command is run.

I.e. today I could very well get something that is different from the
version we got back at 20180205.0730 when we last built the docker
image.

This is not really nice... :-(

Do you think we could get away without running this command at all, and
just run the pip-install one, below, since we force the version of the
modules we isntall?

Regards,
Yann E. MORIN.

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
