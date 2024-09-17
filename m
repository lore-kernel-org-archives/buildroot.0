Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB0DC35FF3
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 08:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BF6340190;
	Tue, 17 Sep 2024 08:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdDPH4Hm25ou; Tue, 17 Sep 2024 08:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A6DF40231
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A6DF40231;
	Tue, 17 Sep 2024 08:42:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04AB71BF276
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 08:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0175180EA4
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 08:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKLdEk6DY4YS for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 08:42:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=983e09248=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B77C280E7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B77C280E7C
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B77C280E7C
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 08:42:16 +0000 (UTC)
X-CSE-ConnectionGUID: q6d9B9qvRj6zJgs3IHbFUw==
X-CSE-MsgGUID: /hre5RB0QSWnNX1jggiF6Q==
X-IronPort-AV: E=Sophos;i="6.10,235,1719849600"; d="scan'208";a="26224862"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2024 16:42:15 +0800
IronPort-SDR: 66e932bb_OOfht6DIiV0E9JZW/j3/9BFHl1NPhD687bNMFwBFLpV+Uay
 7iyS0f2En9d384UvJx2BxA5zhvcqvGPW05f7Ygw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Sep 2024 00:41:47 -0700
WDCIronportException: Internal
Received: from 5cg02216fz.ad.shared (HELO ryzen.wdc.com) ([10.224.3.65])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Sep 2024 01:42:15 -0700
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 10:42:03 +0200
Message-ID: <20240917084203.998272-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1726562536; x=1758098536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H28/qmt6mqMQHrucGaanCN2diMOVuYvQDI3f7UDh6wM=;
 b=h5+0C8Vm4/a2Afdkwh34tKhS+iptYz8mZ5Qxa3IhzwhYlEI6FjCic/sc
 VcStFk0X7vmRn9n2zPlvc89N3XMyuUJdh0iX6HtuwY/eihEgigEa+7q6u
 Dl5X+ulW86rWHkmUYXXrn+heGzo32idmU8kt6Z+M1XOAGNdNriRR8MKCk
 q5vZhAjN6U0LU/tmqenJVYBFnFK5aaVYuzK8MMKE7KpvLMH84tjulMuMr
 QebFXY1kiMdaH1QPreY2zooTe7fHL9ncSj7BZGSesgWFCByLOyl//RoMq
 UuSUOVUtA93oAnPuNDTx5dWqwh2xHcS3IKAHBQd2m8zBtwsj0NG0Rz/Sz
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=h5+0C8Vm
Subject: [Buildroot] [PATCH v2] configs/rock5b: enable uboot-env on the SD
 card
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
the default environment on first boot.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Changes since v1:
-Use a uboot script to write the initial environment, rather than relying
 on BR2_TARGET_UBOOT_INITIAL_ENV (output/target/etc/u-boot-initial-env).

 board/radxa/rock5b/boot-env.txt    | 8 ++++++++
 board/radxa/rock5b/genimage.cfg    | 7 +++++++
 board/radxa/rock5b/u-boot.fragment | 5 +++++
 configs/rock5b_defconfig           | 5 +++++
 4 files changed, 25 insertions(+)
 create mode 100644 board/radxa/rock5b/boot-env.txt
 create mode 100644 board/radxa/rock5b/u-boot.fragment

diff --git a/board/radxa/rock5b/boot-env.txt b/board/radxa/rock5b/boot-env.txt
new file mode 100644
index 0000000000..922e964734
--- /dev/null
+++ b/board/radxa/rock5b/boot-env.txt
@@ -0,0 +1,8 @@
+# Having the uboot environment defined in eMMC allows the user to use
+# the uboot setenv and saveenv commands to make persistent changes
+# (e.g. to change the boot order, or to set a server IP for PXE boot).
+#
+# Write the default environment stored in the uboot binary to eMMC on
+# first boot (since by default, the eMMC environment will be empty).
+write_env=if test -z "${board}"; then env default -f -a; saveenv; fi;
+bootcmd=run write_env; run bootcmd
diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
index 43bb65bdd9..30d8732e55 100644
--- a/board/radxa/rock5b/genimage.cfg
+++ b/board/radxa/rock5b/genimage.cfg
@@ -11,6 +11,13 @@ image sdcard.img {
 		offset = 32K
 	}
 
+	partition uboot-env {
+		in-partition-table = "false"
+		image = "uboot-env.bin"
+		offset = 16M
+		size = 64K
+	}
+
 	partition rootfs {
 		partition-type-uuid = L
 		image = "rootfs.ext2"
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
index b88d8c5da3..6017b4d53e 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -15,6 +15,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
@@ -46,6 +47,10 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/radxa/rock5b/boot-env.txt"
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
