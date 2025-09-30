Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55911CAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 20:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BC2A610AA;
	Tue, 30 Sep 2025 20:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vLeEtpBrWk2; Tue, 30 Sep 2025 20:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39803610AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39803610AD;
	Tue, 30 Sep 2025 20:32:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 237852A6
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AB4240DF6
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saO0OyTTKIFM for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 20:32:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3E2140E2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3E2140E2E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3E2140E2E
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c14e.dip0.t-ipconnect.de [79.214.193.78])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12662A4C5938;
 Tue, 30 Sep 2025 22:31:46 +0200 (CEST)
Received: from [192.168.1.144] (port=59878 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v3h0j-000000000W9-10v0;
 Tue, 30 Sep 2025 20:31:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Sep 2025 22:31:43 +0200
Message-ID: <20250930203145.1197559-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759264306;
 bh=v2Rbgm5QwbLPzmTA0jR/L+eftk2UTjqAfIzuzGadySI=;
 h=From:To:Cc:Subject:Date:From;
 b=i8u2DW7Oy4SL0aadJ96JpeXNGlSJYiFFddCYory8nTCAko7zULKOkqEZmvrSn0BfY
 lRtgw3ZRgejZ/tfF2fF00xyLtCJxdn6gQOUFO9OTCBzirwyyiMJtl+EXIRba5DVXcs
 YJWMrpF3Xse71NywmRFwZZYlbK0++g9DQoC4YU6gNHvKPb6+Y2dEFWmNK3MeJvv5Ao
 jvjrGEs6pDDvTDM2cnVTqWxAzQWAv2NgGc/O6Q+U3VE2yx6m/v1GG1Kg36F2rr/LUU
 7JGnL5Gr8bn7SdaZova0AsxcI55DXVUN6ngWbL7N5iUxzA5ChZXhKVzvLdZJ8PCLEw
 gfDvFZpcUyFmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=i8u2DW7O
Subject: [Buildroot] [PATCH 1/3] {linux, linux-headers}: bump 6.{1, 6, 12,
 16}.x series
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
index 1f1c014ba2..4526676432 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 8a02b43a67..3e0dff74ee 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5be3daa1f9427b1bdb34c4894d9c1adfac38cff674376fe0611a3065729a1a81  linux-6.16.7.tar.xz
-sha256  e82fe40871743048226987bd349ef107168b15aab90140e872ca4ed470922e25  linux-6.12.47.tar.xz
-sha256  0c3180e2d8dcd0b70fe83554d9c440e31bab17873e360b89c4ab62a4fd26a8a0  linux-6.6.106.tar.xz
-sha256  1a173be2a9cc886698b8205e639e4482b6cd84ba0be988d519415c7d2bb5b7d9  linux-6.1.152.tar.xz
+sha256  7ac8c8a3cf05476375deaaa85dfcee095a826ffe557b437f43774fc3b64ce58d  linux-6.16.9.tar.xz
+sha256  234621e146dacce2241049555d550e4f7a6bde67ccd7ef232d47ac8145425526  linux-6.12.49.tar.xz
+sha256  601cd332aa695d16607b353feff369b4a0b36d111be077e8af54bdd41e1968a6  linux-6.6.108.tar.xz
+sha256  6f1aba92c3d0d21299eebb73161a2056c7c78c6ee77462a7cb705bd8cca8b198  linux-6.1.154.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c70262d2f902710b773ef2f35c04b3ff2111e5186c8a97da351454180aac1e99  linux-5.15.193.tar.xz
 sha256  210a37cc09f5c2b3d6f011aa1c65d2484d6f4ec17cf90df473f917abb2c26dc0  linux-5.10.244.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d0555ccde4..05e1c7ae90 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -457,10 +457,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.299"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.244"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.193"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.152"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.106"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.47"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.7"	if BR2_KERNEL_HEADERS_6_16
+	default "6.1.154"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.108"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.49"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.9"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
