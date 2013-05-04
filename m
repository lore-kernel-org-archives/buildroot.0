From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 13:05:37 +0200
Subject: [Buildroot] [git commit] jquery-keyboard: new package
Message-ID: <20130504112539.7475F99AA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58a73c6ab55d9eadaecfda3ea0ed23d07bb7fca7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the jquery-keyboard package based on Simon Dawson's patch with a
newer version and improvements (license, select jquery, install
layouts).

[Peter: don't use install -D when destination is a directory]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                          |    1 +
 package/jquery-keyboard/Config.in          |    7 +++++++
 package/jquery-keyboard/jquery-keyboard.mk |   25 +++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 78c394f..3537de1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -484,6 +484,7 @@ menu "Javascript"
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
index 0000000..22d1a00
--- /dev/null
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -0,0 +1,25 @@
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
+	$(INSTALL) -m 0644 -D $(@D)/css/keyboard.css \
+		$(TARGET_DIR)/var/www/css/keyboard.css
+	$(INSTALL) -m 0644 $(@D)/js/jquery.keyboard*.js \
+		$(TARGET_DIR)/var/www
+	$(INSTALL) -m 0644 -D $(@D)/js/jquery.mousewheel.js \
+		$(TARGET_DIR)/var/www/jquery.mousewheel.js
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/layouts
+	$(INSTALL) -m 0644 $(@D)/layouts/*.js \
+		$(TARGET_DIR)/var/www/layouts
+endef
+
+$(eval $(call generic-package))
