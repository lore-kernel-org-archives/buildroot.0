Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7703C54ED1
	for <buildroot@archiver.kernel.org>; Sat, 24 May 2025 08:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54C32820E2;
	Sat, 24 May 2025 08:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_1Miny6Lx_F; Sat, 24 May 2025 08:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A6D7820D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A6D7820D9;
	Sat, 24 May 2025 08:02:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FB7A119
 for <buildroot@buildroot.org>; Sat, 24 May 2025 08:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51BD2607D8
 for <buildroot@buildroot.org>; Sat, 24 May 2025 08:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNeALo8lEp1G for <buildroot@buildroot.org>;
 Sat, 24 May 2025 08:02:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCB62605E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCB62605E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCB62605E4
 for <buildroot@buildroot.org>; Sat, 24 May 2025 08:02:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DE393A4C2D59
 for <buildroot@buildroot.org>; Sat, 24 May 2025 10:01:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49250)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uIjpN-000000006R6-3EkB
 for buildroot@buildroot.org; Sat, 24 May 2025 08:01:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 May 2025 10:01:57 +0200
Message-Id: <20250524080157.17232-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1748073718;
 bh=RHSUKGpHGMKDF/sdc1WAP69UTI1bF63QBey7ztpibUY=;
 h=From:To:Subject:Date:From;
 b=DkHVKvfJByYAVl1SLEnam7zsBhV6QbeHTPfrYoioM0/YfsgBVp5ALG1GQXzjCfpvK
 NatcTXei+ZLjdCfeT/PRXubj0XMyoEQ3mdsXl901dZfEIj63ioa3GSy8EbSFDxbe6W
 bCSeW1mvp7RBF0vw2rthVPgQd9x/1yyhC5MX7LJ/3yiXW0mrlHCMbpS72KSL54YTQT
 4bulfLoMlUSVToFk4DjnzCjygHL/2oJ4CGTEOLR6YUg1yKJkQHVQ7Ib4CZLDFoKoD8
 ujQTh2XeIOd9BZfR/Gd9uzOy6GSvSJ9DTaAvuoPByyPPCKmD3WCzN3gLfmdEPz7tKc
 WVV7HRx5quQbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=DkHVKvfJ
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.15.x / 6.{1,
 6, 12, 14}.x series
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
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 97e2f47077..7552aa4d6c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.14.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.14.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6b2e064189..104d42288f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  21817f1998e2230f81f7e4f605fa6fdcb040e14fa27d99c27ddb16ce749797a9  linux-6.14.6.tar.xz
-sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
-sha256  ff856748671629c1fefef219099e0b4b81131c2d325e768cb0806e204157014e  linux-6.6.90.tar.xz
-sha256  e319a5bb9049ba9fb8cbc08cba4874716e8985bd10f7971f2573ea802c257911  linux-6.1.138.tar.xz
+sha256  62b12ecd3075a357eb320935657de84e01552803717dad383fa7cc3aa4aa2905  linux-6.14.8.tar.xz
+sha256  df046a48971e40ce0b2e003e7e55b6b1e7da2912120eb216d5d6c8450c9cf82e  linux-6.12.30.tar.xz
+sha256  1d82a82642d281c31d86f7301bc55e12a8a9f9c04532e249ef8ae6fe7dc237ec  linux-6.6.92.tar.xz
+sha256  5779f9caca77f7bfe3c3923b4d760041318db0303de93b2d4691d60e4d41eb74  linux-6.1.140.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b6abfa53315a04e459070b927c58beb41f085433117d58756504d68b67f6a31e  linux-5.15.182.tar.xz
+sha256  9c3e98c6dcc7dca7c2e9dd51423eaf0581f5e100d0f04c23bc29f21913dac1d9  linux-5.15.184.tar.xz
 sha256  1fc82737e0e4f0ae0b40f91a00c68f3cb75362e6ae54623ec64b41a51cde0f25  linux-5.10.237.tar.xz
 sha256  34589340c7d76c0de91965e5242f61e9f9f3bacd03e8e34239e5d4660d45372d  linux-5.4.293.tar.xz
 # Locally computed
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9be2b4b970..ccaad58e44 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -442,11 +442,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.293"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.237"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.182"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.138"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.90"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.28"	if BR2_KERNEL_HEADERS_6_12
-	default "6.14.6"	if BR2_KERNEL_HEADERS_6_14
+	default "5.15.184"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.140"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.92"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.30"	if BR2_KERNEL_HEADERS_6_12
+	default "6.14.8"	if BR2_KERNEL_HEADERS_6_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
