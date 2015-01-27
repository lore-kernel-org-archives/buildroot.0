From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 14:31:35 +0100
Subject: [Buildroot] [git commit] openssl: bump version to 1.0.2
Message-ID: <20150127144332.A5C0F8083C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74dd54bf73ad25eb29384b7e2ca9ee5a2760d448
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 1.0.2
- Adapt patches to new version
- Update hash value

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/002-dont-force-large-file.patch    |   28 +-
 ...todev-Fix-issue-with-signature-generation.patch |  727 ++++++++++----------
 package/openssl/openssl.hash                       |    8 +-
 package/openssl/openssl.mk                         |    2 +-
 4 files changed, 381 insertions(+), 384 deletions(-)

diff --git a/package/openssl/002-dont-force-large-file.patch b/package/openssl/002-dont-force-large-file.patch
index 5b04656..13340d6 100644
--- a/package/openssl/002-dont-force-large-file.patch
+++ b/package/openssl/002-dont-force-large-file.patch
@@ -1,19 +1,19 @@
 [patch]: bss_file.c: don't force largefile mode
----
- crypto/bio/bss_file.c |    3 ---
- 1 file changed, 3 deletions(-)
 
-Index: openssl-0.9.8g/crypto/bio/bss_file.c
-===================================================================
---- openssl-0.9.8g.orig/crypto/bio/bss_file.c
-+++ openssl-0.9.8g/crypto/bio/bss_file.c
+[Adapted to version 1.0.2]
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/crypto/bio/bss_file.c b/crypto/bio/bss_file.c
+--- a/crypto/bio/bss_file.c	2015-01-22 14:58:32.000000000 +0000
++++ b/crypto/bio/bss_file.c	2015-01-26 16:27:52.972519876 +0000
 @@ -78,9 +78,6 @@
-  * sequential access of large files without extra "magic" comprise *BSD,
-  * Darwin, IRIX...
+  * of 32-bit platforms which allow for sequential access of large files
+  * without extra "magic" comprise *BSD, Darwin, IRIX...
   */
--#ifndef _FILE_OFFSET_BITS
--#define _FILE_OFFSET_BITS 64
--#endif
- #endif
+-#  ifndef _FILE_OFFSET_BITS
+-#   define _FILE_OFFSET_BITS 64
+-#  endif
+ # endif
  
- #include <stdio.h>
+ # include <stdio.h>
diff --git a/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch b/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
index a95ba04..5037a76 100644
--- a/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
+++ b/package/openssl/003-cryptodev-Fix-issue-with-signature-generation.patch
@@ -6,14 +6,14 @@ Subject: [PATCH] cryptodev: Fix issue with signature generation
 That patch also enables support for SHA2 hashes, and
 removes support for hashes that were never supported by
 cryptodev.
----
- crypto/engine/eng_cryptodev.c | 192 ++++++++++++++++++++++++++++++------------
- 1 file changed, 140 insertions(+), 52 deletions(-)
 
-diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
-index 568e131..a1c39e5 100644
---- a/crypto/engine/eng_cryptodev.c
-+++ b/crypto/engine/eng_cryptodev.c
+[Adapted to version 1.0.2]
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
+--- a/crypto/engine/eng_cryptodev.c	2015-01-22 14:58:32.000000000 +0000
++++ b/crypto/engine/eng_cryptodev.c	2015-01-26 17:44:23.925408473 +0000
 @@ -2,6 +2,7 @@
   * Copyright (c) 2002 Bob Beck <beck@openbsd.org>
   * Copyright (c) 2002 Theo de Raadt
@@ -22,408 +22,405 @@ index 568e131..a1c39e5 100644
   * All rights reserved.
   *
   * Redistribution and use in source and binary forms, with or without
-@@ -74,8 +75,6 @@ struct dev_crypto_state {
- 	int d_fd;
- 
- #ifdef USE_CRYPTODEV_DIGESTS
--	char dummy_mac_key[HASH_MAX_LEN];
--
- 	unsigned char digest_res[HASH_MAX_LEN];
- 	char *mac_data;
- 	int mac_len;
-@@ -162,15 +161,21 @@ static struct {
+@@ -72,7 +73,6 @@ struct dev_crypto_state {
+     struct session_op d_sess;
+     int d_fd;
+ # ifdef USE_CRYPTODEV_DIGESTS
+-    char dummy_mac_key[HASH_MAX_LEN];
+     unsigned char digest_res[HASH_MAX_LEN];
+     char *mac_data;
+     int mac_len;
+@@ -189,8 +189,10 @@ static struct {
  static struct {
- 	int	id;
- 	int	nid;
--	int 	keylen;
-+	int 	digestlen;
+     int id;
+     int nid;
+-    int keylen;
++    int digestlen;
  } digests[] = {
 +#if 0
-+        /* HMAC is not supported */
- 	{ CRYPTO_MD5_HMAC,		NID_hmacWithMD5,	16},
- 	{ CRYPTO_SHA1_HMAC,		NID_hmacWithSHA1,	20},
--	{ CRYPTO_RIPEMD160_HMAC,	NID_ripemd160,		16/*?*/},
--	{ CRYPTO_MD5_KPDK,		NID_undef,		0},
--	{ CRYPTO_SHA1_KPDK,		NID_undef,		0},
-+	{ CRYPTO_SHA2_256_HMAC,		NID_hmacWithSHA256,	32},
-+	{ CRYPTO_SHA2_384_HMAC,		NID_hmacWithSHA384,	48},
-+	{ CRYPTO_SHA2_512_HMAC,		NID_hmacWithSHA512,	64},
++    /* HMAC is not supported */
+     {
+         CRYPTO_MD5_HMAC, NID_hmacWithMD5, 16
+     },
+@@ -202,18 +204,31 @@ static struct {
+         /* ? */
+     },
+     {
+-        CRYPTO_MD5_KPDK, NID_undef, 0
++        CRYPTO_SHA2_256_HMAC, NID_hmacWithSHA256, 32
+     },
+     {
+-        CRYPTO_SHA1_KPDK, NID_undef, 0
++        CRYPTO_SHA2_384_HMAC, NID_hmacWithSHA384, 48
+     },
+     {
++        CRYPTO_SHA2_512_HMAC, NID_hmacWithSHA512, 64
++    },
 +#endif
- 	{ CRYPTO_MD5,			NID_md5,		16},
- 	{ CRYPTO_SHA1,			NID_sha1,		20},
-+	{ CRYPTO_SHA2_256,		NID_sha256,		32},
-+	{ CRYPTO_SHA2_384,		NID_sha384,		48},
-+	{ CRYPTO_SHA2_512,		NID_sha512,		64},
- 	{ 0,				NID_undef,		0},
++    {
+         CRYPTO_MD5, NID_md5, 16
+     },
+     {
+         CRYPTO_SHA1, NID_sha1, 20
+     },
+     {
++        CRYPTO_SHA2_256, NID_sha256, 32
++    },
++    {
++        CRYPTO_SHA2_384, NID_sha384, 48
++    },
++    {
++        CRYPTO_SHA2_512, NID_sha512, 64
++    },
++    {
+         0, NID_undef, 0
+     },
  };
- #endif
-@@ -248,13 +253,14 @@ get_cryptodev_ciphers(const int **cnids)
- 	static int nids[CRYPTO_ALGORITHM_MAX];
- 	struct session_op sess;
- 	int fd, i, count = 0;
-+	unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
- 
- 	if ((fd = get_dev_crypto()) < 0) {
- 		*cnids = NULL;
- 		return (0);
- 	}
- 	memset(&sess, 0, sizeof(sess));
--	sess.key = (caddr_t)"123456789abcdefghijklmno";
-+	sess.key = (void*)fake_key;
- 
- 	for (i = 0; ciphers[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
- 		if (ciphers[i].nid == NID_undef)
-@@ -286,6 +292,7 @@ static int
- get_cryptodev_digests(const int **cnids)
+@@ -288,13 +303,14 @@ static int get_cryptodev_ciphers(const i
+     static int nids[CRYPTO_ALGORITHM_MAX];
+     struct session_op sess;
+     int fd, i, count = 0;
++    unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
+ 
+     if ((fd = get_dev_crypto()) < 0) {
+         *cnids = NULL;
+         return (0);
+     }
+     memset(&sess, 0, sizeof(sess));
+-    sess.key = (caddr_t) "123456789abcdefghijklmno";
++    sess.key = (void*)fake_key;
+ 
+     for (i = 0; ciphers[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
+         if (ciphers[i].nid == NID_undef)
+@@ -325,6 +341,7 @@ static int get_cryptodev_ciphers(const i
+ static int get_cryptodev_digests(const int **cnids)
  {
- 	static int nids[CRYPTO_ALGORITHM_MAX];
-+	unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
- 	struct session_op sess;
- 	int fd, i, count = 0;
- 
-@@ -294,12 +301,12 @@ get_cryptodev_digests(const int **cnids)
- 		return (0);
- 	}
- 	memset(&sess, 0, sizeof(sess));
--	sess.mackey = (caddr_t)"123456789abcdefghijklmno";
-+	sess.mackey = fake_key;
- 	for (i = 0; digests[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
- 		if (digests[i].nid == NID_undef)
- 			continue;
- 		sess.mac = digests[i].id;
--		sess.mackeylen = digests[i].keylen;
-+		sess.mackeylen = 8;
- 		sess.cipher = 0;
- 		if (ioctl(fd, CIOCGSESSION, &sess) != -1 &&
- 		    ioctl(fd, CIOCFSESSION, &sess.ses) != -1)
-@@ -387,14 +394,14 @@ cryptodev_cipher(EVP_CIPHER_CTX *ctx, unsigned char *out,
- 	cryp.ses = sess->ses;
- 	cryp.flags = 0;
- 	cryp.len = inl;
--	cryp.src = (caddr_t) in;
--	cryp.dst = (caddr_t) out;
-+	cryp.src = (void*) in;
-+	cryp.dst = (void*) out;
- 	cryp.mac = 0;
- 
- 	cryp.op = ctx->encrypt ? COP_ENCRYPT : COP_DECRYPT;
- 
- 	if (ctx->cipher->iv_len) {
--		cryp.iv = (caddr_t) ctx->iv;
-+		cryp.iv = (void*) ctx->iv;
- 		if (!ctx->encrypt) {
- 			iiv = in + inl - ctx->cipher->iv_len;
- 			memcpy(save_iv, iiv, ctx->cipher->iv_len);
-@@ -445,7 +452,7 @@ cryptodev_init_key(EVP_CIPHER_CTX *ctx, const unsigned char *key,
- 	if ((state->d_fd = get_dev_crypto()) < 0)
- 		return (0);
- 
--	sess->key = (caddr_t)key;
-+	sess->key = (void*)key;
- 	sess->keylen = ctx->key_len;
- 	sess->cipher = cipher;
- 
-@@ -715,18 +722,6 @@ digest_nid_to_cryptodev(int nid)
+     static int nids[CRYPTO_ALGORITHM_MAX];
++    unsigned char fake_key[CRYPTO_CIPHER_MAX_KEY_LEN];
+     struct session_op sess;
+     int fd, i, count = 0;
+ 
+@@ -333,12 +350,12 @@ static int get_cryptodev_digests(const i
+         return (0);
+     }
+     memset(&sess, 0, sizeof(sess));
+-    sess.mackey = (caddr_t) "123456789abcdefghijklmno";
++    sess.mackey = fake_key;
+     for (i = 0; digests[i].id && count < CRYPTO_ALGORITHM_MAX; i++) {
+         if (digests[i].nid == NID_undef)
+             continue;
+         sess.mac = digests[i].id;
+-        sess.mackeylen = digests[i].keylen;
++        sess.mackeylen = 8;
+         sess.cipher = 0;
+         if (ioctl(fd, CIOCGSESSION, &sess) != -1 &&
+             ioctl(fd, CIOCFSESSION, &sess.ses) != -1)
+@@ -424,14 +441,14 @@ cryptodev_cipher(EVP_CIPHER_CTX *ctx, un
+     cryp.ses = sess->ses;
+     cryp.flags = 0;
+     cryp.len = inl;
+-    cryp.src = (caddr_t) in;
+-    cryp.dst = (caddr_t) out;
++    cryp.src = (void*) in;
++    cryp.dst = (void*) out;
+     cryp.mac = 0;
+ 
+     cryp.op = ctx->encrypt ? COP_ENCRYPT : COP_DECRYPT;
+ 
+     if (ctx->cipher->iv_len) {
+-        cryp.iv = (caddr_t) ctx->iv;
++        cryp.iv = (void*) ctx->iv;
+         if (!ctx->encrypt) {
+             iiv = in + inl - ctx->cipher->iv_len;
+             memcpy(save_iv, iiv, ctx->cipher->iv_len);
+@@ -483,7 +500,7 @@ cryptodev_init_key(EVP_CIPHER_CTX *ctx, 
+     if ((state->d_fd = get_dev_crypto()) < 0)
+         return (0);
+ 
+-    sess->key = (caddr_t) key;
++    sess->key = (void*)key;
+     sess->keylen = ctx->key_len;
+     sess->cipher = cipher;
+ 
+@@ -749,16 +766,6 @@ static int digest_nid_to_cryptodev(int n
+     return (0);
  }
  
- 
--static int
--digest_key_length(int nid)
+-static int digest_key_length(int nid)
 -{
--	int i;
+-    int i;
 -
--	for (i = 0; digests[i].id; i++)
--		if (digests[i].nid == nid)
--			return digests[i].keylen;
--	return (0);
+-    for (i = 0; digests[i].id; i++)
+-        if (digests[i].nid == nid)
+-            return digests[i].keylen;
+-    return (0);
 -}
 -
--
  static int cryptodev_digest_init(EVP_MD_CTX *ctx)
  {
- 	struct dev_crypto_state *state = ctx->md_data;
-@@ -737,7 +732,6 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
- 		printf("cryptodev_digest_init: Can't get digest \n");
- 		return (0);
- 	}
+     struct dev_crypto_state *state = ctx->md_data;
+@@ -777,8 +784,8 @@ static int cryptodev_digest_init(EVP_MD_
+         return (0);
+     }
+ 
+-    sess->mackey = state->dummy_mac_key;
+-    sess->mackeylen = digest_key_length(ctx->digest->type);
++    sess->mackey = NULL;
++    sess->mackeylen = 0;
+     sess->mac = digest;
+ 
+     if (ioctl(state->d_fd, CIOCGSESSION, sess) < 0) {
+@@ -804,7 +811,7 @@ static int cryptodev_digest_update(EVP_M
+     }
+ 
+     if (!count) {
+-        return (0);
++        return (1);
+     }
+ 
+     if (!(ctx->flags & EVP_MD_CTX_FLAG_ONESHOT)) {
+@@ -828,9 +835,9 @@ static int cryptodev_digest_update(EVP_M
+     cryp.ses = sess->ses;
+     cryp.flags = 0;
+     cryp.len = count;
+-    cryp.src = (caddr_t) data;
++    cryp.src = (void*) data;
+     cryp.dst = NULL;
+-    cryp.mac = (caddr_t) state->digest_res;
++    cryp.mac = (void*) state->digest_res;
+     if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
+         printf("cryptodev_digest_update: digest failed\n");
+         return (0);
+@@ -844,8 +851,6 @@ static int cryptodev_digest_final(EVP_MD
+     struct dev_crypto_state *state = ctx->md_data;
+     struct session_op *sess = &state->d_sess;
+ 
+-    int ret = 1;
 -
- 	memset(state, 0, sizeof(struct dev_crypto_state));
- 
- 	if ((state->d_fd = get_dev_crypto()) < 0) {
-@@ -745,8 +739,8 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
- 		return (0);
- 	}
- 
--	sess->mackey = state->dummy_mac_key;
--	sess->mackeylen = digest_key_length(ctx->digest->type);
-+	sess->mackey = NULL;
-+	sess->mackeylen = 0;
- 	sess->mac = digest;
- 
- 	if (ioctl(state->d_fd, CIOCGSESSION, sess) < 0) {
-@@ -762,8 +756,8 @@ static int cryptodev_digest_init(EVP_MD_CTX *ctx)
- static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
- 		size_t count)
- {
--	struct crypt_op cryp;
- 	struct dev_crypto_state *state = ctx->md_data;
-+	struct crypt_op cryp;
- 	struct session_op *sess = &state->d_sess;
- 
- 	if (!data || state->d_fd < 0) {
-@@ -772,7 +766,7 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
- 	}
- 
- 	if (!count) {
--		return (0);
-+		return (1);
- 	}
- 
- 	if (!(ctx->flags & EVP_MD_CTX_FLAG_ONESHOT)) {
-@@ -795,9 +789,9 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
- 	cryp.ses = sess->ses;
- 	cryp.flags = 0;
- 	cryp.len = count;
--	cryp.src = (caddr_t) data;
-+	cryp.src = (void*) data;
- 	cryp.dst = NULL;
--	cryp.mac = (caddr_t) state->digest_res;
-+	cryp.mac = (void*) state->digest_res;
- 	if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
- 		printf("cryptodev_digest_update: digest failed\n");
- 		return (0);
-@@ -812,8 +806,6 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
- 	struct dev_crypto_state *state = ctx->md_data;
- 	struct session_op *sess = &state->d_sess;
- 
--	int ret = 1;
--
- 	if (!md || state->d_fd < 0) {
- 		printf("cryptodev_digest_final: illegal input\n");
- 		return(0);
-@@ -827,7 +819,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
- 		cryp.len = state->mac_len;
- 		cryp.src = state->mac_data;
- 		cryp.dst = NULL;
--		cryp.mac = (caddr_t)md;
-+		cryp.mac = (void*)md;
- 		if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
- 			printf("cryptodev_digest_final: digest failed\n");
- 			return (0);
-@@ -838,7 +830,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
- 
- 	memcpy(md, state->digest_res, ctx->digest->md_size);
- 
--	return (ret);
-+	return 1;
+     if (!md || state->d_fd < 0) {
+         printf("cryptodev_digest_final: illegal input\n");
+         return (0);
+@@ -859,7 +864,7 @@ static int cryptodev_digest_final(EVP_MD
+         cryp.len = state->mac_len;
+         cryp.src = state->mac_data;
+         cryp.dst = NULL;
+-        cryp.mac = (caddr_t) md;
++        cryp.mac = (void*)md;
+         if (ioctl(state->d_fd, CIOCCRYPT, &cryp) < 0) {
+             printf("cryptodev_digest_final: digest failed\n");
+             return (0);
+@@ -870,7 +875,7 @@ static int cryptodev_digest_final(EVP_MD
+ 
+     memcpy(md, state->digest_res, ctx->digest->md_size);
+ 
+-    return (ret);
++    return 1;
  }
  
+ static int cryptodev_digest_cleanup(EVP_MD_CTX *ctx)
+@@ -921,8 +926,8 @@ static int cryptodev_digest_copy(EVP_MD_
  
-@@ -890,8 +882,8 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to,const EVP_MD_CTX *from)
- 
- 	digest = digest_nid_to_cryptodev(to->digest->type);
+     digest = digest_nid_to_cryptodev(to->digest->type);
  
--	sess->mackey = dstate->dummy_mac_key;
--	sess->mackeylen = digest_key_length(to->digest->type);
-+	sess->mackey = NULL;
-+	sess->mackeylen = 0;
- 	sess->mac = digest;
+-    sess->mackey = dstate->dummy_mac_key;
+-    sess->mackeylen = digest_key_length(to->digest->type);
++    sess->mackey = NULL;
++    sess->mackeylen = 0;
+     sess->mac = digest;
  
- 	dstate->d_fd = get_dev_crypto();
-@@ -916,34 +908,117 @@ static int cryptodev_digest_copy(EVP_MD_CTX *to,const EVP_MD_CTX *from)
+     dstate->d_fd = get_dev_crypto();
+@@ -945,34 +950,117 @@ static int cryptodev_digest_copy(EVP_MD_
+     return 1;
  }
  
- 
 -const EVP_MD cryptodev_sha1 = {
 +static const EVP_MD cryptodev_sha1 = {
- 	NID_sha1,
--	NID_undef, 
-+	NID_sha1WithRSAEncryption,
- 	SHA_DIGEST_LENGTH, 
-+#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+	EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+	EVP_MD_FLAG_DIGALGID_ABSENT|
-+#endif
- 	EVP_MD_FLAG_ONESHOT,
- 	cryptodev_digest_init,
- 	cryptodev_digest_update,
- 	cryptodev_digest_final,
- 	cryptodev_digest_copy,
- 	cryptodev_digest_cleanup,
--	EVP_PKEY_NULL_method,
-+	EVP_PKEY_RSA_method,
- 	SHA_CBLOCK,
--	sizeof(struct dev_crypto_state),
-+	sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
+     NID_sha1,
+-    NID_undef,
++    NID_sha1WithRSAEncryption,
+     SHA_DIGEST_LENGTH,
++    #if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
++        EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
++        EVP_MD_FLAG_DIGALGID_ABSENT|
++    #endif
+     EVP_MD_FLAG_ONESHOT,
+     cryptodev_digest_init,
+     cryptodev_digest_update,
+     cryptodev_digest_final,
+     cryptodev_digest_copy,
+     cryptodev_digest_cleanup,
+-    EVP_PKEY_NULL_method,
+-    SHA_CBLOCK,
+-    sizeof(struct dev_crypto_state),
++    EVP_PKEY_RSA_method,
++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
 +};
 +
 +static const EVP_MD cryptodev_sha256 = {
-+	NID_sha256,
-+	NID_sha256WithRSAEncryption,
-+	SHA256_DIGEST_LENGTH, 
++    NID_sha256,
++    NID_sha256WithRSAEncryption,
++    SHA256_DIGEST_LENGTH, 
 +#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+	EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+	EVP_MD_FLAG_DIGALGID_ABSENT|
++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
++    EVP_MD_FLAG_DIGALGID_ABSENT|
 +#endif
-+	EVP_MD_FLAG_ONESHOT,
-+	cryptodev_digest_init,
-+	cryptodev_digest_update,
-+	cryptodev_digest_final,
-+	cryptodev_digest_copy,
-+	cryptodev_digest_cleanup,
-+	EVP_PKEY_RSA_method,
-+	SHA256_CBLOCK,
-+	sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
-+};
++    EVP_MD_FLAG_ONESHOT,
++    cryptodev_digest_init,
++    cryptodev_digest_update,
++    cryptodev_digest_final,
++    cryptodev_digest_copy,
++    cryptodev_digest_cleanup,
++    EVP_PKEY_RSA_method,
++    SHA256_CBLOCK,
++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
+ };
+ 
+-const EVP_MD cryptodev_md5 = {
 +static const EVP_MD cryptodev_sha224 = {
-+	NID_sha224,
-+	NID_sha224WithRSAEncryption, 
-+	SHA224_DIGEST_LENGTH, 
++    NID_sha224,
++    NID_sha224WithRSAEncryption, 
++    SHA224_DIGEST_LENGTH, 
 +#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+	EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+	EVP_MD_FLAG_DIGALGID_ABSENT|
++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
++    EVP_MD_FLAG_DIGALGID_ABSENT|
 +#endif
-+	EVP_MD_FLAG_ONESHOT,
-+	cryptodev_digest_init,
-+	cryptodev_digest_update,
-+	cryptodev_digest_final,
-+	cryptodev_digest_copy,
-+	cryptodev_digest_cleanup,
-+	EVP_PKEY_RSA_method,
-+	SHA256_CBLOCK,
-+	sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
++    EVP_MD_FLAG_ONESHOT,
++    cryptodev_digest_init,
++    cryptodev_digest_update,
++    cryptodev_digest_final,
++    cryptodev_digest_copy,
++    cryptodev_digest_cleanup,
++    EVP_PKEY_RSA_method,
++    SHA256_CBLOCK,
++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
 +};
 +
 +static const EVP_MD cryptodev_sha384 = {
-+	NID_sha384,
-+	NID_sha384WithRSAEncryption, 
-+	SHA384_DIGEST_LENGTH, 
++    NID_sha384,
++    NID_sha384WithRSAEncryption, 
++    SHA384_DIGEST_LENGTH, 
 +#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+	EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+	EVP_MD_FLAG_DIGALGID_ABSENT|
++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
++    EVP_MD_FLAG_DIGALGID_ABSENT|
 +#endif
-+	EVP_MD_FLAG_ONESHOT,
-+	cryptodev_digest_init,
-+	cryptodev_digest_update,
-+	cryptodev_digest_final,
-+	cryptodev_digest_copy,
-+	cryptodev_digest_cleanup,
-+	EVP_PKEY_RSA_method,
-+	SHA512_CBLOCK,
-+	sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
++    EVP_MD_FLAG_ONESHOT,
++    cryptodev_digest_init,
++    cryptodev_digest_update,
++    cryptodev_digest_final,
++    cryptodev_digest_copy,
++    cryptodev_digest_cleanup,
++    EVP_PKEY_RSA_method,
++    SHA512_CBLOCK,
++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
 +};
 +
 +static const EVP_MD cryptodev_sha512 = {
-+	NID_sha512,
-+	NID_sha512WithRSAEncryption, 
-+	SHA512_DIGEST_LENGTH, 
++    NID_sha512,
++    NID_sha512WithRSAEncryption, 
++    SHA512_DIGEST_LENGTH, 
 +#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+	EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+	EVP_MD_FLAG_DIGALGID_ABSENT|
++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
++    EVP_MD_FLAG_DIGALGID_ABSENT|
 +#endif
-+	EVP_MD_FLAG_ONESHOT,
-+	cryptodev_digest_init,
-+	cryptodev_digest_update,
-+	cryptodev_digest_final,
-+	cryptodev_digest_copy,
-+	cryptodev_digest_cleanup,
-+	EVP_PKEY_RSA_method,
-+	SHA512_CBLOCK,
-+	sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
- };
- 
--const EVP_MD cryptodev_md5 = {
++    EVP_MD_FLAG_ONESHOT,
++    cryptodev_digest_init,
++    cryptodev_digest_update,
++    cryptodev_digest_final,
++    cryptodev_digest_copy,
++    cryptodev_digest_cleanup,
++    EVP_PKEY_RSA_method,
++    SHA512_CBLOCK,
++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
++};
++
 +static const EVP_MD cryptodev_md5 = {
- 	NID_md5,
--	NID_undef, 
-+	NID_md5WithRSAEncryption, 
- 	16 /* MD5_DIGEST_LENGTH */, 
+     NID_md5,
+-    NID_undef,
++    NID_md5WithRSAEncryption, 
+     16 /* MD5_DIGEST_LENGTH */ ,
 +#if defined(EVP_MD_FLAG_PKEY_METHOD_SIGNATURE) && defined(EVP_MD_FLAG_DIGALGID_ABSENT)
-+	EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
-+	EVP_MD_FLAG_DIGALGID_ABSENT|
++    EVP_MD_FLAG_PKEY_METHOD_SIGNATURE|
++    EVP_MD_FLAG_DIGALGID_ABSENT|
 +#endif
- 	EVP_MD_FLAG_ONESHOT,
- 	cryptodev_digest_init,
- 	cryptodev_digest_update,
- 	cryptodev_digest_final,
- 	cryptodev_digest_copy,
- 	cryptodev_digest_cleanup,
--	EVP_PKEY_NULL_method,
-+	EVP_PKEY_RSA_method,
- 	64 /* MD5_CBLOCK */,
--	sizeof(struct dev_crypto_state),
-+	sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
+     EVP_MD_FLAG_ONESHOT,
+     cryptodev_digest_init,
+     cryptodev_digest_update,
+     cryptodev_digest_final,
+     cryptodev_digest_copy,
+     cryptodev_digest_cleanup,
+-    EVP_PKEY_NULL_method,
++    EVP_PKEY_RSA_method,
+     64 /* MD5_CBLOCK */ ,
+-    sizeof(struct dev_crypto_state),
++    sizeof(EVP_MD *)+sizeof(struct dev_crypto_state),
  };
  
- #endif /* USE_CRYPTODEV_DIGESTS */
-@@ -964,6 +1039,18 @@ cryptodev_engine_digests(ENGINE *e, const EVP_MD **digest,
- 	case NID_sha1:
- 		*digest = &cryptodev_sha1;
-  		break;
-+	case NID_sha224:
-+		*digest = &cryptodev_sha224;
-+ 		break;
-+	case NID_sha256:
-+		*digest = &cryptodev_sha256;
-+ 		break;
-+	case NID_sha384:
-+		*digest = &cryptodev_sha384;
-+ 		break;
-+	case NID_sha512:
-+		*digest = &cryptodev_sha512;
-+ 		break;
- 	default:
- #endif /* USE_CRYPTODEV_DIGESTS */
- 		*digest = NULL;
-@@ -995,7 +1082,7 @@ bn2crparam(const BIGNUM *a, struct crparam *crp)
- 		return (1);
- 	memset(b, 0, bytes);
- 
--	crp->crp_p = (caddr_t) b;
-+	crp->crp_p = (void*) b;
- 	crp->crp_nbits = bits;
- 
- 	for (i = 0, j = 0; i < a->top; i++) {
-@@ -1248,7 +1335,7 @@ cryptodev_dsa_do_sign(const unsigned char *dgst, int dlen, DSA *dsa)
- 	kop.crk_op = CRK_DSA_SIGN;
- 
- 	/* inputs: dgst dsa->p dsa->q dsa->g dsa->priv_key */
--	kop.crk_param[0].crp_p = (caddr_t)dgst;
-+	kop.crk_param[0].crp_p = (void*)dgst;
- 	kop.crk_param[0].crp_nbits = dlen * 8;
- 	if (bn2crparam(dsa->p, &kop.crk_param[1]))
- 		goto err;
-@@ -1288,7 +1375,7 @@ cryptodev_dsa_verify(const unsigned char *dgst, int dlen,
- 	kop.crk_op = CRK_DSA_VERIFY;
- 
- 	/* inputs: dgst dsa->p dsa->q dsa->g dsa->pub_key sig->r sig->s */
--	kop.crk_param[0].crp_p = (caddr_t)dgst;
-+	kop.crk_param[0].crp_p = (void*)dgst;
- 	kop.crk_param[0].crp_nbits = dlen * 8;
- 	if (bn2crparam(dsa->p, &kop.crk_param[1]))
- 		goto err;
-@@ -1366,9 +1453,10 @@ cryptodev_dh_compute_key(unsigned char *key, const BIGNUM *pub_key, DH *dh)
- 		goto err;
- 	kop.crk_iparams = 3;
- 
--	kop.crk_param[3].crp_p = (caddr_t) key;
--	kop.crk_param[3].crp_nbits = keylen * 8;
-+	kop.crk_param[3].crp_p = (void*) key;
-+	kop.crk_param[3].crp_nbits = keylen;
- 	kop.crk_oparams = 1;
-+	dhret = keylen/8;
- 
- 	if (ioctl(fd, CIOCKEY, &kop) == -1) {
- 		const DH_METHOD *meth = DH_OpenSSL();
-@@ -1440,7 +1528,7 @@ ENGINE_load_cryptodev(void)
- 	put_dev_crypto(fd);
- 
- 	if (!ENGINE_set_id(engine, "cryptodev") ||
--	    !ENGINE_set_name(engine, "BSD cryptodev engine") ||
-+	    !ENGINE_set_name(engine, "cryptodev engine") ||
- 	    !ENGINE_set_ciphers(engine, cryptodev_engine_ciphers) ||
- 	    !ENGINE_set_digests(engine, cryptodev_engine_digests) ||
- 	    !ENGINE_set_ctrl_function(engine, cryptodev_ctrl) ||
--- 
-2.0.0
-
+ # endif                         /* USE_CRYPTODEV_DIGESTS */
+@@ -992,6 +1080,18 @@ cryptodev_engine_digests(ENGINE *e, cons
+     case NID_sha1:
+         *digest = &cryptodev_sha1;
+         break;
++    case NID_sha224:
++        *digest = &cryptodev_sha224;
++        break;
++    case NID_sha256:
++        *digest = &cryptodev_sha256;
++        break;
++    case NID_sha384:
++        *digest = &cryptodev_sha384;
++        break;
++    case NID_sha512:
++        *digest = &cryptodev_sha512;
++        break;
+     default:
+ # endif                         /* USE_CRYPTODEV_DIGESTS */
+         *digest = NULL;
+@@ -1022,7 +1122,7 @@ static int bn2crparam(const BIGNUM *a, s
+         return (1);
+     memset(b, 0, bytes);
+ 
+-    crp->crp_p = (caddr_t) b;
++    crp->crp_p = (void*) b;
+     crp->crp_nbits = bits;
+ 
+     for (i = 0, j = 0; i < a->top; i++) {
+@@ -1277,7 +1377,7 @@ static DSA_SIG *cryptodev_dsa_do_sign(co
+     kop.crk_op = CRK_DSA_SIGN;
+ 
+     /* inputs: dgst dsa->p dsa->q dsa->g dsa->priv_key */
+-    kop.crk_param[0].crp_p = (caddr_t) dgst;
++    kop.crk_param[0].crp_p = (void*)dgst;
+     kop.crk_param[0].crp_nbits = dlen * 8;
+     if (bn2crparam(dsa->p, &kop.crk_param[1]))
+         goto err;
+@@ -1317,7 +1417,7 @@ cryptodev_dsa_verify(const unsigned char
+     kop.crk_op = CRK_DSA_VERIFY;
+ 
+     /* inputs: dgst dsa->p dsa->q dsa->g dsa->pub_key sig->r sig->s */
+-    kop.crk_param[0].crp_p = (caddr_t) dgst;
++    kop.crk_param[0].crp_p = (void*)dgst;
+     kop.crk_param[0].crp_nbits = dlen * 8;
+     if (bn2crparam(dsa->p, &kop.crk_param[1]))
+         goto err;
+@@ -1398,9 +1498,10 @@ cryptodev_dh_compute_key(unsigned char *
+         goto err;
+     kop.crk_iparams = 3;
+ 
+-    kop.crk_param[3].crp_p = (caddr_t) key;
+-    kop.crk_param[3].crp_nbits = keylen * 8;
++    kop.crk_param[3].crp_p = (void*) key;
++    kop.crk_param[3].crp_nbits = keylen;
+     kop.crk_oparams = 1;
++    dhret = keylen/8;
+ 
+     if (ioctl(fd, CIOCKEY, &kop) == -1) {
+         const DH_METHOD *meth = DH_OpenSSL();
+@@ -1470,7 +1571,7 @@ void ENGINE_load_cryptodev(void)
+     put_dev_crypto(fd);
+ 
+     if (!ENGINE_set_id(engine, "cryptodev") ||
+-        !ENGINE_set_name(engine, "BSD cryptodev engine") ||
++        !ENGINE_set_name(engine, "cryptodev engine") ||
+         !ENGINE_set_ciphers(engine, cryptodev_engine_ciphers) ||
+         !ENGINE_set_digests(engine, cryptodev_engine_digests) ||
+         !ENGINE_set_ctrl_function(engine, cryptodev_ctrl) ||
diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 79119f1..a8cb172 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,4 +1,4 @@
-# From https://www.openssl.org/source/openssl-1.0.1l.tar.gz.md5
-# From https://www.openssl.org/source/openssl-1.0.1l.tar.gz.sha1
-md5	cdb22925fc9bc97ccbf1e007661f2aa6	openssl-1.0.1l.tar.gz
-sha1	4547a0b4269acf76b1f9e7d188896867d6fc8c18	openssl-1.0.1l.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2.tar.gz.md5
+# From https://www.openssl.org/source/openssl-1.0.2.tar.gz.sha1
+md5 38373013fc85c790aabf8837969c5eba openssl-1.0.2.tar.gz
+sha1 2f264f7f6bb973af444cd9fc6ee65c8588f610cc openssl-1.0.2.tar.gz
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 9b0d9e4..48f287e 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.1l
+OPENSSL_VERSION = 1.0.2
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
