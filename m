From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 20 May 2014 15:12:13 +0300
Subject: [Buildroot] [PATCH 2/3] qt5enginio: new package
In-Reply-To: <1400587934-17338-1-git-send-email-fatih.asici@gmail.com>
References: <1400587934-17338-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1400587934-17338-2-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/Config.in                |  1 +
 package/qt5/qt5enginio/Config.in     | 13 +++++++++
 package/qt5/qt5enginio/qt5enginio.mk | 56 ++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 package/qt5/qt5enginio/Config.in
 create mode 100644 package/qt5/qt5enginio/qt5enginio.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index d36852e..e810ecb 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -29,6 +29,7 @@ if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
+source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
new file mode 100644
index 0000000..c06e6da
--- /dev/null
+++ b/package/qt5/qt5enginio/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_QT5ENGINIO
+	bool "qt5enginio"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5enginio module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
new file mode 100644
index 0000000..8614bdf
--- /dev/null
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# qt5enginio
+#
+################################################################################
+
+QT5ENGINIO_VERSION = $(QT5_VERSION)
+QT5ENGINIO_SITE = $(QT5_SITE)
+QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
+QT5ENGINIO_DEPENDENCIES = qt5base
+QT5ENGINIO_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5ENGINIO_LICENSE = LGPLv2.1 or GPLv3.0
+QT5ENGINIO_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+else
+QT5ENGINIO_LICENSE = Commercial license
+QT5ENGINIO_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5ENGINIO_DEPENDENCIES += qt5declarative
+endif
+
+define QT5ENGINIO_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5ENGINIO_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5ENGINIO_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+define QT5ENGINIO_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/Enginio $(TARGET_DIR)/usr/qml/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5ENGINIO_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/enginio $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+define QT5ENGINIO_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libEnginio.so.* $(TARGET_DIR)/usr/lib
+	$(QT5ENGINIO_INSTALL_TARGET_QMLS)
+	$(QT5ENGINIO_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
