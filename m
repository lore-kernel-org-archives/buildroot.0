From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 12:09:52 +0100
Subject: [Buildroot] [PATCH v3 02/17] package/fftw: break fftw-single
 into a dedicated package
In-Reply-To: <20181231133030.25991-3-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-3-thomas.petazzoni@bootlin.com>
Message-ID: <20190101110952.GG26917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gwenha?l, All,

On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> fftw's library name depends on the precision option. Consequently,
> it's possible to install multiple flavor on the same target.

There is a minor nit, though: the various flavours do install some of
the same files. For example, with just this patch applied, and enabling
fftw-single and fftw's remaining long-double option:

./support/scripts/check-uniq-files -t target /home/ymorin/dev/buildroot/O/build/packages-file-list.txt
Warning: target file "./usr/bin/fftw-wisdom-to-conf" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: target file "./usr/include/fftw3.f03" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: target file "./usr/include/fftw3.f" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: target file "./usr/include/fftw3.h" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: target file "./usr/include/fftw3l.f03" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: target file "./usr/share/man/man1/fftw-wisdom-to-conf.1" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: target file "./usr/include/fftw3q.f03" is touched by more than one package: [u'fftw-single', u'fftw']
./support/scripts/check-uniq-files -t staging /home/ymorin/dev/buildroot/O/build/packages-file-list-staging.txt
Warning: staging file "./usr/share/man/man1/fftw-wisdom-to-conf.1" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: staging file "./usr/bin/fftw-wisdom-to-conf" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: staging file "./usr/lib/libfftw3f.la" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: staging file "./usr/include/fftw3.f03" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: staging file "./usr/include/fftw3.f" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: staging file "./usr/include/fftw3.h" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: staging file "./usr/include/fftw3l.f03" is touched by more than one package: [u'fftw-single', u'fftw']
Warning: staging file "./usr/include/fftw3q.f03" is touched by more than one package: [u'fftw-single', u'fftw']

In practice, I'm not sure this causes any issue, in fact, because:

  - we don't care about the man pages;

  - ./usr/lib/libfftw3f.la should in fact not be installed by fftw's
    long-double;

  - ./usr/bin/fftw-wisdom-to-conf is bit-for-bit the same in the two
    cases;

  - the headers are each also the same in both cases.

So, when we switched the file list from a md5-based comparison, to a
time-based comparison, we lost the precision that md5 offered. :-/

So far, there's not much we can do for now, but in the future, we'll
have to revisit the way we establish the per-package file list and the
way we check uniq files.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> This patch breaks fftw single precision into a new package and:
> 
> - makes BR2_PACKAGE_FFTW_PRECISION_SINGLE select
>   BR2_PACKAGE_FFTW_SINGLE to keep compatibility with packages that use
>   BR2_PACKAGE_FFTW_PRECISION_SINGLE. This option will be removed in a
>   follow-up commit;
> 
> - removes the BR2_PACKAGE_FFTW_USE_SSE and BR2_PACKAGE_FFTW_USE_NEON
>   otpions since they are only used for single precision. The
>   corresponding CPU-capability options are directly handled in
>   the fftw-single package;
> 
> - makes fftw depend on fftw-single when this package is enabled.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> [Yann/Thomas:
>  - Force --disable-single in FFTW_CONF_OPTS, just for the sake of
>    clarity (fftw is no longer going to build the single variant)
>  - Use FFTW_SINGLE_DL_SUBDIR to avoid downloading fftw multiple times
>  - Minor reformatting tweaks in fftw-single.mk
>  - Do not deprecate BR2_PACKAGE_FFTW_PRECISION_SINGLE and instead make
>    it select BR2_PACKAGE_FFTW_SINGLE, so that packages using
>    BR2_PACKAGE_FFTW_PRECISION_SINGLE continue to work.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/fftw/Config.in                    | 12 ++------
>  package/fftw/fftw-single/Config.in        |  5 +++
>  package/fftw/fftw-single/fftw-single.hash |  1 +
>  package/fftw/fftw-single/fftw-single.mk   | 37 +++++++++++++++++++++++
>  package/fftw/fftw.mk                      | 14 +++++----
>  5 files changed, 54 insertions(+), 15 deletions(-)
>  create mode 100644 package/fftw/fftw-single/Config.in
>  create mode 120000 package/fftw/fftw-single/fftw-single.hash
>  create mode 100644 package/fftw/fftw-single/fftw-single.mk
> 
> diff --git a/package/fftw/Config.in b/package/fftw/Config.in
> index d51f8f3c51..f61784de50 100644
> --- a/package/fftw/Config.in
> +++ b/package/fftw/Config.in
> @@ -12,15 +12,9 @@ config BR2_PACKAGE_FFTW
>  
>  if BR2_PACKAGE_FFTW
>  
> -config BR2_PACKAGE_FFTW_USE_SSE
> -	bool
> -
>  config BR2_PACKAGE_FFTW_USE_SSE2
>  	bool
>  
> -config BR2_PACKAGE_FFTW_USE_NEON
> -	bool
> -
>  choice
>  	prompt "fftw precision"
>  	default BR2_PACKAGE_FFTW_PRECISION_DOUBLE
> @@ -29,9 +23,7 @@ choice
>  
>  config BR2_PACKAGE_FFTW_PRECISION_SINGLE
>  	bool "single"
> -	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
> -	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
> -	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_CPU_HAS_NEON && !BR2_ARM_SOFT_FLOAT
> +	select BR2_PACKAGE_FFTW_SINGLE
>  	help
>  	  Compile fftw in single precision, i.e. use 'float' for
>  	  floating point type.
> @@ -62,6 +54,8 @@ config BR2_PACKAGE_FFTW_PRECISION_QUAD
>  
>  endchoice
>  
> +source "package/fftw/fftw-single/Config.in"
> +
>  config BR2_PACKAGE_FFTW_FAST
>  	bool "optimise for speed over accuracy"
>  	help
> diff --git a/package/fftw/fftw-single/Config.in b/package/fftw/fftw-single/Config.in
> new file mode 100644
> index 0000000000..ff1486871d
> --- /dev/null
> +++ b/package/fftw/fftw-single/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_FFTW_SINGLE
> +	bool "fftw-single"
> +	help
> +	  Compile fftw in single precision, i.e. use 'float'
> +	  for floating point type.
> diff --git a/package/fftw/fftw-single/fftw-single.hash b/package/fftw/fftw-single/fftw-single.hash
> new file mode 120000
> index 0000000000..3ee7ecb3ba
> --- /dev/null
> +++ b/package/fftw/fftw-single/fftw-single.hash
> @@ -0,0 +1 @@
> +../fftw.hash
> \ No newline at end of file
> diff --git a/package/fftw/fftw-single/fftw-single.mk b/package/fftw/fftw-single/fftw-single.mk
> new file mode 100644
> index 0000000000..1e26ff7a38
> --- /dev/null
> +++ b/package/fftw/fftw-single/fftw-single.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# fftw-single
> +#
> +################################################################################
> +
> +FFTW_SINGLE_VERSION = $(FFTW_VERSION)
> +FFTW_SINGLE_SOURCE = fftw-$(FFTW_VERSION).tar.gz
> +FFTW_SINGLE_SITE = $(FFTW_SITE)
> +FFTW_SINGLE_DL_SUBDIR = fftw
> +FFTW_SINGLE_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
> +FFTW_SINGLE_LICENSE = $(FFTW_LICENSE)
> +FFTW_SINGLE_LICENSE_FILES = $(FFTW_LICENSE_FILES)
> +
> +FFTW_SINGLE_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
> +
> +FFTW_SINGLE_CONF_OPTS = \
> +	$(FFTW_COMMON_CONF_OPTS) \
> +	CFLAGS="$(FFTW_SINGLE_CFLAGS)" \
> +	--enable-single
> +
> +FFTW_SINGLE_CFLAGS = $(FFTW_COMMON_CFLAGS)
> +
> +# x86 optimisations
> +FFTW_SINGLE_CONF_OPTS += \
> +	$(if $(BR2_X86_CPU_HAS_SSE),--enable,--disable)-sse \
> +	$(if $(BR2_X86_CPU_HAS_SSE2),--enable,--disable)-sse2
> +
> +# ARM optimisations
> +ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
> +FFTW_SINGLE_CONF_OPTS += --enable-neon
> +FFTW_SINGLE_CFLAGS += -mfpu=neon
> +else
> +FFTW_SINGLE_CONF_OPTS += --disable-neon
> +endif
> +
> +$(eval $(autotools-package))
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index 8b76b7c190..b738928032 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -10,6 +10,10 @@ FFTW_INSTALL_STAGING = YES
>  FFTW_LICENSE = GPL-2.0+
>  FFTW_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
> +FFTW_DEPENDENCIES += fftw-single
> +endif
> +
>  # fortran support only enables generation and installation of fortran sources
>  ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
>  FFTW_COMMON_CONF_OPTS += --enable-fortran
> @@ -19,18 +23,14 @@ FFTW_COMMON_CONF_OPTS += --disable-fortran
>  endif
>  
>  FFTW_COMMON_CFLAGS = $(TARGET_CFLAGS)
> +
>  ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
>  FFTW_COMMON_CFLAGS += -O3 -ffast-math
>  endif
>  
>  # x86 optimisations
> -FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE),--enable,--disable)-sse
>  FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
>  
> -# ARM optimisations
> -FFTW_COMMON_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
> -FFTW_COMMON_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
> -
>  # Generic optimisations
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  FFTW_COMMON_CONF_OPTS += --enable-threads
> @@ -43,9 +43,11 @@ FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openm
>  FFTW_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
>  FFTW_CONF_OPTS += \
>  	$(FFTW_COMMON_CONF_OPTS) \
> -	$(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single \
> +	--disable-single \
>  	$(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double \
>  	$(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision \
>  	CFLAGS="$(FFTW_COMMON_CFLAGS)"
>  
>  $(eval $(autotools-package))
> +
> +include $(sort $(wildcard package/fftw/*/*.mk))
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
