From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Feb 2019 15:38:55 +0100
Subject: [Buildroot] [PATCH v4 04/17] package/fftw: break fftw-quad into
 a dedicated package
In-Reply-To: <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-1-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-2-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-3-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
Message-ID: <20190202143855.GA3761@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2019-01-21 14:50 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> fftw's library name depends on the precision option. Consequently,
> it's possible to install multiple flavor on the same target.
> 
> This patch breaks fftw quad precision into a new package and:
> 
> - makes BR2_PACKAGE_FFTW_PRECISION_QUAD select BR2_PACKAGE_FFTW_QUAD
>   to keep compatibility with packages that use
>   BR2_PACKAGE_FFTW_PRECISION_QUAD. This option will be removed in a
>   follow-up commit;
> 
> - makes fftw depend on fftw-quad when this package is enabled.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> [Yann/Thomas:
>  - Force --disable-quad in FFTW_CONF_OPTS, just for the sake of
>    clarity (fftw is no longer going to build the quad variant)
>  - Use FFTW_QUAD_DL_SUBDIR to avoid downloading fftw multiple times
>  - Minor reformatting tweaks in fftw-quad.mk
>  - Do not deprecate BR2_PACKAGE_FFTW_PRECISION_QUAD and instead
>    make it select BR2_PACKAGE_FFTW_QUAD, so that packages using
>    BR2_PACKAGE_FFTW_PRECISION_QUAD continue to work.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> [Gwenhael/Yann]:
>  - (BR2_i386 || BR2_x86_64) -> BR2_TOOLCHAIN_HAS_LIBQUADMATH
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/fftw/Config.in                |  2 ++
>  package/fftw/fftw-quad/Config.in      |  7 +++++++
>  package/fftw/fftw-quad/fftw-quad.hash |  1 +
>  package/fftw/fftw-quad/fftw-quad.mk   | 22 ++++++++++++++++++++++
>  package/fftw/fftw.mk                  |  6 +++++-
>  5 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/package/fftw/Config.in b/package/fftw/Config.in
> index 4f37b43a60..8699d9c350 100644
> --- a/package/fftw/Config.in
> +++ b/package/fftw/Config.in
> @@ -49,6 +49,7 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
>  	bool "quad"
>  	# quad-precision needs to have a gcc with libquadmath
>  	depends on (BR2_i386 || BR2_x86_64) && BR2_USE_WCHAR

You forgot to switch to libquadmath here, although...

> +	select BR2_PACKAGE_FFTW_QUAD
>  	help
>  	  Compile fftw in quadruple precision, i.e. use '__float128' for
>  	  floating point type.
> @@ -57,6 +58,7 @@ endchoice
>  
>  source "package/fftw/fftw-single/Config.in"
>  source "package/fftw/fftw-long-double/Config.in"
> +source "package/fftw/fftw-quad/Config.in"
>  
>  config BR2_PACKAGE_FFTW_FAST
>  	bool "optimise for speed over accuracy"
> diff --git a/package/fftw/fftw-quad/Config.in b/package/fftw/fftw-quad/Config.in
> new file mode 100644
> index 0000000000..10d296df91
> --- /dev/null
> +++ b/package/fftw/fftw-quad/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_FFTW_QUAD
> +	bool "fftw-quad"
> +	# quad-precision needs to have a gcc with libquadmath
> +	depends on BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR

... you did it here, and thus the old symbol that does the 'select' does
not have the same dependencies as the new symbol.

Also, this change should be done in own patch all alone (i.e. do the
chage in a patch just before the conversions to individual packages).

Regards,
Yann E. MORIN.

> +	help
> +	  Compile fftw in quadruple precision, i.e. use '__float128' for
> +	  floating point type.
> diff --git a/package/fftw/fftw-quad/fftw-quad.hash b/package/fftw/fftw-quad/fftw-quad.hash
> new file mode 120000
> index 0000000000..3ee7ecb3ba
> --- /dev/null
> +++ b/package/fftw/fftw-quad/fftw-quad.hash
> @@ -0,0 +1 @@
> +../fftw.hash
> \ No newline at end of file
> diff --git a/package/fftw/fftw-quad/fftw-quad.mk b/package/fftw/fftw-quad/fftw-quad.mk
> new file mode 100644
> index 0000000000..5ff79b1d46
> --- /dev/null
> +++ b/package/fftw/fftw-quad/fftw-quad.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# fftw-quad
> +#
> +################################################################################
> +
> +FFTW_QUAD_VERSION = $(FFTW_VERSION)
> +FFTW_QUAD_SOURCE = fftw-$(FFTW_VERSION).tar.gz
> +FFTW_QUAD_SITE = $(FFTW_SITE)
> +FFTW_QUAD_DL_SUBDIR = fftw
> +FFTW_QUAD_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
> +FFTW_QUAD_LICENSE = $(FFTW_LICENSE)
> +FFTW_QUAD_LICENSE_FILES = $(FFTW_LICENSE_FILES)
> +
> +FFTW_QUAD_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
> +
> +FFTW_QUAD_CONF_OPTS = \
> +	$(FFTW_COMMON_CONF_OPTS) \
> +	CFLAGS="$(FFTW_COMMON_CFLAGS)" \
> +	--enable-quad-precision
> +
> +$(eval $(autotools-package))
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index 26137b9f7c..ccec0e0f2d 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -14,6 +14,10 @@ ifeq ($(BR2_PACKAGE_FFTW_LONG_DOUBLE),y)
>  FFTW_DEPENDENCIES += fftw-long-double
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FFTW_QUAD),y)
> +FFTW_DEPENDENCIES += fftw-quad
> +endif
> +
>  ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
>  FFTW_DEPENDENCIES += fftw-single
>  endif
> @@ -49,7 +53,7 @@ FFTW_CONF_OPTS += \
>  	$(FFTW_COMMON_CONF_OPTS) \
>  	--disable-single \
>  	--disable-long-double \
> -	$(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision \
> +	--disable-quad-precision \
>  	CFLAGS="$(FFTW_COMMON_CFLAGS)"
>  
>  $(eval $(autotools-package))
> -- 
> 2.19.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
