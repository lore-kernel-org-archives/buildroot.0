Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D69EA719B
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 14:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2FAA60DC2;
	Sun, 19 Apr 2026 14:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31LnpxStEQvu; Sun, 19 Apr 2026 14:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D58F260EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776607545;
	bh=WV/WRzP0fcwsv8cogHbYtGUdd5oU0NZXQJeYvfGIinU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ex9FCGIFCsYJZotL5sWO5mR8s7fRR4xv7Z3oY7/0hk6dfInzZgGmCTAUlc4dPJ6pz
	 RhGDk2qstNEepGO2XGNRKN7GvQj6rMuqu8HPtrkBYk191cJlxJs+ork8/QLrTwJ0EH
	 wULXh26SXBAnviZiDZHHM8eUzNknck35oKW0A4TiHNFW7DG5z/B1BSFw3Ru1oXTfWi
	 D1eAdEIH7m0EMtod77IGuwLrCvX2xoTg2Fa6+hm1B4CovrTijqjDIhOzMoUwsqywYZ
	 UeDmU7n6edgPq3gKNJjfx5LumOrPhky85wyrIFxR4IozkZ3zdaA/uTZ52Ui8PnRExU
	 MTuRYX4yaiRgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D58F260EAD;
	Sun, 19 Apr 2026 14:05:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9992024D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F8AC810AA
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2R20R8swQOw for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 14:05:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FE3A810A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE3A810A2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FE3A810A2
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:05:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F07A7A4C38A3
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 16:05:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41582)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wESmK-000000001XR-2Ytr
 for buildroot@buildroot.org; Sun, 19 Apr 2026 14:05:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 16:05:40 +0200
Message-ID: <20260419140540.261219-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776607541;
 bh=pF7QwcXUtGz7/kDIdvCG9WTeX0Ie4TUpK//BSDsIatA=;
 h=From:To:Subject:Date:From;
 b=T7aDyiQmvSqcVO59baYqnV6928Bfn/SakmnKWccHqJgnfijByFkTPn9F62TLbof8b
 SEMdMElonGiZsYD3n459GGKD3qyHVWoHTQxqZbuoFDUhsZ4ciCLk851T6Z6TYVjKpv
 yjm/q56le/XI0jzeBeslKZ+SLmFD03o8480d1TPbuFL7g38doUWN/N7/8TOHCKySSS
 TwqoHGxvBddzy8s3ST38hBEdRXvjug8do3c2qsi2VjQRuikhyH4bF550ZCQOs9S0/u
 DIIEH/YNnooviQIf4geJcDX+5Xf4Ra+fAzejy+roe6wH9PhPx9WV6Vtgw5Pti7dS2r
 xi3GTJ1gqNl8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=T7aDyiQm
Subject: [Buildroot] [PATCH 1/1] package/nmap: bump version to 7.99
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/nmap/nmap/blob/master/CHANGELOG

Removed patch which is not needed anymore due to upstream commit
https://github.com/nmap/nmap/commit/1b3ca45054cd1e569f5fc0da59fceaa7a518b631

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...pto.cc-fix-build-with-libressl-3.5.0.patch | 41 -------------------
 package/nmap/nmap.hash                        |  6 +--
 package/nmap/nmap.mk                          |  2 +-
 3 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch

diff --git a/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch b/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
deleted file mode 100644
index 700b8585f1..0000000000
--- a/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0a79771c302bf398150da78cd18b67cb9b67f47a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 21 May 2022 17:51:37 +0200
-Subject: [PATCH] nping/Crypto.cc: fix build with libressl >= 3.5.0
-
-Fix the following build failure with libressl >= 3.5.0:
-
-Crypto.cc: In static member function 'static int Crypto::aes128_cbc_encrypt(u8*, size_t, u8*, u8*, size_t, u8*)':
-Crypto.cc:139:26: error: aggregate 'EVP_CIPHER_CTX ctx' has incomplete type and cannot be defined
-  139 |           EVP_CIPHER_CTX ctx;
-      |                          ^~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/2e6eebbe2ed8305b88047bc92c19350c1ecada16
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/nmap/nmap/pull/2480
-[Julien: rebased patch on version 7.95]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- nping/Crypto.cc | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/nping/Crypto.cc b/nping/Crypto.cc
-index 6f05db6..1d11d55 100755
---- a/nping/Crypto.cc
-+++ b/nping/Crypto.cc
-@@ -69,7 +69,9 @@
- #include <openssl/evp.h>
- #include <openssl/err.h>
- 
--#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && !defined LIBRESSL_VERSION_NUMBER
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && \
-+	((!defined LIBRESSL_VERSION_NUMBER) || \
-+	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER >= 0x30500000L))
- #define HAVE_OPAQUE_EVP_PKEY 1
- #else
- #define EVP_MD_CTX_new EVP_MD_CTX_create
--- 
-2.45.2
-
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 9303ff613e..17f9eb7f5e 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.98.tar.bz2.digest.txt (lowercase)
-sha256  ce847313eaae9e5c9f21708e42d2ab7b56c7e0eb8803729a3092f58886d897e6  nmap-7.98.tar.bz2
-sha512  14e13689d1276f70efc8c905e8eb0a15970f4312c2ef86d8d97e9df11319735e7f7cd73f728f69cf43d27a078ef5ac1e0f39cd119d8cb9262060c42606c6cab3  nmap-7.98.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.99.tar.bz2.digest.txt (lowercase)
+sha256  df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2  nmap-7.99.tar.bz2
+sha512  9ff69659b76573eb10b6e472a0217032fd5fed20f0ac971b3736a4222fb6251c5fbf381ebea7ede313b8ff2feac90a848f645000c61200772d01b843594f4ba4  nmap-7.99.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 629a00f30e..b04d8b080d 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.98
+NMAP_VERSION = 7.99
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
