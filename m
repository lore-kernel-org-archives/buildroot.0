From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 21:16:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/bayer2rgb-neon: new package
In-Reply-To: <20190314153435.6317-1-eloi.bail@savoirfairelinux.com>
References: <20190314153435.6317-1-eloi.bail@savoirfairelinux.com>
Message-ID: <20190329211651.0c736350@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eloi,

On Thu, 14 Mar 2019 16:34:34 +0100
Eloi Bail <eloi.bail@savoirfairelinux.com> wrote:

> bayer2rgb-neon[1] is a library which allows decoding raw camera bayer
> to RGB using NEON hardware acceleration.
> 
> [1]: https://git.phytec.de/bayer2rgb-neon/
> 
> Signed-off-by: Eloi Bail <eloi.bail@savoirfairelinux.com>

I have applied your patch, but after a fair number of changes, see
below for the details.

> ---
>  package/Config.in                        |  1 +
>  package/bayer2rgb-neon/Config.in         | 12 +++++++++
>  package/bayer2rgb-neon/bayer2rgb-neon.mk | 32 ++++++++++++++++++++++++
>  3 files changed, 45 insertions(+)

When adding a new package, an entry in the DEVELOPERS file must be
added. All new packages must also have a .hash file containing the hash
of the tarball and the license file.

> diff --git a/package/Config.in b/package/Config.in
> index 420e6e95a3..259bd50224 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -12,6 +12,7 @@ menu "Audio and video applications"

bayer2rgb-neon is not really an application, but more a library, so I
moved it to Library -> Graphics.

> diff --git a/package/bayer2rgb-neon/Config.in b/package/bayer2rgb-neon/Config.in
> new file mode 100644
> index 0000000000..702e2e316d
> --- /dev/null
> +++ b/package/bayer2rgb-neon/Config.in
> @@ -0,0 +1,12 @@
> +menuconfig BR2_PACKAGE_BAYER2RGB_NEON

A "menuconfig" is not appropriate for a single package, we use a simple
"config" option.

> +	bool "bayer2rgb-neon"
> +	depends on BR2_arm
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_ARM_ENABLE_NEON

Having Neon enabled is not needed: we only need the CPU to suport Neon,
so I changed this to BR2_ARM_CPU_HAS_NEON.

> +	depends on BR2_TOOLCHAIN_BUILDROOT_CXX

This is not the correct option to depend on C++: this option only
exists when using an internal toolchain, so this dependency prevents
selecting this package when an external toolchain is used. The correct
dependency is BR2_INSTALL_LIBSTDCPP.

Another dependency that was missing is on the gcc version: because it
uses C++11, we need gcc >= 4.9.

> +	help
> +	  bayer2rgb-neon is a library which allows
> +	  to decode raw camera bayer to RGB using
> +	  NEON hardware acceleration.
> +
> +	  https://git.phytec.de/bayer2rgb-neon/

When a package has dependencies, we add a Config.in comment to document
those dependencies and help the user, so I've done that.

> diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.mk b/package/bayer2rgb-neon/bayer2rgb-neon.mk
> new file mode 100644
> index 0000000000..964563d152
> --- /dev/null
> +++ b/package/bayer2rgb-neon/bayer2rgb-neon.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# bayer2rgb-neon
> +#
> +################################################################################
> +
> +BAYER2RGB_NEON_VERSION = v0.4
> +BAYER2RGB_NEON_SOURCE = bayer2rgb-neon-$(BAYER2RGB_NEON_VERSION).tar.bz2
> +BAYER2RGB_NEON_SITE = https://git.phytec.de/bayer2rgb-neon/snapshot
> +
> +BAYER2RGB_NEON_LICENSE = GPL-3.0
> +BAYER2RGB_NEON_LICENSE_FILES = COPYING
> +
> +BAYER2RGB_NEON_INSTALL_STAGING = YES
> +
> +BAYER2RGB_NEON_DEPENDENCIES += host-pkgconf host-gengetopt

+= was not needed, a simple = is sufficient here

> +
> +BAYER2RGB_NEON_CONF_OPTS = --prefix="/usr"

This is not needed, as the autotools-package infrastructure already
passes the --prefix option.

> +BAYER2RGB_NEON_AUTORECONF = YES
> +
> +BAYER2RGB_NEON_CFLAGS = $(TARGET_CFLAGS)
> +BAYER2RGB_NEON_CFLAGS += -mfpu=neon
> +
> +BAYER2RGB_NEON_CONF_ENV = CFLAGS=" $(BAYER2RGB_NEON_CFLAGS)"

This was unnecessarily complicated:

BAYER2RGB_NEON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -mfpu=neon"

is sufficient.

I've applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
