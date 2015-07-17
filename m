From: =?UTF-8?q?Ignacy=20Gaw=C4=99dzki?= <ignacy.gawedzki@green-communications.fr>
Date: Fri, 17 Jul 2015 12:44:36 +0200
Subject: [Buildroot] [PATCH 1/1] angularjs: new package.
Message-ID: <1437129876-5158-1-git-send-email-ignacy.gawedzki@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 package/Config.in              |  1 +
 package/angularjs/Config.in    | 60 ++++++++++++++++++++++++++++++++++++++++++
 package/angularjs/angularjs.mk | 41 +++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 package/angularjs/Config.in
 create mode 100644 package/angularjs/angularjs.mk

diff --git a/package/Config.in b/package/Config.in
index 86a53c8..a8c16ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -866,6 +866,7 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
+	source "package/angularjs/Config.in"
 	source "package/bootstrap/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/angularjs/Config.in b/package/angularjs/Config.in
new file mode 100644
index 0000000..38fb56f
--- /dev/null
+++ b/package/angularjs/Config.in
@@ -0,0 +1,60 @@
+config BR2_PACKAGE_ANGULARJS
+	bool "AngularJS"
+	help
+	  AngularJS web application framework.
+
+	  http://angularjs.org
+
+if BR2_PACKAGE_ANGULARJS
+
+menuconfig BR2_ANGULARJS_MODULES
+	bool "Select AngularJS modules"
+
+	help
+	  Select which modules to install, instead of installing all of them.
+
+if BR2_ANGULARJS_MODULES
+
+config BR2_ANGULARJS_MODULE_animate
+	bool "animate"
+	default y
+
+config BR2_ANGULARJS_MODULE_aria
+	bool "aria"
+	default y
+
+config BR2_ANGULARJS_MODULE_cookies
+	bool "cookies"
+	default y
+
+config BR2_ANGULARJS_MODULE_loader
+	bool "loader"
+	default y
+
+config BR2_ANGULARJS_MODULE_message-format
+	bool "message-format"
+	default y
+
+config BR2_ANGULARJS_MODULE_messages
+	bool "messages"
+	default y
+
+config BR2_ANGULARJS_MODULE_resource
+	bool "resource"
+	default y
+
+config BR2_ANGULARJS_MODULE_route
+	bool "route"
+	default y
+
+config BR2_ANGULARJS_MODULE_sanitize
+	bool "sanitize"
+	default y
+
+config BR2_ANGULARJS_MODULE_touch
+	bool "touch"
+	default y
+
+endif
+
+endif
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
new file mode 100644
index 0000000..c7b587b
--- /dev/null
+++ b/package/angularjs/angularjs.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# AngularJS
+#
+################################################################################
+
+ANGULARJS_VERSION = 1.4.2
+ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
+ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)/
+
+define ANGULARJS_EXTRACT_CMDS
+	unzip $(DL_DIR)/$(ANGULARJS_SOURCE) -d $(@D)
+	mv $(@D)/angular-$(ANGULARJS_VERSION)/* $(@D)
+	rmdir $(@D)/angular-$(ANGULARJS_VERSION)
+endef
+
+ANGULARJS_FILES = angular.min.js
+
+ANGULARJS_MODULES = animate aria cookies loader message-format \
+		    messages resource route sanitize touch
+
+ifeq ($(BR2_ANGULARJS_MODULES),y)
+
+ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),\
+		   $(if $(filter y,$(BR2_ANGULARJS_MODULE_$(mod))),\
+			angular-$(mod).min.js))
+
+else
+
+ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),angular-$(mod).min.js)
+
+endif
+
+define ANGULARJS_INSTALL_TARGET_CMDS
+	for f in $(strip $(ANGULARJS_FILES)); do	\
+		$(INSTALL) -m 0644 -D $(@D)/$$f		\
+		$(TARGET_DIR)/var/www/$${f%.min.js}.js;	\
+	done
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
