Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA9CC3DA61
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 17:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A6140944;
	Sat, 27 Jul 2024 17:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCm2KheFWypP; Sat, 27 Jul 2024 17:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D434F40979
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D434F40979;
	Sat, 27 Jul 2024 17:36:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6143A1BF2FF
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 17:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EE2E40944
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 17:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5qY741C2j4u for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 17:36:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE03F4071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE03F4071A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE03F4071A
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 17:36:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce6c.dip0.t-ipconnect.de [79.214.206.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 456CCA4C30D9
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 19:35:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53384)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXlKp-000000002wm-0Xku
 for buildroot@buildroot.org; Sat, 27 Jul 2024 17:35:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 19:35:58 +0200
Message-Id: <20240727173558.1728746-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722101759;
 bh=t5X7jIPjzX0rLcFffCq9idhtlWyfRnzRyfWgcYmmyAY=;
 h=From:To:Subject:Date:From;
 b=daJGns5GPv2hIt5yYEV6r+BLGNGpys5xZ2iLhFDZcIUe2BgYz86OX2v+QZfzCy31M
 xwcrAYh0svryumTX4ZJ+j8LEBB5iXCsfjruVQnUj5KBUtr63BNXfnX79wJ10ZObPdP
 DItv6h2SoqW+NbLV6mXIFkOhas71FWD+LQfmKvRU0lNW3PHwTsmgtHjYiM4Y4b6rPu
 l6HA5+QgzYxHdKc7yFIzWROFtP+OD1z/dps54LGCEnZWKCwvMEZ1UbiGluY54okROR
 nw3Pa8IGOZLRP6Ov89/uY2zM5HFKFbxh5b7Evqu8pPF4l3JSo4L56HYufG87kho6PM
 +uZavRpPESkIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=daJGns5G
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6,
 9}.x series
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
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 2d2b6d3546..3f55bf0c51 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  70109dfd1cd1c5f8a58eb1cb37122b9bf93f9c6a6280bf91019263c7339cf76b  linux-6.10.1.tar.xz
-sha256  efd12e335fa67d13a3eae30e4b7b7546e74b8ccc90682e4c3fffab0b22654da1  linux-6.9.10.tar.xz
-sha256  9ec99c578158ab85d99b37791a76643d2ea4c3f72ecbef7b5eb6d60f3de032ef  linux-6.6.41.tar.xz
-sha256  b9aa6ec1a00f234d6c6f2d428fbb0a6bf459606c259263df978f86685b65a8b9  linux-6.1.100.tar.xz
+sha256  dedf84e0832c3e912024e0c04347e9e48a2b2676d5c5cd869b3eb0ce92f513e1  linux-6.9.11.tar.xz
+sha256  8801c8c297d774e76044977ec3d0684399dc4e7cce347d730874ec78b774e683  linux-6.6.42.tar.xz
+sha256  f1459faa68429fa6607ae18b869fd02ed685bb33c72289f175aca163c592b34c  linux-6.1.101.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  025fc7d8b1560cf456ccae50591fe1ca21c990645df9791aed25820fe78db302  linux-5.15.163.tar.xz
 sha256  7b2d06803b5abb03c85f171100ca9d7acd6ba245036fe9a16eb998f088b150cb  linux-5.10.222.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 707f2ad026..0d96a7cff9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -431,9 +431,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.280"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.222"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.163"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.100"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.41"	if BR2_KERNEL_HEADERS_6_6
-	default "6.9.10"	if BR2_KERNEL_HEADERS_6_9
+	default "6.1.101"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.42"	if BR2_KERNEL_HEADERS_6_6
+	default "6.9.11"	if BR2_KERNEL_HEADERS_6_9
 	default "6.10.1"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
