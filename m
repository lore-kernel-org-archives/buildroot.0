From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:17:44 +0100
Subject: [Buildroot] [git commit] qt: add enable for truetype font
	installation
Message-ID: <20170325141802.5BFB48257D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f48f1a89a0c598ebefd2643af3ad6aff981e291c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, qt.mk installs DejaVu/Vera TrueType fonts when Qt is configured for
freetype support. However, some users may prefer to limit the installed fonts
to only Qt's prerendered fonts (micro, fixed, helvetica, etc.). Or, there may
be a preference to use seperately installed TrueType fonts. This commit adds
a switch to explicitly control the installation of the TrueType fonts, similar
to the existing prerendered font enables.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 8 ++++++++
 package/qt/qt.mk     | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index fa5235d..a761759 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -185,6 +185,14 @@ endmenu
 
 menu "Fonts"
 
+config BR2_PACKAGE_QT_FONT_TRUETYPE
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
index e82bdfe8..1faab74 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -689,7 +689,7 @@ QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.Unifont
 endif
 endif # QT_FONTS
 
-ifeq ($(BR2_PACKAGE_QT_QTFREETYPE)$(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
+ifeq ($(BR2_PACKAGE_QT_FONT_TRUETYPE),y)
 define QT_INSTALL_TARGET_FONTS_TTF
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
