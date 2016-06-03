From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 19:43:27 +0200
Subject: [Buildroot] [git commit] qt5connectivity: add bluez5_utils option
	for QtBluetooth submodule
Message-ID: <20160603174349.51B248043F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dfb844357db0373edea38e4dfe25e622d91d967
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
[Thomas: simplify ifneq conditions in the .mk file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5connectivity/Config.in          | 7 ++++---
 package/qt5/qt5connectivity/qt5connectivity.mk | 5 +++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index e3128ec..fa9b911 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_DBUS
-	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS
+	depends on BR2_PACKAGE_NEARD || BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -12,5 +12,6 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 
 	  http://qt.io
 
-comment "qt5connectivity needs neard and/or bluez_utils"
-	depends on !BR2_PACKAGE_NEARD && !BR2_PACKAGE_BLUEZ_UTILS
+comment "qt5connectivity needs neard and/or bluez(5)_utils"
+	depends on !BR2_PACKAGE_NEARD && !BR2_PACKAGE_BLUEZ_UTILS && \
+		!BR2_PACKAGE_BLUEZ5_UTILS
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index ac0f2dd..0f7257d 100644
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
+ifneq ($(BR2_PACKAGE_BLUEZ_UTILS)$(BR2_PACKAGE_BLUEZ5_UTILS),)
 define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtBluetooth $(TARGET_DIR)/usr/qml/
 endef
@@ -48,7 +49,7 @@ endef
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+ifneq ($(BR2_PACKAGE_BLUEZ_UTILS)$(BR2_PACKAGE_BLUEZ5_UTILS),)
 define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/bin/sdpscanner $(TARGET_DIR)/usr/bin
