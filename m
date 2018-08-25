From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Aug 2018 11:16:59 +0200
Subject: [Buildroot] [PATCH/next 4/7] package/liboauth: Fix build with
 OpenSSL 1.1.x
In-Reply-To: <20180825091702.28471-1-bernd.kuhls@t-online.de>
References: <20180825091702.28471-1-bernd.kuhls@t-online.de>
Message-ID: <20180825091702.28471-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/liboauth/0001-openssl-1.1.0.patch | 154 ++++++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 package/liboauth/0001-openssl-1.1.0.patch

diff --git a/package/liboauth/0001-openssl-1.1.0.patch b/package/liboauth/0001-openssl-1.1.0.patch
new file mode 100644
index 0000000000..a33ac0a20b
--- /dev/null
+++ b/package/liboauth/0001-openssl-1.1.0.patch
@@ -0,0 +1,154 @@
+Submitted by:            DJ Lucas (dj_AT_linuxfromscratch_DOT_org)
+Date:                    2017-05-27
+Initial Package Version: 1.0.3
+Update by:               Bruce Dubbs
+Date:                    2017-06-14
+Upstream Status:         Submitted
+Origin:                  https://github.com/x42/liboauth/issues/9
+Description:             Fixes build issue with OpenSSL-1.1.0.
+Update:                  Additional fix from upstream.  Three lines changed.
+
+Downloaded from
+http://www.linuxfromscratch.org/patches/blfs/svn/liboauth-1.0.3-openssl-1.1.0-2.patch
+
+Patch was sent upstream: https://github.com/x42/liboauth/issues/9
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Naurp liboauth-1.0.3-orig/src/hash.c liboauth-1.0.3/src/hash.c
+--- liboauth-1.0.3-orig/src/hash.c	2013-10-04 08:02:50.000000000 -0500
++++ liboauth-1.0.3/src/hash.c	2017-05-27 00:51:04.708633351 -0500
+@@ -362,6 +362,11 @@ looser:
+ #include "oauth.h" // base64 encode fn's.
+ #include <openssl/hmac.h>
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000
++#define EVP_MD_CTX_new EVP_MD_CTX_create
++#define EVP_MD_CTX_free EVP_MD_CTX_destroy
++#endif
++
+ char *oauth_sign_hmac_sha1 (const char *m, const char *k) {
+   return(oauth_sign_hmac_sha1_raw (m, strlen(m), k, strlen(k)));
+ }
+@@ -386,7 +391,7 @@ char *oauth_sign_rsa_sha1 (const char *m
+   unsigned char *sig = NULL;
+   unsigned char *passphrase = NULL;
+   unsigned int len=0;
+-  EVP_MD_CTX md_ctx;
++  EVP_MD_CTX *md_ctx;
+ 
+   EVP_PKEY *pkey;
+   BIO *in;
+@@ -399,24 +404,31 @@ char *oauth_sign_rsa_sha1 (const char *m
+     return xstrdup("liboauth/OpenSSL: can not read private key");
+   }
+ 
++  md_ctx = EVP_MD_CTX_new();
++  if (md_ctx == NULL) {
++          return xstrdup("liboauth/OpenSSL: failed to allocate EVP_MD_CTX");
++  }
++
+   len = EVP_PKEY_size(pkey);
+   sig = (unsigned char*)xmalloc((len+1)*sizeof(char));
+ 
+-  EVP_SignInit(&md_ctx, EVP_sha1());
+-  EVP_SignUpdate(&md_ctx, m, strlen(m));
+-  if (EVP_SignFinal (&md_ctx, sig, &len, pkey)) {
++  EVP_SignInit(md_ctx, EVP_sha1());
++  EVP_SignUpdate(md_ctx, m, strlen(m));
++  if (EVP_SignFinal (md_ctx, sig, &len, pkey)) {
+     char *tmp;
+     sig[len] = '\0';
+     tmp = oauth_encode_base64(len,sig);
+     OPENSSL_free(sig);
+     EVP_PKEY_free(pkey);
++    EVP_MD_CTX_free(md_ctx);
+     return tmp;
+   }
++  EVP_MD_CTX_free(md_ctx);
+   return xstrdup("liboauth/OpenSSL: rsa-sha1 signing failed");
+ }
+ 
+ int oauth_verify_rsa_sha1 (const char *m, const char *c, const char *s) {
+-  EVP_MD_CTX md_ctx;
++  EVP_MD_CTX *md_ctx;
+   EVP_PKEY *pkey;
+   BIO *in;
+   X509 *cert = NULL;
+@@ -437,13 +449,18 @@ int oauth_verify_rsa_sha1 (const char *m
+     return -2;
+   }
+ 
++	md_ctx = EVP_MD_CTX_new();
++	if (md_ctx == NULL) {
++		return -2;
++	}
++
+   b64d= (unsigned char*) xmalloc(sizeof(char)*strlen(s));
+   slen = oauth_decode_base64(b64d, s);
+ 
+-  EVP_VerifyInit(&md_ctx, EVP_sha1());
+-  EVP_VerifyUpdate(&md_ctx, m, strlen(m));
+-  err = EVP_VerifyFinal(&md_ctx, b64d, slen, pkey);
+-  EVP_MD_CTX_cleanup(&md_ctx);
++  EVP_VerifyInit(md_ctx, EVP_sha1());
++  EVP_VerifyUpdate(md_ctx, m, strlen(m));
++  err = EVP_VerifyFinal(md_ctx, b64d, slen, pkey);
++  EVP_MD_CTX_free(pkey);
+   EVP_PKEY_free(pkey);
+   xfree(b64d);
+   return (err);
+@@ -455,35 +472,41 @@ int oauth_verify_rsa_sha1 (const char *m
+  */
+ char *oauth_body_hash_file(char *filename) {
+   unsigned char fb[BUFSIZ];
+-  EVP_MD_CTX ctx;
++  EVP_MD_CTX *ctx;
+   size_t len=0;
+   unsigned char *md;
+   FILE *F= fopen(filename, "r");
+   if (!F) return NULL;
+ 
+-  EVP_MD_CTX_init(&ctx);
+-  EVP_DigestInit(&ctx,EVP_sha1());
++  ctx = EVP_MD_CTX_new();
++  if (ctx == NULL) {
++          return xstrdup("liboauth/OpenSSL: failed to allocate EVP_MD_CTX");
++  }
++  EVP_DigestInit(ctx,EVP_sha1());
+   while (!feof(F) && (len=fread(fb,sizeof(char),BUFSIZ, F))>0) {
+-    EVP_DigestUpdate(&ctx, fb, len);
++    EVP_DigestUpdate(ctx, fb, len);
+   }
+   fclose(F);
+   len=0;
+   md=(unsigned char*) xcalloc(EVP_MD_size(EVP_sha1()),sizeof(unsigned char));
+-  EVP_DigestFinal(&ctx, md,(unsigned int*) &len);
+-  EVP_MD_CTX_cleanup(&ctx);
++  EVP_DigestFinal(ctx, md,(unsigned int*) &len);
++  EVP_MD_CTX_free(ctx);
+   return oauth_body_hash_encode(len, md);
+ }
+ 
+ char *oauth_body_hash_data(size_t length, const char *data) {
+-  EVP_MD_CTX ctx;
++  EVP_MD_CTX *ctx;
+   size_t len=0;
+   unsigned char *md;
+   md=(unsigned char*) xcalloc(EVP_MD_size(EVP_sha1()),sizeof(unsigned char));
+-  EVP_MD_CTX_init(&ctx);
+-  EVP_DigestInit(&ctx,EVP_sha1());
+-  EVP_DigestUpdate(&ctx, data, length);
+-  EVP_DigestFinal(&ctx, md,(unsigned int*) &len);
+-  EVP_MD_CTX_cleanup(&ctx);
++  ctx = EVP_MD_CTX_new();
++  if (ctx == NULL) {
++          return xstrdup("liboauth/OpenSSL: failed to allocate EVP_MD_CTX");
++  }
++  EVP_DigestInit(ctx,EVP_sha1());
++  EVP_DigestUpdate(ctx, data, length);
++  EVP_DigestFinal(ctx, md,(unsigned int*) &len);
++  EVP_MD_CTX_free(ctx);
+   return oauth_body_hash_encode(len, md);
+ }
+ 
-- 
2.18.0
