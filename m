From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 25 Jun 2012 20:49:02 +0100
Subject: [Buildroot] [PATCH v2] jquery-keyboard: new package
Message-ID: <1340653742-9890-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---

 v2: Removed configuration items for JavaScript and CSS install paths.

 package/Config.in                          |    1 +
 package/jquery-keyboard/Config.in          |    6 ++++++
 package/jquery-keyboard/jquery-keyboard.mk |   25 +++++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/jquery-keyboard/Config.in
 create mode 100644 package/jquery-keyboard/jquery-keyboard.mk

diff --git a/package/Config.in b/package/Config.in
index 99257b4..1d6f971 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -382,6 +382,7 @@ menu "Javascript"
 source "package/explorercanvas/Config.in"
 source "package/flot/Config.in"
 source "package/jquery/Config.in"
+source "package/jquery-keyboard/Config.in"
 source "package/jquery-sparkline/Config.in"
 source "package/jquery-validation/Config.in"
 source "package/jsmin/Config.in"
diff --git a/package/jquery-keyboard/Config.in b/package/jquery-keyboard/Config.in
new file mode 100644
index 0000000..e900b51
--- /dev/null
+++ b/package/jquery-keyboard/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JQUERY_KEYBOARD
+	bool "jQuery keyboard"
+	help
+	  Virtual Keyboard using jQuery UI
+
+	  https://github.com/Mottie/Keyboard
diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
new file mode 100644
index 0000000..60b6f3a
--- /dev/null
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -0,0 +1,25 @@
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
+	$(INSTALL) -m 0644 -D $(@D)/css/keyboard.css \
+		$(TARGET_DIR)/var/www/keyboard.css
+	$(INSTALL) -m 0644 -D $(@D)/js/jquery.keyboard*.js \
+		$(TARGET_DIR)/var/www
+	$(INSTALL) -m 0644 -D $(@D)/js/jquery.mousewheel.js \
+		$(TARGET_DIR)/var/www/jquery.mousewheel.js
+endef
+
+define JQUERY_KEYBOARD_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/var/www/keyboard.css
+	$(RM) $(TARGET_DIR)/var/www/jquery.keyboard*.js
+	$(RM) $(TARGET_DIR)/var/www/jquery.mousewheel.js
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
