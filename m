Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0AFD68BF9
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 10:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0296D80558;
	Sun, 17 Nov 2024 10:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zCcrgu0TvMA; Sun, 17 Nov 2024 10:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8F188056E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8F188056E;
	Sun, 17 Nov 2024 10:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3AA7B14
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 10:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9359E403EB
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 10:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0GeW3jSeg9Z for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 10:19:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7C0A40282
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C0A40282
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7C0A40282
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 10:19:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba79.dip0.t-ipconnect.de [84.161.186.121])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 572A7A4C2397
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 11:19:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36540)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tCcNd-000000004KU-1b1i
 for buildroot@buildroot.org; Sun, 17 Nov 2024 10:19:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 17 Nov 2024 11:19:44 +0100
Message-Id: <20241117101944.2079217-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1731838785;
 bh=zghZH6kFIzpUC5KHmOg5zDIcsoMrdVBphbwQCszxoWo=;
 h=From:To:Subject:Date:From;
 b=e2JbBheWYSzg1O9x75mTrLNFecyjd0rz/2EChXu3v7M5K3ST45kvyXKZN6cIOI3zY
 ohmf86IbCGXLiA3nnHKS6wZByvhY5r66OJKeHmtlgtyy18nSjq3fRJ4vnhlWRg/idY
 9oMpE8FCK6m9cbZBQvhdaTym6bH2ATyHvSqwaQETulbmSBWKY+HHfff4DV0LNOX9wx
 mYJRkXQjq3Dx6tsLFBiqMBP6XSA1ADRiDGy0C0q4t94hSisCZ0HmiYL/uOfRlv/SVA
 8Ce4O2NDYG9N8fpKTFRNZaWrLHSEYRtextYGhOab4ojW9ZXSh/Za9ZIKmE2cowJopg
 ecUxoaa3LorMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=e2JbBheW
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 11}.x series
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
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5e5df7eb40..7fa1f1c00f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.11.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 7bb05dee49..4ba2c21274 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0bf5ec644817d7928920f763581311f5bf258a92759cf2f30985da743af3ebb2  linux-6.11.7.tar.xz
-sha256  52f9e32d5082ab94253447fd66670d0c3bb765cfcb99b0bf61d1b8eae25952ef  linux-6.6.60.tar.xz
-sha256  17eb68336ee2a8f34378bf6089ffe8f805b978eda314c299d2a63b0603833b81  linux-6.1.116.tar.xz
+sha256  aee8a844fe152420bece70ffae8525b9b23089aa4da31fa32f30e1859bf93c3d  linux-6.11.8.tar.xz
+sha256  418fc24df9190f1c3ed9906dc3b7651c2a2eae5c1cb9ab4a6348e20faf047c0b  linux-6.6.61.tar.xz
+sha256  a8fbffe691974a3bf6a21d34eefad71a64c2a1fcc4513218356f1a87e390788b  linux-6.1.117.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  2953e064d8123c4c22c4fd48011378d73c8b99a3bf3d989e33f4f5c8f82f2a3b  linux-5.15.171.tar.xz
+sha256  efa2245809c1b0c8d028b67b800fdd44c9bba7800b154ee492c2ba18ed33844d  linux-5.15.172.tar.xz
 sha256  08a6b5e6bbff85ef017f67b722f6beec7f12fe36fc0f9043f27a91990b88cde0  linux-5.10.229.tar.xz
 sha256  be32c37ef2f6f724fa13acf43cbc9aacfd3acef58964923dae5daa6206d3429c  linux-5.4.285.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a58f54138a..a2ac21c0d6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -431,10 +431,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.323"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.285"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.229"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.171"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.116"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.60"	if BR2_KERNEL_HEADERS_6_6
-	default "6.11.7"	if BR2_KERNEL_HEADERS_6_11
+	default "5.15.172"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.117"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.61"	if BR2_KERNEL_HEADERS_6_6
+	default "6.11.8"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
