Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9833FF885A
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 06:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FBB361212;
	Sun,  3 May 2026 06:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhJZ6lTpv-fN; Sun,  3 May 2026 06:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2449461207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777788553;
	bh=Tq+OD0lmDh2FCbheVg4mkzfd1gnovkn1LVaQN23B1Bg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DBrREId+USyCYo8I02+CG7oxBSIBNw+kRUF84h3VN2kMdNnh6s8aNoT7bIgiWDLnK
	 RjnCZOsKd1xRq7AupcQu1kQlQFTczXQfqMwL2C7czQG7qnvY95szEsauSnFEFGGoK+
	 b+qVjnirbpg7vkgCAwBO0onwigcNmW4FIIGU8GTQC4XvsnVeaFS6STonVjb/4A5HI0
	 S3M/10zub4efh/3CwgFMD59tqoXXi/xShwruYbSSOhqVFW/MUo3IbYY6p0jwQQeanX
	 cQ+vqXrXF2h1IngiUsYUZBA30SqxhQ4oHDn/JxVXF8t/IUcJMHmL5lDydFvuiX7mEI
	 Lz+V7EUBeRkRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2449461207;
	Sun,  3 May 2026 06:09:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CEAF0204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 06:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C048C841B5
 for <buildroot@buildroot.org>; Sun,  3 May 2026 06:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0z1vbJHeba4 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 06:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81E02841B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81E02841B3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81E02841B3
 for <buildroot@buildroot.org>; Sun,  3 May 2026 06:09:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97193A4C0282;
 Sun,  3 May 2026 08:09:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48656)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wJQ0o-0000000033U-2xjf;
 Sun, 03 May 2026 06:09:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  3 May 2026 08:09:05 +0200
Message-ID: <20260503060906.600090-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777788546;
 bh=mqTBoMFQ+jfBFJLH9681PUHhg9HBYMK0vdzCjFQpl8o=;
 h=From:To:Cc:Subject:Date:From;
 b=ctZQ73sSHI8y4Io6KmgygOyg8Tbt92D/zjenV0jT6liey2W/557cOausHzvGWAGy3
 JpCC/hiu0zQaky6UotwyuenySHR8qP6l8+d14ITFe/a2380kckjrUpD7c24PNHXzNY
 oK7liN2injV8yA1IWkpjfjsBn5t+uTfyOn5MvazDJv6D/4hRpZvq4TRKY9IMRZPbUZ
 1L5uvv4EwxdhmBuN6Uf7s9uEWhBdEsgspFOTCoV764Usg8aLeiLmU4CnRYu9su4G+P
 zIHg7fN65x4sCKeb6OU10c0rW/M7DJJSLnuOhhCTtkv+CITtprbebt3/ZK8gpXlij7
 6W/UaZ1RfXqMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ctZQ73sS
Subject: [Buildroot] [PATCH 1/1] package/libsodium: security bump version to
 1.0.22
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

https://github.com/jedisct1/libsodium/releases/tag/1.0.22-RELEASE
https://github.com/jedisct1/libsodium/releases/tag/1.0.21-RELEASE

Updated license hash due to copyright year bump:
https://github.com/jedisct1/libsodium/commit/80c6bab4518aecd197d830c145b5d23e9b932ea3

Switched to bz2 tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsodium/libsodium.hash | 6 +++---
 package/libsodium/libsodium.mk   | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index ae4765a2ab..ef982ea759 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking Minisign signature
-# https://download.libsodium.org/libsodium/releases/libsodium-1.0.20.tar.gz.minisig
-sha256  ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19  libsodium-1.0.20.tar.gz
-sha256  43964d976a6db3fb986af689d05f8ca0e9971878bccae709750dac8fdc4a99cf  LICENSE
+# https://download.libsodium.org/libsodium/releases/libsodium-1.0.22.tar.bz2.minisig
+sha256  51b93737bf62e8549b0e94dce0fba92169e31c8ecc160883460a9bdaa6d2c298  libsodium-1.0.22.tar.bz2
+sha256  508a76d186356c0dd807a670ef510964f8724557024796a2c426c6c0e19ab683  LICENSE
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index 7dd763e145..5f62a66246 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.20
+LIBSODIUM_VERSION = 1.0.22
 LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
+LIBSODIUM_SOURCE = libsodium-$(LIBSODIUM_VERSION).tar.bz2
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
 LIBSODIUM_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
