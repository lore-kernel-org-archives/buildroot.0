Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF312D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A5D680D5F;
	Sun,  7 Dec 2025 14:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfi7q31yTPNe; Sun,  7 Dec 2025 14:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7405A812E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118797;
	bh=lhqCGBelWTf38HiPgCaFktYu9DUV0zAFzTFOpwItcfw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qA41+ECsaHN0gFshrK1qf7zybpQrDbCIk05evdxygv1UbyNfiJWq6/eIXwhn1G9p2
	 I9+Fnk+K477GI2R5F3nhI/6qgc9WWXzZ6rt7EZGZ1fSGuopoorRJAzjo6CY+GMfppS
	 +aYvk9MLfCJkEr9V6Ai5Oqjiw5aIA9NnL6ts2lSo9M112nnCKhUmAIWYpmY9klP4Z/
	 AQJOwYQPq6fPsp6FCchyU2K/Qrt+SovfUEGRjK3wwIYMQJP5mGbWT5kTLbCITGzS+T
	 TgaViiYizPWZGCCn5uGQbBB0lXj55GMEAWVV423XsfvgPGamu8fEyZ9jmugD884ZLa
	 CHzU8yRR1H6Cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7405A812E6;
	Sun,  7 Dec 2025 14:46:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F9B0151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81888812E6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnfYz2XQGrZ1 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:46:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6548F80D5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6548F80D5F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6548F80D5F
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:46:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A14C6A4C0ADE;
 Sun,  7 Dec 2025 15:42:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyH-00000000416-1vCm;
 Sun, 07 Dec 2025 14:42:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:29 +0100
Message-ID: <20251207144243.3696572-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118577;
 bh=aDT5kqtJ0mf44nLcaSvOqTf2jdZyRyMJ/wWLl9/DWcQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XnA6pTQ8YawO95gWZn1gYYwSHeH2fUc2Qh1i3adQ8Up+zDTa0Z/E/M4cqikKVcWzs
 6/KEjaqu1oYg7uJvKaMlSwocOKmJidKCmTJDcpt8yFLtwaY8HDbypOivOLMPKW8jc3
 4uO+6t2d2VhP/JaCt/6vW2OR9jOS8WQ4QeFhMaY+O4c1cprS+iWSR4nPIZoG/FR43V
 luP54xNLBc5gdk9TOCiMor2b3miSXsyTIDR19Feqq6mLXwG+Ta/pQAHrxMit3FZhWk
 411TJT7n6pYZ472U1bq5/5x/jtYLwCoNM0G2gqMwxnKnLMsm35qJqEVPfXqDKZX0f6
 mi+XOW7PpL4LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XnA6pTQ8
Subject: [Buildroot] [PATCH/next 20/33] package/ustream-ssl: bump version
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash of source file.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...use-getrandom-instead-of-dev-urandom.patch | 88 -------------------
 ...dd-compatibility-with-mbed-tls-3-0-0.patch | 79 -----------------
 package/ustream-ssl/ustream-ssl.hash          |  4 +-
 package/ustream-ssl/ustream-ssl.mk            |  2 +-
 4 files changed, 3 insertions(+), 170 deletions(-)
 delete mode 100644 package/ustream-ssl/0001-ustream-mbedtls-use-getrandom-instead-of-dev-urandom.patch
 delete mode 100644 package/ustream-ssl/0002-ustream-mbedtls-add-compatibility-with-mbed-tls-3-0-0.patch

diff --git a/package/ustream-ssl/0001-ustream-mbedtls-use-getrandom-instead-of-dev-urandom.patch b/package/ustream-ssl/0001-ustream-mbedtls-use-getrandom-instead-of-dev-urandom.patch
deleted file mode 100644
index 2abb7ce3a1..0000000000
--- a/package/ustream-ssl/0001-ustream-mbedtls-use-getrandom-instead-of-dev-urandom.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 498f6e268d4d2b0ad33b430f4ba1abe397d31496 Mon Sep 17 00:00:00 2001
-From: Hauke Mehrtens <hauke@hauke-m.de>
-Date: Sun, 19 Feb 2023 21:11:12 +0100
-Subject: [PATCH] ustream-mbedtls: Use getrandom() instead of /dev/urandom
-
-Instead of keeping a file descriptor open just use the getrandom syscall
-to get random data. This is supported by musl libc, glibc and Linux for
-some time now.
-
-This also improves the error handling in case this function returns not
-as many bytes as expected.
-
-Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
-Reviewed-by: Torsten Duwe <duwe@lst.de>
-Upstream: https://git.openwrt.org/?p=project/ustream-ssl.git;a=commit;h=498f6e268d4d2b0ad33b430f4ba1abe397d31496
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- ustream-mbedtls.c | 25 ++++++-------------------
- 1 file changed, 6 insertions(+), 19 deletions(-)
-
-diff --git a/ustream-mbedtls.c b/ustream-mbedtls.c
-index e79e37b..7fc7874 100644
---- a/ustream-mbedtls.c
-+++ b/ustream-mbedtls.c
-@@ -17,6 +17,7 @@
-  */
- 
- #include <sys/types.h>
-+#include <sys/random.h>
- #include <fcntl.h>
- #include <unistd.h>
- #include <stdlib.h>
-@@ -25,8 +26,6 @@
- #include "ustream-ssl.h"
- #include "ustream-internal.h"
- 
--static int urandom_fd = -1;
--
- static int s_ustream_read(void *ctx, unsigned char *buf, size_t len)
- {
- 	struct ustream *s = ctx;
-@@ -66,21 +65,12 @@ __hidden void ustream_set_io(struct ustream_ssl_ctx *ctx, void *ssl, struct ustr
- 	mbedtls_ssl_set_bio(ssl, conn, s_ustream_write, s_ustream_read, NULL);
- }
- 
--static bool urandom_init(void)
-+static int _random(void *ctx, unsigned char *out, size_t len)
- {
--	if (urandom_fd > -1)
--		return true;
-+	ssize_t ret;
- 
--	urandom_fd = open("/dev/urandom", O_RDONLY);
--	if (urandom_fd < 0)
--		return false;
--
--	return true;
--}
--
--static int _urandom(void *ctx, unsigned char *out, size_t len)
--{
--	if (read(urandom_fd, out, len) < 0)
-+	ret = getrandom(out, len, 0);
-+	if (ret < 0 || (size_t)ret != len)
- 		return MBEDTLS_ERR_ENTROPY_SOURCE_FAILED;
- 
- 	return 0;
-@@ -134,9 +124,6 @@ __ustream_ssl_context_new(bool server)
- 	mbedtls_ssl_config *conf;
- 	int ep;
- 
--	if (!urandom_init())
--		return NULL;
--
- 	ctx = calloc(1, sizeof(*ctx));
- 	if (!ctx)
- 		return NULL;
-@@ -159,7 +146,7 @@ __ustream_ssl_context_new(bool server)
- 
- 	mbedtls_ssl_config_defaults(conf, ep, MBEDTLS_SSL_TRANSPORT_STREAM,
- 				    MBEDTLS_SSL_PRESET_DEFAULT);
--	mbedtls_ssl_conf_rng(conf, _urandom, NULL);
-+	mbedtls_ssl_conf_rng(conf, _random, NULL);
- 
- 	if (server) {
- 		mbedtls_ssl_conf_authmode(conf, MBEDTLS_SSL_VERIFY_NONE);
--- 
-2.30.2
diff --git a/package/ustream-ssl/0002-ustream-mbedtls-add-compatibility-with-mbed-tls-3-0-0.patch b/package/ustream-ssl/0002-ustream-mbedtls-add-compatibility-with-mbed-tls-3-0-0.patch
deleted file mode 100644
index b9fa4be1a5..0000000000
--- a/package/ustream-ssl/0002-ustream-mbedtls-add-compatibility-with-mbed-tls-3-0-0.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 91666a38b7bd4bd353394986d8343a33ba61d8e2 Mon Sep 17 00:00:00 2001
-From: Hauke Mehrtens <hauke@hauke-m.de>
-Date: Sat, 11 Nov 2023 22:13:24 +0100
-Subject: [PATCH] ustream-mbedtls: Add compatibility with Mbed TLS 3.0.0
-
-This adds support for compiling the code against Mbed TLS 3.0.0.
-It still compiles against Mbed TLS 2.28.
-
-The following changes were needed:
- * DES and 3DES was removed
- * mbedtls_pk_context->pk_info is private, use mbedtls_pk_get_type()
-   to check if it was initialized
- * mbedtls_pk_parse_keyfile() now gets a random callback
- * mbedtls/certs.h contains test data and is not installed any more and
-   not needed.
-
-Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
-Upstream: https://git.openwrt.org/?p=project/ustream-ssl.git;a=commit;h=91666a38b7bd4bd353394986d8343a33ba61d8e2
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- ustream-mbedtls.c | 12 +++++++++++-
- ustream-mbedtls.h |  1 -
- 2 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/ustream-mbedtls.c b/ustream-mbedtls.c
-index 7fc7874..1c70cac 100644
---- a/ustream-mbedtls.c
-+++ b/ustream-mbedtls.c
-@@ -110,9 +110,15 @@ static const int default_ciphersuites_client[] =
- 	AES_CBC_CIPHERS(ECDHE_ECDSA),
- 	AES_CBC_CIPHERS(ECDHE_RSA),
- 	AES_CBC_CIPHERS(DHE_RSA),
-+/* Removed in Mbed TLS 3.0.0 */
-+#ifdef MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA
- 	MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
-+#endif
- 	AES_CIPHERS(RSA),
-+/* Removed in Mbed TLS 3.0.0 */
-+#ifdef MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA
- 	MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA,
-+#endif
- 	0
- };
- 
-@@ -171,7 +177,7 @@ static void ustream_ssl_update_own_cert(struct ustream_ssl_ctx *ctx)
- 	if (!ctx->cert.version)
- 		return;
- 
--	if (!ctx->key.pk_info)
-+	if (mbedtls_pk_get_type(&ctx->key) == MBEDTLS_PK_NONE)
- 		return;
- 
- 	mbedtls_ssl_conf_own_cert(&ctx->conf, &ctx->cert, &ctx->key);
-@@ -206,7 +212,11 @@ __hidden int __ustream_ssl_set_key_file(struct ustream_ssl_ctx *ctx, const char
- {
- 	int ret;
- 
-+#if (MBEDTLS_VERSION_NUMBER >= 0x03000000)
-+	ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL, _random, NULL);
-+#else
- 	ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL);
-+#endif
- 	if (ret)
- 		return -1;
- 
-diff --git a/ustream-mbedtls.h b/ustream-mbedtls.h
-index e622e5e..7e7c699 100644
---- a/ustream-mbedtls.h
-+++ b/ustream-mbedtls.h
-@@ -21,7 +21,6 @@
- 
- #include <mbedtls/net_sockets.h>
- #include <mbedtls/ssl.h>
--#include <mbedtls/certs.h>
- #include <mbedtls/x509.h>
- #include <mbedtls/rsa.h>
- #include <mbedtls/error.h>
--- 
-2.30.2
diff --git a/package/ustream-ssl/ustream-ssl.hash b/package/ustream-ssl/ustream-ssl.hash
index 30686e1ce4..35cc0a7c00 100644
--- a/package/ustream-ssl/ustream-ssl.hash
+++ b/package/ustream-ssl/ustream-ssl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  932703fb2875e589e6e0ffc787e5bc57a9f424cb23692fcefa78b1e6afa80700  ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a-git4.tar.gz
-sha256  cf28f0f01a57423983fa062eb0f04bb1a78891863cb58c53059c3d8cb52c1dd4  ustream-ssl.h
+sha256  52298e75dfb9f01900c5e9ad211bb5d3fa7ba763d9c15fc5d334754b04a7c0de  ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635-git4.tar.gz
+sha256  445eaf528740f162725b19287aa80594aebfe33beae9007b3ede49e55e5b50d2  ustream-ssl.h
diff --git a/package/ustream-ssl/ustream-ssl.mk b/package/ustream-ssl/ustream-ssl.mk
index bee8d7de15..cbda36f5cd 100644
--- a/package/ustream-ssl/ustream-ssl.mk
+++ b/package/ustream-ssl/ustream-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAM_SSL_VERSION = 68d09243b6fd4473004b27ff6483352e76e6af1a
+USTREAM_SSL_VERSION = 5a81c108d20e24724ed847cc4be033f2a74e6635
 USTREAM_SSL_SITE = https://git.openwrt.org/project/ustream-ssl.git
 USTREAM_SSL_SITE_METHOD = git
 USTREAM_SSL_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
