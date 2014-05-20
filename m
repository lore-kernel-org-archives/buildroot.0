From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 20 May 2014 17:06:09 +0300
Subject: [Buildroot] [PATCH] ruby: fix build with recent openssl versions
Message-ID: <1400594769-31393-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 ...declare-OP_MSIE_SSLV2_RSA_PADDING-only-if.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/ruby/ruby-0001-ossl_ssl.c-declare-OP_MSIE_SSLV2_RSA_PADDING-only-if.patch

diff --git a/package/ruby/ruby-0001-ossl_ssl.c-declare-OP_MSIE_SSLV2_RSA_PADDING-only-if.patch b/package/ruby/ruby-0001-ossl_ssl.c-declare-OP_MSIE_SSLV2_RSA_PADDING-only-if.patch
new file mode 100644
index 0000000..8019647
--- /dev/null
+++ b/package/ruby/ruby-0001-ossl_ssl.c-declare-OP_MSIE_SSLV2_RSA_PADDING-only-if.patch
@@ -0,0 +1,37 @@
+From 32e5a572d3ade888c3f8b4dfebd490e343f387ad Mon Sep 17 00:00:00 2001
+From: nobu <nobu@b2dd03c8-39d4-4d8f-98ff-823fe69b080e>
+Date: Wed, 25 Dec 2013 01:42:09 +0000
+Subject: [PATCH] ossl_ssl.c: declare OP_MSIE_SSLV2_RSA_PADDING only if defined
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* ext/openssl/ossl_ssl.c (Init_ossl_ssl): Declare a constant
+  `OP_MSIE_SSLV2_RSA_PADDING` only if the macro is defined.  The
+  `SSL_OP_MSIE_SSLV2_RSA_PADDING` has been removed from latest
+  snapshot of OpenSSL 1.0.1.  [Fixes GH-488]
+
+git-svn-id: svn+ssh://ci.ruby-lang.org/ruby/trunk at 44402 b2dd03c8-39d4-4d8f-98ff-823fe69b080e
+(cherry picked from commit 1e7a929c1d44d7a368fbe379211183ac6c972920)
+Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
+---
+ ext/openssl/ossl_ssl.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ext/openssl/ossl_ssl.c b/ext/openssl/ossl_ssl.c
+index e437e7e..01e8c06 100644
+--- a/ext/openssl/ossl_ssl.c
++++ b/ext/openssl/ossl_ssl.c
+@@ -1985,7 +1985,9 @@ Init_ossl_ssl()
+     ossl_ssl_def_const(OP_NETSCAPE_REUSE_CIPHER_CHANGE_BUG);
+     ossl_ssl_def_const(OP_SSLREF2_REUSE_CERT_TYPE_BUG);
+     ossl_ssl_def_const(OP_MICROSOFT_BIG_SSLV3_BUFFER);
++#if defined(SSL_OP_MSIE_SSLV2_RSA_PADDING)
+     ossl_ssl_def_const(OP_MSIE_SSLV2_RSA_PADDING);
++#endif
+     ossl_ssl_def_const(OP_SSLEAY_080_CLIENT_DH_BUG);
+     ossl_ssl_def_const(OP_TLS_D5_BUG);
+     ossl_ssl_def_const(OP_TLS_BLOCK_PADDING_BUG);
+-- 
+1.9.1
+
-- 
1.9.1
