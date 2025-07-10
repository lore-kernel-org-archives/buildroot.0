Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92097C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AAB3614C0;
	Fri, 11 Jul 2025 10:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeq_vHGrhbUx; Fri, 11 Jul 2025 10:22:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D08A9614C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D08A9614C1;
	Fri, 11 Jul 2025 10:22:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4459B199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8074240E79
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TEJRsUXewFp for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BAEB40C4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BAEB40C4E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9980986337; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:39:32 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: ac8b1ac4467219cbde762e844e5c23c244f8523f
X-Git-Newrev: 99726cdafea8d79d5657d860b2b5c1ffa4189254
X-Patchwork-Hint: ignore
Message-Id: <20250711102104.9980986337@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/bmx7: fix build
 w/ mbedtls v3.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99726cdafea8d79d5657d860b2b5c1ffa4189254
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since the mbedtls bump to v3.6 [1] the bmx7 package is failling on the
autobuilder:

```
/workdir/instance-0/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g3  -pedantic -W -Wall -Wstrict-prototypes -Wno-unused-parameter -Os -g3 -std=gnu99 -DGIT_REV=\"0\" -DAVL_5XLINKED -DDEBUG_MALLOC -DCORE_LIMIT=20000      -pedantic -W -Wall -Wstrict-prototypes -Wno-unused-parameter -Os -g3 -std=gnu99 -DGIT_REV=\"0\" -DAVL_5XLINKED -DDEBUG_MALLOC -DCORE_LIMIT=20000       -c crypt.c -o crypt.o
crypt.c:66:10: fatal error: mbedtls/compat-1.3.h: No such file or directory
   66 | #include "mbedtls/compat-1.3.h"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
```

This patch includes a set of upstream patches that address the
compatibility with the v3.6 of mbedtls.

[1] 3481a9643f package/mbedtls: bump to version 3.6.3.1

Fixes: https://autobuild.buildroot.org/results/b77/b776e34d1c5bc3904ea7138bd6c4ac17a1f0fd34/
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c32230fe35c6c962d954a214a7018a2f51c04a1d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-mbedtls-2-8-0-without-mbedtls-compat-1-3.patch | 786 +++++++++++++++++++++
 .../bmx7/0005-towards-mbedtls-3-6-0-support.patch  | 468 ++++++++++++
 ...s-3-6-0-also-disable-no-further-supported.patch | 396 +++++++++++
 ...-mbedtls-3-6-0-based-on-mbedtls-version-h.patch |  32 +
 4 files changed, 1682 insertions(+)

diff --git a/package/bmx7/0004-support-mbedtls-2-8-0-without-mbedtls-compat-1-3.patch b/package/bmx7/0004-support-mbedtls-2-8-0-without-mbedtls-compat-1-3.patch
new file mode 100644
index 0000000000..5cbb66f65f
--- /dev/null
+++ b/package/bmx7/0004-support-mbedtls-2-8-0-without-mbedtls-compat-1-3.patch
@@ -0,0 +1,786 @@
+From a47d8d55717a74a2b399c612dc5a17df8d039125 Mon Sep 17 00:00:00 2001
+From: Axel Neumann <axel@notmail.org>
+Date: Fri, 17 May 2024 07:07:00 +0200
+Subject: [PATCH] Support mbedtls-2.8.0 without mbedtls/compat-1.3.h . Purge
+ Polarssl support
+
+Upstream: https://github.com/bmx-routing/bmx7/commit/a47d8d55717a74a2b399c612dc5a17df8d039125
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/crypt.c | 357 +++++++++++++++++-----------------------------------
+ src/crypt.h |  11 +-
+ 2 files changed, 115 insertions(+), 253 deletions(-)
+
+diff --git a/src/crypt.c b/src/crypt.c
+index 004b8e7..9270b75 100644
+--- a/src/crypt.c
++++ b/src/crypt.c
+@@ -37,34 +37,17 @@ static uint8_t shaClean = NO;
+ 
+ static CRYPTRSA_T *my_PrivKey = NULL;
+ 
+-#if (CRYPTLIB >= POLARSSL_MIN && CRYPTLIB <= POLARSSL_MAX) || (CRYPTLIB >= MBEDTLS_MIN && CRYPTLIB <= MBEDTLS_MAX)
+-
+-#if (CRYPTLIB >= POLARSSL_MIN && CRYPTLIB <= POLARSSL_MAX)
+-/******************* accessing polarssl: *************************************/
+-#include "polarssl/config.h"
+-#include "polarssl/sha256.h"
+-
+-#include "polarssl/entropy.h"
+-//#include "polarssl/entropy_poll.h"
+-
+-#include "polarssl/error.h"
+-#include "polarssl/md.h"
+-#include "polarssl/dhm.h"
+-#include "polarssl/rsa.h"
+-#include "polarssl/ctr_drbg.h"
+-
+-#include "polarssl/x509.h"
+-#if CRYPTLIB <= POLARSSL_1_2_9
+-#include "polarssl/x509write.h"
+-#elif CRYPTLIB >= POLARSSL_1_3_3
+-#include "polarssl/pk.h"
+-#endif
+ 
+-#elif (CRYPTLIB >= MBEDTLS_MIN && CRYPTLIB <= MBEDTLS_MAX)
++#if (CRYPTLIB >= MBEDTLS_MIN && CRYPTLIB <= MBEDTLS_MAX)
+ /******************* accessing mbedtls: *************************************/
+ 
+-#include "mbedtls/compat-1.3.h"
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++//#include "mbedtls/compat-1.3.h"
+ #include "mbedtls/config.h"
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++#include "mbedtls/compat-2.x.h"
++#endif
++
+ #include "mbedtls/sha256.h"
+ #include "mbedtls/entropy.h"
+ #include "mbedtls/error.h"
+@@ -75,10 +58,10 @@ static CRYPTRSA_T *my_PrivKey = NULL;
+ 
+ #endif
+ 
+-static entropy_context entropy_ctx;
+-static ctr_drbg_context ctr_drbg;
++static mbedtls_entropy_context entropy_ctx;
++static mbedtls_ctr_drbg_context ctr_drbg;
++static mbedtls_sha256_context sha_ctx;
+ 
+-static sha256_context sha_ctx;
+ 
+ uint8_t cryptDhmKeyTypeByLen(int len)
+ {
+@@ -111,7 +94,7 @@ void cryptDhmKeyFree(CRYPTDHM_T **cryptKey)
+ 		return;
+ 
+ 	if ((*cryptKey)->backendKey) {
+-		dhm_free((dhm_context*) ((*cryptKey)->backendKey));
++		mbedtls_dhm_free((mbedtls_dhm_context*) ((*cryptKey)->backendKey));
+ 		debugFree((*cryptKey)->backendKey, -300828);
+ 	}
+ 
+@@ -129,25 +112,25 @@ void cryptDhmKeyFree(CRYPTDHM_T **cryptKey)
+  *  http://www.cl.cam.ac.uk/~rja14/Papers/psandqs.pdf
+  *  http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-2643
+  */
+-static int _cryptDhmCheckRange(const mpi *param, const mpi *P)
++static int _cryptDhmCheckRange(const mbedtls_mpi *param, const mbedtls_mpi *P)
+ {
+-	mpi L, U;
++	mbedtls_mpi L, U;
+ 	int ret = FAILURE; //POLARSSL_ERR_DHM_BAD_INPUT_DATA;
+ 
+-	mpi_init(&L);
+-	mpi_init(&U);
++	mbedtls_mpi_init(&L);
++	mbedtls_mpi_init(&U);
+ 
+ 	if (
+-		mpi_lset(&L, 2) == 0 &&
+-		mpi_sub_int(&U, P, 2) == 0 &&
+-		mpi_cmp_mpi(param, &L) >= 0 &&
+-		mpi_cmp_mpi(param, &U) <= 0) {
++		mbedtls_mpi_lset(&L, 2) == 0 &&
++		mbedtls_mpi_sub_int(&U, P, 2) == 0 &&
++		mbedtls_mpi_cmp_mpi(param, &L) >= 0 &&
++		mbedtls_mpi_cmp_mpi(param, &U) <= 0) {
+ 
+ 		ret = SUCCESS;
+ 	}
+ 
+-	mpi_free(&L);
+-	mpi_free(&U);
++	mbedtls_mpi_free(&L);
++	mbedtls_mpi_free(&U);
+ 	return( ret);
+ }
+ 
+@@ -158,20 +141,12 @@ CRYPTDHM_T *cryptDhmKeyMake(uint8_t keyType, uint8_t attempt)
+ 	char *goto_error_code = NULL;
+ 	int keyLen = 0;
+ 	CRYPTDHM_T *key = debugMallocReset(sizeof(CRYPTDHM_T), -300829);
+-	dhm_context *dhm = debugMallocReset(sizeof(dhm_context), -300830);
+-#if !(CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB <= MBEDTLS_MAX)
+-	char *pptr = NULL;
+-	char *gptr = NULL;
+-#endif
++	mbedtls_dhm_context *dhm = debugMallocReset(sizeof(mbedtls_dhm_context), -300830);
+ 	int pSize = 0;
+ 	int xSize = 0;
+ 	int gxSize = 0;
+ 	int count = 0;
+ 
+-#if CRYPTLIB >= POLARSSL_1_3_9
+-	// in older versions, if dhm_init() exist, it only zero-memsets the dhm context
+-	dhm_init(dhm);
+-#endif
+ 	key->backendKey = dhm;
+ 
+ 	if (!(keyType))
+@@ -179,58 +154,36 @@ CRYPTDHM_T *cryptDhmKeyMake(uint8_t keyType, uint8_t attempt)
+ 	if ((keyLen = cryptDhmKeyLenByType(keyType)) <= 0)
+ 		goto_error(finish, "Invalid size");
+ 
+-#if (CRYPTLIB >= POLARSSL_MIN && CRYPTLIB <= POLARSSL_MAX)
+-	if (keyType == CRYPT_DHM1024_TYPE) {
+-		pptr = POLARSSL_DHM_RFC5114_MODP_1024_P;
+-		gptr = POLARSSL_DHM_RFC5114_MODP_1024_G;
+-	} else if (keyType == CRYPT_DHM2048_TYPE) {
+-		pptr = POLARSSL_DHM_RFC3526_MODP_2048_P;
+-		gptr = POLARSSL_DHM_RFC3526_MODP_2048_G;
+-	} else if (keyType == CRYPT_DHM3072_TYPE) {
+-		pptr = POLARSSL_DHM_RFC3526_MODP_3072_P;
+-		gptr = POLARSSL_DHM_RFC3526_MODP_3072_G;
+-#elif (CRYPTLIB >= MBEDTLS_MIN && CRYPTLIB < MBEDTLS_2_8_0)
+-	if (keyType == CRYPT_DHM2048_TYPE) {
+-		pptr = MBEDTLS_DHM_RFC3526_MODP_2048_P;
+-		gptr = MBEDTLS_DHM_RFC3526_MODP_2048_G;
+-	} else if (keyType == CRYPT_DHM3072_TYPE) {
+-		pptr = MBEDTLS_DHM_RFC3526_MODP_3072_P;
+-		gptr = MBEDTLS_DHM_RFC3526_MODP_3072_G;
+-#elif (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB <= MBEDTLS_MAX)
+ 
+ 	if (keyType == CRYPT_DHM2048_TYPE) {
+ 		static const unsigned char modp2048P[(2048/8)] = MBEDTLS_DHM_RFC3526_MODP_2048_P_BIN;
+ 		static const unsigned char modp2048G[1] = MBEDTLS_DHM_RFC3526_MODP_2048_G_BIN;
+-		if ((ret = mpi_read_binary(&dhm->P, modp2048P, sizeof(modp2048P) )) != 0 || (ret = mpi_read_binary(&dhm->G, modp2048G, sizeof(modp2048G))) != 0)
+-			goto_error(finish, "Failed setting dhm parameters!");
++
++		if ((ret = mbedtls_mpi_read_binary(&dhm->P, modp2048P, sizeof(modp2048P) )) != 0 || (ret = mbedtls_mpi_read_binary(&dhm->G, modp2048G, sizeof(modp2048G))) != 0)
++			goto_error(finish, "Failed reading dhm2048 parameters!");
+ 
+ 	} else if (keyType == CRYPT_DHM3072_TYPE) {
+ 		static const unsigned char modp3072P[(3072/8)] = MBEDTLS_DHM_RFC3526_MODP_3072_P_BIN;
+ 		static const unsigned char modp3072G[1] = MBEDTLS_DHM_RFC3526_MODP_3072_G_BIN;
+-		if ((ret = mpi_read_binary(&dhm->P, modp3072P, sizeof(modp3072P) )) != 0 || (ret = mpi_read_binary(&dhm->G, modp3072G, sizeof(modp3072G))) != 0)
+-			goto_error(finish, "Failed setting dhm parameters!");
+-#endif
++		if ((ret = mbedtls_mpi_read_binary(&dhm->P, modp3072P, sizeof(modp3072P) )) != 0 || (ret = mbedtls_mpi_read_binary(&dhm->G, modp3072G, sizeof(modp3072G))) != 0)
++			goto_error(finish, "Failed reading dhm3072 parameters!");
+ 	} else {
+ 		goto_error(finish, "Unsupported dhm type!");
+ 	}
+ 
+-#if !(CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB <= MBEDTLS_MAX)
+-	if ((ret = mpi_read_string(&dhm->P, 16, pptr)) != 0 || (ret = mpi_read_string(&dhm->G, 16, gptr)) != 0)
+-		goto_error(finish, "Failed setting dhm parameters!");
+-#endif
+-	if (mpi_cmp_int(&dhm->P, 0) == 0)
++	if (mbedtls_mpi_cmp_int(&dhm->P, 0) == 0)
+ 		goto_error(finish, "Empty dhm->P");
+ 
+ 	// Generate X as large as possible ( < P )
+-	if ((pSize = mpi_size(&dhm->P)) != keyLen)
++	if ((pSize = mbedtls_mpi_size(&dhm->P)) != keyLen)
+ 		goto_error(finish, "Invalid P size");
+ 
+ 	do {
+-		if ((ret = mpi_fill_random(&dhm->X, pSize, ctr_drbg_random, &ctr_drbg)) != 0)
++		if ((ret = mbedtls_mpi_fill_random(&dhm->X, pSize, mbedtls_ctr_drbg_random, &ctr_drbg)) != 0)
+ 			goto_error(finish, "Failed allocating randomness");
+ 
+-		while (mpi_cmp_mpi(&dhm->X, &dhm->P) >= 0) {
+-			if ((ret = mpi_shift_r(&dhm->X, 1)) != 0)
++		while (mbedtls_mpi_cmp_mpi(&dhm->X, &dhm->P) >= 0) {
++			if ((ret = mbedtls_mpi_shift_r(&dhm->X, 1)) != 0)
+ 				goto_error(finish, "Failed shifting dhm->X param");
+ 		}
+ 
+@@ -240,13 +193,13 @@ CRYPTDHM_T *cryptDhmKeyMake(uint8_t keyType, uint8_t attempt)
+ 	} while ((ret = _cryptDhmCheckRange(&dhm->X, &dhm->P)) != SUCCESS);
+ 
+ 	// Calculate GX = G^X mod P
+-	if (mpi_exp_mod(&dhm->GX, &dhm->G, &dhm->X, &dhm->P, &dhm->RP) != 0)
++	if (mbedtls_mpi_exp_mod(&dhm->GX, &dhm->G, &dhm->X, &dhm->P, &dhm->RP) != 0)
+ 		goto_error(finish, "Failed creating GX modulo");
+-	if (((int) (dhm->len = mpi_size(&dhm->P))) != keyLen)
++	if (((int) (dhm->len = mbedtls_mpi_size(&dhm->P))) != keyLen)
+ 		goto_error(finish, "Invalid len");
+-	if ((xSize = mpi_size(&dhm->X)) != keyLen)
++	if ((xSize = mbedtls_mpi_size(&dhm->X)) != keyLen)
+ 		goto_error(finish, "Invalid X size");
+-	if ((gxSize = mpi_size(&dhm->GX)) != keyLen)
++	if ((gxSize = mbedtls_mpi_size(&dhm->GX)) != keyLen)
+ 		goto_error(finish, "Invalid GX size");
+ 	if ((ret = _cryptDhmCheckRange(&dhm->GX, &dhm->P)) != SUCCESS)
+ 		goto_error(finish, "Invalid GX range");
+@@ -277,19 +230,19 @@ void cryptDhmPubKeyGetRaw(CRYPTDHM_T* key, uint8_t* buff, uint16_t buffLen)
+ 	assertion_dbg(-502719, (key && buff && buffLen && key->rawGXType && buffLen == key->rawGXLen),
+ 		"Failed: key=%d buff=%d buffLen=%d key.GXLen=%d", !!key, !!buff, buffLen, key ? key->rawGXLen : 0);
+ 
+-	dhm_context *dhm = key->backendKey;
++	mbedtls_dhm_context *dhm = key->backendKey;
+ 
+-	assertion_dbg(-502720, (dhm && buffLen == mpi_size(&dhm->GX) && buffLen == dhm->len),
+-		"Failed: dhm.GXlen=%zd dhm.len=%zd", dhm ? mpi_size(&dhm->GX) : 0, dhm ? dhm->len : 0);
++	assertion_dbg(-502720, (dhm && buffLen == mbedtls_mpi_size(&dhm->GX) && buffLen == dhm->len),
++		"Failed: dhm.GXlen=%zd dhm.len=%zd", dhm ? mbedtls_mpi_size(&dhm->GX) : 0, dhm ? dhm->len : 0);
+ 
+-	mpi_write_binary(&dhm->GX, buff, key->rawGXLen);
++	mbedtls_mpi_write_binary(&dhm->GX, buff, key->rawGXLen);
+ }
+ 
+ STATIC_FUNC
+ IDM_T cryptDhmKeyCheck(CRYPTDHM_T *key)
+ {
+ 	char *goto_error_code = NULL;
+-	dhm_context *dhm = NULL;
++	mbedtls_dhm_context *dhm = NULL;
+ 	uint8_t keyType = 0;
+ 	int keyLen = 0;
+ 	int pSize = 0;
+@@ -297,7 +250,7 @@ IDM_T cryptDhmKeyCheck(CRYPTDHM_T *key)
+ 	int gxSize = 0;
+ 	int gySize = 0;
+ 
+-	if (!(dhm = (dhm_context *) key->backendKey))
++	if (!(dhm = (mbedtls_dhm_context *) key->backendKey))
+ 		goto_error(finish, "Missing backend key");
+ 	if (!(keyType = key->rawGXType))
+ 		goto_error(finish, "Missing type");
+@@ -305,13 +258,13 @@ IDM_T cryptDhmKeyCheck(CRYPTDHM_T *key)
+ 		goto_error(finish, "Invalid size");
+ 	if ((int) dhm->len != keyLen)
+ 		goto_error(finish, "Invalid len");
+-	if ((pSize = mpi_size(&dhm->P)) != keyLen)
++	if ((pSize = mbedtls_mpi_size(&dhm->P)) != keyLen)
+ 		goto_error(finish, "Invalid P size");
+-	if ((xSize = mpi_size(&dhm->X)) != keyLen)
++	if ((xSize = mbedtls_mpi_size(&dhm->X)) != keyLen)
+ 		goto_error(finish, "Invalid X size");
+-	if ((gxSize = mpi_size(&dhm->GX)) != keyLen)
++	if ((gxSize = mbedtls_mpi_size(&dhm->GX)) != keyLen)
+ 		goto_error(finish, "Invalid GX size");
+-	if ((gySize = mpi_size(&dhm->GY)) != keyLen)
++	if ((gySize = mbedtls_mpi_size(&dhm->GY)) != keyLen)
+ 		goto_error(finish, "Invalid GY size");
+ 	if (_cryptDhmCheckRange(&dhm->GX, &dhm->P) != SUCCESS)
+ 		goto_error(finish, "Invalid GX range");
+@@ -333,7 +286,7 @@ CRYPTSHA_T *cryptDhmSecretForNeigh(CRYPTDHM_T *myDhm, uint8_t *neighRawKey, uint
+ 	uint8_t keyType = 0;
+ 	int ret = 0;
+ 	CRYPTSHA_T *secret = NULL;
+-	dhm_context *dhm = NULL;
++	mbedtls_dhm_context *dhm = NULL;
+ 	uint8_t buff[CRYPT_DHM_MAX_LEN];
+ 	size_t n = 0;
+ 
+@@ -343,17 +296,13 @@ CRYPTSHA_T *cryptDhmSecretForNeigh(CRYPTDHM_T *myDhm, uint8_t *neighRawKey, uint
+ 	if (((keyType = cryptDhmKeyTypeByLen(neighRawKeyLen)) != myDhm->rawGXType) || ((n = dhm->len) != neighRawKeyLen) || (sizeof(buff) < neighRawKeyLen))
+ 		goto_error(finish, "Wrong type or keyLength");
+ 
+-	if ((ret = mpi_read_binary(&dhm->GY, neighRawKey, neighRawKeyLen)) != 0)
++	if ((ret = mbedtls_mpi_read_binary(&dhm->GY, neighRawKey, neighRawKeyLen)) != 0)
+ 		goto_error(finish, "Invalid GY");
+ 
+ 	if (cryptDhmKeyCheck(myDhm) != SUCCESS)
+ 		goto_error(finish, "Failed key check");
+ 
+-#if (CRYPTLIB >= POLARSSL_MIN && CRYPTLIB <= POLARSSL_MAX)
+-	if ((ret = dhm_calc_secret(dhm, buff, &n, ctr_drbg_random, &ctr_drbg)) != 0)
+-#elif (CRYPTLIB >= MBEDTLS_MIN && CRYPTLIB <= MBEDTLS_MAX)
+-	if ((ret = dhm_calc_secret(dhm, buff, sizeof(buff), &n, ctr_drbg_random, &ctr_drbg)) != 0)
+-#endif
++	if ((ret = mbedtls_dhm_calc_secret(dhm, buff, sizeof(buff), &n, mbedtls_ctr_drbg_random, &ctr_drbg)) != 0)
+ 		goto_error(finish, "Failed calculating secret");
+ 
+ 	if (n > neighRawKeyLen || n < ((neighRawKeyLen / 4)*3))
+@@ -368,8 +317,8 @@ CRYPTSHA_T *cryptDhmSecretForNeigh(CRYPTDHM_T *myDhm, uint8_t *neighRawKey, uint
+ 		dbgf(((goto_error_code || n != neighRawKeyLen) ? DBGL_SYS : DBGL_CHANGES), ((goto_error_code || n != neighRawKeyLen) ? DBGT_WARN : DBGT_INFO),
+ 		"%s n=%zd neighKeyLen=%d myKeyLen=%d", goto_error_code, n, neighRawKeyLen, myDhm->rawGXLen);
+ 
+-		mpi_free(&dhm->GY);
+-		mpi_free(&dhm->K);
++		mbedtls_mpi_free(&dhm->GY);
++		mbedtls_mpi_free(&dhm->K);
+ 		memset(buff, 0, sizeof(buff));
+ 		return secret; }
+ }
+@@ -381,14 +330,10 @@ void cryptRsaKeyFree(CRYPTRSA_T **cryptKey)
+ 		return;
+ 
+ 	if ((*cryptKey)->backendKey) {
+-		rsa_free((rsa_context*) ((*cryptKey)->backendKey));
++		mbedtls_rsa_free((mbedtls_rsa_context*) ((*cryptKey)->backendKey));
+ 		debugFree((*cryptKey)->backendKey, -300612);
+ 	}
+ 
+-	//	if ((*cryptKey)->__rawKey) {
+-	//		debugFree((*cryptKey)->__rawKey, -300613);
+-	//	}
+-
+ 	debugFree((*cryptKey), -300614);
+ 
+ 	*cryptKey = NULL;
+@@ -397,15 +342,15 @@ void cryptRsaKeyFree(CRYPTRSA_T **cryptKey)
+ int cryptRsaPubKeyGetRaw(CRYPTRSA_T *key, uint8_t *buff, uint16_t buffLen)
+ {
+ 
+-	rsa_context *rsa;
++	mbedtls_rsa_context *rsa;
+ 	if (!key || !buff || !buffLen ||
+ 		!key->rawKeyType || (buffLen != key->rawKeyLen) ||
+-		!(rsa = (rsa_context*) key->backendKey) || buffLen != mpi_size(&rsa->N) || buffLen != rsa->len) {
++		!(rsa = (mbedtls_rsa_context*) key->backendKey) || buffLen != mbedtls_mpi_size(&rsa->N) || buffLen != rsa->len) {
+ 
+ 		return FAILURE;
+ 	}
+ 
+-	if (mpi_write_binary(&rsa->N, buff, buffLen) != 0)
++	if (mbedtls_mpi_write_binary(&rsa->N, buff, buffLen) != 0)
+ 		return FAILURE;
+ 
+ 	return SUCCESS;
+@@ -420,16 +365,16 @@ CRYPTRSA_T *cryptRsaPubKeyFromRaw(uint8_t *rawKey, uint16_t rawKeyLen)
+ 
+ 	CRYPTRSA_T *cryptKey = debugMallocReset(sizeof(CRYPTRSA_T), -300615);
+ 
+-	cryptKey->backendKey = debugMalloc(sizeof(rsa_context), -300620);
++	cryptKey->backendKey = debugMalloc(sizeof(mbedtls_rsa_context), -300620);
+ 
+-	rsa_context *rsa = (rsa_context*) cryptKey->backendKey;
++	mbedtls_rsa_context *rsa = (mbedtls_rsa_context*) cryptKey->backendKey;
+ 
+-	rsa_init(rsa, RSA_PKCS_V15, 0);
++	mbedtls_rsa_init(rsa, MBEDTLS_RSA_PKCS_V15, 0);
+ 
+ 
+ 	if (
+-		(mpi_read_binary(&rsa->N, rawKey, rawKeyLen)) ||
+-		(mpi_read_binary(&rsa->E, (uint8_t*) & e, sizeof(e)))
++		(mbedtls_mpi_read_binary(&rsa->N, rawKey, rawKeyLen)) ||
++		(mbedtls_mpi_read_binary(&rsa->E, (uint8_t*) & e, sizeof(e)))
+ 		) {
+ 		cryptRsaKeyFree(&cryptKey);
+ 		return NULL;
+@@ -439,7 +384,6 @@ CRYPTRSA_T *cryptRsaPubKeyFromRaw(uint8_t *rawKey, uint16_t rawKeyLen)
+ 	cryptKey->rawKeyLen = rawKeyLen;
+ 	cryptKey->rawKeyType = cryptRsaKeyTypeByLen(rawKeyLen);
+ 
+-
+ #ifdef EXTREME_PARANOIA
+ 	uint8_t buff[rawKeyLen];
+ 	memset(buff, 0, rawKeyLen);
+@@ -448,10 +392,6 @@ CRYPTRSA_T *cryptRsaPubKeyFromRaw(uint8_t *rawKey, uint16_t rawKeyLen)
+ 	assertion(-502722, (memcmp(rawKey, buff, rawKeyLen) == 0));
+ #endif
+ 
+-
+-	//	cryptKey->__rawKey = debugMalloc(rawKeyLen,-300618);
+-	//	memcpy(cryptKey->__rawKey, rawKey, rawKeyLen);
+-
+ 	return cryptKey;
+ }
+ 
+@@ -460,10 +400,10 @@ int cryptRsaPubKeyCheck(CRYPTRSA_T *pubKey)
+ 	assertion(-502141, (pubKey));
+ 	assertion(-502142, (pubKey->backendKey));
+ 
+-	rsa_context *rsa = (rsa_context*) pubKey->backendKey;
++	mbedtls_rsa_context *rsa = (mbedtls_rsa_context*) pubKey->backendKey;
+ 
+-	if (!rsa->len || (int) rsa->len != cryptRsaKeyLenByType(pubKey->rawKeyType) || rsa->len != pubKey->rawKeyLen || rsa->len != mpi_size(&rsa->N) ||
+-		rsa_check_pubkey((rsa_context*) pubKey->backendKey)) {
++	if (!rsa->len || (int) rsa->len != cryptRsaKeyLenByType(pubKey->rawKeyType) || rsa->len != pubKey->rawKeyLen || rsa->len != mbedtls_mpi_size(&rsa->N) ||
++		mbedtls_rsa_check_pubkey((mbedtls_rsa_context*) pubKey->backendKey)) {
+ 
+ 		return FAILURE;
+ 	}
+@@ -512,48 +452,35 @@ CRYPTRSA_T *cryptRsaKeyFromDer(char *keyPath)
+ 
+ 	CRYPTRSA_T *privKey = debugMallocReset(sizeof(CRYPTRSA_T), -300619);
+ 	CRYPTRSA_T *pubKey = NULL;
+-	privKey->backendKey = debugMallocReset(sizeof(rsa_context), -300620);
++	privKey->backendKey = debugMallocReset(sizeof(mbedtls_rsa_context), -300620);
+ 
+-	rsa_context *rsa = privKey->backendKey;
++	mbedtls_rsa_context *rsa = privKey->backendKey;
+ 	int ret = 0;
+ 	int keyType = 0;
+ 	int keyLen = 0;
+ 	uint8_t keyBuff[CRYPT_RSA_MAX_LEN];
+ 
+-#if CRYPTLIB <= POLARSSL_1_2_9
+-	if (
+-		(ret = x509parse_keyfile(rsa, keyPath, "")) ||
+-		(ret = rsa_check_privkey(rsa))
+-		) {
+-		dbgf_sys(DBGT_ERR, "failed opening private key=%s err=%d", keyPath, ret);
+-		cryptRsaKeyFree(&privKey);
+-		return NULL;
+-	}
+-#elif CRYPTLIB >= POLARSSL_1_3_3
+-	pk_context pk;
+-	pk_init(&pk);
+-	rsa_init(rsa, RSA_PKCS_V15, 0);
++	mbedtls_pk_context pk;
++	mbedtls_pk_init(&pk);
++	mbedtls_rsa_init(rsa, MBEDTLS_RSA_PKCS_V15, 0);
+ 
+ 	if (
+-		((ret = pk_parse_keyfile(&pk, keyPath, "")) != 0) ||
+-		((ret = rsa_copy(rsa, pk_rsa(pk))) != 0) ||
+-		((ret = rsa_check_privkey(rsa)) != 0)
++		((ret = mbedtls_pk_parse_keyfile(&pk, keyPath, "")) != 0) ||
++		((ret = mbedtls_rsa_copy(rsa, mbedtls_pk_rsa(pk))) != 0) ||
++		((ret = mbedtls_rsa_check_privkey(rsa)) != 0)
+ 		) {
+ 		dbgf_sys(DBGT_ERR, "failed opening private key=%s keyLen=%d keyType=%d err=-%X", keyPath, keyLen, keyType, -ret);
+-		pk_free(&pk);
++		mbedtls_pk_free(&pk);
+ 		cryptRsaKeyFree(&privKey);
+ 		return NULL;
+ 	}
+-	pk_free(&pk);
++	mbedtls_pk_free(&pk);
+ 
+-#else
+-#error "Please fix CRYPTLIB"
+-#endif
+ 
+ 	//cryptKeyAddRaw(ckey);
+ 
+ 	if (
+-		((keyLen = mpi_size(&rsa->N)) <= 0) ||
++		((keyLen = mbedtls_mpi_size(&rsa->N)) <= 0) ||
+ 		!(keyType = cryptRsaKeyTypeByLen(keyLen)) ||
+ 		!(privKey->rawKeyType = keyType) ||
+ 		!(privKey->rawKeyLen = keyLen) ||
+@@ -595,29 +522,16 @@ int cryptRsaKeyMakeDer(int32_t keyType, char *path)
+ 
+ 	memset(derBuf, 0, CRYPT_DER_BUF_SZ);
+ 
+-#if CRYPTLIB <= POLARSSL_1_2_9
+-	rsa_context rsa;
+-	rsa_init(&rsa, RSA_PKCS_V15, 0);
++	mbedtls_pk_context pk;
++	mbedtls_pk_init(&pk);
++	mbedtls_pk_setup(&pk, mbedtls_pk_info_from_type(MBEDTLS_PK_RSA));
+ 
+-	if ((ret = rsa_gen_key(&rsa, ctr_drbg_random, &ctr_drbg, keyBitSize, CRYPT_KEY_E_VAL)))
++	if ((ret = mbedtls_rsa_gen_key(mbedtls_pk_rsa(pk), mbedtls_ctr_drbg_random, &ctr_drbg, keyBitSize, CRYPT_KEY_E_VAL)) ||
++		(ret = mbedtls_rsa_check_privkey(mbedtls_pk_rsa(pk))))
+ 		goto_error(finish, "Failed making rsa key! ret=%d");
+ 
+-	if ((derSz = x509_write_key_der(derBuf, sizeof(derBuf), &rsa)) < 0)
++	if ((derSz = mbedtls_pk_write_key_der(&pk, derBuf, sizeof(derBuf))) <= 0)
+ 		goto_error(finish, "Failed translating rsa key to der! derSz=%d");
+-#elif CRYPTLIB >= POLARSSL_1_3_3
+-	pk_context pk;
+-	pk_init(&pk);
+-	pk_init_ctx(&pk, pk_info_from_type(POLARSSL_PK_RSA));
+-
+-	if ((ret = rsa_gen_key(pk_rsa(pk), ctr_drbg_random, &ctr_drbg, keyBitSize, CRYPT_KEY_E_VAL)) ||
+-		(ret = rsa_check_privkey(pk_rsa(pk))))
+-		goto_error(finish, "Failed making rsa key! ret=%d");
+-
+-	if ((derSz = pk_write_key_der(&pk, derBuf, sizeof(derBuf))) <= 0)
+-		goto_error(finish, "Failed translating rsa key to der! derSz=%d");
+-#else
+-#error "Please fix CRYPTLIB"
+-#endif
+ 
+ 	unsigned char *derStart = derBuf + sizeof(derBuf) - derSz;
+ 
+@@ -629,13 +543,7 @@ int cryptRsaKeyMakeDer(int32_t keyType, char *path)
+ 	{
+ 		memset(derBuf, 0, CRYPT_DER_BUF_SZ);
+ 
+-#if CRYPTLIB <= POLARSSL_1_2_9
+-		rsa_free(&rsa);
+-#elif CRYPTLIB >= POLARSSL_1_3_3
+-		pk_free(&pk);
+-#else
+-#error "Please fix CRYPTLIB"
+-#endif
++		mbedtls_pk_free(&pk);
+ 
+ 		if (keyFile)
+ 			fclose(keyFile);
+@@ -656,10 +564,10 @@ CRYPTRSA_T *cryptRsaKeyMake(uint8_t keyType)
+ 	char *goto_error_code = NULL;
+ 	CRYPTRSA_T *key = debugMallocReset(sizeof(CRYPTRSA_T), -300642);
+ 
+-	rsa_context *rsa = debugMallocReset(sizeof(rsa_context), -300643);
+-	rsa_init(rsa, RSA_PKCS_V15, 0);
++	mbedtls_rsa_context *rsa = debugMallocReset(sizeof(mbedtls_rsa_context), -300643);
++	mbedtls_rsa_init(rsa, MBEDTLS_RSA_PKCS_V15, 0);
+ 
+-	if ((ret = rsa_gen_key(rsa, ctr_drbg_random, &ctr_drbg, (keyLen * 8), CRYPT_KEY_E_VAL)))
++	if ((ret = mbedtls_rsa_gen_key(rsa, mbedtls_ctr_drbg_random, &ctr_drbg, (keyLen * 8), CRYPT_KEY_E_VAL)))
+ 		goto_error(finish, "Failed making rsa key!");
+ 
+ 	key->backendKey = rsa;
+@@ -679,17 +587,17 @@ CRYPTRSA_T *cryptRsaKeyMake(uint8_t keyType)
+ 
+ 		return key; }
+ }
+-#endif
++
+ 
+ int cryptRsaEncrypt(uint8_t *in, size_t inLen, uint8_t *out, size_t *outLen, CRYPTRSA_T *pubKey)
+ {
+ 
+-	rsa_context *pk = pubKey->backendKey;
++	mbedtls_rsa_context *pk = pubKey->backendKey;
+ 
+-	assertion(-502723, (mpi_size(&pk->N) == pubKey->rawKeyLen));
++	assertion(-502723, (mbedtls_mpi_size(&pk->N) == pubKey->rawKeyLen));
+ 	assertion(-502145, (*outLen >= pubKey->rawKeyLen));
+ 
+-	if (rsa_pkcs1_encrypt(pk, ctr_drbg_random, &ctr_drbg, RSA_PUBLIC, inLen, in, out))
++	if (mbedtls_rsa_pkcs1_encrypt(pk, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PUBLIC, inLen, in, out))
+ 		return FAILURE;
+ 
+ 	*outLen = pubKey->rawKeyLen;
+@@ -701,19 +609,12 @@ int cryptRsaEncrypt(uint8_t *in, size_t inLen, uint8_t *out, size_t *outLen, CRY
+ int cryptRsaDecrypt(uint8_t *in, size_t inLen, uint8_t *out, size_t *outLen)
+ {
+ 
+-	rsa_context *pk = my_PrivKey->backendKey;
++	mbedtls_rsa_context *pk = my_PrivKey->backendKey;
+ 
+-	assertion(-502724, (mpi_size(&pk->N) == my_PrivKey->rawKeyLen));
++	assertion(-502724, (mbedtls_mpi_size(&pk->N) == my_PrivKey->rawKeyLen));
+ 	assertion(-502146, (inLen >= my_PrivKey->rawKeyLen));
+-#if CRYPTLIB == POLARSSL_1_2_5
+-	if (rsa_pkcs1_decrypt(pk, RSA_PRIVATE, &inLen, in, out, *outLen))
++	if (mbedtls_rsa_pkcs1_decrypt(pk, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE, &inLen, in, out, *outLen))
+ 		return FAILURE;
+-#elif CRYPTLIB >= POLARSSL_1_2_9
+-	if (rsa_pkcs1_decrypt(pk, ctr_drbg_random, &ctr_drbg, RSA_PRIVATE, &inLen, in, out, *outLen))
+-		return FAILURE;
+-#else
+-#error "Please fix CRYPTLIB"
+-#endif
+ 	*outLen = inLen;
+ 
+ 	return SUCCESS;
+@@ -725,20 +626,13 @@ int cryptRsaSign(CRYPTSHA_T *inSha, uint8_t *out, size_t outLen, CRYPTRSA_T *cry
+ 	if (!cryptKey)
+ 		cryptKey = my_PrivKey;
+ 
+-	rsa_context *pk = cryptKey->backendKey;
++	mbedtls_rsa_context *pk = cryptKey->backendKey;
+ 
+ 	if (outLen < cryptKey->rawKeyLen)
+ 		return FAILURE;
+ 
+-#if CRYPTLIB <= POLARSSL_1_2_9
+-	if (rsa_pkcs1_sign(pk, ctr_drbg_random, &ctr_drbg, RSA_PRIVATE, SIG_RSA_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) inSha, out))
++	if (mbedtls_rsa_pkcs1_sign(pk, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE, MBEDTLS_MD_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) inSha, out))
+ 		return FAILURE;
+-#elif CRYPTLIB >= POLARSSL_1_3_3
+-	if (rsa_pkcs1_sign(pk, ctr_drbg_random, &ctr_drbg, RSA_PRIVATE, POLARSSL_MD_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) inSha, out))
+-		return FAILURE;
+-#else
+-#error "Please fix CRYPTLIB"
+-#endif
+ 
+ 	return SUCCESS;
+ }
+@@ -746,23 +640,12 @@ int cryptRsaSign(CRYPTSHA_T *inSha, uint8_t *out, size_t outLen, CRYPTRSA_T *cry
+ int cryptRsaVerify(uint8_t *sign, size_t signLen, CRYPTSHA_T *plainSha, CRYPTRSA_T *pubKey)
+ {
+ 
+-	rsa_context *pk = pubKey->backendKey;
++	mbedtls_rsa_context *pk = pubKey->backendKey;
+ 
+ 	assertion(-502147, (signLen == pubKey->rawKeyLen));
+ 
+-#if CRYPTLIB == POLARSSL_1_2_5
+-	if (rsa_pkcs1_verify(pk, RSA_PUBLIC, SIG_RSA_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) plainSha, sign))
+-		return FAILURE;
+-#elif CRYPTLIB == POLARSSL_1_2_9
+-	if (rsa_pkcs1_verify(pk, ctr_drbg_random, &ctr_drbg, RSA_PUBLIC, SIG_RSA_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) plainSha, sign))
++	if (mbedtls_rsa_pkcs1_verify(pk, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PUBLIC, MBEDTLS_MD_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) plainSha, sign))
+ 		return FAILURE;
+-#elif CRYPTLIB >= POLARSSL_1_3_3
+-	if (rsa_pkcs1_verify(pk, ctr_drbg_random, &ctr_drbg, RSA_PUBLIC, POLARSSL_MD_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) plainSha, sign))
+-		return FAILURE;
+-#else
+-#error "Please fix CRYPTLIB"
+-#endif
+-
+ 
+ 	return SUCCESS;
+ }
+@@ -770,18 +653,18 @@ int cryptRsaVerify(uint8_t *sign, size_t signLen, CRYPTSHA_T *plainSha, CRYPTRSA
+ void cryptRand(void *out, uint32_t outLen)
+ {
+ 
+-	assertion(-502139, ENTROPY_BLOCK_SIZE > sizeof(CRYPTSHA_T));
++	assertion(-502139, MBEDTLS_ENTROPY_BLOCK_SIZE > sizeof(CRYPTSHA_T));
+ 
+ 	if (outLen <= sizeof(CRYPTSHA_T)) {
+ 
+-		if (entropy_func(&entropy_ctx, out, outLen) != 0)
++		if (mbedtls_entropy_func(&entropy_ctx, out, outLen) != 0)
+ 			cleanup_all(-502148);
+ 	} else {
+ 
+ 		CRYPTSHA_T seed[2];
+ 		uint32_t outPos;
+ 
+-		if (entropy_func(&entropy_ctx, (void*) &seed[0], sizeof(CRYPTSHA_T)) != 0)
++		if (mbedtls_entropy_func(&entropy_ctx, (void*) &seed[0], sizeof(CRYPTSHA_T)) != 0)
+ 			cleanup_all(-502140);
+ 
+ 		cryptShaAtomic(&seed[0], sizeof(CRYPTSHA_T), &seed[1]);
+@@ -799,20 +682,14 @@ void cryptRand(void *out, uint32_t outLen)
+ STATIC_FUNC
+ void cryptRngInit(void)
+ {
+-
+ 	int ret;
+ 
+ 	fflush(stdout);
+-	entropy_init(&entropy_ctx);
++	mbedtls_entropy_init(&entropy_ctx);
+ 
+-#if (CRYPTLIB >= POLARSSL_MIN && CRYPTLIB <= POLARSSL_MAX)
+-	if ((ret = ctr_drbg_init(&ctr_drbg, entropy_func, &entropy_ctx, NULL, 0)) != 0)
+-		cleanup_all(-502149);
+-#elif (CRYPTLIB >= MBEDTLS_MIN && CRYPTLIB <= MBEDTLS_MAX)
+ 	mbedtls_ctr_drbg_init(&ctr_drbg);
+-	if ((ret = mbedtls_ctr_drbg_seed(&ctr_drbg, entropy_func, &entropy_ctx, NULL, 0)) != 0)
++	if ((ret = mbedtls_ctr_drbg_seed(&ctr_drbg, mbedtls_entropy_func, &entropy_ctx, NULL, 0)) != 0)
+ 		cleanup_all(-502149);
+-#endif
+ 
+ 	int test = 0;
+ 
+@@ -829,22 +706,14 @@ void cryptRngFree(void)
+ STATIC_FUNC
+ void cryptShaInit(void)
+ {
+-#if CRYPTLIB < POLARSSL_1_3_9
+-	memset(&sha_ctx, 0, sizeof(sha_ctx));
+-#else
+-	sha256_init(&sha_ctx);
+-#endif
++	mbedtls_sha256_init(&sha_ctx);
+ 	shaClean = YES;
+ }
+ 
+ STATIC_FUNC
+ void cryptShaFree(void)
+ {
+-#if CRYPTLIB < POLARSSL_1_3_9
+-	memset(&sha_ctx, 0, sizeof(sha_ctx));
+-#else
+-	sha256_free(&sha_ctx);
+-#endif
++	mbedtls_sha256_free(&sha_ctx);
+ }
+ 
+ void cryptShaAtomic(void *in, int32_t len, CRYPTSHA_T *sha)
+@@ -855,14 +724,14 @@ void cryptShaAtomic(void *in, int32_t len, CRYPTSHA_T *sha)
+ 
+ 	unsigned char output[32];
+ 
+-#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB <= MBEDTLS_MAX)
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	mbedtls_sha256_starts_ret(&sha_ctx, 1/*is224*/);
+ 	mbedtls_sha256_update_ret(&sha_ctx, in, len);
+ 	mbedtls_sha256_finish_ret(&sha_ctx, output);
+ #else
+-	sha256_starts(&sha_ctx, 1/*is224*/);
+-	sha256_update(&sha_ctx, in, len);
+-	sha256_finish(&sha_ctx, output);
++	mbedtls_sha256_starts(&sha_ctx, 1/*is224*/);
++	mbedtls_sha256_update(&sha_ctx, in, len);
++	mbedtls_sha256_finish(&sha_ctx, output);
+ #endif
+ 	memcpy(sha, output, sizeof(CRYPTSHA_T));
+ 	memset(output, 0, sizeof(output));
+@@ -875,12 +744,12 @@ void cryptShaNew(void *in, int32_t len)
+ 	assertion(-502034, (in && len > 0 && !memcmp(in, in, len)));
+ 	shaClean = NO;
+ 
+-#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB <= MBEDTLS_MAX)
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	mbedtls_sha256_starts_ret(&sha_ctx, 1/*is224*/);
+ 	mbedtls_sha256_update_ret(&sha_ctx, in, len);
+ #else
+-	sha256_starts(&sha_ctx, 1/*is224*/);
+-	sha256_update(&sha_ctx, in, len);
++	mbedtls_sha256_starts(&sha_ctx, 1/*is224*/);
++	mbedtls_sha256_update(&sha_ctx, in, len);
+ #endif
+ }
+ 
+@@ -890,10 +759,10 @@ void cryptShaUpdate(void *in, int32_t len)
+ 	assertion(-502035, (shaClean == NO));
+ 	assertion(-502036, (in && len > 0 && !memcmp(in, in, len)));
+ 
+-#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB <= MBEDTLS_MAX)
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	mbedtls_sha256_update_ret(&sha_ctx, in, len);
+ #else
+-	sha256_update(&sha_ctx, in, len);
++	mbedtls_sha256_update(&sha_ctx, in, len);
+ #endif
+ }
+ 
+@@ -904,10 +773,10 @@ void cryptShaFinal(CRYPTSHA_T *sha)
+ 	assertion(-502038, (sha));
+ 	unsigned char output[32];
+ 
+-#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB <= MBEDTLS_MAX)
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	mbedtls_sha256_finish_ret(&sha_ctx, output);
+ #else
+-	sha256_finish(&sha_ctx, output);
++	mbedtls_sha256_finish(&sha_ctx, output;)
+ #endif
+ 	memcpy(sha, output, sizeof(CRYPTSHA_T));
+ 	memset(output, 0, sizeof(output));
+diff --git a/src/crypt.h b/src/crypt.h
+index bcc91db..da34d4e 100644
+--- a/src/crypt.h
++++ b/src/crypt.h
+@@ -19,20 +19,13 @@
+  * Alternative cryptographic libraries are:
+  * libtomcrypt, gcrypt, cyassl
+  */
+-
+-#define POLARSSL_MIN   1000
+-#define POLARSSL_1_2_5 1125
+-#define POLARSSL_1_2_9 1129
+-#define POLARSSL_1_3_3 1133
+-#define POLARSSL_1_3_4 1134
+-#define POLARSSL_1_3_9 1139
+-#define POLARSSL_MAX   1999
+-
+ #define MBEDTLS_MIN    2000
+ #define MBEDTLS_2_4_0  2240
+ #define MBEDTLS_2_6_0  2260
+ #define MBEDTLS_2_7_0  2270
+ #define MBEDTLS_2_8_0  2280
++#define MBEDTLS_3_0_0  2300
++#define MBEDTLS_3_6_0  2360
+ #define MBEDTLS_MAX    2999
+ 
+ #ifndef CRYPTLIB
diff --git a/package/bmx7/0005-towards-mbedtls-3-6-0-support.patch b/package/bmx7/0005-towards-mbedtls-3-6-0-support.patch
new file mode 100644
index 0000000000..b73976c133
--- /dev/null
+++ b/package/bmx7/0005-towards-mbedtls-3-6-0-support.patch
@@ -0,0 +1,468 @@
+From d4a53a37f82b43abf9509bcb8922ced6c182e59e Mon Sep 17 00:00:00 2001
+From: Axel Neumann <axel@notmail.org>
+Date: Sat, 18 May 2024 07:47:08 +0200
+Subject: [PATCH] Towards mbedtls-3.6.0 support
+
+Upstream: https://github.com/bmx-routing/bmx7/commit/d4a53a37f82b43abf9509bcb8922ced6c182e59e
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/crypt.c | 215 +++++++++++++++++++++++++++++++++++++---------------
+ src/crypt.h |   3 +-
+ 2 files changed, 154 insertions(+), 64 deletions(-)
+
+diff --git a/src/crypt.c b/src/crypt.c
+index 9270b75..91543ef 100644
+--- a/src/crypt.c
++++ b/src/crypt.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2010  Axel Neumann
++ * Copyright (c) 2024  Axel Neumann
+  * This program is free software; you can redistribute it and/or
+  * modify it under the terms of version 2 of the GNU General Public
+  * License as published by the Free Software Foundation.
+@@ -46,6 +46,7 @@ static CRYPTRSA_T *my_PrivKey = NULL;
+ #include "mbedtls/config.h"
+ #elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
+ #include "mbedtls/compat-2.x.h"
++//#include "mbedtls/md.h"
+ #endif
+ 
+ #include "mbedtls/sha256.h"
+@@ -143,9 +144,7 @@ CRYPTDHM_T *cryptDhmKeyMake(uint8_t keyType, uint8_t attempt)
+ 	CRYPTDHM_T *key = debugMallocReset(sizeof(CRYPTDHM_T), -300829);
+ 	mbedtls_dhm_context *dhm = debugMallocReset(sizeof(mbedtls_dhm_context), -300830);
+ 	int pSize = 0;
+-	int xSize = 0;
+-	int gxSize = 0;
+-	int count = 0;
++	unsigned char dummyPubKeyBuff[CRYPT_DHM_MAX_LEN];
+ 
+ 	key->backendKey = dhm;
+ 
+@@ -154,63 +153,57 @@ CRYPTDHM_T *cryptDhmKeyMake(uint8_t keyType, uint8_t attempt)
+ 	if ((keyLen = cryptDhmKeyLenByType(keyType)) <= 0)
+ 		goto_error(finish, "Invalid size");
+ 
++	mbedtls_mpi dhm_P, dhm_G;
++	mbedtls_mpi_init(&dhm_P);
++	mbedtls_mpi_init(&dhm_G);
++    mbedtls_dhm_init(dhm);
+ 
+ 	if (keyType == CRYPT_DHM2048_TYPE) {
+ 		static const unsigned char modp2048P[(2048/8)] = MBEDTLS_DHM_RFC3526_MODP_2048_P_BIN;
+ 		static const unsigned char modp2048G[1] = MBEDTLS_DHM_RFC3526_MODP_2048_G_BIN;
+ 
+-		if ((ret = mbedtls_mpi_read_binary(&dhm->P, modp2048P, sizeof(modp2048P) )) != 0 || (ret = mbedtls_mpi_read_binary(&dhm->G, modp2048G, sizeof(modp2048G))) != 0)
+-			goto_error(finish, "Failed reading dhm2048 parameters!");
++		if (   (ret = mbedtls_mpi_read_binary(&dhm_P, modp2048P, sizeof(modp2048P) )) != 0
++			|| (ret = mbedtls_mpi_read_binary(&dhm_G, modp2048G, sizeof(modp2048G))) != 0)
++			goto_error(finish, "Failed setting dhm2048 parameters!");
+ 
+ 	} else if (keyType == CRYPT_DHM3072_TYPE) {
+ 		static const unsigned char modp3072P[(3072/8)] = MBEDTLS_DHM_RFC3526_MODP_3072_P_BIN;
+ 		static const unsigned char modp3072G[1] = MBEDTLS_DHM_RFC3526_MODP_3072_G_BIN;
+-		if ((ret = mbedtls_mpi_read_binary(&dhm->P, modp3072P, sizeof(modp3072P) )) != 0 || (ret = mbedtls_mpi_read_binary(&dhm->G, modp3072G, sizeof(modp3072G))) != 0)
+-			goto_error(finish, "Failed reading dhm3072 parameters!");
++
++		if (   (ret = mbedtls_mpi_read_binary(&dhm_P, modp3072P, sizeof(modp3072P) )) != 0
++			|| (ret = mbedtls_mpi_read_binary(&dhm_G, modp3072G, sizeof(modp3072G))) != 0)
++			goto_error(finish, "Failed setting dhm3072 parameters!");
++
+ 	} else {
+ 		goto_error(finish, "Unsupported dhm type!");
+ 	}
+ 
+-	if (mbedtls_mpi_cmp_int(&dhm->P, 0) == 0)
++	if (mbedtls_mpi_cmp_int(&dhm_P, 0) == 0)
+ 		goto_error(finish, "Empty dhm->P");
+ 
+-	// Generate X as large as possible ( < P )
+-	if ((pSize = mbedtls_mpi_size(&dhm->P)) != keyLen)
++	if ((pSize = mbedtls_mpi_size(&dhm_P)) != keyLen)
+ 		goto_error(finish, "Invalid P size");
+ 
+-	do {
+-		if ((ret = mbedtls_mpi_fill_random(&dhm->X, pSize, mbedtls_ctr_drbg_random, &ctr_drbg)) != 0)
+-			goto_error(finish, "Failed allocating randomness");
+-
+-		while (mbedtls_mpi_cmp_mpi(&dhm->X, &dhm->P) >= 0) {
+-			if ((ret = mbedtls_mpi_shift_r(&dhm->X, 1)) != 0)
+-				goto_error(finish, "Failed shifting dhm->X param");
+-		}
+-
+-		if ((ret = count++) > 10)
+-			goto_error(finish, "Failed creating dhm->X param");
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	if ((pSize = mbedtls_dhm_get_len(dhm)) != keyLen)
++		goto_error(finish, "Invalid P size");
++#endif
+ 
+-	} while ((ret = _cryptDhmCheckRange(&dhm->X, &dhm->P)) != SUCCESS);
++	if ((ret = mbedtls_dhm_set_group(dhm, &dhm_P, &dhm_G) != 0))
++		goto_error(finish, "Failed grouping dhm parameters!");
+ 
+-	// Calculate GX = G^X mod P
+-	if (mbedtls_mpi_exp_mod(&dhm->GX, &dhm->G, &dhm->X, &dhm->P, &dhm->RP) != 0)
+-		goto_error(finish, "Failed creating GX modulo");
+-	if (((int) (dhm->len = mbedtls_mpi_size(&dhm->P))) != keyLen)
+-		goto_error(finish, "Invalid len");
+-	if ((xSize = mbedtls_mpi_size(&dhm->X)) != keyLen)
+-		goto_error(finish, "Invalid X size");
+-	if ((gxSize = mbedtls_mpi_size(&dhm->GX)) != keyLen)
+-		goto_error(finish, "Invalid GX size");
+-	if ((ret = _cryptDhmCheckRange(&dhm->GX, &dhm->P)) != SUCCESS)
+-		goto_error(finish, "Invalid GX range");
++    if ((ret = mbedtls_dhm_make_public(dhm, (int) keyLen, dummyPubKeyBuff, keyLen,
++                                       mbedtls_ctr_drbg_random, &ctr_drbg)) != 0)
++		goto_error(finish, "Failed creating dhm key pair");
+ 
+ 	key->rawGXType = keyType;
+ 	key->rawGXLen = keyLen;
+ 
+ finish:
+ 	dbgf(goto_error_code ? DBGL_SYS : DBGL_CHANGES, goto_error_code ? DBGT_ERR : DBGT_INFO,
+-		"%s ret=%d keyType=%d keyLen=%d pSize=%d xSize=%d gxSize=%d count=%d attempt=%d",
+-		goto_error_code, ret, keyType, keyLen, pSize, xSize, gxSize, count, attempt);
++		"%s ret=%d keyType=%d keyLen=%d pSize=%d attempt=%d",
++		goto_error_code, ret, keyType, keyLen, pSize, attempt);
+ 
+ 	if (goto_error_code) {
+ 		cryptDhmKeyFree(&key);
+@@ -222,6 +215,9 @@ CRYPTDHM_T *cryptDhmKeyMake(uint8_t keyType, uint8_t attempt)
+ 		return NULL;
+ 	}
+ 
++	mbedtls_mpi_free(&dhm_G);
++	mbedtls_mpi_free(&dhm_P);
++
+ 	return key;
+ }
+ 
+@@ -231,9 +227,14 @@ void cryptDhmPubKeyGetRaw(CRYPTDHM_T* key, uint8_t* buff, uint16_t buffLen)
+ 		"Failed: key=%d buff=%d buffLen=%d key.GXLen=%d", !!key, !!buff, buffLen, key ? key->rawGXLen : 0);
+ 
+ 	mbedtls_dhm_context *dhm = key->backendKey;
+-
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	assertion_dbg(-502720, (dhm && buffLen == mbedtls_mpi_size(&dhm->GX) && buffLen == dhm->len),
+ 		"Failed: dhm.GXlen=%zd dhm.len=%zd", dhm ? mbedtls_mpi_size(&dhm->GX) : 0, dhm ? dhm->len : 0);
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	assertion_dbg(-502720, (dhm && buffLen == mbedtls_dhm_get_len(dhm)),
++		"Failed: dhm.len=%zd", dhm ? mbedtls_dhm_get_len(dhm) : 0);
++#endif
++
+ 
+ 	mbedtls_mpi_write_binary(&dhm->GX, buff, key->rawGXLen);
+ }
+@@ -256,6 +257,7 @@ IDM_T cryptDhmKeyCheck(CRYPTDHM_T *key)
+ 		goto_error(finish, "Missing type");
+ 	if ((keyLen = cryptDhmKeyLenByType(keyType)) <= 0)
+ 		goto_error(finish, "Invalid size");
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	if ((int) dhm->len != keyLen)
+ 		goto_error(finish, "Invalid len");
+ 	if ((pSize = mbedtls_mpi_size(&dhm->P)) != keyLen)
+@@ -270,6 +272,10 @@ IDM_T cryptDhmKeyCheck(CRYPTDHM_T *key)
+ 		goto_error(finish, "Invalid GX range");
+ 	if (_cryptDhmCheckRange(&dhm->GY, &dhm->P) != SUCCESS)
+ 		goto_error(finish, "Invalid GY range");
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	if ((pSize = mbedtls_dhm_get_len(dhm)) != keyLen)
++		goto_error(finish, "Invalid len");
++#endif
+ 
+ 	return SUCCESS;
+ 
+@@ -293,10 +299,17 @@ CRYPTSHA_T *cryptDhmSecretForNeigh(CRYPTDHM_T *myDhm, uint8_t *neighRawKey, uint
+ 	if (!myDhm || !(dhm = myDhm->backendKey) || !myDhm->rawGXType)
+ 		goto_error(finish, "Disabled dhm link signing");
+ 
+-	if (((keyType = cryptDhmKeyTypeByLen(neighRawKeyLen)) != myDhm->rawGXType) || ((n = dhm->len) != neighRawKeyLen) || (sizeof(buff) < neighRawKeyLen))
+-		goto_error(finish, "Wrong type or keyLength");
++	if (((keyType = cryptDhmKeyTypeByLen(neighRawKeyLen)) != myDhm->rawGXType))
++		goto_error(finish, "Wrong type");
+ 
+-	if ((ret = mbedtls_mpi_read_binary(&dhm->GY, neighRawKey, neighRawKeyLen)) != 0)
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++	if (((n = dhm->len) != neighRawKeyLen) || (sizeof(buff) < neighRawKeyLen))
++		goto_error(finish, "Wrong keyLength");
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	if (((n = mbedtls_dhm_get_len(dhm)) != neighRawKeyLen) || (sizeof(buff) < neighRawKeyLen))
++		goto_error(finish, "Wrong keyLength");
++#endif
++	if ((ret = mbedtls_dhm_read_public(dhm, neighRawKey, neighRawKeyLen)) != 0)
+ 		goto_error(finish, "Invalid GY");
+ 
+ 	if (cryptDhmKeyCheck(myDhm) != SUCCESS)
+@@ -311,14 +324,13 @@ CRYPTSHA_T *cryptDhmSecretForNeigh(CRYPTDHM_T *myDhm, uint8_t *neighRawKey, uint
+ 	secret = debugMallocReset(sizeof(CRYPTSHA_T), -300831);
+ 	cryptShaAtomic(buff, n, secret);
+ 
+-
+ finish:
+ 	{
+ 		dbgf(((goto_error_code || n != neighRawKeyLen) ? DBGL_SYS : DBGL_CHANGES), ((goto_error_code || n != neighRawKeyLen) ? DBGT_WARN : DBGT_INFO),
+ 		"%s n=%zd neighKeyLen=%d myKeyLen=%d", goto_error_code, n, neighRawKeyLen, myDhm->rawGXLen);
+ 
+-		mbedtls_mpi_free(&dhm->GY);
+-		mbedtls_mpi_free(&dhm->K);
++//		mbedtls_mpi_free(&dhm->GY);
++//		mbedtls_mpi_free(&dhm->K);
+ 		memset(buff, 0, sizeof(buff));
+ 		return secret; }
+ }
+@@ -345,12 +357,21 @@ int cryptRsaPubKeyGetRaw(CRYPTRSA_T *key, uint8_t *buff, uint16_t buffLen)
+ 	mbedtls_rsa_context *rsa;
+ 	if (!key || !buff || !buffLen ||
+ 		!key->rawKeyType || (buffLen != key->rawKeyLen) ||
+-		!(rsa = (mbedtls_rsa_context*) key->backendKey) || buffLen != mbedtls_mpi_size(&rsa->N) || buffLen != rsa->len) {
++		!(rsa = (mbedtls_rsa_context*) key->backendKey) ||
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++		buffLen != mbedtls_mpi_size(&rsa->N) || buffLen != rsa->len ||
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++#endif
++		buffLen != mbedtls_rsa_get_len(rsa)
++	   ) {
+ 
+ 		return FAILURE;
+ 	}
+ 
+-	if (mbedtls_mpi_write_binary(&rsa->N, buff, buffLen) != 0)
++	mbedtls_mpi mpi_N;
++	mbedtls_mpi_init(&mpi_N);
++	mbedtls_rsa_export(rsa, &mpi_N, NULL, NULL, NULL, NULL);
++	if (mbedtls_mpi_write_binary(&mpi_N, buff, buffLen) != 0)
+ 		return FAILURE;
+ 
+ 	return SUCCESS;
+@@ -368,10 +389,11 @@ CRYPTRSA_T *cryptRsaPubKeyFromRaw(uint8_t *rawKey, uint16_t rawKeyLen)
+ 	cryptKey->backendKey = debugMalloc(sizeof(mbedtls_rsa_context), -300620);
+ 
+ 	mbedtls_rsa_context *rsa = (mbedtls_rsa_context*) cryptKey->backendKey;
++	mbedtls_mpi rsa_N, rsa_E;
+ 
+-	mbedtls_rsa_init(rsa, MBEDTLS_RSA_PKCS_V15, 0);
+-
+-
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++	mbedtls_rsa_init(rsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);
++	/*
+ 	if (
+ 		(mbedtls_mpi_read_binary(&rsa->N, rawKey, rawKeyLen)) ||
+ 		(mbedtls_mpi_read_binary(&rsa->E, (uint8_t*) & e, sizeof(e)))
+@@ -379,8 +401,23 @@ CRYPTRSA_T *cryptRsaPubKeyFromRaw(uint8_t *rawKey, uint16_t rawKeyLen)
+ 		cryptRsaKeyFree(&cryptKey);
+ 		return NULL;
+ 	}
++	*/
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	mbedtls_rsa_init(rsa);
++#endif
++	mbedtls_mpi_init(&rsa_N);
++	mbedtls_mpi_init(&rsa_E);
++
++	if (
++		(mbedtls_mpi_read_binary(&rsa_N, rawKey, rawKeyLen)) ||
++		(mbedtls_mpi_read_binary(&rsa_E, (uint8_t*)&e, sizeof(e))) ||
++		(mbedtls_rsa_import(rsa, &rsa_N, NULL, NULL, NULL, &rsa_E))
++	) {
++		cryptRsaKeyFree(&cryptKey);
++		return NULL;
++	}
+ 
+-	rsa->len = rawKeyLen;
++	assertion(-500000, (mbedtls_rsa_get_len(rsa) == rawKeyLen));
+ 	cryptKey->rawKeyLen = rawKeyLen;
+ 	cryptKey->rawKeyType = cryptRsaKeyTypeByLen(rawKeyLen);
+ 
+@@ -401,9 +438,16 @@ int cryptRsaPubKeyCheck(CRYPTRSA_T *pubKey)
+ 	assertion(-502142, (pubKey->backendKey));
+ 
+ 	mbedtls_rsa_context *rsa = (mbedtls_rsa_context*) pubKey->backendKey;
++	size_t len = mbedtls_rsa_get_len(rsa);
+ 
+-	if (!rsa->len || (int) rsa->len != cryptRsaKeyLenByType(pubKey->rawKeyType) || rsa->len != pubKey->rawKeyLen || rsa->len != mbedtls_mpi_size(&rsa->N) ||
+-		mbedtls_rsa_check_pubkey((mbedtls_rsa_context*) pubKey->backendKey)) {
++	if (   !len
++	    || (int) len != cryptRsaKeyLenByType(pubKey->rawKeyType)
++		|| len != pubKey->rawKeyLen
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++		|| len != mbedtls_mpi_size(&rsa->N)
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++#endif
++		|| mbedtls_rsa_check_pubkey((mbedtls_rsa_context*) pubKey->backendKey)) {
+ 
+ 		return FAILURE;
+ 	}
+@@ -462,10 +506,18 @@ CRYPTRSA_T *cryptRsaKeyFromDer(char *keyPath)
+ 
+ 	mbedtls_pk_context pk;
+ 	mbedtls_pk_init(&pk);
+-	mbedtls_rsa_init(rsa, MBEDTLS_RSA_PKCS_V15, 0);
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++	mbedtls_rsa_init(rsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	mbedtls_rsa_init(rsa);
++#endif
+ 
+ 	if (
+-		((ret = mbedtls_pk_parse_keyfile(&pk, keyPath, "")) != 0) ||
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++			((ret = mbedtls_pk_parse_keyfile(&pk, keyPath, "")) != 0) ||
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++			((ret = mbedtls_pk_parse_keyfile(&pk, keyPath, "", mbedtls_ctr_drbg_random, &ctr_drbg)) != 0) ||
++#endif
+ 		((ret = mbedtls_rsa_copy(rsa, mbedtls_pk_rsa(pk))) != 0) ||
+ 		((ret = mbedtls_rsa_check_privkey(rsa)) != 0)
+ 		) {
+@@ -478,9 +530,8 @@ CRYPTRSA_T *cryptRsaKeyFromDer(char *keyPath)
+ 
+ 
+ 	//cryptKeyAddRaw(ckey);
+-
+ 	if (
+-		((keyLen = mbedtls_mpi_size(&rsa->N)) <= 0) ||
++		((keyLen = mbedtls_rsa_get_len(rsa)) <= 0) ||
+ 		!(keyType = cryptRsaKeyTypeByLen(keyLen)) ||
+ 		!(privKey->rawKeyType = keyType) ||
+ 		!(privKey->rawKeyLen = keyLen) ||
+@@ -490,6 +541,10 @@ CRYPTRSA_T *cryptRsaKeyFromDer(char *keyPath)
+ 		cryptRsaKeyFree(&privKey);
+ 		return NULL;
+ 	}
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++	assertion(-502723, (((int)mbedtls_mpi_size(&rsa->N)) == keyLen));
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++#endif
+ 
+ 	my_PrivKey = privKey;
+ 	return pubKey;
+@@ -565,7 +620,12 @@ CRYPTRSA_T *cryptRsaKeyMake(uint8_t keyType)
+ 	CRYPTRSA_T *key = debugMallocReset(sizeof(CRYPTRSA_T), -300642);
+ 
+ 	mbedtls_rsa_context *rsa = debugMallocReset(sizeof(mbedtls_rsa_context), -300643);
+-	mbedtls_rsa_init(rsa, MBEDTLS_RSA_PKCS_V15, 0);
++
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++	mbedtls_rsa_init(rsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	mbedtls_rsa_init(rsa);
++#endif
+ 
+ 	if ((ret = mbedtls_rsa_gen_key(rsa, mbedtls_ctr_drbg_random, &ctr_drbg, (keyLen * 8), CRYPT_KEY_E_VAL)))
+ 		goto_error(finish, "Failed making rsa key!");
+@@ -591,30 +651,37 @@ CRYPTRSA_T *cryptRsaKeyMake(uint8_t keyType)
+ 
+ int cryptRsaEncrypt(uint8_t *in, size_t inLen, uint8_t *out, size_t *outLen, CRYPTRSA_T *pubKey)
+ {
+-
+ 	mbedtls_rsa_context *pk = pubKey->backendKey;
+-
+-	assertion(-502723, (mbedtls_mpi_size(&pk->N) == pubKey->rawKeyLen));
+ 	assertion(-502145, (*outLen >= pubKey->rawKeyLen));
++	assertion(-502723, (mbedtls_rsa_get_len(pk) == pubKey->rawKeyLen));
+ 
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	if (mbedtls_rsa_pkcs1_encrypt(pk, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PUBLIC, inLen, in, out))
+ 		return FAILURE;
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	if (mbedtls_rsa_pkcs1_encrypt(pk, mbedtls_ctr_drbg_random, &ctr_drbg, inLen, in, out))
++		return FAILURE;
++#endif
+ 
+ 	*outLen = pubKey->rawKeyLen;
+ 
+ 	return SUCCESS;
+-
+ }
+ 
+ int cryptRsaDecrypt(uint8_t *in, size_t inLen, uint8_t *out, size_t *outLen)
+ {
+-
+ 	mbedtls_rsa_context *pk = my_PrivKey->backendKey;
++	assertion(-502146, (inLen >= my_PrivKey->rawKeyLen));
++	assertion(-502724, (mbedtls_rsa_get_len(pk) == my_PrivKey->rawKeyLen));
+ 
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	assertion(-502724, (mbedtls_mpi_size(&pk->N) == my_PrivKey->rawKeyLen));
+-	assertion(-502146, (inLen >= my_PrivKey->rawKeyLen));
+ 	if (mbedtls_rsa_pkcs1_decrypt(pk, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE, &inLen, in, out, *outLen))
+ 		return FAILURE;
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	if (mbedtls_rsa_pkcs1_decrypt(pk, mbedtls_ctr_drbg_random, &ctr_drbg, &inLen, in, out, *outLen))
++		return FAILURE;
++#endif
+ 	*outLen = inLen;
+ 
+ 	return SUCCESS;
+@@ -631,8 +698,13 @@ int cryptRsaSign(CRYPTSHA_T *inSha, uint8_t *out, size_t outLen, CRYPTRSA_T *cry
+ 	if (outLen < cryptKey->rawKeyLen)
+ 		return FAILURE;
+ 
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	if (mbedtls_rsa_pkcs1_sign(pk, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE, MBEDTLS_MD_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) inSha, out))
+ 		return FAILURE;
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	if (mbedtls_rsa_pkcs1_sign(pk, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_MD_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) inSha, out))
++		return FAILURE;
++#endif
+ 
+ 	return SUCCESS;
+ }
+@@ -643,9 +715,26 @@ int cryptRsaVerify(uint8_t *sign, size_t signLen, CRYPTSHA_T *plainSha, CRYPTRSA
+ 	mbedtls_rsa_context *pk = pubKey->backendKey;
+ 
+ 	assertion(-502147, (signLen == pubKey->rawKeyLen));
++/*
++    mbedtls_rsa_context rsa;
++    mbedtls_mpi N, E;
++    mbedtls_rsa_init(&rsa);
++    mbedtls_mpi_init(&N);
++    mbedtls_mpi_init(&E);
++
++    if ((ret = mbedtls_mpi_read_file(&N, 16, f)) != 0 ||
++        (ret = mbedtls_mpi_read_file(&E, 16, f)) != 0 ||
++        (ret = mbedtls_rsa_import(&rsa, &N, NULL, NULL, NULL, &E) != 0))
++    	return FAILURE;
++*/
+ 
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	if (mbedtls_rsa_pkcs1_verify(pk, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PUBLIC, MBEDTLS_MD_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) plainSha, sign))
+ 		return FAILURE;
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	if (mbedtls_rsa_pkcs1_verify(pk, MBEDTLS_MD_SHA224, sizeof(CRYPTSHA_T), (uint8_t*) plainSha, sign))
++		return FAILURE;
++#endif
+ 
+ 	return SUCCESS;
+ }
+@@ -776,7 +865,7 @@ void cryptShaFinal(CRYPTSHA_T *sha)
+ #if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	mbedtls_sha256_finish_ret(&sha_ctx, output);
+ #else
+-	mbedtls_sha256_finish(&sha_ctx, output;)
++	mbedtls_sha256_finish(&sha_ctx, output);
+ #endif
+ 	memcpy(sha, output, sizeof(CRYPTSHA_T));
+ 	memset(output, 0, sizeof(output));
+diff --git a/src/crypt.h b/src/crypt.h
+index da34d4e..119c788 100644
+--- a/src/crypt.h
++++ b/src/crypt.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2010  Axel Neumann
++ * Copyright (c) 2024  Axel Neumann
+  * This program is free software; you can redistribute it and/or
+  * modify it under the terms of version 2 of the GNU General Public
+  * License as published by the Free Software Foundation.
+@@ -30,6 +30,7 @@
+ 
+ #ifndef CRYPTLIB
+ #define CRYPTLIB MBEDTLS_2_8_0
++//#define CRYPTLIB MBEDTLS_3_6_0
+ #endif
+ 
+ #define CRYPT_DER_BUF_SZ 16000
diff --git a/package/bmx7/0006-support-mbedtls-3-6-0-also-disable-no-further-supported.patch b/package/bmx7/0006-support-mbedtls-3-6-0-also-disable-no-further-supported.patch
new file mode 100644
index 0000000000..6fb67096f1
--- /dev/null
+++ b/package/bmx7/0006-support-mbedtls-3-6-0-also-disable-no-further-supported.patch
@@ -0,0 +1,396 @@
+From fb45b7d30899ee295a0580cdab6710b510150f73 Mon Sep 17 00:00:00 2001
+From: Axel Neumann <axel@notmail.org>
+Date: Sat, 18 May 2024 14:00:49 +0200
+Subject: [PATCH] Support mbedtls-3.6.0 Also disable no-further-supported
+ RSA896
+
+Upstream: https://github.com/bmx-routing/bmx7/commit/fb45b7d30899ee295a0580cdab6710b510150f73
+[thomas: backport to 7.1.1]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/Common.mk |  2 +-
+ src/crypt.c   | 71 ++++++++++++++++++++++++---------------------------
+ src/crypt.h   |  4 +--
+ src/msg.c     |  6 ++---
+ src/sec.c     | 28 ++++++++++++--------
+ src/sec.h     | 18 ++++++-------
+ 6 files changed, 67 insertions(+), 62 deletions(-)
+
+diff --git a/src/Common.mk b/src/Common.mk
+index 32b2d34..c73df44 100644
+--- a/src/Common.mk
++++ b/src/Common.mk
+@@ -2,7 +2,7 @@ GIT_REV ?= $(shell [ -r .git ] && git --no-pager log -n 1 --oneline | cut -d " "
+
+ CFLAGS += -pedantic -W -Wall -Wstrict-prototypes -Wno-unused-parameter -Os -g3 -std=gnu99 -DGIT_REV=\"$(GIT_REV)\"
+ # CFLAGS += -DHAVE_CONFIG_H
+-# CFLAGS += -DCRYPTLIB=MBEDTLS_2_4_0 # POLARSSL_1_2_5 POLARSSL_1_2_9 POLARSSL_1_3_3 POLARSSL_1_3_4 CYASSL_2_8_0
++# CFLAGS += -DCRYPTLIB=MBEDTLS_2_8_0 # -DCRYPTLIB=MBEDTLS_3_6_0
+
+ # optional defines:
+ # CFLAGS += -static
+diff --git a/src/crypt.c b/src/crypt.c
+index 91543ef..69918a1 100644
+--- a/src/crypt.c
++++ b/src/crypt.c
+@@ -66,18 +66,16 @@ static mbedtls_sha256_context sha_ctx;
+
+ uint8_t cryptDhmKeyTypeByLen(int len)
+ {
+-	return len == CRYPT_DHM1024_LEN ? CRYPT_DHM1024_TYPE : (
+-		len == CRYPT_DHM2048_LEN ? CRYPT_DHM2048_TYPE : (
++	return len == CRYPT_DHM2048_LEN ? CRYPT_DHM2048_TYPE : (
+ 		len == CRYPT_DHM3072_LEN ? CRYPT_DHM3072_TYPE : (
+-		0)));
++		0));
+ }
+
+ uint16_t cryptDhmKeyLenByType(int type)
+ {
+-	return type == CRYPT_DHM1024_TYPE ? CRYPT_DHM1024_LEN : (
+-		type == CRYPT_DHM2048_TYPE ? CRYPT_DHM2048_LEN : (
++	return type == CRYPT_DHM2048_TYPE ? CRYPT_DHM2048_LEN : (
+ 		type == CRYPT_DHM3072_TYPE ? CRYPT_DHM3072_LEN : (
+-		0)));
++		0));
+ }
+
+ char *cryptDhmKeyTypeAsString(int type)
+@@ -104,6 +102,7 @@ void cryptDhmKeyFree(CRYPTDHM_T **cryptKey)
+ 	*cryptKey = NULL;
+ }
+
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ /*
+  * Verify sanity of parameter with regards to P
+  *
+@@ -134,10 +133,10 @@ static int _cryptDhmCheckRange(const mbedtls_mpi *param, const mbedtls_mpi *P)
+ 	mbedtls_mpi_free(&U);
+ 	return( ret);
+ }
++#endif
+
+ CRYPTDHM_T *cryptDhmKeyMake(uint8_t keyType, uint8_t attempt)
+ {
+-
+ 	int ret = 0;
+ 	char *goto_error_code = NULL;
+ 	int keyLen = 0;
+@@ -184,11 +183,6 @@ CRYPTDHM_T *cryptDhmKeyMake(uint8_t keyType, uint8_t attempt)
+ 	if ((pSize = mbedtls_mpi_size(&dhm_P)) != keyLen)
+ 		goto_error(finish, "Invalid P size");
+
+-#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+-#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
+-	if ((pSize = mbedtls_dhm_get_len(dhm)) != keyLen)
+-		goto_error(finish, "Invalid P size");
+-#endif
+
+ 	if ((ret = mbedtls_dhm_set_group(dhm, &dhm_P, &dhm_G) != 0))
+ 		goto_error(finish, "Failed grouping dhm parameters!");
+@@ -197,19 +191,25 @@ CRYPTDHM_T *cryptDhmKeyMake(uint8_t keyType, uint8_t attempt)
+                                        mbedtls_ctr_drbg_random, &ctr_drbg)) != 0)
+ 		goto_error(finish, "Failed creating dhm key pair");
+
++#if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
++#elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
++	if ((pSize = mbedtls_dhm_get_len(dhm)) != keyLen)
++		goto_error(finish, "Invalid dhm len");
++#endif
++
+ 	key->rawGXType = keyType;
+ 	key->rawGXLen = keyLen;
+
+ finish:
+ 	dbgf(goto_error_code ? DBGL_SYS : DBGL_CHANGES, goto_error_code ? DBGT_ERR : DBGT_INFO,
+ 		"%s ret=%d keyType=%d keyLen=%d pSize=%d attempt=%d",
+-		goto_error_code, ret, keyType, keyLen, pSize, attempt);
++		goto_error_code?goto_error_code:"SUCCESS", ret, keyType, keyLen, pSize, attempt);
+
+ 	if (goto_error_code) {
+ 		cryptDhmKeyFree(&key);
+
+-		if ((++attempt) < 10)
+-			return cryptDhmKeyMake(keyType, attempt);
++//		if ((++attempt) < 10)
++//			return cryptDhmKeyMake(keyType, attempt);
+
+ 		assertion(-502718, (0));
+ 		return NULL;
+@@ -230,13 +230,19 @@ void cryptDhmPubKeyGetRaw(CRYPTDHM_T* key, uint8_t* buff, uint16_t buffLen)
+ #if (CRYPTLIB >= MBEDTLS_2_8_0 && CRYPTLIB < MBEDTLS_3_0_0)
+ 	assertion_dbg(-502720, (dhm && buffLen == mbedtls_mpi_size(&dhm->GX) && buffLen == dhm->len),
+ 		"Failed: dhm.GXlen=%zd dhm.len=%zd", dhm ? mbedtls_mpi_size(&dhm->GX) : 0, dhm ? dhm->len : 0);
++
++	mbedtls_mpi_write_binary(&dhm->GX, buff, key->rawGXLen);
++
+ #elif (CRYPTLIB >= MBEDTLS_3_0_0 && CRYPTLIB < MBEDTLS_MAX)
+ 	assertion_dbg(-502720, (dhm && buffLen == mbedtls_dhm_get_len(dhm)),
+ 		"Failed: dhm.len=%zd", dhm ? mbedtls_dhm_get_len(dhm) : 0);
+-#endif
+-
+
+-	mbedtls_mpi_write_binary(&dhm->GX, buff, key->rawGXLen);
++	mbedtls_mpi mpi_GX;
++	mbedtls_mpi_init(&mpi_GX);
++	mbedtls_dhm_get_value(dhm, MBEDTLS_DHM_PARAM_GX, &mpi_GX);
++	mbedtls_mpi_write_binary(&mpi_GX, buff, key->rawGXLen);
++	mbedtls_mpi_free(&mpi_GX);
++#endif
+ }
+
+ STATIC_FUNC
+@@ -247,9 +253,6 @@ IDM_T cryptDhmKeyCheck(CRYPTDHM_T *key)
+ 	uint8_t keyType = 0;
+ 	int keyLen = 0;
+ 	int pSize = 0;
+-	int xSize = 0;
+-	int gxSize = 0;
+-	int gySize = 0;
+
+ 	if (!(dhm = (mbedtls_dhm_context *) key->backendKey))
+ 		goto_error(finish, "Missing backend key");
+@@ -262,11 +265,11 @@ IDM_T cryptDhmKeyCheck(CRYPTDHM_T *key)
+ 		goto_error(finish, "Invalid len");
+ 	if ((pSize = mbedtls_mpi_size(&dhm->P)) != keyLen)
+ 		goto_error(finish, "Invalid P size");
+-	if ((xSize = mbedtls_mpi_size(&dhm->X)) != keyLen)
++	if ((pSize = mbedtls_mpi_size(&dhm->X)) != keyLen)
+ 		goto_error(finish, "Invalid X size");
+-	if ((gxSize = mbedtls_mpi_size(&dhm->GX)) != keyLen)
++	if ((pSize = mbedtls_mpi_size(&dhm->GX)) != keyLen)
+ 		goto_error(finish, "Invalid GX size");
+-	if ((gySize = mbedtls_mpi_size(&dhm->GY)) != keyLen)
++	if ((pSize = mbedtls_mpi_size(&dhm->GY)) != keyLen)
+ 		goto_error(finish, "Invalid GY size");
+ 	if (_cryptDhmCheckRange(&dhm->GX, &dhm->P) != SUCCESS)
+ 		goto_error(finish, "Invalid GX range");
+@@ -280,8 +283,7 @@ IDM_T cryptDhmKeyCheck(CRYPTDHM_T *key)
+ 	return SUCCESS;
+
+ finish:
+-	dbgf_track(DBGT_WARN, "%s keyType=%d keyLen=%d dhmLen=%zd pSize=%d xSize=%d gxSize=%d gySize=%d",
+-		goto_error_code, keyType, keyLen, dhm ? dhm->len : 0, pSize, xSize, gxSize, gySize);
++	dbgf_track(DBGT_WARN, "%s keyType=%d keyLen=%d dhmLen=%zd", goto_error_code, keyType, keyLen, pSize);
+
+ 	return FAILURE;
+ }
+@@ -641,7 +643,8 @@ finish:
+
+ 			cryptRsaKeyFree(&key);
+
+-			dbgf_sys(DBGT_ERR, "%s ret=%d", goto_error_code, ret);
++			dbgf_sys(DBGT_ERR, "%s ret=%d len=%d", goto_error_code, ret, keyLen);
++			assertion(-500000, 0);
+ 			return NULL;
+ 		}
+
+@@ -923,28 +926,22 @@ int cryptShasEqual(CRYPTSHA_T *shaA, CRYPTSHA_T *shaB)
+
+ uint8_t cryptRsaKeyTypeByLen(int len)
+ {
+-	return len == CRYPT_RSA512_LEN ? CRYPT_RSA512_TYPE : (
+-		len == CRYPT_RSA768_LEN ? CRYPT_RSA768_TYPE : (
+-		len == CRYPT_RSA896_LEN ? CRYPT_RSA896_TYPE : (
+-		len == CRYPT_RSA1024_LEN ? CRYPT_RSA1024_TYPE : (
++	return len == CRYPT_RSA1024_LEN ? CRYPT_RSA1024_TYPE : (
+ 		len == CRYPT_RSA1536_LEN ? CRYPT_RSA1536_TYPE : (
+ 		len == CRYPT_RSA2048_LEN ? CRYPT_RSA2048_TYPE : (
+ 		len == CRYPT_RSA3072_LEN ? CRYPT_RSA3072_TYPE : (
+ 		len == CRYPT_RSA4096_LEN ? CRYPT_RSA4096_TYPE : (
+-		0))))))));
++		0)))));
+ }
+
+ uint16_t cryptRsaKeyLenByType(int type)
+ {
+-	return type == CRYPT_RSA512_TYPE ? CRYPT_RSA512_LEN : (
+-		type == CRYPT_RSA768_TYPE ? CRYPT_RSA768_LEN : (
+-		type == CRYPT_RSA896_TYPE ? CRYPT_RSA896_LEN : (
+-		type == CRYPT_RSA1024_TYPE ? CRYPT_RSA1024_LEN : (
++	return 	type == CRYPT_RSA1024_TYPE ? CRYPT_RSA1024_LEN : (
+ 		type == CRYPT_RSA1536_TYPE ? CRYPT_RSA1536_LEN : (
+ 		type == CRYPT_RSA2048_TYPE ? CRYPT_RSA2048_LEN : (
+ 		type == CRYPT_RSA3072_TYPE ? CRYPT_RSA3072_LEN : (
+ 		type == CRYPT_RSA4096_TYPE ? CRYPT_RSA4096_LEN : (
+-		0))))))));
++		0)))));
+ }
+
+ char *cryptRsaKeyTypeAsString(int type)
+diff --git a/src/crypt.h b/src/crypt.h
+index 119c788..cae8df7 100644
+--- a/src/crypt.h
++++ b/src/crypt.h
+@@ -63,7 +63,7 @@
+ #define CRYPT_RSA4096_LEN  (4096/8) //512
+ #define CRYPT_RSA4096_NAME "RSA4096"
+
+-#define CRYPT_RSA_MIN_TYPE CRYPT_RSA512_TYPE
++#define CRYPT_RSA_MIN_TYPE CRYPT_RSA1024_TYPE
+ #define CRYPT_RSA_MAX_TYPE 8
+ #define CRYPT_RSA_MAX_LEN  512
+
+@@ -77,7 +77,7 @@
+ #define CRYPT_DHM3072_LEN  (3072/8)
+ #define CRYPT_DHM3072_NAME "DH3072M112"
+
+-#define CRYPT_DHM_MIN_TYPE CRYPT_DHM1024_TYPE
++#define CRYPT_DHM_MIN_TYPE CRYPT_DHM2048_TYPE
+ #define CRYPT_DHM_MAX_TYPE CRYPT_DHM3072_TYPE
+ #define CRYPT_DHM_MAX_LEN CRYPT_DHM3072_LEN
+
+diff --git a/src/msg.c b/src/msg.c
+index e04358c..22c22da 100644
+--- a/src/msg.c
++++ b/src/msg.c
+@@ -924,9 +924,9 @@ void tx_packets(void *unused)
+ 			assertion(-502442, (it.frame_type < FRAME_TYPE_SIGNATURE_ADV || it.frame_type > FRAME_TYPE_OGM_AGG_SQN_ADV));
+ 			assertion(-502443, (!it.frame_cache_msgs_size));
+ 			assertion(-500430, (it.frames_out_pos)); // single message larger than MAX_UDPD_SIZE
+-			assertion_dbg(-502444, IMPLIES((it.frame_type > FRAME_TYPE_OGM_AGG_SQN_ADV),
+-				it.frames_out_pos > (int) (FRM_SIGN_VERS_SIZE_MIN + ((my_RsaLinkKey && !my_DhmLinkKey) ? my_RsaLinkKey->rawKeyLen : 0))),
+-				"%d %d %lu %d+%d", it.frame_type, it.frames_out_pos, FRM_SIGN_VERS_SIZE_MIN, !!my_DhmLinkKey, (my_RsaLinkKey ? my_RsaLinkKey->rawKeyLen : 0));
++//			assertion_dbg(-502444, IMPLIES((it.frame_type > FRAME_TYPE_OGM_AGG_SQN_ADV),
++//				it.frames_out_pos > (int) (FRM_SIGN_VERS_SIZE_MIN + ((my_RsaLinkKey && !my_DhmLinkKey) ? my_RsaLinkKey->rawKeyLen : 0))),
++//				"%d %d %lu %d+%d", it.frame_type, it.frames_out_pos, FRM_SIGN_VERS_SIZE_MIN, !!my_DhmLinkKey, (my_RsaLinkKey ? my_RsaLinkKey->rawKeyLen : 0));
+ 		}
+
+ 		assertion_dbg(-502519, (++cnt) < 10000, "cnt=%d result=%d nextFType=%d fType=%d fLen=%d fPos=%d fPosMax=%d",
+diff --git a/src/sec.c b/src/sec.c
+index bbd65cf..cde3813 100644
+--- a/src/sec.c
++++ b/src/sec.c
+@@ -862,6 +862,8 @@ void createMyDhmLinkKey(IDM_T randomLifetime)
+
+ 	my_DhmLinkKey = cryptDhmKeyMake(linkDhmSignType, 0);
+
++	assertion(-500000, my_DhmLinkKey);
++
+ 	my_DhmLinkKey->endOfLife = (linkSignLifetime ? bmx_time_sec + thisSignLifetime : 0);
+
+ 	if (linkSignLifetime)
+@@ -913,7 +915,7 @@ int process_dsc_tlv_dhmLinkKey(struct rx_frame_iterator *it)
+ 	char *goto_error_code = NULL;
+ 	int32_t msgLen = it->f_dlen;
+ 	struct dsc_msg_dhm_link_key *msg = (struct dsc_msg_dhm_link_key*) (it->f_data);
+-
++	IDM_T TODO_Tolerate_unknown_dhm_link_keys_like_process_dsc_tlv_rsaPubKey;
+ 	if (it->op == TLV_OP_TEST) {
+
+ 		if (!msg)
+@@ -1017,7 +1019,7 @@ int create_dsc_tlv_rsaLinkKey(struct tx_frame_iterator *it)
+ }
+
+ STATIC_FUNC
+-int process_dsc_tlv_pubKey(struct rx_frame_iterator *it)
++int process_dsc_tlv_rsaPubKey(struct rx_frame_iterator *it)
+ {
+ 	char *goto_error_code = NULL;
+ 	CRYPTRSA_T *pkey = NULL;
+@@ -1026,14 +1028,20 @@ int process_dsc_tlv_pubKey(struct rx_frame_iterator *it)
+
+ 	if (it->op == TLV_OP_TEST) {
+
+-		if (!msg || !cryptRsaKeyTypeAsString(msg->type) || cryptRsaKeyLenByType(msg->type) != key_len)
++		if (!msg)
+ 			goto_error(finish, "1");
+
+-		if (!(pkey = cryptRsaPubKeyFromRaw(msg->key, key_len)))
+-			goto_error(finish, "2");
++		if (cryptRsaKeyLenByType(msg->type))
++		{
++			if (!cryptRsaKeyTypeAsString(msg->type) || cryptRsaKeyLenByType(msg->type) != key_len)
++				goto_error(finish, "2");
++
++			if (!(pkey = cryptRsaPubKeyFromRaw(msg->key, key_len)))
++				goto_error(finish, "3");
+
+-		if (cryptRsaPubKeyCheck(pkey) != SUCCESS)
+-			goto_error(finish, "3");
++			if (cryptRsaPubKeyCheck(pkey) != SUCCESS)
++				goto_error(finish, "4");
++		}
+
+ 	} else if (it->op == TLV_OP_DEL && it->f_type == BMX_DSC_TLV_RSA_LINK_PUBKEY && it->on->neigh) {
+
+@@ -1045,7 +1053,7 @@ int process_dsc_tlv_pubKey(struct rx_frame_iterator *it)
+ 		if (it->on->neigh->rsaLinkKey)
+ 			cryptRsaKeyFree(&it->on->neigh->rsaLinkKey);
+
+-		if (msg) {
++		if (msg  && cryptRsaKeyLenByType(msg->type)) {
+ 			it->on->neigh->rsaLinkKey = cryptRsaPubKeyFromRaw(msg->key, cryptRsaKeyLenByType(msg->type));
+ 			assertion(-502206, (it->on->neigh->rsaLinkKey && cryptRsaPubKeyCheck(it->on->neigh->rsaLinkKey) == SUCCESS));
+ 		}
+@@ -2398,7 +2406,7 @@ void init_sec(void)
+ 	handl.dextReferencing = (int32_t*) & fref_always_l1;
+ 	handl.dextCompression = (int32_t*) & never_fzip;
+ 	handl.tx_frame_handler = create_dsc_tlv_nodeKey;
+-	handl.rx_frame_handler = process_dsc_tlv_pubKey;
++	handl.rx_frame_handler = process_dsc_tlv_rsaPubKey;
+ 	handl.msg_format = pubkey_format;
+ 	register_frame_handler(description_tlv_db, BMX_DSC_TLV_NODE_PUBKEY, &handl);
+
+@@ -2427,7 +2435,7 @@ void init_sec(void)
+ 	handl.dextReferencing = (int32_t*) & fref_always_l1;
+ 	handl.dextCompression = (int32_t*) & never_fzip;
+ 	handl.tx_frame_handler = create_dsc_tlv_rsaLinkKey;
+-	handl.rx_frame_handler = process_dsc_tlv_pubKey;
++	handl.rx_frame_handler = process_dsc_tlv_rsaPubKey;
+ 	handl.msg_format = pubkey_format;
+ 	register_frame_handler(description_tlv_db, BMX_DSC_TLV_RSA_LINK_PUBKEY, &handl);
+
+diff --git a/src/sec.h b/src/sec.h
+index 2266a29..5619a37 100644
+--- a/src/sec.h
++++ b/src/sec.h
+@@ -70,28 +70,28 @@
+
+
+ #define ARG_NODE_RSA_TX_TYPE "nodeRsaKey"
+-#define MIN_NODE_RSA_TX_TYPE CRYPT_RSA512_TYPE
++#define MIN_NODE_RSA_TX_TYPE CRYPT_RSA_MIN_TYPE
+ #define MAX_NODE_RSA_TX_TYPE CRYPT_RSA4096_TYPE
+ #define DEF_NODE_RSA_TX_TYPE CRYPT_RSA2048_TYPE
+-#define HLP_NODE_RSA_TX_TYPE "sign own descriptions with given RSA key type (1:512, 2:768, 3:896, 4:1024, 5:1536, 6:2048, 7:3072, 8:4096)"
++#define HLP_NODE_RSA_TX_TYPE "sign own descriptions with given RSA key type (4:1024, 5:1536, 6:2048, 7:3072, 8:4096)"
+
+ #define ARG_NODE_RSA_RX_TYPES "nodeRsaKeys"
+-#define MIN_NODE_RSA_RX_TYPES (1<<CRYPT_RSA512_TYPE)
++#define MIN_NODE_RSA_RX_TYPES (1<<CRYPT_RSA_MIN_TYPE)
+ #define MAX_NODE_RSA_RX_TYPES ((1<<CRYPT_RSA_MAX_TYPE)-1)
+-#define DEF_NODE_RSA_RX_TYPES ((1<<CRYPT_RSA512_TYPE) | (1<<CRYPT_RSA768_TYPE) | (1<<CRYPT_RSA896_TYPE) | (1<<CRYPT_RSA1024_TYPE) | (1<<CRYPT_RSA1536_TYPE) | (1<<CRYPT_RSA2048_TYPE) | (1<<CRYPT_RSA3072_TYPE) | (1<<CRYPT_RSA4096_TYPE))
++#define DEF_NODE_RSA_RX_TYPES ((1<<CRYPT_RSA1024_TYPE) | (1<<CRYPT_RSA1536_TYPE) | (1<<CRYPT_RSA2048_TYPE) | (1<<CRYPT_RSA3072_TYPE) | (1<<CRYPT_RSA4096_TYPE))
+ #define HLP_NODE_RSA_RX_TYPES "verify description signatures of flag-given RSA key types"
+
+ #define ARG_LINK_RSA_TX_TYPE "linkRsaKey"
+ #define MIN_LINK_RSA_TX_TYPE 0
+ #define MAX_LINK_RSA_TX_TYPE CRYPT_RSA2048_TYPE
+-#define DEF_LINK_RSA_TX_TYPE CRYPT_RSA896_TYPE
+-#define HLP_LINK_RSA_TX_TYPE "sign outgoing packets with given RSA key type (0:None and rely on DHM, 1:512, 2:768, 3:896, 4:1024, 5:1536, 6:2048)"
++#define DEF_LINK_RSA_TX_TYPE CRYPT_RSA1024_TYPE
++#define HLP_LINK_RSA_TX_TYPE "sign outgoing packets with given RSA key type (0:None and rely on DHM, 4:1024, 5:1536, 6:2048)"
+ extern int32_t linkRsaSignType;
+
+ #define ARG_LINK_RSA_RX_TYPES "linkRsaKeys"
+ #define MIN_LINK_RSA_RX_TYPES 0
+ #define MAX_LINK_RSA_RX_TYPES ((1<<CRYPT_RSA_MAX_TYPE)-1)
+-#define DEF_LINK_RSA_RX_TYPES ((1<<CRYPT_RSA512_TYPE) | (1<<CRYPT_RSA768_TYPE) | (1<<CRYPT_RSA896_TYPE) | (1<<CRYPT_RSA1024_TYPE) | (1<<CRYPT_RSA1536_TYPE) | (1<<CRYPT_RSA2048_TYPE))
++#define DEF_LINK_RSA_RX_TYPES ((1<<CRYPT_RSA1024_TYPE) | (1<<CRYPT_RSA1536_TYPE) | (1<<CRYPT_RSA2048_TYPE))
+ #define HLP_LINK_RSA_RX_TYPES "verify incoming link (packet) signaturs of flag-given RSA key types"
+
+ #define ARG_LINK_DHM_TX_TYPE "linkDhmKey"
+@@ -166,8 +166,8 @@ extern int32_t maxDhmNeighs;
+
+
+ extern CRYPTRSA_T *my_NodeKey;
+-extern CRYPTRSA_T *my_RsaLinkKey;
+-extern CRYPTDHM_T *my_DhmLinkKey;
++//extern CRYPTRSA_T *my_RsaLinkKey;
++//extern CRYPTDHM_T *my_DhmLinkKey;
+
+ typedef struct {
+ 	uint8_t u8[sizeof(CRYPTSHA112_T)];
+--
+2.50.0
diff --git a/package/bmx7/0007-detect-mbedtls-2-8-0-or-mbedtls-3-6-0-based-on-mbedtls-version-h.patch b/package/bmx7/0007-detect-mbedtls-2-8-0-or-mbedtls-3-6-0-based-on-mbedtls-version-h.patch
new file mode 100644
index 0000000000..ed9a0354e4
--- /dev/null
+++ b/package/bmx7/0007-detect-mbedtls-2-8-0-or-mbedtls-3-6-0-based-on-mbedtls-version-h.patch
@@ -0,0 +1,32 @@
+From 9020896f89006bc5d3487222eefc7ddea9e8b2bd Mon Sep 17 00:00:00 2001
+From: Axel Neumann <axel@notmail.org>
+Date: Sun, 19 May 2024 07:53:57 +0200
+Subject: [PATCH] Detect mbedtls-2.8.0 or mbedtls-3.6.0 based on
+ mbedtls/version.h
+
+Upstream: https://github.com/bmx-routing/bmx7/commit/9020896f89006bc5d3487222eefc7ddea9e8b2bd
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/crypt.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/crypt.h b/src/crypt.h
+index cae8df7..2dff0da 100644
+--- a/src/crypt.h
++++ b/src/crypt.h
+@@ -28,9 +28,13 @@
+ #define MBEDTLS_3_6_0  2360
+ #define MBEDTLS_MAX    2999
+ 
+-#ifndef CRYPTLIB
++#include "mbedtls/version.h"
++#ifndef MBEDTLS_VERSION_NUMBER
+ #define CRYPTLIB MBEDTLS_2_8_0
+-//#define CRYPTLIB MBEDTLS_3_6_0
++#elif (MBEDTLS_VERSION_NUMBER >= 0x01000000 && MBEDTLS_VERSION_NUMBER < 0x03000000)
++#define CRYPTLIB MBEDTLS_2_8_0
++#elif (MBEDTLS_VERSION_NUMBER >= 0x03000000)
++#define CRYPTLIB MBEDTLS_3_6_0
+ #endif
+ 
+ #define CRYPT_DER_BUF_SZ 16000
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
