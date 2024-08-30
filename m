Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A477ECA0EFB
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 10:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1132A6120F;
	Fri, 30 Aug 2024 10:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhrvjLnDTnFD; Fri, 30 Aug 2024 10:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 846D16122C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 846D16122C;
	Fri, 30 Aug 2024 10:20:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1B01BF3B0
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 10:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9A11423E8
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 10:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsXC10xD6973 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 10:20:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=965de3954=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 118CE423E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 118CE423E0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 118CE423E0
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 10:20:47 +0000 (UTC)
X-CSE-ConnectionGUID: mAic51n0R4+E6UMvojDmCQ==
X-CSE-MsgGUID: eZfVo7ndQO6sfPKi7tIMdA==
X-IronPort-AV: E=Sophos;i="6.10,188,1719849600"; d="scan'208";a="25938668"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2024 18:13:41 +0800
IronPort-SDR: 66d18e93_TGoFG0POl2WBHTc7Dh7q/nnGs2EqVKvAD3tIu/5MeOIPaIt
 CzXJtyyJVfQCNG8xTivXR5jtrfPAqxy9PPE3Pbg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2024 02:19:15 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.215])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Aug 2024 03:13:40 -0700
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 12:13:24 +0200
Message-ID: <20240830101327.2000179-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830101327.2000179-1-niklas.cassel@wdc.com>
References: <20240830101327.2000179-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725013248; x=1756549248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hEGlaYr3RO4HbliAnSaC61WjRfP6oIrXx0pau04p/zE=;
 b=XYZ/jg4GhqcwNh2lvr4nGnUTiq9EalUuLe+qmvtGezOMMFMBTHy3e/of
 jhe/+kgTP/exg9RhHpNZ7A9EE5gJCqia0/sX4HsdQk+7ltKcqQBHqo2pV
 F6nAFhp1UnR2kJjhGfyJa7JWNHmFW7URDkhoI5XyTBR02LD/h8s5atEM/
 eXeWwawAGB24RhfeDZBnxYrPIfJJ2775HcXxC6qrg8YKA8g8aqF4pXGJj
 //l+cJs+2wBw36W4AlOLmS4PQBFDaI5ICLxB9EZ8BQ+RcF4CXWnpwgsxf
 75j91LyxjE5/3N1xoSGizKYqjvkPKzm1yv6iY0UVhE/wWOJK7DkSvsnVQ
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=XYZ/jg4G
Subject: [Buildroot] [PATCH 1/4] board/radxa/rock5b: use PARTLABEL to
 specify rootfs
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

This board has an optional eMMC module.

Use PARTLABEL to specify the rootfs, as this works regardless of the mmc
device probe order.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rock5b/extlinux.conf b/board/radxa/rock5b/extlinux.conf
index a1a531f038..8759d7491c 100644
--- a/board/radxa/rock5b/extlinux.conf
+++ b/board/radxa/rock5b/extlinux.conf
@@ -1,4 +1,4 @@
 label Radxa Rock 5b Linux
   kernel /boot/Image
   devicetree /boot/rk3588-rock-5b.dtb
-  append root=/dev/mmcblk1p1 rw rootfstype=ext4 earlycon rootwait
+  append root=PARTLABEL=rootfs rw rootfstype=ext4 earlycon rootwait
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
