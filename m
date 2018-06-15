From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 21:45:38 +0200
Subject: [Buildroot] [RFC PATCH v4 2/9] at-spi2-core: new package
In-Reply-To: <20180614224820.27126-3-joseph.kogut@gmail.com>
References: <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180614224820.27126-1-joseph.kogut@gmail.com>
 <20180614224820.27126-3-joseph.kogut@gmail.com>
Message-ID: <20180615214538.54851060@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jun 2018 15:48:13 -0700, Joseph Kogut wrote:


> diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
> new file mode 100644
> index 0000000000..9c60c51792
> --- /dev/null
> +++ b/package/at-spi2-core/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_AT_SPI2_CORE
> +	bool "at-spi2-core"
> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_XLIB_LIBXTST

Your package also uses libglib2 in its DEPENDENCIES, so you should have
a "select BR2_PACKAGE_LIBGLIB2" here.

In addition, you should replicate the dependencies of the options
you're selecting. So, something like:

	depends on BR2_PACKAGE_XORG7 # xlib-libxtst
	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
	depends on BR2_USE_MMU # dbus, libglib2
	depends on BR2_USE_WCHAR # libglib2
	select BR2_PACKAGE_DBUS
	select BR2_PACKAGE_LIBGLIB2
	select BR2_PACKAGE_XLIB_LIBXTST

> +	help
> +	  The At-Spi2 Core package is a part of the GNOME Accessibility Project.
> +	  It provides a Service Provider Interface for the Assistive Technologies
> +	  available on the GNOME platform and a library against which 
> +	  applications can be linked.

Wrap to 72 characters please, and add the upstream URL of the project.
Essentially, please run your new packages through ./utils/check-package
to spot such coding style issues.

You'll also need to add Config.in comments to help the user with the
dependencies. See all other packages in Buildroot.

> diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
> new file mode 100644
> index 0000000000..e792cc0e0a
> --- /dev/null
> +++ b/package/at-spi2-core/at-spi2-core.hash
> @@ -0,0 +1,4 @@
> +# locally calculated
> +sha256 42a2487ab11ce43c288e73b2668ef8b1ab40a0e2b4f94e80fca04ad27b6f1c87  at-spi2-core-2.28.0.tar.xz
> +sha256 c6105b34ab6829ff5c70eba234f40053215fa9f8383ced271b0e370a1923624b  COPYING
> +

Unneeded empty line.

> diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
> new file mode 100644
> index 0000000000..88800e2ce7
> --- /dev/null
> +++ b/package/at-spi2-core/at-spi2-core.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# at-spi2-core
> +#
> +################################################################################
> +
> +AT_SPI2_CORE_VERSION_MAJOR = 2.28
> +AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
> +AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
> +AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
> +AT_SPI2_CORE_LICENSE = LGPL-2.0+
> +AT_SPI2_CORE_LICENSE_FILES = COPYING
> +AT_SPI2_CORE_INSTALL_STAGING = YES
> +AT_SPI2_CORE_DEPENDENCIES = host-meson host-pkgconf dbus libglib2 xlib_libXtst
> +
> +AT_SPI2_CORE_MESON_OPTS += \
> +	--prefix=/usr \
> +	--libdir=/usr/lib \
> +	--sysconfdir=/etc \
> +	--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
> +	--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf
> +
> +AT_SPI2_CORE_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
> +
> +define AT_SPI2_CORE_CONFIGURE_CMDS
> +	rm -rf $(@D)/build
> +	mkdir -p $(@D)/build
> +	$(TARGET_MAKE_ENV) meson $(AT_SPI2_CORE_MESON_OPTS) $(@D) $(@D)/build
> +endef
> +
> +define AT_SPI2_CORE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) ninja $(AT_SPI2_CORE_NINJA_OPTS) -C $(@D)/build
> +endef
> +
> +define AT_SPI2_CORE_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) \
> +		ninja $(AT_SPI2_CORE_NINJA_OPTS) -C $(@D)/build install
> +endef
> +
> +define AT_SPI2_CORE_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
> +		ninja $(AT_SPI2_CORE_NINJA_OPTS) -C $(@D)/build install
> +endef
> +
> +$(eval $(generic-package))

Please use meson-package instead, this will greatly simplify this
package. See
http://nightly.buildroot.org/#_infrastructure_for_meson_based_packages
for details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
