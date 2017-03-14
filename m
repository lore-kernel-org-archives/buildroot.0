From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 14 Mar 2017 17:31:16 -0400
Subject: [Buildroot] [PATCH v2] qt: add enable for truetype font installation
Message-ID: <1489527076-12172-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Changes V1->V2:
  - Drop detailed explanation from commit log.  (Peter Seiderer)
  - Rename option from ..DEJAVU to ..TRUETYPE.  (Peter Seiderer)
  - Replace depends-on test with equivalent but more verbose expression  (Peter Seiderer)
---
 package/qt/Config.in | 8 ++++++++
 package/qt/qt.mk     | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index fa5235d..294df0e 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -185,6 +185,14 @@ endmenu
 
 menu "Fonts"
 
+config BR2_PACAKGE_QT_FONT_TRUETYPE
+	bool "dejavu/vera"
+	depends on BR2_PACKAGE_QT_QTFREETYPE || BR2_PACKAGE_QT_SYSTEMFREETYPE
+	default y
+
+comment "dejavu/vera fonts need freetype support"
+	depends on !BR2_PACKAGE_QT_QTFREETYPE && !BR2_PACKAGE_QT_SYSTEMFREETYPE
+
 config BR2_PACKAGE_QT_FONT_MICRO
 	bool "micro"
 	default y
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e82bdfe8..cc478f1 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -689,7 +689,7 @@ QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.Unifont
 endif
 endif # QT_FONTS
 
-ifeq ($(BR2_PACKAGE_QT_QTFREETYPE)$(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
+ifeq ($(BR2_PACAKGE_QT_FONT_TRUETYPE),y)
 define QT_INSTALL_TARGET_FONTS_TTF
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
-- 
2.7.4
