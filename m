From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 23:20:11 +0100
Subject: [Buildroot] [git commit] package/libtorrent-rasterbar: new package
Message-ID: <20181202071602.77F1E8131E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0393f5d34433e34e49ff7ce0fb998735453ed4fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libtorrent is a feature complete C++ bittorrent implementation
focusing on efficiency and scalability.

https://www.libtorrent.org/

Signed-off-by: Philipp Richter <richterphilipp.pops@gmail.com>
[Thomas: license is BSD-3c, not BSD-2c]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/libtorrent-rasterbar/Config.in             | 21 ++++++++++++++++++
 .../libtorrent-rasterbar/libtorrent-rasterbar.hash |  3 +++
 .../libtorrent-rasterbar/libtorrent-rasterbar.mk   | 25 ++++++++++++++++++++++
 5 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d43b3ccb2..ad80d365dd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1714,6 +1714,9 @@ F:	package/psplash/
 F:	package/sispmctl/
 F:	package/zsh/
 
+N:	Philipp Richter <richterphilipp.pops@gmail.com>
+F:	package/libtorrent-rasterbar/
+
 N:	Philippe Proulx <eeppeliteloop@gmail.com>
 F:	package/lttng-babeltrace/
 F:	package/lttng-libust/
diff --git a/package/Config.in b/package/Config.in
index d02f9eadbb..0339ec77d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1557,6 +1557,7 @@ menu "Networking"
 	source "package/libstrophe/Config.in"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
+	source "package/libtorrent-rasterbar/Config.in"
 	source "package/libupnp/Config.in"
 	source "package/libupnp18/Config.in"
 	source "package/libupnpp/Config.in"
diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
new file mode 100644
index 0000000000..aa986f2388
--- /dev/null
+++ b/package/libtorrent-rasterbar/Config.in
@@ -0,0 +1,21 @@
+comment "libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+config BR2_PACKAGE_LIBTORRENT_RASTERBAR
+	bool "libtorrent-rasterbar"
+	depends on BR2_INSTALL_LIBSTDCPP # boost
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_RANDOM
+	select BR2_PACKAGE_OPENSSL
+	help
+	  libtorrent is a feature complete C++ bittorrent implementation
+	  focusing on efficiency and scalability.
+
+	  https://www.libtorrent.org/
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
new file mode 100644
index 0000000000..e38c0f4f1d
--- /dev/null
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 7c23deba7fa279825642307587609d51c9935ac7606e0ef2f2d0ba10728b5847 libtorrent-rasterbar-1.1.11.tar.gz
+sha256 f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8 COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
new file mode 100644
index 0000000000..24bd011ae7
--- /dev/null
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libtorrent-rasterbar
+#
+################################################################################
+
+LIBTORRENT_RASTERBAR_VERSION = 1.1.11
+LIBTORRENT_RASTERBAR_SITE = https://github.com/arvidn/libtorrent/releases/download/libtorrent_$(subst .,_,$(LIBTORRENT_RASTERBAR_VERSION))
+LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
+LIBTORRENT_RASTERBAR_LICENSE_FILES = COPYING
+LIBTORRENT_RASTERBAR_DEPENDENCIES = host-pkgconf boost openssl
+LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
+LIBTORRENT_RASTERBAR_CONF_OPTS = \
+	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
+	--disable-invariant-checks
+LIBTORRENT_RASTERBAR_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
+ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
+LIBTORRENT_RASTERBAR_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBTORRENT_RASTERBAR_CONF_OPTS += --with-libiconv
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --without-libiconv
+endif
+
+$(eval $(autotools-package))
