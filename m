Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947CFCF34C3
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 20:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6375A607E2;
	Thu,  3 Oct 2024 20:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsaeC_uE6XwG; Thu,  3 Oct 2024 20:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E89616119C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E89616119C;
	Thu,  3 Oct 2024 20:45:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AC741BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32EC0607E4
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4H_knuuIEogX for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 20:45:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63D9060812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63D9060812
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63D9060812
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 20:45:30 +0000 (UTC)
X-CSE-ConnectionGUID: SbUDSta7SMK+8PPA48jUZg==
X-CSE-MsgGUID: UQuqaRulRci+nL8TTvYltw==
X-IronPort-AV: E=Sophos;i="6.11,175,1725292800"; d="scan'208";a="29091920"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Oct 2024 04:45:29 +0800
IronPort-SDR: 66fef56f_Ew7whAEdLWd+GdZi8XNJUKlmaziqbjsTh3EC8YI6fSVQOLS
 ViLYklGNcDbMjQQqjSYTP/GDsllSfaLWZUzPcHg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2024 12:50:07 -0700
WDCIronportException: Internal
Received: from 5cg1443rlm.ad.shared (HELO ryzen.lan) ([10.224.3.162])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Oct 2024 13:45:29 -0700
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 22:45:15 +0200
Message-ID: <20241003204515.403551-5-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003204515.403551-1-niklas.cassel@wdc.com>
References: <20241003204515.403551-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727988330; x=1759524330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aw12AagXzctspQAbd3xXadJxqINP3qVn3q1swQHcI4o=;
 b=cS2rKA4RToIdJdCLTK75woDaDlAwHghtMooJdQ6v9kq+6GUAMXCA1ccd
 sz8y3m0+oE30bxuRlEqktlMD4BCBpEFezAvkIkkp0fX9a6p+/pIfIPa/p
 LeZfkietb5y7ClTxD3L+H3z1BEPGmowOaLFf31gHkb7cGcYIIlbj1DY98
 ZcIruMOqsEoqmw+P2x4K+72f874LjEjl8jCXw9EQZAP+Uoj6Half95HkT
 AOm1BfWaO+tVo1uRNXf5dhv4YkObRX8zuFH9i1xqjDDRmnd7AVlqJ0g9H
 Sc4mwwIdx1hfMq/mKmuRLpTSC4FtokNYeQTdhj9yPnbr2pZ/Gr0ldybUw
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=cS2rKA4R
Subject: [Buildroot] [PATCH v2 4/4] configs/rock5b: enable uboot-env on the
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
Changes since v1:
-Define a uboot-env partition instead of using size + offset tricks in
 genimage.cfg.

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
index bdf3c5a27f..bcbe336840 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -32,6 +32,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
