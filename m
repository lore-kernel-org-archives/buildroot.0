From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 29 Mar 2016 15:45:36 +0200
Subject: [Buildroot] [PATCH v1] qt5quickcontrols2: new package
Message-ID: <1459259136-20214-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/Config.in                              |  1 +
 package/qt5/qt5quickcontrols2/Config.in            | 17 ++++++++++
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  2 ++
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 37 ++++++++++++++++++++++
 4 files changed, 57 insertions(+)
 create mode 100644 package/qt5/qt5quickcontrols2/Config.in
 create mode 100644 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
 create mode 100644 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f673daa..1db14c9 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -39,6 +39,7 @@ source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
+source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
new file mode 100644
index 0000000..c9ce9a4
--- /dev/null
+++ b/package/qt5/qt5quickcontrols2/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_QT5QUICKCONTROLS2
+	bool "qt5quickcontrols2"
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5quickcontrols2 module.
+
+	  http://qt.io
+
+comment "qt5quickcontrols2 needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
new file mode 100644
index 0000000..aaf8fcf
--- /dev/null
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -0,0 +1,2 @@
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtquickcontrols2-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 59ec6ea2282931bc0d0748b3979a52e1a322e7ef8d1e5490b8a34931e8b9fee0 qtquickcontrols2-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
new file mode 100644
index 0000000..820c239
--- /dev/null
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# qt5quickcontrols2
+#
+################################################################################
+
+QT5QUICKCONTROLS2_VERSION = $(QT5_VERSION)
+QT5QUICKCONTROLS2_SITE = $(QT5_SITE)
+QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-opensource-src-$(QT5QUICKCONTROLS2_VERSION).tar.xz
+QT5QUICKCONTROLS2_DEPENDENCIES = qt5base qt5declarative
+QT5QUICKCONTROLS2_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5QUICKCONTROLS2_LICENSE = GPLv3 or LGPLv3, GFDLv1.3 (docs)
+QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+else
+QT5QUICKCONTROLS2_LICENSE = Commercial license
+QT5QUICKCONTROLS2_REDISTRIBUTE = NO
+endif
+
+define QT5QUICKCONTROLS2_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5QUICKCONTROLS2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5QUICKCONTROLS2_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick.2 $(TARGET_DIR)/usr/qml
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
