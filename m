From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 14 Oct 2013 19:22:11 +0200
Subject: [Buildroot] [PATCH 1/1] new package : jquery-mobile
Message-ID: <1381771331-386-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Jquery mobile is a unified, HTML5-based user interface system for
all popular mobile device platforms, built on the rock-solid jQuery
and jQuery UI foundation.
Its lightweight code is built with progressive enhancement,
and has a flexible, easily themeable design. 

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in                      |  1 +
 package/jquery-mobile/Config.in        | 26 +++++++++++++++
 package/jquery-mobile/jquery-mobile.mk | 59 ++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 package/jquery-mobile/Config.in
 create mode 100644 package/jquery-mobile/jquery-mobile.mk

diff --git a/package/Config.in b/package/Config.in
index 142454d..857ae9e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -576,6 +576,7 @@ source "package/explorercanvas/Config.in"
 source "package/flot/Config.in"
 source "package/jquery/Config.in"
 source "package/jquery-keyboard/Config.in"
+source "package/jquery-mobile/Config.in"
 source "package/jquery-sparkline/Config.in"
 source "package/jquery-ui/Config.in"
 source "package/jquery-ui-themes/Config.in"
diff --git a/package/jquery-mobile/Config.in b/package/jquery-mobile/Config.in
new file mode 100644
index 0000000..2b96d5f
--- /dev/null
+++ b/package/jquery-mobile/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_JQUERY_MOBILE
+	bool "jQuery-Mobile"
+	help
+	  jQuery-Mobile is a A unified, HTML5-based user interface system
+	  for all popular mobile device platforms, built on the rock-solid
+	  jQuery and jQuery UI foundation.
+	  Its lightweight code is built with progressive enhancement,
+	  and has a flexible, easily themeable design.
+
+	  http://jquerymobile.com
+	  
+config BR2_PACKAGE_JQUERY_MOBILE_FULL
+	bool "jquery mobile development files"
+	depends on BR2_PACKAGE_JQUERY_MOBILE
+	help
+		Installs the development versions.
+		
+		http://jquerymobile.com
+		
+config BR2_PACKAGE_JQUERY_MOBILE_DEMOS
+	bool "jquery mobile demo files"
+	depends on BR2_PACKAGE_JQUERY_MOBILE
+	help
+		Installs the demo files.
+		
+		http://jquerymobile.com
diff --git a/package/jquery-mobile/jquery-mobile.mk b/package/jquery-mobile/jquery-mobile.mk
new file mode 100644
index 0000000..8f2ba91
--- /dev/null
+++ b/package/jquery-mobile/jquery-mobile.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# jquery-mobile
+#
+################################################################################
+
+JQUERY_MOBILE_VERSION = 1.3.2
+JQUERY_MOBILE_SITE = http://jquerymobile.com/resources/download
+JQUERY_MOBILE_SOURCE = jquery.mobile-$(JQUERY_MOBILE_VERSION).zip
+JQUERY_MOBILE_LICENSE = MIT
+
+ifeq ($(BR2_PACKAGE_JQUERY_MOBILE_FULL),y)
+	JQUERY_MOBILE_FULL_INSTALL +=$(INSTALL) -m 0644 -D \
+		$(@D)/jquery.mobile.structure-$(JQUERY_MOBILE_VERSION).css \
+		$(TARGET_DIR)/var/www/jquery.mobile.structure-$(JQUERY_MOBILE_VERSION).css ;
+	JQUERY_MOBILE_FULL_INSTALL +=$(INSTALL) -m 0644 -D \
+		$(@D)/jquery.mobile.theme-$(JQUERY_MOBILE_VERSION).css \
+		$(TARGET_DIR)/var/www/jquery.mobile.theme-$(JQUERY_MOBILE_VERSION).css ;
+	JQUERY_MOBILE_FULL_INSTALL +=$(INSTALL) -m 0644 -D \
+		$(@D)/jquery.mobile-$(JQUERY_MOBILE_VERSION).css \
+		$(TARGET_DIR)/var/www/jquery.mobile-$(JQUERY_MOBILE_VERSION).css ;
+	JQUERY_MOBILE_FULL_INSTALL +=$(INSTALL) -m 0644 -D \
+		$(@D)/jquery.mobile-$(JQUERY_MOBILE_VERSION).js \
+		$(TARGET_DIR)/var/www/jquery.mobile-$(JQUERY_MOBILE_VERSION).js
+endif
+
+ifeq ($(BR2_PACKAGE_JQUERY_MOBILE_DEMOS),y)
+	JQUERY_MOBILE_DEMOS_INSTALL +=mkdir -p $(TARGET_DIR)/var/www/demos ;
+	JQUERY_MOBILE_DEMOS_INSTALL +=cp -r $(@D)/demos/* $(TARGET_DIR)/var/www/demos ;
+	JQUERY_MOBILE_DEMOS_INSTALL +=$(INSTALL) -m 0644 -D $(@D)/index.html $(TARGET_DIR)/var/www/demo.html
+endif
+
+define JQUERY_MOBILE_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(JQUERY_MOBILE_SOURCE)
+endef
+
+define JQUERY_MOBILE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/var/www
+	mkdir -p $(TARGET_DIR)/var/www/images
+	$(INSTALL) -m 0644 -D $(@D)/images/* $(TARGET_DIR)/var/www/images
+	$(INSTALL) -m 0644 -D $(@D)/jquery.mobile.structure-$(JQUERY_MOBILE_VERSION).min.css \
+		$(TARGET_DIR)/var/www/jquery.mobile.structure-$(JQUERY_MOBILE_VERSION).min.css
+	$(INSTALL) -m 0644 -D $(@D)/jquery.mobile.theme-$(JQUERY_MOBILE_VERSION).min.css \
+		$(TARGET_DIR)/var/www/jquery.mobile.theme-$(JQUERY_MOBILE_VERSION).min.css
+	$(INSTALL) -m 0644 -D $(@D)/jquery.mobile-$(JQUERY_MOBILE_VERSION).min.css \
+		$(TARGET_DIR)/var/www/jquery.mobile-$(JQUERY_MOBILE_VERSION).min.css
+	$(INSTALL) -m 0644 -D $(@D)/jquery.mobile-$(JQUERY_MOBILE_VERSION).min.map \
+		$(TARGET_DIR)/var/www/jquery.mobile-$(JQUERY_MOBILE_VERSION).min.map
+	$(INSTALL) -m 0644 -D $(@D)/jquery.mobile-$(JQUERY_MOBILE_VERSION).min.js \
+		$(TARGET_DIR)/var/www/jquery.mobile-$(JQUERY_MOBILE_VERSION).min.js
+	$(JQUERY_MOBILE_FULL_INSTALL)
+	$(JQUERY_MOBILE_DEMOS_INSTALL)
+endef
+
+define JQUERY_MOBILE_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/var/www/demos
+endef
+
+$(eval $(generic-package))
-- 
1.8.4.474.g128a96c
