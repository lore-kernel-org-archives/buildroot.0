Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D523EC3ABC9
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 18:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93DCC40B4E;
	Sat, 10 May 2025 18:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBUJ6NeroBxN; Sat, 10 May 2025 18:23:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77EB40944
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B77EB40944;
	Sat, 10 May 2025 18:23:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08C04154
 for <buildroot@buildroot.org>; Sat, 10 May 2025 18:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECC1640944
 for <buildroot@buildroot.org>; Sat, 10 May 2025 18:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_0KCM89frvc for <buildroot@buildroot.org>;
 Sat, 10 May 2025 18:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07C6F40935
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07C6F40935
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07C6F40935
 for <buildroot@buildroot.org>; Sat, 10 May 2025 18:23:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07c5.dip0.t-ipconnect.de [91.58.7.197])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59DC8A4C07C1;
 Sat, 10 May 2025 20:17:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59184)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uDold-000000004zT-1Aly;
 Sat, 10 May 2025 18:17:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 May 2025 20:17:43 +0200
Message-Id: <20250510181745.1812058-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746901066;
 bh=7eHbUPz0vZTndWHCNWPIJ6KgCZ8ZqozkO+gbJoEjG6Q=;
 h=From:To:Cc:Subject:Date:From;
 b=PeVEc3Ndw6gOJUl20yFOJuoolIu/EekpOmhw0SjYOYQOa80rEWPAXD17/r3lM2vfJ
 cbUhG/JdfJGc1lJywCQ3TD1xttNXDNRtHq0weEKMiEjXaf4YxsgNwsO9ShHkMMJCii
 16lXA2d9FPFQGHbExklBZJeusyk/CJo3kdB5UNET1uh6pCGTjSOV3NfpZAhOL942Ay
 0UbBmVZrOTeAZxyz/9kV1kP+4WVTn9SFVC8YOp62L03s+WmoJRMNrzDyHHLcRj5Rtg
 vlQo1GCHewLBGusj1Ia9xlEVZPyPXx904WP4b5yq3X7sdrwSxQt145ozAjnyu3Rlgs
 HTxDTwWBWTAzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=PeVEc3Nd
Subject: [Buildroot] [PATCH 1/3] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 13}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index cdcf7e8c23..e3eb4c472a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.13.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.13.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 10aaed1d3f..68bc458c71 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  259afa59d73d676bec2ae89beacd949e08d54d3f70a7f8b0a742315095751abb  linux-6.13.8.tar.xz
-sha256  230e89b07b0ab82e74f07ecc1bee3105dca81d0ef4a97f900929c407249b6ac7  linux-6.12.20.tar.xz
-sha256  7fd20721551a61db347c5ac6ca05818e24058682be4e4389dc51e88d4ac17ba7  linux-6.6.84.tar.xz
-sha256  44caf510603b4cbbe78ef828620099d200536d666e909ddb73bb2938c7de5b16  linux-6.1.131.tar.xz
+sha256  611fbb669cf5539da48137a9c052becd499f3f862afaf21ab84cea3966221242  linux-6.13.12.tar.xz
+sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
+sha256  ff856748671629c1fefef219099e0b4b81131c2d325e768cb0806e204157014e  linux-6.6.90.tar.xz
+sha256  e319a5bb9049ba9fb8cbc08cba4874716e8985bd10f7971f2573ea802c257911  linux-6.1.138.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
-sha256  953be3931101a94a93a644c1283ca41a7e567447ca87d3069ed4dd712dc1f1cc  linux-5.10.235.tar.xz
-sha256  b3ad64a4476a7c5450b92eab9a888b84ecb64dc613fcb0128f653f58e958ef6e  linux-5.4.291.tar.xz
+sha256  b6abfa53315a04e459070b927c58beb41f085433117d58756504d68b67f6a31e  linux-5.15.182.tar.xz
+sha256  1fc82737e0e4f0ae0b40f91a00c68f3cb75362e6ae54623ec64b41a51cde0f25  linux-5.10.237.tar.xz
+sha256  34589340c7d76c0de91965e5242f61e9f9f3bacd03e8e34239e5d4660d45372d  linux-5.4.293.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0a07d657b2..6fd591eb69 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -436,13 +436,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.291"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.235"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.179"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.131"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.84"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.20"	if BR2_KERNEL_HEADERS_6_12
-	default "6.13.8"	if BR2_KERNEL_HEADERS_6_13
+	default "5.4.293"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.237"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.182"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.138"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.90"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.28"	if BR2_KERNEL_HEADERS_6_12
+	default "6.13.12"	if BR2_KERNEL_HEADERS_6_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
