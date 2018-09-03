From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon,  3 Sep 2018 08:37:45 -0400
Subject: [Buildroot] [PATCH v1 2/4] qt5virtualkeyboard: fix target install
 issue with 5.6
In-Reply-To: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
References: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180903123747.5234-3-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5virtualkeyboard 2.0 (shipped with Qt 5.6) installs the QML plugin
under the directory Enterprise while the later versions install it
without that directory.

Differentiate installation to target of the QML plugin according to the
Qt major version in use.

Fixes:

	>>> qt5virtualkeyboard 2.0 Installing to target
	mkdir -p /home/gportay/src/buildroot/output/target/usr/lib/qt/plugins/platforminputcontexts
	cp -dpfr /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so /home/gportay/src/buildroot/output/target/usr/lib/qt/plugins/platforminputcontexts
	cp -dpfr /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/qml/QtQuick/VirtualKeyboard /home/gportay/src/buildroot/output/target/usr/qml/QtQuick
	cp: cannot stat '/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/qml/QtQuick/VirtualKeyboard': No such file or directory
	package/pkg-generic.mk:310: recipe for target '/home/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/.stamp_target_installed' failed
	make: *** [/home/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/.stamp_target_installed] Error 1

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index cbe24d27dc..a4c9492a91 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -65,6 +65,16 @@ define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Entreprise/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
+endef
+else
+define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 define QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/virtualkeyboard $(TARGET_DIR)/usr/lib/qt/examples/
@@ -75,7 +85,7 @@ define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so \
 		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
+	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_QML)
 	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS)
 	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
 endef
-- 
2.11.0
