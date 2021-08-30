Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131A0C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:43:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C802660F35
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C802660F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A262940415;
	Mon, 30 Aug 2021 04:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFnquQwCHtba; Mon, 30 Aug 2021 04:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 564DC40423;
	Mon, 30 Aug 2021 04:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B53151BF2F4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B06D060755
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8gh_9LEstn1 for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 04:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F2CD606EF
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630298469; x=1661834469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FzZ46Tz6z2nBVkChiKYHJcLir1fNUbpV9SEjLKkM7P8=;
 b=kLFXuW07Q98DQj4cMcpTDTt1eySM5mGTJmqCT5sHrbY44pfRJQokviCO
 5kZAHAc5gGZ8/51HmyyJPKK/hDFw1u7LIgqhkwH28raPG2tJ8vglH7wwE
 BGtCHMIJJ7IS7xoWlGJBQFVxTTW/G+M7cJFDqtYvJhajLCCosqbzO2b2W
 UiaVoaIpcd22OZpOwbhniTfb2moKWbHewp4Mvy5lAP6OwAmRkB7kfk+2i
 nCGxPnfoaw0zDe+D5YFnfLLUVkxHSBuf5h3SCxuT6yUMp0z0rbumAZl5W
 q9Eu79N+Dj1+lJq23m4VuZFS/xCFx5c6uEtbcTJSI0mqOKxdDsuYAien8 A==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="177842503"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 12:41:09 +0800
IronPort-SDR: JyMBBFs+9+wn8eb8qvRfyAIm+jl/fDM3ZUm93NjAgOVP8LGPKhydR8cwlszRk8dr7mk+pVurbh
 KpVARgWxEp3HFgRChecMQyvfgg3WY5sHZf0A9Vy2NGLgNnyIb3da7+UGReOTlC0+tcrSowipId
 g43QeYxpjJdmsxxq8owJI8Y3uzi2gCiKX5GYAvjzX26P3YPO3K6Ul5sCbaBX0EVBOHbfnrzMtD
 z4eimvIK8Gm8zpTlhZFAQPal3EjZ8Q07p1XVL0uFxkYkrechba2wUb9Z6rYdx28CtIBPSFmyfl
 a/7Tmb6vDddCMsP2Cja2J7oC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 21:18:00 -0700
IronPort-SDR: r1DFcQmrHHBV/QoLArIlqcOEegvJdes4rnttaWnZYQwBCp8lrVNb74+s0c+uBDWvtJ0IuGkvZy
 rSKhI70ntfBumKSLP4kvO3cvgitbiUdDNo8q6NgWECIxiVR0vPorvy/mHsB38eKTi7ogvcQeCC
 F+doTgiAIro69R9jbeTTorBacH3LByBnW15lUcj1L/3I11+Wf3LJlf4EIyyLSDNl3UUC7mRiks
 VjvJojF3fa6rqahoyJMo8kuq1pqcIr1bQb11Zo0tOC7w4WtAx46PWgPG95SRFeMRXlaE+iYyla
 oZ0=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.119])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Aug 2021 21:41:08 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Aug 2021 13:40:57 +0900
Message-Id: <20210830044100.260173-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830044100.260173-1-damien.lemoal@wdc.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 6/9] board: Add Sipeed MAIXDUINO support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add two configuration files to support the dual-core RV64 Canaan K210
SoC based Sipeed MAIXDUINO board. These configurations are similar to
the Sipeed MAIX-bit board configurations, differing only by the
built-in kernel device tree used.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 board/sipeed/maixduino/linux-dtb.config   |  2 ++
 configs/sipeed_maixduino_defconfig        | 15 +++++++++++++++
 configs/sipeed_maixduino_sdcard_defconfig | 14 ++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 board/sipeed/maixduino/linux-dtb.config
 create mode 100644 configs/sipeed_maixduino_defconfig
 create mode 100644 configs/sipeed_maixduino_sdcard_defconfig

diff --git a/board/sipeed/maixduino/linux-dtb.config b/board/sipeed/maixduino/linux-dtb.config
new file mode 100644
index 0000000000..049a2550c5
--- /dev/null
+++ b/board/sipeed/maixduino/linux-dtb.config
@@ -0,0 +1,2 @@
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="sipeed_maixduino"
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
new file mode 100644
index 0000000000..8d83fdf6ad
--- /dev/null
+++ b/configs/sipeed_maixduino_defconfig
@@ -0,0 +1,15 @@
+BR2_riscv=y
+BR2_KERNEL_HEADERS_5_13=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maixduino/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-common/busybox-tiny.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
new file mode 100644
index 0000000000..47eb6fc7ae
--- /dev/null
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -0,0 +1,14 @@
+BR2_riscv=y
+BR2_KERNEL_HEADERS_5_13=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maixduino/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_EXT2=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
