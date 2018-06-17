From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:58:30 +0200
Subject: [Buildroot] [git commit] qt53d: fix install issue with qt5.6
Message-ID: <20180617125618.0C550883BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e922bbc7aef31267bea730a1d4a98ec2eabdf761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Ga??l PORTAY &lt;<a href="mailto:gael.portay@savoirfairelinux.com" target="_blank" rel="noreferrer">gael.portay at savoirfairelinux.com</a>&gt;<br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
