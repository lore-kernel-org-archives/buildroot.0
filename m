From: =?UTF-8?q?Ignacy=20Gaw=C4=99dzki?= <ignacy.gawedzki@green-communications.fr>
Date: Mon, 20 Jul 2015 16:50:44 +0200
Subject: [Buildroot] [PATCH v2 1/1] angularjs: new package.
Message-ID: <1437403844-19942-1-git-send-email-ignacy.gawedzki@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 package/Config.in                |  1 +
 package/angularjs/Config.in      | 79 ++++++++++++++++++++++++++++++++++++++++
 package/angularjs/angularjs.hash |  2 +
 package/angularjs/angularjs.mk   | 38 +++++++++++++++++++
 4 files changed, 120 insertions(+)
 create mode 100644 package/angularjs/Config.in
 create mode 100644 package/angularjs/angularjs.hash
 create mode 100644 package/angularjs/angularjs.mk

diff --git a/package/Config.in b/package/Config.in
index 20ecd38..ba7523e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -873,6 +873,7 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
+	source "package/angularjs/Config.in"
 	source "package/bootstrap/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/angularjs/Config.in b/package/angularjs/Config.in
new file mode 100644
index 0000000..2c02530
--- /dev/null
+++ b/package/angularjs/Config.in
@@ -0,0 +1,79 @@
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
+	help
+	  Select which modules to install.  Choose N to install all the
+	  modules.
+
+if BR2_ANGULARJS_MODULES
+
+config BR2_ANGULARJS_MODULE_ANIMATE
+	bool "animate"
+	help
+	  The ngAnimate module provides support for CSS-based animations
+	  (keyframes and transitions) as well as JavaScript-based animations
+	  via callback hooks. Animations are not enabled by default, however,
+	  by including ngAnimate then the animation hooks are enabled for an
+	  Angular app.
+
+config BR2_ANGULARJS_MODULE_ARIA
+	bool "aria"
+	help
+	  The ngAria module provides support for common ARIA attributes that
+	  convey state or semantic information about the application for users
+	  of assistive technologies, such as screen readers.
+
+config BR2_ANGULARJS_MODULE_COOKIES
+	bool "cookies"
+	help
+	  The ngCookies module provides a convenient wrapper for reading and
+	  writing browser cookies.
+
+config BR2_ANGULARJS_MODULE_MESSAGE_FORMAT
+	bool "message-format"
+	help
+	  The ngMessageFormat module is used recognize MessageFormat extensions
+	  in interpolation expressions.
+
+config BR2_ANGULARJS_MODULE_MESSAGES
+	bool "messages"
+	help
+	  The ngMessages module provides enhanced support for displaying
+	  messages within templates (typically within forms or when rendering
+	  message objects that return key/value data).
+
+config BR2_ANGULARJS_MODULE_RESOURCE
+	bool "resource"
+	help
+	  The ngResource module provides interaction support with RESTful
+	  services via the $resource service.
+
+config BR2_ANGULARJS_MODULE_ROUTE
+	bool "route"
+	help
+	  The ngRoute module provides routing and deeplinking services and
+	  directives for angular apps.
+
+config BR2_ANGULARJS_MODULE_SANITIZE
+	bool "sanitize"
+	help
+	  The ngSanitize module provides functionality to sanitize HTML.
+
+config BR2_ANGULARJS_MODULE_TOUCH
+	bool "touch"
+	help
+	  The ngTouch module provides touch events and other helpers for
+	  touch-enabled devices. The implementation is based on jQuery Mobile
+	  touch event handling (jquerymobile.com).
+
+endif
+
+endif
diff --git a/package/angularjs/angularjs.hash b/package/angularjs/angularjs.hash
new file mode 100644
index 0000000..100b6dc
--- /dev/null
+++ b/package/angularjs/angularjs.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 a99e3c22b54178b7646856efd95e825650d32d3125904a28216aeba52e221bad angular-1.4.3.zip
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
new file mode 100644
index 0000000..556ee3d
--- /dev/null
+++ b/package/angularjs/angularjs.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# angularjs
+#
+################################################################################
+
+ANGULARJS_VERSION = 1.4.3
+ANGULARJS_SOURCE = angular-$(ANGULARJS_VERSION).zip
+ANGULARJS_SITE = https://code.angularjs.org/$(ANGULARJS_VERSION)/
+ANGULARJS_LICENSE = MIT
+# There's no separate license file in the archive, so use angular.js instead.
+ANGULARJS_LICENSE_FILES = angular-$(ANGULARJS_VERSION)/angular.js
+
+define ANGULARJS_EXTRACT_CMDS
+	unzip $(DL_DIR)/$(ANGULARJS_SOURCE) -d $(@D)
+endef
+
+ANGULARJS_FILES = angular
+
+ANGULARJS_MODULES = animate aria cookies message-format messages resource \
+	route sanitize touch
+
+ifeq ($(BR2_ANGULARJS_MODULES),y)
+ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),\
+			$(if $(BR2_ANGULARJS_MODULE_$(call UPPERCASE,$(mod))),\
+				angular-$(mod)))
+else
+ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),angular-$(mod))
+endif
+
+define ANGULARJS_INSTALL_TARGET_CMDS
+	$(foreach f,$(ANGULARJS_FILES),\
+		$(INSTALL) -m 0644 -D \
+			$(@D)/angular-$(ANGULARJS_VERSION)/$(f).min.js \
+			$(TARGET_DIR)/var/www/$(f).js$(sep))
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
