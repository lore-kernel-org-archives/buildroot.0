Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F786CF34AD
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 14:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE14884101;
	Thu,  3 Oct 2024 14:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5-3UAAdMo0l; Thu,  3 Oct 2024 14:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DA40840AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DA40840AA;
	Thu,  3 Oct 2024 14:01:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79E311BF311
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 14:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66B7C81FF2
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 14:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maitnrlv4i03 for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 14:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDB9E81EBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB9E81EBC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDB9E81EBC
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 14:01:06 +0000 (UTC)
X-CSE-ConnectionGUID: 2VsXY5o7QN2OYJqriCPoIg==
X-CSE-MsgGUID: 7VX/cTKjSySwFY/3+dw68A==
X-IronPort-AV: E=Sophos;i="6.11,174,1725292800"; d="scan'208";a="29066272"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2024 22:01:06 +0800
IronPort-SDR: 66fe9561_o1K+2/zkduMpwBn1Y6B/Y236740x5XFUjFSwPHjJ6m4UQVq
 gBYknwezWwYDRzi17r4PLbM42fXPGbJZf1t18vA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2024 06:00:17 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.lan) ([10.224.3.161])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Oct 2024 07:01:05 -0700
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 16:00:54 +0200
Message-ID: <20241003140054.250140-5-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003140054.250140-1-niklas.cassel@wdc.com>
References: <20241003140054.250140-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727964066; x=1759500066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E8kWDhxAKzyPyVWDqNoIIDscMyCqC1NIyq4UsmeP6cY=;
 b=VM1JLXGj1xFIGJ4GbU/AYPi1Jmh6Mhb032ZTFYdxrSmZpnE1rlNOllov
 3Z1W8EgpWYanD6+dHbZVkHqRaoTkpUuMr6AiG2uRW0o6IH54v17K12aE+
 lks1FlnGd0xUoYOZENdY23O3ZGVoZ8j7IIOtsLk9Ri1zxuNMLbk9XzuH5
 18wkCIUP/daD9wFTLgVNGvZGhIqf28j9co3QDCYr9hIogKwt8wH06o1Mu
 UU0aJdLizIH3ZjYiNrhsWBHdy6dNXI7Y5jdv2u7voStP5q81yYFdq9Iiq
 UF0uzwU9KggCE9MSNZbD5vgUXGvJa10A4f8dZmTCIXQpsOJ0bIuly7NcD
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=VM1JLXGj
Subject: [Buildroot] [PATCH 4/4] configs/rock5b: enable uboot-env on the SD
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

Unfortunately, genimage does not allow you to use
in-partition-table = "false", without also specifying an image file.
Thus, instead specify size and offset to partitions in genimage.cfg
so that they cannot overwrite the uboot env.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/genimage.cfg    | 2 ++
 board/radxa/rock5b/u-boot.fragment | 5 +++++
 configs/rock5b_defconfig           | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 board/radxa/rock5b/u-boot.fragment

diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
index 8c56251135..43cf661551 100644
--- a/board/radxa/rock5b/genimage.cfg
+++ b/board/radxa/rock5b/genimage.cfg
@@ -9,9 +9,11 @@ image sdcard.img {
 		in-partition-table = "false"
 		image = "u-boot-rockchip.bin"
 		offset = 32K
+		size = 16352K # define size so that we cannot overwrite uboot env
 	}
 
 	partition rootfs {
+		offset = 16448K # 16MB (uboot env offset) + 64KB (uboot env size)
 		partition-type-uuid = root-arm64
 		image = "rootfs.ext2"
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
