From: James Knight <james.d.knight@live.com>
Date: Wed, 24 Jun 2015 08:59:32 -0400
Subject: [Buildroot] [PATCH 1/1] google-material-design-icons: new package
Message-ID: <BLU436-SMTP9129508AA06E650D8450A5A0AF0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/Config.in                                  |   1 +
 package/google-material-design-icons/Config.in     | 101 +++++++++++++++++++++
 .../google-material-design-icons.hash              |   2 +
 .../google-material-design-icons.mk                |  79 ++++++++++++++++
 4 files changed, 183 insertions(+)
 create mode 100644 package/google-material-design-icons/Config.in
 create mode 100644 package/google-material-design-icons/google-material-design-icons.hash
 create mode 100644 package/google-material-design-icons/google-material-design-icons.mk

diff --git a/package/Config.in b/package/Config.in
index fac632f..5cf41e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1125,6 +1125,7 @@ menu "Miscellaneous"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
+	source "package/google-material-design-icons/Config.in"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
diff --git a/package/google-material-design-icons/Config.in b/package/google-material-design-icons/Config.in
new file mode 100644
index 0000000..26f4a0d
--- /dev/null
+++ b/package/google-material-design-icons/Config.in
@@ -0,0 +1,101 @@
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
+	bool "google-material-design-icons"
+	help
+	  Material design icons are the official icon set from Google that
+	  are designed under the material design guidelines.
+
+	  https://github.com/google/material-design-icons
+
+if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS
+
+choice
+	bool "Icon type"
+	default BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG
+	help
+	  Choose the icon type to install on the target system.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG
+	bool "png"
+	help
+	  Use PNG icon types.
+
+	  The default. Traditional format; simplicity and compatibility.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG
+	bool "svg"
+	help
+	  Use SVG icon types.
+
+	  Vector format that is limitlessly scalable.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_NONE
+	bool "none"
+	help
+	  Do not install icons.
+
+	  Select this option if you want to only use other components
+	  available in the google-material-design-icons package.
+
+endchoice # Type selection.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE
+	string
+	default "png"  if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG
+	default "svg"  if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_NONE
+	default "none" if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_NONE
+
+if !BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_NONE
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_LIST
+	string "list of icons to install"
+	default "action alert av communication content device editor file hardware image maps navigation notification social toggle"
+	help
+	  Specify a space-separated list of icon groups to install.
+
+endif
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_FONT
+	bool "Install TrueType font"
+	default n
+	help
+	  Install the Material TrueType font (ttf) on the target system.
+
+choice
+	bool "Sprites"
+	default BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_NONE
+	help
+	  Choose the icon type to install on the target system.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_NONE
+	bool "none"
+	help
+	  Do not install Material sprites on the target system.
+
+	  The default. Material icon sprites are useful for html-based
+	  development.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS
+	bool "css"
+	help
+	  Install CSS (PNG) spritesheets.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG
+	bool "svg"
+	help
+	  Install SVG spritesheets.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS_SVG
+	bool "css_svg"
+	help
+	  Install CSS (PNG) and SVG spritesheets.
+
+endchoice # Type selection.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_TYPE
+	string
+	default "none"    if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_NONE
+	default "css"     if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS
+	default "svg"     if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG
+	default "css_svg" if BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS_SVG
+
+endif
diff --git a/package/google-material-design-icons/google-material-design-icons.hash b/package/google-material-design-icons/google-material-design-icons.hash
new file mode 100644
index 0000000..7bcfcb5
--- /dev/null
+++ b/package/google-material-design-icons/google-material-design-icons.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  87d7c8515207edecd3438a96bdf5129df91e0b29261d5f8c52f672957c11af65  2.0.0.tar.gz
diff --git a/package/google-material-design-icons/google-material-design-icons.mk b/package/google-material-design-icons/google-material-design-icons.mk
new file mode 100644
index 0000000..f8b447f
--- /dev/null
+++ b/package/google-material-design-icons/google-material-design-icons.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# google-material-design-icons
+#
+################################################################################
+
+GOOGLE_MATERIAL_DESIGN_ICONS_VERSION = 2.0.0
+GOOGLE_MATERIAL_DESIGN_ICONS_SOURCE = \
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_VERSION).tar.gz
+GOOGLE_MATERIAL_DESIGN_ICONS_SITE = \
+	https://github.com/google/material-design-icons/archive
+GOOGLE_MATERIAL_DESIGN_ICONS_LICENSE = CC-BY-4.0
+GOOGLE_MATERIAL_DESIGN_ICONS_LICENSE_FILES = LICENSE
+
+GOOGLE_MATERIAL_DESIGN_ICONS_LIST = \
+	$(call qstrip,$(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_LIST))
+
+ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG),y)
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS
+	@for i in $(GOOGLE_MATERIAL_DESIGN_ICONS_LIST); \
+	do \
+		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/$$i || exit 1; \
+		$(INSTALL) -D -m 0644 $(@D)/$$i/1x_web/*.png \
+			$(TARGET_DIR)/usr/share/google-material/$$i || exit 1; \
+	done
+endef
+else ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG),y)
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS
+	@for i in $(GOOGLE_MATERIAL_DESIGN_ICONS_LIST); \
+	do \
+		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/$$i || exit 1; \
+		$(INSTALL) -D -m 0644 $(@D)/$$i/svg/production/*.svg \
+			$(TARGET_DIR)/usr/share/google-material/$$i || exit 1; \
+	done
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_FONT),y)
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_FONT
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/google-material
+	$(INSTALL) -D -m 0644 $(@D)/iconfont/MaterialIcons-Regular.ttf \
+		$(TARGET_DIR)/usr/share/fonts/google-material
+endef
+endif
+
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_CSS
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/css-sprite
+	$(INSTALL) -D -m 0644 $(@D)/sprites/css-sprite/* \
+		$(TARGET_DIR)/usr/share/google-material/css-sprite
+endef
+
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_SVG
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/svg-sprite
+	$(INSTALL) -D -m 0644 $(@D)/sprites/svg-sprite/* \
+		$(TARGET_DIR)/usr/share/google-material/svg-sprite
+endef
+
+ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS),y)
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_CSS)
+endef
+else ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG),y)
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_SVG)
+endef
+else ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS_SVG),y)
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_CSS)
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES_SVG)
+endef
+endif
+
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_TARGET_CMDS
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS)
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_FONT)
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES)
+endef
+
+$(eval $(generic-package))
-- 
1.9.5.msysgit.1
