From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon, 11 Jun 2018 09:56:55 -0400
Subject: [Buildroot] [PATCH] qt53d: fix install issue with qt5.6
Message-ID: <20180611135655.22300-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both plugins `geometryloaders' and `renderplugins' are available since
Qt 5.9.

Fixes:

	>>> qt53d 5.6.3 Installing to target
	cp -dpf /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt53D*.so.*
/home/gportay/src/buildroot/output/target/usr/lib
	cp -dpfr /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/plugins/geometryloaders
/home/gportay/src/buildroot/output/target/usr/lib/qt/plugins
	cp: cannot stat '/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/qt/plugins/geometryloaders': No such file or directory
	package/pkg-generic.mk:310: recipe for target '/home/gportay/src/buildroot/output/build/qt53d-5.6.3/.stamp_target_installed' failed
	make[2]: *** [/home/gportay/src/buildroot/output/build/qt53d-5.6.3/.stamp_target_installed] Error 1

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt53d/qt53d.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 6896b00318..48a931d60b 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -37,13 +37,19 @@ endef
 endif
 
 ifeq ($(BR2_STATIC_LIBS),)
-define QT53D_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+# Available since 5.9
+define QT53D_INSTALL_TARGET_LATEST
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geometryloaders $(TARGET_DIR)/usr/lib/qt/plugins
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/renderplugins $(TARGET_DIR)/usr/lib/qt/plugins
+endef
+endif
+define QT53D_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sceneparsers $(TARGET_DIR)/usr/lib/qt/plugins
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt3D $(TARGET_DIR)/usr/qml
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick $(TARGET_DIR)/usr/qml
+	$(QT53D_INSTALL_TARGET_LATEST)
 	$(QT53D_INSTALL_TARGET_EXAMPLES)
 endef
 endif
-- 
2.11.0
