From: Philipp Richter <richterphilipp.pops@gmail.com>
Date: Tue, 11 Sep 2018 10:50:23 +0200
Subject: [Buildroot] [PATCH 1/2] package/libtorrent-rasterbar: new package
Message-ID: <20180911085024.14648-1-richterphilipp.pops@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libtorrent is a feature complete C++ bittorrent implementation
focusing on efficiency and scalability.

https://www.libtorrent.org/

Signed-off-by: Philipp Richter <richterphilipp.pops@gmail.com>
---
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/libtorrent-rasterbar/Config.in        | 133 ++++++++++++++++++
 .../libtorrent-rasterbar.hash                 |   3 +
 .../libtorrent-rasterbar.mk                   |  95 +++++++++++++
 5 files changed, 235 insertions(+)
 create mode 100644 package/libtorrent-rasterbar/Config.in
 create mode 100644 package/libtorrent-rasterbar/libtorrent-rasterbar.hash
 create mode 100644 package/libtorrent-rasterbar/libtorrent-rasterbar.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b05564dd44..5cf182e5fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1668,6 +1668,9 @@ F:	package/psplash/
 F:	package/sispmctl/
 F:	package/zsh/
 
+N:	Philipp Richter <richterphilipp.pops@gmail.com>
+F:	package/libtorrent-rasterbar/
+
 N:	Philippe Proulx <eeppeliteloop@gmail.com>
 F:	package/lttng-babeltrace/
 F:	package/lttng-libust/
diff --git a/package/Config.in b/package/Config.in
index fb4d328846..d1b4147833 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1497,6 +1497,7 @@ menu "Networking"
 	source "package/libstrophe/Config.in"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
+	source "package/libtorrent-rasterbar/Config.in"
 	source "package/libupnp/Config.in"
 	source "package/libupnp18/Config.in"
 	source "package/libupnpp/Config.in"
diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
new file mode 100644
index 0000000000..0ce9496b70
--- /dev/null
+++ b/package/libtorrent-rasterbar/Config.in
@@ -0,0 +1,133 @@
+comment "libtorrent-rasterbar needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR
+	bool "libtorrent-rasterbar"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_HOST_PKGCONF
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_RANDOM
+	help
+	  libtorrent is a feature complete C++ bittorrent implementation
+	  focusing on efficiency and scalability.
+
+	  https://www.libtorrent.org/
+
+if BR2_PACKAGE_LIBTORRENT_RASTERBAR
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_LOGGING
+	bool "Logging alerts"
+	default y
+	help
+	  Enable support for logging alerts,
+	  like log_alert, torrent_log_alert and peer_log_alert.
+
+	  Default: yes
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEBUG
+	bool "Debug"
+	help
+	  Enable debug build.
+
+	  Default: no
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_DHT
+	bool "DHT"
+	default y
+	help
+	  Enable support for trackerless torrents.
+
+	  Default: yes
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_ENCRYPTION
+	bool "Encryption"
+	default y
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable encryption support.
+	  Encryption support is the encrypted peer connection
+	  supported by clients such as uTorrent, Azureus and KTorrent.
+
+	  Default: yes
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_EXPORT_ALL_SYMBOLS
+	bool "Export all symbols"
+	help
+	  Export all symbols from libtorrent, including non-public ones.
+
+	  Default: no
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_POOL_ALLOCATORS
+	bool "Pool allocators"
+	default y
+	help
+	  Enable pool allocators for send buffers using boost::pool<>.
+
+	  Default: yes
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS
+	bool "Invariant checks"
+	default y
+	depends on BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEBUG
+	help
+	  Enable invariant checks.
+
+	  Default: yes
+
+comment "Invariant checks need debug build"
+	depends on !BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEBUG
+
+if BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS
+
+choice
+	prompt "Invariant checks type"
+	default BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS_YES
+	help
+	  Select the type of invariant checks to use.
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS_YES
+	bool "yes"
+	help
+	  Standard invariant checks.
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS_FULL
+	bool "full"
+	help
+	  Turn on extra expensive invariant checks.
+
+endchoice
+
+endif
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEPRECATED_FUNCTIONS
+	bool "Deprecated functions"
+	default y
+	help
+	  Enable deprecated functions in the API.
+
+	  Default: yes
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_DISK_STATS
+	bool "Disk stats"
+	help
+	  Enable disk activity logging feature.
+
+	  Default: no
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_EXAMPLES
+	bool "Examples"
+	help
+	  Build example files.
+
+	  Default: no
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR_TESTS
+	bool "Tests"
+	help
+	  Build test files.
+
+	  Default: no
+
+endif
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
new file mode 100644
index 0000000000..01ac303bae
--- /dev/null
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d57a0f5b159f58003c3031943463503f0d05ae3e428dd7c2383d1e35fb2c4e8c libtorrent-rasterbar-1.1.9.tar.gz
+sha256 f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8 COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
new file mode 100644
index 0000000000..19f0a9304d
--- /dev/null
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -0,0 +1,95 @@
+################################################################################
+#
+# libtorrent-rasterbar
+#
+################################################################################
+
+LIBTORRENT_RASTERBAR_VERSION = 1.1.9
+LIBTORRENT_RASTERBAR_SITE = https://github.com/arvidn/libtorrent/releases/download/libtorrent-$(subst .,_,$(LIBTORRENT_RASTERBAR_VERSION))
+LIBTORRENT_RASTERBAR_LICENSE = BSD-2-Clause
+LIBTORRENT_RASTERBAR_LICENSE_FILES = COPYING
+LIBTORRENT_RASTERBAR_DEPENDENCIES = host-pkgconf boost $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
+LIBTORRENT_RASTERBAR_CONF_OPTS += --with-boost-libdir="$(STAGING_DIR)/usr/lib"
+LIBTORRENT_RASTERBAR_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
+ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --with-libiconv
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --without-libiconv
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_LOGGING),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-logging
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-logging
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEBUG),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-debug
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-debug
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_DHT),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-dht
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-dht
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_ENCRYPTION),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-encryption
+LIBTORRENT_RASTERBAR_DEPENDENCIES += openssl
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-encryption
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_EXPORT_ALL_SYMBOLS),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-export-all
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-export-all
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_POOL_ALLOCATORS),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-pool-allocators
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-pool-allocators
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS),y)
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS_YES),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-invariant-checks=yes
+else
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_INVARIANT_CHECKS_FULL),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-invariant-checks=full
+endif
+endif
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-invariant-checks
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_DEPRECATED_FUNCTIONS),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-deprecated-functions
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-deprecated-functions
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_DISK_STATS),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-disk-stats
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-disk-stats
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_EXAMPLES),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-examples
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-examples
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTORRENT_RASTERBAR_TESTS),y)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-tests
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-tests
+endif
+
+$(eval $(autotools-package))
-- 
2.18.0
