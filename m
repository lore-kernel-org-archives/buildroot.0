From: Sven Fischer <sven@leiderfischer.de>
Date: Mon,  9 Mar 2020 09:22:35 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_qt5remoteobjects=3A_new_pac?=
 =?utf-8?b?4bixYWdl?=
Message-ID: <20200309082235.12931-1-sven@leiderfischer.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt 5.12 adds a library for IPC.

Signed-off-by: Sven Fischer <sven@leiderfischer.de>
---
Notes:
  This library is missing from the
  distributed qt5 package. Added it by using the library qt5serialport as
  a template and replaced serialport with remoteobjects, recalculated the
  sha256 sums.
  
  Dependency on qtdeclarative is optional.

 package/qt5/Config.in                         |  1 +
 .../5.12.7/qt5remoteobjects.hash              |  8 +++
 package/qt5/qt5remoteobjects/Config.in        | 13 +++++
 .../qt5remoteobjects/qt5remoteobjects.hash    |  2 +
 .../qt5/qt5remoteobjects/qt5remoteobjects.mk  | 54 +++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/qt5/qt5remoteobjects/5.12.7/qt5remoteobjects.hash
 create mode 100644 package/qt5/qt5remoteobjects/Config.in
 create mode 100644 package/qt5/qt5remoteobjects/qt5remoteobjects.hash
 create mode 100644 package/qt5/qt5remoteobjects/qt5remoteobjects.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 4bbc688249..6fb77fb9a6 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -50,6 +50,7 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
+source "package/qt5/qt5remoteobjects/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5scxml/Config.in"
 source "package/qt5/qt5sensors/Config.in"
diff --git a/package/qt5/qt5remoteobjects/5.12.7/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/5.12.7/qt5remoteobjects.hash
new file mode 100644
index 0000000000..4097dd8d54
--- /dev/null
+++ b/package/qt5/qt5remoteobjects/5.12.7/qt5remoteobjects.hash
@@ -0,0 +1,8 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtremoteobjects-everywhere-src-5.12.7.tar.xz.sha256
+sha256 6d6aaec4e9c140c027b0badaabc6322ea3c16cf649495a27fec1f261e891120f  qtremoteobjects-everywhere-src-5.12.7.tar.xz
+
+# Hashes for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
diff --git a/package/qt5/qt5remoteobjects/Config.in b/package/qt5/qt5remoteobjects/Config.in
new file mode 100644
index 0000000000..05f22ada88
--- /dev/null
+++ b/package/qt5/qt5remoteobjects/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_QT5REMOTEOBJECTS
+	bool "qt5remoteobjects"
+	select BR2_PACKAGE_QT5BASE
+    select BR2_PACKAGE_QT5BASE_NETWORK
+    help
+      Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Remote Objects (QtRO) is an Inter-Process Communication (IPC) module
+	  developed for Qt. This module extends Qt's existing functionalities to
+	  enable information exchange between processes or computers, easily.
+
+	  http://doc.qt.io/qt-5/qtremoteobjects-index.html
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
new file mode 100644
index 0000000000..5316f03b10
--- /dev/null
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
@@ -0,0 +1,2 @@
+# This hash file is not used; instead, update the
+# hash files in the per-version sub-directories.
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
new file mode 100644
index 0000000000..e98f51b131
--- /dev/null
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
@@ -0,0 +1,54 @@
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
+
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5REMOTEOBJECTS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
+QT5REMOTEOBJECTS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+else
+QT5REMOTEOBJECTS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
+QT5REMOTEOBJECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5REMOTEOBJECTS_DEPENDENCIES += qt5declarative
+endif
+
+define QT5REMOTEOBJECTS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+endef
+
+define QT5REMOTEOBJECTS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5REMOTEOBJECTS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+define QT5REMOTEOBJECTS_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5RemoteObjects.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5REMOTEOBJECTS_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/remoteobjects $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+define QT5REMOTEOBJECTS_INSTALL_TARGET_CMDS
+	$(QT5REMOTEOBJECTS_INSTALL_TARGET_LIBS)
+	$(QT5REMOTEOBJECTS_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
-- 
2.25.1
