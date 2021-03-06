From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Mar 2021 15:35:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/libeXosip2: fix build with libressl
Message-ID: <20210306143512.2279505-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with libressl is broken since version 5.1.0 and
https://git.savannah.nongnu.org/cgit/exosip.git/commit/?id=d7488b7bbf59870192372384ef338a44be23e888

For an unknown reason, we only have one autobuilder failure with version
5.2.0

Fixes:
 - http://autobuild.buildroot.org/results/89d8d4ba99d6dcc1618cf6b5302c124a92d75be9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...eXtls_dtls.c-fix-build-with-libressl.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch

diff --git a/package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch b/package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch
new file mode 100644
index 0000000000..b153eee65c
--- /dev/null
+++ b/package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch
@@ -0,0 +1,34 @@
+From 178632fa5530a72f50376a60d59be2a07e65c28b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 6 Mar 2021 15:20:51 +0100
+Subject: [PATCH] src/eXtls_dtls.c: fix build with libressl
+
+Build with libressl is broken since
+https://git.savannah.nongnu.org/cgit/exosip.git/commit/?id=d7488b7bbf59870192372384ef338a44be23e888
+because libressl does not define SSL_set0_rbio
+
+Fixes:
+ - http://autobuild.buildroot.org/results/89d8d4ba99d6dcc1618cf6b5302c124a92d75be9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to amoizard at antisip.com]
+---
+ src/eXtl_dtls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/eXtl_dtls.c b/src/eXtl_dtls.c
+index 40fa658..8ac3a13 100644
+--- a/src/eXtl_dtls.c
++++ b/src/eXtl_dtls.c
+@@ -70,7 +70,7 @@
+ #define RANDOM  "random.pem"
+ #define DHFILE "dh1024.pem"
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 
+ static void
+ SSL_set0_rbio (SSL * s, BIO * rbio)
+-- 
+2.30.0
+
-- 
2.30.0
