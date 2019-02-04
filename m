From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 21:57:54 +0100
Subject: [Buildroot] [git commit] libopenssl: bump version to 1.1.1a
Message-ID: <20190204205637.032EB83BE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8e3f5da86fd6a375f9509e81610c10aea791797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- use BR2_TOOLCHAIN_HAS_UCONTEXT
    This is used to set -DOPENSSL_NO_ASYNC if needed.

- apply the CFLAGS correctly when compiling with -Os (bugfix).

- use -latomic when needed
    This fixes the build for br-sparc-uclibc-2018.05

- don't use madvise() if no MMU
    Trying to do so results in undefined reference to madvise() as
    it is not available on uclibc without MMU.
    The original openssl code checks if a macro used in the madvise call
    is defined. The problem comes from the fact that the code in
    crypto/mem_sec.c also includes a kernel header defining the same macro
    unconditionally. Thus the check is always true in that case.
    Upstream: https://github.com/openssl/openssl/pull/8089

- don't compile test/fuzzers
    These binaries introduced with 1.1.x sometimes do not compile.
    This is the case with the br-arm-cortex-m4-full toolchain

- don't build ocsp daemon if no MMU.
    Patch from  Richard Levitte.

- correctly enable cryptodev engine
    Thanks to Arnout Vandecappelle for spotting this.

- remove all parallel build patches (openssl build-system changed)

- rebased 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
  to apply to Configurations/unix-Makefile.tmpl (Makefile template)

- removed 0002-cryptodev-Fix-issue-with-signature-generation.patch
  (upstream applied)

- rebased 0003-Reproducible-build-do-not-leak-compiler-path.patch to
  apply to crypto/build.info (Makefile template)

- fix musl/uclibc build failure, use '-DOPENSSL_NO_ASYNC'

- remove legacy enable-tlsext configure option

- remove target/host libdir configure options, fixes openssl.pc installation
  path, fixes wget compile

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
Tested-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...time-building-manpages-if-we-re-not-going.patch |  34 +-
 ...todev-Fix-issue-with-signature-generation.patch | 450 ---------------------
 ...roducible-build-do-not-leak-compiler-path.patch |  31 +-
 ...he-OPENSSL_NO_MADVISE-to-disable-call-to-.patch |  27 ++
 ...-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch |  46 +++
 package/libopenssl/libopenssl.hash                 |  15 +-
 package/libopenssl/libopenssl.mk                   |  59 +--
 7 files changed, 147 insertions(+), 515 deletions(-)

diff --git a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
index 10d2b7526c..f20b6f0834 100644
--- a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
+++ b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
@@ -1,27 +1,31 @@
-From 389efb564fa1453a9da835393eec9006bfae2a52 Mon Sep 17 00:00:00 2001
+From d8f104bffb0c4acb8c5fcdf49628f7d02ed48f7f Mon Sep 17 00:00:00 2001
 From: Mike Frysinger <vapier@gentoo.org>
 Date: Sat, 16 May 2015 18:53:51 +0200
-Subject: Dont waste time building manpages if we're not going to use em.
+Subject: [PATCH] Dont waste time building manpages if we're not going to use
+ em.
 
 Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
 [Gustavo: update for parallel-build]
+
+[rebased on openssl-1.1.0h]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- Makefile.org | 2 +-
+ Configurations/unix-Makefile.tmpl | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile.org b/Makefile.org
-index 60f07cc..976ceaf 100644
---- a/Makefile.org
-+++ b/Makefile.org
-@@ -527,7 +527,7 @@ dist:
- dist_pem_h:
- 	(cd crypto/pem; $(MAKE) -e $(BUILDENV) pem.h; $(MAKE) clean)
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index 40cf2c3..777d9ca 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -268,7 +268,7 @@ list-tests:
+ 	@echo "Tests are not supported with your chosen Configure options"
+ 	@ : {- output_on() if !$disabled{tests}; "" -}
+ 
+-install: install_sw install_ssldirs install_docs
++install: install_sw install_ssldirs
  
--install: install_docs install_sw
-+install: install_sw
+ uninstall: uninstall_docs uninstall_sw
  
- install_sw:
- 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
 -- 
-1.9.1
+2.16.3
 
diff --git a/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch b/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
deleted file mode 100644
index 47295500c0..0000000000
--- a/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
+++ /dev/null
@@ -1,450 +0,0 @@
-From 90fd7e8f1a316cda86ee442b43fcd7d5e5baeede Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 16 May 2015 18:55:08 +0200
-Subject: cryptodev: Fix issue with signature generation
-
-Forward port of 0001-cryptodev-Fix-issue-with-signature-generation.patch
-from http://rt.openssl.org/Ticket/Display.html?id=2770&user=guest&pass=guest
-It was originally targetted at 1.0.2-beta3.
-
-Without this patch digest acceleration via cryptodev is broken.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
----
- crypto/engine/eng_cryptodev.c | 195 +++++++++++++++++++++++++++++++-----------
- 1 file changed, 146 insertions(+), 49 deletions(-)
-
-diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
-index 926d95c..7021d9a 100644
---- a/crypto/engine/eng_cryptodev.c
-+++ b/crypto/engine/eng_cryptodev.c
-@@ -2,6 +2,7 @@
-  * Copyright (c) 2002 Bob Beck <beck@openbsd.org>
-  * Copyright (c) 2002 Theo de Raadt
-  * Copyright (c) 2002 Markus Friedl
-+ * Copyright (c) 2012 Nikos Mavrogiannopoulos
-  * All rights reserved.
-  *
-  * Redistribution and use in source and binary forms, with or without
-@@ -72,7 +73,6 @@ struct dev_crypto_state {
-     struct session_op d_sess;
-     int d_fd;
- # ifdef USE_CRYPTODEV_DIGESTS
--    char dummy_mac_key[HASH_MAX_LEN];
-     unsigned char digest_res[HASH_MAX_LEN];
-     char *mac_data;
-     int mac_len;
-@@ -189,8 +189,10 @@ static struct {
- static struct {
-     int id;
-     int nid;
--    int keylen;
-+    int digestlen;
- } digests[] = {
-+#if 0
-+    /* HMAC is not supported */
-     {
-         CRYPTO_MD5_HMAC, NID_hmacWithMD5, 16
-     },
-@@ -198,15 +200,15 @@ static struct {
-         CRYPTO_SHA1_HMAC, NID_hmacWithSHA1, 20
-     },
-     {
--        CRYPTO_RIPEMD160_HMAC, NID_ripemd160, 16
--        /* ? */
-+        CRYPTO_SHA2_256_HMAC, NID_hmacWithSHA256, 32
-     },
-     {
--        CRYPTO_MD5_KPDK, NID_undef, 0
-+        CRYPTO_SHA2_384_HMAC, NID_hmacWithSHA384, 48
-     },
-     {
--        CRYPTO_SHA1_KPDK, NID_undef, 0
-+        CRYPTO_SHA2_512_HMAC, NID_hmacWithSHA512, 64
-     },
-+#endif
-     {
-         CRYPTO_MD5, NID_md5, 16
-     },
-@@ -214,6 +216,15 @@ static struct {
-         CRYPTO_SHA1, NID_sha1, 20
-     },
-     {
-+        CRYPTO_SHA2_256, NID_sha256, 32
-+    },
-+    {
-+        CRYPTO_SHA2_384, NID_sha384, 48
-+    },
-+    {
-+        CRYPTO_SHA2_512, NID_sha512, 64
-+    },
-+    {
-         0, NID_undef, 0
-     },
- };
-@@ -288,13 +299,14 @@ static int get_cryptodev_ciphers(const int **cnids)
-     static int nids[CRYPTO_ALGORITHM_MAX];
-     struct session_op sess;
-     int fd, i, count = 0;
-+    unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
- 
-     if ((fd = get_dev_crypto()) < 0) {
-         *cnids = NULL;
-         return (0);
-     }
-     memset(&sess, 0, sizeof(sess));
--    sess.key = (caddr_t) "123456789abcdefghijklmno";
-+    sess.key = (void*)fake_key;
- 
-     for (i = 0; ciphers[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
-         if (ciphers[i].nid == NID_undef)
-@@ -327,18 +339,19 @@ static int get_cryptodev_digests(const int **cnids)
-     static int nids[CRYPTO_ALGORITHM_MAX];
-     struct session_op sess;
-     int fd, i, count = 0;
-+    unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
- 
-     if ((fd = get_dev_crypto()) < 0) {
-         *cnids = NULL;
-         return (0);
-     }
-     memset(&sess, 0, sizeof(sess));
--    sess.mackey = (caddr_t) "123456789abcdefghijklmno";
-+    sess.mackey = fake_key;
-     for (i = 0; digests[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
-         if (digests[i].nid == NID_undef)
-             continue;
-         sess.mac = digests[i].id;
--        sess.mackeylen = digests[i].keylen;
-+        sess.mackeylen = 8;
-         sess.cipher = 0;
-         if (ioctl(fd, CIOCGSESSION, &sess) != -1 &&
-             ioctl(fd, CIOCFSESSION, &sess.ses) != -1)
-@@ -424,14 +437,14 @@ cryptodev_cipher(EVP_CIPHER_CTX *ctx, unsigned char *out,
-     cryp.ses = sess->ses;
-     cryp.flags = 0;
-     cryp.len = inl;
--    cryp.src = (caddr_t) in;
--    cryp.dst = (caddr_t) out;
-+    cryp.src = (void*) in;
-+    cryp.dst = (void*) out;
-     cryp.mac = 0;
- 
-     cryp.op = ctx->encrypt ? COP_ENCRYPT : COP_DECRYPT;
- 
-     if (ctx->cipher->iv_len) {
--        cryp.iv = (caddr_t) ctx->iv;
-+	cryp.iv = (void*) ctx->iv;
-         if (!ctx->encrypt) {
-             iiv = in + inl - ctx->cipher->iv_len;
-             memcpy(save_iv, iiv, ctx->cipher->iv_len);
-@@ -483,7 +496,7 @@ cryptodev_init_key(EVP_CIPHER_CTX *ctx, const unsigned char *key,
-     if ((state->d_fd = get_dev_crypto()) < 0)
-         return (0);
- 
--    sess->key = (caddr_t) key;
-+    sess->key = (void*)key;
-     sess->keylen = ctx->key_len;
-     sess->cipher = cipher;
- 
-@@ -749,16 +762,6 @@ static int digest_nid_to_cryptodev(int nid)
-     return (0);
- }
- 
--static int digest_key_length(int nid)
--{
--    int i;
--
--    for (i = 0; digests[i].id; i++)
--        if (digests[i].nid == nid)
--            return digests[i].keylen;
--    return (0);
--}
--
- static int cryptodev_digest_init(EVP_MD_CTX *ctx)
- {
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
-         return (0);
-     }
- 
--    sess->mackey = state->dummy_mac_key;
--    sess->mackeylen = digest_key_length(ctx->digest->type);
-+    sess->mackey = NULL;
-+    sess->mackeylen = 0;
-     sess->mac = digest;
- 
-     if (ioctl(state->d_fd, CIOCGSESSION, sess) < 0) {
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
-     cryp.ses = sess->ses;
-     cryp.flags = 0;
-     cryp.len = count;
--    cryp.src = (caddr_t) data;
-+    cryp.src = (void*) data;
-     cryp.dst = NULL;
--    cryp.mac = (caddr_t) state->digest_res;
-+    cryp.mac = (void*) state->digest_res;
-     if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
-         printf("cryptodev_digest_update: digest failed\n");
-         return (0);
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
-         cryp.len = state->mac_len;
-         cryp.src = state->mac_data;
-         cryp.dst = NULL;
--        cryp.mac = (caddr_t) md;
-+	cryp.mac = (void*)md;
-         if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
-             printf("cryptodev_digest_final: digest failed\n");
-             return (0);
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
- 
-     digest = digest_nid_to_cryptodev(to->digest->type);
- 
--    sess->mackey = dstate->dummy_mac_key;
--    sess->mackeylen = digest_key_length(to->digest->type);
-+    sess->mackey = NULL;
-+    sess->mackeylen = 0;
-     sess->mac = digest;
- 
-     dstate->d_fd = get_dev_crypto();
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
- 
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
-+
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
-+
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
-+
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
-+
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
-     case NID_sha1:
-         *digest = &cryptodev_sha1;
-         break;
-+    case NID_sha224:
-+        *digest = &cryptodev_sha224;
-+	break;
-+    case NID_sha256:
-+        *digest = &cryptodev_sha256;
-+	break;
-+    case NID_sha384:
-+        *digest = &cryptodev_sha384;
-+	break;
-+    case NID_sha512:
-+    	*digest = &cryptodev_sha512;
-+	break;
-     default:
- # endif                         /* USE_CRYPTODEV_DIGESTS */
-         *digest = NULL;
-@@ -1022,7 +1118,7 @@ static int bn2crparam(const BIGNUM *a, struct crparam *crp)
-         return (1);
-     memset(b, 0, bytes);
- 
--    crp->crp_p = (caddr_t) b;
-+    crp->crp_p = (void*) b;
-     crp->crp_nbits = bits;
- 
-     for (i = 0, j = 0; i < a->top; i++) {
-@@ -1277,7 +1373,7 @@ static DSA_SIG *cryptodev_dsa_do_sign(const unsigned char *dgst, int dlen,
-     kop.crk_op = CRK_DSA_SIGN;
- 
-     /* inputs: dgst dsa->p dsa->q dsa->g dsa->priv_key */
--    kop.crk_param[0].crp_p = (caddr_t) dgst;
-+    kop.crk_param[0].crp_p = (void*)dgst;
-     kop.crk_param[0].crp_nbits = dlen * 8;
-     if (bn2crparam(dsa->p, &kop.crk_param[1]))
-         goto err;
-@@ -1317,7 +1413,7 @@ cryptodev_dsa_verify(const unsigned char *dgst, int dlen,
-     kop.crk_op = CRK_DSA_VERIFY;
- 
-     /* inputs: dgst dsa->p dsa->q dsa->g dsa->pub_key sig->r sig->s */
--    kop.crk_param[0].crp_p = (caddr_t) dgst;
-+    kop.crk_param[0].crp_p = (void*)dgst;
-     kop.crk_param[0].crp_nbits = dlen * 8;
-     if (bn2crparam(dsa->p, &kop.crk_param[1]))
-         goto err;
-@@ -1398,9 +1494,10 @@ cryptodev_dh_compute_key(unsigned char *key, const BIGNUM *pub_key, DH *dh)
-         goto err;
-     kop.crk_iparams = 3;
- 
--    kop.crk_param[3].crp_p = (caddr_t) key;
--    kop.crk_param[3].crp_nbits = keylen * 8;
-+    kop.crk_param[3].crp_p = (void*) key;
-+    kop.crk_param[3].crp_nbits = keylen;
-     kop.crk_oparams = 1;
-+    dhret = keylen / 8;
- 
-     if (ioctl(fd, CIOCKEY, &kop) == -1) {
-         const DH_METHOD *meth = DH_OpenSSL();
-@@ -1470,7 +1567,7 @@ void ENGINE_load_cryptodev(void)
-     put_dev_crypto(fd);
- 
-     if (!ENGINE_set_id(engine, "cryptodev") ||
--        !ENGINE_set_name(engine, "BSD cryptodev engine") ||
-+        !ENGINE_set_name(engine, "cryptodev engine") ||
-         !ENGINE_set_ciphers(engine, cryptodev_engine_ciphers) ||
-         !ENGINE_set_digests(engine, cryptodev_engine_digests) ||
-         !ENGINE_set_ctrl_function(engine, cryptodev_ctrl) ||
--- 
-1.9.1
-
diff --git a/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
index eff72c548a..820c2addf1 100644
--- a/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
+++ b/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
@@ -1,26 +1,29 @@
-From 875fcad2ad84877763cba86c1265b57679b878b0 Mon Sep 17 00:00:00 2001
+From b70be8c65365a8fc564226360d45adbbb29fc0af Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Tue, 24 Oct 2017 16:58:32 +0200
 Subject: [PATCH] Reproducible build: do not leak compiler path
 
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+[Rebased on openssl-1.1.1.a]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- crypto/Makefile | 2 +-
+ crypto/build.info | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/crypto/Makefile b/crypto/Makefile
-index 7869996..7e63291 100644
---- a/crypto/Makefile
-+++ b/crypto/Makefile
-@@ -55,7 +55,7 @@ top:
- all: shared
+diff --git a/crypto/build.info b/crypto/build.info
+index 2c619c6..49ca6ab 100644
+--- a/crypto/build.info
++++ b/crypto/build.info
+@@ -10,7 +10,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
+         ppccpuid.pl pariscid.pl alphacpuid.pl arm64cpuid.pl armv4cpuid.pl
  
- buildinf.h: ../Makefile
--	$(PERL) $(TOP)/util/mkbuildinf.pl "$(CC) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
-+	$(PERL) $(TOP)/util/mkbuildinf.pl "$$(basename $(CC)) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
+ DEPEND[cversion.o]=buildinf.h
+-GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC) $(LIB_CFLAGS) $(CPPFLAGS_Q)" "$(PLATFORM)"
++GENERATE[buildinf.h]=../util/mkbuildinf.pl "$$(basename $(CC)) $(LIB_CFLAGS) $(CPPFLAGS_Q)" "$(PLATFORM)"
+ DEPEND[buildinf.h]=../configdata.pm
  
- x86cpuid.s:	x86cpuid.pl perlasm/x86asm.pl
- 	$(PERL) x86cpuid.pl $(PERLASM_SCHEME) $(CFLAGS) $(PROCESSOR) > $@
+ GENERATE[uplink-x86.s]=../ms/uplink-x86.pl $(PERLASM_SCHEME)
 -- 
-2.11.0
+2.20.1
 
diff --git a/package/libopenssl/0004-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch b/package/libopenssl/0004-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
new file mode 100644
index 0000000000..c51a3cd684
--- /dev/null
+++ b/package/libopenssl/0004-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
@@ -0,0 +1,27 @@
+From 1281ffc7959bd2070563e17a52ee4424196d885c Mon Sep 17 00:00:00 2001
+From: Patrick Havelange <patrick.havelange@essensium.com>
+Date: Wed, 23 Jan 2019 12:21:21 +0100
+Subject: [PATCH] Introduce the OPENSSL_NO_MADVISE to disable call to madvise()
+
+Upstream: https://github.com/openssl/openssl/pull/8089
+Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
+---
+ crypto/mem_sec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/mem_sec.c b/crypto/mem_sec.c
+index 9e0f670..32c7282 100644
+--- a/crypto/mem_sec.c
++++ b/crypto/mem_sec.c
+@@ -485,7 +485,7 @@ static int sh_init(size_t size, int minsize)
+     if (mlock(sh.arena, sh.arena_size) < 0)
+         ret = 2;
+ #endif
+-#ifdef MADV_DONTDUMP
++#if defined(MADV_DONTDUMP) && !defined(OPENSSL_NO_MADVISE)
+     if (madvise(sh.arena, sh.arena_size, MADV_DONTDUMP) < 0)
+         ret = 2;
+ #endif
+-- 
+2.17.1
+
diff --git a/package/libopenssl/0005-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch b/package/libopenssl/0005-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch
new file mode 100644
index 0000000000..83989fe742
--- /dev/null
+++ b/package/libopenssl/0005-apps-ocsp.c-Use-the-same-HAVE_FORK-NO_FORK-as-in-spe.patch
@@ -0,0 +1,46 @@
+From 4c992673890f1d1ecb9aa46112b2ca80db016b67 Mon Sep 17 00:00:00 2001
+From: Richard Levitte <levitte@openssl.org>
+Date: Mon, 12 Nov 2018 18:16:27 +0100
+Subject: [PATCH] apps/ocsp.c Use the same HAVE_FORK / NO_FORK as in speed.c
+
+This allows the user to override our defaults if needed, and in a
+consistent manner.
+
+Partial fix for #7607
+
+Upstream: https://github.com/openssl/openssl/pull/7624
+Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
+---
+ apps/ocsp.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/apps/ocsp.c b/apps/ocsp.c
+index 7fd78624bb..315b072932 100644
+--- a/apps/ocsp.c
++++ b/apps/ocsp.c
+@@ -36,7 +36,21 @@ NON_EMPTY_TRANSLATION_UNIT
+ # include <openssl/x509v3.h>
+ # include <openssl/rand.h>
+ 
+-# if defined(OPENSSL_SYS_UNIX) && !defined(OPENSSL_NO_SOCK) \
++#ifndef HAVE_FORK
++# if defined(OPENSSL_SYS_VMS) || defined(OPENSSL_SYS_WINDOWS)
++#  define HAVE_FORK 0
++# else
++#  define HAVE_FORK 1
++# endif
++#endif
++
++#if HAVE_FORK
++# undef NO_FORK
++#else
++# define NO_FORK
++#endif
++
++# if !defined(NO_FORK) && !defined(OPENSSL_NO_SOCK) \
+      && !defined(OPENSSL_NO_POSIX_IO)
+ #  define OCSP_DAEMON
+ #  include <sys/types.h>
+-- 
+2.17.1
+
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 83fb8bd513..568d7e8b52 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,10 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.0.2q.tar.gz.sha256
-sha256	5744cfcbcec2b1b48629f7354203bc1e5e9b5466998bbccc5b5fcde3b18eb684	openssl-1.0.2q.tar.gz
-# From https://www.openssl.org/source/openssl-1.0.2q.tar.gz.sha1
-sha1	692f5f2f1b114f8adaadaa3e7be8cce1907f38c5				openssl-1.0.2q.tar.gz
-# Locally computed
-sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
-sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
-sha256	30cb49489de5041841a74da9155cd4fabfbce33237262ba7cd23974314ae2956	openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
-sha256	deaf6f3af41874ecc6d63841ea14b8e6c71cea81d4a511a754bc90c9a993147f	openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
-sha256	c8f60f4842bbad0353f5d81620e72b168b5638ca3a0a999f5da113b22491612e	LICENSE
+# From https://www.openssl.org/source/openssl-1.1.1a.tar.gz.sha256
+sha256	fc20130f8b7cbd2fb918b2f14e2f429e109c31ddd0fb38fc5d71d9ffed3f9f41	openssl-1.1.1a.tar.gz
+
+# License files
+sha256	350c7817af2ef980d3f3922bc5e0bb6a9d9f6cc21e784a699bcd2a31c74a84b1	LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index dc15abf66a..0bfc74ed0e 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.0.2q
+LIBOPENSSL_VERSION = 1.1.1a
 LIBOPENSSL_SITE = https://www.openssl.org/source
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
@@ -27,14 +22,31 @@ LIBOPENSSL_CFLAGS += -mxgot
 endif
 
 ifeq ($(BR2_USE_MMU),)
-LIBOPENSSL_CFLAGS += -DHAVE_FORK=0
+LIBOPENSSL_CFLAGS += -DHAVE_FORK=0 -DOPENSSL_NO_MADVISE
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_CRYPTODEV),y)
-LIBOPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
 LIBOPENSSL_DEPENDENCIES += cryptodev
 endif
 
+# fixes the following build failures:
+#
+# - musl
+#   ./libcrypto.so: undefined reference to `getcontext'
+#   ./libcrypto.so: undefined reference to `setcontext'
+#   ./libcrypto.so: undefined reference to `makecontext'
+#
+# - uclibc:
+#   crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name ???ucontext_t???
+#
+
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
+endif
+ifeq ($(BR2_TOOLCHAIN_HAS_UCONTEXT),)
+LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
+endif
+
 # Some architectures are optimized in OpenSSL
 # Doesn't work for thumb-only (Cortex-M?)
 ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
@@ -65,11 +77,13 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
 		./config \
 		--prefix=$(HOST_DIR) \
 		--openssldir=$(HOST_DIR)/etc/ssl \
-		--libdir=/lib \
+		no-tests \
+		no-fuzz-libfuzzer \
+		no-fuzz-afl \
 		shared \
 		zlib-dynamic \
 	)
-	$(SED) "s#-O[0-9]#$(HOST_CFLAGS)#" $(@D)/Makefile
+	$(SED) "s#-O[0-9s]#$(HOST_CFLAGS)#" $(@D)/Makefile
 endef
 
 define LIBOPENSSL_CONFIGURE_CMDS
@@ -80,18 +94,21 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			linux-$(LIBOPENSSL_TARGET_ARCH) \
 			--prefix=/usr \
 			--openssldir=/etc/ssl \
-			--libdir=/lib \
+			$(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic) \
 			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
 			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
+			$(if $(BR2_PACKAGE_HAS_CRYPTODEV),enable-devcryptoeng) \
 			no-rc5 \
 			enable-camellia \
 			enable-mdc2 \
-			enable-tlsext \
+			no-tests \
+			no-fuzz-libfuzzer \
+			no-fuzz-afl \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
 			$(if $(BR2_STATIC_LIBS),no-dso) \
 	)
 	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
-	$(SED) "s#-O[0-9]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
+	$(SED) "s#-O[0-9s]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
 	$(SED) "s# build_tests##" $(@D)/Makefile
 endef
 
@@ -112,7 +129,7 @@ define LIBOPENSSL_BUILD_CMDS
 endef
 
 define LIBOPENSSL_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define HOST_LIBOPENSSL_INSTALL_CMDS
@@ -120,7 +137,7 @@ define HOST_LIBOPENSSL_INSTALL_CMDS
 endef
 
 define LIBOPENSSL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	rm -rf $(TARGET_DIR)/usr/lib/ssl
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
@@ -135,16 +152,6 @@ endef
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
@@ -162,7 +169,7 @@ endif
 
 ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
 define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
-	rm -rf $(TARGET_DIR)/usr/lib/engines
+	rm -rf $(TARGET_DIR)/usr/lib/engines-1.1
 endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
 endif
