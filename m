From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:39 +0100
Subject: [Buildroot] [PATCH 10/84 RFC] package/angularjs: simplify modules
	selection
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <ff46e42197b59eabccfd4c74e92c671e0e9f9e1e.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the superfluous config option, and make all modules default to
'y', which provides exactly the same functionality.

simplify (and slightly beautofy) the handling of modules in the .mk:
since the modules' symbols are always meaningful now, we can get rid of
the else-clause, and always build the list of modules using the Kconfig
options.

Re-order the list alphabetically (message <-> message-format).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/angularjs/Config.in    | 35 +++++++++++++++++++++--------------
 package/angularjs/angularjs.mk | 24 +++++++++++++++---------
 2 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/package/angularjs/Config.in b/package/angularjs/Config.in
index 206b3d8..ee1dbbf 100644
--- a/package/angularjs/Config.in
+++ b/package/angularjs/Config.in
@@ -7,16 +7,17 @@ menuconfig BR2_PACKAGE_ANGULARJS
 
 if BR2_PACKAGE_ANGULARJS
 
-config BR2_ANGULARJS_MODULES
-	bool "angularjs modules"
-	help
-	  Select which modules to install. If disabled, all modules
-	  will be installed.
+# All the modules default to 'y' to keep backward-compatibility
+# Keep this list in sync and in the same (alphabetical) order as # the
+# one in angularjs.mk. However, always keep 'angular' first in the list.
 
-if BR2_ANGULARJS_MODULES
+config BR2_ANGULARJS_MODULE_ANGULAR
+	bool
+	default y
 
 config BR2_ANGULARJS_MODULE_ANIMATE
 	bool "animate"
+	default y
 	help
 	  The ngAnimate module provides support for CSS-based animations
 	  (keyframes and transitions) as well as JavaScript-based animations
@@ -26,6 +27,7 @@ config BR2_ANGULARJS_MODULE_ANIMATE
 
 config BR2_ANGULARJS_MODULE_ARIA
 	bool "aria"
+	default y
 	help
 	  The ngAria module provides support for common ARIA attributes that
 	  convey state or semantic information about the application for users
@@ -33,47 +35,52 @@ config BR2_ANGULARJS_MODULE_ARIA
 
 config BR2_ANGULARJS_MODULE_COOKIES
 	bool "cookies"
+	default y
 	help
 	  The ngCookies module provides a convenient wrapper for reading and
 	  writing browser cookies.
 
-config BR2_ANGULARJS_MODULE_MESSAGE_FORMAT
-	bool "message-format"
-	help
-	  The ngMessageFormat module is used recognize MessageFormat extensions
-	  in interpolation expressions.
-
 config BR2_ANGULARJS_MODULE_MESSAGES
 	bool "messages"
+	default y
 	help
 	  The ngMessages module provides enhanced support for displaying
 	  messages within templates (typically within forms or when rendering
 	  message objects that return key/value data).
 
+config BR2_ANGULARJS_MODULE_MESSAGE_FORMAT
+	bool "message-format"
+	default y
+	help
+	  The ngMessageFormat module is used recognize MessageFormat extensions
+	  in interpolation expressions.
+
 config BR2_ANGULARJS_MODULE_RESOURCE
 	bool "resource"
+	default y
 	help
 	  The ngResource module provides interaction support with RESTful
 	  services via the $resource service.
 
 config BR2_ANGULARJS_MODULE_ROUTE
 	bool "route"
+	default y
 	help
 	  The ngRoute module provides routing and deeplinking services and
 	  directives for angular apps.
 
 config BR2_ANGULARJS_MODULE_SANITIZE
 	bool "sanitize"
+	default y
 	help
 	  The ngSanitize module provides functionality to sanitize HTML.
 
 config BR2_ANGULARJS_MODULE_TOUCH
 	bool "touch"
+	default y
 	help
 	  The ngTouch module provides touch events and other helpers for
 	  touch-enabled devices. The implementation is based on jQuery Mobile
 	  touch event handling (jquerymobile.com).
 
 endif
-
-endif
diff --git a/package/angularjs/angularjs.mk b/package/angularjs/angularjs.mk
index 60dbdb6..20a129d 100644
--- a/package/angularjs/angularjs.mk
+++ b/package/angularjs/angularjs.mk
@@ -17,18 +17,24 @@ define ANGULARJS_EXTRACT_CMDS
 	rmdir $(@D)/angular-$(ANGULARJS_VERSION)
 endef
 
-ANGULARJS_FILES = angular
+# This list mirrors the list of available modules from Config.in.
+# Keep this list in sync and in the same (alphabetical) order as the
+# one in Config.in. However, always keep 'angular' first in the list.
+ANGULARJS_MODULES = \
+	angular \
+	animate \
+	aria \
+	cookies \
+	messages \
+	message-format \
+	resource \
+	route \
+	sanitize \
+	touch
 
-ANGULARJS_MODULES = animate aria cookies message-format messages resource \
-	route sanitize touch
-
-ifeq ($(BR2_ANGULARJS_MODULES),y)
-ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),\
+ANGULARJS_FILES = $(foreach mod,$(ANGULARJS_MODULES),\
 			$(if $(BR2_ANGULARJS_MODULE_$(call UPPERCASE,$(mod))),\
 				angular-$(mod)))
-else
-ANGULARJS_FILES += $(foreach mod,$(ANGULARJS_MODULES),angular-$(mod))
-endif
 
 define ANGULARJS_INSTALL_TARGET_CMDS
 	$(foreach f,$(ANGULARJS_FILES),\
-- 
1.9.1
