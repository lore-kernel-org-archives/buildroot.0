From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Dec 2018 17:32:15 +0100
Subject: [Buildroot] [PATCH 01/11] package/fftw : Allow all precisions
 to be installed at the same time.
In-Reply-To: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
References: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <08ec2154-5bfb-e77d-7611-1d7662cc6070@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gwenhael,

On 28/11/2018 17:12, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> fftw's library name depends on the precision option. Consequently,
> it's possible to install multiple flavor on the same target.
> 
> This patch split current fftw in 5 part:
> - 1 to provide common variables
> - 4 to provide specificities for each precision.

 This is a huge change, and IIUC all patches should in fact be squashed since
this change breaks all packages depending on fftw...

 Maybe a more gradual approach would be to break out the individual packages one
by one. E.g. start with adding the fftw-single package independently of the
rest, then convert other packages to depend on fftw-single instead of fftw, then
remove BR2_PACKAGE_FFTW_PRECISION_SINGLE.

 Finally, you forgot legacy handling. When you remove
BR2_PACKAGE_FFTW_PRECISION_SINGLE, there should be an entry added to
Config.in.legacy that select BR2_PACKAGE_FFTW_SINGLE. Or you have to call the
package fftw-precision-single, of course.

[snip]
> +++ b/package/fftw/fftw-double/fftw-double.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# fft-double

 fftw-double

 Don't forget to run check-package!

> +#
> +################################################################################
> +
> +FFTW_PRECISION_DOUBLE_VERSION = $(FFTW_VERSION)
> +FFTW_PRECISION_DOUBLE_SOURCE = fftw-$(FFTW_VERSION).tar.gz
> +FFTW_PRECISION_DOUBLE_SITE = $(FFTW_SITE)
> +FFTW_PRECISION_DOUBLE_INSTALL_STAGING = $(FFTW_INSTALL_STAGING)
> +FFTW_PRECISION_DOUBLE_LICENSE = $(FFTW_LICENSE)
> +FFTW_PRECISION_DOUBLE_LICENSE_FILES = $(FFTW_LICENSE_FILES)
> +
> +FFTW_PRECISION_DOUBLE_CONF_ENV = $(FFTW_CONF_ENV)
> +
> +FFTW_PRECISION_DOUBLE_CONF_OPTS= $(FFTW_CONF_OPTS)
> +
> +FFTW_PRECISION_DOUBLE_CFLAGS = $(FFTW_CFLAGS)
> +
> +# x86 optimisations
> +FFTW_PRECISION_DOUBLE_CONF_OPTS += $(if $(BR2_X86_CPU_HAS_SSE2),--enable,--disable)-sse2
> +
> +$(eval $(autotools-package))

 This doesn't work: the package is actually called 'fftw-double', so it will use
variables FFTW_DOUBLE_VERSION etc., not FFTW_PRECISION_DOUBLE_VERSION. I don't
know how you tested this, but it can't possibly work...

[snip]
