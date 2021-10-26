Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1191DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:25:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DC7161040
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DC7161040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70797403A7;
	Tue, 26 Oct 2021 07:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kB_O0YvIDco0; Tue, 26 Oct 2021 07:25:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 793FD40225;
	Tue, 26 Oct 2021 07:25:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 232F31BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1292B40257
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Q6Sk1xCuwee for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 07:24:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8414D40234
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635233078; x=1666769078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jRcr3kvC9DB0dBW89FGwop7dIQ6CmKDQllrLA6/vh2w=;
 b=RYW0zbYzrJBZdgOvS1SaVuDuj0J1CcEa98RlDEQdrhBRSESiMIUmTy2/
 cxplRsBO0mFFk0n6yRNoYTo6QiylUZnRadLx52p044Zj5foUPCinjhTcJ
 v2aYmw6YSuvBECOBLNI7I88KIWWMfLyFgDStM2PvNnkuBj7FtSaL5AfrW
 Xg7VJYQXTgs5JhmkqKWjtMlJju0xEw1/Arx1VlL69p2Q/6Q0RTgvhYYS5
 v/gOBZGfDwyWc5WkHmcSyLnogTP4TPFg5Gil3mgsqergmbsdBNiDDYR+u
 nBnudQOmjLMnqWgpuAKmSuObXglm5ldVkLdBQA3hWQNJGyvE5+g5g4kXA g==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188623074"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 15:17:34 +0800
IronPort-SDR: oIN/RbVWgnXj0rvQ98J003dXSDeZnIF/kJPgJDFDhPhLCcZU62eWewfv+pnkwGsuVDy+xGItJF
 CCHM6ywJxLU8Uwvt8Xevy7FG6qm1jWnwWE80T0nYjImZkcsCWun1iL9OwP+cXAVT75ZhMl+GEN
 VMawdcBoCVHUP9jKXVc2QX3jN0P3MQLFaeYCBUGdsaZtqiV4zbXxKNGOrrMtSuxt24WnZdu/At
 7vJO5njPrNaBJUrh3KFW1JlzoOl01V2Ic8G2MAqYSQfLIpzd74OZm0Ta5PMATuZ5PLE5GPfpK9
 DWNZ373++FLS1AwOzHWBZAM3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 23:51:33 -0700
IronPort-SDR: 2UF+wcEyIYcQXsO7YsCjVKQFNpRec/zVs557ujnXKT5gcBJCEE8L7wSWaBT/S3skhnrweQUQmS
 NXnk30xDYV8aS6I6RmL4uGUMknBEBRWHwI5umkhNolLeFyFF3yomwpLE/4A0SnyJ5VtOT7JGxX
 EVL+LLYc8cJLaa7EQEo7X7uDkpjUSR7q6D2FdD4fiy8iop3ApR6yblHEa9w6s0wX3VZF0NThpZ
 4QPYUuVTaBOV40hmg9QU+CwuwMgk5zw8yWOfu1Dow3lcy7CaLJbgjRhvwzJB/JxFTjfPr/toO8
 AKg=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2021 00:17:36 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Oct 2021 16:17:24 +0900
Message-Id: <20211026071728.954356-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026071728.954356-1-damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 06/10] board: Add Sipeed MAIX-Go support
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
SoC based Sipeed MAIX-Go board. These configurations are similar to
the Sipeed MAIX-bit board configurations, differing only by the
built-in kernel device tree used.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 board/sipeed/maix-go/linux-dtb.config   |  2 ++
 configs/sipeed_maix_go_defconfig        | 14 ++++++++++++++
 configs/sipeed_maix_go_sdcard_defconfig | 13 +++++++++++++
 3 files changed, 29 insertions(+)
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
index 0000000000..fd841c682d
--- /dev/null
+++ b/configs/sipeed_maix_go_defconfig
@@ -0,0 +1,14 @@
+BR2_riscv=y
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
index 0000000000..8a6d76ca0e
--- /dev/null
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -0,0 +1,13 @@
+BR2_riscv=y
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
