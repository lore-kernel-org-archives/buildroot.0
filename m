From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 21:04:37 +0200
Subject: [Buildroot] [PATCH 1/2] openssl: use git formatted patches
Message-ID: <1431803078-27629-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using Git formatted patches makes it easier to adjust the patches when
needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...time-building-manpages-if-we-re-not-going.patch | 27 +++++++++
 ...odev-Fix-issue-with-signature-generation.patch} | 70 +++++++++++++---------
 ...h-minus-inste.patch => 0003-Fix-c_rehash.patch} | 10 ++--
 package/openssl/001-do-not-build-docs.patch        | 13 ----
 4 files changed, 74 insertions(+), 46 deletions(-)
 create mode 100644 package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
 rename package/openssl/{003-cryptodev-Fix-issue-with-signature-generation.patch => 0002-cryptodev-Fix-issue-with-signature-generation.patch} (82%)
 rename package/openssl/{005-Make-c_rehash-match-commands-starting-with-minus-inste.patch => 0003-Fix-c_rehash.patch} (71%)
 delete mode 100644 package/openssl/001-do-not-build-docs.patch

diff --git a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
new file mode 100644
index 0000000..93e2118
--- /dev/null
+++ b/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
@@ -0,0 +1,27 @@
+From 53980448064b362a58e4ab2aca6f38fec93c07c3 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sat, 16 May 2015 18:53:51 +0200
+Subject: [PATCH 1/3] Dont waste time building manpages if we're not going to
+ use em.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.org | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.org b/Makefile.org
+index b7a3f96..8a47840 100644
+--- a/Makefile.org
++++ b/Makefile.org
+@@ -536,7 +536,7 @@ dist:
+ dist_pem_h:
+ 	(cd crypto/pem; $(MAKE) -e $(BUILDENV) pem.h; $(MAKE) clean)
+ 
+-install: all install_docs install_sw
++install: all install_sw
+ 
+ install_sw:
+ 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
+-- 
+2.1.0
+
diff --git a/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch b/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
similarity index 82%
rename from package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
rename to package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
index 19ed5e7..17887d3 100644
--- a/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
+++ b/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
@@ -1,14 +1,23 @@
+From 0718df24bd828f26d7d0e8e7f935d8e21f70ebca Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sat, 16 May 2015 18:55:08 +0200
+Subject: [PATCH 2/3] cryptodev: Fix issue with signature generation
+
 Forward port of 0001-cryptodev-Fix-issue-with-signature-generation.patch
 from http://rt.openssl.org/Ticket/Display.html?id=2770&user=guest&pass=guest
 It was originally targetted at 1.0.2-beta3.
 
 Without this patch digest acceleration via cryptodev is broken.
 
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ crypto/engine/eng_cryptodev.c | 195 +++++++++++++++++++++++++++++++-----------
+ 1 file changed, 146 insertions(+), 49 deletions(-)
 
-diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto/engine/eng_cryptodev.c
---- openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c	2015-01-28 14:59:58.146682462 -0300
-+++ openssl-1.0.2/crypto/engine/eng_cryptodev.c	2015-01-28 15:29:25.107649077 -0300
+diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
+index 926d95c..7021d9a 100644
+--- a/crypto/engine/eng_cryptodev.c
++++ b/crypto/engine/eng_cryptodev.c
 @@ -2,6 +2,7 @@
   * Copyright (c) 2002 Bob Beck <beck@openbsd.org>
   * Copyright (c) 2002 Theo de Raadt
@@ -17,7 +26,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
   * All rights reserved.
   *
   * Redistribution and use in source and binary forms, with or without
-@@ -72,7 +73,6 @@
+@@ -72,7 +73,6 @@ struct dev_crypto_state {
      struct session_op d_sess;
      int d_fd;
  # ifdef USE_CRYPTODEV_DIGESTS
@@ -25,7 +34,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      unsigned char digest_res[HASH_MAX_LEN];
      char *mac_data;
      int mac_len;
-@@ -189,8 +189,10 @@
+@@ -189,8 +189,10 @@ static struct {
  static struct {
      int id;
      int nid;
@@ -37,7 +46,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      {
          CRYPTO_MD5_HMAC, NID_hmacWithMD5, 16
      },
-@@ -198,15 +200,15 @@
+@@ -198,15 +200,15 @@ static struct {
          CRYPTO_SHA1_HMAC, NID_hmacWithSHA1, 20
      },
      {
@@ -57,7 +66,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      {
          CRYPTO_MD5, NID_md5, 16
      },
-@@ -214,6 +216,15 @@
+@@ -214,6 +216,15 @@ static struct {
          CRYPTO_SHA1, NID_sha1, 20
      },
      {
@@ -73,7 +82,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
          0, NID_undef, 0
      },
  };
-@@ -288,13 +299,14 @@
+@@ -288,13 +299,14 @@ static int get_cryptodev_ciphers(const int **cnids)
      static int nids[CRYPTO_ALGORITHM_MAX];
      struct session_op sess;
      int fd, i, count = 0;
@@ -89,7 +98,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
  
      for (i = 0; ciphers[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
          if (ciphers[i].nid == NID_undef)
-@@ -327,18 +339,19 @@
+@@ -327,18 +339,19 @@ static int get_cryptodev_digests(const int **cnids)
      static int nids[CRYPTO_ALGORITHM_MAX];
      struct session_op sess;
      int fd, i, count = 0;
@@ -111,7 +120,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
          sess.cipher = 0;
          if (ioctl(fd, CIOCGSESSION, &sess) != -1 &&
              ioctl(fd, CIOCFSESSION, &sess.ses) != -1)
-@@ -424,14 +437,14 @@
+@@ -424,14 +437,14 @@ cryptodev_cipher(EVP_CIPHER_CTX *ctx, unsigned char *out,
      cryp.ses = sess->ses;
      cryp.flags = 0;
      cryp.len = inl;
@@ -129,7 +138,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
          if (!ctx->encrypt) {
              iiv = in + inl - ctx->cipher->iv_len;
              memcpy(save_iv, iiv, ctx->cipher->iv_len);
-@@ -483,7 +496,7 @@
+@@ -483,7 +496,7 @@ cryptodev_init_key(EVP_CIPHER_CTX *ctx, const unsigned char *key,
      if ((state->d_fd = get_dev_crypto()) < 0)
          return (0);
  
@@ -138,7 +147,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      sess->keylen = ctx->key_len;
      sess->cipher = cipher;
  
-@@ -749,16 +762,6 @@
+@@ -749,16 +762,6 @@ static int digest_nid_to_cryptodev(int nid)
      return (0);
  }
  
@@ -155,7 +164,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
  static int cryptodev_digest_init(EVP_MD_CTX *ctx)
  {
      struct dev_crypto_state *state = ctx->md_data;
-@@ -769,7 +772,6 @@
+@@ -769,7 +772,6 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
          printf("cryptodev_digest_init: Can't get digest \n");
          return (0);
      }
@@ -163,7 +172,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      memset(state, 0, sizeof(struct dev_crypto_state));
  
      if ((state->d_fd = get_dev_crypto()) < 0) {
-@@ -777,8 +779,8 @@
+@@ -777,8 +779,8 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
          return (0);
      }
  
@@ -174,7 +183,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      sess->mac = digest;
  
      if (ioctl(state->d_fd, CIOCGSESSION, sess) < 0) {
-@@ -794,8 +796,8 @@
+@@ -794,8 +796,8 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
  static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
                                     size_t count)
  {
@@ -184,7 +193,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      struct session_op *sess = &state->d_sess;
  
      if (!data || state->d_fd < 0) {
-@@ -804,7 +806,7 @@
+@@ -804,7 +806,7 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
      }
  
      if (!count) {
@@ -193,7 +202,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      }
  
      if (!(ctx->flags & EVP_MD_CTX_FLAG_ONESHOT)) {
-@@ -828,9 +830,9 @@
+@@ -828,9 +830,9 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
      cryp.ses = sess->ses;
      cryp.flags = 0;
      cryp.len = count;
@@ -205,7 +214,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
          printf("cryptodev_digest_update: digest failed\n");
          return (0);
-@@ -844,8 +846,6 @@
+@@ -844,8 +846,6 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
      struct dev_crypto_state *state = ctx->md_data;
      struct session_op *sess = &state->d_sess;
  
@@ -214,7 +223,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      if (!md || state->d_fd < 0) {
          printf("cryptodev_digest_final: illegal input\n");
          return (0);
-@@ -859,7 +859,7 @@
+@@ -859,7 +859,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
          cryp.len = state->mac_len;
          cryp.src = state->mac_data;
          cryp.dst = NULL;
@@ -223,7 +232,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
          if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
              printf("cryptodev_digest_final: digest failed\n");
              return (0);
-@@ -870,7 +870,7 @@
+@@ -870,7 +870,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
  
      memcpy(md, state->digest_res, ctx->digest->md_size);
  
@@ -232,7 +241,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
  }
  
  static int cryptodev_digest_cleanup(EVP_MD_CTX *ctx)
-@@ -921,8 +921,8 @@
+@@ -921,8 +921,8 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to, const EVP_MD_CTX *from)
  
      digest = digest_nid_to_cryptodev(to->digest->type);
  
@@ -243,7 +252,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      sess->mac = digest;
  
      dstate->d_fd = get_dev_crypto();
-@@ -947,32 +947,116 @@
+@@ -947,32 +947,116 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to, const EVP_MD_CTX *from)
  
  const EVP_MD cryptodev_sha1 = {
      NID_sha1,
@@ -367,7 +376,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
  };
  
  # endif                         /* USE_CRYPTODEV_DIGESTS */
-@@ -992,6 +1076,18 @@
+@@ -992,6 +1076,18 @@ cryptodev_engine_digests(ENGINE *e, const EVP_MD **digest,
      case NID_sha1:
          *digest = &cryptodev_sha1;
          break;
@@ -386,7 +395,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      default:
  # endif                         /* USE_CRYPTODEV_DIGESTS */
          *digest = NULL;
-@@ -1022,7 +1118,7 @@
+@@ -1022,7 +1118,7 @@ static int bn2crparam(const BIGNUM *a, struct crparam *crp)
          return (1);
      memset(b, 0, bytes);
  
@@ -395,7 +404,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      crp->crp_nbits = bits;
  
      for (i = 0, j = 0; i < a->top; i++) {
-@@ -1277,7 +1373,7 @@
+@@ -1277,7 +1373,7 @@ static DSA_SIG *cryptodev_dsa_do_sign(const unsigned char *dgst, int dlen,
      kop.crk_op = CRK_DSA_SIGN;
  
      /* inputs: dgst dsa->p dsa->q dsa->g dsa->priv_key */
@@ -404,7 +413,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      kop.crk_param[0].crp_nbits = dlen * 8;
      if (bn2crparam(dsa->p, &kop.crk_param[1]))
          goto err;
-@@ -1317,7 +1413,7 @@
+@@ -1317,7 +1413,7 @@ cryptodev_dsa_verify(const unsigned char *dgst, int dlen,
      kop.crk_op = CRK_DSA_VERIFY;
  
      /* inputs: dgst dsa->p dsa->q dsa->g dsa->pub_key sig->r sig->s */
@@ -413,7 +422,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
      kop.crk_param[0].crp_nbits = dlen * 8;
      if (bn2crparam(dsa->p, &kop.crk_param[1]))
          goto err;
-@@ -1398,9 +1494,10 @@
+@@ -1398,9 +1494,10 @@ cryptodev_dh_compute_key(unsigned char *key, const BIGNUM *pub_key, DH *dh)
          goto err;
      kop.crk_iparams = 3;
  
@@ -426,7 +435,7 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
  
      if (ioctl(fd, CIOCKEY, &kop) == -1) {
          const DH_METHOD *meth = DH_OpenSSL();
-@@ -1470,7 +1567,7 @@
+@@ -1470,7 +1567,7 @@ void ENGINE_load_cryptodev(void)
      put_dev_crypto(fd);
  
      if (!ENGINE_set_id(engine, "cryptodev") ||
@@ -435,3 +444,6 @@ diff -Nura openssl-1.0.2.orig/crypto/engine/eng_cryptodev.c openssl-1.0.2/crypto
          !ENGINE_set_ciphers(engine, cryptodev_engine_ciphers) ||
          !ENGINE_set_digests(engine, cryptodev_engine_digests) ||
          !ENGINE_set_ctrl_function(engine, cryptodev_ctrl) ||
+-- 
+2.1.0
+
diff --git a/package/openssl/005-Make-c_rehash-match-commands-starting-with-minus-inste.patch b/package/openssl/0003-Fix-c_rehash.patch
similarity index 71%
rename from package/openssl/005-Make-c_rehash-match-commands-starting-with-minus-inste.patch
rename to package/openssl/0003-Fix-c_rehash.patch
index 5db95d6..2c51832 100644
--- a/package/openssl/005-Make-c_rehash-match-commands-starting-with-minus-inste.patch
+++ b/package/openssl/0003-Fix-c_rehash.patch
@@ -1,8 +1,10 @@
-From 079cae9d7628f16b9efdf5723d2bfae5bdc2ba4e Mon Sep 17 00:00:00 2001
+From e2b290598f513a5bc4d8187cbc53bbc98b7a1e49 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Tue, 27 Jan 2015 18:27:32 -0300
-Subject: [PATCH] Make c_rehash match commands starting with - (minus) instead
- of minus in any starting position, otherwise a directory named a-b breaks it
+Subject: [PATCH 3/3] Fix c_rehash
+
+Make c_rehash match commands starting with - (minus) instead of minus
+in any starting position, otherwise a directory named a-b breaks it
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
@@ -23,5 +25,5 @@ index 887e927..1df2fab 100644
      last if ( $flag eq '--');
      if ( $flag =~ /-old/) {
 -- 
-2.0.5
+2.1.0
 
diff --git a/package/openssl/001-do-not-build-docs.patch b/package/openssl/001-do-not-build-docs.patch
deleted file mode 100644
index 135a9d3..0000000
--- a/package/openssl/001-do-not-build-docs.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Dont waste time building manpages if we're not going to use em.
-
---- openssl/Makefile.org
-+++ openssl/Makefile.org
-@@ -792,7 +792,7 @@
- dist_pem_h:
- 	(cd crypto/pem; $(MAKE) CC='${CC}' SDIRS='${SDIRS}' CFLAG='${CFLAG}' pem.h; $(MAKE) clean)
- 
--install: all install_docs install_sw
-+install: all install_sw
- 
- install_sw:
- 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
-- 
2.1.0
