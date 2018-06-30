From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 00:04:14 +0200
Subject: [Buildroot] [git commit] package/kf5/kf5-networkmanager-qt: new
 package
Message-ID: <20180630220216.7FF5783996@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6815f429f7faa6b43b559a0599dd446ea07f3a72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

networkmanager-qt is a simple Qt wrapper on the NetworkManager API.

Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
[Thomas:
 - Update to version 5.47.
 - Instead of selecting network-manager, depend on it, it avoids
   replicating all its complicated dependencies, and it's pretty
   obvious if you want to use network-manager that you need network
   manager.
 - Needs Qt5Dbus support, so added a select BR2_PACKAGE_QT5DBUS, and
   propagated the corresponding dependencies.
 - Add missing dependency on qt5base in
   KF5_NETWORKMANAGER_QT_DEPENDENCIES
 - add hash for license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kf5/Config.in                                 |  1 +
 package/kf5/kf5-networkmanager-qt/Config.in           | 19 +++++++++++++++++++
 .../kf5-networkmanager-qt/kf5-networkmanager-qt.hash  |  3 +++
 .../kf5-networkmanager-qt/kf5-networkmanager-qt.mk    | 16 ++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/package/kf5/Config.in b/package/kf5/Config.in
index 1db0fbfe51..5a2d2cca2a 100644
--- a/package/kf5/Config.in
+++ b/package/kf5/Config.in
@@ -8,4 +8,5 @@ menuconfig BR2_PACKAGE_KF5
 
 if BR2_PACKAGE_KF5
 source "package/kf5/kf5-extra-cmake-modules/Config.in"
+source "package/kf5/kf5-networkmanager-qt/Config.in"
 endif
diff --git a/package/kf5/kf5-networkmanager-qt/Config.in b/package/kf5/kf5-networkmanager-qt/Config.in
new file mode 100644
index 0000000000..277e08866a
--- /dev/null
+++ b/package/kf5/kf5-networkmanager-qt/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_KF5_NETWORKMANAGER_QT
+	bool "kf5-networkmanager-qt"
+	depends on BR2_USE_MMU # qt5dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # qt5dbus
+	depends on BR2_PACKAGE_NETWORK_MANAGER
+	select BR2_PACKAGE_QT5BASE_DBUS
+	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
+	help
+	  KF5 is a set of Qt framework addons, extending Qt in various
+	  ways, not only restricted in helping integration in KDE.
+
+	  This package contains the NetworkManager Qt5 bindings from
+	  the KF5 project.
+
+	  https://api.kde.org/frameworks/networkmanager-qt/html/index.html
+
+comment "kf5-networkmanager-qt needs toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
new file mode 100644
index 0000000000..8ccada455e
--- /dev/null
+++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d0b377500ee4cf4f029f4d04d6844bcf3d2d6734982b511a5fffab5165688209 networkmanager-qt-5.47.0.tar.xz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LIB
diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
new file mode 100644
index 0000000000..52e70e3c41
--- /dev/null
+++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# kf5-networkmanager-qt
+#
+################################################################################
+
+KF5_NETWORKMANAGER_QT_VERSION = $(KF5_VERSION)
+KF5_NETWORKMANAGER_QT_SITE = $(KF5_SITE)
+KF5_NETWORKMANAGER_QT_SOURCE = networkmanager-qt-$(KF5_NETWORKMANAGER_QT_VERSION).tar.xz
+KF5_NETWORKMANAGER_QT_LICENSE = LGPL-2.1+
+KF5_NETWORKMANAGER_QT_LICENSE_FILE = COPYING.LIB
+
+KF5_NETWORKMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules network-manager qt5base
+KF5_NETWORKMANAGER_QT_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
