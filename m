From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 17:43:23 +0200
Subject: [Buildroot] [git commit] jquery-ui: new package
Message-ID: <20130506221621.C5A2C99C79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=856727f4d0e5c8db9316c97cd2f4a51a643e373d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: select jquery, update for generic-package, drop _PATH options]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/jquery-ui/Config.in    |   10 ++++++++++
 package/jquery-ui/jquery-ui.mk |   35 +++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fe4f56b..6dc0022 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -488,6 +488,7 @@ source "package/flot/Config.in"
 source "package/jquery/Config.in"
 source "package/jquery-keyboard/Config.in"
 source "package/jquery-sparkline/Config.in"
+source "package/jquery-ui/Config.in"
 source "package/jquery-validation/Config.in"
 source "package/jsmin/Config.in"
 source "package/json-javascript/Config.in"
diff --git a/package/jquery-ui/Config.in b/package/jquery-ui/Config.in
new file mode 100644
index 0000000..f1653d5
--- /dev/null
+++ b/package/jquery-ui/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_JQUERY_UI
+	bool "jQuery UI"
+	select BR2_PACKAGE_JQUERY
+	help
+	  jQuery UI provides abstractions for low-level interaction and
+	  animation, advanced effects and high-level, themeable widgets,
+	  built on top of the jQuery JavaScript Library, that you can use
+	  to build highly interactive web applications.
+
+	  http://jqueryui.com/
diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
new file mode 100644
index 0000000..3fd9e43
--- /dev/null
+++ b/package/jquery-ui/jquery-ui.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# jquery-ui
+#
+#############################################################
+
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
+		$(TARGET_DIR)/var/www/jquery-ui.js
+	$(INSTALL) -m 0644 -D $(@D)/ui/minified/i18n/jquery-ui-i18n.min.js \
+		$(TARGET_DIR)/var/www/jquery-ui-i18n.js
+	$(INSTALL) -m 0644 -D $(@D)/themes/base/minified/jquery-ui.min.css \
+		$(TARGET_DIR)/var/www/jquery-ui.css
+	$(INSTALL) -d $(TARGET_DIR)/var/www/images
+	cp -a $(@D)/themes/base/minified/images/*.png \
+		$(TARGET_DIR)/var/www/images
+	chmod 0644 $(TARGET_DIR)/var/www/images/*.png
+endef
+
+define JQUERY_UI_UNINSTALL_TARGET_CMDS
+	$(RM) $(addprefix $(TARGET_DIR)/var/www/,\
+		jquery-ui.js jquery-ui-i18n.js jquery-ui.css)
+endef
+
+$(eval $(generic-package))
