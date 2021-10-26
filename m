Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB59C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:26:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB2F610C7
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFB2F610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E81040220;
	Tue, 26 Oct 2021 07:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpnar_9UaI4C; Tue, 26 Oct 2021 07:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FF3C40239;
	Tue, 26 Oct 2021 07:26:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3380C1BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE66D40257
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2v2F8z1SXb5 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 07:24:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F7304024E
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635233083; x=1666769083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hebTBSncUXbgpWhhgXf0WtRRB2aTXODO1IPsDOO9kxE=;
 b=nWSIT6sh4xxvvDz6RADKPjzPRHLV0C9U/Rf2CmDzxG3qneKUe1CDMXGV
 H6RQOFEDANRWoicwHC6DLvTLfHL0P+vqgW/yMq8E/AieQ7q/Tyr+WoBjH
 XSVz7kVPzkzM6n3kOMSn7uGOIglDq/0MGbr8Q1yOJEjI1dTOS+T+2AERe
 OWfWXcLBwBaBTPwGAwoAGqFTj4g3kSeBmPTElBV72XAGk9fPomVs7tU8W
 WCAx3CJGa1X9l0j12hVobXBqh8ooLvhyZtHkrOCbT1PoNKpDkvDm8z+0j
 /bmHXB9RNLsioTkGdhT/Iqf75EBPtw9kTd1Fo6r8MuH+BA66LD2dh6YrS w==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188623081"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 15:17:37 +0800
IronPort-SDR: oqcIrGQxkNAV3QyQnWy3wtr9C9wGuO0W1IePemvPZwKr5LmlBSE6U9Vhvm3yqBEcPkfShdHaF+
 XPlzOM41ujWajEfVXP3F78lsEv9F6evBBdnCV2eRD0of2+1j513v+er5n0m4V8BVC57cdrVr0+
 CsTKWrrL1lO95oOlyL6lGdUNyjEsGd/JrpcqJ9mFHw1ymMkB19QG+AcesO6GIadPARt6PtcvJD
 C2DqrzEwlOj1H+aWSIMQadpSgpkEJHGTXrxdlzvvcKt27BTvcbsUFqQOTX/T4lKeqgyXbwVJVr
 3DYX1Lp0k2CKakHywmm++Qy4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 23:51:36 -0700
IronPort-SDR: 2ESNMN+f/2Ormxl2q7yNzhy5zw3v9c7ToSD7t0T2NKw+qjbpA4hRgfwxLG+o0lxRbttZGcvCi+
 Og5FkZnItDepZIQ0VnT3rYfl9sJlo1v8dv4Gjfqb5F3RriAPEz6XIyVa+UlQ0KiKmPoHAYyPyo
 PbfOjUMEwQklwdUhrHo1GlPU2Q5pwVFstphflocOEBFa/Oeb2CIQgEba+VRhYGNPd2Asplgmco
 r6DrqoZNO+4yfuHeiNMVoAFQcZIZV4yr3J2Gtb5iGloW+t8e8IXpbu/6p9GbYkAXPX6j6cqRJk
 T2U=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2021 00:17:39 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Oct 2021 16:17:27 +0900
Message-Id: <20211026071728.954356-10-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026071728.954356-1-damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 09/10] board: Add Canaan KD233 support
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
SoC based KD233 development board. These configurations are similar to
the configurations defined for the Sipeed boards, differing only by the
built-in kernel device tree used.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 board/canaan/kd233/linux-dtb.config   |  2 ++
 configs/canaan_kd233_defconfig        | 14 ++++++++++++++
 configs/canaan_kd233_sdcard_defconfig | 13 +++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 board/canaan/kd233/linux-dtb.config
 create mode 100644 configs/canaan_kd233_defconfig
 create mode 100644 configs/canaan_kd233_sdcard_defconfig

diff --git a/board/canaan/kd233/linux-dtb.config b/board/canaan/kd233/linux-dtb.config
new file mode 100644
index 0000000000..d5b107124a
--- /dev/null
+++ b/board/canaan/kd233/linux-dtb.config
@@ -0,0 +1,2 @@
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="canaan_kd233"
diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
new file mode 100644
index 0000000000..6f665495ba
--- /dev/null
+++ b/configs/canaan_kd233_defconfig
@@ -0,0 +1,14 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/kd233/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-common/busybox-tiny.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/canaan_kd233_sdcard_defconfig b/configs/canaan_kd233_sdcard_defconfig
new file mode 100644
index 0000000000..a106077dc5
--- /dev/null
+++ b/configs/canaan_kd233_sdcard_defconfig
@@ -0,0 +1,13 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/kd233/linux-dtb.config"
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
