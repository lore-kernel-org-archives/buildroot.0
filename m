From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Tue, 29 Jan 2019 10:39:18 +0100
Subject: [Buildroot] [PATCH v7 7/8] package/rtmpdump: Fix compilation issues
 with openssl 1.1.x
In-Reply-To: <20190129093919.22060-1-patrick.havelange@essensium.com>
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
Message-ID: <20190129093919.22060-7-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim4j@gmail.com>

Upstream is dead, other distros use gnutls exclusively,
so patch is not sent upstream.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

---
Changes v7:
  - none

Changes v6:
  - Commit msg
---
 ...p-Fix-compilation-with-openssl-1.1.x.patch | 276 ++++++++++++++++++
 1 file changed, 276 insertions(+)
 create mode 100644 package/rtmpdump/0001-librtmp-Fix-compilation-with-openssl-1.1.x.patch

diff --git a/package/rtmpdump/0001-librtmp-Fix-compilation-with-openssl-1.1.x.patch b/package/rtmpdump/0001-librtmp-Fix-compilation-with-openssl-1.1.x.patch
new file mode 100644
index 0000000000..44e70b495a
--- /dev/null
+++ b/package/rtmpdump/0001-librtmp-Fix-compilation-with-openssl-1.1.x.patch
@@ -0,0 +1,276 @@
+From f3ca4b9450e273afc5b773e5e5637b7fcbc71dd8 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Fri, 18 Jan 2019 01:15:33 +0200
+Subject: [PATCH] librtmp: Fix compilation with openssl 1.1.x
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ librtmp/dh.h        | 70 +++++++++++++++++++++++++++++++++++++++++++----------
+ librtmp/handshake.h | 13 ++++++----
+ librtmp/hashswf.c   | 18 +++++++++-----
+ librtmp/rtmp.c      |  4 +--
+ 4 files changed, 78 insertions(+), 27 deletions(-)
+
+diff --git a/librtmp/dh.h b/librtmp/dh.h
+index 5fc3f32..2cf6b8c 100644
+--- a/librtmp/dh.h
++++ b/librtmp/dh.h
+@@ -186,6 +186,32 @@ typedef BIGNUM * MP_t;
+ #define MDH_free(dh)  DH_free(dh)
+ #define MDH_generate_key(dh)  DH_generate_key(dh)
+ #define MDH_compute_key(secret, seclen, pub, dh)      DH_compute_key(secret, pub, dh)
++#define MDH_set_g(dh, g) DH_set0_pqg(dh, NULL, NULL, g)
++#define MDH_set_p(dh, p) DH_set0_pqg(dh, p, NULL, NULL)
++#define MDH_set_len(dh, l) DH_set_length(dh, l)
++#define MDH_set_pub_key(dh, pub) DH_set0_key(dh, pub, NULL)
++#define MDH_set_priv_key(dh, priv) DH_set0_key(dh, NULL, priv)
++
++static inline BIGNUM *MDH_get_p(DH *dh)
++{
++  const BIGNUM *p;
++  DH_get0_pqg(dh, &p, NULL, NULL);
++  return (BIGNUM *) p;
++}
++
++static inline BIGNUM *MDH_get_pub_key(DH *dh)
++{
++  const BIGNUM *pub;
++  DH_get0_key(dh, &pub, NULL);
++  return (BIGNUM *) pub;
++}
++
++static inline BIGNUM *MDH_get_priv_key(DH *dh)
++{
++  const BIGNUM *priv;
++  DH_get0_key(dh, NULL, &priv);
++  return (BIGNUM *) priv;
++}
+
+ #endif
+
+@@ -249,24 +275,28 @@ DHInit(int nKeyBits)
+ {
+   size_t res;
+   MDH *dh = MDH_new();
++  MP_t g, p;
+
+   if (!dh)
+     goto failed;
+
+-  MP_new(dh->g);
++  MP_new(g);
+
+-  if (!dh->g)
++  if (g)
+     goto failed;
+
+-  MP_gethex(dh->p, P1024, res);       /* prime P1024, see dhgroups.h */
++  MDH_set_g(dh, g);
++  p = MDH_get_p(dh);
++  MP_gethex(p, P1024, res);   /* prime P1024, see dhgroups.h */
+   if (!res)
+     {
+       goto failed;
+     }
+
+-  MP_set_w(dh->g, 2); /* base 2 */
++  MDH_set_p(dh, p);
++  MP_set_w(g, 2);     /* base 2 */
++  MDH_set_len(dh, nKeyBits);
+
+-  dh->length = nKeyBits;
+   return dh;
+
+ failed:
+@@ -286,6 +316,9 @@ DHGenerateKey(MDH *dh)
+   while (!res)
+     {
+       MP_t q1 = NULL;
++      MP_t priv_key;
++      MP_t pub_key;
++      MP_t p;
+
+       if (!MDH_generate_key(dh))
+       return 0;
+@@ -293,12 +326,17 @@ DHGenerateKey(MDH *dh)
+       MP_gethex(q1, Q1024, res);
+       assert(res);
+
+-      res = isValidPublicKey(dh->pub_key, dh->p, q1);
++      priv_key = MDH_get_priv_key(dh);
++      pub_key = MDH_get_pub_key(dh);
++      p = MDH_get_p(dh);
++
++      res = isValidPublicKey(pub_key, p, q1);
+       if (!res)
+       {
+-        MP_free(dh->pub_key);
+-        MP_free(dh->priv_key);
+-        dh->pub_key = dh->priv_key = 0;
++        MP_free(pub_key);
++        MP_free(priv_key);
++        MDH_set_pub_key(dh, NULL);
++        MDH_set_priv_key(dh, NULL);
+       }
+
+       MP_free(q1);
+@@ -313,16 +351,22 @@ DHGenerateKey(MDH *dh)
+ static int
+ DHGetPublicKey(MDH *dh, uint8_t *pubkey, size_t nPubkeyLen)
+ {
++  MP_t pub_key;
+   int len;
+-  if (!dh || !dh->pub_key)
++
++  if (!dh)
++    return 0;
++
++  pub_key = MDH_get_pub_key(dh);
++  if (!pub_key)
+     return 0;
+
+-  len = MP_bytes(dh->pub_key);
++  len = MP_bytes(pub_key);
+   if (len <= 0 || len > (int) nPubkeyLen)
+     return 0;
+
+   memset(pubkey, 0, nPubkeyLen);
+-  MP_setbin(dh->pub_key, pubkey + (nPubkeyLen - len), len);
++  MP_setbin(pub_key, pubkey + (nPubkeyLen - len), len);
+   return 1;
+ }
+
+@@ -364,7 +408,7 @@ DHComputeSharedSecretKey(MDH *dh, uint8_t *pubkey, size_t nPubkeyLen,
+   MP_gethex(q1, Q1024, len);
+   assert(len);
+
+-  if (isValidPublicKey(pubkeyBn, dh->p, q1))
++  if (isValidPublicKey(pubkeyBn, MDH_get_p(dh), q1))
+     res = MDH_compute_key(secret, nPubkeyLen, pubkeyBn, dh);
+   else
+     res = -1;
+diff --git a/librtmp/handshake.h b/librtmp/handshake.h
+index 0438486..1e84b3a 100644
+--- a/librtmp/handshake.h
++++ b/librtmp/handshake.h
+@@ -69,9 +69,9 @@ typedef struct arcfour_ctx*  RC4_handle;
+ #if OPENSSL_VERSION_NUMBER < 0x0090800 || !defined(SHA256_DIGEST_LENGTH)
+ #error Your OpenSSL is too old, need 0.9.8 or newer with SHA256
+ #endif
+-#define HMAC_setup(ctx, key, len)     HMAC_CTX_init(&ctx); HMAC_Init_ex(&ctx, key, len, EVP_sha256(), 0)
+-#define HMAC_crunch(ctx, buf, len)    HMAC_Update(&ctx, buf, len)
+-#define HMAC_finish(ctx, dig, dlen)   HMAC_Final(&ctx, dig, &dlen); HMAC_CTX_cleanup(&ctx)
++#define HMAC_setup(ctx, key, len)     HMAC_CTX_reset(ctx); HMAC_Init_ex(ctx, key, len, EVP_sha256(), 0)
++#define HMAC_crunch(ctx, buf, len)    HMAC_Update(ctx, buf, len)
++#define HMAC_finish(ctx, dig, dlen)   HMAC_Final(ctx, dig, &dlen);
+
+ typedef RC4_KEY *     RC4_handle;
+ #define RC4_alloc(h)  *h = malloc(sizeof(RC4_KEY))
+@@ -117,7 +117,7 @@ static void InitRC4Encryption
+ {
+   uint8_t digest[SHA256_DIGEST_LENGTH];
+   unsigned int digestLen = 0;
+-  HMAC_CTX ctx;
++  HMAC_CTX *ctx = HMAC_CTX_new();
+
+   RC4_alloc(rc4keyIn);
+   RC4_alloc(rc4keyOut);
+@@ -139,6 +139,8 @@ static void InitRC4Encryption
+   RTMP_LogHex(RTMP_LOGDEBUG, digest, 16);
+
+   RC4_setkey(*rc4keyIn, 16, digest);
++
++  HMAC_CTX_free(ctx);
+ }
+
+ typedef unsigned int (getoff)(uint8_t *buf, unsigned int len);
+@@ -266,12 +268,13 @@ HMACsha256(const uint8_t *message, size_t messageLen, const uint8_t *key,
+          size_t keylen, uint8_t *digest)
+ {
+   unsigned int digestLen;
+-  HMAC_CTX ctx;
++  HMAC_CTX *ctx = HMAC_CTX_new();
+
+   HMAC_setup(ctx, key, keylen);
+   HMAC_crunch(ctx, message, messageLen);
+   HMAC_finish(ctx, digest, digestLen);
+
++  HMAC_CTX_free(ctx);
+   assert(digestLen == 32);
+ }
+
+diff --git a/librtmp/hashswf.c b/librtmp/hashswf.c
+index 9f4e2c0..ba2c228 100644
+--- a/librtmp/hashswf.c
++++ b/librtmp/hashswf.c
+@@ -57,10 +57,10 @@
+ #include <openssl/sha.h>
+ #include <openssl/hmac.h>
+ #include <openssl/rc4.h>
+-#define HMAC_setup(ctx, key, len)     HMAC_CTX_init(&ctx); HMAC_Init_ex(&ctx, (unsigned char *)key, len, EVP_sha256(), 0)
+-#define HMAC_crunch(ctx, buf, len)    HMAC_Update(&ctx, (unsigned char *)buf, len)
+-#define HMAC_finish(ctx, dig, dlen)   HMAC_Final(&ctx, (unsigned char *)dig, &dlen);
+-#define HMAC_close(ctx)       HMAC_CTX_cleanup(&ctx)
++#define HMAC_setup(ctx, key, len)     HMAC_CTX_reset(ctx); HMAC_Init_ex(ctx, (unsigned char *)key, len, EVP_sha256(), 0)
++#define HMAC_crunch(ctx, buf, len)    HMAC_Update(ctx, (unsigned char *)buf, len)
++#define HMAC_finish(ctx, dig, dlen)   HMAC_Final(ctx, (unsigned char *)dig, &dlen);
++#define HMAC_close(ctx)
+ #endif
+
+ extern void RTMP_TLS_Init();
+@@ -289,7 +289,7 @@ leave:
+ struct info
+ {
+   z_stream *zs;
+-  HMAC_CTX ctx;
++  HMAC_CTX *ctx;
+   int first;
+   int zlib;
+   int size;
+@@ -582,6 +582,10 @@ RTMP_HashSWF(const char *url, unsigned int *size, unsigned char *hash,
+     }
+
+   in.first = 1;
++  in.ctx = HMAC_CTX_new();
++  if (!in.ctx)
++    goto out;
++
+   HMAC_setup(in.ctx, "Genuine Adobe Flash Player 001", 30);
+   inflateInit(&zs);
+   in.zs = &zs;
+@@ -621,7 +625,7 @@ RTMP_HashSWF(const char *url, unsigned int *size, unsigned char *hash,
+                 "%s: couldn't open %s for writing, errno %d (%s)",
+                 __FUNCTION__, path, err, strerror(err));
+             ret = -1;
+-            goto out;
++            goto free_ctx;
+           }
+         fseek(f, 0, SEEK_END);
+         q = strchr(url, '?');
+@@ -649,6 +653,8 @@ RTMP_HashSWF(const char *url, unsigned int *size, unsigned char *hash,
+       }
+     }
+   HMAC_close(in.ctx);
++free_ctx:
++  HMAC_CTX_free(in.ctx);
+ out:
+   free(path);
+   if (f)
+diff --git a/librtmp/rtmp.c b/librtmp/rtmp.c
+index a2863b0..c995568 100644
+--- a/librtmp/rtmp.c
++++ b/librtmp/rtmp.c
+@@ -245,9 +245,7 @@ RTMP_TLS_Init()
+       "ca.pem", GNUTLS_X509_FMT_PEM);
+ #elif !defined(NO_SSL) /* USE_OPENSSL */
+   /* libcrypto doesn't need anything special */
+-  SSL_load_error_strings();
+-  SSL_library_init();
+-  OpenSSL_add_all_digests();
++  OPENSSL_init_crypto(OPENSSL_INIT_ADD_ALL_DIGESTS, NULL);
+   RTMP_TLS_ctx = SSL_CTX_new(SSLv23_method());
+   SSL_CTX_set_options(RTMP_TLS_ctx, SSL_OP_ALL);
+   SSL_CTX_set_default_verify_paths(RTMP_TLS_ctx);
+--
+2.14.1
+
-- 
2.17.1
