Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB16CF34A9
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 14:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89CB98209E;
	Thu,  3 Oct 2024 14:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrwKyDd5TlQW; Thu,  3 Oct 2024 14:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86F9581FF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F9581FF2;
	Thu,  3 Oct 2024 14:01:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2413A1BF311
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 14:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0140B81EA2
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 14:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0tibL8gCVxC for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 14:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39BFB81EB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39BFB81EB0
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39BFB81EB0
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 14:01:03 +0000 (UTC)
X-CSE-ConnectionGUID: eVsX7rikRyeHpBdtttLTNg==
X-CSE-MsgGUID: /5a7hooyRG2gcZ8+OJz50g==
X-IronPort-AV: E=Sophos;i="6.11,174,1725292800"; d="scan'208";a="29066254"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2024 22:01:02 +0800
IronPort-SDR: 66fe955e_pJuUsuC5aa/b5m3q6fEEoX5dXYmScCLo73FxtE1qdIvde0+
 CCD0pvs1fEAtwei7yTLwjupFZCUQgapt8iU4Stw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2024 06:00:14 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.lan) ([10.224.3.161])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Oct 2024 07:01:02 -0700
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 16:00:52 +0200
Message-ID: <20241003140054.250140-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003140054.250140-1-niklas.cassel@wdc.com>
References: <20241003140054.250140-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727964063; x=1759500063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/SdAcGnf3PTxxvADgRwHc/0XmeBsRnl4FjmShMQ5dQ=;
 b=dyP6P6sCk529t4DHKfyyyiQ9p2elPitIQ3+Mut13pHZ4QeZGeqL4cVZ3
 UhRuJEhm58K8aA53hgeZDOHCDE7I6YTxn/QBEOHra4DqYU0Beq2Ym1HJK
 9KsRBfgMH8aaUlUWiZAtK95y9y4oBsPng2drA/29zXhP/dGZvuT2CSIKu
 te9qPiti2zf8NO7RScVPZypwkLN8zwjUgFGVt4XOTB3C+WOxRLmqivluC
 8Dv0nrjkP4ak1jK4TpldiEu+St6JKZuNCBqDz4ScdTAY2A0ge9+QG88hR
 zvpwOp2O5obv6ttxDkP8bQLRazDNLbF23+ZM4L0/1BUW8T/1kaA8/BDgm
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=dyP6P6sC
Subject: [Buildroot] [PATCH 2/4] configs/rock5b: update to uboot 2024.07
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

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/patches/uboot/uboot.hash | 2 +-
 configs/rock5b_defconfig                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
index bc999536af..fe9b4f53dc 100644
--- a/board/radxa/rock5b/patches/uboot/uboot.hash
+++ b/board/radxa/rock5b/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index c0c6877d81..bdf3c5a27f 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -30,7 +30,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
