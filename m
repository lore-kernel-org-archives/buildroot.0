From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:41 +0200
Subject: [Buildroot] [PATCH 18/23] qt: remove Kconfig option to enable all
	pixel depths
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-19-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Kconfig menu "Pixel depths" of Qt provides a list with all
selectable pixel depths and additionally the option "all".

When "all" is selected, the list with all available pixel depths
disappears.

Because this disappearing of available pixel depths makes no sense
under usability aspects, simply remove the option "all".

The user could enable all available pixel depths by selecting each
individual depth anyway. So no functionality is lost.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 configs/atstk100x_defconfig |    1 -
 configs/v100sc2_defconfig   |    4 +++-
 package/qt/Config.in        |    6 ------
 package/qt/qt.mk            |    5 +----
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 7b6d426..9207895 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -702,7 +702,6 @@ BR2_PACKAGE_QT_GUI_MODULE=y
 #
 # Deselecting each option leads to Qt's default (8,16,32)
 #
-# BR2_PACKAGE_QT_PIXEL_DEPTH_ALL is not set
 # BR2_PACKAGE_QT_PIXEL_DEPTH_1 is not set
 # BR2_PACKAGE_QT_PIXEL_DEPTH_4 is not set
 BR2_PACKAGE_QT_PIXEL_DEPTH_8=y
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index f444951..fcece77 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -550,7 +550,9 @@ BR2_PACKAGE_QT_LICENSE_TYPE_GPL=y
 # BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL is not set
 BR2_PACKAGE_QT_GPL_LICENSE_APPROVED=y
 # BR2_PACKAGE_QT_QT3SUPPORT is not set
-BR2_PACKAGE_QT_DEPTHS="-depths 24,16,8"
+BR2_PACKAGE_QT_PIXEL_DEPTH_8=y
+BR2_PACKAGE_QT_PIXEL_DEPTH_16=y
+BR2_PACKAGE_QT_PIXEL_DEPTH_24=y
 BR2_PACKAGE_QT_GIF=y
 # BR2_PACKAGE_QT_LIBMNG is not set
 # BR2_PACKAGE_QT_NOJPEG is not set
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 48efac2..5ab2dde 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -87,11 +87,6 @@ if BR2_PACKAGE_QT_GUI_MODULE
 menu "Pixel depths"
 comment "Deselecting each option leads to Qt's default (8,16,32)"
 
-config BR2_PACKAGE_QT_PIXEL_DEPTH_ALL
-	bool "All supported depths"
-
-if !BR2_PACKAGE_QT_PIXEL_DEPTH_ALL
-
 config BR2_PACKAGE_QT_PIXEL_DEPTH_1
 	bool "1 bpp, black/white"
 
@@ -122,7 +117,6 @@ config BR2_PACKAGE_QT_PIXEL_DEPTH_32
 	bool "32 bpp, argb 8-8-8-8 and rgb 8-8-8"
 	default y
 
-endif
 endmenu
 endif
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a747b40..8f831ae 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -62,9 +62,7 @@ endif
 
 
 ### Pixel depths
-ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_ALL),y)
-QT_PIXEL_DEPTHS = all
-else
+QT_PIXEL_DEPTHS := # empty
 ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_1),y)
 QT_PIXEL_DEPTHS += 1
 endif
@@ -92,7 +90,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_32),y)
 QT_PIXEL_DEPTHS += 32
 endif
-endif
 ifneq ($(QT_PIXEL_DEPTHS),)
 QT_CONFIGURE += -depths $(subst $(space),$(comma),$(strip $(QT_PIXEL_DEPTHS)))
 endif
-- 
1.6.3.3
