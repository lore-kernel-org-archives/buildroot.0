Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65878CF34C1
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 20:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 300C2607E4;
	Thu,  3 Oct 2024 20:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVq8OQlqn9KU; Thu,  3 Oct 2024 20:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBEE66110F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBEE66110F;
	Thu,  3 Oct 2024 20:45:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C2601BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7984B607EC
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RT30B2KFLpc6 for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 20:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C48D6607E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C48D6607E4
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C48D6607E4
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 20:45:26 +0000 (UTC)
X-CSE-ConnectionGUID: zEvu/22KRqyBmmqE45pEpg==
X-CSE-MsgGUID: 4tI3EYuQSaWiDxf0o0fz9w==
X-IronPort-AV: E=Sophos;i="6.11,175,1725292800"; d="scan'208";a="29091916"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Oct 2024 04:45:26 +0800
IronPort-SDR: 66fef56b_a1aIHi6fJdcDrJQBfuut2dtkJMUwSYv9Bcgwfr7cvQ1Gomo
 kjQqxlS+5WSgwDDp7XKVojFoXoko3gtzBHh8SpQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2024 12:50:03 -0700
WDCIronportException: Internal
Received: from 5cg1443rlm.ad.shared (HELO ryzen.lan) ([10.224.3.162])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Oct 2024 13:45:26 -0700
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 22:45:13 +0200
Message-ID: <20241003204515.403551-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003204515.403551-1-niklas.cassel@wdc.com>
References: <20241003204515.403551-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727988326; x=1759524326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/SdAcGnf3PTxxvADgRwHc/0XmeBsRnl4FjmShMQ5dQ=;
 b=edQYKjwJjte/hJ6Wj3js0tAy0dN9LG5EeSXFscCv6DkaSCxsyx17oImk
 E2uZ+bxTO+prp92K1ovAZ3YW/ct+mBH62An/cwD9h8JdK1vqt42flJDHp
 3wtGrGM1PCqDN/ZKXmjVtH0ztn4y+DfsbqaatPELS5zDGnuxW1Uvpxol3
 O92R+mNQN+trkUNdamx7XdUogXIB60RnXQPyGsF1BbFmjWXNo9Q59YLUD
 GQ57tggvJWVFhncHK4843eqCn5UMOxLKT0zaVOfozMZyWvvH7NnytTgpm
 CrVjWp2C7pBk7cj1+Uqi3sE7ncCgFHYXpLdEY2r21q0pRQEhiaNT8GFFm
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=edQYKjwJ
Subject: [Buildroot] [PATCH v2 2/4] configs/rock5b: update to uboot 2024.07
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
