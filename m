From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Jun 2018 21:40:32 +0200
Subject: [Buildroot] [PATCH 1/1] libstrophe: bump to version 0.9.2
Message-ID: <20180605194032.32151-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove first patch (already in version, see
  https://github.com/strophe/libstrophe/pull/59)
- Use --without-xml (fixed by
  https://github.com/strophe/libstrophe/commit/3b55c20879aabad2f1b601b141d73c157972708d)
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../libstrophe/0001-Namespace-SHA-functions.patch  | 189 ---------------------
 ...nfable.patch => 0001-make-autoreconfable.patch} |   0
 package/libstrophe/libstrophe.hash                 |   4 +-
 package/libstrophe/libstrophe.mk                   |   6 +-
 4 files changed, 5 insertions(+), 194 deletions(-)
 delete mode 100644 package/libstrophe/0001-Namespace-SHA-functions.patch
 rename package/libstrophe/{0002-make-autoreconfable.patch => 0001-make-autoreconfable.patch} (100%)

diff --git a/package/libstrophe/0001-Namespace-SHA-functions.patch b/package/libstrophe/0001-Namespace-SHA-functions.patch
deleted file mode 100644
index 8c3451bbac..0000000000
--- a/package/libstrophe/0001-Namespace-SHA-functions.patch
+++ /dev/null
@@ -1,189 +0,0 @@
-From b08766c8e46956daba010044b00c97f78b598780 Mon Sep 17 00:00:00 2001
-From: Michael Santos <michael.santos@gmail.com>
-Date: Sun, 24 May 2015 10:55:02 -0400
-Subject: [PATCH] Namespace SHA functions
-
-Fix statically linking against libstrophe by renaming the internal SHA
-functions:
-
-https://github.com/strophe/libstrophe/issues/40
-
-Although the same function names are used by libstrophe and OpenSSL,
-the signatures and contexts of the SHA functions differ, resulting in
-a segfault if the OpenSSL versions are substituted.
-
-[Upstream commit: https://github.com/msantos/libstrophe/commit/b08766c8e46956daba010044b00c97f78b598780]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/auth.c  |  8 ++++----
- src/scram.c | 22 +++++++++++-----------
- src/sha1.c  | 30 +++++++++++++++---------------
- src/sha1.h  |  6 +++---
- 4 files changed, 33 insertions(+), 33 deletions(-)
-
-diff --git a/src/auth.c b/src/auth.c
-index b06f18c..3506977 100644
---- a/src/auth.c
-+++ b/src/auth.c
-@@ -1187,10 +1187,10 @@ int _handle_component_auth(xmpp_conn_t * const conn)
-     /*??Feed the session id and passphrase to the algorithm.
-      * We need to compute SHA1(session_id + passphrase)
-      */
--    SHA1_Init(&mdctx);
--    SHA1_Update(&mdctx, (uint8_t*)conn->stream_id, strlen(conn->stream_id));
--    SHA1_Update(&mdctx, (uint8_t*)conn->pass, strlen(conn->pass));
--    SHA1_Final(&mdctx, md_value);
-+    xmpp_SHA1_Init(&mdctx);
-+    xmpp_SHA1_Update(&mdctx, (uint8_t*)conn->stream_id, strlen(conn->stream_id));
-+    xmpp_SHA1_Update(&mdctx, (uint8_t*)conn->pass, strlen(conn->pass));
-+    xmpp_SHA1_Final(&mdctx, md_value);
- 
-     digest = xmpp_alloc(conn->ctx, 2*sizeof(md_value)+1);
-     if (digest) {
-diff --git a/src/scram.c b/src/scram.c
-index 5cce168..6e420e1 100644
---- a/src/scram.c
-+++ b/src/scram.c
-@@ -37,9 +37,9 @@ static void SHA1(const uint8_t* data, size_t len,
-                  uint8_t digest[SHA1_DIGEST_SIZE])
- {
-     SHA1_CTX ctx;
--    SHA1_Init(&ctx);
--    SHA1_Update(&ctx, data, len);
--    SHA1_Final(&ctx, digest);
-+    xmpp_SHA1_Init(&ctx);
-+    xmpp_SHA1_Update(&ctx, data, len);
-+    xmpp_SHA1_Final(&ctx, digest);
- }
- 
- static void HMAC_SHA1(const uint8_t *key, size_t key_len,
-@@ -66,15 +66,15 @@ static void HMAC_SHA1(const uint8_t *key, size_t key_len,
-         key_opad[i] = key_pad[i] ^ opad;
-     }
- 
--    SHA1_Init(&ctx);
--    SHA1_Update(&ctx, key_ipad, BLOCK_SIZE);
--    SHA1_Update(&ctx, text, len);
--    SHA1_Final(&ctx, sha_digest);
-+    xmpp_SHA1_Init(&ctx);
-+    xmpp_SHA1_Update(&ctx, key_ipad, BLOCK_SIZE);
-+    xmpp_SHA1_Update(&ctx, text, len);
-+    xmpp_SHA1_Final(&ctx, sha_digest);
- 
--    SHA1_Init(&ctx);
--    SHA1_Update(&ctx, key_opad, BLOCK_SIZE);
--    SHA1_Update(&ctx, sha_digest, SHA1_DIGEST_SIZE);
--    SHA1_Final(&ctx, digest);
-+    xmpp_SHA1_Init(&ctx);
-+    xmpp_SHA1_Update(&ctx, key_opad, BLOCK_SIZE);
-+    xmpp_SHA1_Update(&ctx, sha_digest, SHA1_DIGEST_SIZE);
-+    xmpp_SHA1_Final(&ctx, digest);
- }
- 
- static void SCRAM_SHA1_Hi(const uint8_t *text, size_t len,
-diff --git a/src/sha1.c b/src/sha1.c
-index 9af4f04..b60b325 100644
---- a/src/sha1.c
-+++ b/src/sha1.c
-@@ -202,7 +202,7 @@ static void SHA1_Transform(uint32_t state[5], const uint8_t buffer[64])
- 
- 
- /* SHA1Init - Initialize new context */
--void SHA1_Init(SHA1_CTX* context)
-+void xmpp_SHA1_Init(SHA1_CTX* context)
- {
-     /* SHA1 initialization constants */
-     context->state[0] = 0x67452301;
-@@ -215,7 +215,7 @@ void SHA1_Init(SHA1_CTX* context)
- 
- 
- /* Run your data through this. */
--void SHA1_Update(SHA1_CTX* context, const uint8_t* data, const size_t len)
-+void xmpp_SHA1_Update(SHA1_CTX* context, const uint8_t* data, const size_t len)
- {
-     size_t i, j;
- 
-@@ -244,7 +244,7 @@ void SHA1_Update(SHA1_CTX* context, const uint8_t* data, const size_t len)
- 
- 
- /* Add padding and return the message digest. */
--void SHA1_Final(SHA1_CTX* context, uint8_t digest[SHA1_DIGEST_SIZE])
-+void xmpp_SHA1_Final(SHA1_CTX* context, uint8_t digest[SHA1_DIGEST_SIZE])
- {
-     uint32_t i;
-     uint8_t  finalcount[8];
-@@ -253,11 +253,11 @@ void SHA1_Final(SHA1_CTX* context, uint8_t digest[SHA1_DIGEST_SIZE])
-         finalcount[i] = (unsigned char)((context->count[(i >= 4 ? 0 : 1)]
-          >> ((3-(i & 3)) * 8) ) & 255);  /* Endian independent */
-     }
--    SHA1_Update(context, (uint8_t *)"\200", 1);
-+    xmpp_SHA1_Update(context, (uint8_t *)"\200", 1);
-     while ((context->count[0] & 504) != 448) {
--        SHA1_Update(context, (uint8_t *)"\0", 1);
-+        xmpp_SHA1_Update(context, (uint8_t *)"\0", 1);
-     }
--    SHA1_Update(context, finalcount, 8);  /* Should cause a SHA1_Transform() */
-+    xmpp_SHA1_Update(context, finalcount, 8);  /* Should cause a SHA1_Transform() */
-     for (i = 0; i < SHA1_DIGEST_SIZE; i++) {
-         digest[i] = (uint8_t)
-          ((context->state[i>>2] >> ((3-(i & 3)) * 8) ) & 255);
-@@ -300,12 +300,12 @@ FILE* file;
-             return(-1);
-         }
-     } 
--    SHA1_Init(&context);
-+    xmpp_SHA1_Init(&context);
-     while (!feof(file)) {  /* note: what if ferror(file) */
-         i = fread(buffer, 1, 16384, file);
--        SHA1_Update(&context, buffer, i);
-+        xmpp_SHA1_Update(&context, buffer, i);
-     }
--    SHA1_Final(&context, digest);
-+    xmpp_SHA1_Final(&context, digest);
-     fclose(file);
-     for (i = 0; i < SHA1_DIGEST_SIZE/4; i++) {
-         for (j = 0; j < 4; j++) {
-@@ -358,9 +358,9 @@ int main(int argc, char** argv)
-     fprintf(stdout, "verifying SHA-1 implementation... ");
-     
-     for (k = 0; k < 2; k++){ 
--        SHA1_Init(&context);
--        SHA1_Update(&context, (uint8_t*)test_data[k], strlen(test_data[k]));
--        SHA1_Final(&context, digest);
-+        xmpp_SHA1_Init(&context);
-+        xmpp_SHA1_Update(&context, (uint8_t*)test_data[k], strlen(test_data[k]));
-+        xmpp_SHA1_Final(&context, digest);
- 	digest_to_hex(digest, output);
- 
-         if (strcmp(output, test_results[k])) {
-@@ -372,10 +372,10 @@ int main(int argc, char** argv)
-         }    
-     }
-     /* million 'a' vector we feed separately */
--    SHA1_Init(&context);
-+    xmpp_SHA1_Init(&context);
-     for (k = 0; k < 1000000; k++)
--        SHA1_Update(&context, (uint8_t*)"a", 1);
--    SHA1_Final(&context, digest);
-+        xmpp_SHA1_Update(&context, (uint8_t*)"a", 1);
-+    xmpp_SHA1_Final(&context, digest);
-     digest_to_hex(digest, output);
-     if (strcmp(output, test_results[2])) {
-         fprintf(stdout, "FAIL\n");
-diff --git a/src/sha1.h b/src/sha1.h
-index 10266cb..7ff48d7 100644
---- a/src/sha1.h
-+++ b/src/sha1.h
-@@ -23,9 +23,9 @@ typedef struct {
- 
- #define SHA1_DIGEST_SIZE 20
- 
--void SHA1_Init(SHA1_CTX* context);
--void SHA1_Update(SHA1_CTX* context, const uint8_t* data, const size_t len);
--void SHA1_Final(SHA1_CTX* context, uint8_t digest[SHA1_DIGEST_SIZE]);
-+void xmpp_SHA1_Init(SHA1_CTX* context);
-+void xmpp_SHA1_Update(SHA1_CTX* context, const uint8_t* data, const size_t len);
-+void xmpp_SHA1_Final(SHA1_CTX* context, uint8_t digest[SHA1_DIGEST_SIZE]);
- 
- #ifdef __cplusplus
- }
diff --git a/package/libstrophe/0002-make-autoreconfable.patch b/package/libstrophe/0001-make-autoreconfable.patch
similarity index 100%
rename from package/libstrophe/0002-make-autoreconfable.patch
rename to package/libstrophe/0001-make-autoreconfable.patch
diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index 6a2d99706b..72eb386520 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 08f4a85ef419a8bdf08b6afa8f7b2a0e5e180fdc9c16cede81af672ec10e21e7  libstrophe-0.8.8.tar.gz
+sha256 158145bc1565a5fd0bbd7f57e3e15d768e58b8a460897ab5918a5a689d67ae6f  libstrophe-0.9.2.tar.gz
+sha256 82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 4b5a10a558..7445caa67f 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.8.8
+LIBSTROPHE_VERSION = 0.9.2
 LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
 LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
 # Doesn't ship configure
@@ -14,9 +14,7 @@ LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
 LIBSTROPHE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
-# Passing --without-libxml2 doesn't work, due to how AC_ARG_WITH is
-# used in configure.ac. As long as --with-libxml2 is *not* passed, the
-# configure script assumes expat should be used.
+LIBSTROPHE_CONF_OPTS += --without-libxml2
 LIBSTROPHE_DEPENDENCIES += expat
 else
 LIBSTROPHE_CONF_OPTS += --with-libxml2
-- 
2.14.1
