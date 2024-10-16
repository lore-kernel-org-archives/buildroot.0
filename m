Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B397D1AD56
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 13:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 327B881171;
	Wed, 16 Oct 2024 13:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMYz0CfENR0A; Wed, 16 Oct 2024 13:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16A5781175
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A5781175;
	Wed, 16 Oct 2024 13:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 895851BF306
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77E81406A0
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbi6RqA6t_aA for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 13:24:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=012b9cad8=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DD7C406A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DD7C406A4
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DD7C406A4
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 13:24:57 +0000 (UTC)
X-CSE-ConnectionGUID: OJlTTSwrSeKBolgigST4vA==
X-CSE-MsgGUID: uqdfpoS9Q+CFfjkqFHUJcw==
X-IronPort-AV: E=Sophos;i="6.11,208,1725292800"; d="scan'208";a="29192776"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2024 21:24:56 +0800
IronPort-SDR: 670fb058_za6YT+irKV0m33MnsYRoJOc1x+ELG5Os6SYbRBrzjDwuUeD
 tctjGHlbtYiiqr1kKaccRJi6DnUzCeLTQXnV6wA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2024 05:23:53 -0700
WDCIronportException: Internal
Received: from 5cg1421gq2.ad.shared (HELO ryzen.wdc.com) ([10.224.3.238])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2024 06:24:56 -0700
To: buildroot@buildroot.org
Date: Wed, 16 Oct 2024 15:24:43 +0200
Message-ID: <20241016132443.3859149-5-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016132443.3859149-1-niklas.cassel@wdc.com>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729085097; x=1760621097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bupu/YYn7mBuwuESv4ITmiBwra2g9Hv+RznhY/4HR+g=;
 b=Fy++cIReOjxqxM2kwlD/+rMzrthCwWB+paslv62Sz5py2jyQnbl64Am2
 fjKOqc3pZd2iZp/mqvFMObKif9nRfCKitrfV8q/DfV1EY/Amx+qxpzuX7
 4lvdJYSBxtz7+I3xko5Vvz0dR8/KsInaLUGoy8udkkVudvQ5vvwsDeXcu
 S2dCStKkfSKl+ElXolet4cteXF4RSEcV3W3QZ68mxoWThDN5fuCHJhNQn
 Wl6r5Nra4BOiwechu7q73UqsOwIu36KFYc+0bqh5J3H2TFz1fheYUCzS7
 WeoqmlBrbAO3X0LKol2EzWpqEol3qWThwc/67+N69UUSMSKkNrk4mf95l
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=Fy++cIRe
Subject: [Buildroot] [PATCH v3 4/4] configs/rock5b: enable uboot-env on the
 SD card
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
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

Having the uboot environment defined on the SD card allows the user to
use the uboot setenv and saveenv commands to make persistent changes
(e.g. to change the boot order, or to set a server IP for PXE boot).

We need to mark the root partition as bootable, otherwise uboot will no
longer be able to boot the partition by default. (Most likely because
the root partition is now no longer the first partition on the device.)

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/genimage.cfg    | 6 ++++++
 board/radxa/rock5b/u-boot.fragment | 5 +++++
 configs/rock5b_defconfig           | 1 +
 3 files changed, 12 insertions(+)
 create mode 100644 board/radxa/rock5b/u-boot.fragment

diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
index 8c56251135..8ec7780c6c 100644
--- a/board/radxa/rock5b/genimage.cfg
+++ b/board/radxa/rock5b/genimage.cfg
@@ -11,8 +11,14 @@ image sdcard.img {
 		offset = 32K
 	}
 
+	partition uboot-env {
+		offset = 16M
+		size = 64K
+	}
+
 	partition rootfs {
 		partition-type-uuid = root-arm64
 		image = "rootfs.ext2"
+		bootable = true
 	}
 }
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
