From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Jan 2015 15:50:07 -0300
Subject: [Buildroot] [PATCH] openssl: update cryptodev digests patch
Message-ID: <1422471007-19636-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The adaptation from commit 74dd54bf is incomplete/bad causing segfaults when
using cryptodev for digest offload, examples: openssh, openssl speed, others.
Tested on real hardware (talitos).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...todev-Fix-issue-with-signature-generation.patch | 149 +++++++++++----------
 1 file changed, 80 insertions(+), 69 deletions(-)

diff --git a/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch b/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
index 5037a76..19ed5e7 100644
--- a/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
+++ b/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
@@ -1,19 +1,14 @@
-From fa47376f4c3e03b18ccd52df53d8c5041155d4ed Mon Sep 17 00:00:00 2001
-From: Nikos Mavrogiannopoulos <nmav@gnutls.org>
-Date: Fri, 4 Jul 2014 07:31:25 +0200
-Subject: [PATCH] cryptodev: Fix issue with signature generation
+Forward port of 0001-cryptodev-Fix-issue-with-signature-generation.patch
+from http://rt.openssl.org/Ticket/Display.html?id=2770&user=guest&pass=guest
+It was originally targetted at 1.0.2-beta3.
 
-That patch also enables support for SHA2 hashes, and
-removes support for hashes that were never supported by
-cryptodev.
+Without this patch digest acceleration via cryptodev is broken.
 
-[Adapted to version 1.0.2]
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
---- a/crypto/engine/eng_cryptodev.c	2015-01-22 14:58:32.000000000 +0000
-+++ b/crypto/engine/eng_cryptodev.c	2015-01-26 17:44:23.925408473 +0000
+diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto/engine/eng_cryptodev.c
+--- openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c	2015-01-28 14:59:58.146682462 -0300
++++ openssl-1.0.2/crypto/engine/eng_cryptodev.c	2015-01-28 15:29:25.107649077 -0300
 @@ -2,6 +2,7 @@
   * Copyright (c) 2002 Bob Beck <beck@openbsd.org>
   * Copyright (c) 2002 Theo de Raadt
@@ -22,7 +17,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
   * All rights reserved.
   *
   * Redistribution and use in source and binary forms, with or without
-@@ -72,7 +73,6 @@ struct dev_crypto_state {
+@@ -72,7 +73,6 @@
      struct session_op d_sess;
      int d_fd;
  # ifdef USE_CRYPTODEV_DIGESTS
@@ -30,7 +25,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      unsigned char digest_res[HASH_MAX_LEN];
      char *mac_data;
      int mac_len;
-@@ -189,8 +189,10 @@ static struct {
+@@ -189,8 +189,10 @@
  static struct {
      int id;
      int nid;
@@ -42,25 +37,27 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      {
          CRYPTO_MD5_HMAC, NID_hmacWithMD5, 16
      },
-@@ -202,18 +204,31 @@ static struct {
-         /* ? */
+@@ -198,15 +200,15 @@
+         CRYPTO_SHA1_HMAC, NID_hmacWithSHA1, 20
      },
      {
--        CRYPTO_MD5_KPDK, NID_undef, 0
+-        CRYPTO_RIPEMD160_HMAC, NID_ripemd160, 16
+-        /* ? */
 +        CRYPTO_SHA2_256_HMAC, NID_hmacWithSHA256, 32
      },
      {
--        CRYPTO_SHA1_KPDK, NID_undef, 0
+-        CRYPTO_MD5_KPDK, NID_undef, 0
 +        CRYPTO_SHA2_384_HMAC, NID_hmacWithSHA384, 48
      },
      {
+-        CRYPTO_SHA1_KPDK, NID_undef, 0
 +        CRYPTO_SHA2_512_HMAC, NID_hmacWithSHA512, 64
-+    },
+     },
 +#endif
-+    {
+     {
          CRYPTO_MD5, NID_md5, 16
      },
-     {
+@@ -214,6 +216,15 @@
          CRYPTO_SHA1, NID_sha1, 20
      },
      {
@@ -76,7 +73,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
          0, NID_undef, 0
      },
  };
-@@ -288,13 +303,14 @@ static int get_cryptodev_ciphers(const i
+@@ -288,13 +299,14 @@
      static int nids[CRYPTO_ALGORITHM_MAX];
      struct session_op sess;
      int fd, i, count = 0;
@@ -92,15 +89,14 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
  
      for (i = 0; ciphers[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
          if (ciphers[i].nid == NID_undef)
-@@ -325,6 +341,7 @@ static int get_cryptodev_ciphers(const i
- static int get_cryptodev_digests(const int **cnids)
- {
+@@ -327,18 +339,19 @@
      static int nids[CRYPTO_ALGORITHM_MAX];
-+    unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
      struct session_op sess;
      int fd, i, count = 0;
++    unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
  
-@@ -333,12 +350,12 @@ static int get_cryptodev_digests(const i
+     if ((fd = get_dev_crypto()) < 0) {
+         *cnids = NULL;
          return (0);
      }
      memset(&sess, 0, sizeof(sess));
@@ -115,7 +111,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
          sess.cipher = 0;
          if (ioctl(fd, CIOCGSESSION, &sess) != -1 &&
              ioctl(fd, CIOCFSESSION, &sess.ses) != -1)
-@@ -424,14 +441,14 @@ cryptodev_cipher(EVP_CIPHER_CTX *ctx, un
+@@ -424,14 +437,14 @@
      cryp.ses = sess->ses;
      cryp.flags = 0;
      cryp.len = inl;
@@ -129,11 +125,11 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
  
      if (ctx->cipher->iv_len) {
 -        cryp.iv = (caddr_t) ctx->iv;
-+        cryp.iv = (void*) ctx->iv;
++	cryp.iv = (void*) ctx->iv;
          if (!ctx->encrypt) {
              iiv = in + inl - ctx->cipher->iv_len;
              memcpy(save_iv, iiv, ctx->cipher->iv_len);
-@@ -483,7 +500,7 @@ cryptodev_init_key(EVP_CIPHER_CTX *ctx, 
+@@ -483,7 +496,7 @@
      if ((state->d_fd = get_dev_crypto()) < 0)
          return (0);
  
@@ -142,7 +138,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      sess->keylen = ctx->key_len;
      sess->cipher = cipher;
  
-@@ -749,16 +766,6 @@ static int digest_nid_to_cryptodev(int n
+@@ -749,16 +762,6 @@
      return (0);
  }
  
@@ -159,7 +155,15 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
  static int cryptodev_digest_init(EVP_MD_CTX *ctx)
  {
      struct dev_crypto_state *state = ctx->md_data;
-@@ -777,8 +784,8 @@ static int cryptodev_digest_init(EVP_MD_
+@@ -769,7 +772,6 @@
+         printf("cryptodev_digest_init: Can't get digest \n");
+         return (0);
+     }
+-
+     memset(state, 0, sizeof(struct dev_crypto_state));
+ 
+     if ((state->d_fd = get_dev_crypto()) < 0) {
+@@ -777,8 +779,8 @@
          return (0);
      }
  
@@ -170,7 +174,17 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      sess->mac = digest;
  
      if (ioctl(state->d_fd, CIOCGSESSION, sess) < 0) {
-@@ -804,7 +811,7 @@ static int cryptodev_digest_update(EVP_M
+@@ -794,8 +796,8 @@
+ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
+                                    size_t count)
+ {
+-    struct crypt_op cryp;
+     struct dev_crypto_state *state = ctx->md_data;
++    struct crypt_op cryp;
+     struct session_op *sess = &state->d_sess;
+ 
+     if (!data || state->d_fd < 0) {
+@@ -804,7 +806,7 @@
      }
  
      if (!count) {
@@ -179,7 +193,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      }
  
      if (!(ctx->flags & EVP_MD_CTX_FLAG_ONESHOT)) {
-@@ -828,9 +835,9 @@ static int cryptodev_digest_update(EVP_M
+@@ -828,9 +830,9 @@
      cryp.ses = sess->ses;
      cryp.flags = 0;
      cryp.len = count;
@@ -191,7 +205,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
          printf("cryptodev_digest_update: digest failed\n");
          return (0);
-@@ -844,8 +851,6 @@ static int cryptodev_digest_final(EVP_MD
+@@ -844,8 +846,6 @@
      struct dev_crypto_state *state = ctx->md_data;
      struct session_op *sess = &state->d_sess;
  
@@ -200,16 +214,16 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      if (!md || state->d_fd < 0) {
          printf("cryptodev_digest_final: illegal input\n");
          return (0);
-@@ -859,7 +864,7 @@ static int cryptodev_digest_final(EVP_MD
+@@ -859,7 +859,7 @@
          cryp.len = state->mac_len;
          cryp.src = state->mac_data;
          cryp.dst = NULL;
 -        cryp.mac = (caddr_t) md;
-+        cryp.mac = (void*)md;
++	cryp.mac = (void*)md;
          if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
              printf("cryptodev_digest_final: digest failed\n");
              return (0);
-@@ -870,7 +875,7 @@ static int cryptodev_digest_final(EVP_MD
+@@ -870,7 +870,7 @@
  
      memcpy(md, state->digest_res, ctx->digest->md_size);
  
@@ -218,7 +232,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
  }
  
  static int cryptodev_digest_cleanup(EVP_MD_CTX *ctx)
-@@ -921,8 +926,8 @@ static int cryptodev_digest_copy(EVP_MD_
+@@ -921,8 +921,8 @@
  
      digest = digest_nid_to_cryptodev(to->digest->type);
  
@@ -229,20 +243,17 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      sess->mac = digest;
  
      dstate->d_fd = get_dev_crypto();
-@@ -945,34 +950,117 @@ static int cryptodev_digest_copy(EVP_MD_
-     return 1;
- }
+@@ -947,32 +947,116 @@
  
--const EVP_MD cryptodev_sha1 = {
-+static const EVP_MD cryptodev_sha1 = {
+ const EVP_MD cryptodev_sha1 = {
      NID_sha1,
 -    NID_undef,
 +    NID_sha1WithRSAEncryption,
      SHA_DIGEST_LENGTH,
-+    #if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+        EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+        EVP_MD_FLAG_DIGALGID_ABSENT|
-+    #endif
++#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
++    EVP_MD_FLAG_DIGALGID_ABSENT|
++#endif
      EVP_MD_FLAG_ONESHOT,
      cryptodev_digest_init,
      cryptodev_digest_update,
@@ -250,12 +261,13 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      cryptodev_digest_copy,
      cryptodev_digest_cleanup,
 -    EVP_PKEY_NULL_method,
--    SHA_CBLOCK,
--    sizeof(struct dev_crypto_state),
 +    EVP_PKEY_RSA_method,
+     SHA_CBLOCK,
+-    sizeof(struct dev_crypto_state),
 +    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
-+};
-+
+ };
+ 
+-const EVP_MD cryptodev_md5 = {
 +static const EVP_MD cryptodev_sha256 = {
 +    NID_sha256,
 +    NID_sha256WithRSAEncryption,
@@ -273,9 +285,8 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
 +    EVP_PKEY_RSA_method,
 +    SHA256_CBLOCK,
 +    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
- };
- 
--const EVP_MD cryptodev_md5 = {
++};
++
 +static const EVP_MD cryptodev_sha224 = {
 +    NID_sha224,
 +    NID_sha224WithRSAEncryption, 
@@ -336,7 +347,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
 +static const EVP_MD cryptodev_md5 = {
      NID_md5,
 -    NID_undef,
-+    NID_md5WithRSAEncryption, 
++    NID_md5WithRSAEncryption,
      16 /* MD5_DIGEST_LENGTH */ ,
 +#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
 +    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
@@ -356,26 +367,26 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
  };
  
  # endif                         /* USE_CRYPTODEV_DIGESTS */
-@@ -992,6 +1080,18 @@ cryptodev_engine_digests(ENGINE *e, cons
+@@ -992,6 +1076,18 @@
      case NID_sha1:
          *digest = &cryptodev_sha1;
          break;
 +    case NID_sha224:
 +        *digest = &cryptodev_sha224;
-+        break;
++	break;
 +    case NID_sha256:
 +        *digest = &cryptodev_sha256;
-+        break;
++	break;
 +    case NID_sha384:
 +        *digest = &cryptodev_sha384;
-+        break;
++	break;
 +    case NID_sha512:
-+        *digest = &cryptodev_sha512;
-+        break;
++    	*digest = &cryptodev_sha512;
++	break;
      default:
  # endif                         /* USE_CRYPTODEV_DIGESTS */
          *digest = NULL;
-@@ -1022,7 +1122,7 @@ static int bn2crparam(const BIGNUM *a, s
+@@ -1022,7 +1118,7 @@
          return (1);
      memset(b, 0, bytes);
  
@@ -384,7 +395,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      crp->crp_nbits = bits;
  
      for (i = 0, j = 0; i < a->top; i++) {
-@@ -1277,7 +1377,7 @@ static DSA_SIG *cryptodev_dsa_do_sign(co
+@@ -1277,7 +1373,7 @@
      kop.crk_op = CRK_DSA_SIGN;
  
      /* inputs: dgst dsa->p dsa->q dsa->g dsa->priv_key */
@@ -393,7 +404,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      kop.crk_param[0].crp_nbits = dlen * 8;
      if (bn2crparam(dsa->p, &kop.crk_param[1]))
          goto err;
-@@ -1317,7 +1417,7 @@ cryptodev_dsa_verify(const unsigned char
+@@ -1317,7 +1413,7 @@
      kop.crk_op = CRK_DSA_VERIFY;
  
      /* inputs: dgst dsa->p dsa->q dsa->g dsa->pub_key sig->r sig->s */
@@ -402,7 +413,7 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
      kop.crk_param[0].crp_nbits = dlen * 8;
      if (bn2crparam(dsa->p, &kop.crk_param[1]))
          goto err;
-@@ -1398,9 +1498,10 @@ cryptodev_dh_compute_key(unsigned char *
+@@ -1398,9 +1494,10 @@
          goto err;
      kop.crk_iparams = 3;
  
@@ -411,11 +422,11 @@ diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
 +    kop.crk_param[3].crp_p = (void*) key;
 +    kop.crk_param[3].crp_nbits = keylen;
      kop.crk_oparams = 1;
-+    dhret = keylen/8;
++    dhret = keylen / 8;
  
      if (ioctl(fd, CIOCKEY, &kop) == -1) {
          const DH_METHOD *meth = DH_OpenSSL();
-@@ -1470,7 +1571,7 @@ void ENGINE_load_cryptodev(void)
+@@ -1470,7 +1567,7 @@
      put_dev_crypto(fd);
  
      if (!ENGINE_set_id(engine, "cryptodev") ||
-- 
2.0.5
