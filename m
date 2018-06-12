From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Tue, 12 Jun 2018 08:31:59 -0400
Subject: [Buildroot] [PATCH 2/9] qt5location: install examples to target
In-Reply-To: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
References: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180612123206.31523-3-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `location' and `positioning' from the
staging directory to the target.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
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
-- 
2.17.1
