Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4BBD591B2
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 20:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F394060E68;
	Mon, 18 Nov 2024 20:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jjJYS59wSVM; Mon, 18 Nov 2024 20:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0091660B3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0091660B3F;
	Mon, 18 Nov 2024 20:26:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9431427EB
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 20:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7515985040
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 20:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3pUuzy-ecST for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 20:26:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC8B085037
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC8B085037
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC8B085037
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 20:26:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba79.dip0.t-ipconnect.de [84.161.186.121])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 09727A4C0D8F
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 21:26:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41606)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tD8Kc-000000005Ev-0WRB
 for buildroot@buildroot.org; Mon, 18 Nov 2024 20:26:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 18 Nov 2024 21:26:45 +0100
Message-Id: <20241118202645.152204-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1731961606;
 bh=9eN6RXJDZzD0YTH3Llf6tGSqCmmrUk9ismjPhyV8vFc=;
 h=From:To:Subject:Date:From;
 b=lcCePPa5UDKvxU6pPXPeVXOq1dlalSqIuYp/z6Za3UW+0CWMQ/xu4MpQ5TGmcIvyu
 wVeceiBtySoDLRFzdZliomZl773WlHGln5mbp2pFvepc19Fm4ZI9ep3gbG5zBxq228
 9cqdUdtR5m7otM9R6wQFt+rvVyb8AXae7EVfaa/uzL583PX/eBhs/gFfqFmXQ3doT5
 Kvx0nYKBS/nazmMyDYzzzUlqNdl6jP6wGxdzsuz/EuONwUE8fcDlPQWLsQekmCfQnZ
 a8WZ7GlybboLaHjMN7nlXDRevcHojew42Nov/LJoe3Xy86L3a8Wl3VeVTY1iUocsdR
 oUWMHcJwrb6MQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=lcCePPa5
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
index 5e5df7eb40..62f0b06d7b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.11.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 7bb05dee49..07c1ce7e4f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0bf5ec644817d7928920f763581311f5bf258a92759cf2f30985da743af3ebb2  linux-6.11.7.tar.xz
-sha256  52f9e32d5082ab94253447fd66670d0c3bb765cfcb99b0bf61d1b8eae25952ef  linux-6.6.60.tar.xz
-sha256  17eb68336ee2a8f34378bf6089ffe8f805b978eda314c299d2a63b0603833b81  linux-6.1.116.tar.xz
+sha256  75658a7aa3bd9598c96ee1e5862c5e1d34fced75c28d825c727a1510a6f384b4  linux-6.11.9.tar.xz
+sha256  e2c35611775534941b9d4dd871f3ae5b988b6594dc9033b5ca784366e07d9336  linux-6.6.62.tar.xz
+sha256  010784bd7161c32c4cd68a423d4dcb14e4587677d238b2825a31fe012869224c  linux-6.1.118.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  2953e064d8123c4c22c4fd48011378d73c8b99a3bf3d989e33f4f5c8f82f2a3b  linux-5.15.171.tar.xz
-sha256  08a6b5e6bbff85ef017f67b722f6beec7f12fe36fc0f9043f27a91990b88cde0  linux-5.10.229.tar.xz
-sha256  be32c37ef2f6f724fa13acf43cbc9aacfd3acef58964923dae5daa6206d3429c  linux-5.4.285.tar.xz
+sha256  8a4b2a47ccc9b208b2b6ed9a216ea1a5eb12852c723bec1a04de9e671a1d7da8  linux-5.15.173.tar.xz
+sha256  cd1850ef3b771886df4e0b4c4eb07033864abab2bb553a20fd9e3cdc23584b47  linux-5.10.230.tar.xz
+sha256  180754f3df0e8d7f206625255b3f5a6e1f441feec83336df42613ca8f6b1887c  linux-5.4.286.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  eec9215fbac649d826fda9d3421da47aebd3c4e69e060e5106d32e309a9b6a1c  linux-4.19.323.tar.xz
+sha256  90e140ad2d07da88b43d5930cfda7bffc5c121660e9d8a86d96a9efe4d87ffe6  linux-4.19.324.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a58f54138a..f74802adc9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,13 +428,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.323"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.285"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.229"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.171"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.116"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.60"	if BR2_KERNEL_HEADERS_6_6
-	default "6.11.7"	if BR2_KERNEL_HEADERS_6_11
+	default "4.19.324"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.286"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.230"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.118"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.62"	if BR2_KERNEL_HEADERS_6_6
+	default "6.11.9"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
