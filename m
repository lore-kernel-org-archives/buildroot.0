From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Dec 2009 17:29:59 +0100
Subject: [Buildroot] [git commit master] package/qt: add font selection
Message-ID: <20091214163129.C79737777C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4e272254c7b53d656af1700a6795ae5299797d0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f98547622 (make sure to install all Qt-fonts and true-type-fonts)
changed Qt to install all .qpf fonts to the target instead of only a
hardcoded subset. Some of those fonts are unfortunately quite big (1-2MB)
and are not always needed (japanese, unicode).

Instead add a font selection in Kconfig similar to how it is done for
pixel depths, and default to the subset we were previously using.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in |   72 ++++++++++++++++++++++++++++++++------------------
 package/qt/qt.mk     |   12 +++++++-
 2 files changed, 57 insertions(+), 27 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 3f8c929..ad5b543 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -101,6 +101,52 @@ config BR2_PACKAGE_QT_PIXEL_DEPTH_32
 
 endmenu
 
+menu "Fonts"
+
+config BR2_PACKAGE_QT_FONT_MICRO
+	bool "micro"
+	default y
+
+config BR2_PACKAGE_QT_FONT_FIXED
+	bool "fixed"
+	default y
+
+config BR2_PACKAGE_QT_FONT_HELVETICA
+	bool "helvetica"
+	default y
+
+config BR2_PACKAGE_QT_FONT_JAPANESE
+	bool "japanese"
+
+config BR2_PACKAGE_QT_FONT_UNIFONT
+	bool "unicode"
+
+endmenu
+
+choice
+	prompt "freetype2 support"
+	default BR2_PACKAGE_QT_NOFREETYPE
+	help
+	  Select freetype2 support.
+
+config BR2_PACKAGE_QT_NOFREETYPE
+	bool "no freetype2 support"
+	help
+	  Do not compile in Freetype2 support.
+
+config BR2_PACKAGE_QT_QTFREETYPE
+	bool "Qt freetype2"
+	help
+	  Use the libfreetype bundled with Qt.
+
+config BR2_PACKAGE_QT_SYSTEMFREETYPE
+	bool "System freetype2"
+	select BR2_PACKAGE_FREETYPE
+	help
+	  Use shared libfreetype from the target system.
+	  See http://www.freetype.org/
+endchoice
+
 config BR2_PACKAGE_QT_GIF
 	bool "Enable GIF support"
 	help
@@ -188,32 +234,6 @@ config BR2_PACKAGE_QT_SYSTEMZLIB
 	  Use the shared zlib from the system.
 endchoice
 
-choice
-	prompt "freetype2 support"
-	depends on BR2_PACKAGE_QT_GUI_MODULE
-	default BR2_PACKAGE_QT_NOFREETYPE
-	help
-	  Select freetype2 support.
-
-config BR2_PACKAGE_QT_NOFREETYPE
-	bool "no freetype2 support"
-	help
-	  Do not compile in Freetype2 support.
-
-
-config BR2_PACKAGE_QT_QTFREETYPE
-	bool "Qt freetype2"
-	help
-	  Use the libfreetype bundled with Qt.
-
-config BR2_PACKAGE_QT_SYSTEMFREETYPE
-	bool "System freetype2"
-	select BR2_PACKAGE_FREETYPE
-	help
-	  Use shared libfreetype from the target system.
-	  See http://www.freetype.org/
-endchoice
-
 config BR2_PACKAGE_QT_EMB_PLATFORM
 	string "The embedded platform we are making Qt for"
 	default "arm"	if BR2_arm
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 3d58f1f..d69930b 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -220,6 +220,14 @@ endif
 endif
 
 
+QT_FONTS = $(addprefix $(STAGING_DIR)/usr/lib/fonts/, $(addsuffix *.qpf, \
+	   $(if $(BR2_PACKAGE_QT_FONT_MICRO),micro) \
+	   $(if $(BR2_PACKAGE_QT_FONT_FIXED),fixed) \
+	   $(if $(BR2_PACKAGE_QT_FONT_HELVETICA),helvetica) \
+	   $(if $(BR2_PACKAGE_QT_FONT_JAPANESE),japanese) \
+	   $(if $(BR2_PACKAGE_QT_FONT_UNIFONT),unifont)))
+
+
 ifeq ($(BR2_PACKAGE_QT_QTFREETYPE),y)
 QT_CONFIGURE+= -qt-freetype
 else
@@ -445,7 +453,9 @@ $(STAGING_DIR)/usr/lib/libQtCore.la: $(QT_TARGET_DIR)/.compiled
 
 qt-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
-	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.qpf $(TARGET_DIR)/usr/lib/fonts
+ifneq ($(QT_FONTS),)
+	cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
+endif
 ifneq ($(BR2_PACKAGE_QT_NOFREETYPE),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
 endif
-- 
1.6.3.3
