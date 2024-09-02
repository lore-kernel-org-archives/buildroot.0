Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07838CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 10:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5190C607EB;
	Mon,  2 Sep 2024 10:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1zU-V2FExrw; Mon,  2 Sep 2024 10:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA9C4607DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA9C4607DD;
	Mon,  2 Sep 2024 10:44:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 842F71BF279
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71CF46061B
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27kqB3fPCyVe for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 10:44:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=968e9b7b9=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CC37606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CC37606F6
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CC37606F6
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 10:44:48 +0000 (UTC)
X-CSE-ConnectionGUID: 3ZOA90FKRi+ancPYuCEwSQ==
X-CSE-MsgGUID: XRx84dYoT9+acWhuVWLztQ==
X-IronPort-AV: E=Sophos;i="6.10,195,1719849600"; d="scan'208";a="26096227"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2024 18:44:48 +0800
IronPort-SDR: 66d58905_1hi63Qiz2xBNpHEcqeaKePCCF/WhEOCHLjx2S8P+0TPR+Ee
 a2BEy6H9iEm26nr27az9RzYD5OymzdWL+pjKDrw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Sep 2024 02:44:38 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.224])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Sep 2024 03:44:47 -0700
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 12:44:29 +0200
Message-ID: <20240902104433.2561797-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902104433.2561797-1-niklas.cassel@wdc.com>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725273888; x=1756809888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w2j47y76dDR+TAe0PnV5JqFY253J8GGE6iwoQiztfDw=;
 b=oEx6ta9uqpwpvQMU/gcnrfzI8QIcl6FpJagkqrBgLeL6G4V3f3eWYJIu
 Vx3CrbYzLK2hKjWjbUYfA6yo/FRH5FL4dNkWALPesJznWxsiRqDlF7LHb
 UeZe7ThKtJarfFKGh9M2PjqF4QrSB3bSxVD0/NJJRTUFerl6B5c+7CF83
 eeIc9VR/pJZskZcXFJS6qiMChU6pdeAWg1nyt8d+A83MUeF8F7mqGXjBJ
 dKZ5Ikkt8Ebdre4BSpcFiWZYRP5aiUKinaud9O41GHeZbgQJjzh5N7L3m
 pzaQPlKQJzslsKMvF+jwLH0K7eK2O8kqDySeG3UbNY+AtJ4jRwuwNMN5y
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=oEx6ta9u
Subject: [Buildroot] [PATCH 1/5] board/radxa/rock5b: use gpt partition table
 instead of hybrid
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

Partition table hybrid means GPT + MBR.
There is no need to keep the MBR when using GPT, so migrate to GPT only.

This change also requires us to migrate from partition-type to
partition-type-uuid, otherwise genimage won't generate an image.

Note that GPT itself always writes a "protective MBR" at LBA 0.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
index 138ec26e3a..43bb65bdd9 100644
--- a/board/radxa/rock5b/genimage.cfg
+++ b/board/radxa/rock5b/genimage.cfg
@@ -2,7 +2,7 @@
 
 image sdcard.img {
 	hdimage {
-		partition-table-type = "hybrid"
+		partition-table-type = "gpt"
 	}
 
 	partition uboot {
@@ -12,7 +12,7 @@ image sdcard.img {
 	}
 
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = L
 		image = "rootfs.ext2"
 	}
 }
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
