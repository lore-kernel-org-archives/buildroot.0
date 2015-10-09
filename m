From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 11:08:13 +0200
Subject: [Buildroot] [PATCH 1/1] liquid-dsp: new package
In-Reply-To: <1444336646-12586-2-git-send-email-guillaume.bressaix@gmail.com>
References: <1444336646-12586-1-git-send-email-guillaume.bressaix@gmail.com>
 <1444336646-12586-2-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20151009110813.2dd954e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillaume William Bres,

Thanks for your patch! I have a few comments below.

On Thu, 8 Oct 2015 14:37:26 -0600, Guillaume William Bres wrote:

> diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
> new file mode 100644
> index 0000000..6ab7011
> --- /dev/null
> +++ b/package/liquid-dsp/Config.in
> @@ -0,0 +1,21 @@
> +comment "liquid-dsp requires a (e)glibc toolchain"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

Can you comment on what makes liquid-dsp work with glibc only, and not
with uClibc or musl?

> +config BR2_PACKAGE_LIQUID_DSP
> +	bool "liquid-dsp"
> +	help
> +	  Liquid-DSP is a free and open-source signal processing library 
> +	  for software-defined radios written in C. 
> +	  Its purpose is to provide a set of extensible DSP modules 
> +	  that do no rely on external dependencies or cumbersome frameworks.
> +
> +	  http://liquidsdr.org/
> +
> +if BR2_PACKAGE_LIQUID_DSP
> +
> +config BR2_PACKAGE_LIQUID_DSP_FAST
> +	bool "optimize for speed over accuracy"
> +	help 
> +		Optimize for speed over accuracy.

Indentation should be just one tab + two spaces for the help text.  You
got it correct above, but not here.

> diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
> new file mode 100644
> index 0000000..6a3e8dc
> --- /dev/null
> +++ b/package/liquid-dsp/liquid-dsp.mk
> @@ -0,0 +1,50 @@
> +################################################################################
> +#
> +# liquid-dsp
> +#
> +################################################################################
> +
> +LIQUID_DSP_VERSION = master 

Incorrect. This is a branch name, so it is constantly changing, which
means that depending on when you build the package, you will not get
the same code since more commits might have been made to the master
branch. Please use either a tag, or a full commit ID.

> +LIQUID_DSP_SITE = https://github.com/jgaeddert/liquid-dsp.git

Use the github helper function (see the manual for details).

> +LIQUID_DSP_SITE_METHOD = git

Not needed if you use the Github helper.

> +LIQUID_DSP_LICENSE = GPL

Please specify the version (i.e GPLv2, GPLv2+, GPLv3, GPLv3+).

> +LIQUID_DSP_LICENSE_FILES = COPYING
> +LIQUID_DSP_INSTALL_STAGING = yes

This should be "YES" instead of "yes".

> +
> +LIQUID_DSP_DEPENDENCIES = host-autoconf host-automake
> +
> +define LIQUID_DSP_PRE_CONFIGURE_BOOTSTRAP
> +	rm -f $(LIQUID_DSP_DIR)/config.cache 
> +	rm -f $(LIQUID_DSP_DIR)/aclocal.m4
> +	cd $(LIQUID_DSP_DIR) && $(ACLOCAL) -I./scripts && $(AUTOCONF) && $(AUTOHEADER) 
> +endef

Why don't you use:

LIBQUID_DSP_AUTORECONF = YES

 ?

> +LIQUID_DSP_PRE_CONFIGURE_HOOKS += LIQUID_DSP_PRE_CONFIGURE_BOOTSTRAP
> +
> +# Speed over accuracy trade off
> +ifeq ($(BR2_PACKAGE_LIQUID_DSP_FAST),y)
> +LIQUID_DSP_CFLAGS += -O3 -ffast-math
> +endif

I think we should include -O3 here. The optimization level is decided
globally by the BR2_OPTIMIZE options.

> +# ARM Optimizations
> +ifeq ($(BR2_ARM_ENABLE_NEON),y)
> +LIQUID_DSP_CFLAGS += -mfpu=neon
> +LIQUID_DSP_CFLAGS += -mfloat-abi=hard
> +endif

Using BR2_ARM_ENABLE_NEON is wrong here. You should use
BR2_ARM_CPU_HAS_NEON instead. However:

 1/ Using NEON as the FPU is not recommended as the computations are
    not IEEE 754 compliant.

 2/ Forcing -mfloat-abi=hard is clearly wrong, since it would only work
    when the selected ABI is EABIhf.

> +# use FFTW instead of built-in FFT
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
> +LIQUID_DSP_CFLAGS += -lfftw3f
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
> +LIQUID_DSP_CFLAGS += -lfftw3
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
> +LIQUID_DSP_CFLAGS += -lfftw3l
> +endif

These are not CFLAGS, but LDFLAGS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
