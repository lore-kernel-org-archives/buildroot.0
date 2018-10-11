From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 21:19:29 +0200
Subject: [Buildroot] [PATCH 1/2] package/libtorrent-rasterbar: new
 package
In-Reply-To: <20180911085024.14648-1-richterphilipp.pops@gmail.com>
References: <20180911085024.14648-1-richterphilipp.pops@gmail.com>
Message-ID: <20181011211929.22af5bfc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Philipp,

Thanks for your submission, and sorry for the slow response. I have to
say that for a first contribution, it looks very good. Still, I have a
number of comments, see below.

On Tue, 11 Sep 2018 10:50:23 +0200, Philipp Richter wrote:

> diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
> new file mode 100644
> index 0000000000..0ce9496b70
> --- /dev/null
> +++ b/package/libtorrent-rasterbar/Config.in
> @@ -0,0 +1,133 @@
> +comment "libtorrent-rasterbar needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR
> +	bool "libtorrent-rasterbar"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_HOST_PKGCONF

You don't need to select this option. Currently, we don't care about
selecting Config.in options for host packages, so for consistency, we
also shouldn't do it here.

In the future, we might add Config.in options for all host packages,
and if/when we do this, we'll add the necessary selects. But for the
time being, I'd rather not have any of them.

> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_CHRONO
> +	select BR2_PACKAGE_BOOST_SYSTEM
> +	select BR2_PACKAGE_BOOST_RANDOM

Since you select boost, you must inherit all its dependencies, i.e:

        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_USE_WCHAR

> +if BR2_PACKAGE_LIBTORRENT_RASTERBAR
> +
> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_LOGGING
> +	bool "Logging alerts"
> +	default y
> +	help
> +	  Enable support for logging alerts,
> +	  like log_alert, torrent_log_alert and peer_log_alert.
> +
> +	  Default: yes

Drop those "Default: XYZ" from the help text, we don't have them
anywhere, and it's already pretty explicit from the Config.in text.

> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEBUG
> +	bool "Debug"
> +	help
> +	  Enable debug build.
> +
> +	  Default: no

What does --enable-debug/--disable-debug does? We have a global
BR2_ENABLE_DEBUG boolean that enables building with debugging symbols.

> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_DHT
> +	bool "DHT"
> +	default y
> +	help
> +	  Enable support for trackerless torrents.
> +
> +	  Default: yes
> +
> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_ENCRYPTION
> +	bool "Encryption"
> +	default y
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  Enable encryption support.
> +	  Encryption support is the encrypted peer connection
> +	  supported by clients such as uTorrent, Azureus and KTorrent.
> +
> +	  Default: yes
> +
> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_EXPORT_ALL_SYMBOLS
> +	bool "Export all symbols"
> +	help
> +	  Export all symbols from libtorrent, including non-public ones.
> +
> +	  Default: no

Do we really need an option for this ?

> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_POOL_ALLOCATORS
> +	bool "Pool allocators"
> +	default y
> +	help
> +	  Enable pool allocators for send buffers using boost::pool<>.
> +
> +	  Default: yes

And this ?

> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS
> +	bool "Invariant checks"
> +	default y
> +	depends on BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEBUG
> +	help
> +	  Enable invariant checks.
> +
> +	  Default: yes

This clearly seems like a developer-oriented option, I don't think we
should support it in Buildroot.

> +
> +comment "Invariant checks need debug build"
> +	depends on !BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEBUG
> +
> +if BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS
> +
> +choice
> +	prompt "Invariant checks type"
> +	default BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS_YES
> +	help
> +	  Select the type of invariant checks to use.
> +
> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS_YES
> +	bool "yes"
> +	help
> +	  Standard invariant checks.
> +
> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS_FULL
> +	bool "full"
> +	help
> +	  Turn on extra expensive invariant checks.
> +
> +endchoice

... and therefore we can remove all of this.

> +
> +endif
> +
> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEPRECATED_FUNCTIONS
> +	bool "Deprecated functions"
> +	default y
> +	help
> +	  Enable deprecated functions in the API.
> +
> +	  Default: yes

Ditto, why would we want this option ?

In general, it feels like you have taken every --enable/--disable of
the configure script, and added a Buildroot Config.in option for each
of them. I don't think we necessarily want to support each and every
configuration option of the upstream package.

> +
> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_DISK_STATS
> +	bool "Disk stats"
> +	help
> +	  Enable disk activity logging feature.
> +
> +	  Default: no
> +
> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_EXAMPLES
> +	bool "Examples"
> +	help
> +	  Build example files.
> +
> +	  Default: no
> +
> +config BR2_PACKAGE_LIBTORRENT_RASTERBAR_TESTS
> +	bool "Tests"
> +	help
> +	  Build test files.
> +
> +	  Default: no

We generally don't build tests in the context of Buildroot, so just
disable them unconditionally.

> diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> new file mode 100644
> index 0000000000..19f0a9304d
> --- /dev/null
> +++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> @@ -0,0 +1,95 @@
> +################################################################################
> +#
> +# libtorrent-rasterbar
> +#
> +################################################################################
> +
> +LIBTORRENT_RASTERBAR_VERSION = 1.1.9
> +LIBTORRENT_RASTERBAR_SITE = https://github.com/arvidn/libtorrent/releases/download/libtorrent-$(subst .,_,$(LIBTORRENT_RASTERBAR_VERSION))
> +LIBTORRENT_RASTERBAR_LICENSE = BSD-2-Clause
> +LIBTORRENT_RASTERBAR_LICENSE_FILES = COPYING
> +LIBTORRENT_RASTERBAR_DEPENDENCIES = host-pkgconf boost $(if $(BR2_PACKAGE_LIBICONV),libiconv)

I would move the $(if $(BR2_PACKAGE_LIBICONV),libiconv) part inside the
iconv condition.

> +LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
> +LIBTORRENT_RASTERBAR_CONF_OPTS += --with-boost-libdir="$(STAGING_DIR)/usr/lib"

You can drop the double quotes here.

> +LIBTORRENT_RASTERBAR_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"

So, you need C++11, so your package should have a dependency on gcc >=
4.8.

> +ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
> +LIBTORRENT_RASTERBAR_CONF_OPTS += --with-libiconv

This is where I'd prefer to see:

LIBTORRENT_RASTERBAR_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)

Could you rework the package according to those comments?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
