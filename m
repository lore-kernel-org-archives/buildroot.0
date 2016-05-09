From: Martin Bark <martin@barkynet.com>
Date: Mon,  9 May 2016 12:28:59 +0100
Subject: [Buildroot] [PATCH 1/5] package/nginx: fix libxslt support
Message-ID: <1462793343-20234-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change to using pkg-config to find libxslt and it dependencies.

This Fixes:
 http://autobuild.buildroot.net/results/382699bbed15f598625b9296e464d1349ef559f8

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 ...bxslt-conf-allow-to-override-ngx_feature_.patch | 42 ----------------------
 ...0004-auto-lib-libxslt-conf-use-pkg-config.patch | 31 ++++++++++++++++
 package/nginx/nginx.mk                             |  7 ++--
 3 files changed, 35 insertions(+), 45 deletions(-)
 delete mode 100644 package/nginx/0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
 create mode 100644 package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch

diff --git a/package/nginx/0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch b/package/nginx/0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
deleted file mode 100644
index a125a78..0000000
--- a/package/nginx/0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5d281572d0afbf69d934737e1ee4c553670a46cc Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Thu, 29 May 2014 19:22:27 +0200
-Subject: [PATCH 4/5] auto/lib/libxslt/conf: allow to override ngx_feature_path
- and ngx_feature_libs
-
-Because libxml2 headers are not in /usr/include by default, hardcoding the
-include directory to /usr/include/libxml2 does not play well when
-cross-compiling, or if libxml2 has been installed somewhere else.
-
-This patch allows to define/override the libxslt include directory, and
-the libxslt libs flags.
-
-Being able to override the include location is especially useful when
-cross-compiling to prevent gcc from complaining about unsafe include
-location for cross-compilation (-Wpoision-system-directories).
-
-So far, this warning is only triggered by libxslt.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- auto/lib/libxslt/conf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/auto/lib/libxslt/conf b/auto/lib/libxslt/conf
-index bc19d83..386f1a0 100644
---- a/auto/lib/libxslt/conf
-+++ b/auto/lib/libxslt/conf
-@@ -12,8 +12,8 @@
-                       #include <libxslt/xsltInternals.h>
-                       #include <libxslt/transform.h>
-                       #include <libxslt/xsltutils.h>"
--    ngx_feature_path="/usr/include/libxml2"
--    ngx_feature_libs="-lxml2 -lxslt"
-+    ngx_feature_path="${ngx_feature_path_libxslt:=/usr/include/libxml2}"
-+    ngx_feature_libs="${ngx_feature_libs_libxslt:=-lxml2 -lxslt}"
-     ngx_feature_test="xmlParserCtxtPtr    ctxt = NULL;
-                       xsltStylesheetPtr   sheet = NULL;
-                       xmlDocPtr           doc;
---
-1.9.2
-
diff --git a/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch b/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
new file mode 100644
index 0000000..1e24f0b
--- /dev/null
+++ b/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
@@ -0,0 +1,31 @@
+From 211b9f19a3a62826fadef55d2f89d6f66fbf4aa6 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Thu, 29 May 2014 19:22:27 +0200
+Subject: [PATCH 4/8] auto/lib/libxslt/conf: use pkg-config
+
+Change to using pkg-config to find the path to libxslt and its
+dependencies.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ auto/lib/libxslt/conf | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/auto/lib/libxslt/conf b/auto/lib/libxslt/conf
+index 3a0f37b..3c2a60e 100644
+--- a/auto/lib/libxslt/conf
++++ b/auto/lib/libxslt/conf
+@@ -12,8 +12,8 @@
+                       #include <libxslt/xsltInternals.h>
+                       #include <libxslt/transform.h>
+                       #include <libxslt/xsltutils.h>"
+-    ngx_feature_path="/usr/include/libxml2"
+-    ngx_feature_libs="-lxml2 -lxslt"
++    ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I libxslt|sed 's/-I//g')"
++    ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs libxslt)"
+     ngx_feature_test="xmlParserCtxtPtr    ctxt = NULL;
+                       xsltStylesheetPtr   sheet = NULL;
+                       xmlDocPtr           doc;
+-- 
+2.8.2
+
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index c1e8367..24f4ac3 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -8,6 +8,7 @@ NGINX_VERSION = 1.10.0
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2c
 NGINX_LICENSE_FILES = LICENSE
+NGINX_DEPENDENCIES = host-pkgconf
 
 NGINX_CONF_OPTS = \
 	--crossbuild=Linux::$(BR2_ARCH) \
@@ -118,8 +119,6 @@ endif
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_XSLT_MODULE),y)
 NGINX_DEPENDENCIES += libxml2 libxslt
 NGINX_CONF_OPTS += --with-http_xslt_module
-NGINX_CONF_ENV += \
-	ngx_feature_path_libxslt=$(STAGING_DIR)/usr/include/libxml2
 endif
 
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_IMAGE_FILTER_MODULE),y)
@@ -236,7 +235,9 @@ endef
 NGINX_PRE_CONFIGURE_HOOKS += NGINX_DISABLE_WERROR
 
 define NGINX_CONFIGURE_CMDS
-	cd $(@D) ; $(NGINX_CONF_ENV) ./configure $(NGINX_CONF_OPTS)
+	cd $(@D) ; $(NGINX_CONF_ENV) \
+		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		./configure $(NGINX_CONF_OPTS)
 endef
 
 define NGINX_BUILD_CMDS
-- 
2.8.2
