From: Jordon Wu <jordon.wu@gmail.com>
Date: Tue,  1 Dec 2015 14:12:36 +0800
Subject: [Buildroot] [PATCH 1/1] qt5/qt53d: new package
Message-ID: <1448950356-5581-1-git-send-email-jordon.wu@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jordon Wu <jordon.wu@gmail.com>
---
 package/qt5/Config.in        |  1 +
 package/qt5/qt53d/Config.in  | 22 ++++++++++++++++
 package/qt5/qt53d/qt53d.hash |  4 +++
 package/qt5/qt53d/qt53d.mk   | 61 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100755 package/qt5/qt53d/Config.in
 create mode 100755 package/qt5/qt53d/qt53d.hash
 create mode 100755 package/qt5/qt53d/qt53d.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 22fd0c0..93936ae 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -45,6 +45,7 @@ source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
+source "package/qt5/qt53d/Config.in"
 comment "legacy compatibility"
 source "package/qt5/qt5quick1/Config.in"
 source "package/qt5/qt5script/Config.in"
diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
new file mode 100755
index 0000000..e3080c9
--- /dev/null
+++ b/package/qt5/qt53d/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_QT53D
+	bool "qt53d"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5IMAGEFORMATS
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt53d module.
+
+	  http://qt.io
+
+if BR2_PACKAGE_QT53D
+
+config BR2_PACKAGE_QT53D_EXAMPLES
+	bool "Compile and install examples (with code)"
+	help
+	  If unsure, say N.
+
+endif
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
new file mode 100755
index 0000000..bb65454
--- /dev/null
+++ b/package/qt5/qt53d/qt53d.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qt3d-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 bf6c54fbb6f279e9bd6fd67f7faa8e61ac4273baa06a56f8946346adc8c3568e qt3d-opensource-src-5.5.0.tar.xz
+sha1   dc76e83eaafd7c0edccd8557f03fbfd61ea68213                         qt3d-opensource-src-5.5.0.tar.xz
+md5    508c90c3a2a5f37f0f7c2dd696ab10f5                                 qt3d-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
new file mode 100755
index 0000000..8f64107
--- /dev/null
+++ b/package/qt5/qt53d/qt53d.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# qt53d
+#
+################################################################################
+
+QT53D_VERSION = $(QT5_VERSION)
+QT53D_SITE = $(QT5_SITE)
+QT53D_SOURCE = qt3d-opensource-src-$(QT53D_VERSION).tar.xz
+QT53D_DEPENDENCIES = qt5base qt5declarative qt5imageformats
+QT53D_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT53D_LICENSE = LGPLv2.1 with exception or LGPLv3
+QT53D_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
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
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		sub-src-all $(if $(BR2_PACKAGE_QT53D_EXAMPLES), sub-examples-all)
+endef
+
+define QT53D_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		sub-src-install_subtargets $(if $(BR2_PACKAGE_QT53D_EXAMPLES), sub-examples-install_subtargets)
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+
+define QT53D_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
+endef
+
+define QT53D_INSTALL_TARGET_PLUGINS
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
+endef
+
+ifeq ($(BR2_PACKAGE_QT53D_EXAMPLES),y)
+define QT53D_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/qt3d $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+endif
+
+define QT53D_INSTALL_TARGET_CMDS
+	cp -dpfr $(STAGING_DIR)/usr/qml $(TARGET_DIR)/usr
+	$(QT53D_INSTALL_TARGET_LIBS)
+	$(QT53D_INSTALL_TARGET_PLUGINS)
+	$(QT53D_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
