From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Feb 2016 22:52:56 +0100
Subject: [Buildroot] [PATCH v2] qt: add font license information
Message-ID: <1456264376-28974-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - update most font licenses (thanks to Arnout Vandecappelle)
  - add comma-separator between the licenses (no nice solution,
    will add ' ,', but without the starting problem at:

    QT_LICENSE = LGPLv2.1 with exceptions or GPLv3
    ifneq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
    QT_LICENSE += or Digia Qt Commercial license
    endif
---
 package/qt/qt.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a64d32f..beadb41 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -660,13 +660,33 @@ define QT_INSTALL_TARGET_FONTS
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
 endef
+ifeq ($(BR2_PACKAGE_QT_FONT_MICRO),y)
+# Public Domain as stated in the font source src/3rdparty/fonts/micro.bdf
+QT_LICENSE += , Public Domain (Micro font)
 endif
+ifeq ($(BR2_PACKAGE_QT_FONT_FIXED),y)
+# according to https://launchpad.net/ubuntu/vivid/+source/qtbase-opensource-src/+copyright
+QT_LICENSE += , Public Domain (Fixed font)
+endif
+ifneq ($(BR2_PACKAGE_QT_FONT_HELVETICA)$(BR2_PACKAGE_QT_FONT_JAPANESE),)
+QT_LICENSE += , Adobe Helvetica license (Helvetica/Japanese fonts)
+QT_LICENSE_FILES += src/3rdparty/fonts/COPYING.Helvetica
+endif
+ifeq ($(BR2_PACKAGE_QT_FONT_UNIFONT),y)
+QT_LICENSE += , Freeware (Unifont font)
+QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.Unifont
+endif
+endif # QT_FONTS
 
 ifeq ($(BR2_PACKAGE_QT_QTFREETYPE)$(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
 define QT_INSTALL_TARGET_FONTS_TTF
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
 endef
+QT_LICENSE += , Bitstream license (DejaVu/Vera TrueType fonts)
+QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.DejaVu \
+	src/3rdparty/fonts/README.DejaVu \
+	src/3rdparty/fonts/COPYRIGHT.Vera
 endif
 endif # BR2_PACKAGE_QT_EMBEDDED
 
-- 
2.1.4
