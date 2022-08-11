Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD471C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 17:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7039F6108A;
	Thu, 11 Aug 2022 17:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7039F6108A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gg_hi7W4mnPh; Thu, 11 Aug 2022 17:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3567C61126;
	Thu, 11 Aug 2022 17:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3567C61126
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8971B1BF35F
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70E8A41299
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70E8A41299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYmjRUQdBJF1 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 17:33:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FB9C410BB
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 17:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB9C410BB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 70F948715F; Thu, 11 Aug 2022 17:19:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 19:27:49 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2daae7260069311b71fb9aad3b4c07d74e0af09b
X-Git-Newrev: 21bc60581559bd74a3e93cf804745fbbb52066fa
X-Patchwork-Hint: ignore
Message-Id: <20220811171916.70F948715F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/freerdp: fix
 build with libressl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21bc60581559bd74a3e93cf804745fbbb52066fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Import a patch for fixing the build with libressl 2.7.0 or newer,
which has also been submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/a924b2a8c690e5afd1b5078236baef3f425aeb96/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee6ceaf397f5e3a9f0270b687ca31e96234a019e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
