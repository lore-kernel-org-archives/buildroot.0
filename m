From: Martin Bark <martin@barkynet.com>
Date: Tue,  3 May 2016 10:36:54 +0100
Subject: [Buildroot] [PATCH v2 3/6] package/nginx: bump version to 1.10.0
In-Reply-To: <1462268217-31545-1-git-send-email-martin@barkynet.com>
References: <1462268217-31545-1-git-send-email-martin@barkynet.com>
Message-ID: <1462268217-31545-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ngx_http_spdy_module has been superseded by the ngx_http_v2_module
so BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE has changed to
BR2_PACKAGE_NGINX_HTTP_V2_MODULE

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - split setting --with-mail into separate patch
   (suggested by Thomas Petazzoni)
---
 Config.in.legacy                                              |  9 +++++++++
 ...auto-type-sizeof-rework-autotest-to-be-cross-compila.patch | 11 +++--------
 package/nginx/Config.in                                       |  4 ++--
 package/nginx/nginx.hash                                      |  2 +-
 package/nginx/nginx.mk                                        |  6 +++---
 5 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9f694f8..fd1c5bc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE
+	bool "nginx http spdy module removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_NGINX_HTTP_V2_MODULE
+	help
+	  The ngx_http_spdy_module has been superseded by the ngx_http_v2_module
+	  since nginx v1.9.5.  The ngx_http_v2_module modules has been automatically
+	  selected in your configuration.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	bool "PowerPC Sourcery toolchain has been removed"
 	select BR2_LEGACY
diff --git a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
index 496459e..829a435 100644
--- a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
+++ b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
@@ -13,6 +13,8 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Refresh for 1.8.0.
 
 Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
+[martin at barkynet.com: Updated for 1.10.0]
+Signed-off-by: Martin Bark <martin@barkynet.com>
 ---
  auto/types/sizeof | 42 ++++++++++++++++++++++++++++--------------
  1 file changed, 28 insertions(+), 14 deletions(-)
@@ -30,7 +32,7 @@ index a5f66bb..c6f31ec 100644
  
  #include <sys/types.h>
  #include <sys/time.h>
-@@ -25,29 +25,43 @@ $NGX_INCLUDE_UNISTD_H
+@@ -25,22 +25,40 @@ $NGX_INCLUDE_UNISTD_H
  $NGX_INCLUDE_INTTYPES_H
  $NGX_INCLUDE_AUTO_CONFIG_H
  
@@ -80,13 +82,6 @@ index a5f66bb..c6f31ec 100644
      echo " $ngx_size bytes"
  fi
  
--
--rm -rf $NGX_AUTOTEST*
--
--
- case $ngx_size in
-     4)
-         ngx_max_value=2147483647
 -- 
 1.9.1
 
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index be445f4..0c39a63 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -36,8 +36,8 @@ config BR2_PACKAGE_NGINX_HTTP_SSL_MODULE
 	help
 	  Enable ngx_http_ssl_module
 
-config BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE
-	bool "ngx_http_spdy_module"
+config BR2_PACKAGE_NGINX_HTTP_V2_MODULE
+	bool "ngx_http_v2_module"
 	select BR2_PACKAGE_ZLIB
 	help
 	  Enable ngx_http_spdy_module
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index fe4d6b2..394f4d2 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	8f4b3c630966c044ec72715754334d1fdf741caa1d5795fb4646c27d09f797b7	nginx-1.8.1.tar.gz
+sha256	8ed647c3dd65bc4ced03b0e0f6bf9e633eff6b01bac772bcf97077d58bc2be4d	nginx-1.10.0.tar.gz
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index f6bae7e..25fb9a8 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.8.1
+NGINX_VERSION = 1.10.0
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2c
 NGINX_LICENSE_FILES = LICENSE
@@ -104,9 +104,9 @@ else
 NGINX_CONF_OPTS += --without-http-cache
 endif
 
-ifeq ($(BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE),y)
+ifeq ($(BR2_PACKAGE_NGINX_HTTP_V2_MODULE),y)
 NGINX_DEPENDENCIES += zlib
-NGINX_CONF_OPTS += --with-http_spdy_module
+NGINX_CONF_OPTS += --with-http_v2_module
 endif
 
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_SSL_MODULE),y)
-- 
2.7.4
