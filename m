From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  8 Jun 2012 14:52:33 +0100
Subject: [Buildroot] [PATCH] jquery-keyboard: new package
Message-ID: <1339163553-25844-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                          |    1 +
 package/jquery-keyboard/Config.in          |   20 ++++++++++++++++++++
 package/jquery-keyboard/jquery-keyboard.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 package/jquery-keyboard/Config.in
 create mode 100644 package/jquery-keyboard/jquery-keyboard.mk

diff --git a/package/Config.in b/package/Config.in
index 2b69c57..ad78ced 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -375,6 +375,7 @@ menu "Javascript"
 source "package/explorercanvas/Config.in"
 source "package/flot/Config.in"
 source "package/jquery/Config.in"
+source "package/jquery-keyboard/Config.in"
 source "package/jquery-sparkline/Config.in"
 source "package/jquery-validation/Config.in"
 source "package/jsmin/Config.in"
diff --git a/package/jquery-keyboard/Config.in b/package/jquery-keyboard/Config.in
new file mode 100644
index 0000000..23cb4b6
--- /dev/null
+++ b/package/jquery-keyboard/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_JQUERY_KEYBOARD
+	bool "jQuery keyboard"
+	help
+	  Virtual Keyboard using jQuery UI
+
+	  https://github.com/Mottie/Keyboard
+
+config BR2_PACKAGE_JQUERY_KEYBOARD_JAVASCRIPT_PATH
+	string "Target install path for JavaScript"
+	default "/var/www/javascripts"
+	depends on BR2_PACKAGE_JQUERY_KEYBOARD
+	help
+	  Specify a target install path for JavaScript files
+
+config BR2_PACKAGE_JQUERY_KEYBOARD_CSS_PATH
+	string "Target install path for CSS"
+	default "/var/www/stylesheets"
+	depends on BR2_PACKAGE_JQUERY_KEYBOARD
+	help
+	  Specify a target install path for CSS files
diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
new file mode 100644
index 0000000..6070c55
--- /dev/null
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# jquery-keyboard
+#
+#############################################################
+JQUERY_KEYBOARD_VERSION = 1.9.18
+JQUERY_KEYBOARD_SITE = \
+	https://github.com/Mottie/Keyboard/tarball/v$(JQUERY_KEYBOARD_VERSION)
+
+define JQUERY_KEYBOARD_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_KEYBOARD_CSS_PATH)
+	$(INSTALL) -m 0644 -D $(@D)/css/keyboard.css \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_KEYBOARD_CSS_PATH)/keyboard.css
+	mkdir -p $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_KEYBOARD_JAVASCRIPT_PATH)
+	$(INSTALL) -m 0644 -D $(@D)/js/jquery.keyboard*.js \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_KEYBOARD_JAVASCRIPT_PATH)
+	$(INSTALL) -m 0644 -D $(@D)/js/jquery.mousewheel.js \
+		$(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_KEYBOARD_JAVASCRIPT_PATH)
+endef
+
+define JQUERY_KEYBOARD_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_KEYBOARD_CSS_PATH)/keyboard.css
+	$(RM) $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_KEYBOARD_JAVASCRIPT_PATH)/jquery.keyboard*.js
+	$(RM) $(TARGET_DIR)/$(BR2_PACKAGE_JQUERY_KEYBOARD_JAVASCRIPT_PATH)/jquery.mousewheel.js
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
