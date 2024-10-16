Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCB8D1AD56
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 13:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE67980FEF;
	Wed, 16 Oct 2024 13:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_dyCASvv09P; Wed, 16 Oct 2024 13:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C13CC81089
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C13CC81089;
	Wed, 16 Oct 2024 13:25:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2458B1BF306
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EF31406A0
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hevxqoIaHTA for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 13:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=012b9cad8=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4195E406A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4195E406A4
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4195E406A4
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 13:24:54 +0000 (UTC)
X-CSE-ConnectionGUID: iKA+90PaRFSNjjbBhEGpwA==
X-CSE-MsgGUID: 93qhXeAxQaaXF+o0nFqhGg==
X-IronPort-AV: E=Sophos;i="6.11,208,1725292800"; d="scan'208";a="29192766"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2024 21:24:53 +0800
IronPort-SDR: 670fb055_pIUzFXg5vdCuC8lWbR7Fc2+Def5ZfwfA5cNq3Eam0I1NUCM
 vBcTGlOym7O/LbkaUcK6PKNuvUQl3iUliTW+WEA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2024 05:23:49 -0700
WDCIronportException: Internal
Received: from 5cg1421gq2.ad.shared (HELO ryzen.wdc.com) ([10.224.3.238])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2024 06:24:52 -0700
To: buildroot@buildroot.org
Date: Wed, 16 Oct 2024 15:24:41 +0200
Message-ID: <20241016132443.3859149-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016132443.3859149-1-niklas.cassel@wdc.com>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729085093; x=1760621093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OhYLF5P61/rTK4UdYZ4H2Wvh0zP2pDiABx0BoNRY+dc=;
 b=B46Hs5yVIr76w44HQZ4acITd/yyOGazT5p2CCbpPapkos5DLGamIPuIu
 ULYmQPhkVzHZJycpAog677ecGNA8FeJ5FodtiFxbvk0qSAz3muxpdrJ6r
 eQN5ngMvOsIP3zg0OYKJYWdbVpPxpaqPuGr2TYqo8yjg7QsAOuFxwOp3b
 tj5Nz6v3yr1zLWZ20G6I66lPlR9LdlqZ4xp8bQW/ifhboa57LxbL1XLPP
 FknzWeogXV6Ivr8DQ5UzR2qgt3ld9+DJ5Tqn9GP9RUow5UoCFgEUeXsA6
 nAIWxGqnSZ/n4D+MlDwFgsT9ssVRvhIsVLouM82azozRf8UjAhNacJ0nx
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=B46Hs5yV
Subject: [Buildroot] [PATCH v3 2/4] configs/rock5b: update to uboot 2024.10
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

Newer uboot versions contain commit ebb0ad4eef0a ("arch: arm:
mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588"),
which enables BOOTSTD_FULL for RK3588, making it easier to figure
out issues with the bootflow, if any.

Also add the GnuTLS dependency which is needed for uboot 2024.10.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/patches/uboot/uboot.hash | 2 +-
 configs/rock5b_defconfig                    | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
index bc999536af..904fa56c02 100644
--- a/board/radxa/rock5b/patches/uboot/uboot.hash
+++ b/board/radxa/rock5b/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index bc7b73d652..d75ad585fb 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -32,11 +32,12 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
