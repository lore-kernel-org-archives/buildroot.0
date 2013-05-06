From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 23:46:10 +0200
Subject: [Buildroot] [git commit] jquery-ui-themes: new package
Message-ID: <20130506221622.4B44F99ABA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77572e6f9fa116562f050b3d1c255ba0010e8ff0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop CSS path option, depend on jquery-ui, misc cleanups]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                            |    1 +
 package/jquery-ui-themes/Config.in           |   14 +++++++++++
 package/jquery-ui-themes/jquery-ui-themes.mk |   32 ++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6dc0022..6b38242 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -489,6 +489,7 @@ source "package/jquery/Config.in"
 source "package/jquery-keyboard/Config.in"
 source "package/jquery-sparkline/Config.in"
 source "package/jquery-ui/Config.in"
+source "package/jquery-ui-themes/Config.in"
 source "package/jquery-validation/Config.in"
 source "package/jsmin/Config.in"
 source "package/json-javascript/Config.in"
diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
new file mode 100644
index 0000000..dfde9c1
--- /dev/null
+++ b/package/jquery-ui-themes/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_JQUERY_UI_THEMES
+	bool "jQuery UI themes"
+	depends on BR2_PACKAGE_JQUERY_UI
+	help
+	  Themes for jQuery UI.
+
+	  http://jqueryui.com/
+
+config BR2_PACKAGE_JQUERY_UI_THEMES_THEME
+	string "theme to install"
+	default "base"
+	depends on BR2_PACKAGE_JQUERY_UI_THEMES
+	help
+	  Specify the name of the jQuery UI theme to install.
diff --git a/package/jquery-ui-themes/jquery-ui-themes.mk b/package/jquery-ui-themes/jquery-ui-themes.mk
new file mode 100644
index 0000000..ae50ad4
--- /dev/null
+++ b/package/jquery-ui-themes/jquery-ui-themes.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# jquery-ui-themes
+#
+#############################################################
+
+JQUERY_UI_THEMES_VERSION = 1.8.21
+JQUERY_UI_THEMES_SITE = http://jquery-ui.googlecode.com/files
+JQUERY_UI_THEMES_SOURCE = jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION).zip
+JQUERY_UI_THEMES_DEPENDENCIES = jquery-ui
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
+		$(TARGET_DIR)/var/www/jquery-ui.css
+	$(INSTALL) -d $(TARGET_DIR)/var/www/images
+	cp -a $(@D)/themes/$(BR2_PACKAGE_JQUERY_UI_THEMES_THEME)/images/*.png \
+		$(TARGET_DIR)/var/www/images
+	chmod 0644 $(TARGET_DIR)/var/www/images/*.png
+endef
+
+define JQUERY_UI_THEMES_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/var/www/jquery-ui.css
+endef
+
+$(eval $(generic-package))
