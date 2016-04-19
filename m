From: Julien Corjon <corjon.j@ecagroup.com>
Date: Tue, 19 Apr 2016 13:43:54 +0200
Subject: [Buildroot] [PATCH v2 2/2] qt5connectivity: add bluez5_utils option
	for QtBluetooth submodule
In-Reply-To: <1461066234-21504-1-git-send-email-corjon.j@ecagroup.com>
References: <1459763762-31640-2-git-send-email-corjon.j@ecagroup.com>
 <1461066234-21504-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <1461066234-21504-2-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5connectivity/Config.in          | 3 ++-
 package/qt5/qt5connectivity/qt5connectivity.mk | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index 83df06a..f10d001 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_DBUS
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS
+	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -24,3 +24,4 @@ comment "qt5connectivity need neard and/or bluez_utils"
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_PACKAGE_NEARD
 	depends on !BR2_PACKAGE_BLUEZ_UTILS
+	depends on !BR2_PACKAGE_BLUEZ5_UTILS
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 6a446e9..a95f30f 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -20,6 +20,7 @@ endif
 
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5DECLARATIVE),qt5declarative)
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils)
+QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_NEARD),neard)
 
 define QT5CONNECTIVITY_CONFIGURE_CMDS
@@ -36,7 +37,7 @@ define QT5CONNECTIVITY_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+ifneq (,$(filter y,$(BR2_PACKAGE_BLUEZ_UTILS) $(BR2_PACKAGE_BLUEZ5_UTILS)))
 define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtBluetooth $(TARGET_DIR)/usr/qml/
 endef
@@ -52,7 +53,7 @@ define QT5CONNECTIVITY_INSTALL_TARGET_QMLS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+ifneq (,$(filter y,$(BR2_PACKAGE_BLUEZ_UTILS) $(BR2_PACKAGE_BLUEZ5_UTILS)))
 define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/bin/sdpscanner $(TARGET_DIR)/usr/bin
-- 
2.5.0
