Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094CCC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:26:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9CF860FC2
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9CF860FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C87404EB;
	Tue, 26 Oct 2021 07:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dOY2bIaM1zxK; Tue, 26 Oct 2021 07:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB6BE404F0;
	Tue, 26 Oct 2021 07:26:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0811BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D70F940259
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7rDcMSD8SiFl for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 07:24:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 520664023F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635233080; x=1666769080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5CjqeVdXYrpOSEKEuWn5l4oPaFXrOOaR+tJ9o1OVMlg=;
 b=jIx79ycTLj8geRVHfHrxDOSfCQ+iSMCOWoanwkE9L7ZOcNQdalf9mO3c
 QWBKIJS/qbLuwiXobrmgnwKnjKepPqquE1iAaBAtOdEXtRIJpXd5bsJYH
 z8mwCvWWCN3yyvp9Zz/9yOE5Zbaai+xEGfExvDLBHHwmKGTpVzyfpJdjg
 ADjOjX98qxUMWF6nw7tnQ31rlJqX6/17SBBMAJD/Fa/46FwsQcGTqQDpi
 Oxw3a0I5QBpEH/UTAk8oHCTKnskFIoCSnprpqoRnpxLkuaCS3N89O/QW7
 KAlzdP2hiLLr3hF4doQ46TFU5egXgIrspaOdVTBW0in5v/gGbFeViRV+D Q==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188623077"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 15:17:35 +0800
IronPort-SDR: xP4hSEXg4sHcQn0C8ss3ohBCGmCTeJOhmEl5t1a8WmEvbXIPnc1LwA+CDSrq77M+KaZxG6DWnq
 wSy7TCrQLYrsxRGBEhk+6/pHh2hs0oWaOcPx8cjDldALGz4zN4p4XlZZtqZKn45YUapiPbQJDc
 byEV2oGj0w2xgLHvgw2xk7I5KvDswfMolb/VlzX0b/X0BgSwawjlrLJ29ywAJMxr5z781RzMUD
 9sDrc3L4RC6Ew2qw21Cz1Iu+4wUWHyGqeYrQWMj97nMHK5ilDezcR8xgkq0GrK/27EeRnrkmIm
 Tiwf204aj3KaVeroSEQNouur
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 23:51:34 -0700
IronPort-SDR: VuxW002Dl2waduCcygGIpyRMEffjW8RAkHbXEs5IWQqPwSX/Wn+/gu8cOdNi2zx24MU0RZoMWY
 +63eA6NllZP8zLHdo+W0DPpREHv4vXI6aEkdUjfurDcxJzf0inpJfLFk7A1eKBcp4RoZDQNW/P
 BAIxU3Zhi1Zt/mepNBan15eMXN9mfvCxVtNByRFO71YZvzBYwY2IdrCy6FqzpXWgVXbbNSmfAk
 Eh5z0WQLvtbr4Npq4QH8yZ0PSZFOGY4cY5VpzR9BAndMoFkGu/XEC4YTzt7Q9akVamw03S+7T/
 B6g=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2021 00:17:37 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Oct 2021 16:17:25 +0900
Message-Id: <20211026071728.954356-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026071728.954356-1-damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 07/10] board: Add Sipeed MAIXDUINO support
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
SoC based Sipeed MAIXDUINO board. These configurations are similar to
the Sipeed MAIX-bit board configurations, differing only by the
built-in kernel device tree used.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 board/sipeed/maixduino/linux-dtb.config   |  2 ++
 configs/sipeed_maixduino_defconfig        | 14 ++++++++++++++
 configs/sipeed_maixduino_sdcard_defconfig | 13 +++++++++++++
 3 files changed, 29 insertions(+)
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
index 0000000000..c353b1fc2a
--- /dev/null
+++ b/configs/sipeed_maixduino_defconfig
@@ -0,0 +1,14 @@
+BR2_riscv=y
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
index 0000000000..dc9644f928
--- /dev/null
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -0,0 +1,13 @@
+BR2_riscv=y
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
