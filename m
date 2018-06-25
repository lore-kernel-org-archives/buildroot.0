From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 23:09:44 +0200
Subject: [Buildroot] [RFC PATCH v5 1/6] at-spi2-core: new package
In-Reply-To: <20180622003340.10859-2-joseph.kogut@gmail.com>
References: <20180622003340.10859-1-joseph.kogut@gmail.com>
 <20180622003340.10859-2-joseph.kogut@gmail.com>
Message-ID: <20180625230944.5a3ca2c3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jun 2018 17:33:35 -0700, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

I've applied your patch, after doing a few additional fixes. See below.

> diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
> new file mode 100644
> index 0000000000..43110e0bf4
> --- /dev/null
> +++ b/package/at-spi2-core/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_AT_SPI2_CORE
> +	bool "at-spi2-core"
> +	depends on BR2_PACKAGE_XORG7 # xlib-libxtst
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_USE_WCHAR # glib2
> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_XLIB_LIBXTST
> +	help
> +	  The At-Spi2 Core package is a part of the GNOME
> +	  Accessibility Project. It provides a Service Provider
> +	  Interface for the Assistive Technologies available on the
> +	  GNOME platform and a library against which applications
> +	  can be linked.
> +
> +	  https://wiki.gnome.org/Accessibility
> +
> +comment "at-spi2-core needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "at-spi2-core depends on X.org"

I've added:

	depends on BR2_USE_MMU

here, so that the comment doesn't show up on noMMU architectures where
at-spi2-core will anyway not be available regardless of X.org
availability.

> +	depends on !BR2_PACKAGE_XORG7

> +AT_SPI2_CORE_VERSION_MAJOR = 2.28
> +AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
> +AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
> +AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
> +AT_SPI2_CORE_LICENSE = LGPL-2.0+
> +AT_SPI2_CORE_LICENSE_FILES = COPYING
> +AT_SPI2_CORE_INSTALL_STAGING = YES
> +AT_SPI2_CORE_DEPENDENCIES = host-meson host-pkgconf dbus libglib2 xlib_libXtst

Having host-meson in the DEPENDENCIES variable is useless, because the
meson-package infrastructure takes care of that.

Also, I had to specify -Ddbus_daemon=/usr/bin/dbus-daemon, otherwise it
tries to search for the dbus-daemon program on the host machine, and
errors out if it cannot find it.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
