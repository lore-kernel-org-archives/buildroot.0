Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A62C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:26:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82DAD610C7
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82DAD610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DDD0404DF;
	Tue, 26 Oct 2021 07:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpY5asccpUzz; Tue, 26 Oct 2021 07:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3168404F7;
	Tue, 26 Oct 2021 07:26:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30C9C1BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 119224023F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOnDqBNCTQjX for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 07:24:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EF974024E
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635233080; x=1666769080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2EKbkFMnioKoMAamzJnZaC7sgXt7rAlMDwrbcakxlXA=;
 b=WFpiSHS31UUi/6jhIJD3IPe+LAvhVChdN8z7bGuRtV0+1Ps+YZSovPF4
 FZRvYHaVad5NLR7X4S/k2s7req7O/FgWz6L2qDFG8tfdz8zULC/bTWMWJ
 R4fYadvOFvhw5jbpOZzXX+m0n4W4Cw7SOo3NxAapN8mX40UL+66PFQGDt
 ZdtFRRxK10jl35L7mkBuwrU32jm0tlzqUWHMAtJyJyRCi8Zb+5fqyxE7B
 5HklN1KXsiU9cVz5RC0EuqzrftSukTvnkAof4RwOlVsg3KQalFgUjvc2C
 AP32+t/n9zIqA8P5rPk83iaXug2lZ/35uqdfW/48EkCDy+so1Pa5wxhsS A==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188623079"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 15:17:36 +0800
IronPort-SDR: PL5RdafHVU/2iP1tHEaChmM2fvqqFttolUHV2yBn01qI/XFfoj1p6Ud6t0XJQtFcIdXTJZibIj
 HiigiIuVwMdr1b09l7gvG9HU7QbSFSckLriHBKgFTTbTlTpAsOUEUj0b4HykJQ/hOPvNhuJUBQ
 1MG/2ivOovJhpxvDxEHMTl8oYKtm9zyB/BHkE3RPfPbwXr8PLrjEm3Vf7hnIAa2resJv8ZZ84Q
 1D8bd7YrcqwROGQH32MdVekUd+rmqb8XYcZ8/cUjU/Q9T8WvBlZrN3bKCNWgwMgozWfIrhpHcK
 Wl4KRB68BrT3hGIS57n81G1o
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 23:51:35 -0700
IronPort-SDR: YE/w+lsOBItnr1CClFoH1iXHJNiPOtfBBCME94MSPE0ADOb2OArTcIaRfxLKcVbg9/JtXoMSY6
 i+n/SnwF1GpX974i+jzThd7LIwirbN7zfrKcDPggNA1CuFJjW0lTuXeNjvGL7d+6rcskrXc8Nm
 wjKxMj+9T7nn080ulbs5oD7P1DN79ivYgAy6iR811AiycMCW/JR0vQRYAmdL+CH2NoJGY5sHqr
 pPLX8dnZYt2V8o8nAjqkEoWXXQ7Bl6XjH9UjxXSInvFFdxvw7BPkIchD5cmhGIdApHBVv2YV/n
 oI8=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2021 00:17:38 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Oct 2021 16:17:26 +0900
Message-Id: <20211026071728.954356-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026071728.954356-1-damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 08/10] board: Add Sipeed MAIX-Dock support
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add two configuration files to support the dual-core RV64 Canaan K210
SoC based Sipeed MAIX-Dock board. These configurations are similar to
the Sipeed MAIX-bit board configurations, differing only by the
built-in kernel device tree used.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 board/sipeed/maix-dock/linux-dtb.config   |  2 ++
 configs/sipeed_maix_dock_defconfig        | 14 ++++++++++++++
 configs/sipeed_maix_dock_sdcard_defconfig | 13 +++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 board/sipeed/maix-dock/linux-dtb.config
 create mode 100644 configs/sipeed_maix_dock_defconfig
 create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig

diff --git a/board/sipeed/maix-dock/linux-dtb.config b/board/sipeed/maix-dock/linux-dtb.config
new file mode 100644
index 0000000000..b1ca3166f8
--- /dev/null
+++ b/board/sipeed/maix-dock/linux-dtb.config
@@ -0,0 +1,2 @@
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="sipeed_maix_dock"
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
new file mode 100644
index 0000000000..b4f0a74d0a
--- /dev/null
+++ b/configs/sipeed_maix_dock_defconfig
@@ -0,0 +1,14 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-dock/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-common/busybox-tiny.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
new file mode 100644
index 0000000000..f80e61d801
--- /dev/null
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -0,0 +1,13 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-dock/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_EXT2=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
