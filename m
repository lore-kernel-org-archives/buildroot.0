Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BADCC3ABC3
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 11:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FBC960BDF;
	Sun, 11 May 2025 11:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N27fS66yP91T; Sun, 11 May 2025 11:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F7C360BC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7C360BC7;
	Sun, 11 May 2025 11:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD92A17D
 for <buildroot@buildroot.org>; Sun, 11 May 2025 11:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEE0D81EB9
 for <buildroot@buildroot.org>; Sun, 11 May 2025 11:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQMs6EdgF4pw for <buildroot@buildroot.org>;
 Sun, 11 May 2025 11:03:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68A138124F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68A138124F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68A138124F
 for <buildroot@buildroot.org>; Sun, 11 May 2025 11:03:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07c5.dip0.t-ipconnect.de [91.58.7.197])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6DA5A4C0A40
 for <buildroot@buildroot.org>; Sun, 11 May 2025 13:03:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54168)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uE4SX-0000000049T-0ss8
 for buildroot@buildroot.org; Sun, 11 May 2025 11:03:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 May 2025 13:03:05 +0200
Message-Id: <20250511110305.476463-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746961385;
 bh=hlpSj5hBK/1xDJT1C7QtE+olFT8r+59OgtZo3d3bi9k=;
 h=From:To:Subject:Date:From;
 b=KSkCMKOMLNzIN2MsuQL7oTYxPXz3b+A/xVgUcxWWUen18EeFmqbAYtb3tyy7DaHCF
 yKN6Rcj01Yi7/pmR+9PeRzjxDnVD048M0eqbm+mM1X66Ipwefg3x1G1llr7jiRoORG
 nFKGR/VhYACehjCkxKI2ppABEB5vJbyDDCW0vxGOZTZvWx6L7En+XHlcMRy4quGPyQ
 uNYm+IWKj05XOWNfenUIbWxpOAyN3BSN9r7lhlkCw11ZvkZnbXxWi9l8fWhg6f3BfN
 p1Der/nwmaMsH6uhm46rr+m4R7Zz8jvBIL4kskPGJQDFz80dUcqEgPLO1sAvbSA5T4
 vibmmqMPQIvuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=KSkCMKOM
Subject: [Buildroot] [PATCH 1/1] package/linux-headers: drop 6.13.x option
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

The 6.13.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 79f7a33a23..02dc3eab73 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.05"
 
+config BR2_KERNEL_HEADERS_6_13
+	bool "kernel headers version 6.13.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.13.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_MPD_SOUNDCLOUD
 	bool "mpd soundcloud support has been removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 4dc1504be6..6b2e064189 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  21817f1998e2230f81f7e4f605fa6fdcb040e14fa27d99c27ddb16ce749797a9  linux-6.14.6.tar.xz
-sha256  611fbb669cf5539da48137a9c052becd499f3f862afaf21ab84cea3966221242  linux-6.13.12.tar.xz
 sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
 sha256  ff856748671629c1fefef219099e0b4b81131c2d325e768cb0806e204157014e  linux-6.6.90.tar.xz
 sha256  e319a5bb9049ba9fb8cbc08cba4874716e8985bd10f7971f2573ea802c257911  linux-6.1.138.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f788f9ca44..9be2b4b970 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
-config BR2_KERNEL_HEADERS_6_13
-	bool "Linux 6.13.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13
-
 config BR2_KERNEL_HEADERS_6_14
 	bool "Linux 6.14.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
@@ -450,7 +446,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.138"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.90"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.28"	if BR2_KERNEL_HEADERS_6_12
-	default "6.13.12"	if BR2_KERNEL_HEADERS_6_13
 	default "6.14.6"	if BR2_KERNEL_HEADERS_6_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
