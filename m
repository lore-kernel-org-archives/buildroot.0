From: Mark Thompson <mark.thompson@starleaf.com>
Date: Fri, 8 Mar 2019 18:33:39 +0000
Subject: [Buildroot] [PATCH v2] qt5virtualkeyboard: Install new library
In-Reply-To: <20190308180750.GW2721@scaer>
References: <0bc4e8bf-5b7a-69e2-4443-6936700a132f@starleaf.com>
 <20190308180750.GW2721@scaer>
Message-ID: <4c8cb1db-58a9-5df0-25cd-538e76e8a7a7@starleaf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Between Qt 5.11 and 5.12 the virtual keyboard package gained a new top-level
library, libQt5VirtualKeyboard.so, which is then used by all of the plugins
it installs.  This change makes Buildroot aware of the new library so that
we install it to the target filesystem.

Signed-off-by: Mark Thompson <mark.thompson@starleaf.com>
---
On 08/03/2019 18:07, Yann E. MORIN wrote:
>> +ifeq ($(BR2_STATIC_LIBS),)
>> +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS
>> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5VirtualKeyboard*.so.* $(TARGET_DIR)/usr/lib
>> +endef
>> +endif
> 
> You said that this new library was introduced with qt-5.12, but here you
> define it unconditionally...
> 
>>  ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>>  define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
>>  	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick/Enterprise
>> @@ -97,6 +103,7 @@ define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
>>  	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
>>  	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so \
>>  		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
>> +	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS)
> 
> ... and here you use it unconditionally, which means that, when qt-5.6
> is enabled, this code will still be used, and thus the copy will be
> attempted, but will fail as the library does not exist in before
> qt-5.12.

Good point, I was only considering the recent 5.11 -> 5.12 change and ignoring that it can still be built with 5.6.

New version enclosing.

Thanks,

- Mark


 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 8ce3169774..ebe0f1e009 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -81,6 +81,11 @@ define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Enterprise/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/Enterprise/
 endef
 else
+ifeq ($(BR2_STATIC_LIBS),)
+define QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5VirtualKeyboard*.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
 define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
 	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/
@@ -97,6 +102,7 @@ define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so \
 		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
+	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS)
 	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML)
 	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS)
 	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
-- 
2.17.1
