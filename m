From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 14 Jun 2012 21:02:11 +0100
Subject: [Buildroot] [PATCH 1/2] jquery-ui: new package
Message-ID: <1339704133-11220-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in              |    1 +
 package/jquery-ui/Config.in    |   23 +++++++++++++++++++++++
 package/jquery-ui/jquery-ui.mk |   36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 package/jquery-ui/Config.in
 create mode 100644 package/jquery-ui/jquery-ui.mk

diff --git a/package/Config.in b/package/Config.in
index d047ce8..2f20617 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -381,6 +381,7 @@ source "package/explorercanvas/Config.in"
 source "package/flot/Config.in"
 source "package/jquery/Config.in"
 source "package/jquery-sparkline/Config.in"
+source "package/jquery-ui/Config.in"
 source "package/jquery-validation/Config.in"
 source "package/jsmin/Config.in"
 endmenu
diff --git a/package/jquery-ui/Config.in b/package/jquery-ui/Config.in
new file mode 100644
index 0000000..073a40a
--- /dev/null
+++ b/package/jquery-ui/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_JQUERY_UI
+	bool "jQuery UI"
+	help
+	  jQuery UI provides abstractions for low-level interaction and
+	  animation, advanced effects and high-level, themeable widgets,
+	  built on top of the jQuery JavaScript Library, that you can use
+	  to build highly interactive web applications.
+
+	  http://jqueryui.com/
+
+config BR2_PACKAGE_JQUERY_UI_JAVASCRIPT_PATH
+	string "Target install path for JavaScript"
+	default "/var/www/javascripts"
+	depends on BR2_PACKAGE_JQUERY_UI
+	help
+	  Specify a target install path for JavaScript files
+
+config BR2_PACKAGE_JQUERY_UI_CSS_PATH
+	string "Target install path for CSS"
+	default "/var/www/stylesheets"
+	depends on BR2_PACKAGE_JQUERY_UI
+	help
+	  Specify a target install path for CSS files
diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
new file mode 100644
index 0000000..7f05e28
--- /dev/null
+++ b/package/jquery-ui/jquery-ui.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# jquery-ui
+#
+#############################################################
+JQUERY_UI_VERSION = 1.8.21
+JQUERY_UI_SITE = http://jquery-ui.googlecode.com/files
+JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).zip
+
+define JQUERY_UI_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(JQUERY_UI_SOURCE)
+	mv $(@D)/jquery-ui-$(JQUERY_UI_VERSION)/* $(@D)
+	$(RM) -r $(@D)/jquery-ui-$(JQUERY_UI_VERSION)
+endef
+
+define JQUERY_UI_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/ui/minified/jquery-ui.min.js \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_JAVASCRIPT_PATH)/jquery-ui.js
+	$(INSTALL) -m 0644 -D $(@D)/ui/minified/i18n/jquery-ui-i18n.min.js \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_JAVASCRIPT_PATH)/jquery-ui-i18n.js
+	$(INSTALL) -m 0644 -D $(@D)/themes/base/minified/jquery-ui.min.css \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_CSS_PATH)/jquery-ui.css
+	$(INSTALL) -d $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_CSS_PATH)/images
+	cp -a $(@D)/themes/base/minified/images/*.png \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_CSS_PATH)/images
+	chmod 0644 $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_CSS_PATH)/images/*.png
+endef
+
+define JQUERY_UI_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_JAVASCRIPT_PATH)/jquery-ui.js
+	$(RM) $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_JAVASCRIPT_PATH)/jquery-ui-i18n.js
+	$(RM) $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_CSS_PATH)/jquery-ui.css
+	$(RM) -r $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_CSS_PATH)/images
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
