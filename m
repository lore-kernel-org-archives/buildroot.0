From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 22:51:31 +0200
Subject: [Buildroot] [git commit] package/nginx: add http geoip support
Message-ID: <20200621205524.49F2983A2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f5500cf5cfa4238c972537c005581ece2ab8625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http geoip module is available since version 0.8.6 and
https://github.com/nginx/nginx/commit/bc10147b9f36f1a61b96ceec016bf4d4d12e128f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nginx/Config.in | 6 ++++++
 package/nginx/nginx.mk  | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 5c34f11edd..0dbeaae2ff 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -75,6 +75,12 @@ config BR2_PACKAGE_NGINX_HTTP_IMAGE_FILTER_MODULE
 	help
 	  Enable ngx_http_image_filter_module
 
+config BR2_PACKAGE_NGINX_HTTP_GEOIP_MODULE
+	bool "ngx_http_geoip_module"
+	select BR2_PACKAGE_GEOIP
+	help
+	  Enable ngx_http_geoip_module
+
 config BR2_PACKAGE_NGINX_HTTP_SUB_MODULE
 	bool "ngx_http_sub_module"
 	help
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 0ceed7857f..3f249096bc 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -85,7 +85,6 @@ endif
 
 # modules disabled or not activated because of missing dependencies:
 # - google_perftools  (googleperftools)
-# - http_geoip_module (geoip)
 # - http_perl_module  (host-perl)
 # - pcre-jit          (want to rebuild pcre)
 
@@ -134,6 +133,11 @@ NGINX_DEPENDENCIES += gd jpeg libpng
 NGINX_CONF_OPTS += --with-http_image_filter_module
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_GEOIP_MODULE),y)
+NGINX_DEPENDENCIES += geoip
+NGINX_CONF_OPTS += --with-http_geoip_module
+endif
+
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_GUNZIP_MODULE),y)
 NGINX_DEPENDENCIES += zlib
 NGINX_CONF_OPTS += --with-http_gunzip_module
