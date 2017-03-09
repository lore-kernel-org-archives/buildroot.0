From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed,  8 Mar 2017 20:35:48 -0500
Subject: [Buildroot] [PATCH 1/1] qt: add enable for truetype font
	installation
Message-ID: <1489023348-1796-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, qt.mk installs DejaVu/Vera TrueType fonts if freetype
support is available, either from Qt or from the system freetype.
However, there are lots of fonts that can be used with Qt, both
within Qt (the prerendered fonts) and outside of Qt (in buildroot's
font area). So it seems appropriate to expose a switch to enable
the installation of the TrueType fonts, conditioned on freetype
availability. At least, it provides a similar level of selectability
as already exists with the prerendered fonts (micro, fixed, helvetica,
etc.), and in some cases may solve problems where setting fonts
by family and attribute is complicated by DejaVu competing with
fonts that were actually selected in the buildroot menu.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/qt/Config.in | 8 ++++++++
 package/qt/qt.mk     | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index fa5235d..ac9cd18 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -185,6 +185,14 @@ endmenu
 
 menu "Fonts"
 
+config BR2_PACKAGE_QT_FONT_DEJAVU
+	bool "dejavu/vera"
+	depends on !BR2_PACKAGE_QT_NOFREETYPE
+	default y
+
+comment "dejavu/vera fonts need freetype support"
+	depends on BR2_PACKAGE_QT_NOFREETYPE
+
 config BR2_PACKAGE_QT_FONT_MICRO
 	bool "micro"
 	default y
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 29dcc46..35f16b1 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -692,7 +692,7 @@ QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.Unifont
 endif
 endif # QT_FONTS
 
-ifeq ($(BR2_PACKAGE_QT_QTFREETYPE)$(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
+ifeq ($(BR2_PACKAGE_QT_FONT_DEJAVU),y)
 define QT_INSTALL_TARGET_FONTS_TTF
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
-- 
2.7.4
