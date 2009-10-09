From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: make sure to install all
	Qt-fonts and true-type-fonts
Message-ID: <20091009130116.8DDB777784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f9854762255617f49b08e5d5a87f76638b9a5701
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt gained some more qpf-fonts and also provides some true-type-fonts.
Make sure to install them all inclusive ttf-fonts when freetype-support
is enabled. Additionally the empty 'fontdir' file is really not needed.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a4ca3a9..37849f9 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -455,10 +455,10 @@ $(STAGING_DIR)/usr/lib/libQtCore.la: $(QT_TARGET_DIR)/.compiled
 
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
