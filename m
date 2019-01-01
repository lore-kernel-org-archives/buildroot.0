From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 11:14:32 +0100
Subject: [Buildroot] [PATCH v3 01/17] package/fftw: prepare for
 splitting into multiple packages
In-Reply-To: <20181231133030.25991-2-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-2-thomas.petazzoni@bootlin.com>
Message-ID: <20190101101432.GF26917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gwenha?l, All,

On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> In preparation for splitting into multiple packages, this commit
> changes the fftw.mk package to use FFTW_COMMON_CONF_OPTS,
> FFTW_COMMON_CONF_ENV and FFTW_COMMON_CFLAGS, which will be re-used by
> the soon-to-be-introduced per-precision packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/fftw/fftw.mk | 40 +++++++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 19 deletions(-)
> 
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index b167a2f6f7..8b76b7c190 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -12,38 +12,40 @@ FFTW_LICENSE_FILES = COPYING
>  
>  # fortran support only enables generation and installation of fortran sources
>  ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
> -FFTW_CONF_OPTS += --enable-fortran
> -FFTW_CONF_ENV += FLIBS="-lgfortran -lm"
> +FFTW_COMMON_CONF_OPTS += --enable-fortran
> +FFTW_COMMON_CONF_ENV += FLIBS="-lgfortran -lm"
>  else
> -FFTW_CONF_OPTS += --disable-fortran
> +FFTW_COMMON_CONF_OPTS += --disable-fortran
>  endif
>  
> -FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
> -FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
> -FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision
> -
> -FFTW_CFLAGS = $(TARGET_CFLAGS)
> +FFTW_COMMON_CFLAGS = $(TARGET_CFLAGS)
>  ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
> -FFTW_CFLAGS += -O3 -ffast-math
> +FFTW_COMMON_CFLAGS += -O3 -ffast-math
>  endif
>  
>  # x86 optimisations
> -FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
> -FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
> +FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
> +FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
>  
>  # ARM optimisations
> -FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
> -FFTW_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
> +FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
> +FFTW_COMMON_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
>  
>  # Generic optimisations
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -FFTW_CONF_OPTS += --enable-threads
> -FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without,--with)-combined-threads
> +FFTW_COMMON_CONF_OPTS += --enable-threads
> +FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without,--with)-combined-threads
>  else
> -FFTW_CONF_OPTS += --disable-threads
> +FFTW_COMMON_CONF_OPTS += --disable-threads
>  endif
> -FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
> -
> -FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
> +FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
> +
> +FFTW_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
> +FFTW_CONF_OPTS += \
> +	$(FFTW_COMMON_CONF_OPTS) \
> +	$(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single \
> +	$(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double \
> +	$(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision \
> +	CFLAGS="$(FFTW_COMMON_CFLAGS)"
>  
>  $(eval $(autotools-package))
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
