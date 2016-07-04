From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 16:07:37 +0200
Subject: [Buildroot] [git commit] package/angularjs: drop modules selection
	and simplify
Message-ID: <20160704140934.1FCA581916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1eb75aab06940561e32360819bf5105cf0a0236
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The angular modules are very small compared to angular:

ls -lahS target/var/www
total 228K
-rw-r--r-- 1 peko peko 142K Jul  4 16:06 angular.js
-rw-r--r-- 1 peko peko  23K Jul  4 16:06 angular-animate.js
-rw-r--r-- 1 peko peko  11K Jul  4 16:06 angular-message-format.js
-rw-r--r-- 1 peko peko 5.9K Jul  4 16:06 angular-sanitize.js
-rw-r--r-- 1 peko peko 4.3K Jul  4 16:06 angular-route.js
drwxr-xr-x 2 peko peko 4.0K Jul  4 16:06 .
drwxr-xr-x 5 peko peko 4.0K Jul  4 15:58 ..
-rw-r--r-- 1 peko peko 3.7K Jul  4 16:06 angular-aria.js
-rw-r--r-- 1 peko peko 3.6K Jul  4 16:06 angular-resource.js
-rw-r--r-- 1 peko peko 3.6K Jul  4 16:06 angular-touch.js
-rw-r--r-- 1 peko peko 2.6K Jul  4 16:06 angular-messages.js
-rw-r--r-- 1 peko peko 1.7K Jul  4 16:06 angular-loader.js
-rw-r--r-- 1 peko peko 1.4K Jul  4 16:06 angular-cookies.js

So drop the suboptions and simplify the package logic.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/angularjs/Config.in    | 75 +-----------------------------------------
 package/angularjs/angularjs.mk | 20 +++--------
 2 files changed, 5 insertions(+), 90 deletions(-)

diff --git a/package/angularjs/Config.in b/package/angularjs/Config.in
index 206b3d8..f0d2015 100644
--- a/package/angularjs/Config.in
+++ b/package/angularjs/Config.in
@@ -1,79 +1,6 @@
-menuconfig BR2_PACKAGE_ANGULARJS
+config BR2_PACKAGE_ANGULARJS
 	bool "angularjs"
 	help
 	  AngularJS web application framework.
 
 	  http://angularjs.org
-
-if BR2_PACKAGE_ANGULARJS
-
-config BR2_ANGULARJS_MODULES
-	bool "angularjs modules"
-	help
-	  Select which modules to install. If disabled, all modules
-	  will be installed.
-
-if BR2_ANGULARJS_MODULES
-
-config BR2_ANGULARJS_MODULE_ANIMATE
-	bool "animate"
-	help
-	  The ngAnimate module provides support for CSS-based animations
-	  (keyframes and transitions) as well as JavaScript-based animations
-	  via callback hooks. Animations are not enabled by default, however,
-	  by including ngAnimate then the animation hooks are enabled for an
-	  Angular app.
-
-config BR2_ANGULARJS_MODULE_ARIA
-	bool "aria"
-	help
-	  The ngAria module provides support for common ARIA attributes that
-	  convey state or semantic information about the application for users
-	  of assistive technologies, such as screen readers.
-
-config BR2_ANGULARJS_MODULE_COOKIES
-	bool "cookies"
-	help
-	  The ngCookies module provides a convenient wrapper for reading and
-	  writing browser cookies.
-
-config BR2_ANGULARJS_MODULE_MESSAGE_FORMAT
-	bool "message-format"
-	help
-	  The ngMessageFormat module is used recognize MessageFormat extensions
-	  in interpolation expressions.
-
-config BR2_ANGULARJS_MODULE_MESSAGES
-	bool "messages"
-	help
-	  The ngMessages module provides enhanced support for displaying
-	  messages within templates (typically within forms or when rendering
-	  message objects that return key/value data).
-
-config BR2_ANGULARJS_MODULE_RESOURCE
-	bool "resource"
-	help
-	  The ngResource module provides interaction support with RESTful
-	  services via the $resource service.
-
-config BR2_ANGULARJS_MODULE_ROUTE
-	bool "route"
-	help
-	  The ngRoute module provides routing and deeplinking services and
-	  directives for angular apps.
-
-config BR2_ANGULARJS_MODULE_SANITIZE
-	bool "sanitize"
-	help
-	  The ngSanitize module provides functionality to sanitize HTML.
-
-config BR2_ANGULARJS_MODULE_TOUCH
-	bool "touch"
-	help
-	  The ngTouch module provides touch events and other helpers for
-	  touch-enabled devices. The implementation is based on jQuery Mobile
-	  touch event handling (jquerymobile.com).
-
-endif
-
-endif
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index 60dbdb6..08a4b60 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -17,23 +17,11 @@ define ANGULARJS_EXTRACT_CMDS
 	rmdir $(@D)/angular-$(ANGULARJS_VERSION)
 endef
 
-ANGULARJS_FILES = angular
-
-ANGULARJS_MODULES = animate aria cookies message-format messages resource \
-	route sanitize touch
-
-ifeq ($(BR2_ANGULARJS_MODULES),y)
-ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),\
-			$(if $(BR2_ANGULARJS_MODULE_$(call UPPERCASE,$(mod))),\
-				angular-$(mod)))
-else
-ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),angular-$(mod))
-endif
-
+# install .min.js as .js
 define ANGULARJS_INSTALL_TARGET_CMDS
-	$(foreach f,$(ANGULARJS_FILES),\
-		$(INSTALL) -m 0644 -D $(@D)/$(f).min.js \
-			$(TARGET_DIR)/var/www/$(f).js$(sep))
+	$(foreach f,$(notdir $(wildcard $(@D)/*.min.js)),
+		$(INSTALL) -m 0644 -D $(@D)/$(f) \
+			$(TARGET_DIR)/var/www/$(f:.min.js=.js)$(sep))
 endef
 
 $(eval $(generic-package))
