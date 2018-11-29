From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 29 Nov 2018 21:52:13 +0100
Subject: [Buildroot] [PATCH/next 1/1] civetweb: fix lua build
Message-ID: <20181129205213.14830-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dlfcn.h must be included in modlua.ini to be able to use dlopen
otherwise build will fail on:
src/mod_lua.inl:2845:41: error: 'RTLD_LAZY' undeclared (first use in this function)
  lib_handle_uuid = dlopen("libuuid.so", RTLD_LAZY);

Fixes:
 - http://autobuild.buildroot.org/results/7a189f49c5a8b6f7b3d4c57cda5982adc65dbc19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../civetweb/0001-modlua.ini-include-dlfcn.h.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/civetweb/0001-modlua.ini-include-dlfcn.h.patch

diff --git a/package/civetweb/0001-modlua.ini-include-dlfcn.h.patch b/package/civetweb/0001-modlua.ini-include-dlfcn.h.patch
new file mode 100644
index 0000000000..bd1b06aedf
--- /dev/null
+++ b/package/civetweb/0001-modlua.ini-include-dlfcn.h.patch
@@ -0,0 +1,34 @@
+From ca4325c6963e505d6fb628163abf2359427ea022 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 29 Nov 2018 21:43:28 +0100
+Subject: [PATCH] modlua.ini: include dlfcn.h
+
+dlfcn.h must be included to be able to use dlopen otherwise build will
+fail on:
+src/mod_lua.inl:2845:41: error: 'RTLD_LAZY' undeclared (first use in this function)
+  lib_handle_uuid = dlopen("libuuid.so", RTLD_LAZY);
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7a189f49c5a8b6f7b3d4c57cda5982adc65dbc19
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/civetweb/civetweb/pull/706]
+---
+ src/mod_lua.inl | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/mod_lua.inl b/src/mod_lua.inl
+index 97a5de1e..ce7a4b2e 100644
+--- a/src/mod_lua.inl
++++ b/src/mod_lua.inl
+@@ -2,6 +2,7 @@
+  * See https://github.com/civetweb/civetweb/
+  */
+ 
++#include <dlfcn.h>
+ #include "civetweb_lua.h"
+ #include "civetweb_private_lua.h"
+ 
+-- 
+2.14.1
+
-- 
2.14.1
