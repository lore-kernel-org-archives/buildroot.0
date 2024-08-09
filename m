Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0AAC52D71
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 08:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14AF480F3E;
	Fri,  9 Aug 2024 08:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uT3pIjX2S77; Fri,  9 Aug 2024 08:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E75480F0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E75480F0F;
	Fri,  9 Aug 2024 08:52:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 930EF1BF281
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 08:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E86A41268
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 08:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ifPbgNvWxC1 for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 08:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=944a06301=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 772E34123C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 772E34123C
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 772E34123C
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 08:52:13 +0000 (UTC)
X-CSE-ConnectionGUID: ewcEd6WfTG6n55+qcfmOcA==
X-CSE-MsgGUID: rxOJljwPQ+SS6nYXsK8CZQ==
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="197717200"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Aug 2024 01:52:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Aug 2024 01:51:47 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 9 Aug 2024 01:51:46 -0700
To: <buildroot@buildroot.org>
Date: Fri, 9 Aug 2024 09:53:33 +0100
Message-ID: <20240809085334.3530176-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809085334.3530176-1-jamie.gibbons@microchip.com>
References: <20240809085334.3530176-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1723193533; x=1754729533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMWGbr3xBMqs8WTtLMehEloqiIYy4d2ZLUgJjVXZrR4=;
 b=qcUCE40cx01sfqucUVN8F/JoFcHtkGJP+H7CmEQE0ovhyOxBAHmXgAFg
 iC70K2d4AYacH2w9OcHBLBG6U7tLQGpfcFHaG2iRhwtSsZF3gDiIYRfzo
 9wZrKUDojvangqN2GLtjXJNGCfCQXoJGmy5/qFcMGYJkrUZ4KGJYxl1HY
 mc+Q0bI6XN1tmEBXBWbMvLzCJKAieGN5VKsK3K5Po6vEaCl6b60CNw6vC
 tVfGWfn9jOq+I9aCyf7FmC9/BSQOBJGg21tTrpo2yQan2ITljoWdVBJNH
 WvdYilS5wALoT/ioVerpGp4KTKFuiXJDje4zuhzzEq6T5Qi7fuD9QzUA+
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=qcUCE40c
Subject: [Buildroot] [PATCH v3 1/2] configs/beaglev_fire: update custom
 tarballs
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Jamie Gibbons <jamie.gibbons@microchip.com>,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Linux kernel and U-Boot custom tarballs were updated incorrectly
in commit 8ce97fd550d6. Update these to select specific release tags
instead of branches. Update the U-Boot and Linux hashes to match
these changes.

Fixes: 8ce97fd550d6 ("configs/beaglev_fire: bump Linux and U-Boot")

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Tested-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
---
 board/beagleboard/beaglev_fire/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
 configs/beaglev_fire_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/patches/linux/linux.hash b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
index 025d630f7d..416a8b1550 100644
--- a/board/beagleboard/beaglev_fire/patches/linux/linux.hash
+++ b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a45642bd69b11d9312c15faac67fbd15b0ef90a6d90662d18c0760e37165c7cc  linux4microchip+fpga-2024.06.tar.gz
+sha256  dcb7b41fd363729675c34545fcb514d5a94dbb3714ee10f527a26ca7716c2579  linux-linux4microchip+fpga-2024.06.tar.gz
diff --git a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
index ddb73b9a71..2628d4b4fd 100644
--- a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5d9bcbebe9723ab12cbf2b60277268741e84e4aadbe7ecd8c05be046f202d8a1  linux4microchip+fpga-2024.06.tar.gz
+sha256  d461c45a9c5acd019776cdcf8ab2b571315282a880dd6580431f7dd5bfac3889  uboot-linux4microchip+fpga-2024.06.tar.gz
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index 809e00ff92..5e1faf41b9 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_OVERLAY="board/beagleboard/beaglev_fire/rootfs-overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboard/beaglev_fire/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.6-mchp+fpga)/linux4microchip+fpga-2024.06.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.06)/linux-linux4microchip+fpga-2024.06.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,u-boot-2023.07-mchp)/linux4microchip+fpga-2024.06.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.06)/uboot-linux4microchip+fpga-2024.06.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beaglev_fire"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beagleboard/beaglev_fire/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
