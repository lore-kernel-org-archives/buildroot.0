From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 23:20:34 +0200
Subject: [Buildroot] [git commit] kf5-modemmanager-qt: new package
Message-ID: <20180702212055.3BA2784051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b40992da224b2ec277d22f88c7a00bf8ac41651
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

modemmanager-qt is a simple Qt wrapper on the ModemManager API.

Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
[Thomas:
 - fix commit title
 - update to 5.47
 - add hash for license file
 - add missing dependency on qt5base
 - add missing dependency on Qt5 DBus module
 - use "depends on" instead of "select" for modemmanager dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kf5/Config.in                                 |  1 +
 package/kf5/kf5-modemmanager-qt/Config.in             | 19 +++++++++++++++++++
 .../kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash  |  3 +++
 .../kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk    | 16 ++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/package/kf5/Config.in b/package/kf5/Config.in
index 5a2d2cca2a..075b246269 100644
--- a/package/kf5/Config.in
+++ b/package/kf5/Config.in
@@ -8,5 +8,6 @@ menuconfig BR2_PACKAGE_KF5
 
 if BR2_PACKAGE_KF5
 source "package/kf5/kf5-extra-cmake-modules/Config.in"
+source "package/kf5/kf5-modemmanager-qt/Config.in"
 source "package/kf5/kf5-networkmanager-qt/Config.in"
 endif
diff --git a/package/kf5/kf5-modemmanager-qt/Config.in b/package/kf5/kf5-modemmanager-qt/Config.in
new file mode 100644
index 0000000000..c291b886f5
--- /dev/null
+++ b/package/kf5/kf5-modemmanager-qt/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_KF5_MODEMMANAGER_QT
+	bool "kf5-modemmanager-qt"
+	depends on BR2_USE_MMU # qt5dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # qt5dbus
+	depends on BR2_PACKAGE_MODEM_MANAGER
+	select BR2_PACKAGE_QT5BASE_DBUS
+	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
+	help
+	  KF5 is a set of Qt framework addons, extending Qt in various
+	  ways, not only restricted in helping integration in KDE.
+
+	  This package contains the ModemManager Qt5 bindings from the
+	  KF5 project.
+
+	  https://api.kde.org/frameworks/modemmanager-qt/html/index.html
+
+comment "kf5-modemmanager-qt needs toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
new file mode 100644
index 0000000000..408eb0c0b0
--- /dev/null
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 8b6ab15ce82b7a30b26814178ac33380056ec4398707481aa5ce95cf09d39d03 modemmanager-qt-5.47.0.tar.xz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
new file mode 100644
index 0000000000..9bbeeaa760
--- /dev/null
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# kf5-modemmanager-qt
+#
+################################################################################
+
+KF5_MODEMMANAGER_QT_VERSION = $(KF5_VERSION)
+KF5_MODEMMANAGER_QT_SITE = $(KF5_SITE)
+KF5_MODEMMANAGER_QT_SOURCE = modemmanager-qt-$(KF5_MODEMMANAGER_QT_VERSION).tar.xz
+KF5_MODEMMANAGER_QT_LICENSE = LGPL-2.1+
+KF5_MODEMMANAGER_QT_LICENSE_FILE = COPYING.LIB
+
+KF5_MODEMMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules modem-manager qt5base
+KF5_MODEMMANAGER_QT_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
