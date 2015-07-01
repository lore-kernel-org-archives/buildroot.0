From: James Knight <james.d.knight@live.com>
Date: Tue, 30 Jun 2015 23:17:54 -0400
Subject: [Buildroot] [PATCH v2 1/1] google-material-design-icons: new package
In-Reply-To: <20150628232431.3d1ea7af@free-electrons.com.>
References: <20150628232431.3d1ea7af@free-electrons.com.>
Message-ID: <BLU437-SMTP141B2B324B33F6E9C3B2F8A0A80@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/Config.in                                  |  1 +
 package/google-material-design-icons/Config.in     | 40 ++++++++++++++
 .../google-material-design-icons.hash              |  2 +
 .../google-material-design-icons.mk                | 63 ++++++++++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 package/google-material-design-icons/Config.in
 create mode 100644 package/google-material-design-icons/google-material-design-icons.hash
 create mode 100644 package/google-material-design-icons/google-material-design-icons.mk

diff --git a/package/Config.in b/package/Config.in
index 477cc47..13a7e74 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -188,6 +188,7 @@ comment "Fonts"
 
 comment "Icons"
 	source "package/adwaita-icon-theme/Config.in"
+	source "package/google-material-design-icons/Config.in"
 	source "package/hicolor-icon-theme/Config.in"
 
 comment "Sounds"
diff --git a/package/google-material-design-icons/Config.in b/package/google-material-design-icons/Config.in
new file mode 100644
index 0000000..a200429
--- /dev/null
+++ b/package/google-material-design-icons/Config.in
@@ -0,0 +1,40 @@
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
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG
+	bool "Install PNG icons"
+	help
+	  Use PNG icon types.
+
+	  The default. Traditional format; simplicity and compatibility.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG
+	bool "Install SVG icons"
+	help
+	  Use SVG icon types.
+
+	  Vector format that is limitlessly scalable.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_FONT
+	bool "Install TrueType font"
+	help
+	  Install the Material TrueType font (ttf) on the target system.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS
+	bool "Install CSS sprites"
+	help
+	  Install CSS (PNG) spritesheets.
+
+config BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG
+	bool "Install SVG sprites"
+	help
+	  Install SVG spritesheets.
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
index 0000000..b1f9cd5
--- /dev/null
+++ b/package/google-material-design-icons/google-material-design-icons.mk
@@ -0,0 +1,63 @@
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
+	action alert av communication content device editor file \
+	hardware image maps navigation notification social toggle
+
+ifneq (,$(filter \
+		$(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG) \
+		$(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG),y))
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_IMAGES
+	$(foreach family,$(GOOGLE_MATERIAL_DESIGN_ICONS_LIST),\
+		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/$(family) \
+			|| exit 1; \
+		$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_PNG), \
+			$(INSTALL) -D -m 0644 $(@D)/$(family)/1x_web/*.png \
+				$(TARGET_DIR)/usr/share/google-material/$(family) || exit 1;) \
+		$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_TYPE_SVG), \
+			$(INSTALL) -D -m 0644 $(@D)/$(family)/svg/production/*.svg \
+				$(TARGET_DIR)/usr/share/google-material/$(family) || exit 1;) \
+	)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_FONT),y)
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_FONT
+	$(INSTALL) -D -m 0644 $(@D)/iconfont/MaterialIcons-Regular.ttf \
+		$(TARGET_DIR)/usr/share/fonts/google-material/MaterialIcons-Regular.ttf \
+		|| exit 1
+endef
+endif
+
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES
+	$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_CSS), \
+		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/css-sprite \
+			|| exit 1; \
+		$(INSTALL) -D -m 0644 $(@D)/sprites/css-sprite/* \
+			$(TARGET_DIR)/usr/share/google-material/css-sprite || exit 1)
+	$(if $(BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS_SPRITES_SVG), \
+		$(INSTALL) -d $(TARGET_DIR)/usr/share/google-material/svg-sprite \
+			|| exit 1; \
+		$(INSTALL) -D -m 0644 $(@D)/sprites/svg-sprite/* \
+			$(TARGET_DIR)/usr/share/google-material/svg-sprite || exit 1)
+endef
+
+define GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_TARGET_CMDS
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_FONT)
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_IMAGES)
+	$(GOOGLE_MATERIAL_DESIGN_ICONS_INSTALL_ICONS_SPRITES)
+endef
+
+$(eval $(generic-package))
-- 
1.9.5.msysgit.1
