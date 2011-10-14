From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 14 Oct 2011 15:51:59 +0100
Subject: [Buildroot] [PATCH 7/9] Improve Qt ttf support
In-Reply-To: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1318603921-22899-8-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a config option to only copy specific fonts onto the target rather than all true type fonts

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/qt/Config.in |   13 +++++++++++++
 package/qt/qt.mk     |    8 +++++++-
 2 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 4640937..9b0d4d2 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -166,6 +166,19 @@ config BR2_PACKAGE_QT_FONT_JAPANESE
 config BR2_PACKAGE_QT_FONT_UNIFONT
 	bool "unicode"
 
+config BR2_PACKAGE_QT_FONT_ALL_TRUETYPE
+	bool "install all truetype fonts"
+	depends on !BR2_PACKAGE_QT_NOFREETYPE
+	default y
+
+config BR2_PACKAGE_QT_FONT_DEJAVU
+	bool "dejavu ttf"
+	depends on !BR2_PACKAGE_QT_NOFREETYPE && !BR2_PACKAGE_QT_FONT_ALL_TRUETYPE
+
+config BR2_PACKAGE_QT_FONT_VERA
+	bool "vera ttf"
+	depends on !BR2_PACKAGE_QT_NOFREETYPE && !BR2_PACKAGE_QT_FONT_ALL_TRUETYPE
+
 endmenu
 
 choice
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 78d821a..1137218 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -303,6 +303,10 @@ QT_FONTS = $(addprefix $(STAGING_DIR)/usr/lib/fonts/, $(addsuffix *.qpf, \
 	   $(if $(BR2_PACKAGE_QT_FONT_JAPANESE),japanese) \
 	   $(if $(BR2_PACKAGE_QT_FONT_UNIFONT),unifont)))
 
+QT_FONTS += $(addprefix $(STAGING_DIR)/usr/lib/fonts/, $(addsuffix *.ttf, \
+          $(if $(BR2_PACKAGE_QT_FONT_DEJAVU),DejaVu) \
+          $(if $(BR2_PACKAGE_QT_FONT_VERA),Vera)))
+
 ifeq ($(BR2_PACKAGE_QT_QTFREETYPE),y)
 QT_CONFIGURE_OPTS += -qt-freetype
 else
@@ -647,19 +651,21 @@ define QT_INSTALL_TARGET_PLUGINS
 endef
 
 # Fonts installation
-ifneq ($(QT_FONTS),)
+ifneq ($(strip $(QT_FONTS)),)
 define QT_INSTALL_TARGET_FONTS
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT_FONT_ALL_TRUETYPE),y)
 ifeq ($(BR2_PACKAGE_QT_QTFREETYPE)$(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
 define QT_INSTALL_TARGET_FONTS_TTF
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
 endef
 endif
+endif
 
 define QT_INSTALL_TARGET_CMDS
 	$(QT_INSTALL_TARGET_LIBS)
-- 
1.7.2.5
