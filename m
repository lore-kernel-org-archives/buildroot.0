From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Apr 2018 23:19:20 +0200
Subject: [Buildroot] [RFC v1 1/2] libopenssl: bump version to 1.1.0h
Message-ID: <20180417211921.18718-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove all parallel build patches (openssl build-system changed)

- rebased 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch

- replaced 0002-cryptodev-Fix-issue-with-signature-generation.patch with
  upstream version

- rebased 0003-Reproducible-build-do-not-leak-compiler-path.patch

- fix uclibc build failure, use '-DOPENSSL_NO_ASYNC'

- remove legacy enable-tlsext configure option

- change legacy INSTALL_PREFIX to DESTDIR

- remove 'libraries gets installed read only, so strip fails'
  workaround (not needed anymore)

- change engine directory from /usr/lib/engines to
  /usr/lib/engines-1.1

- change license file hash, no license change, only the following
  hint was removed:

    Actually both licenses are BSD-style Open Source licenses.
    In case of any license issues related to OpenSSL please
    contact openssl-core at openssl.org.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

 - There was a previous attempt to bump the openssl version by
   David Mosberger <davidm@egauge.net>. I could not find the
   corresponding patch in patchwork or on the mailing list,
   only a reply by Arnout Vandecappelle (see [1]) and the
   answer by David Mosberger (see [2]).

 - I did only (compile) check openssh yet (and fixed the build
   failure, see next patch).

[1] http://lists.busybox.net/pipermail/buildroot/2017-August/200859.html
[2] http://lists.busybox.net/pipermail/buildroot/2017-August/200898.html
---
 ...time-building-manpages-if-we-re-not-going.patch |  33 +-
 ...todev-Fix-issue-with-signature-generation.patch | 585 ++++++++++++---------
 ...roducible-build-do-not-leak-compiler-path.patch |  32 +-
 package/libopenssl/libopenssl.hash                 |  13 +-
 package/libopenssl/libopenssl.mk                   |  29 +-
 5 files changed, 379 insertions(+), 313 deletions(-)

diff --git a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
index 10d2b7526c..9fa31f968e 100644
--- a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
+++ b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
@@ -1,27 +1,30 @@
-From 389efb564fa1453a9da835393eec9006bfae2a52 Mon Sep 17 00:00:00 2001
+From 0924eea80a1a0a23c4ba74af7616a8da185b2a37 Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@gentoo.org>
 Date: Sat, 16 May 2015 18:53:51 +0200
-Subject: Dont waste time building manpages if we're not going to use em.
+Subject: [PATCH] Dont waste time building manpages if we're not going to use
+ em.
 
 Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
 [Gustavo: update for parallel-build]
+[rebased on openssl-1.1.0h]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- Makefile.org | 2 +-
+ Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile.org b/Makefile.org
-index 60f07cc..976ceaf 100644
---- a/Makefile.org
-+++ b/Makefile.org
-@@ -527,7 +527,7 @@ dist:
- dist_pem_h:
- 	(cd crypto/pem; $(MAKE) -e $(BUILDENV) pem.h; $(MAKE) clean)
+diff --git a/Makefile b/Makefile
+index b83ed2d..12cb4a2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -173,7 +173,7 @@ list-tests:
+ 	 $(PERL) $(SRCDIR)/test/run_tests.pl list
+ 	@ : 
  
--install: install_docs install_sw
-+install: install_sw
+-install: install_sw install_ssldirs install_docs
++install: install_sw install_ssldirs
+ 
+ uninstall: uninstall_docs uninstall_sw
  
- install_sw:
- 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
 -- 
-1.9.1
+2.16.3
 
diff --git a/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch b/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
index 47295500c0..2cb9d8361f 100644
--- a/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
+++ b/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
@@ -1,25 +1,32 @@
-From 90fd7e8f1a316cda86ee442b43fcd7d5e5baeede Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 16 May 2015 18:55:08 +0200
-Subject: cryptodev: Fix issue with signature generation
+From b408c3cfd4bbf5f473db5264dabdf7232b204e3c Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <n.mavrogiannopoulos@gmail.com>
+Date: Tue, 4 Nov 2014 11:35:14 +0100
+Subject: [PATCH] cryptodev: Fix issue with signature generation
 
-Forward port of 0001-cryptodev-Fix-issue-with-signature-generation.patch
-from http://rt.openssl.org/Ticket/Display.html?id=2770&user=guest&pass=guest
-It was originally targetted at 1.0.2-beta3.
+That patch also enables support for SHA2 hashes, and
+removes support for hashes that were never supported by
+cryptodev.
 
-Without this patch digest acceleration via cryptodev is broken.
+Reviewed-by: Rich Salz <rsalz@openssl.org>
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/1784)
 
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
+Buildroot comments from the 1.0.2 port:
+  Without this patch digest acceleration via cryptodev is broken.
+  Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+  Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
+
+Upstream: https://github.com/openssl/openssl/commit/efcad82bb81962f9e7620396ee2090035d112b32.patch
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- crypto/engine/eng_cryptodev.c | 195 +++++++++++++++++++++++++++++++-----------
- 1 file changed, 146 insertions(+), 49 deletions(-)
+ crypto/engine/eng_cryptodev.c | 233 ++++++++++++++++++++++++++++++++----------
+ 1 file changed, 178 insertions(+), 55 deletions(-)
 
 diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
-index 926d95c..7021d9a 100644
+index 5572735..4ce7833 100644
 --- a/crypto/engine/eng_cryptodev.c
 +++ b/crypto/engine/eng_cryptodev.c
-@@ -2,6 +2,7 @@
+@@ -11,6 +11,7 @@
   * Copyright (c) 2002 Bob Beck <beck@openbsd.org>
   * Copyright (c) 2002 Theo de Raadt
   * Copyright (c) 2002 Markus Friedl
@@ -27,7 +34,7 @@ index 926d95c..7021d9a 100644
   * All rights reserved.
   *
   * Redistribution and use in source and binary forms, with or without
-@@ -72,7 +73,6 @@ struct dev_crypto_state {
+@@ -87,7 +88,6 @@ struct dev_crypto_state {
      struct session_op d_sess;
      int d_fd;
  # ifdef USE_CRYPTODEV_DIGESTS
@@ -35,19 +42,63 @@ index 926d95c..7021d9a 100644
      unsigned char digest_res[HASH_MAX_LEN];
      char *mac_data;
      int mac_len;
-@@ -189,8 +189,10 @@ static struct {
+@@ -97,12 +97,12 @@ struct dev_crypto_state {
+ static u_int32_t cryptodev_asymfeat = 0;
+ 
+ static RSA_METHOD *cryptodev_rsa;
+-#ifndef OPENSSL_NO_DSA
++# ifndef OPENSSL_NO_DSA
+ static DSA_METHOD *cryptodev_dsa = NULL;
+-#endif
+-#ifndef OPENSSL_NO_DH
++# endif
++# ifndef OPENSSL_NO_DH
+ static DH_METHOD *cryptodev_dh;
+-#endif
++# endif
+ 
+ static int get_asym_dev_crypto(void);
+ static int open_dev_crypto(void);
+@@ -135,7 +135,7 @@ static int cryptodev_rsa_nocrt_mod_exp(BIGNUM *r0, const BIGNUM *I, RSA *rsa,
+                                        BN_CTX *ctx);
+ static int cryptodev_rsa_mod_exp(BIGNUM *r0, const BIGNUM *I, RSA *rsa,
+                                  BN_CTX *ctx);
+-#ifndef OPENSSL_NO_DSA
++# ifndef OPENSSL_NO_DSA
+ static int cryptodev_dsa_bn_mod_exp(DSA *dsa, BIGNUM *r, const BIGNUM *a,
+                                     const BIGNUM *p, const BIGNUM *m,
+                                     BN_CTX *ctx, BN_MONT_CTX *m_ctx);
+@@ -147,14 +147,14 @@ static DSA_SIG *cryptodev_dsa_do_sign(const unsigned char *dgst, int dlen,
+                                       DSA *dsa);
+ static int cryptodev_dsa_verify(const unsigned char *dgst, int dgst_len,
+                                 DSA_SIG *sig, DSA *dsa);
+-#endif
+-#ifndef OPENSSL_NO_DH
++# endif
++# ifndef OPENSSL_NO_DH
+ static int cryptodev_mod_exp_dh(const DH *dh, BIGNUM *r, const BIGNUM *a,
+                                 const BIGNUM *p, const BIGNUM *m, BN_CTX *ctx,
+                                 BN_MONT_CTX *m_ctx);
+ static int cryptodev_dh_compute_key(unsigned char *key, const BIGNUM *pub_key,
+                                     DH *dh);
+-#endif
++# endif
+ static int cryptodev_ctrl(ENGINE *e, int cmd, long i, void *p,
+                           void (*f) (void));
+ void engine_load_cryptodev_int(void);
+@@ -216,8 +216,10 @@ static struct {
  static struct {
      int id;
      int nid;
 -    int keylen;
-+    int digestlen;
++    int  digestlen;
  } digests[] = {
-+#if 0
++#  if 0
 +    /* HMAC is not supported */
      {
          CRYPTO_MD5_HMAC, NID_hmacWithMD5, 16
      },
-@@ -198,15 +200,15 @@ static struct {
+@@ -225,21 +227,30 @@ static struct {
          CRYPTO_SHA1_HMAC, NID_hmacWithSHA1, 20
      },
      {
@@ -63,14 +114,14 @@ index 926d95c..7021d9a 100644
 -        CRYPTO_SHA1_KPDK, NID_undef, 0
 +        CRYPTO_SHA2_512_HMAC, NID_hmacWithSHA512, 64
      },
-+#endif
++#  endif
      {
          CRYPTO_MD5, NID_md5, 16
      },
-@@ -214,6 +216,15 @@ static struct {
+     {
          CRYPTO_SHA1, NID_sha1, 20
      },
-     {
++    {
 +        CRYPTO_SHA2_256, NID_sha256, 32
 +    },
 +    {
@@ -79,11 +130,10 @@ index 926d95c..7021d9a 100644
 +    {
 +        CRYPTO_SHA2_512, NID_sha512, 64
 +    },
-+    {
+     {
          0, NID_undef, 0
      },
- };
-@@ -288,13 +299,14 @@ static int get_cryptodev_ciphers(const int **cnids)
+@@ -315,13 +326,14 @@ static int get_cryptodev_ciphers(const int **cnids)
      static int nids[CRYPTO_ALGORITHM_MAX];
      struct session_op sess;
      int fd, i, count = 0;
@@ -95,60 +145,61 @@ index 926d95c..7021d9a 100644
      }
      memset(&sess, 0, sizeof(sess));
 -    sess.key = (caddr_t) "123456789abcdefghijklmno";
-+    sess.key = (void*)fake_key;
++    sess.key = (void *)fake_key;
  
      for (i = 0; ciphers[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
          if (ciphers[i].nid == NID_undef)
-@@ -327,18 +339,19 @@ static int get_cryptodev_digests(const int **cnids)
+@@ -352,6 +364,7 @@ static int get_cryptodev_ciphers(const int **cnids)
+ static int get_cryptodev_digests(const int **cnids)
+ {
      static int nids[CRYPTO_ALGORITHM_MAX];
++    unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
      struct session_op sess;
      int fd, i, count = 0;
-+    unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
  
-     if ((fd = get_dev_crypto()) < 0) {
-         *cnids = NULL;
+@@ -360,12 +373,12 @@ static int get_cryptodev_digests(const int **cnids)
          return (0);
      }
      memset(&sess, 0, sizeof(sess));
 -    sess.mackey = (caddr_t) "123456789abcdefghijklmno";
-+    sess.mackey = fake_key;
++    sess.mackey = (void *)fake_key;
      for (i = 0; digests[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
          if (digests[i].nid == NID_undef)
              continue;
          sess.mac = digests[i].id;
 -        sess.mackeylen = digests[i].keylen;
-+        sess.mackeylen = 8;
++        sess.mackeylen = digests[i].digestlen;
          sess.cipher = 0;
          if (ioctl(fd, CIOCGSESSION, &sess) != -1 &&
              ioctl(fd, CIOCFSESSION, &sess.ses) != -1)
-@@ -424,14 +437,14 @@ cryptodev_cipher(EVP_CIPHER_CTX *ctx, unsigned char *out,
+@@ -451,14 +464,14 @@ cryptodev_cipher(EVP_CIPHER_CTX *ctx, unsigned char *out,
      cryp.ses = sess->ses;
      cryp.flags = 0;
      cryp.len = inl;
 -    cryp.src = (caddr_t) in;
 -    cryp.dst = (caddr_t) out;
-+    cryp.src = (void*) in;
-+    cryp.dst = (void*) out;
++    cryp.src = (void *) in;
++    cryp.dst = (void *) out;
      cryp.mac = 0;
  
-     cryp.op = ctx->encrypt ? COP_ENCRYPT : COP_DECRYPT;
+     cryp.op = EVP_CIPHER_CTX_encrypting(ctx) ? COP_ENCRYPT : COP_DECRYPT;
  
-     if (ctx->cipher->iv_len) {
--        cryp.iv = (caddr_t) ctx->iv;
-+	cryp.iv = (void*) ctx->iv;
-         if (!ctx->encrypt) {
-             iiv = in + inl - ctx->cipher->iv_len;
-             memcpy(save_iv, iiv, ctx->cipher->iv_len);
-@@ -483,7 +496,7 @@ cryptodev_init_key(EVP_CIPHER_CTX *ctx, const unsigned char *key,
+     if (EVP_CIPHER_CTX_iv_length(ctx) > 0) {
+-        cryp.iv = (caddr_t) EVP_CIPHER_CTX_iv(ctx);
++        cryp.iv = (void *) EVP_CIPHER_CTX_iv(ctx);
+         if (!EVP_CIPHER_CTX_encrypting(ctx)) {
+             iiv = in + inl - EVP_CIPHER_CTX_iv_length(ctx);
+             memcpy(save_iv, iiv, EVP_CIPHER_CTX_iv_length(ctx));
+@@ -511,7 +524,7 @@ cryptodev_init_key(EVP_CIPHER_CTX *ctx, const unsigned char *key,
      if ((state->d_fd = get_dev_crypto()) < 0)
          return (0);
  
 -    sess->key = (caddr_t) key;
-+    sess->key = (void*)key;
-     sess->keylen = ctx->key_len;
++    sess->key = (void *) key;
+     sess->keylen = EVP_CIPHER_CTX_key_length(ctx);
      sess->cipher = cipher;
  
-@@ -749,16 +762,6 @@ static int digest_nid_to_cryptodev(int nid)
+@@ -885,16 +898,6 @@ static int digest_nid_to_cryptodev(int nid)
      return (0);
  }
  
@@ -164,287 +215,313 @@ index 926d95c..7021d9a 100644
 -
  static int cryptodev_digest_init(EVP_MD_CTX *ctx)
  {
-     struct dev_crypto_state *state = ctx->md_data;
-@@ -769,7 +772,6 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
-         printf("cryptodev_digest_init: Can't get digest \n");
-         return (0);
-     }
--
-     memset(state, 0, sizeof(struct dev_crypto_state));
- 
-     if ((state->d_fd = get_dev_crypto()) < 0) {
-@@ -777,8 +779,8 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
+     struct dev_crypto_state *state = EVP_MD_CTX_md_data(ctx);
+@@ -913,8 +916,8 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
          return (0);
      }
  
 -    sess->mackey = state->dummy_mac_key;
--    sess->mackeylen = digest_key_length(ctx->digest->type);
+-    sess->mackeylen = digest_key_length(EVP_MD_CTX_type(ctx));
 +    sess->mackey = NULL;
 +    sess->mackeylen = 0;
      sess->mac = digest;
  
      if (ioctl(state->d_fd, CIOCGSESSION, sess) < 0) {
-@@ -794,8 +796,8 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
- static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
-                                    size_t count)
- {
--    struct crypt_op cryp;
-     struct dev_crypto_state *state = ctx->md_data;
-+    struct crypt_op cryp;
-     struct session_op *sess = &state->d_sess;
- 
-     if (!data || state->d_fd < 0) {
-@@ -804,7 +806,7 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
-     }
- 
-     if (!count) {
--        return (0);
-+        return (1);
-     }
- 
-     if (!(ctx->flags & EVP_MD_CTX_FLAG_ONESHOT)) {
-@@ -828,9 +830,9 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
+@@ -966,9 +969,9 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
      cryp.ses = sess->ses;
      cryp.flags = 0;
      cryp.len = count;
 -    cryp.src = (caddr_t) data;
-+    cryp.src = (void*) data;
++    cryp.src = (void *) data;
      cryp.dst = NULL;
 -    cryp.mac = (caddr_t) state->digest_res;
-+    cryp.mac = (void*) state->digest_res;
++    cryp.mac = (void *) state->digest_res;
      if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
          printf("cryptodev_digest_update: digest failed\n");
          return (0);
-@@ -844,8 +846,6 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
-     struct dev_crypto_state *state = ctx->md_data;
-     struct session_op *sess = &state->d_sess;
- 
--    int ret = 1;
--
-     if (!md || state->d_fd < 0) {
-         printf("cryptodev_digest_final: illegal input\n");
-         return (0);
-@@ -859,7 +859,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
+@@ -997,7 +1000,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
          cryp.len = state->mac_len;
          cryp.src = state->mac_data;
          cryp.dst = NULL;
 -        cryp.mac = (caddr_t) md;
-+	cryp.mac = (void*)md;
++        cryp.mac = (void *) md;
          if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
              printf("cryptodev_digest_final: digest failed\n");
              return (0);
-@@ -870,7 +870,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
- 
-     memcpy(md, state->digest_res, ctx->digest->md_size);
- 
--    return (ret);
-+    return 1;
- }
- 
- static int cryptodev_digest_cleanup(EVP_MD_CTX *ctx)
-@@ -921,8 +921,8 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to, const EVP_MD_CTX *from)
+@@ -1057,8 +1060,8 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to, const EVP_MD_CTX *from)
  
-     digest = digest_nid_to_cryptodev(to->digest->type);
+     digest = digest_nid_to_cryptodev(EVP_MD_CTX_type(to));
  
 -    sess->mackey = dstate->dummy_mac_key;
--    sess->mackeylen = digest_key_length(to->digest->type);
+-    sess->mackeylen = digest_key_length(EVP_MD_CTX_type(to));
 +    sess->mackey = NULL;
 +    sess->mackeylen = 0;
      sess->mac = digest;
  
      dstate->d_fd = get_dev_crypto();
-@@ -947,32 +947,116 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to, const EVP_MD_CTX *from)
- 
- const EVP_MD cryptodev_sha1 = {
-     NID_sha1,
--    NID_undef,
-+    NID_sha1WithRSAEncryption,
-     SHA_DIGEST_LENGTH,
-+#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+    EVP_MD_FLAG_DIGALGID_ABSENT|
-+#endif
-     EVP_MD_FLAG_ONESHOT,
-     cryptodev_digest_init,
-     cryptodev_digest_update,
-     cryptodev_digest_final,
-     cryptodev_digest_copy,
-     cryptodev_digest_cleanup,
--    EVP_PKEY_NULL_method,
-+    EVP_PKEY_RSA_method,
-     SHA_CBLOCK,
--    sizeof(struct dev_crypto_state),
-+    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
- };
+@@ -1110,6 +1113,106 @@ static const EVP_MD *cryptodev_sha1(void)
+     return sha1_md;
+ }
  
--const EVP_MD cryptodev_md5 = {
-+static const EVP_MD cryptodev_sha256 = {
-+    NID_sha256,
-+    NID_sha256WithRSAEncryption,
-+    SHA256_DIGEST_LENGTH, 
-+#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+    EVP_MD_FLAG_DIGALGID_ABSENT|
-+#endif
-+    EVP_MD_FLAG_ONESHOT,
-+    cryptodev_digest_init,
-+    cryptodev_digest_update,
-+    cryptodev_digest_final,
-+    cryptodev_digest_copy,
-+    cryptodev_digest_cleanup,
-+    EVP_PKEY_RSA_method,
-+    SHA256_CBLOCK,
-+    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
-+};
++static EVP_MD *sha256_md = NULL;
++static const EVP_MD *cryptodev_sha256(void)
++{
++    if (sha256_md == NULL) {
++        EVP_MD *md;
 +
-+static const EVP_MD cryptodev_sha224 = {
-+    NID_sha224,
-+    NID_sha224WithRSAEncryption, 
-+    SHA224_DIGEST_LENGTH, 
-+#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+    EVP_MD_FLAG_DIGALGID_ABSENT|
-+#endif
-+    EVP_MD_FLAG_ONESHOT,
-+    cryptodev_digest_init,
-+    cryptodev_digest_update,
-+    cryptodev_digest_final,
-+    cryptodev_digest_copy,
-+    cryptodev_digest_cleanup,
-+    EVP_PKEY_RSA_method,
-+    SHA256_CBLOCK,
-+    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
-+};
++        if ((md = EVP_MD_meth_new(NID_sha256, NID_undef)) == NULL
++            || !EVP_MD_meth_set_result_size(md, SHA_DIGEST_LENGTH)
++            || !EVP_MD_meth_set_flags(md, EVP_MD_FLAG_ONESHOT)
++            || !EVP_MD_meth_set_input_blocksize(md, SHA_CBLOCK)
++            || !EVP_MD_meth_set_app_datasize(md,
++                                             sizeof(struct dev_crypto_state))
++            || !EVP_MD_meth_set_init(md, cryptodev_digest_init)
++            || !EVP_MD_meth_set_update(md, cryptodev_digest_update)
++            || !EVP_MD_meth_set_final(md, cryptodev_digest_final)
++            || !EVP_MD_meth_set_copy(md, cryptodev_digest_copy)
++            || !EVP_MD_meth_set_cleanup(md, cryptodev_digest_cleanup)) {
++            EVP_MD_meth_free(md);
++            md = NULL;
++        }
++        sha256_md = md;
++    }
++    return sha256_md;
++}
 +
-+static const EVP_MD cryptodev_sha384 = {
-+    NID_sha384,
-+    NID_sha384WithRSAEncryption, 
-+    SHA384_DIGEST_LENGTH, 
-+#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+    EVP_MD_FLAG_DIGALGID_ABSENT|
-+#endif
-+    EVP_MD_FLAG_ONESHOT,
-+    cryptodev_digest_init,
-+    cryptodev_digest_update,
-+    cryptodev_digest_final,
-+    cryptodev_digest_copy,
-+    cryptodev_digest_cleanup,
-+    EVP_PKEY_RSA_method,
-+    SHA512_CBLOCK,
-+    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
-+};
++static EVP_MD *sha224_md = NULL;
++static const EVP_MD *cryptodev_sha224(void)
++{
++    if (sha224_md == NULL) {
++        EVP_MD *md;
 +
-+static const EVP_MD cryptodev_sha512 = {
-+    NID_sha512,
-+    NID_sha512WithRSAEncryption, 
-+    SHA512_DIGEST_LENGTH, 
-+#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+    EVP_MD_FLAG_DIGALGID_ABSENT|
-+#endif
-+    EVP_MD_FLAG_ONESHOT,
-+    cryptodev_digest_init,
-+    cryptodev_digest_update,
-+    cryptodev_digest_final,
-+    cryptodev_digest_copy,
-+    cryptodev_digest_cleanup,
-+    EVP_PKEY_RSA_method,
-+    SHA512_CBLOCK,
-+    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
-+};
++        if ((md = EVP_MD_meth_new(NID_sha224, NID_undef)) == NULL
++            || !EVP_MD_meth_set_result_size(md, SHA_DIGEST_LENGTH)
++            || !EVP_MD_meth_set_flags(md, EVP_MD_FLAG_ONESHOT)
++            || !EVP_MD_meth_set_input_blocksize(md, SHA_CBLOCK)
++            || !EVP_MD_meth_set_app_datasize(md,
++                                             sizeof(struct dev_crypto_state))
++            || !EVP_MD_meth_set_init(md, cryptodev_digest_init)
++            || !EVP_MD_meth_set_update(md, cryptodev_digest_update)
++            || !EVP_MD_meth_set_final(md, cryptodev_digest_final)
++            || !EVP_MD_meth_set_copy(md, cryptodev_digest_copy)
++            || !EVP_MD_meth_set_cleanup(md, cryptodev_digest_cleanup)) {
++            EVP_MD_meth_free(md);
++            md = NULL;
++        }
++        sha224_md = md;
++    }
++    return sha224_md;
++}
 +
-+static const EVP_MD cryptodev_md5 = {
-     NID_md5,
--    NID_undef,
-+    NID_md5WithRSAEncryption,
-     16 /* MD5_DIGEST_LENGTH */ ,
-+#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+    EVP_MD_FLAG_DIGALGID_ABSENT|
-+#endif
-     EVP_MD_FLAG_ONESHOT,
-     cryptodev_digest_init,
-     cryptodev_digest_update,
-     cryptodev_digest_final,
-     cryptodev_digest_copy,
-     cryptodev_digest_cleanup,
--    EVP_PKEY_NULL_method,
-+    EVP_PKEY_RSA_method,
-     64 /* MD5_CBLOCK */ ,
--    sizeof(struct dev_crypto_state),
-+    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
- };
- 
- # endif                         /* USE_CRYPTODEV_DIGESTS */
-@@ -992,6 +1076,18 @@ cryptodev_engine_digests(ENGINE *e, const EVP_MD **digest,
++static EVP_MD *sha384_md = NULL;
++static const EVP_MD *cryptodev_sha384(void)
++{
++    if (sha384_md == NULL) {
++        EVP_MD *md;
++
++        if ((md = EVP_MD_meth_new(NID_sha384, NID_undef)) == NULL
++            || !EVP_MD_meth_set_result_size(md, SHA_DIGEST_LENGTH)
++            || !EVP_MD_meth_set_flags(md, EVP_MD_FLAG_ONESHOT)
++            || !EVP_MD_meth_set_input_blocksize(md, SHA_CBLOCK)
++            || !EVP_MD_meth_set_app_datasize(md,
++                                             sizeof(struct dev_crypto_state))
++            || !EVP_MD_meth_set_init(md, cryptodev_digest_init)
++            || !EVP_MD_meth_set_update(md, cryptodev_digest_update)
++            || !EVP_MD_meth_set_final(md, cryptodev_digest_final)
++            || !EVP_MD_meth_set_copy(md, cryptodev_digest_copy)
++            || !EVP_MD_meth_set_cleanup(md, cryptodev_digest_cleanup)) {
++            EVP_MD_meth_free(md);
++            md = NULL;
++        }
++        sha384_md = md;
++    }
++    return sha384_md;
++}
++
++static EVP_MD *sha512_md = NULL;
++static const EVP_MD *cryptodev_sha512(void)
++{
++    if (sha512_md == NULL) {
++        EVP_MD *md;
++
++        if ((md = EVP_MD_meth_new(NID_sha512, NID_undef)) == NULL
++            || !EVP_MD_meth_set_result_size(md, SHA_DIGEST_LENGTH)
++            || !EVP_MD_meth_set_flags(md, EVP_MD_FLAG_ONESHOT)
++            || !EVP_MD_meth_set_input_blocksize(md, SHA_CBLOCK)
++            || !EVP_MD_meth_set_app_datasize(md,
++                                             sizeof(struct dev_crypto_state))
++            || !EVP_MD_meth_set_init(md, cryptodev_digest_init)
++            || !EVP_MD_meth_set_update(md, cryptodev_digest_update)
++            || !EVP_MD_meth_set_final(md, cryptodev_digest_final)
++            || !EVP_MD_meth_set_copy(md, cryptodev_digest_copy)
++            || !EVP_MD_meth_set_cleanup(md, cryptodev_digest_cleanup)) {
++            EVP_MD_meth_free(md);
++            md = NULL;
++        }
++        sha512_md = md;
++    }
++    return sha512_md;
++}
++
+ static EVP_MD *md5_md = NULL;
+ static const EVP_MD *cryptodev_md5(void)
+ {
+@@ -1152,6 +1255,18 @@ cryptodev_engine_digests(ENGINE *e, const EVP_MD **digest,
      case NID_sha1:
-         *digest = &cryptodev_sha1;
+         *digest = cryptodev_sha1();
          break;
-+    case NID_sha224:
-+        *digest = &cryptodev_sha224;
-+	break;
 +    case NID_sha256:
-+        *digest = &cryptodev_sha256;
-+	break;
++        *digest = cryptodev_sha256();
++        break;
++    case NID_sha224:
++        *digest = cryptodev_sha224();
++        break;
 +    case NID_sha384:
-+        *digest = &cryptodev_sha384;
-+	break;
++        *digest = cryptodev_sha384();
++        break;
 +    case NID_sha512:
-+    	*digest = &cryptodev_sha512;
-+	break;
++        *digest = cryptodev_sha512();
++        break;
      default:
  # endif                         /* USE_CRYPTODEV_DIGESTS */
          *digest = NULL;
-@@ -1022,7 +1118,7 @@ static int bn2crparam(const BIGNUM *a, struct crparam *crp)
+@@ -1189,19 +1304,27 @@ static int cryptodev_engine_destroy(ENGINE *e)
+ # ifdef USE_CRYPTODEV_DIGESTS
+     EVP_MD_meth_free(sha1_md);
+     sha1_md = NULL;
++    EVP_MD_meth_free(sha256_md);
++    sha256_md = NULL;
++    EVP_MD_meth_free(sha224_md);
++    sha224_md = NULL;
++    EVP_MD_meth_free(sha384_md);
++    sha384_md = NULL;
++    EVP_MD_meth_free(sha512_md);
++    sha512_md = NULL;
+     EVP_MD_meth_free(md5_md);
+     md5_md = NULL;
+ # endif
+     RSA_meth_free(cryptodev_rsa);
+     cryptodev_rsa = NULL;
+-#ifndef OPENSSL_NO_DSA
++# ifndef OPENSSL_NO_DSA
+     DSA_meth_free(cryptodev_dsa);
+     cryptodev_dsa = NULL;
+-#endif
+-#ifndef OPENSSL_NO_DH
++# endif
++# ifndef OPENSSL_NO_DH
+     DH_meth_free(cryptodev_dh);
+     cryptodev_dh = NULL;
+-#endif
++# endif
+     return 1;
+ }
+ 
+@@ -1225,7 +1348,7 @@ static int bn2crparam(const BIGNUM *a, struct crparam *crp)
+     if (b == NULL)
          return (1);
-     memset(b, 0, bytes);
  
 -    crp->crp_p = (caddr_t) b;
-+    crp->crp_p = (void*) b;
++    crp->crp_p = (void *) b;
      crp->crp_nbits = bits;
  
-     for (i = 0, j = 0; i < a->top; i++) {
-@@ -1277,7 +1373,7 @@ static DSA_SIG *cryptodev_dsa_do_sign(const unsigned char *dgst, int dlen,
+     BN_bn2bin(a, b);
+@@ -1421,7 +1544,7 @@ cryptodev_rsa_mod_exp(BIGNUM *r0, const BIGNUM *I, RSA *rsa, BN_CTX *ctx)
+     return (ret);
+ }
+ 
+-#ifndef OPENSSL_NO_DSA
++# ifndef OPENSSL_NO_DSA
+ static int
+ cryptodev_dsa_bn_mod_exp(DSA *dsa, BIGNUM *r, const BIGNUM *a, const BIGNUM *p,
+                          const BIGNUM *m, BN_CTX *ctx, BN_MONT_CTX *m_ctx)
+@@ -1493,7 +1616,7 @@ static DSA_SIG *cryptodev_dsa_do_sign(const unsigned char *dgst, int dlen,
      kop.crk_op = CRK_DSA_SIGN;
  
      /* inputs: dgst dsa->p dsa->q dsa->g dsa->priv_key */
 -    kop.crk_param[0].crp_p = (caddr_t) dgst;
-+    kop.crk_param[0].crp_p = (void*)dgst;
++    kop.crk_param[0].crp_p = (void *) dgst;
      kop.crk_param[0].crp_nbits = dlen * 8;
-     if (bn2crparam(dsa->p, &kop.crk_param[1]))
-         goto err;
-@@ -1317,7 +1413,7 @@ cryptodev_dsa_verify(const unsigned char *dgst, int dlen,
+     DSA_get0_pqg(dsa, &dsap, &dsaq, &dsag);
+     DSA_get0_key(dsa, NULL, &priv_key);
+@@ -1540,7 +1663,7 @@ cryptodev_dsa_verify(const unsigned char *dgst, int dlen,
      kop.crk_op = CRK_DSA_VERIFY;
  
      /* inputs: dgst dsa->p dsa->q dsa->g dsa->pub_key sig->r sig->s */
 -    kop.crk_param[0].crp_p = (caddr_t) dgst;
-+    kop.crk_param[0].crp_p = (void*)dgst;
++    kop.crk_param[0].crp_p = (void *) dgst;
      kop.crk_param[0].crp_nbits = dlen * 8;
-     if (bn2crparam(dsa->p, &kop.crk_param[1]))
-         goto err;
-@@ -1398,9 +1494,10 @@ cryptodev_dh_compute_key(unsigned char *key, const BIGNUM *pub_key, DH *dh)
+     DSA_get0_pqg(dsa, &p, &q, &g);
+     if (bn2crparam(p, &kop.crk_param[1]))
+@@ -1573,9 +1696,9 @@ cryptodev_dsa_verify(const unsigned char *dgst, int dlen,
+     zapparams(&kop);
+     return (dsaret);
+ }
+-#endif
++# endif
+ 
+-#ifndef OPENSSL_NO_DH
++# ifndef OPENSSL_NO_DH
+ static int
+ cryptodev_mod_exp_dh(const DH *dh, BIGNUM *r, const BIGNUM *a,
+                      const BIGNUM *p, const BIGNUM *m, BN_CTX *ctx,
+@@ -1616,7 +1739,7 @@ cryptodev_dh_compute_key(unsigned char *key, const BIGNUM *pub_key, DH *dh)
          goto err;
      kop.crk_iparams = 3;
  
 -    kop.crk_param[3].crp_p = (caddr_t) key;
--    kop.crk_param[3].crp_nbits = keylen * 8;
-+    kop.crk_param[3].crp_p = (void*) key;
-+    kop.crk_param[3].crp_nbits = keylen;
++    kop.crk_param[3].crp_p = (void *) key;
+     kop.crk_param[3].crp_nbits = keylen * 8;
      kop.crk_oparams = 1;
-+    dhret = keylen / 8;
  
-     if (ioctl(fd, CIOCKEY, &kop) == -1) {
-         const DH_METHOD *meth = DH_OpenSSL();
-@@ -1470,7 +1567,7 @@ void ENGINE_load_cryptodev(void)
+@@ -1631,7 +1754,7 @@ cryptodev_dh_compute_key(unsigned char *key, const BIGNUM *pub_key, DH *dh)
+     return (dhret);
+ }
+ 
+-#endif /* ndef OPENSSL_NO_DH */
++# endif /* ndef OPENSSL_NO_DH */
+ 
+ /*
+  * ctrl right now is just a wrapper that doesn't do much
+@@ -1679,7 +1802,7 @@ void engine_load_cryptodev_int(void)
      put_dev_crypto(fd);
  
      if (!ENGINE_set_id(engine, "cryptodev") ||
 -        !ENGINE_set_name(engine, "BSD cryptodev engine") ||
 +        !ENGINE_set_name(engine, "cryptodev engine") ||
+         !ENGINE_set_destroy_function(engine, cryptodev_engine_destroy) ||
          !ENGINE_set_ciphers(engine, cryptodev_engine_ciphers) ||
          !ENGINE_set_digests(engine, cryptodev_engine_digests) ||
-         !ENGINE_set_ctrl_function(engine, cryptodev_ctrl) ||
+@@ -1708,7 +1831,7 @@ void engine_load_cryptodev_int(void)
+         return;
+     }
+ 
+-#ifndef OPENSSL_NO_DSA
++# ifndef OPENSSL_NO_DSA
+     cryptodev_dsa = DSA_meth_dup(DSA_OpenSSL());
+     if (cryptodev_dsa != NULL) {
+         DSA_meth_set1_name(cryptodev_dsa, "cryptodev DSA method");
+@@ -1728,9 +1851,9 @@ void engine_load_cryptodev_int(void)
+         ENGINE_free(engine);
+         return;
+     }
+-#endif
++# endif
+ 
+-#ifndef OPENSSL_NO_DH
++# ifndef OPENSSL_NO_DH
+     cryptodev_dh = DH_meth_dup(DH_OpenSSL());
+     if (cryptodev_dh != NULL) {
+         DH_meth_set1_name(cryptodev_dh, "cryptodev DH method");
+@@ -1747,7 +1870,7 @@ void engine_load_cryptodev_int(void)
+         ENGINE_free(engine);
+         return;
+     }
+-#endif
++# endif
+ 
+     ENGINE_add(engine);
+     ENGINE_free(engine);
 -- 
-1.9.1
+2.16.3
 
diff --git a/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
index eff72c548a..fcc620bcb5 100644
--- a/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
+++ b/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
@@ -1,26 +1,26 @@
-From 875fcad2ad84877763cba86c1265b57679b878b0 Mon Sep 17 00:00:00 2001
+From 7aae2fb06db701eeff856620c3b45bfea981b8bd Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Tue, 24 Oct 2017 16:58:32 +0200
 Subject: [PATCH] Reproducible build: do not leak compiler path
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- crypto/Makefile | 2 +-
+ Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/crypto/Makefile b/crypto/Makefile
-index 7869996..7e63291 100644
---- a/crypto/Makefile
-+++ b/crypto/Makefile
-@@ -55,7 +55,7 @@ top:
- all: shared
- 
- buildinf.h: ../Makefile
--	$(PERL) $(TOP)/util/mkbuildinf.pl "$(CC) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
-+	$(PERL) $(TOP)/util/mkbuildinf.pl "$$(basename $(CC)) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
- 
- x86cpuid.s:	x86cpuid.pl perlasm/x86asm.pl
- 	$(PERL) x86cpuid.pl $(PERLASM_SCHEME) $(CFLAGS) $(PROCESSOR) > $@
+diff --git a/Makefile b/Makefile
+index 12cb4a2..3d2289a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2164,7 +2164,7 @@ crypto/cversion.o: crypto/cversion.c crypto/buildinf.h
+ 		mv crypto/cversion.d.tmp crypto/cversion.d; \
+ 	fi
+ crypto/buildinf.h: util/mkbuildinf.pl configdata.pm
+-	$(PERL) util/mkbuildinf.pl "$(CC) $(CFLAGS_Q)" "$(PLATFORM)" > $@
++	$(PERL) util/mkbuildinf.pl "$$(basename $(CC)) $(CFLAGS_Q)" "$(PLATFORM)" > $@
+ crypto/des/cbc_cksm.o: crypto/des/cbc_cksm.c
+ 	$(CC)  -I. -Icrypto/include -Iinclude $(CFLAGS) $(LIB_CFLAGS) -MMD -MF crypto/des/cbc_cksm.d.tmp -MT $@ -c -o $@ crypto/des/cbc_cksm.c
+ 	@touch crypto/des/cbc_cksm.d.tmp
 -- 
-2.11.0
+2.16.3
 
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 48b7471c20..d0f5f0ea4f 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,8 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.0.2o.tar.gz.sha256
-sha256	ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d	openssl-1.0.2o.tar.gz
-# Locally computed
-sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
-sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
-sha256	30cb49489de5041841a74da9155cd4fabfbce33237262ba7cd23974314ae2956	openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
-sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
-sha256	c8f60f4842bbad0353f5d81620e72b168b5638ca3a0a999f5da113b22491612e	LICENSE
+# From https://www.openssl.org/source/openssl-1.1.0h.tar.gz.sha256
+sha256 5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517 openssl-1.1.0h.tar.gz
+
+# License files
+sha256 350c7817af2ef980d3f3922bc5e0bb6a9d9f6cc21e784a699bcd2a31c74a84b1 LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 16a9c2e9d2..6050f67e2f 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.0.2o
+LIBOPENSSL_VERSION = 1.1.0h
 LIBOPENSSL_SITE = http://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
@@ -15,11 +15,6 @@ HOST_LIBOPENSSL_DEPENDENCIES = host-zlib
 LIBOPENSSL_TARGET_ARCH = generic32
 LIBOPENSSL_CFLAGS = $(TARGET_CFLAGS)
 LIBOPENSSL_PROVIDES = openssl
-LIBOPENSSL_PATCH = \
-	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
-	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
-	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
-	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
@@ -35,6 +30,11 @@ LIBOPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
 LIBOPENSSL_DEPENDENCIES += cryptodev
 endif
 
+# crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name ?ucontext_t?
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
+endif
+
 # Some architectures are optimized in OpenSSL
 # Doesn't work for thumb-only (Cortex-M?)
 ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
@@ -86,7 +86,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-rc5 \
 			enable-camellia \
 			enable-mdc2 \
-			enable-tlsext \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
 			$(if $(BR2_STATIC_LIBS),no-dso) \
 	)
@@ -112,7 +111,7 @@ define LIBOPENSSL_BUILD_CMDS
 endef
 
 define LIBOPENSSL_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define HOST_LIBOPENSSL_INSTALL_CMDS
@@ -120,7 +119,7 @@ define HOST_LIBOPENSSL_INSTALL_CMDS
 endef
 
 define LIBOPENSSL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	rm -rf $(TARGET_DIR)/usr/lib/ssl
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
@@ -135,16 +134,6 @@ endef
 LIBOPENSSL_POST_INSTALL_STAGING_HOOKS += LIBOPENSSL_FIXUP_STATIC_PKGCONFIG
 endif
 
-ifneq ($(BR2_STATIC_LIBS),y)
-# libraries gets installed read only, so strip fails
-define LIBOPENSSL_INSTALL_FIXUPS_SHARED
-	chmod +w $(TARGET_DIR)/usr/lib/engines/lib*.so
-	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libcrypto.so.* libssl.so.*); \
-	do chmod +w $$i; done
-endef
-LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_INSTALL_FIXUPS_SHARED
-endif
-
 ifeq ($(BR2_PACKAGE_PERL),)
 define LIBOPENSSL_REMOVE_PERL_SCRIPTS
 	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.pl,tsget}
@@ -162,7 +151,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
 define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
-	rm -rf $(TARGET_DIR)/usr/lib/engines
+	rm -rf $(TARGET_DIR)/usr/lib/engines-1.1
 endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
 endif
-- 
2.16.3
