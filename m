From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Nov 2018 09:02:32 +0100
Subject: [Buildroot] [git commit] package/civetweb: fix lua build
Message-ID: <20181202071601.8E09C81829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a34e386dc6f69df239b5c43a2e0aaf64b890f29c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dlfcn.h must be included in modlua.ini to be able to use dlopen
otherwise build will fail on:
src/mod_lua.inl:2845:41: error: 'RTLD_LAZY' undeclared (first use in this function)
  lib_handle_uuid = dlopen("libuuid.so", RTLD_LAZY);

Fixes:
 - http://autobuild.buildroot.org/results/7a189f49c5a8b6f7b3d4c57cda5982adc65dbc19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../civetweb/0001-modlua.ini-include-dlfcn.h.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

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
