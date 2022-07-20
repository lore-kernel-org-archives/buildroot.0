Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D05C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C347583F7F;
	Wed, 20 Jul 2022 21:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C347583F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIC-D4y78B8h; Wed, 20 Jul 2022 21:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9294C83F53;
	Wed, 20 Jul 2022 21:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9294C83F53
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 315331BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BCAA83F53
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCAA83F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqNx2vjC1Mcr for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1279E81D5A
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1279E81D5A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3F86184085; Wed, 20 Jul 2022 20:56:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 23:08:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ebd10fd230821fbd7b2805e86a9baf88923ae1e
X-Git-Newrev: ee6ceaf397f5e3a9f0270b687ca31e96234a019e
X-Patchwork-Hint: ignore
Message-Id: <20220720205637.3F86184085@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: fix build with libressl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ee6ceaf397f5e3a9f0270b687ca31e96234a019e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Import a patch for fixing the build with libressl 2.7.0 or newer,
which has also been submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/a924b2a8c690e5afd1b5078236baef3f425aeb96/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-building-with-LibreSSL-2.7.0-or-newer.patch | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch b/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch
new file mode 100644
index 0000000000..3edf1ff3b3
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
+[Upstream status: https://github.com/FreeRDP/FreeRDP/commit/436f212be3950917e4bb209aa5064e423f0dd882]
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
