From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  6 Feb 2019 06:09:18 -0600
Subject: [Buildroot] [PATCH] package/sqlcipher: add OpenSSL 1.1.x
 compatibility
Message-ID: <1549454958-648-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/5e2/5e2c3178d8a6e11b1af1c37144737097730ba222/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Tested using autobuilder failure setup for libopenssl.

For libressl the build fails. The sqlcipher pkg version really should
be bumped before investigating the build failure as there are a number
of commits that should be picked up.
Currently the pkg build won't pass the configure stage.
Should I open a bug for this or send something for "next"?
---
 .../0001-Support-OpenSSL-1.1.0-and-prior.patch     | 97 ++++++++++++++++++++++
 ...SL-init-and-cleanup-routines-on-versions-.patch | 42 ++++++++++
 ...3-correct-compliation-under-openssl-1.1.x.patch | 48 +++++++++++
 3 files changed, 187 insertions(+)
 create mode 100644 package/sqlcipher/0001-Support-OpenSSL-1.1.0-and-prior.patch
 create mode 100644 package/sqlcipher/0002-Guard-OpenSSL-init-and-cleanup-routines-on-versions-.patch
 create mode 100644 package/sqlcipher/0003-correct-compliation-under-openssl-1.1.x.patch

diff --git a/package/sqlcipher/0001-Support-OpenSSL-1.1.0-and-prior.patch b/package/sqlcipher/0001-Support-OpenSSL-1.1.0-and-prior.patch
new file mode 100644
index 0000000..32a16a8
--- /dev/null
+++ b/package/sqlcipher/0001-Support-OpenSSL-1.1.0-and-prior.patch
@@ -0,0 +1,97 @@
+From 43f71fa7b4c6a20f4078b9098369abb8d38a5617 Mon Sep 17 00:00:00 2001
+From: Nick Parker <nparker@zetetic.net>
+Date: Fri, 9 Dec 2016 11:47:39 -0600
+Subject: [PATCH 1/3] Support OpenSSL 1.1.0 and prior
+
+(cherry picked from commit 939c83a007e4724436c3955ae2afd8b11b92d867)
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+---
+ src/crypto_openssl.c | 53 +++++++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 38 insertions(+), 15 deletions(-)
+
+diff --git a/src/crypto_openssl.c b/src/crypto_openssl.c
+index 150ab92..6822325 100644
+--- a/src/crypto_openssl.c
++++ b/src/crypto_openssl.c
+@@ -47,6 +47,29 @@ static unsigned int openssl_external_init = 0;
+ static unsigned int openssl_init_count = 0;
+ static sqlite3_mutex* openssl_rand_mutex = NULL;
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++static HMAC_CTX *HMAC_CTX_new(void)
++{
++  HMAC_CTX *ctx = OPENSSL_malloc(sizeof(*ctx));
++  if (ctx != NULL) {
++    HMAC_CTX_init(ctx);
++  }
++  return ctx;
++}
++
++// Per 1.1.0 (https://wiki.openssl.org/index.php/1.1_API_Changes)
++// HMAC_CTX_free should call HMAC_CTX_cleanup, then EVP_MD_CTX_Cleanup.
++// HMAC_CTX_cleanup internally calls EVP_MD_CTX_cleanup so these
++// calls are not needed.
++static void HMAC_CTX_free(HMAC_CTX *ctx)
++{
++  if (ctx != NULL) {
++    HMAC_CTX_cleanup(ctx);
++    OPENSSL_free(ctx);
++  }
++}
++#endif
++
+ static int sqlcipher_openssl_add_random(void *ctx, void *buffer, int length) {
+ #ifndef SQLCIPHER_OPENSSL_NO_MUTEX_RAND
+   sqlite3_mutex_enter(openssl_rand_mutex);
+@@ -143,14 +166,14 @@ static int sqlcipher_openssl_random (void *ctx, void *buffer, int length) {
+ }
+ 
+ static int sqlcipher_openssl_hmac(void *ctx, unsigned char *hmac_key, int key_sz, unsigned char *in, int in_sz, unsigned char *in2, int in2_sz, unsigned char *out) {
+-  HMAC_CTX hctx;
+   unsigned int outlen;
+-  HMAC_CTX_init(&hctx);
+-  HMAC_Init_ex(&hctx, hmac_key, key_sz, EVP_sha1(), NULL);
+-  HMAC_Update(&hctx, in, in_sz);
+-  HMAC_Update(&hctx, in2, in2_sz);
+-  HMAC_Final(&hctx, out, &outlen);
+-  HMAC_CTX_cleanup(&hctx);
++  HMAC_CTX* hctx = HMAC_CTX_new();
++  if(hctx == NULL) return SQLITE_ERROR;
++  HMAC_Init_ex(hctx, hmac_key, key_sz, EVP_sha1(), NULL);
++  HMAC_Update(hctx, in, in_sz);
++  HMAC_Update(hctx, in2, in2_sz);
++  HMAC_Final(hctx, out, &outlen);
++  HMAC_CTX_free(hctx);
+   return SQLITE_OK; 
+ }
+ 
+@@ -160,18 +183,18 @@ static int sqlcipher_openssl_kdf(void *ctx, const unsigned char *pass, int pass_
+ }
+ 
+ static int sqlcipher_openssl_cipher(void *ctx, int mode, unsigned char *key, int key_sz, unsigned char *iv, unsigned char *in, int in_sz, unsigned char *out) {
+-  EVP_CIPHER_CTX ectx;
+   int tmp_csz, csz;
+- 
+-  EVP_CipherInit(&ectx, ((openssl_ctx *)ctx)->evp_cipher, NULL, NULL, mode);
+-  EVP_CIPHER_CTX_set_padding(&ectx, 0); // no padding
+-  EVP_CipherInit(&ectx, NULL, key, iv, mode);
+-  EVP_CipherUpdate(&ectx, out, &tmp_csz, in, in_sz);
++  EVP_CIPHER_CTX* ectx = EVP_CIPHER_CTX_new();
++  if(ectx == NULL) return SQLITE_ERROR;
++  EVP_CipherInit_ex(ectx, ((openssl_ctx *)ctx)->evp_cipher, NULL, NULL, NULL, mode);
++  EVP_CIPHER_CTX_set_padding(ectx, 0); // no padding
++  EVP_CipherInit_ex(ectx, NULL, NULL, key, iv, mode);
++  EVP_CipherUpdate(ectx, out, &tmp_csz, in, in_sz);
+   csz = tmp_csz;  
+   out += tmp_csz;
+-  EVP_CipherFinal(&ectx, out, &tmp_csz);
++  EVP_CipherFinal_ex(ectx, out, &tmp_csz);
+   csz += tmp_csz;
+-  EVP_CIPHER_CTX_cleanup(&ectx);
++  EVP_CIPHER_CTX_free(ectx);
+   assert(in_sz == csz);
+   return SQLITE_OK; 
+ }
+-- 
+1.9.1
+
diff --git a/package/sqlcipher/0002-Guard-OpenSSL-init-and-cleanup-routines-on-versions-.patch b/package/sqlcipher/0002-Guard-OpenSSL-init-and-cleanup-routines-on-versions-.patch
new file mode 100644
index 0000000..e8bdfcb
--- /dev/null
+++ b/package/sqlcipher/0002-Guard-OpenSSL-init-and-cleanup-routines-on-versions-.patch
@@ -0,0 +1,42 @@
+From 6b4dbecbcfe35d36fea264c04c41b338852d4e88 Mon Sep 17 00:00:00 2001
+From: Nick Parker <nparker@zetetic.net>
+Date: Wed, 1 Mar 2017 15:35:43 -0600
+Subject: [PATCH 2/3] Guard OpenSSL init and cleanup routines on versions less
+ than 1.1.0
+
+(cherry picked from commit 1c495b933cee3381f1ea6a70edcbcda1754d7409)
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+
+Conflicts:
+	src/crypto_openssl.c
+---
+ src/crypto_openssl.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/crypto_openssl.c b/src/crypto_openssl.c
+index 6822325..09bc2a2 100644
+--- a/src/crypto_openssl.c
++++ b/src/crypto_openssl.c
+@@ -102,7 +102,9 @@ static int sqlcipher_openssl_activate(void *ctx) {
+ 
+   if(openssl_init_count == 0 && openssl_external_init == 0)  {
+     /* if the library was not externally initialized, then should be now */
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+     OpenSSL_add_all_algorithms();
++#endif
+   } 
+ 
+ #ifndef SQLCIPHER_OPENSSL_NO_MUTEX_RAND
+@@ -131,7 +133,9 @@ static int sqlcipher_openssl_deactivate(void *ctx) {
+        Note: this code will only be reached if OpensSSL_add_all_algorithms()
+        is called by SQLCipher internally. This should prevent SQLCipher from 
+        "cleaning up" openssl when it was initialized externally by the program */
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+       EVP_cleanup();
++#endif
+     }
+ #ifndef SQLCIPHER_OPENSSL_NO_MUTEX_RAND
+     sqlite3_mutex_free(openssl_rand_mutex);
+-- 
+1.9.1
+
diff --git a/package/sqlcipher/0003-correct-compliation-under-openssl-1.1.x.patch b/package/sqlcipher/0003-correct-compliation-under-openssl-1.1.x.patch
new file mode 100644
index 0000000..9dedcbf
--- /dev/null
+++ b/package/sqlcipher/0003-correct-compliation-under-openssl-1.1.x.patch
@@ -0,0 +1,48 @@
+From 3da532754fb2bb7d379d4386a8c3339742edfb0b Mon Sep 17 00:00:00 2001
+From: Stephen Lombardo <sjlombardo@zetetic.net>
+Date: Wed, 10 Oct 2018 15:55:49 -0400
+Subject: [PATCH 3/3] correct compliation under openssl 1.1.x
+
+(cherry picked from commit 57ea35296ce7f2c1c93ce79194eea19a008b69ae)
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+
+Conflicts:
+	src/crypto_openssl.c
+---
+ src/crypto_openssl.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/crypto_openssl.c b/src/crypto_openssl.c
+index 09bc2a2..57a1104 100644
+--- a/src/crypto_openssl.c
++++ b/src/crypto_openssl.c
+@@ -47,7 +47,7 @@ static unsigned int openssl_external_init = 0;
+ static unsigned int openssl_init_count = 0;
+ static sqlite3_mutex* openssl_rand_mutex = NULL;
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if (defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100000L) || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L)
+ static HMAC_CTX *HMAC_CTX_new(void)
+ {
+   HMAC_CTX *ctx = OPENSSL_malloc(sizeof(*ctx));
+@@ -102,7 +102,7 @@ static int sqlcipher_openssl_activate(void *ctx) {
+ 
+   if(openssl_init_count == 0 && openssl_external_init == 0)  {
+     /* if the library was not externally initialized, then should be now */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if (defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100000L) || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L)
+     OpenSSL_add_all_algorithms();
+ #endif
+   } 
+@@ -133,7 +133,7 @@ static int sqlcipher_openssl_deactivate(void *ctx) {
+        Note: this code will only be reached if OpensSSL_add_all_algorithms()
+        is called by SQLCipher internally. This should prevent SQLCipher from 
+        "cleaning up" openssl when it was initialized externally by the program */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if (defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100000L) || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L)
+       EVP_cleanup();
+ #endif
+     }
+-- 
+1.9.1
+
-- 
1.9.1
