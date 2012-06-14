From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 14 Jun 2012 21:02:12 +0100
Subject: [Buildroot] [PATCH 2/2] jquery-ui-themes: new package
In-Reply-To: <1339704133-11220-1-git-send-email-spdawson@gmail.com>
References: <1339704133-11220-1-git-send-email-spdawson@gmail.com>
Message-ID: <1339704133-11220-2-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                            |    1 +
 package/jquery-ui-themes/Config.in           |   21 +++++++++++++++++
 package/jquery-ui-themes/jquery-ui-themes.mk |   31 ++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/jquery-ui-themes/Config.in
 create mode 100644 package/jquery-ui-themes/jquery-ui-themes.mk

diff --git a/package/Config.in b/package/Config.in
index 2f20617..20d7323 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -382,6 +382,7 @@ source "package/flot/Config.in"
 source "package/jquery/Config.in"
 source "package/jquery-sparkline/Config.in"
 source "package/jquery-ui/Config.in"
+source "package/jquery-ui-themes/Config.in"
 source "package/jquery-validation/Config.in"
 source "package/jsmin/Config.in"
 endmenu
diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
new file mode 100644
index 0000000..49180f9
--- /dev/null
+++ b/package/jquery-ui-themes/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_JQUERY_UI_THEMES
+	bool "jQuery UI themes"
+	select BR2_PACKAGE_JQUERY_UI
+	help
+	  Themes for jQuery UI.
+
+	  http://jqueryui.com/
+
+config BR2_PACKAGE_JQUERY_UI_THEMES_CSS_PATH
+	string "Target install path for CSS"
+	default "/var/www/stylesheets"
+	depends on BR2_PACKAGE_JQUERY_UI_THEMES
+	help
+	  Specify a target install path for CSS files
+
+config BR2_PACKAGE_JQUERY_UI_THEMES_THEME
+	string "Name of theme to install"
+	default "base"
+	depends on BR2_PACKAGE_JQUERY_UI_THEMES
+	help
+	  Specify the name of a jQuery UI theme to be installed
diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
new file mode 100644
index 0000000..e193f51
--- /dev/null
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# jquery-ui-themes
+#
+#############################################################
+JQUERY_UI_THEMES_VERSION = 1.8.21
+JQUERY_UI_THEMES_SITE = http://jquery-ui.googlecode.com/files
+JQUERY_UI_THEMES_SOURCE = jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION).zip
+
+define JQUERY_UI_THEMES_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(JQUERY_UI_THEMES_SOURCE)
+	mv $(@D)/jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION)/* $(@D)
+	$(RM) -r $(@D)/jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION)
+endef
+
+define JQUERY_UI_THEMES_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D \
+		$(@D)/themes/$(BR2_PACKAGE_JQUERY_UI_THEMES_THEME)/jquery-ui.css \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_THEMES_CSS_PATH)/jquery-ui.css
+	$(INSTALL) -d $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_THEMES_CSS_PATH)/images
+	cp -a $(@D)/themes/$(BR2_PACKAGE_JQUERY_UI_THEMES_THEME)/images/*.png \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_THEMES_CSS_PATH)/images
+	chmod 0644 $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_THEMES_CSS_PATH)/images/*.png
+endef
+
+define JQUERY_UI_THEMES_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_THEMES_CSS_PATH)/jquery-ui.css
+	$(RM) -r $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_THEMES_CSS_PATH)/images
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
