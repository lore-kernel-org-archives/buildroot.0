From: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
Date: Wed, 17 Oct 2018 00:58:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5location: copy PositioningQuick.so*
 for QtQuick
Message-ID: <20181016225855.GA17104@blarch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Location module for QtQuick depends on this library, which was not
being copied in the build rule.

Signed-off-by: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
---
Changes v1 -> v2:
	- only do the copy for latest Qt (5.11) (suggested by Peter Seiderer)

 package/qt5/qt5location/qt5location.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 18253e9..da0aad7 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -44,6 +44,11 @@ define QT5LOCATION_INSTALL_TARGET_LOCATION
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Location.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geoservices $(TARGET_DIR)/usr/lib/qt/plugins/
 endef
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+define QT5LOCATION_INSTALL_TARGET_POSITION_QUICK
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5PositioningQuick.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 define QT5LOCATION_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/location $(TARGET_DIR)/usr/lib/qt/examples/
@@ -59,6 +64,7 @@ endef
 
 define QT5LOCATION_INSTALL_TARGET_CMDS
 	$(QT5LOCATION_INSTALL_TARGET_POSITION)
+	$(QT5LOCATION_INSTALL_TARGET_POSITION_QUICK)
 	$(QT5LOCATION_INSTALL_TARGET_LOCATION)
 	$(QT5LOCATION_INSTALL_TARGET_QMLS)
 	$(QT5LOCATION_INSTALL_TARGET_EXAMPLES)
-- 
2.19.1
