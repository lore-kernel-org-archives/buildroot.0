From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 22:54:38 +0100
Subject: [Buildroot] [PATCH v3 16/17] package/fftw: remove as regular
 package
In-Reply-To: <20181231133030.25991-17-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-17-thomas.petazzoni@bootlin.com>
Message-ID: <20190101215438.GF23435@scaer>
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

An additional, small nit to notice, below, to make check-package
happy...

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Config.in.legacy       | 36 ++++++++++++++++++++++++++++++++++++
>  package/fftw/Config.in | 41 -----------------------------------------
>  package/fftw/fftw.mk   | 18 ------------------
>  3 files changed, 36 insertions(+), 59 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 8cab6a23af..836c10fa48 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,42 @@ endif
>  
>  comment "Legacy options removed in 2019.02"
>  
> +config BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +	bool "single"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_FFTW_SINGLE
> +	help
> +	  This option has been removed in favor of
> +	  BR2_PACKAGE_FFTW_SINGLE.
> +
> +

Two consecutive empty lines, and check-package conplains:
    Config.in.legacy:157: consecutive empty lines

Regards,
Yann E. MORIN.

> +config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
> +	bool "double"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_FFTW_DOUBLE
> +	help
> +	  This option has been removed in favor of
> +	  BR2_PACKAGE_FFTW_DOUBLE.
> +
> +config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
> +	bool "long double"
> +	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
> +		(BR2_arm || BR2_mips || BR2_mipsel))
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_FFTW_LONG_DOUBLE
> +	help
> +	  This option has been removed in favor of
> +	  BR2_PACKAGE_FFTW_LONG_DOUBLE.
> +
> +config BR2_PACKAGE_FFTW_PRECISION_QUAD
> +	bool "quad"
> +	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_FFTW_QUAD
> +	help
> +	  This option has been removed in favor of
> +	  BR2_PACKAGE_FFTW_QUAD.
> +
>  config BR2_PACKAGE_LUA_5_2
>  	bool "Lua 5.2.x version removed"
>  	select BR2_LEGACY
> diff --git a/package/fftw/Config.in b/package/fftw/Config.in
> index ed87de1a70..9e060ba5da 100644
> --- a/package/fftw/Config.in
> +++ b/package/fftw/Config.in
> @@ -12,47 +12,6 @@ config BR2_PACKAGE_FFTW
>  
>  if BR2_PACKAGE_FFTW
>  
> -choice
> -	prompt "fftw precision"
> -	default BR2_PACKAGE_FFTW_PRECISION_DOUBLE
> -	help
> -	  Selects fftw precision
> -
> -config BR2_PACKAGE_FFTW_PRECISION_SINGLE
> -	bool "single"
> -	select BR2_PACKAGE_FFTW_SINGLE
> -	help
> -	  Compile fftw in single precision, i.e. use 'float' for
> -	  floating point type.
> -
> -config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
> -	bool "double"
> -	select BR2_PACKAGE_FFTW_DOUBLE
> -	help
> -	  Compile fftw in double precision (the default), i.e. use
> -	  'double' for floating point type.
> -
> -config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
> -	bool "long double"
> -	# long-double precision require long-double trigonometric routines
> -	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
> -		(BR2_arm || BR2_mips || BR2_mipsel))
> -	select BR2_PACKAGE_FFTW_LONG_DOUBLE
> -	help
> -	  Compile fftw in long double precision, i.e. use 'long double'
> -	  for floating point type.
> -
> -config BR2_PACKAGE_FFTW_PRECISION_QUAD
> -	bool "quad"
> -	# quad-precision needs to have a gcc with libquadmath
> -	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR
> -	select BR2_PACKAGE_FFTW_QUAD
> -	help
> -	  Compile fftw in quadruple precision, i.e. use '__float128' for
> -	  floating point type.
> -
> -endchoice
> -
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
