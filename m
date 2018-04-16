From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 17:45:39 +0200
Subject: [Buildroot] [git commit] qt53d: install missing QML modules,
 plugins and examples
Message-ID: <20180416154615.0C8B9812F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fd448c9c1e3ed7ca0f09441bf8a854eb9130190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some files were missing on the first build of qt53d but added later:
- by qt5base for the plugins because it copies the whole /usr/lib/qt/plugins
  directory
- by qt5declarative for the QML modules because it copies the whole
  /usr/qml directory

Also, the qt53d examples were not installed if
BR2_PACKAGE_QT5BASE_EXAMPLES was set.

Signed-off-by: Romain Reignier <rom.reignier@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt53d/qt53d.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index d5a3a8edcc..6896b00318 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -30,11 +30,21 @@ define QT53D_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT53D_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/qt3d $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
 ifeq ($(BR2_STATIC_LIBS),)
 define QT53D_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geometryloaders $(TARGET_DIR)/usr/lib/qt/plugins
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/renderplugins $(TARGET_DIR)/usr/lib/qt/plugins
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sceneparsers $(TARGET_DIR)/usr/lib/qt/plugins
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt3D $(TARGET_DIR)/usr/qml
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick $(TARGET_DIR)/usr/qml
+	$(QT53D_INSTALL_TARGET_EXAMPLES)
 endef
 endif
 
