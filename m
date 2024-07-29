Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C89C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 11:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD8174096F;
	Mon, 29 Jul 2024 11:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dj5_IBPGYuoR; Mon, 29 Jul 2024 11:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34D6C4090E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34D6C4090E;
	Mon, 29 Jul 2024 11:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 114F61BF573
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 11:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0954D40210
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 11:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9njERwLmfRy for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 11:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=933036aaa=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09E9640219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E9640219
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09E9640219
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 11:29:46 +0000 (UTC)
X-CSE-ConnectionGUID: 6cp23pYHTrawAch69osYPA==
X-CSE-MsgGUID: J2Z57QHuQtWN7EXLUoRukQ==
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="29804208"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jul 2024 04:22:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jul 2024 04:22:14 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jul 2024 04:22:13 -0700
To: <buildroot@buildroot.org>
Date: Mon, 29 Jul 2024 12:24:16 +0100
Message-ID: <20240729112417.806611-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729112417.806611-1-jamie.gibbons@microchip.com>
References: <20240729112417.806611-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1722252587; x=1753788587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4un2GtidoHOefZz3vE5ZvaLKK3mMC1x1G/TI1h7ta2s=;
 b=aJMTf8j/+u6RdcKbeu/WpWDcrfemtf+b9JbXYQ4bmsniPLCB66BXHTzi
 5090gtmRfA+aE9DUrO8UdqoHeZStd1amnwJehKUaM5YWkfroS1sZI+CtT
 1RRYQyR1f5+QnLPXVheR3cIC94ratWN27mX15sUArSJFrv3w4Muu85mkv
 cxVi+CQ4rEKGbZfTwI7hFm5OyskdTc//HS1ys46Gr+SLKFa/j/hIAcfbz
 CxxWhixMtfSeGHA/JYsPTcPd+nzHYGNXL4AdGKCH7GV71VQO/OyjLfF+Q
 41VyVUCuRF1To+okGJefOUT++HkKVuNzTkayd7HoelEd053XddQ4AYi/l
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=aJMTf8j/
Subject: [Buildroot] [PATCH 2/3] configs/beaglev_fire: bump assets
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
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following Microchip's Linux 2024.06 release, bump Linux and U-Boot to
the most recent versions. Also update the Linux custom headers to
support the new v6.6 kernel. Update all affected hashes.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/beagleboard/beaglev_fire/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
 configs/beaglev_fire_defconfig                          | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/patches/linux/linux.hash b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
index d621dc3201..025d630f7d 100644
--- a/board/beagleboard/beaglev_fire/patches/linux/linux.hash
+++ b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7d634bf425f2ad68c3a6aab0d67a5f0c9f59a4fae02f051054f428854913f58a  linux4microchip+fpga-2024.02.tar.gz
+sha256  a45642bd69b11d9312c15faac67fbd15b0ef90a6d90662d18c0760e37165c7cc  linux4microchip+fpga-2024.06.tar.gz
diff --git a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
index 684aa15a12..ddb73b9a71 100644
--- a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c21209347beac37540f1c7070760498493975052b536fc02677faa2110666bab  linux4microchip+fpga-2024.02.tar.gz
+sha256  5d9bcbebe9723ab12cbf2b60277268741e84e4aadbe7ecd8c05be046f202d8a1  linux4microchip+fpga-2024.06.tar.gz
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index d52ec3c7d7..809e00ff92 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -1,6 +1,6 @@
 BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglev_fire/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_OVERLAY="board/beagleboard/beaglev_fire/rootfs-overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboard/beaglev_fire/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.1-mchp+fpga)/linux4microchip+fpga-2024.02.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.6-mchp+fpga)/linux4microchip+fpga-2024.06.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,polarfire-soc,u-boot)linux4microchip+fpga-2024.02.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,u-boot-2023.07-mchp)/linux4microchip+fpga-2024.06.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beaglev_fire"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beagleboard/beaglev_fire/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
