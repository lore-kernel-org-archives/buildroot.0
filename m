Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B5FCD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 10:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC8C607F3;
	Mon,  2 Sep 2024 10:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Av3zWrpweBG; Mon,  2 Sep 2024 10:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CD58607FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CD58607FF;
	Mon,  2 Sep 2024 10:44:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFB021BF279
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9E8E607D2
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAS4DlXsoUJm for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 10:44:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=968e9b7b9=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 378496061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 378496061B
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 378496061B
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 10:44:50 +0000 (UTC)
X-CSE-ConnectionGUID: VRpte0T3Q++JKkC15UVJ/A==
X-CSE-MsgGUID: N1DdaB2WTY+1p713eMBAoQ==
X-IronPort-AV: E=Sophos;i="6.10,195,1719849600"; d="scan'208";a="26096230"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2024 18:44:49 +0800
IronPort-SDR: 66d58907_p5+Sq+UgIoonKK9cQ9NcPXA6RcBv4gaHnvzhTrCiekfJg2T
 tRlUcbNv1GoYQrjSDCf5tLem2WIXa53jyRnffGw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Sep 2024 02:44:40 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.224])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Sep 2024 03:44:49 -0700
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 12:44:30 +0200
Message-ID: <20240902104433.2561797-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902104433.2561797-1-niklas.cassel@wdc.com>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725273890; x=1756809890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vPXSC7E0Hb1BBWUQ0hsQaHrvYtt7rxUmiV0+4jzYyDg=;
 b=g5tbbLiZ1ZDM/42glAJbXKDoW6+09O1v2XpDZqFSDqaSktXb2chZbVhw
 LSnyojsHw5mnh8lixrKtMEdvG/qb9ghNeqn7G5TNja0oWfm2PUpK8YEax
 T6Ksf7n+FJH/BvDVRXz0cCBeSOxEpEPbl7pRwLtPKvhoUMP114MPevPeb
 kRyR0LNB2AjQ1mMfTvAvTJlPzB/9WfE8rdIrHiS7i78JFVcfDdQv4M251
 xQ9vKMeDFjSDzKmaK6H+/zkweqmw5KDrTCt+RRqekE/oBnRoUUli/L7p5
 Y3jLGt+g2BEr+7vvpzamJtQCUfhl9hZWOv4JP4n1R2CTWsQlYlxMysSNe
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=g5tbbLiZ
Subject: [Buildroot] [PATCH 2/5] board/radxa/rock5b: use PARTLABEL to
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
index 9832255992..c4198deaa0 100644
--- a/board/radxa/rock5b/extlinux.conf
+++ b/board/radxa/rock5b/extlinux.conf
@@ -1,4 +1,4 @@
 label Radxa Rock 5b Linux
   kernel /boot/Image
   devicetree /boot/rk3588-rock-5b.dtb
-  append root=/dev/mmcblk1p1 earlycon rootwait
+  append root=PARTLABEL=rootfs earlycon rootwait
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
