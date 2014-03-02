From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun,  2 Mar 2014 18:34:06 +0100
Subject: [Buildroot] [PATCH 1/1] jquery-mobile : new package
Message-ID: <1393781646-2497-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jQuery Mobile is a HTML5-based user interface system designed to make
responsive web sites and apps that are accessible on all smartphone,
tablet and desktop devices.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in                      |  1 +
 package/jquery-mobile/Config.in        | 24 +++++++++++++++++
 package/jquery-mobile/jquery-mobile.mk | 48 ++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 package/jquery-mobile/Config.in
 create mode 100644 package/jquery-mobile/jquery-mobile.mk

diff --git a/package/Config.in b/package/Config.in
index 6edf18e..440d78c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -636,6 +636,7 @@ source "package/explorercanvas/Config.in"
 source "package/flot/Config.in"
 source "package/jquery/Config.in"
 source "package/jquery-keyboard/Config.in"
+source "package/jquery-mobile/Config.in"
 source "package/jquery-sparkline/Config.in"
 source "package/jquery-ui/Config.in"
 source "package/jquery-ui-themes/Config.in"
diff --git a/package/jquery-mobile/Config.in b/package/jquery-mobile/Config.in
new file mode 100644
index 0000000..f730692
--- /dev/null
+++ b/package/jquery-mobile/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_JQUERY_MOBILE
+	bool "jquery-mobile"
+	select BR2_PACKAGE_JQUERY
+	help
+	  jQuery-Mobile is a unified, HTML5-based user interface system
+	  for all popular mobile device platforms, built on the rock-solid
+	  jQuery and jQuery UI foundation.
+	  Its lightweight code is built with progressive enhancement,
+	  and has a flexible, easily themeable design.
+
+	  http://jquerymobile.com
+	  
+if BR2_PACKAGE_JQUERY_MOBILE
+config BR2_PACKAGE_JQUERY_MOBILE_FULL
+	bool "jquery-mobile development files"
+	help
+	  Installs the development versions.
+
+config BR2_PACKAGE_JQUERY_MOBILE_DEMOS
+	bool "jquery-mobile demo files"
+	help
+	  Installs the demo files.
+	  The main demo page is http://hostname/demo.html	
+endif
diff --git a/package/jquery-mobile/jquery-mobile.mk b/package/jquery-mobile/jquery-mobile.mk
new file mode 100644
index 0000000..3ed075a
--- /dev/null
+++ b/package/jquery-mobile/jquery-mobile.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# jquery-mobile
+#
+################################################################################
+
+JQUERY_MOBILE_VERSION = 1.4.2
+JQUERY_MOBILE_SITE = http://jquerymobile.com/resources/download
+JQUERY_MOBILE_SOURCE = jquery.mobile-$(JQUERY_MOBILE_VERSION).zip
+JQUERY_MOBILE_LICENSE = MIT
+
+define JQUERY_MOBILE_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(JQUERY_MOBILE_SOURCE)
+endef
+
+JQUERY_MOBILE_INSTALLED_FILES = \
+	jquery.mobile.structure-$(JQUERY_MOBILE_VERSION).min.css \
+	jquery.mobile.theme-$(JQUERY_MOBILE_VERSION).min.css \
+	jquery.mobile-$(JQUERY_MOBILE_VERSION).min.css \
+	jquery.mobile-$(JQUERY_MOBILE_VERSION).min.map \
+	jquery.mobile-$(JQUERY_MOBILE_VERSION).min.js
+
+ifeq ($(BR2_PACKAGE_JQUERY_MOBILE_FULL),y)
+JQUERY_MOBILE_INSTALLED_FILES += \
+	jquery.mobile.structure-$(JQUERY_MOBILE_VERSION).css \
+	jquery.mobile.theme-$(JQUERY_MOBILE_VERSION).css \
+	jquery.mobile-$(JQUERY_MOBILE_VERSION).css \
+	jquery.mobile-$(JQUERY_MOBILE_VERSION).js
+endif
+
+ifeq ($(BR2_PACKAGE_JQUERY_MOBILE_DEMOS),y)
+define JQUERY_MOBILE_INSTALL_DEMOS
+	mkdir -p $(TARGET_DIR)/var/www/demos
+	cp -r $(@D)/demos/* $(TARGET_DIR)/var/www/demos
+	$(INSTALL) -m 0644 -D $(@D)/demos/index.html $(TARGET_DIR)/var/www/demo.html
+endef
+endif
+
+define JQUERY_MOBILE_INSTALL_TARGET_CMDS
+	for f in $(JQUERY_MOBILE_INSTALLED_FILES) ; do \
+		$(INSTALL) -m 0644 -D $(@D)/$$f $(TARGET_DIR)/var/www/$$f || break ; \
+	done
+	mkdir -p $(TARGET_DIR)/var/www/images
+	cp -r $(@D)/images/* $(TARGET_DIR)/var/www/images
+	$(JQUERY_MOBILE_INSTALL_DEMOS)
+endef
+
+$(eval $(generic-package))
-- 
1.9.0
