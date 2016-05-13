From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 23:04:57 +0200
Subject: [Buildroot] [git commit] package/nginx: fix libgd support
Message-ID: <20160513212128.CA26581F97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65778b870049653980b47b4f483f0e23c1fec000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change to using gdlib-config to find libgd and its dependencies.

This fixes:
 http://autobuild.buildroot.net/results/d1806140eccb1202cb8b223289510d64fb28acb6/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0007-auto-lib-libgd-conf-use-pkg-config.patch  | 31 ++++++++++++++++++++++
 package/nginx/nginx.mk                             |  1 +
 2 files changed, 32 insertions(+)

diff --git a/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch b/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
new file mode 100644
index 0000000..3750f22
--- /dev/null
+++ b/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
@@ -0,0 +1,31 @@
+From fd9885fe5fef5826034547ca6be7299863f99769 Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Fri, 6 May 2016 14:48:49 +0100
+Subject: [PATCH 7/8] auto/lib/libgd/conf: use pkg-config
+
+Change to using pkg-config to find the path to libgd and its
+dependencies.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ auto/lib/libgd/conf | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/auto/lib/libgd/conf b/auto/lib/libgd/conf
+index 6e4e91c..1c536a2 100644
+--- a/auto/lib/libgd/conf
++++ b/auto/lib/libgd/conf
+@@ -7,8 +7,8 @@
+     ngx_feature_name=
+     ngx_feature_run=no
+     ngx_feature_incs="#include <gd.h>"
+-    ngx_feature_path=
+-    ngx_feature_libs="-lgd"
++    ngx_feature_path="$(${GDLIB_CONFIG:=gdlib-config} --includedir)"
++    ngx_feature_libs="$(${GDLIB_CONFIG:=gdlib-config} --libs)"
+     ngx_feature_test="gdImagePtr img = gdImageCreateFromGifPtr(1, NULL);"
+     . auto/feature
+ 
+-- 
+2.8.2
+
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 24f4ac3..9cc2326 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -237,6 +237,7 @@ NGINX_PRE_CONFIGURE_HOOKS += NGINX_DISABLE_WERROR
 define NGINX_CONFIGURE_CMDS
 	cd $(@D) ; $(NGINX_CONF_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config \
 		./configure $(NGINX_CONF_OPTS)
 endef
 
