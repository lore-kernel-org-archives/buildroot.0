From: Robert Hancock <hancock@sedsystems.ca>
Date: Thu, 10 Sep 2020 10:48:42 -0600
Subject: [Buildroot] [PATCH] package/nginx-upload: bump to latest version
Message-ID: <20200910164842.1317307-1-hancock@sedsystems.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update nginx-upload to a newer Git commit which adds upload support over
HTTP2 as well as other fixes.

Remove a patch which is no longer required in the current version.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 ...ad-module-add-openssl-lib-dependency.patch | 56 -------------------
 package/nginx-upload/nginx-upload.hash        |  2 +-
 package/nginx-upload/nginx-upload.mk          |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch

diff --git a/package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch b/package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch
deleted file mode 100644
index 1161751546..0000000000
--- a/package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 600d0a36c2af785c8284acadeb062d73247281af Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Sun, 23 Jul 2017 09:21:23 -0500
-Subject: [PATCH] nginx-upload-module: add openssl lib dependency
-
-When building against nginx 1.11.2+, requires additional
--lcrypto dependency. (Nginx changed crypto approach
-and dependencies for openssl are no longer default)
-
-More details found here:
-https://github.com/vkholodkov/nginx-upload-module/issues/79
-
-Upstream pull request:
-https://github.com/vkholodkov/nginx-upload-module/pull/93
-
-Resolves build failure:
-objs/addon/nginx-upload-70bee48f1811eecd255ed094ce9f0fb560c390c3/ngx_http_upload_module.o \
-objs/ngx_modules.o \
--ldl -lpthread -lpthread -lpcre -lz -latomic_ops \
--Wl,-E
-ngx_http_upload_module.o: In function `ngx_http_upload_flush_output_buffer':
-ngx_http_upload_module.c:1625: undefined reference to `MD5_Update'
-ngx_http_upload_module.c:1628: undefined reference to `SHA1_Update'
-ngx_http_upload_module.c:1631: undefined reference to `SHA256_Update'
-ngx_http_upload_module.c:1634: undefined reference to `SHA512_Update'
-
-Fixes:
-http://autobuild.buildroot.net/results/e25f8ba8d8743e47a77707cf582e58477e1860e6
-http://autobuild.buildroot.net/results/c4aa6e22033be934bd311cd9761f646d44618dc0
-http://autobuild.buildroot.net/results/75e935d248b46df11c32c95526423a2287ac8c62
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- config | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/config b/config
-index cabd4f1..293529f 100644
---- a/config
-+++ b/config
-@@ -1,11 +1,10 @@
--USE_MD5=YES
--USE_SHA1=YES
- ngx_addon_name=ngx_http_upload_module
- 
- if test -n "$ngx_module_link"; then
-     ngx_module_type=HTTP
-     ngx_module_name=$ngx_addon_name
-     ngx_module_srcs="$ngx_addon_dir/ngx_http_upload_module.c"
-+    ngx_module_libs="$(${PKG_CONFIG:=pkg-config} --libs openssl)"
- 
-     . auto/module
- else
--- 
-1.9.1
-
diff --git a/package/nginx-upload/nginx-upload.hash b/package/nginx-upload/nginx-upload.hash
index ac04626eb0..b1d380eb1d 100644
--- a/package/nginx-upload/nginx-upload.hash
+++ b/package/nginx-upload/nginx-upload.hash
@@ -1,3 +1,3 @@
 #Locally Computed:
-sha256  5f1c3c2b9858b9cacd877a0f2df9b9263734e9cef8d837b73f0e659c0f7fde2d  nginx-upload-70bee48f1811eecd255ed094ce9f0fb560c390c3.tar.gz
+sha256  61ad5bcb67c8f688a4c7a5611311a351049361840b8dfe78be542066f475166e  nginx-upload-4423994c7d8fb491d95867f6af968585d949e7a9.tar.gz
 sha256  825f9684c427e29fd1ab085d5c421a4cbf96a460f3c58884a42c28bfbac5e544  LICENCE
diff --git a/package/nginx-upload/nginx-upload.mk b/package/nginx-upload/nginx-upload.mk
index 738542571e..253ebeb34b 100644
--- a/package/nginx-upload/nginx-upload.mk
+++ b/package/nginx-upload/nginx-upload.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_UPLOAD_VERSION = 70bee48f1811eecd255ed094ce9f0fb560c390c3
+NGINX_UPLOAD_VERSION = 4423994c7d8fb491d95867f6af968585d949e7a9
 NGINX_UPLOAD_SITE = $(call github,vkholodkov,nginx-upload-module,$(NGINX_UPLOAD_VERSION))
 NGINX_UPLOAD_LICENSE = BSD-3-Clause
 NGINX_UPLOAD_LICENSE_FILES = LICENCE
-- 
2.18.4
