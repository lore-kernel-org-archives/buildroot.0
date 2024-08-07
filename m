Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA1FC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78E7A607A7;
	Wed,  7 Aug 2024 14:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gV5NH9lUH74l; Wed,  7 Aug 2024 14:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A10F5608A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A10F5608A5;
	Wed,  7 Aug 2024 14:34:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2AFC1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C047640273
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVDPojGDm3z1 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=9422bb55b=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C67FB40184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C67FB40184
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C67FB40184
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:02 +0000 (UTC)
X-CSE-ConnectionGUID: 8gsgxV13RKGXv8Szmjhzqw==
X-CSE-MsgGUID: 4IKmaIQjRnqa6ciWGbVzZA==
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="261117751"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Aug 2024 07:34:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Aug 2024 07:34:01 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 7 Aug 2024 07:34:00 -0700
To: <buildroot@buildroot.org>
Date: Wed, 7 Aug 2024 15:36:05 +0100
Message-ID: <20240807143605.1440039-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1723041243; x=1754577243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2H5WKqgQR9e7K0GogewCEu4H3yw2/12x3ZuEWffyZz4=;
 b=d/zCqQHYvokhxEXfEvw+AieSfiaacwZQ0WuyOpkbaocLszKMZwM49PBA
 T/B/BzrH8MlOxa8rEReOiYmOybttQmNJNLpHycL63aP8PW7ceob8zlyws
 vy3izGgjlilMcWv+CKe/WjiR1ipeNy5TKJah2jCV5wTHZYlHtVhWzCb4B
 pn50nDCpBoTgQsoKRTqyN4oqPubL3GUvUVry4NVwdbFIqq7NhsUHXQrTi
 XA+hgRD1Tn3ZQQof185zolLWOMghd/SwresA4Goz3NF3Sc3lvk4iP8ANi
 lZfLIc3LdwoeGrxlbXsjFXvKAAV3ohJx8YtKvxsrmUlsrp21CfCD9TqD8
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=d/zCqQHY
Subject: [Buildroot] [PATCH 1/1] fix: board/beagleboard/beaglev_fire: update
 uboot hash
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The U-Boot hash is incorrect and breaks the BeagleV Fire build. Update
the U-Boot hash.

Fixes:8ce97fd550d6("configs/beaglev_fire: bump Linux and U-Boot")

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Tested-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
---
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
index ddb73b9a71..b9b655b180 100644
--- a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5d9bcbebe9723ab12cbf2b60277268741e84e4aadbe7ecd8c05be046f202d8a1  linux4microchip+fpga-2024.06.tar.gz
+sha256  5f127386889357149e92bf2b2699ec35756363ba4dc95dc10d891aa71d7ca725  linux4microchip+fpga-2024.06.tar.gz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
