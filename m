From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 23:10:45 +0200
Subject: [Buildroot] [RFC PATCH v5 2/6] at-spi2-atk: new package
In-Reply-To: <20180622003340.10859-3-joseph.kogut@gmail.com>
References: <20180622003340.10859-1-joseph.kogut@gmail.com>
 <20180622003340.10859-3-joseph.kogut@gmail.com>
Message-ID: <20180625231045.27dbf4be@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jun 2018 17:33:36 -0700, Joseph Kogut wrote:

> diff --git a/package/at-spi2-atk/Config.in b/package/at-spi2-atk/Config.in
> new file mode 100644
> index 0000000000..599913c7df
> --- /dev/null
> +++ b/package/at-spi2-atk/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_AT_SPI2_ATK
> +	bool "at-spi2-atk"
> +	depends on BR2_PACKAGE_XORG7 # at-spi2-core
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_USE_WCHAR # glib2
> +	select BR2_PACKAGE_ATK
> +	select BR2_PACKAGE_AT_SPI2_CORE
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  The At-Spi2 Atk package contains a library that bridges
> +	  ATK to At-Spi2 D-Bus service.
> +
> +	  https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/
> +
> +comment "at-spi2-atk needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "at-spi2-atk depends on X.org"

Just like at-spi2-core, I've added:

	depends on BR2_USE_MMU

for the same reason.

> +	depends on !BR2_PACKAGE_XORG7

> +AT_SPI2_ATK_VERSION_MAJOR = 2.26
> +AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).2
> +AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
> +AT_SPI2_ATK_SITE =  http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
> +AT_SPI2_ATK_LICENSE = LGPL-2.0+
> +AT_SPI2_ATK_LICENSE_FILES = COPYING
> +AT_SPI2_ATK_INSTALL_STAGING = YES
> +AT_SPI2_ATK_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install

This line was not needed, it's the default behavior of the
autotools-package infrastructure for staging installation.

> +AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
> +
> +$(eval $(autotools-package))

Any reason to use autotools here instead of meson ?

Anyway, I've applied to master with the fixes detailed above.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
