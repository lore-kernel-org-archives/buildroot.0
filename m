Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8CCCFA45C
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 18:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 006E9403B8;
	Wed, 23 Oct 2024 18:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jUOxLEguJmw; Wed, 23 Oct 2024 18:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C66C7403E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C66C7403E2;
	Wed, 23 Oct 2024 18:25:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9749527F2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62310403E2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YF7XoNNqyvtS for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 18:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=019871083=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 102AD403B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 102AD403B8
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 102AD403B8
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 18:25:17 +0000 (UTC)
X-CSE-ConnectionGUID: Mbl303/eTnGioHe233i68Q==
X-CSE-MsgGUID: Z0oKw3q4SMaeeGcx0DaX/A==
X-IronPort-AV: E=Sophos;i="6.11,226,1725292800"; d="scan'208";a="30188669"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Oct 2024 02:25:16 +0800
IronPort-SDR: 67193274_aWbp2WxMOhLJJoaiRoolUNEIoDzQ0Bnx4vwwruiggmQaKjH
 N7B0LDEBk8QuWAX/XPIVkxnfnSPfsD3nQLfvVLA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Oct 2024 10:29:25 -0700
WDCIronportException: Internal
Received: from chnhcln-1032.ad.shared (HELO ryzen.lan) ([10.224.3.8])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Oct 2024 11:25:15 -0700
To: buildroot@buildroot.org
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel <cassel@kernel.org>
Date: Wed, 23 Oct 2024 20:25:09 +0200
Message-ID: <20241023182509.2808544-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729707918; x=1761243918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9WYMhJO/duqNLlQDO2d4D3Uj8fY5N/thdnQRo2nBZ7k=;
 b=HH8h8oZdjfkNEzWk7PodtXBNx2mw5wDEwohFiUcsljrbAZYNj5Qyi/9h
 x9LibJwHCXF5pxdpKLJ2CFVEAk59SIG5ZpWtCtfS4d49W2dTKbKOhUwuK
 zvAdNYMp90iiPaPv6lwKwMr65THCwJx4CCiXyCI8LbWXzdCuymIPTYjW8
 EDyCUlA7UfJQtlkuWgWZtXDtMlFRw99aXFGdJ4rmJTJwWpG1lUdYNAugL
 ND/zzrpQWGbMkfncW/uzferfxIhadaQK7l2To79ioENytU1+BrGYoBGz8
 UgnKYS5xJ+npLKzSPutYpnGNHCchsVe5dJZSLb238BIqYpeLq9JUuLfTh
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=HH8h8oZd
Subject: [Buildroot] [PATCH v4] configs/rock5b: enable uboot-env on the SD
 card
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

Having the uboot environment defined on the SD card allows the user to
use the uboot setenv and saveenv commands to make persistent changes
(e.g. to change the boot order, or to set a server IP for PXE boot).

Set the uboot-env partition type GUID to "U-Boot environment", see:
https://github.com/u-boot/u-boot/blob/v2024.10/doc/README.gpt#L288
https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
and enable CONFIG_PARTITION_TYPE_GUID such that uboot will automatically
find the SD card partition to store/load the uboot environment to.

We need to mark the root partition as bootable, otherwise uboot will no
longer be able to boot the partition by default. (Most likely because
the root partition is now no longer the first partition on the device.)

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
Changes since v3:
-Use partition type GUID to specify the partition to use, rather than
 hardcoding an offset using uboot Kconfig CONFIG_ENV_OFFSET.

 board/radxa/rock5b/genimage.cfg    | 7 +++++++
 board/radxa/rock5b/u-boot.fragment | 5 +++++
 configs/rock5b_defconfig           | 1 +
 3 files changed, 13 insertions(+)
 create mode 100644 board/radxa/rock5b/u-boot.fragment

diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
index 43bb65bdd9..070cc03dc2 100644
--- a/board/radxa/rock5b/genimage.cfg
+++ b/board/radxa/rock5b/genimage.cfg
@@ -11,8 +11,15 @@ image sdcard.img {
 		offset = 32K
 	}
 
+	partition uboot-env {
+		partition-type-uuid = 3de21764-95bd-54bd-a5c3-4abe786f38a8
+		offset = 16M
+		size = 64K
+	}
+
 	partition rootfs {
 		partition-type-uuid = L
 		image = "rootfs.ext2"
+		bootable = true
 	}
 }
diff --git a/board/radxa/rock5b/u-boot.fragment b/board/radxa/rock5b/u-boot.fragment
new file mode 100644
index 0000000000..ceba8d609a
--- /dev/null
+++ b/board/radxa/rock5b/u-boot.fragment
@@ -0,0 +1,5 @@
+CONFIG_ENV_SIZE=0x10000
+CONFIG_PARTITION_TYPE_GUID=y
+# CONFIG_ENV_IS_NOWHERE is not set
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_SYS_MMC_ENV_DEV=1
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index d75ad585fb..af748a5d25 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -34,6 +34,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
