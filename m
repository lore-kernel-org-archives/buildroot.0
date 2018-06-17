From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:35:05 +0200
Subject: [Buildroot] [git commit] qt5location: install examples to target
Message-ID: <20180617123958.6C976888A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f8bfba3655ccee69c2c16f0aeefc7afeec83483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `location' and `positioning' from the
staging directory to the target.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5location/qt5location.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 05cd1168a3..18253e9965 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -44,6 +44,12 @@ define QT5LOCATION_INSTALL_TARGET_LOCATION
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Location.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geoservices $(TARGET_DIR)/usr/lib/qt/plugins/
 endef
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5LOCATION_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/location $(TARGET_DIR)/usr/lib/qt/examples/
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/positioning $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
 endif
 
 define QT5LOCATION_INSTALL_TARGET_POSITION
@@ -55,6 +61,7 @@ define QT5LOCATION_INSTALL_TARGET_CMDS
 	$(QT5LOCATION_INSTALL_TARGET_POSITION)
 	$(QT5LOCATION_INSTALL_TARGET_LOCATION)
 	$(QT5LOCATION_INSTALL_TARGET_QMLS)
+	$(QT5LOCATION_INSTALL_TARGET_EXAMPLES)
 endef
 
 $(eval $(generic-package))
