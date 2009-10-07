From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:38 +0200
Subject: [Buildroot] [PATCH 15/23] qt: make sure to install all Qt-fonts and
	true-type-fonts
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-16-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt gained some more qpf-fonts and also provides some true-type-fonts.
Make sure to install them all inclusive ttf-fonts when freetype-support
is enabled. Additionally the empty 'fontdir' file is really not needed.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ca6ae6b..f1e845e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -469,10 +469,10 @@ $(STAGING_DIR)/usr/lib/libQtCore.la: $(QT_TARGET_DIR)/.compiled
 
 qt-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
-	touch $(TARGET_DIR)/usr/lib/fonts/fontdir
-	cp -dpf $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
-	cp -dpf $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
-	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.qpf $(TARGET_DIR)/usr/lib/fonts
+ifneq ($(BR2_PACKAGE_QT_NOFREETYPE),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
+endif
 	# Install image plugins if they are built
 	$(call QT_INSTALL_PLUGINS,imageformats)
 ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-- 
1.6.3.3
