From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:23:06 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5virtualkeyboard: install
 shared library
Message-ID: <20190314212112.7C59A885A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ecadf14d65b84b9a5b4a37bd17c2c65e4906cbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Between Qt 5.11 and 5.12 the virtual keyboard package gained a new
top-level library, libQt5VirtualKeyboard.so, which is then used by all
of the plugins it installs. This change makes Buildroot aware of the
new library so that we install it to the target filesystem.

Signed-off-by: Mark Thompson <mark.thompson@starleaf.com>
[Thomas: move the definition of QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS
into a separate condition]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 8ce3169774..3f1ebdbaa4 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -93,10 +93,17 @@ define QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST):$(BR2_STATIC_LIBS),y:)
+define QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5VirtualKeyboard*.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
 define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so \
 		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
+	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS)
 	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML)
 	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS)
 	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
