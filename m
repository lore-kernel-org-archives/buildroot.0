From: Martin Bark <martin@barkynet.com>
Date: Mon,  9 May 2016 12:29:00 +0100
Subject: [Buildroot] [PATCH 2/5] package/nginx: fix openssl support
In-Reply-To: <1462793343-20234-1-git-send-email-martin@barkynet.com>
References: <1462793343-20234-1-git-send-email-martin@barkynet.com>
Message-ID: <1462793343-20234-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change to using pkg-config to find openssl and its dependencies.

This fixes:
 http://autobuild.buildroot.net/results/17db76c3a099e7592af343bbe119dfe717cd7999/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 ...0006-auto-lib-openssl-conf-use-pkg-config.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch

diff --git a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
new file mode 100644
index 0000000..494e6f4
--- /dev/null
+++ b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
@@ -0,0 +1,31 @@
+From 756556d127da291cad8a2c007a89124a692aef7f Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Fri, 6 May 2016 14:48:31 +0100
+Subject: [PATCH 6/8] auto/lib/openssl/conf: use pkg-config
+
+Change to using pkg-config to find the path to openssl and its
+dependencies.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ auto/lib/openssl/conf | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/auto/lib/openssl/conf b/auto/lib/openssl/conf
+index 39d9602..995c6f3 100644
+--- a/auto/lib/openssl/conf
++++ b/auto/lib/openssl/conf
+@@ -50,8 +50,8 @@ else
+         ngx_feature_name="NGX_OPENSSL"
+         ngx_feature_run=no
+         ngx_feature_incs="#include <openssl/ssl.h>"
+-        ngx_feature_path=
+-        ngx_feature_libs="-lssl -lcrypto $NGX_LIBDL"
++        ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I openssl|sed 's/-I//g')"
++        ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs openssl)"
+         ngx_feature_test="SSL_CTX_set_options(NULL, 0)"
+         . auto/feature
+ 
+-- 
+2.8.2
+
-- 
2.8.2
