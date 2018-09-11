From: Philipp Richter <richterphilipp.pops@gmail.com>
Date: Tue, 11 Sep 2018 10:50:24 +0200
Subject: [Buildroot] [PATCH 2/2] package/qbittorrent: new package
In-Reply-To: <20180911085024.14648-1-richterphilipp.pops@gmail.com>
References: <20180911085024.14648-1-richterphilipp.pops@gmail.com>
Message-ID: <20180911085024.14648-2-richterphilipp.pops@gmail.com>
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
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-fix-webui-unreachable-issue.patch    | 36 +++++++
 package/qbittorrent/Config.in                 | 97 +++++++++++++++++++
 package/qbittorrent/qbittorrent.hash          |  6 ++
 package/qbittorrent/qbittorrent.mk            | 49 ++++++++++
 6 files changed, 190 insertions(+)
 create mode 100644 package/qbittorrent/0001-fix-webui-unreachable-issue.patch
 create mode 100644 package/qbittorrent/Config.in
 create mode 100644 package/qbittorrent/qbittorrent.hash
 create mode 100644 package/qbittorrent/qbittorrent.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5cf182e5fe..03dfa9bf8c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1670,6 +1670,7 @@ F:	package/zsh/
 
 N:	Philipp Richter <richterphilipp.pops@gmail.com>
 F:	package/libtorrent-rasterbar/
+F:	package/qbittorrent/
 
 N:	Philippe Proulx <eeppeliteloop@gmail.com>
 F:	package/lttng-babeltrace/
diff --git a/package/Config.in b/package/Config.in
index d1b4147833..cc7173cb4c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1891,6 +1891,7 @@ endif
 	source "package/ptpd2/Config.in"
 	source "package/pure-ftpd/Config.in"
 	source "package/putty/Config.in"
+	source "package/qbittorrent/Config.in"
 	source "package/quagga/Config.in"
 	source "package/rabbitmq-server/Config.in"
 	source "package/radvd/Config.in"
diff --git a/package/qbittorrent/0001-fix-webui-unreachable-issue.patch b/package/qbittorrent/0001-fix-webui-unreachable-issue.patch
new file mode 100644
index 0000000000..e7e955d813
--- /dev/null
+++ b/package/qbittorrent/0001-fix-webui-unreachable-issue.patch
@@ -0,0 +1,36 @@
+Backported from: 5f175e113ab0eaeaea560f58b6a255932b194892
+
+From 262c3a75bd3a99de16eea2327213bcd32b727d36 Mon Sep 17 00:00:00 2001
+From: Chocobo1 <Chocobo1@users.noreply.github.com>
+Date: Sun, 19 Aug 2018 03:28:41 +0800
+Subject: [PATCH] Fix WebUI unreachable issue
+
+QVariant doesn't have constructor for plain char, by default it converts
+a plain char into an integer, hence the WebUI issue.
+Closes #9333.
+---
+ src/base/preferences.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/base/preferences.cpp b/src/base/preferences.cpp
+index 61c6a3d327..e82db5cb03 100644
+--- a/src/base/preferences.cpp
++++ b/src/base/preferences.cpp
+@@ -530,7 +530,7 @@ void Preferences::setWebUiAuthSubnetWhitelist(QStringList subnets)
+ 
+ QString Preferences::getServerDomains() const
+ {
+-    return value("Preferences/WebUI/ServerDomains", '*').toString();
++    return value("Preferences/WebUI/ServerDomains", QChar('*')).toString();
+ }
+ 
+ void Preferences::setServerDomains(const QString &str)
+@@ -540,7 +540,7 @@ void Preferences::setServerDomains(const QString &str)
+ 
+ QString Preferences::getWebUiAddress() const
+ {
+-    return value("Preferences/WebUI/Address", '*').toString().trimmed();
++    return value("Preferences/WebUI/Address", QChar('*')).toString().trimmed();
+ }
+ 
+ void Preferences::setWebUiAddress(const QString &addr)
diff --git a/package/qbittorrent/Config.in b/package/qbittorrent/Config.in
new file mode 100644
index 0000000000..fb33e49d02
--- /dev/null
+++ b/package/qbittorrent/Config.in
@@ -0,0 +1,97 @@
+comment "qbittorrent needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_QBITTORRENT
+	bool "qbittorrent"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_HOST_PKGCONF
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
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5SVG
+	help
+	  Disable for headless running.
+	  The target binary will be called qbittorrent-nox.
+
+if BR2_PACKAGE_QBITTORRENT_GUI
+
+config BR2_PACKAGE_QBITTORRENT_QTDBUS
+	bool "QtDBUS"
+	default y
+	select BR2_PACKAGE_QT5BASE_DBUS
+	help
+	  Enable QtDBUS support.
+
+	  Default: yes
+
+endif
+
+if !BR2_PACKAGE_QBITTORRENT_GUI
+
+comment "Systemd service needs systemd enabled"
+	depends on !BR2_PACKAGE_SYSTEMD
+
+config BR2_PACKAGE_QBITTORRENT_SYSTEMD
+	bool "Systemd service"
+	depends on BR2_PACKAGE_SYSTEMD
+	help
+	  Install systemd service file.
+
+	  Default: no
+
+endif
+
+comment "Stacktrace feature needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+choice
+	prompt "Stacktrace"
+	default BR2_PACKAGE_QBITTORRENT_STACKTRACE_AUTO
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Stacktrace feature.
+
+	  Default: auto
+
+config BR2_PACKAGE_QBITTORRENT_STACKTRACE_AUTO
+	bool "auto"
+	help
+	  Determine automatically.
+
+config BR2_PACKAGE_QBITTORRENT_STACKTRACE_ENABLE
+	bool "enable"
+	help
+	  Enable stacktrace feature.
+
+config BR2_PACKAGE_QBITTORRENT_STACKTRACE_DISABLE
+	bool "disable"
+	help
+	  Disable stacktrace feature.
+
+endchoice
+
+config BR2_PACKAGE_QBITTORRENT_WEBUI
+	bool "WebUI"
+	default y
+	help
+	  Enable the WebUI.
+
+	  Default: yes
+
+endif
diff --git a/package/qbittorrent/qbittorrent.hash b/package/qbittorrent/qbittorrent.hash
new file mode 100644
index 0000000000..f5cf78e7fc
--- /dev/null
+++ b/package/qbittorrent/qbittorrent.hash
@@ -0,0 +1,6 @@
+# Locally checked with PGP signature from https://downloads.sourceforge.net/sourceforge/qbittorrent/qbittorrent-4.1.2.tar.xz.asc
+sha256 e0165bd427820c64bce596ef952d80058ea8cd7294d3c84bc723d79cd9e2f9c7 qbittorrent-4.1.2.tar.xz
+
+# Locally calculated
+sha256 ed266afaf97e160adc8954a2ddc6d1aeb63bc537b9b8b65348581239052bee03 0001-fix-webui-unreachable-issue.patch
+sha256 fc68233a17d308ee633aefedbd761c7582ec48557539aca310b4162e54212fe5 COPYING
diff --git a/package/qbittorrent/qbittorrent.mk b/package/qbittorrent/qbittorrent.mk
new file mode 100644
index 0000000000..b90dd9ac84
--- /dev/null
+++ b/package/qbittorrent/qbittorrent.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# qbittorrent
+#
+################################################################################
+
+QBITTORRENT_VERSION = 4.1.2
+QBITTORRENT_SOURCE = qbittorrent-$(QBITTORRENT_VERSION).tar.xz
+QBITTORRENT_SITE = https://downloads.sourceforge.net/sourceforge/qbittorrent
+QBITTORRENT_LICENSE = GPL-2.0
+QBITTORRENT_LICENSE_FILES = COPYING
+QBITTORRENT_DEPENDENCIES = host-pkgconf boost libtorrent-rasterbar qt5base zlib
+QBITTORRENT_CONF_OPTS += --with-boost-libdir="$(STAGING_DIR)/usr/lib"
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
+ifeq ($(BR2_PACKAGE_QBITTORRENT_SYSTEMD),y)
+QBITTORRENT_CONF_OPTS += --enable-systemd
+else
+QBITTORRENT_CONF_OPTS += --disable-systemd
+endif
+
+ifeq ($(BR2_PACKAGE_QBITTORRENT_STACKTRACE_ENABLE),y)
+QBITTORRENT_CONF_OPTS += --enable-stacktrace
+endif
+
+ifeq ($(BR2_PACKAGE_QBITTORRENT_STACKTRACE_DISABLE),y)
+QBITTORRENT_CONF_OPTS += --disable-stacktrace
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
2.18.0
