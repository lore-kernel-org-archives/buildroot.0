From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Nov 2018 14:05:48 +0100
Subject: [Buildroot] [git commit] nginx: security bump to 1.15.6
Message-ID: <20181109130553.766BA81E37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2f5b3a3a866859528747edc191fb9c241343e88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

CVE-2018-16843: Excessive memory usage in HTTP/2

CVE-2018-16844: Excessive CPU usage in HTTP/2

CVE-2018-16845: Memory disclosure in the ngx_http_mp4_module

Refreshed patch 0004 + 0007 as they no longer applied cleanly.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch  | 14 ++++++++------
 .../nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch    | 12 +++++++-----
 package/nginx/nginx.hash                                   |  2 +-
 package/nginx/nginx.mk                                     |  2 +-
 4 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch b/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
index 103f90b305..09e708b73c 100644
--- a/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
+++ b/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
@@ -1,4 +1,4 @@
-From 211b9f19a3a62826fadef55d2f89d6f66fbf4aa6 Mon Sep 17 00:00:00 2001
+From 7783d63c87f94797aa134786214b0a84c000be75 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Thu, 29 May 2014 19:22:27 +0200
 Subject: [PATCH] auto/lib/libxslt/conf: use pkg-config
@@ -7,12 +7,14 @@ Change to using pkg-config to find the path to libxslt and its
 dependencies.
 
 Signed-off-by: Martin Bark <martin@barkynet.com>
+[Peter: updated for 1.15.6]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
- auto/lib/libxslt/conf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ auto/lib/libxslt/conf | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/auto/lib/libxslt/conf b/auto/lib/libxslt/conf
-index 3a0f37b..3c2a60e 100644
+index 3063ac7c..3209e364 100644
 --- a/auto/lib/libxslt/conf
 +++ b/auto/lib/libxslt/conf
 @@ -12,8 +12,9 @@
@@ -26,7 +28,7 @@ index 3a0f37b..3c2a60e 100644
 +    ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs libxslt)"
      ngx_feature_test="xmlParserCtxtPtr    ctxt = NULL;
                        xsltStylesheetPtr   sheet = NULL;
-                       xmlDocPtr           doc;
+                       xmlDocPtr           doc = NULL;
 -- 
-2.8.2
+2.11.0
 
diff --git a/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch b/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
index 34e7981c8f..cea68035e1 100644
--- a/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
+++ b/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
@@ -1,4 +1,4 @@
-From fd9885fe5fef5826034547ca6be7299863f99769 Mon Sep 17 00:00:00 2001
+From 0551f2e5eb4143be0aacc0185cdc4afc9ca80204 Mon Sep 17 00:00:00 2001
 From: Martin Bark <martin@barkynet.com>
 Date: Fri, 6 May 2016 14:48:49 +0100
 Subject: [PATCH] auto/lib/libgd/conf: use pkg-config
@@ -7,12 +7,14 @@ Change to using pkg-config to find the path to libgd and its
 dependencies.
 
 Signed-off-by: Martin Bark <martin@barkynet.com>
+[Peter: updated for 1.15.6]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  auto/lib/libgd/conf | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/auto/lib/libgd/conf b/auto/lib/libgd/conf
-index 6e4e91c..1c536a2 100644
+index 67863976..1a4379a5 100644
 --- a/auto/lib/libgd/conf
 +++ b/auto/lib/libgd/conf
 @@ -7,8 +7,8 @@
@@ -23,9 +25,9 @@ index 6e4e91c..1c536a2 100644
 -    ngx_feature_libs="-lgd"
 +    ngx_feature_path="$(${GDLIB_CONFIG:=gdlib-config} --includedir)"
 +    ngx_feature_libs="$(${GDLIB_CONFIG:=gdlib-config} --libs)"
-     ngx_feature_test="gdImagePtr img = gdImageCreateFromGifPtr(1, NULL);"
+     ngx_feature_test="gdImagePtr img = gdImageCreateFromGifPtr(1, NULL);
+                       (void) img"
      . auto/feature
- 
 -- 
-2.8.2
+2.11.0
 
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 51284aefbe..c3e6b6a720 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	b0b58c9a3fd73aa8b89edf5cfadc6641a352e0e6d3071db1eb3215d72b7fb516	nginx-1.15.0.tar.gz
+sha256	a3d8c67c2035808c7c0d475fffe263db8c353b11521aa7ade468b780ed826cc6	nginx-1.15.6.tar.gz
 # License files, locally calculated
 sha256	e18f05bcaad47528f8b21861d4a0fb9815ca1bbb4be946c51a51d36623758bcc	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 23cf2b46d5..5253174478 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.15.0
+NGINX_VERSION = 1.15.6
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
