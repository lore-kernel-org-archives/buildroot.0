From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 May 2014 13:33:25 +0200
Subject: [Buildroot] [git commit] qt5enginio: new package
Message-ID: <20140601083246.6EDF29CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9204eca763c6b3a830fdb89117e56ff45b644a0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: only install *.so.* if !BR2_PREFER_STATIC_LIB]
Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in                |    1 +
 package/qt5/qt5enginio/Config.in     |   13 +++++++
 package/qt5/qt5enginio/qt5enginio.mk |   62 ++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 0 deletions(-)

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
index 0000000..8e4d50d
--- /dev/null
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# qt5enginio
+#
+################################################################################
+
+QT5ENGINIO_VERSION = $(QT5_VERSION)
+QT5ENGINIO_SITE = $(QT5_SITE)
+QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
+QT5ENGINIO_DEPENDENCIES = openssl qt5base
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
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+define QT5ENGINIO_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libEnginio.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+define QT5ENGINIO_INSTALL_TARGET_CMDS
+	$(QT5ENGINIO_INSTALL_TARGET_LIBS)
+	$(QT5ENGINIO_INSTALL_TARGET_QMLS)
+	$(QT5ENGINIO_INSTALL_TARGET_EXAMPLES)
+endef
+
+$(eval $(generic-package))
