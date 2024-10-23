Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6447CF538B
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 13:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA0E80AB1;
	Wed, 23 Oct 2024 13:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dx6Q3qm3CGBg; Wed, 23 Oct 2024 13:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 877D780AB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 877D780AB6;
	Wed, 23 Oct 2024 13:51:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 873672072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 13:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61A6F80AB1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 13:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnEYsHdD6_Er for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 13:51:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=0198f1d49=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90A5A80A79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90A5A80A79
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90A5A80A79
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 13:51:19 +0000 (UTC)
X-CSE-ConnectionGUID: RUKm6bNmQ2uh0Xy7Du+o7g==
X-CSE-MsgGUID: N+D5o46VSWaj36vaCwnK4g==
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="33926525"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Oct 2024 06:51:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 06:50:46 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 06:50:45 -0700
To: <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Conor Dooley
 <Conor.Dooley@microchip.com>, Valentina Fernandez Alanis
 <Valentina.FernandezAlanis@microchip.com>, Jamie Gibbons
 <jamie.gibbons@microchip.com>
Date: Wed, 23 Oct 2024 14:53:17 +0100
Message-ID: <20241023135317.2356119-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023135317.2356119-1-jamie.gibbons@microchip.com>
References: <20241023135317.2356119-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1729691479; x=1761227479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8aEOboZmuO2yDwbb41Eeqy/DCoSJA7K7CnZN+PgL1xU=;
 b=IsM3rHBaAR+XHTLc2KbsweLr7dtOziCn1Ib3qZQz/8l/9VZUGIuxeJWx
 yNdwkK/4qE7jQPHayRFBK2SpVvmkfbTpF7JwndncPlWm25cz4DsmsWoSA
 aWwuVwBKtYDBMTKwA4tfqxtXs8koToRI7LzbN4E6a4JmHObYixEurrN21
 b+jzcru1TnYFpyeArDCFLutKXM5E/nOpkUJcfFh6jdu+C7HYp9klPwUCg
 nkf8BYN7GMSsZ+SpbdTW3lMSg5+n82ksSgcP6IokvIjD2QcKzFhHwfaxd
 SxsPBKvBZHeDU0xNKmeuN04LOMhSL55BEAU7QbQ+E7xAlficnjhTMFAEA
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=IsM3rHBa
Subject: [Buildroot] [PATCH 2/2] configs/beaglev_fire: Bump Linux
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump Linux to the latest release tag: linux4microchip+fpga-2024.09.1.
This includes the latest features and bug fixes. The main highlights
include a kernel version bump from v6.6.35 to v6.6.51 and a fix for the
Microchip mpfs-auto-update driver.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/patches/linux/linux.hash | 2 +-
 configs/beaglev_fire_defconfig                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/patches/linux/linux.hash b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
index 416a8b1550..9ee63df23d 100644
--- a/board/beagleboard/beaglev_fire/patches/linux/linux.hash
+++ b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  dcb7b41fd363729675c34545fcb514d5a94dbb3714ee10f527a26ca7716c2579  linux-linux4microchip+fpga-2024.06.tar.gz
+sha256  7bd234a93bc6351d6a830f9ef18e9e780d70c478d280a6513a30bc2f945fb050  linux-linux4microchip+fpga-2024.09.1.tar.gz
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index 5b42732435..676c2a5062 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_OVERLAY="board/beagleboard/beaglev_fire/rootfs-overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboard/beaglev_fire/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.06)/linux-linux4microchip+fpga-2024.06.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.09.1)/linux-linux4microchip+fpga-2024.09.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
