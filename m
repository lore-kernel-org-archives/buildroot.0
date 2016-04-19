From: Julien Corjon <corjon.j@ecagroup.com>
Date: Tue, 19 Apr 2016 13:43:53 +0200
Subject: [Buildroot] [PATCH v2 1/2] qt5connectivity: add QtNfc submodule
In-Reply-To: <1459763762-31640-2-git-send-email-corjon.j@ecagroup.com>
References: <1459763762-31640-2-git-send-email-corjon.j@ecagroup.com>
Message-ID: <1461066234-21504-1-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5connectivity/Config.in          | 15 +++++++----
 package/qt5/qt5connectivity/qt5connectivity.mk | 36 +++++++++++++++++++++-----
 2 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index d529ea7..83df06a 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -1,13 +1,10 @@
 config BR2_PACKAGE_QT5CONNECTIVITY
 	bool "qt5connectivity"
-	select BR2_PACKAGE_BLUEZ_UTILS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_DBUS
-	depends on !BR2_STATIC_LIBS # bluez_utils
-	depends on BR2_USE_WCHAR # bluez_utils
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils
-	depends on BR2_USE_MMU # bluez_utils
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -19,3 +16,11 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 comment "qt5connectivity needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "qt5connectivity need neard and/or bluez_utils"
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_PACKAGE_NEARD
+	depends on !BR2_PACKAGE_BLUEZ_UTILS
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 936bc6f..6a446e9 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -7,7 +7,7 @@
 QT5CONNECTIVITY_VERSION = $(QT5_VERSION)
 QT5CONNECTIVITY_SITE = $(QT5_SITE)
 QT5CONNECTIVITY_SOURCE = qtconnectivity-opensource-src-$(QT5CONNECTIVITY_VERSION).tar.xz
-QT5CONNECTIVITY_DEPENDENCIES = bluez_utils qt5base
+QT5CONNECTIVITY_DEPENDENCIES = qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
@@ -18,9 +18,9 @@ QT5CONNECTIVITY_LICENSE = Commercial license
 QT5CONNECTIVITY_REDISTRIBUTE = NO
 endif
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
-QT5CONNECTIVITY_DEPENDENCIES += qt5declarative
-endif
+QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5DECLARATIVE),qt5declarative)
+QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils)
+QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_NEARD),neard)
 
 define QT5CONNECTIVITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
@@ -36,14 +36,38 @@ define QT5CONNECTIVITY_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5CONNECTIVITY_INSTALL_TARGET_QMLS
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtBluetooth $(TARGET_DIR)/usr/qml/
 endef
 endif
+ifeq ($(BR2_PACKAGE_NEARD),y)
+define QT5CONNECTIVITY_INSTALL_TARGET_NFC_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtNfc $(TARGET_DIR)/usr/qml/
+endef
+endif
+define QT5CONNECTIVITY_INSTALL_TARGET_QMLS
+	$(QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_QMLS)
+	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC_QMLS)
+endef
+endif
 
-define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/bin/sdpscanner $(TARGET_DIR)/usr/bin
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_NEARD),y)
+define QT5CONNECTIVITY_INSTALL_TARGET_NFC
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Nfc.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
+	$(QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH)
+	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC)
 	$(QT5CONNECTIVITY_INSTALL_TARGET_QMLS)
 endef
 
-- 
2.5.0
