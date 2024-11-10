Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2188AD12D50
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 19:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCB7680D85;
	Sun, 10 Nov 2024 19:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFdqJi83ema0; Sun, 10 Nov 2024 19:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B263080D34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B263080D34;
	Sun, 10 Nov 2024 19:48:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 551EEDAC
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 305B880D34
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZK1ZlZ6D5Zv for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 19:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB73B80BA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB73B80BA8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB73B80BA8
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:48:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a50.dip0.t-ipconnect.de [91.58.10.80])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BD3B3A4C3077
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 20:48:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59834)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tADvH-000000003QL-0Lvw
 for buildroot@buildroot.org; Sun, 10 Nov 2024 19:48:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 10 Nov 2024 20:48:35 +0100
Message-Id: <20241110194835.1149037-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1731268115;
 bh=J1me6XcmwnDhNiR9dSlJ4x0yvRfEJrXMm//+Hupz4No=;
 h=From:To:Subject:Date:From;
 b=RGQucwMLIDvbcTWPYQdC4TugO4EkYWmzytYSkfqNLjMbH+fXmB9fZWB64rVW7y9Nl
 ix4tcHvBjBa1hJZwA2uZH18j8Zuwt+N7V+ASdnHMuyNsOUAjQ0aJ1ehnL6vbq+DiTI
 KEXMTMzSN28TGhByQ8RjZlOhodXWXkeVFEPRY6eI0xd2xTpiYvmtc34+VemcVcMgx6
 l9K9STDPIogNRbABEP9CgBHcFIczeIThFxRnJgp4QeMy3aqTevan+xyE6p+eK8jn1J
 aHRHneLy0zFHDLnODL+rEFSuzgypuNhaYIpL/tc6mKBNB+trggLxcEYffvCDYk+nWp
 OeJ1sQg4dC5og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=RGQucwML
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6, 11}.x series
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
index 16c015b412..5e5df7eb40 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.11.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a52cd623cd..7bb05dee49 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
-sha256  23616808d8c08f12815ff898f4edb4c11397a2b2843d029ee62452d21833a76d  linux-6.6.59.tar.xz
-sha256  0fd8ba827e1f1888376d88fd1d1c80d707c587c75b0f18c26530824be437ba6f  linux-6.1.115.tar.xz
+sha256  0bf5ec644817d7928920f763581311f5bf258a92759cf2f30985da743af3ebb2  linux-6.11.7.tar.xz
+sha256  52f9e32d5082ab94253447fd66670d0c3bb765cfcb99b0bf61d1b8eae25952ef  linux-6.6.60.tar.xz
+sha256  17eb68336ee2a8f34378bf6089ffe8f805b978eda314c299d2a63b0603833b81  linux-6.1.116.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  fd596545a3d6d93196db3fa29e4926e60900b9c05b3b9ccdee9e35d8e376e7a9  linux-5.15.170.tar.xz
-sha256  76cc8d7f1528f87902e38697229661d0617a7d6ab86166be9f3ef9a613b17b72  linux-5.10.228.tar.xz
-sha256  77221ab9aebeac746915c755ec3b7d320f85cd219c63d9c501820fbca1e3b32b  linux-5.4.284.tar.xz
+sha256  2953e064d8123c4c22c4fd48011378d73c8b99a3bf3d989e33f4f5c8f82f2a3b  linux-5.15.171.tar.xz
+sha256  08a6b5e6bbff85ef017f67b722f6beec7f12fe36fc0f9043f27a91990b88cde0  linux-5.10.229.tar.xz
+sha256  be32c37ef2f6f724fa13acf43cbc9aacfd3acef58964923dae5daa6206d3429c  linux-5.4.285.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  4e27cdf999359876a0ff489bff6ece7ba5798ff37c2289db0c9e9422a9014162  linux-4.19.322.tar.xz
+sha256  eec9215fbac649d826fda9d3421da47aebd3c4e69e060e5106d32e309a9b6a1c  linux-4.19.323.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2f7a731d36..a58f54138a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,13 +428,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.322"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.284"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.228"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.170"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.115"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.59"	if BR2_KERNEL_HEADERS_6_6
-	default "6.11.6"	if BR2_KERNEL_HEADERS_6_11
+	default "4.19.323"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.285"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.229"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.171"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.116"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.60"	if BR2_KERNEL_HEADERS_6_6
+	default "6.11.7"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
