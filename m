From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Feb 2013 03:12:20 +0100
Subject: [Buildroot] [PATCH 1/2] Add bzip2 to host-python when it is
 selected (aids in compiling nodejs)
In-Reply-To: <CAKduhStasUzEq99Dfb9mF8DEKuTPc4cjaXKA1T+sMzaj7-CDEQ@mail.gmail.com>
References: <CAKduhStasUzEq99Dfb9mF8DEKuTPc4cjaXKA1T+sMzaj7-CDEQ@mail.gmail.com>
Message-ID: <20130216031220.5a6eca44@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Price,

On Thu, 14 Feb 2013 17:05:48 -0800, Daniel Price wrote:

> diff --git a/package/python/python.mk b/package/python/python.mk
> index 71591b7..580eda2 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -30,7 +30,6 @@ HOST_PYTHON_CONF_OPT += \
>   --disable-gdbm \
>   --disable-bsddb \
>   --disable-test-modules \
> - --disable-bz2 \
>   --disable-ssl
> 
>  HOST_PYTHON_MAKE_ENV = \
> @@ -98,6 +97,8 @@ endif
> 
>  ifeq ($(BR2_PACKAGE_PYTHON_BZIP2),y)
>  PYTHON_DEPENDENCIES += bzip2
> +HOST_PYTHON_DEPENDENCIES += host-bzip2
> +PYTHON_CONF_OPT += --enable-bz2

Wasn't the intention of adding bz2 support to the host python?

But anyway, the fact that BR2_PACKAGE_PYTHON_BZIP2 is enabled or not
should not influence the host-python build. BR2_PACKAGE_PYTHON_BZIP2
is here to configure the target python, not the host one. We presently
don't have a good way to provide configuration options for host
packages.

So your patch should presumably just:

 * Remove the --disable-bz2 line from HOST_PYTHON_CONF_OPT, as you did,
   and replace it with --enable-bz2.

 * Outside of any ifeq condition, do HOST_PYTHON_DEPENDENCIES +=
   host-bzip2.

That will mean that everybody building host-python will have to build
host-bzip2 and the bz2 support in Python, but I think it's OK.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
