From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Aug 2013 12:24:59 +0200
Subject: [Buildroot] [PATCH 1/3] ltrace: Explicit enable/disable of
 libunwind
In-Reply-To: <1376041019-26688-2-git-send-email-jezz@sysmic.org>
References: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
 <1376041019-26688-2-git-send-email-jezz@sysmic.org>
Message-ID: <20130809122459.5e282d84@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri,  9 Aug 2013 11:36:57 +0200, J?r?me Pouiller wrote:
> ltrace automaticaly use libunwind if detected. So depending if libunwind was

automatically uses

> already compiled or not, ltrcae compile differently. This patch add explicit

ltrace compiles

This patch adds an

> dependency to libunwind if detected.
> 
> In add, due to limitation of luclibc, ltrace cannot use libunwind with uclib. this patch explicitly compile without libunwind in this case.

Line should be wrapped and fixed from typos.


> diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
> index 7b8d859..4d81121 100644
> --- a/package/ltrace/ltrace.mk
> +++ b/package/ltrace/ltrace.mk
> @@ -13,4 +13,13 @@ LTRACE_CONF_OPT = --disable-werror
>  LTRACE_LICENSE = GPLv2
>  LTRACE_LICENSE_FILES = COPYING
>  
> +LTRACE_LIBUNWIDFLAG = --without-libunwind
> +ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
> +  ifneq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +    LTRACE_DEPENDENCIES = libunwind
> +    LTRACE_LIBUNWIDFLAG = --with-libunwind
> +  endif
> +endif
> +LTRACE_CONF_OPT = $(LTRACE_LIBUNWIDFLAG)

That's not how we typically write such things. We normally do something
like:

ifeq ($(BR2_PACKAGE_LIBUNWIND)$(BR2_TOOLCHAIN_USES_GLIBC),yy)
LTRACE_DEPENDENCIES += libunwind
LTRACE_CONF_OPT += --with-libunwind
else
LTRACE_CONF_OPT += --without-libunwind
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
