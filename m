From: Julien Corjon <corjon.j@ecagroup.com>
Date: Mon,  4 Apr 2016 11:56:02 +0200
Subject: [Buildroot] [PATCH 2/2] qt5connectivity: add QtNfc submodule
In-Reply-To: <1459763762-31640-1-git-send-email-corjon.j@ecagroup.com>
References: <1459763762-31640-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <1459763762-31640-2-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5connectivity/Config.in          | 10 ++++++----
 package/qt5/qt5connectivity/qt5connectivity.mk |  4 +++-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index d529ea7..611ef14 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -1,13 +1,15 @@
 config BR2_PACKAGE_QT5CONNECTIVITY
 	bool "qt5connectivity"
 	select BR2_PACKAGE_BLUEZ_UTILS
+	select BR2_PACKAGE_NEARD
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_DBUS
-	depends on !BR2_STATIC_LIBS # bluez_utils
-	depends on BR2_USE_WCHAR # bluez_utils
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils
-	depends on BR2_USE_MMU # bluez_utils
+	depends on !BR2_STATIC_LIBS # bluez_utils, neard
+	depends on BR2_USE_WCHAR # bluez_utils, neard
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils, neard
+	depends on BR2_USE_MMU # bluez_utils, neard
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # neard
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 936bc6f..ff82b9d 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -7,7 +7,7 @@
 QT5CONNECTIVITY_VERSION = $(QT5_VERSION)
 QT5CONNECTIVITY_SITE = $(QT5_SITE)
 QT5CONNECTIVITY_SOURCE = qtconnectivity-opensource-src-$(QT5CONNECTIVITY_VERSION).tar.xz
-QT5CONNECTIVITY_DEPENDENCIES = bluez_utils qt5base
+QT5CONNECTIVITY_DEPENDENCIES = bluez_utils neard qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
@@ -38,12 +38,14 @@ endef
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5CONNECTIVITY_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtBluetooth $(TARGET_DIR)/usr/qml/
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtNfc $(TARGET_DIR)/usr/qml/
 endef
 endif
 
 define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/bin/sdpscanner $(TARGET_DIR)/usr/bin
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Nfc.so.* $(TARGET_DIR)/usr/lib
 	$(QT5CONNECTIVITY_INSTALL_TARGET_QMLS)
 endef
 
-- 
2.5.0
