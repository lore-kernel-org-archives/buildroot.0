From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 25 Dec 2013 15:36:34 +0200
Subject: [Buildroot] [PATCH v2] qt5connectivity: new package
Message-ID: <1387978594-16692-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QtNfc is not installed since it is not supported on Linux.

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
Changes v1 -> v2:
  - propagate bluez_utils dependencies !BR2_avr32 and BR2_USE_MMU
    (Suggested by Thomas Petazzoni)
---
 package/qt5/Config.in                          |  1 +
 package/qt5/qt5connectivity/Config.in          | 15 ++++++++
 package/qt5/qt5connectivity/qt5connectivity.mk | 49 ++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 package/qt5/qt5connectivity/Config.in
 create mode 100644 package/qt5/qt5connectivity/qt5connectivity.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index d2b8f10..bf10075 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -17,6 +17,7 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
+source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
new file mode 100644
index 0000000..c9f36ef
--- /dev/null
+++ b/package/qt5/qt5connectivity/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_QT5CONNECTIVITY
+	bool "qt5connectivity"
+	select BR2_PACKAGE_BLUEZ_UTILS
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	select BR2_PACKAGE_QT5BASE_DBUS
+	depends on !BR2_avr32 # bluez_utils
+	depends on BR2_USE_MMU # bluez_utils
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5connectivity module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
new file mode 100644
index 0000000..2be51d5
--- /dev/null
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# qt5connectivity
+#
+################################################################################
+
+QT5CONNECTIVITY_VERSION = $(QT5_VERSION)
+QT5CONNECTIVITY_SITE = $(QT5_SITE)
+QT5CONNECTIVITY_SOURCE = qtconnectivity-opensource-src-$(QT5CONNECTIVITY_VERSION).tar.xz
+QT5CONNECTIVITY_DEPENDENCIES = bluez_utils qt5base
+QT5CONNECTIVITY_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5CONNECTIVITY_LICENSE = LGPLv2.1 or GPLv3.0
+QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+else
+QT5CONNECTIVITY_LICENSE = Commercial license
+QT5CONNECTIVITY_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5CONNECTIVITY_DEPENDENCIES += qt5declarative
+endif
+
+define QT5CONNECTIVITY_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5CONNECTIVITY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5CONNECTIVITY_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+define QT5CONNECTIVITY_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtBluetooth $(TARGET_DIR)/usr/qml/
+endef
+endif
+
+define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
+	$(QT5CONNECTIVITY_INSTALL_TARGET_QMLS)
+endef
+
+$(eval $(generic-package))
-- 
1.8.5.1
