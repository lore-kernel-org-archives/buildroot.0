From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:30 +0100
Subject: [Buildroot] [PATCH v6 08/28] package/qt5virtualkeyboard: Convert to
 qmake infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-9-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems the old method was missing some files from the install
step since after the conversion the the following additional files
appear in target after a build with all config options selected:
usr/lib/qt/plugins/lipi_toolkit/libactivedtw.so
usr/lib/qt/plugins/lipi_toolkit/libboxfld.so
usr/lib/qt/plugins/lipi_toolkit/libl7.so
usr/lib/qt/plugins/lipi_toolkit/liblipiengine.so
usr/lib/qt/plugins/lipi_toolkit/liblogger.so
usr/lib/qt/plugins/lipi_toolkit/libneuralnet.so
usr/lib/qt/plugins/lipi_toolkit/libnn.so
usr/lib/qt/plugins/lipi_toolkit/libnpen.so
usr/lib/qt/plugins/lipi_toolkit/libpointfloat.so
usr/lib/qt/plugins/lipi_toolkit/libpreproc.so
usr/lib/qt/plugins/lipi_toolkit/libsubstroke.so
usr/lib/qt/plugins/virtualkeyboard/libqtvirtualkeyboard_lipi.so

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 .../qt5virtualkeyboard/qt5virtualkeyboard.mk  | 63 ++-----------------
 1 file changed, 4 insertions(+), 59 deletions(-)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index c13fa699a6..162ed88c8c 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -22,7 +22,7 @@ endif
 
 QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
 ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
 
 ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (openwnn)
@@ -36,7 +36,6 @@ endif
 ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (pinyin)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
 else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/pinyin/3rdparty/pinyin/NOTICE
@@ -46,7 +45,6 @@ endif
 ifneq ($(filter zh_TW all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (tcime), BSD-3-Clause (tcime)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/tcime/COPYING
 else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/tcime/3rdparty/tcime/COPYING
@@ -55,8 +53,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING),y)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=handwriting
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+=handwriting
 QT5VIRTUALKEYBOARD_LICENSE += , MIT (lipi-toolkit)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
@@ -66,59 +63,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_ARROW_KEY_NAVIGATION),y)
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=arrow-key-navigation
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+=arrow-key-navigation
 endif
 
-ifeq ($(QT5VIRTUALKEYBOARD_3RDPARTY_PARTS),YES)
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS
-	cp -dpfr $(STAGING_DIR)/usr/qtvirtualkeyboard $(TARGET_DIR)/usr
-endef
-endif
-
-define QT5VIRTUALKEYBOARD_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5VIRTUALKEYBOARD_QMAKEFLAGS))
-endef
-
-define QT5VIRTUALKEYBOARD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
-	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick/Enterprise
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Enterprise/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/Enterprise/
-endef
-else
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
-	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/virtualkeyboard $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST):$(BR2_STATIC_LIBS),y:)
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5VirtualKeyboard*.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so \
-		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS)
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML)
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS)
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
-- 
2.25.0
