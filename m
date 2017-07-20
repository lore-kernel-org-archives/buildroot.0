From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 20 Jul 2017 16:33:29 -0700
Subject: [Buildroot] [PATCH] package/qt5location: handle plugins being
	conditionally built
Message-ID: <1500593609-5610-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes a build issue where the qt5location plugins are not built, but are
attempted to be installed.

The qt5location plugins have dependencies that are automatically resolved
causing plugins to conditionaly be built. This change checks for the existance
of the plugins prior to trying to install them.

Fixes:

    http://autobuild.buildroot.net/results/bc1/bc13abf3bb2fe1c991aec2334ee658c9641d1fd5/build-end.log

Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 package/qt5/qt5location/qt5location.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index e9f1e4d..fcd9fc8 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -48,7 +48,9 @@ endif
 
 define QT5LOCATION_INSTALL_TARGET_POSITION
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Positioning.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/position $(TARGET_DIR)/usr/lib/qt/plugins/
+	if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/position ] ; then \
+		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/position $(TARGET_DIR)/usr/lib/qt/plugins/ ; \
+	fi
 endef
 
 define QT5LOCATION_INSTALL_TARGET_CMDS
-- 
2.7.4
