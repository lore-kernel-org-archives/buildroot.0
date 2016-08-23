From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 23:32:23 +0200
Subject: [Buildroot] [PATCH 2/3] package/fftw : Allow all precisions to
 be installed at the same time.
In-Reply-To: <1471913603-21487-3-git-send-email-flatmax@flatmax.org>
References: <1471913603-21487-1-git-send-email-flatmax@flatmax.org>
 <1471913603-21487-3-git-send-email-flatmax@flatmax.org>
Message-ID: <20160823233223.56c40e0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Why is this patch part of the patch series about adding support for
Cortex-A53 and other ARM related details? They should be independent.

Several other comments below. It's a pretty complicated change you are
doing here, it will most likely take several iterations to get
everything right and in good shape. Let me know if you need
help/assistance.

On Tue, 23 Aug 2016 10:53:22 +1000, Matt Flax wrote:
> This updates the current fftw package to allow the installation and selection
> of one more of the fftw precisions onto the system. Previously, you could
> only choose one prevision at a time, however there are many use cases where
> different precisions are required on the same system. Further, various packages
> selected BR2_PACKAGE_FFTW assuming the double precision version would be
> compile, which was a buggy assumption.
> 
> Following previous suggestions and discussions, a common fftw mk file is used.
> The hash file is symbolically linked against. To preserve the previous behavior,
> if BR2_PACKAGE_FFTW is selected, this defaults to the double precision version.
> Other available precisions are now BR2_PACKAGE_FFTWF, BR2_PACKAGE_FFTWL,
> BR2_PACKAGE_FFTWQ which is the fftw standard for singe, long double and quad
> precisions.

I believe you should keep a top-level BR2_PACKAGE_FFTW option, and then
as sub-options have the four packages named:

	fftw-double
	fftw-single
	fftw-quad
	fftw-long-double

with the corresponding sub-options.

If you want to preserve backward compatibility, you can add:

config BR2_PACKAGE_FFTW
	bool "fftw"
	select BR2_PACKAGE_FFTW_DOUBLE if \
		!BR2_PACKAGE_FFTW_SINGLE && \
		!BR2_PACKAGE_FFTW_QUAD && \
		!BR2_PACKAGE_FFTW_LONG_DOUBLE


> The following packages have been updated : liquid-dsp, gnuradio
> These packages required single precision installations.
> Other packages : libvips, pulseaudio, httping, imagemagick, alsa-utils
> implicitly required double precision without enforcing it, merely assuming
> this would happen by default. This was not the case when the user selected a
> different precision.

If they require double precision, then they should be updated to:

	select BR2_PACKAGE_FFTW
	select BR2_PACKAGE_FFTW_DOUBLE

and their <pkg>_DEPENDENCIES variable should be changed to depend on
fftw-double.

>  package/fftw/Config.in           | 69 +++++++---------------------------------
>  package/fftw/fftw-common.mk      | 44 +++++++++++++++++++++++++
>  package/fftw/fftw.mk             | 45 ++------------------------

In fact, put the contents of fftw-common.mk directly in fftw.mk.

>  package/fftw/fftw/Config.in      |  7 ++++
>  package/fftw/fftw/fftw.hash      |  1 +
>  package/fftw/fftw/fftw.mk        | 21 ++++++++++++

Having the naming proposed above will clarify things since we will no
longer have two fftw.mk files.

>  config BR2_PACKAGE_FFTW_USE_SSE
> -	bool
> +	bool "use SSE"
> +	depends on BR2_X86_CPU_HAS_SSE
>  
>  config BR2_PACKAGE_FFTW_USE_SSE2
> -	bool
> +	bool "use SSE2"
> +	depends on BR2_X86_CPU_HAS_SSE
>  
>  config BR2_PACKAGE_FFTW_USE_NEON
> -	bool

Please don't make this prompt options. Instead, add a first patch that
simply removes them, they are unnecessary. Just do:

ifeq ($(BR2_X86_CPU_HAS_SSE),y)
FFTW_CONF_OPTS += --enable-sse
else
FFTW_CONF_OPTS += --disable-sse
endif

ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
FFTW_CONF_OPTS += --enable-sse2
else
FFTW_CONF_OPTS += --disable-sse2
endif

ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
FFTW_CONF_OPTS += --enable-neon
FFTW_CFLAGS += -mfpu=neon
else
FFTW_CONF_OPTS += --disable-neon
endif

But please do this in a *separate* patch, prior to the fftw package
split.

> -config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
> -	bool "long double"
> -	# long-double precision require long-double trigonometric routines
> -	depends on !(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && \
> -		(BR2_arm || BR2_mips || BR2_mipsel))

Not your fault, but this BR2_TOOLCHAIN_BUILDROOT_UCLIBC dependency is
wrong: it should use BR2_TOOLCHAIN_USES_UCLIBC. I'll send a patch
fixing that, as it's also a bug on master.

> +FFTW_COMMON_CFLAGS = $(TARGET_CFLAGS)
> +ifeq ($(BR2_PACKAGE_FFTW_COMMON_FAST),y)

This option doesn't exist anywhere, it's still named
BR2_PACKAGE_FFTW_FAST in your code:

Config.in:config BR2_PACKAGE_FFTW_FAST
fftw-common.mk:ifeq ($(BR2_PACKAGE_FFTW_COMMON_FAST),y)

I think the name BR2_PACKAGE_FFTW_FAST is good.

> +# Generic optimisations
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +FFTW_COMMON_CONF_OPTS += --enable-threads
> +FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--without,--with)-combined-threads
> +else
> +FFTW_COMMON_CONF_OPTS += --disable-threads
> +endif
> +FFTW_COMMON_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable,--disable)-openmp
> +
> +FFTW_COMMON_CONF_OPTS += CFLAGS="$(FFTW_COMMON_CFLAGS)"

This last line is also wrong (but not your fault). Could you introduce
another preliminary patch that changes it to:

FFTW_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(FFTW_CFLAGS)"

that's the proper way of passing additional CFLAGS.

> diff --git a/package/fftw/fftw/Config.in b/package/fftw/fftw/Config.in
> new file mode 100644
> index 0000000..a91d519
> --- /dev/null
> +++ b/package/fftw/fftw/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_FFTW
> +	bool "fftw"
> +	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
> +	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_CPU_HAS_NEON && !BR2_ARM_SOFT_FLOAT && (BR2_cortex_a53 || BR2_aarch64)

Please get rid of those selects, and don't handle the
Cortex-A53/AArch64 question in the same patch. This patch should *only*
do the package split. All other changes should be in separate patches
(but submitted all in the same series).

> +FFTW_VERSION = $(FFTW_COMMON_VERSION)
> +FFTW_SOURCE = fftw-$(FFTW_VERSION).tar.gz
> +FFTW_SITE = $(FFTW_COMMON_SITE)
> +FFTW_INSTALL_STAGING = $(FFTW_COMMON_INSTALL_STAGING)
> +FFTW_LICENSE = $(FFTW_COMMON_LICENSE)
> +FFTW_LICENSE_FILES = $(FFTW_COMMON_LICENSE_FILES)
> +
> +FFTW_CONF_ENV = $(FFTW_COMMON_CONF_ENV)
> +
> +FFTW_CONF_OPTS=$(subst enable-neon, disable-neon, $(FFTW_COMMON_CONF_OPTS))

Why are you doing this?

> +
> +FFTW_CFLAGS = $(FFTW_COMMON_CFLAGS)

This line has no effect.

> diff --git a/package/fftw/fftwf/Config.in b/package/fftw/fftwf/Config.in
> new file mode 100644
> index 0000000..1995fd1
> --- /dev/null
> +++ b/package/fftw/fftwf/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_FFTWF
> +	bool "fftwf"
> +	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
> +	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
> +	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_CPU_HAS_NEON && !BR2_ARM_SOFT_FLOAT

Drop all those selects, see what I suggested above to handle
SSE/SSE2/NEON.

> +FFTWQ_CONF_OPTS=$(subst enable-neon, disable-neon, $(FFTW_COMMON_CONF_OPTS))

Why?

> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index 50f5e7f..b07831d 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -68,9 +68,9 @@ config BR2_PACKAGE_GNURADIO_UTILS
>  	  Misc python utilities
>  
>  comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager, -qtgui depends fftw's single precision"
> -	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +	depends on !BR2_PACKAGE_FFTWF

We should now replace this dependency with a select. We had to use a
"depends on" because you can't select "choice" entries. Now that we
have separate packages for the various precisions, we should use this
capability and simplify things by using a select. So basically, remove
the if BR2_PACKAGE_FFTW_PRECISION_SINGLE condition, and make the
BR2_PACKAGE_GNURADIO_FFT option:

	select BR2_PACKAGE_FFTW
	select BR2_PACKAGE_FFTW_SINGLE

>  # use FFTW instead of built-in FFT
> -ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
> +ifeq ($(BR2_PACKAGE_FFTWF),y)
>  LIQUID_DSP_LDFLAGS += -lfftw3f
>  endif
>  
> @@ -39,14 +39,18 @@ ifeq ($(BR2_powerpc)$(BR2_powerpc64),y)
>  LIQUID_DSP_CONF_OPTS += --enable-simdoverride
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
> +ifeq ($(BR2_PACKAGE_FFTW),y)
>  LIQUID_DSP_LDFLAGS += -lfftw3
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
> +ifeq ($(BR2_PACKAGE_FFTWL),y)
>  LIQUID_DSP_LDFLAGS += -lfftw3l
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FFTWQ),y)
> +LIQUID_DSP_LDFLAGS += -lfftw3q
> +endif

What happens if several fftw implementation are selected? We will pass
-lfftw3 -lfftw3f -lfftw3l -lfftw3q as LDFLAGS. Is this correct? Is this
useful? Should those case be mutually exclusive instead?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
