Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1534ECA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 10:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C88A060817;
	Mon,  2 Sep 2024 10:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MCLqtWnI7AD; Mon,  2 Sep 2024 10:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C7AD607FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C7AD607FD;
	Mon,  2 Sep 2024 10:44:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E96111BF279
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAD4A607E9
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjvPVncp48Bb for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 10:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=968e9b7b9=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C799E607D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C799E607D2
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C799E607D2
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 10:44:51 +0000 (UTC)
X-CSE-ConnectionGUID: t4WiJKJmTkemrFbZDyKurw==
X-CSE-MsgGUID: uOO7CXeiT02nxAkxYdUHRQ==
X-IronPort-AV: E=Sophos;i="6.10,195,1719849600"; d="scan'208";a="26096232"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2024 18:44:51 +0800
IronPort-SDR: 66d58909_B4pPZsN8ycXUsvB6GKdlbJZqM1xScD1quCkbjnb3YIPcwZi
 RIUEsn+hEOrVFhRVPyApusahl4gcS7uuZ+GW6rg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Sep 2024 02:44:41 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.224])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Sep 2024 03:44:50 -0700
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 12:44:31 +0200
Message-ID: <20240902104433.2561797-4-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902104433.2561797-1-niklas.cassel@wdc.com>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725273891; x=1756809891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WVz063qQizgDs9WhlqeQ+Fj93RQAoaxxc8p9n1KWU08=;
 b=dDtfoht3O/rG6LWizn3Wnbt93RCNdqbF6CLIHAs8GJsALrLsmt7TGL96
 X/Y9aKPrmQC2pBJJ0Kz4xAMAFP0eQd4DB+mI5zhKbx7noEBlnpm+SL2R0
 G2Zbbu8Imr5/ztFJ0s9TXkWRO6t5zI4dTZiSHfwpsfBTHWciqYtI4d/Hn
 ziMcIp571u9C8JVeRWyLwUrKjUxWPM7pG0VlvW6WqlngZwhHykkIl+Il6
 92UvVBlqfD/HH6uT1jbbvxnnKnpDw9Suzt+V2VGSOoRvYYG0JrUMgx6Ie
 aRrdQwEnd7JXBTludEtfywlQhLyR61MHf46mIUOQv7+QlW1XoSv8JrxMD
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=dDtfoht3
Subject: [Buildroot] [PATCH 3/5] configs/rock5b: enable eudev to enable
 automatic module loading
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

The arm64 defconfig enables both the R8169 Ethernet driver and the
PHY_ROCKCHIP_NANENG_COMBO_PHY PHY driver as modules.

Enable udev so that these modules will get automatically loaded by udev
after the rootfs is mounted from the SD card.

This way, we do not need to build these modules as built-in, and we also
get the benefit that any device plugged in to the PCIe slot will get
automatically loaded.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/linux.fragment | 2 --
 configs/rock5b_defconfig          | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)
 delete mode 100644 board/radxa/rock5b/linux.fragment

diff --git a/board/radxa/rock5b/linux.fragment b/board/radxa/rock5b/linux.fragment
deleted file mode 100644
index 90f2f291ba..0000000000
--- a/board/radxa/rock5b/linux.fragment
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_R8169=y
-CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 899537c001..bcc2b68f6c 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -34,7 +34,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
 
 # Filesystem
 BR2_TARGET_GENERIC_HOSTNAME="rock5b"
@@ -46,6 +45,7 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock5b/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
