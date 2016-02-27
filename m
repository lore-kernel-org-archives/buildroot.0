From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 11:55:33 +0100
Subject: [Buildroot] [git commit] qt: add font license information
Message-ID: <20160227105929.E23548082E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c50ef102a3418c8a5989e2cfbaef482099a4b3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this implementation, the different licenses will be separated with
<space><comma>. This is not nice, but to avoid it a pretty ugly construct
is needed:

QT_LICENSE = $(shell echo $(QT_LICENSE_BITS) | sed 's% , %, %g')

Since the <space><comma> is just a minor nuisance, we're not going to that kind
of complexity.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/qt.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a64d32f..c4fff2d 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -660,13 +660,30 @@ define QT_INSTALL_TARGET_FONTS
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
 endef
+ifneq ($(BR2_PACKAGE_QT_FONT_MICRO)$(BR2_PACKAGE_QT_FONT_FIXED),)
+# as stated in the font source src/3rdparty/fonts/micro.bdf
+# source src/3rdparty/fonts/5x7.bdf and source src/3rdparty/fonts/6x13.bdf
+QT_LICENSE += , Public Domain (Micro/Fixed font)
 endif
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
 
