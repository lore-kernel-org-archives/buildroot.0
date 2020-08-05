From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 22:53:37 +0200
Subject: [Buildroot] [git commit] package/nginx: drop gdlib-config
Message-ID: <20200805210223.DAF27812D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61ac7fcc6c5ef8c4c6e27e36db1d1ea8431ad79e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop gdlib-config and use pkg-config to find gd.
Indeed, gdlib.pc is available since version 2.1.0 and
https://github.com/libgd/libgd/commit/071a2a94ee9f9e5ce00ff689dfe67a0fcb885ad6
and gdlib-config has been dropped from version 2.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch | 9 ++++++---
 package/nginx/nginx.mk                                      | 1 -
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch b/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
index cea68035e1..31ccf88fff 100644
--- a/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
+++ b/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
@@ -9,6 +9,8 @@ dependencies.
 Signed-off-by: Martin Bark <martin@barkynet.com>
 [Peter: updated for 1.15.6]
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Fabrice: use pkg-config instead of gdlib-config]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  auto/lib/libgd/conf | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -17,14 +19,15 @@ diff --git a/auto/lib/libgd/conf b/auto/lib/libgd/conf
 index 67863976..1a4379a5 100644
 --- a/auto/lib/libgd/conf
 +++ b/auto/lib/libgd/conf
-@@ -7,8 +7,8 @@
+@@ -7,8 +7,9 @@
      ngx_feature_name=
      ngx_feature_run=no
      ngx_feature_incs="#include <gd.h>"
 -    ngx_feature_path=
 -    ngx_feature_libs="-lgd"
-+    ngx_feature_path="$(${GDLIB_CONFIG:=gdlib-config} --includedir)"
-+    ngx_feature_libs="$(${GDLIB_CONFIG:=gdlib-config} --libs)"
++    ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I gdlib|
++			 sed -re 's/(^|\s)-I\s*(\S+)/\1\2/g')"
++    ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs gdlib)"
      ngx_feature_test="gdImagePtr img = gdImageCreateFromGifPtr(1, NULL);
                        (void) img"
      . auto/feature
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 1180810f51..6b0b318247 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -280,7 +280,6 @@ NGINX_PRE_CONFIGURE_HOOKS += NGINX_DISABLE_WERROR
 define NGINX_CONFIGURE_CMDS
 	cd $(@D) ; $(NGINX_CONF_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config \
 		./configure $(NGINX_CONF_OPTS) \
 			--with-cc-opt="$(TARGET_CFLAGS) $(NGINX_CFLAGS)"
 endef
