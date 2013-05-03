From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  3 May 2013 09:09:33 -0300
Subject: [Buildroot] [PATCH] jquery-keyboard: new package
Message-ID: <1367582973-20541-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the jquery-keyboard package based on Simon Dawson's patch with a
newer version and improvements (license, select jquery, install
layouts).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                          |  1 +
 package/jquery-keyboard/Config.in          |  7 +++++++
 package/jquery-keyboard/jquery-keyboard.mk | 26 ++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/jquery-keyboard/Config.in
 create mode 100644 package/jquery-keyboard/jquery-keyboard.mk

diff --git a/package/Config.in b/package/Config.in
index cb1e8e1..14630a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -485,6 +485,7 @@ menu "Javascript"
 source "package/explorercanvas/Config.in"
 source "package/flot/Config.in"
 source "package/jquery/Config.in"
+source "package/jquery-keyboard/Config.in"
 source "package/jquery-sparkline/Config.in"
 source "package/jquery-validation/Config.in"
 source "package/jsmin/Config.in"
diff --git a/package/jquery-keyboard/Config.in b/package/jquery-keyboard/Config.in
new file mode 100644
index 0000000..ee97662
--- /dev/null
+++ b/package/jquery-keyboard/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_JQUERY_KEYBOARD
+	bool "jQuery keyboard"
+	select BR2_PACKAGE_JQUERY
+	help
+	  Virtual Keyboard using jQuery UI
+
+	  https://github.com/Mottie/Keyboard
diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
new file mode 100644
index 0000000..81764ee
--- /dev/null
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# jquery-keyboard
+#
+#############################################################
+
+JQUERY_KEYBOARD_VERSION = 1.17.4
+JQUERY_KEYBOARD_SITE = \
+	http://github.com/Mottie/Keyboard/tarball/v$(JQUERY_KEYBOARD_VERSION)
+JQUERY_KEYBOARD_LICENSE = MIT WTFPL
+JQUERY_KEYBOARD_LICENSE_FILES = README.markdown
+
+define JQUERY_KEYBOARD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/css
+	$(INSTALL) -m 0644 -D $(@D)/css/keyboard.css \
+		$(TARGET_DIR)/var/www/css/keyboard.css
+	$(INSTALL) -m 0644 -D $(@D)/js/jquery.keyboard*.js \
+		$(TARGET_DIR)/var/www
+	$(INSTALL) -m 0644 -D $(@D)/js/jquery.mousewheel.js \
+		$(TARGET_DIR)/var/www/jquery.mousewheel.js
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/layouts
+	$(INSTALL) -m 0644 -D $(@D)/layouts/*.js \
+		$(TARGET_DIR)/var/www/layouts
+endef
+
+$(eval $(call generic-package))
-- 
1.8.1.5
