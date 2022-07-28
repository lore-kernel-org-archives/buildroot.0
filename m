Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2ECC19F2B
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 14:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB45A60F4E;
	Thu, 28 Jul 2022 14:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB45A60F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zV16t2msrKo7; Thu, 28 Jul 2022 14:42:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C75CF60F45;
	Thu, 28 Jul 2022 14:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C75CF60F45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F9BF1BF3BD
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 14:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 070C782D0C
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 14:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070C782D0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z8yihw4jSGf1 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 14:42:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAA5782CFD
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAA5782CFD
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 14:42:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id a11so1069832wmq.3
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pr1iC5rvaQIMxQ5nAyVpu3wXm/IGfqOOSrbNzOEr1Rk=;
 b=Dfd9TzX5xmaQaAc72Hk4jucNlfRbw3B8COzGYk8WkBp+IYXGIevHeNPlbV/WLNxc2t
 9CJ5stXim9qHp8l+ngK9S+pYJFqCyenzF9vMX+RNUWMbHoY9foIiTxyYxgAHajKNeCF3
 nXNOMQsVWR59czM1bXjbbTufigIuFHKdIpe4JYiut/5BL+1z+tVaDbSvVWhpV0tlvgqL
 tUvI+M6pLecWtT9VkHrZz9EHFLOrJqYNwwTMqahaWACScZ3xPdmBIKBH43PGAGQ2qqAo
 y1Mh2R5RaN2fOpEQr42hVANVc2iVDRrZPrwGDwe1x4p3YShFU+JEka3o09Lmt1ZPW9Hc
 wYaA==
X-Gm-Message-State: AJIora90DAd7GeFmwCHR+SQBgA2wgwjG4Mgk0oJ5qw2491eJFqk+NaTs
 QKZhi+w8yC/Edh/U5U5g6u2qF0lV3+o=
X-Google-Smtp-Source: AGRyM1v43OzZRFq6b5dlsBDMwT7jciI/bqPYN+AvzjchgeiuJ0MculHyne4Ye0TvsVbAP+PFquyJSg==
X-Received: by 2002:a05:600c:224c:b0:3a3:17b7:a229 with SMTP id
 a12-20020a05600c224c00b003a317b7a229mr6986292wmm.1.1659019334583; 
 Thu, 28 Jul 2022 07:42:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a5d4885000000b0021e4edba1e5sm1121394wrq.111.2022.07.28.07.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 07:42:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 16:42:06 +0200
Message-Id: <20220728144206.2786718-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pr1iC5rvaQIMxQ5nAyVpu3wXm/IGfqOOSrbNzOEr1Rk=;
 b=TAq4nvsoxMICo62vxytxFfizolcbmFFO/QxSk54ZhHoT/QGBl+NOWJa4bL4o6eim5e
 qetno8piWnUhtPc1/5KcNqeq+Z6JFaZi0okFVx3Mc5B4DMqfI8b9sT3D1iPr457maHN4
 Ho3GhUuryRuqV0wONu0uTTL/L7tgIS+YKjmELmLT/e8LumisWCd7GISIhrbdTX5OcsrI
 NwBE7zIZQ/LFYEKEsbUX5RJZbSlYEumVmsf8J0Tf//N3AZ1H3tWvdjSVihg6WBJTmCoI
 6ts/f15n+gilqoZRF+CYDNfwPwNvNtJc1PAz193AgkkFE10qjLfSNTfPGs/QLWDEEoXM
 ZmrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TAq4nvso
Subject: [Buildroot] [PATCH 1/1] package/freerdp: bump to version 2.8.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop fourth patch (already in version)

https://github.com/FreeRDP/FreeRDP/releases/tag/2.8.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uilding-with-LibreSSL-2.7.0-or-newer.patch | 126 ------------------
 package/freerdp/freerdp.hash                  |   4 +-
 package/freerdp/freerdp.mk                    |   2 +-
 3 files changed, 3 insertions(+), 129 deletions(-)
 delete mode 100644 package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch

diff --git a/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch b/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch
deleted file mode 100644
index 3edf1ff3b3..0000000000
--- a/package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From 55a5a0a14ecef81c8ece1fea4a5a6004aebfeaff Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Mon, 27 Jun 2022 11:45:44 +0200
-Subject: [PATCH] Fix building with LibreSSL 2.7.0 or newer
-
-With LibreSSL 2.7.0 (or newer versions) some more structs have made
-opaque, which requires a few changes:
-
-- BIO_meth_new() and related functions are now defined by LibreSSL, the
-  versions from opensslcompat.{h,c} does not need to be used anymore.
-- HMAC_CTX is now opaque, HMAC_CTX_new(), EVP_MD_CTX_new, and related
-  functions should be used instead in winpr's hash.c.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://github.com/FreeRDP/FreeRDP/commit/436f212be3950917e4bb209aa5064e423f0dd882]
----
- libfreerdp/crypto/opensslcompat.c |  3 ++-
- libfreerdp/crypto/opensslcompat.h |  3 ++-
- winpr/libwinpr/crypto/hash.c      | 21 ++++++++++++++-------
- 3 files changed, 18 insertions(+), 9 deletions(-)
-
-diff --git a/libfreerdp/crypto/opensslcompat.c b/libfreerdp/crypto/opensslcompat.c
-index 701902dc2..314d6b51f 100644
---- a/libfreerdp/crypto/opensslcompat.c
-+++ b/libfreerdp/crypto/opensslcompat.c
-@@ -19,7 +19,8 @@
- 
- #include "opensslcompat.h"
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 
- BIO_METHOD* BIO_meth_new(int type, const char* name)
- {
-diff --git a/libfreerdp/crypto/opensslcompat.h b/libfreerdp/crypto/opensslcompat.h
-index 169e8e4c2..3ad5b6bd4 100644
---- a/libfreerdp/crypto/opensslcompat.h
-+++ b/libfreerdp/crypto/opensslcompat.h
-@@ -30,7 +30,8 @@
- 
- #include <openssl/opensslv.h>
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 
- #include <openssl/bio.h>
- #include <openssl/rsa.h>
-diff --git a/winpr/libwinpr/crypto/hash.c b/winpr/libwinpr/crypto/hash.c
-index 8265b2e90..5e94039e7 100644
---- a/winpr/libwinpr/crypto/hash.c
-+++ b/winpr/libwinpr/crypto/hash.c
-@@ -151,7 +151,8 @@ WINPR_HMAC_CTX* winpr_HMAC_New(void)
- 	WINPR_HMAC_CTX* ctx = NULL;
- #if defined(WITH_OPENSSL)
- 	HMAC_CTX* hmac = NULL;
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 
- 	if (!(hmac = (HMAC_CTX*)calloc(1, sizeof(HMAC_CTX))))
- 		return NULL;
-@@ -185,7 +186,8 @@ BOOL winpr_HMAC_Init(WINPR_HMAC_CTX* ctx, WINPR_MD_TYPE md, const BYTE* key, siz
- 	if (!evp || !hmac)
- 		return FALSE;
- 
--#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 	HMAC_Init_ex(hmac, key, keylen, evp, NULL); /* no return value on OpenSSL 0.9.x */
- 	return TRUE;
- #else
-@@ -221,7 +223,8 @@ BOOL winpr_HMAC_Update(WINPR_HMAC_CTX* ctx, const BYTE* input, size_t ilen)
- {
- #if defined(WITH_OPENSSL)
- 	HMAC_CTX* hmac = (HMAC_CTX*)ctx;
--#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 	HMAC_Update(hmac, input, ilen); /* no return value on OpenSSL 0.9.x */
- 	return TRUE;
- #else
-@@ -253,7 +256,8 @@ BOOL winpr_HMAC_Final(WINPR_HMAC_CTX* ctx, BYTE* output, size_t olen)
- 
- #if defined(WITH_OPENSSL)
- 	hmac = (HMAC_CTX*)ctx;
--#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10000000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 	HMAC_Final(hmac, output, NULL); /* no return value on OpenSSL 0.9.x */
- 	return TRUE;
- #else
-@@ -279,7 +283,8 @@ void winpr_HMAC_Free(WINPR_HMAC_CTX* ctx)
- 
- 	if (hmac)
- 	{
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 		HMAC_CTX_cleanup(hmac);
- 		free(hmac);
- #else
-@@ -332,7 +337,8 @@ WINPR_DIGEST_CTX* winpr_Digest_New(void)
- 	WINPR_DIGEST_CTX* ctx = NULL;
- #if defined(WITH_OPENSSL)
- 	EVP_MD_CTX* mdctx;
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 	mdctx = EVP_MD_CTX_create();
- #else
- 	mdctx = EVP_MD_CTX_new();
-@@ -464,7 +470,8 @@ void winpr_Digest_Free(WINPR_DIGEST_CTX* ctx)
- 
- 	if (mdctx)
- 	{
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
- 		EVP_MD_CTX_destroy(mdctx);
- #else
- 		EVP_MD_CTX_free(mdctx);
--- 
-2.36.1
-
diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 2b7aa25999..a600a96172 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.7.0.tar.gz.sha256
-sha256  89000728b6e66ac37db018d6dc5f0981b530fd550ab748877ff42892dd0c166b  freerdp-2.7.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.8.0.tar.gz.sha256
+sha256  fd26a41c367ea1f23a06716725d19efa41fd572c4536348d39b3465b116b3703  freerdp-2.8.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index f4636724d3..c7e01fa541 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.7.0
+FREERDP_VERSION = 2.8.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
