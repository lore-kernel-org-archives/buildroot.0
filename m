From: Julien Corjon <corjon.j@ecagroup.com>
Date: Mon,  4 Apr 2016 17:37:35 +0200
Subject: [Buildroot] [PATCH] qt5canvas3d: new package
Message-ID: <1459784255-19892-1-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/Config.in                    |  1 +
 package/qt5/qt5canvas3d/Config.in        | 17 ++++++++++++++
 package/qt5/qt5canvas3d/qt5canvas3d.hash |  2 ++
 package/qt5/qt5canvas3d/qt5canvas3d.mk   | 38 ++++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/qt5/qt5canvas3d/Config.in
 create mode 100644 package/qt5/qt5canvas3d/qt5canvas3d.hash
 create mode 100644 package/qt5/qt5canvas3d/qt5canvas3d.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f673daa..af5b827 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -32,6 +32,7 @@ menuconfig BR2_PACKAGE_QT5
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt53d/Config.in"
+source "package/qt5/qt5canvas3d/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5enginio/Config.in"
diff --git a/package/qt5/qt5canvas3d/Config.in b/package/qt5/qt5canvas3d/Config.in
new file mode 100644
index 0000000..3ae5192
--- /dev/null
+++ b/package/qt5/qt5canvas3d/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_QT5CANVAS3D
+	bool "qt5canvas3d"
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5canvas3d module.
+
+	  http://qt.io
+
+comment "qt5canvas3d needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
new file mode 100644
index 0000000..57ae4d7
--- /dev/null
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -0,0 +1,2 @@
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtcanvas3d-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 66add59e826a0161f4a4dc3ec0b44c17fad1451390b4f7c67af23ee7429d9ecf qtcanvas3d-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
new file mode 100644
index 0000000..3f605ab
--- /dev/null
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# qt5canvas3d
+#
+################################################################################
+
+QT5CANVAS3D_VERSION = $(QT5_VERSION)
+QT5CANVAS3D_SITE = $(QT5_SITE)
+QT5CANVAS3D_SOURCE = qtcanvas3d-opensource-src-$(QT5CANVAS3D_VERSION).tar.xz
+QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
+QT5CANVAS3D_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5CANVAS3D_LICENSE = GPLv2 or GPLv3 or LGPLv3
+QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
+else
+QT5CANVAS3D_LICENSE = Commercial license
+QT5CANVAS3D_REDISTRIBUTE = NO
+endif
+
+define QT5CANVAS3D_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5CANVAS3D_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5CANVAS3D_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5CANVAS3D_INSTALL_TARGET_CMDS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtCanvas3D $(TARGET_DIR)/usr/qml/
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
