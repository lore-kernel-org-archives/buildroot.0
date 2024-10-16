Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47882D1AD55
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 13:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F38D980EF9;
	Wed, 16 Oct 2024 13:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSqtK1nEEhuj; Wed, 16 Oct 2024 13:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F204A81137
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F204A81137;
	Wed, 16 Oct 2024 13:25:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A71811BF306
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96167406A4
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9-3url2CzUB for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 13:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=012b9cad8=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9B0C406A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9B0C406A0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9B0C406A0
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 13:24:55 +0000 (UTC)
X-CSE-ConnectionGUID: bCJ5JpjuT762WgpSwzUWtQ==
X-CSE-MsgGUID: pAPjv50wRO+DQiFkWVfDqQ==
X-IronPort-AV: E=Sophos;i="6.11,208,1725292800"; d="scan'208";a="29192769"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2024 21:24:54 +0800
IronPort-SDR: 670fb056_4pPAgjsIzSWMTAO0VKqC8wVNHH2zwVsYg+wlrMz9mEeYmJE
 RxjZsi/dtjlwcf4fxZZ/fxqYGKDqH5yH/E06vdA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2024 05:23:51 -0700
WDCIronportException: Internal
Received: from 5cg1421gq2.ad.shared (HELO ryzen.wdc.com) ([10.224.3.238])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2024 06:24:54 -0700
To: buildroot@buildroot.org
Date: Wed, 16 Oct 2024 15:24:42 +0200
Message-ID: <20241016132443.3859149-4-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016132443.3859149-1-niklas.cassel@wdc.com>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729085095; x=1760621095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lXSH12r2sk97SURO4D40XGrb9SN1/3kQwquWTqwj388=;
 b=oNS+RSPl5rEuPDpOxc9tIWlReXvGj+htSX3TSA1ZNBQdBSYCVyM1eevp
 CnFO/6kGGBUGumBv2tN8Ei/PY1PJFH9H0NtIdr75Wneu8eU1NYwLHDMJS
 FiUis9C3oJJ8kSNXPOWlS1u8KNUfROzj+hnO7c0gsn6pPQgFE4haiDaGW
 svuV5rp9kFgjLrQ0iyvtNC44kwyMNGW1XGaHpCd/yiP9vKXGaL6VKBVN+
 ZYz9NGHby7jOVDUyymth5tPVqukikL5kgZDRDpl1EdfjwK3K2bKjZNEtS
 rCiweBhX5WJ1GZ7ATgKooj+jRVyte/dspLzcsSw3StWCLqnVzIFIB5nmM
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=oNS+RSPl
Subject: [Buildroot] [PATCH v3 3/4] configs/rock5b: use the arm64 rootfs
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
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
