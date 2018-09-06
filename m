From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 20:58:05 +0200
Subject: [Buildroot] [git commit] qt5virtualkeyboard: fix target install
 issue with Qt 5.6
Message-ID: <20180906185744.3547382AFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0a0e1d72b5222843d24013504f3933f04538c51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5virtualkeyboard 2.0 (shipped with Qt 5.6) installs the QML plugin
under the directory Enterprise while the later versions install it
without that directory.

Differentiate installation to target of the QML plugin according to
the Qt major version in use.

Also, make sure the /usr/qml/QtQuick directory exists before the copy.

Fixes:

	>>> qt5virtualkeyboard 2.0 Installing to target
	mkdir -p /home/gportay/src/buildroot/output/target/usr/lib/qt/plugins/platforminputcontexts
	cp -dpfr /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so /home/gportay/src/buildroot/output/target/usr/lib/qt/plugins/platforminputcontexts
	cp -dpfr /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/qml/QtQuick/VirtualKeyboard /home/gportay/src/buildroot/output/target/usr/qml/QtQuick
	cp: cannot stat '/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/qml/QtQuick/VirtualKeyboard': No such file or directory
	package/pkg-generic.mk:310: recipe for target '/home/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/.stamp_target_installed' failed
	make: *** [/home/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/.stamp_target_installed] Error 1

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 8d26394c96..4aa5fc9575 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -71,6 +71,18 @@ define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
+	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick/Enterprise
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Enterprise/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/Enterprise/
+endef
+else
+define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
+	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 define QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/virtualkeyboard $(TARGET_DIR)/usr/lib/qt/examples/
@@ -81,7 +93,7 @@ define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so \
 		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
+	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML)
 	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS)
 	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
 endef
