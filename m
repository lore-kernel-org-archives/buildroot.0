From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 20 Sep 2013 08:43:12 +0300
Subject: [Buildroot] [PATCH v2 3/6] qt5sensors: new package
In-Reply-To: <1379655795-22429-1-git-send-email-fatih.asici@gmail.com>
References: <1379655795-22429-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1379655795-22429-4-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/Config.in                |    1 +
 package/qt5/qt5sensors/Config.in     |   10 ++++++
 package/qt5/qt5sensors/qt5sensors.mk |   56 ++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 package/qt5/qt5sensors/Config.in
 create mode 100644 package/qt5/qt5sensors/qt5sensors.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b5b742c..8488578 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -24,6 +24,7 @@ source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quick1/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5script/Config.in"
+source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5sensors/Config.in b/package/qt5/qt5sensors/Config.in
new file mode 100644
index 0000000..3e1c4b7
--- /dev/null
+++ b/package/qt5/qt5sensors/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5SENSORS
+	bool "qt5sensors"
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5sensors module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
new file mode 100644
index 0000000..21ec36c
--- /dev/null
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# qt5sensors
+#
+################################################################################
+
+QT5SENSORS_VERSION = $(QT5_VERSION)
+QT5SENSORS_SITE = $(QT5_SITE)
+QT5SENSORS_SOURCE = qtsensors-opensource-src-$(QT5SENSORS_VERSION).tar.xz
+QT5SENSORS_DEPENDENCIES = qt5base
+QT5SENSORS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5SENSORS_LICENSE = LGPLv2.1 or GPLv3.0
+QT5SENSORS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+else
+QT5SENSORS_LICENSE = Commercial license
+QT5SENSORS_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5SENSORS_DEPENDENCIES += qt5declarative
+endif
+
+define QT5SENSORS_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5SENSORS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5SENSORS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define QT5SENSORS_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Sensors.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sensor* $(TARGET_DIR)/usr/lib/qt/plugins
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+define QT5SENSORS_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtSensors $(TARGET_DIR)/usr/qml
+endef
+endif
+
+define QT5SENSORS_INSTALL_TARGET_CMDS
+	$(QT5SENSORS_INSTALL_TARGET_LIBS)
+	$(QT5SENSORS_INSTALL_TARGET_QMLS)
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
