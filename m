Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D07C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:42:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1289A60F5C
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1289A60F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3BB140443;
	Mon, 30 Aug 2021 04:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5R2KyojVPYce; Mon, 30 Aug 2021 04:42:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8981540436;
	Mon, 30 Aug 2021 04:42:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39DD91BF2F4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 375876075B
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ceftuBZCb7G for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 04:41:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D79A6067E
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630298468; x=1661834468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WMghBbbAyJCOMQsFDntiDRZAp9Jj4aAhmtR57Kma/bo=;
 b=FqccKzDnZ69jftgF1cikr2s53qQQQIdicRroydvT+3OhHu4XJlI0yaOz
 9zLunOaU83bB/1pJMhpF+ZySXYr/yvP8ituJZF3tvmKSWJvkghAlZoU76
 +FxRCzy++ttp7mWQfhF3kvySMMsh4jUj7avtQBwPeSuU85cZuDmnjT4F/
 X5BlBMMpxy5kNDfRla1YnAhycxPPjDu/ywuSXBDyrR/X1SVuwuLX7GlTj
 KrXKJRQsyXOd7wqHi3lUU8SvA2awXEE+9cyedBCTXnfbNxeK4MnoxzXU5
 PnrKt5FeSAQv4KGDSY3Ph81mdYyAs1k6Lut1EQIefeTbIDC/vhWJHWVDc Q==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="177842500"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 12:41:08 +0800
IronPort-SDR: 3aVUVPgQSe1ACdqfIly5QXenv7dQx0i/4JhX3vVar1rfkZmDd9OtABAybC/zjb1An3WmpPdXB1
 zNeDq+sWYisYG/7UqszF3AE9nTBazi5RdZ2XInNcTNagXYbSxjb8RrzNa9ZlspGUfhAFB9+gDw
 FuCygu5NYAsSHsX5bCUkelS+6zEsGSrmfaxV2r7GNayIR6rfxotO0dV34wpS7R76WhCMHej0Fl
 W9O4+P12BNt3N8GcMdjGZzNCsOHi08qQLKuzDXlxmBrhYr6YO3SY8ChMnHNZW0fvc0cyrdsU1O
 SF1UuMafmGwM/pvJsRRYMQMY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 21:17:58 -0700
IronPort-SDR: ImG9j8meeDxmd+yx6Z8lU8NZMo9cEo7Tjzmfd1ZQaAsJFofQGzVM2ESkyCWFB7AeFtMUow+iCF
 ZRaTkrfvpeLCVZf8Taz7hnjAZqXxl6thobsmbaL9rgT9WWK6j14XkgsbU9rB/BXa3quR5rHLwI
 BxhBU/aKi3SXs8Xy70MJWF3WpGQMEbHB5wo+ppqq0kjQKRb8YIStRQucc1DVKitx2WphliYM1Q
 Bnt/yLglsMaNMuPyVQkDZsphwvjcPPbh8Z+Aog3WFBB9OxdrHHaq3vTg4iwh0fPBLEEgWQeGtq
 QaQ=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.119])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Aug 2021 21:41:07 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Aug 2021 13:40:56 +0900
Message-Id: <20210830044100.260173-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830044100.260173-1-damien.lemoal@wdc.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 5/9] board: Add Sipeed MAIX-Go support
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
SoC based Sipeed MAIX-Go board. These configurations are similar to
the Sipeed MAIX-bit board configurations, differing only by the
built-in kernel device tree used.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 board/sipeed/maix-go/linux-dtb.config   |  2 ++
 configs/sipeed_maix_go_defconfig        | 15 +++++++++++++++
 configs/sipeed_maix_go_sdcard_defconfig | 14 ++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 board/sipeed/maix-go/linux-dtb.config
 create mode 100644 configs/sipeed_maix_go_defconfig
 create mode 100644 configs/sipeed_maix_go_sdcard_defconfig

diff --git a/board/sipeed/maix-go/linux-dtb.config b/board/sipeed/maix-go/linux-dtb.config
new file mode 100644
index 0000000000..ea8c30e266
--- /dev/null
+++ b/board/sipeed/maix-go/linux-dtb.config
@@ -0,0 +1,2 @@
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="sipeed_maix_go"
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
new file mode 100644
index 0000000000..8ce2258e96
--- /dev/null
+++ b/configs/sipeed_maix_go_defconfig
@@ -0,0 +1,15 @@
+BR2_riscv=y
+BR2_KERNEL_HEADERS_5_13=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-go/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-common/busybox-tiny.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
new file mode 100644
index 0000000000..6f1c2316d2
--- /dev/null
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -0,0 +1,14 @@
+BR2_riscv=y
+BR2_KERNEL_HEADERS_5_13=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-go/linux-dtb.config"
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
