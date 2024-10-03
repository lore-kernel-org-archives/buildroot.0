Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E539CF34AE
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 14:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE620820A2;
	Thu,  3 Oct 2024 14:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaBAtPm832CO; Thu,  3 Oct 2024 14:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6DC4820B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6DC4820B1;
	Thu,  3 Oct 2024 14:01:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2461BF311
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E755581F8B
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 14:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3TmSnwXpfZk for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 14:01:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E644981EE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E644981EE2
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E644981EE2
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 14:01:04 +0000 (UTC)
X-CSE-ConnectionGUID: oly7BzGaSCqqluyNfE7rnQ==
X-CSE-MsgGUID: uFrPNd3ITlivF9sYvGpPCQ==
X-IronPort-AV: E=Sophos;i="6.11,174,1725292800"; d="scan'208";a="29066263"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2024 22:01:04 +0800
IronPort-SDR: 66fe955f_Rs4EXHiUMBlUKFzHC/dtM4nsyhwHSP5qDTNzfXY0Tg/ieWp
 Ts7aPVY9yrAelY5uw0KC3d9J5jt9OaIE2C/HBTw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2024 06:00:16 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.lan) ([10.224.3.161])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Oct 2024 07:01:04 -0700
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 16:00:53 +0200
Message-ID: <20241003140054.250140-4-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003140054.250140-1-niklas.cassel@wdc.com>
References: <20241003140054.250140-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727964064; x=1759500064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mD7jHr0uDbhnnielqv9yjGIVW5hJ7UvzMBYWW3qidak=;
 b=F5Rb7Kob/WzykC3TArcS+FzfqSw4SNCzUO8/S3JhdAU8TmT7nNtzMzii
 RSYKQQSrzqeiLZ6Yf+ruRSn/3zqRLl5xUqKL+A2LxL67/jE+yTk8kVTwz
 HFNvH0frEP6v4mEvbS4nS+OP4+oiCQzh5ye4hYqWhyfRcqU5UFCL6l2fJ
 pZ/SIuOdVDM0+nGAfEUn9vOZeSL+Tn4WF5HofIK8FmQac669CbbxyZRKc
 g1LytZqGCsCBOdWvnBpC1jOAElYzzD2NjwX2tGsES13akRoEIfTu60vTR
 rj+JGCgU476/FzFf86Rizd+E4g/aa0poXhLmuI5wTGZ4soU1r0/GsuUJM
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=F5Rb7Kob
Subject: [Buildroot] [PATCH 3/4] configs/rock5b: use the arm64 rootfs
 partition-type-uuid
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

Use the arm64 rootfs partition-type-uuid instead of the generic "Linux
filesystem" partition-type-uuid.

This is strictly more correct. No functional change introduced.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
index 43bb65bdd9..8c56251135 100644
--- a/board/radxa/rock5b/genimage.cfg
+++ b/board/radxa/rock5b/genimage.cfg
@@ -12,7 +12,7 @@ image sdcard.img {
 	}
 
 	partition rootfs {
-		partition-type-uuid = L
+		partition-type-uuid = root-arm64
 		image = "rootfs.ext2"
 	}
 }
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
