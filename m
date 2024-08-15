Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF2EC531DD
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 17:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F88B408E7;
	Thu, 15 Aug 2024 17:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIT5v3jK84z7; Thu, 15 Aug 2024 17:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1AF340881
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1AF340881;
	Thu, 15 Aug 2024 17:16:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 915DE1BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E86040881
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbnePG3ae5sM for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 17:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7135408E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7135408E7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7135408E7
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 17:16:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b460.dip0.t-ipconnect.de [84.161.180.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 342C7A4C0AC3
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 19:16:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45002)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1see4v-000000003Qk-1dFI
 for buildroot@buildroot.org; Thu, 15 Aug 2024 17:16:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 19:16:01 +0200
Message-Id: <20240815171601.3430807-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1723742162;
 bh=2RA1q25GWttAPcNKn2gk3AKEu3MB1pq4XWJCw2PizH0=;
 h=From:To:Subject:Date:From;
 b=UCtg0wOjt3klWMFSmEeLaegyRLSPzu5hOzAg5HpcJpsGqa5l98f0ZH2QiudRrvLyZ
 w6V5c0J+KmBx9r3wDxE0N4np4f6uSU7YqcDG4GCBAsvzx3QwebYNb5QpAeXsE0KO8d
 1KP6efWHkgxy1fwiTbT/AN/qwFG4bPnXox5dLk/D3RHQB21u7INzpcmm4gc/FesV8u
 ms57oFqhNMXmURBfBMQzQGmkFauFJwGib9sD0FNVNevQX58t3SnGgeKXWFsc72Zdnn
 eR2vyCaGBL4no2G/ihNPwQAX6zj3SyMIqPeKARZv+TYle6E+gKZUlh01gh9oL/hPAy
 UAydKqRxSnGtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=UCtg0wOj
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6,
 10}.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 429a7eabef..4430f05096 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.10.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4e05f4a765..1029c7b305 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  fa5f22fd67dd05812d39dca579320c493048e26c4a556048a12385e7ae6fc698  linux-6.10.3.tar.xz
-sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
-sha256  5eb4706f898f50881552ff5146d892132d3ffc5298033bffe27087d3a44c4573  linux-6.1.103.tar.xz
+sha256  30909eb2e0434dce97a93cd97ed0dfab7688a124bc3ebc3ecf6c776de09ccc0b  linux-6.10.5.tar.xz
+sha256  052f932396d9c7d84ceeda91226a8ef797c12188bde41e6c419602d990dd45f2  linux-6.6.46.tar.xz
+sha256  23bfa8f698a1f4329a62d1ea13ec87f5434fb0ac5d86a6b99e5d342cc5f85e98  linux-6.1.105.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  ec6098faed64b8a47ba1772e812a6eb444385f7aa3c60d3e4739ab2fd3b29186  linux-5.15.164.tar.xz
 sha256  ca09d86a6b79706c33382d3f8606f476eb07918417a87fb1815f6a4aa81f2ba1  linux-5.10.223.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 83b8d1267e..e0f30d98d2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -427,9 +427,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.281"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.223"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.164"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.103"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.44"	if BR2_KERNEL_HEADERS_6_6
-	default "6.10.3"	if BR2_KERNEL_HEADERS_6_10
+	default "6.1.105"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.46"	if BR2_KERNEL_HEADERS_6_6
+	default "6.10.5"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
