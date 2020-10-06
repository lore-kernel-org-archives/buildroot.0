From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 23:09:35 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5remoteobjects: new package
Message-ID: <20201006205857.2232E85367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7ebc7cd0905d7d00d45f756249c1663b6465312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt 5.12 added a library for IPC, so let's have a package for it. The
dependency on qtdeclarative is optional.

Signed-off-by: Sven Fischer <sven@leiderfischer.de>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 package/qt5/Config.in                              |  1 +
 package/qt5/qt5remoteobjects/Config.in             | 15 +++++++++++++++
 package/qt5/qt5remoteobjects/qt5remoteobjects.hash |  8 ++++++++
 package/qt5/qt5remoteobjects/qt5remoteobjects.mk   | 19 +++++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 407b2b2afc..354b85605f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2538,6 +2538,9 @@ F:	configs/rock_pi_n10_defconfig
 F:	configs/rockpro64_defconfig
 F:	package/arm-gnu-a-toolchain/
 
+F:	Sven Fischer <sven@leiderfischer.de>
+N:	package/qt5/qt5remoteobjects/
+
 N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
 F:	package/lcdproc/
 F:	package/python-influxdb/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index e897c7cbcb..c31f8267f3 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -50,6 +50,7 @@ source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5quicktimeline/Config.in"
+source "package/qt5/qt5remoteobjects/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5scxml/Config.in"
 source "package/qt5/qt5sensors/Config.in"
diff --git a/package/qt5/qt5remoteobjects/Config.in b/package/qt5/qt5remoteobjects/Config.in
new file mode 100644
index 0000000000..9d4a40a5b5
--- /dev/null
+++ b/package/qt5/qt5remoteobjects/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_QT5REMOTEOBJECTS
+	bool "qt5remoteobjects"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Remote Objects (QtRO) is an Inter-Process
+	  Communication (IPC) module developed for Qt. This
+	  module extends Qt's existing functionalities to enable
+	  information exchange between processes or computers,
+	  easily.
+
+	  https://doc.qt.io/qt-5/qtremoteobjects-index.html
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
new file mode 100644
index 0000000000..6575a47c35
--- /dev/null
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
@@ -0,0 +1,8 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtremoteobjects-everywhere-src-5.15.1.tar.xz.sha256
+sha256 71b58fdac717645fa6f8b6ecb79b86841c540838877d100fabe2381175c4154e  qtremoteobjects-everywhere-src-5.15.1.tar.xz
+
+# Hashes for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
new file mode 100644
index 0000000000..4b03a09d7f
--- /dev/null
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# qt5remoteobjects
+#
+################################################################################
+
+QT5REMOTEOBJECTS_VERSION = $(QT5_VERSION)
+QT5REMOTEOBJECTS_SITE = $(QT5_SITE)
+QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5REMOTEOBJECTS_VERSION).tar.xz
+QT5REMOTEOBJECTS_DEPENDENCIES = qt5base
+QT5REMOTEOBJECTS_INSTALL_STAGING = YES
+QT5REMOTEOBJECTS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
+QT5REMOTEOBJECTS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5REMOTEOBJECTS_DEPENDENCIES += qt5declarative
+endif
+
+$(eval $(qmake-package))
