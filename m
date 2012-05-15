From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 15 May 2012 09:40:03 +0100
Subject: [Buildroot] [PATCH] jquery-ui: new package
Message-ID: <1337071203-5841-1-git-send-email-spdawson@gmail.com>
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
 package/jquery-ui/jquery-ui.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/jquery-ui/Config.in
 create mode 100644 package/jquery-ui/jquery-ui.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..acbbdbd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ source "package/explorercanvas/Config.in"
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
index 0000000..472c9b3
--- /dev/null
+++ b/package/jquery-ui/jquery-ui.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# jquery-ui
+#
+#############################################################
+JQUERY_UI_VERSION = 1.8.20
+JQUERY_UI_SITE = http://jqueryui.com/download
+JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).custom.zip
+
+JQUERY_UI_THEME = smoothness
+
+define JQUERY_UI_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(JQUERY_UI_SOURCE)
+endef
+
+define JQUERY_UI_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/js/jquery-ui-$(JQUERY_UI_VERSION).custom.min.js \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_JAVASCRIPT_PATH)/jquery-ui.js
+	mkdir -p $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_CSS_PATH)
+	cp -a $(@D)/css/$(JQUERY_UI_THEME) \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_CSS_PATH)
+endef
+
+define JQUERY_UI_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_JAVASCRIPT_PATH)/jquery-ui.js
+	$(RM) -r $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_UI_CSS_PATH)/$(JQUERY_UI_THEME)
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
