From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 13:24:59 +0100
Subject: [Buildroot] [PATCH v3 16/17] package/fftw: remove as regular
 package
In-Reply-To: <20181231133030.25991-17-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-17-thomas.petazzoni@bootlin.com>
Message-ID: <20190101122459.GO26917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gwenha?l, All,

On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> fftw is no longer a package: only fftw-single, fftw-double,
> fftw-long-double and fftw-quad are. fftw.mk only contains some common
> definitions that are used by the different fftw variants.
> 
> The old BR2_PACKAGE_FFTW_PRECISION_* options, which are no longer used
> anywhere, are moved to Config.in.legacy.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

A review of that one even if the previoius are not still reviewed, so
that I don;t forget what I noticed...

> ---
>  Config.in.legacy       | 36 ++++++++++++++++++++++++++++++++++++
>  package/fftw/Config.in | 41 -----------------------------------------
>  package/fftw/fftw.mk   | 18 ------------------
>  3 files changed, 36 insertions(+), 59 deletions(-)
> 
[--SNIP--]
> diff --git a/package/fftw/Config.in b/package/fftw/Config.in
> index ed87de1a70..9e060ba5da 100644
> --- a/package/fftw/Config.in
> +++ b/package/fftw/Config.in
> @@ -12,47 +12,6 @@ config BR2_PACKAGE_FFTW
>  
>  if BR2_PACKAGE_FFTW
>  
> -choice
[--SNIP--]
> -endchoice

So, basically, enabling the fftw package no longer ensures there is at
least one variant to build.

This basically means that a defconfig that relied on the default flavour
to be enabled (double) now breaks.

What about:

    config BR2_PACKAGE_FFTW
        bool "fftw"
        select BR2_PACKAGE_FFTW_DOUBLE if !BR2_PACKAGE_FFTW_SINGLE \
                                       && !BR2_PACKAGE_FFTW_LONG_DOUBLE \
                                       && !BR2_PACKAGE_FFTW_QUAD

Or something to ensure there is at least one variant enabled (and the
same as the default precviouslty was).

Regards,
Yann E. MORIN.

>  source "package/fftw/fftw-single/Config.in"
>  source "package/fftw/fftw-double/Config.in"
>  source "package/fftw/fftw-long-double/Config.in"
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index 862ad5edc0..bcfdb9c96a 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -10,22 +10,6 @@ FFTW_INSTALL_STAGING = YES
>  FFTW_LICENSE = GPL-2.0+
>  FFTW_LICENSE_FILES = COPYING
>  
> -ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
> -FFTW_DEPENDENCIES += fftw-double
> -endif
> -
> -ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
> -FFTW_DEPENDENCIES += fftw-long-double
> -endif
> -
> -ifeq ($(BR2_PACKAGE_FFTW_QUAD),y)
> -FFTW_DEPENDENCIES += fftw-quad
> -endif
> -
> -ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
> -FFTW_DEPENDENCIES += fftw-single
> -endif
> -
>  # fortran support only enables generation and installation of fortran sources
>  ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
>  FFTW_COMMON_CONF_OPTS += --enable-fortran
> @@ -49,6 +33,4 @@ FFTW_COMMON_CONF_OPTS += --disable-threads
>  endif
>  FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
>  
> -$(eval $(generic-package))
> -
>  include $(sort $(wildcard package/fftw/*/*.mk))
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
