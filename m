Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B35C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 10:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7BED40BA0;
	Mon, 27 Jun 2022 10:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7BED40BA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pzaK5swk8YDf; Mon, 27 Jun 2022 10:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9E71409DE;
	Mon, 27 Jun 2022 10:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9E71409DE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD2C1BF354
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 10:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA9DF60D4C
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 10:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA9DF60D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVN2NGc_pMWT for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 10:30:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A02CA60BD2
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A02CA60BD2
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 10:30:41 +0000 (UTC)
Received: from 91-153-34-62.elisa-laajakaista.fi ([91.153.34.62] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1o5m0s-00BKbG-2R; Mon, 27 Jun 2022 12:30:38 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 03a528a5;
 Mon, 27 Jun 2022 10:30:26 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 13:30:26 +0300
Message-Id: <20220627103026.3300987-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gdVfc8Q6FemjlpvNOKzo1s3+t0X6D1Imv3VGpvvKDz8=; b=axqpDEcIj8SxiCqm5HjxXAjHKS
 IY+SRHcDosRhcWZWQZPadVUdC/5rmj69r0cQBZqMhlcTvma9nWsM7NyxmtLCEWdGN1yFz2VCIq1YJ
 c6Rf0/qWZ9MwlSAnG3VItNmDKnFzP5EMUUBLfi7uFirTnBHdBCsAE+EA3z1TS+3/TDO0/J3B6ot1E
 aFB4Wg/0oSPoy6188m84w6MWp7pP8v3MeW9++OKUeCTIqSWtjAY0Bah0skInKg+F4We69SLEeSVLk
 dq72tF9MDtoGojQlxwgTLowP5GcnGmfkRD2kLECbgnTgeWnu8NB+yUTC7swC+ffxN1Uhov0Xfno9f
 w2rc9+Bw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=axqpDEcI
Subject: [Buildroot] [PATCH 1/1] package/freerdp: fix build with libressl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Import a patch for fixing the build with libressl 2.7.0 or newer,
which has also been submitted upstream.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...uilding-with-LibreSSL-2.7.0-or-newer.patch | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch

diff --git a/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch b/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch
new file mode 100644
index 0000000000..eb6a7da7f6
--- /dev/null
+++ b/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch
@@ -0,0 +1,126 @@
+From 55a5a0a14ecef81c8ece1fea4a5a6004aebfeaff Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Mon, 27 Jun 2022 11:45:44 +0200
+Subject: [PATCH] Fix building with LibreSSL 2.7.0 or newer
+
+With LibreSSL 2.7.0 (or newer versions) some more structs have made
+opaque, which requires a few changes:
+
+- BIO_meth_new() and related functions are now defined by LibreSSL, the
+  versions from opensslcompat.{h,c} does not need to be used anymore.
+- HMAC_CTX is now opaque, HMAC_CTX_new(), EVP_MD_CTX_new, and related
+  functions should be used instead in winpr's hash.c.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstream status: https://github.com/FreeRDP/FreeRDP/pull/7999]
+---
+ libfreerdp/crypto/opensslcompat.c |  3 ++-
+ libfreerdp/crypto/opensslcompat.h |  3 ++-
+ winpr/libwinpr/crypto/hash.c      | 21 ++++++++++++++-------
+ 3 files changed, 18 insertions(+), 9 deletions(-)
+
+diff --git a/libfreerdp/crypto/opensslcompat.c b/libfreerdp/crypto/opensslcompat.c
+index 701902dc2..314d6b51f 100644
+--- a/libfreerdp/crypto/opensslcompat.c
++++ b/libfreerdp/crypto/opensslcompat.c
+@@ -19,7 +19,8 @@
+ 
+ #include "opensslcompat.h"
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
+ 
+ BIO_METHOD* BIO_meth_new(int type, const char* name)
+ {
+diff --git a/libfreerdp/crypto/opensslcompat.h b/libfreerdp/crypto/opensslcompat.h
+index 169e8e4c2..3ad5b6bd4 100644
+--- a/libfreerdp/crypto/opensslcompat.h
++++ b/libfreerdp/crypto/opensslcompat.h
+@@ -30,7 +30,8 @@
+ 
+ #include <openssl/opensslv.h>
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
+ 
+ #include <openssl/bio.h>
+ #include <openssl/rsa.h>
+diff --git a/winpr/libwinpr/crypto/hash.c b/winpr/libwinpr/crypto/hash.c
+index 8265b2e90..5e94039e7 100644
+--- a/winpr/libwinpr/crypto/hash.c
++++ b/winpr/libwinpr/crypto/hash.c
+@@ -151,7 +151,8 @@ WINPR_HMAC_CTX* winpr_HMAC_New(void)
+ 	WINPR_HMAC_CTX* ctx = NULL;
+ #if defined(WITH_OPENSSL)
+ 	HMAC_CTX* hmac = NULL;
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
+ 
+ 	if (!(hmac = (HMAC_CTX*)calloc(1, sizeof(HMAC_CTX))))
+ 		return NULL;
+@@ -185,7 +186,8 @@ BOOL winpr_HMAC_Init(WINPR_HMAC_CTX* ctx, WINPR_MD_TYPE md, const BYTE* key, siz
+ 	if (!evp || !hmac)
+ 		return FALSE;
+ 
+-#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
+ 	HMAC_Init_ex(hmac, key, keylen, evp, NULL); /* no return value on OpenSSL 0.9.x */
+ 	return TRUE;
+ #else
+@@ -221,7 +223,8 @@ BOOL winpr_HMAC_Update(WINPR_HMAC_CTX* ctx, const BYTE* input, size_t ilen)
+ {
+ #if defined(WITH_OPENSSL)
+ 	HMAC_CTX* hmac = (HMAC_CTX*)ctx;
+-#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
+ 	HMAC_Update(hmac, input, ilen); /* no return value on OpenSSL 0.9.x */
+ 	return TRUE;
+ #else
+@@ -253,7 +256,8 @@ BOOL winpr_HMAC_Final(WINPR_HMAC_CTX* ctx, BYTE* output, size_t olen)
+ 
+ #if defined(WITH_OPENSSL)
+ 	hmac = (HMAC_CTX*)ctx;
+-#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
+ 	HMAC_Final(hmac, output, NULL); /* no return value on OpenSSL 0.9.x */
+ 	return TRUE;
+ #else
+@@ -279,7 +283,8 @@ void winpr_HMAC_Free(WINPR_HMAC_CTX* ctx)
+ 
+ 	if (hmac)
+ 	{
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
+ 		HMAC_CTX_cleanup(hmac);
+ 		free(hmac);
+ #else
+@@ -332,7 +337,8 @@ WINPR_DIGEST_CTX* winpr_Digest_New(void)
+ 	WINPR_DIGEST_CTX* ctx = NULL;
+ #if defined(WITH_OPENSSL)
+ 	EVP_MD_CTX* mdctx;
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
+ 	mdctx = EVP_MD_CTX_create();
+ #else
+ 	mdctx = EVP_MD_CTX_new();
+@@ -464,7 +470,8 @@ void winpr_Digest_Free(WINPR_DIGEST_CTX* ctx)
+ 
+ 	if (mdctx)
+ 	{
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
+ 		EVP_MD_CTX_destroy(mdctx);
+ #else
+ 		EVP_MD_CTX_free(mdctx);
+-- 
+2.36.1
+
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
