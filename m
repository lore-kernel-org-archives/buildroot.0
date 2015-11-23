From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Nov 2015 22:18:00 +0100
Subject: [Buildroot] [PATCH v1] qt5/qt53d: new package
Message-ID: <1448313480-6101-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/Config.in        |  1 +
 package/qt5/qt53d/Config.in  | 18 ++++++++++++++++++
 package/qt5/qt53d/qt53d.hash |  2 ++
 package/qt5/qt53d/qt53d.mk   | 40 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)
 create mode 100644 package/qt5/qt53d/Config.in
 create mode 100644 package/qt5/qt53d/qt53d.hash
 create mode 100644 package/qt5/qt53d/qt53d.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 22fd0c0..568fadb 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -41,6 +41,7 @@ source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
+source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
new file mode 100644
index 0000000..d350922
--- /dev/null
+++ b/package/qt5/qt53d/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_QT53D
+	bool "qt53d"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative_quick
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt53d module.
+
+	  http://doc.qt.io/qt-5/qt3d-index.html
+
+comment "qt53d module needs an OpenGL-capable backend"
+        depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
new file mode 100644
index 0000000..4f6a55c
--- /dev/null
+++ b/package/qt5/qt53d/qt53d.hash
@@ -0,0 +1,2 @@
+# Hash from http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/md5sums.txt
+md5  508c90c3a2a5f37f0f7c2dd696ab10f5  qt3d-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
new file mode 100644
index 0000000..b543efd
--- /dev/null
+++ b/package/qt5/qt53d/qt53d.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# qt53d
+#
+################################################################################
+
+QT53D_VERSION = $(QT5_VERSION)
+QT53D_SITE = $(QT5_SITE)
+QT53D_SOURCE = qt3d-opensource-src-$(QT5SVG_VERSION).tar.xz
+QT53D_DEPENDENCIES = qt5base qt5declarative
+QT53D_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT53D_LICENSE = GPLv2+ or LGPLv3
+QT53D_LICENSE_FILES = LICENSE.GPL  LICENSE.LGPLv3
+else
+QT53D_LICENSE = Commercial license
+QT53D_REDISTRIBUTE = NO
+endif
+
+define QT53D_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT53D_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT53D_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+define QT53D_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.1.4
