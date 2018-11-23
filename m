From: Philipp Richter <richterphilipp.pops@gmail.com>
Date: Fri, 23 Nov 2018 19:14:26 +0100
Subject: [Buildroot] [PATCH 2/2] package/qbittorrent: new package
In-Reply-To: <20181123181426.16116-1-richterphilipp.pops@gmail.com>
References: <20181123181426.16116-1-richterphilipp.pops@gmail.com>
Message-ID: <20181123181426.16116-2-richterphilipp.pops@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The qBittorrent project aims to provide
an open-source software alternative to ?Torrent.

https://www.qbittorrent.org/

Signed-off-by: Philipp Richter <richterphilipp.pops@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/qbittorrent/Config.in        | 63 ++++++++++++++++++++++++++++
 package/qbittorrent/qbittorrent.hash |  5 +++
 package/qbittorrent/qbittorrent.mk   | 41 ++++++++++++++++++
 5 files changed, 111 insertions(+)
 create mode 100644 package/qbittorrent/Config.in
 create mode 100644 package/qbittorrent/qbittorrent.hash
 create mode 100644 package/qbittorrent/qbittorrent.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e2bca31f7b..136d689d9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1700,6 +1700,7 @@ F:	package/zsh/
 
 N:	Philipp Richter <richterphilipp.pops@gmail.com>
 F:	package/libtorrent-rasterbar/
+F:	package/qbittorrent/
 
 N:	Philippe Proulx <eeppeliteloop@gmail.com>
 F:	package/lttng-babeltrace/
diff --git a/package/Config.in b/package/Config.in
index fb32ace8e7..50bfa65302 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1951,6 +1951,7 @@ endif
 	source "package/ptpd2/Config.in"
 	source "package/pure-ftpd/Config.in"
 	source "package/putty/Config.in"
+	source "package/qbittorrent/Config.in"
 	source "package/quagga/Config.in"
 	source "package/rabbitmq-server/Config.in"
 	source "package/radvd/Config.in"
diff --git a/package/qbittorrent/Config.in b/package/qbittorrent/Config.in
new file mode 100644
index 0000000000..c4bdf3a22e
--- /dev/null
+++ b/package/qbittorrent/Config.in
@@ -0,0 +1,63 @@
+comment "qbittorrent needs a toolchain w/ C++, threads, wchar, NPTL, dynamic library, gcc >= 4.8"
+	depends on !BR2_PACKAGE_QT
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_QBITTORRENT
+	bool "qbittorrent"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_QT
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_LIBTORRENT_RASTERBAR
+	select BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_ZLIB
+	help
+	  The qBittorrent project aims to provide
+	  an open-source software alternative to ?Torrent.
+
+	  https://www.qbittorrent.org/
+
+if BR2_PACKAGE_QBITTORRENT
+
+config BR2_PACKAGE_QBITTORRENT_GUI
+	bool "GUI"
+	select BR2_PACKAGE_HICOLOR_ICON_THEME
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5SVG
+	help
+	  Disable for headless mode.
+	  The target binary will be called qbittorrent-nox.
+
+if BR2_PACKAGE_QBITTORRENT_GUI
+
+config BR2_PACKAGE_QBITTORRENT_QTDBUS
+	bool "D-Bus support"
+	default y
+	select BR2_PACKAGE_QT5BASE_DBUS
+	help
+	  Enable D-Bus support.
+
+endif
+
+if !BR2_PACKAGE_QBITTORRENT_GUI
+
+config BR2_PACKAGE_QBITTORRENT_WEBUI
+	bool "WebUI"
+	default y
+	help
+	  Enable the WebUI.
+
+endif
+
+endif
diff --git a/package/qbittorrent/qbittorrent.hash b/package/qbittorrent/qbittorrent.hash
new file mode 100644
index 0000000000..6cc24d2796
--- /dev/null
+++ b/package/qbittorrent/qbittorrent.hash
@@ -0,0 +1,5 @@
+# Locally checked with PGP signature from https://downloads.sourceforge.net/sourceforge/qbittorrent/qbittorrent-4.1.4.tar.xz.asc
+sha256 5f7b4c5ae891ce7fbab880ff322764a0d433fccf655164f6b98ef08f1ae52386 qbittorrent-4.1.4.tar.xz
+
+# Locally calculated
+sha256 fc68233a17d308ee633aefedbd761c7582ec48557539aca310b4162e54212fe5 COPYING
diff --git a/package/qbittorrent/qbittorrent.mk b/package/qbittorrent/qbittorrent.mk
new file mode 100644
index 0000000000..11523efdbb
--- /dev/null
+++ b/package/qbittorrent/qbittorrent.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# qbittorrent
+#
+################################################################################
+
+QBITTORRENT_VERSION = 4.1.4
+QBITTORRENT_SOURCE = qbittorrent-$(QBITTORRENT_VERSION).tar.xz
+QBITTORRENT_SITE = https://downloads.sourceforge.net/sourceforge/qbittorrent
+QBITTORRENT_LICENSE = GPL-2.0
+QBITTORRENT_LICENSE_FILES = COPYING
+QBITTORRENT_DEPENDENCIES = host-pkgconf boost libtorrent-rasterbar qt5base zlib
+QBITTORRENT_CONF_OPTS += --with-boost-libdir=$(STAGING_DIR)/usr/lib
+QBITTORRENT_INSTALL_TARGET_OPTS = INSTALL_ROOT="$(TARGET_DIR)" install
+
+ifeq ($(BR2_PACKAGE_QBITTORRENT_GUI),y)
+QBITTORRENT_CONF_OPTS += --enable-gui
+QBITTORRENT_DEPENDENCIES += hicolor-icon-theme qt5svg
+else
+QBITTORRENT_CONF_OPTS += --disable-gui
+endif
+
+ifeq ($(BR2_PACKAGE_QBITTORRENT_QTDBUS),y)
+QBITTORRENT_CONF_OPTS += --enable-qt-dbus
+else
+QBITTORRENT_CONF_OPTS += --disable-qt-dbus
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+QBITTORRENT_CONF_OPTS += --enable-systemd
+else
+QBITTORRENT_CONF_OPTS += --disable-systemd
+endif
+
+ifeq ($(BR2_PACKAGE_QBITTORRENT_WEBUI),y)
+QBITTORRENT_CONF_OPTS += --enable-webui
+else
+QBITTORRENT_CONF_OPTS += --disable-webui
+endif
+
+$(eval $(autotools-package))
-- 
2.19.1
