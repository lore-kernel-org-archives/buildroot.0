Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F239C4320A
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:42:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D6E60F5C
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48D6E60F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C36B6067E;
	Mon, 30 Aug 2021 04:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtdYraAgMZ9X; Mon, 30 Aug 2021 04:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1266C606EF;
	Mon, 30 Aug 2021 04:42:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 404DF1BF2F4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DCEE6067E
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPqITpjQ_AfX for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 04:41:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE61460759
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630298471; x=1661834471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cF+Wu5R2Haz+8r1wawZUTcvf67T/32+97UgtJEsZxjM=;
 b=EyalwbiKEaVJET+UfjxzyzOl7vrnf3HhATVX7c3SgyKb45RJaQ3L5EM3
 r61qVhRR7KTDYB15dHm0wJtx1c8DLfP2X2pl3HtYcCoJzHbjaaAxZm3oj
 bL9cXantcQdP8nzIXHb3K/xMqlONlgvy1HrqhJ9aWGNUdU2TPGyQNubb9
 jy17yMKaikb/uusw24tNqXYy6oNWwN4q2yrdxOl7tPHmLuWzSLx3hOKMx
 JmyOa+clxrdHbgq66Ht5VZTx2oRi5Ey1Lurwkh7+LwLsEn75+W7DkRay2
 qIypl0eJpaB6dge3QlkTanFyb8Yuy0o65XPORzt/M+eXo2pIOoRTqLh5y Q==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="177842512"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 12:41:11 +0800
IronPort-SDR: dxqxbt9CjUnTWk1F1O9X4aatZtRrfiSmFJcqOKuWLUgk2krvmRORQXe8/VbDXDz08sCjy8/Icf
 d0n41EanRwXpzm0my3tY0zFm4JYuC/AKS8BnSLeCSwSOxA2kaWzGwql2CnLMZi2T6ijdXmmNSh
 8WiS0dbXB9mxGgozxDVB/RBFzzQD+naxDBZaC+T5mPLOXN16eKq7/kXpxgy3Ov9Lttu07tiDCD
 /SRDTiQ5G5y/caeiUA6JnlEhCmo1bKqo6No2bQgjKylhn2VBMtCDEH+Yk2Z2MgT15W9UIttfFV
 AJX69L+NMIrqWRMFvnDyrh8e
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 21:18:02 -0700
IronPort-SDR: no3E+ZohNMDNGhe27UZjBxf3jzY9lJOk4IAiWNaTNAkS3l2Ke1m+6EO6jpR8XiTBPG+UimwkP+
 uzdYoFceEAqoQbiJrkoKMo4NbdmO+XDAQFIBJD0CXCkvNYheAMeXRx1AwoHENHFpeIWJkIv5R2
 1hd/VsKDFhQNPw8xb3FpTVAhc56EU7jKhQcd4P8mp/LE3tlN8Ugaip/XEz6RAp9jyCjtS6R6xb
 /L8abzcKytbhV/Dkkdw3eFWpZzYNH3XUt5nVWQy3loBEMnYHu7Qotg4PovPY9VaaHhHORJ3QDU
 cSE=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.119])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Aug 2021 21:41:10 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Aug 2021 13:40:59 +0900
Message-Id: <20210830044100.260173-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830044100.260173-1-damien.lemoal@wdc.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 8/9] board: Add Canaan KD233 support
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
SoC based KD233 development board. These configurations are similar to
the configurations defined for the Sipeed boards, differing only by the
built-in kernel device tree used.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 board/canaan/kd233/linux-dtb.config   |  2 ++
 configs/canaan_kd233_defconfig        | 15 +++++++++++++++
 configs/canaan_kd233_sdcard_defconfig | 14 ++++++++++++++
 3 files changed, 31 insertions(+)
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
index 0000000000..cabb6aa4f8
--- /dev/null
+++ b/configs/canaan_kd233_defconfig
@@ -0,0 +1,15 @@
+BR2_riscv=y
+BR2_KERNEL_HEADERS_5_13=y
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
index 0000000000..c57418674f
--- /dev/null
+++ b/configs/canaan_kd233_sdcard_defconfig
@@ -0,0 +1,14 @@
+BR2_riscv=y
+BR2_KERNEL_HEADERS_5_13=y
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
