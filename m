Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA958ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 18:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFE3940921;
	Mon,  9 Sep 2024 18:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tC5vHkNf-nW2; Mon,  9 Sep 2024 18:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E076740931
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E076740931;
	Mon,  9 Sep 2024 18:21:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF8791BF33E
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 18:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91F6D80523
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 18:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2yXknAEHEAT for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 18:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=975aea9dd=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D35C180527
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D35C180527
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D35C180527
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 18:21:16 +0000 (UTC)
X-CSE-ConnectionGUID: p5Dx13sZTuuKZ+xwHqIYdw==
X-CSE-MsgGUID: qtY87STcR4i12/COt21Xfg==
X-IronPort-AV: E=Sophos;i="6.10,214,1719849600"; d="scan'208";a="27081571"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2024 02:21:16 +0800
IronPort-SDR: 66df2fbf_kCGr4hh1nhT5bERlbp9nF7cS9RnKAj5eJ7N89AoZXs0Ux+q
 gVLLcRxXo6hWfEPzmhLxHhhLCZQ4Z16T3WqFCWg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Sep 2024 10:26:24 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Sep 2024 11:21:14 -0700
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 20:21:03 +0200
Message-ID: <20240909182103.3667296-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909182103.3667296-1-niklas.cassel@wdc.com>
References: <20240909182103.3667296-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725906076; x=1757442076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LjnpuLwBGnw7giV3O0lmLh2mpO4W9pHnu+ZZdStHXBI=;
 b=XQOv5OzjdhJo7zGHfUVmyosdwP6MPsVN5/C5WsOhdbd5P7ZDkH2jkp+T
 TZbcQdey3elIXSpnXzKetrcsPl25v3tv8BggQCSZzCsuD1RgX7IG9gTVU
 rxgx0difEQV9YaIBA2asXGdkI4P32htQ7jpngfBCtjwxn7V8t7koHTvBv
 Fnwe118vX0QqJctFFomKtpQXnKR49Tzwunvy4EdnOx4tYfwT4cMTBodnx
 C0xfg3FXCmrQBtSikt9GKc+BnWnCPhZ3kNfYsLaOTSSlKsMzmOWgAYTQl
 bRFdT+ac9CuN/Ld3NKycRHw8dkKP8DHJpKAS7JMC44klKGr5D8wO8MttD
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=XQOv5Ozj
Subject: [Buildroot] [PATCH 2/2] configs/rock5b_defconfig: enable uboot-env
 on the SD card
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

Having the uboot environment defined on the SD card allows the user to
use the uboot setenv and saveenv commands to make persistent changes
(e.g. to change the boot order, or to set a server IP for PXE boot).

Since the SD card environment is empty by default, initialize it using
the BR2_TARGET_UBOOT_INITIAL_ENV (output/target/etc/u-boot-initial-env),
which contains the default environment for our board (extracted from the
built uboot binary).

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/genimage.cfg    | 8 ++++++++
 board/radxa/rock5b/u-boot.fragment | 5 +++++
 configs/rock5b_defconfig           | 6 ++++++
 3 files changed, 19 insertions(+)
 create mode 100644 board/radxa/rock5b/u-boot.fragment

diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
index 43bb65bdd9..cd6c4e2dd4 100644
--- a/board/radxa/rock5b/genimage.cfg
+++ b/board/radxa/rock5b/genimage.cfg
@@ -9,6 +9,14 @@ image sdcard.img {
 		in-partition-table = "false"
 		image = "u-boot-rockchip.bin"
 		offset = 32K
+		size = 16352K # 16MB - 32KB
+	}
+
+	partition uboot-env {
+		in-partition-table = "false"
+		image = "uboot-env.bin"
+		offset = 16M
+		size = 64K
 	}
 
 	partition rootfs {
diff --git a/board/radxa/rock5b/u-boot.fragment b/board/radxa/rock5b/u-boot.fragment
new file mode 100644
index 0000000000..e332bc0c79
--- /dev/null
+++ b/board/radxa/rock5b/u-boot.fragment
@@ -0,0 +1,5 @@
+CONFIG_SYS_MMC_ENV_DEV=1
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x1000000
+# CONFIG_ENV_IS_NOWHERE is not set
+CONFIG_ENV_IS_IN_MMC=y
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index b88d8c5da3..50f58d379d 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -15,6 +15,8 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
+BR2_TARGET_UBOOT_INITIAL_ENV=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
@@ -46,6 +48,10 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="output/target/etc/u-boot-initial-env"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="65536"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock5b/post-build.sh"
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
