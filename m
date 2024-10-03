Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61E1CF34AD
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 20:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7343061182;
	Thu,  3 Oct 2024 20:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCRjfJugUeKw; Thu,  3 Oct 2024 20:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F6A6118D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F6A6118D;
	Thu,  3 Oct 2024 20:45:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 657D81BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52C2860787
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cbQwauwJ26v for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 20:45:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AC5C607E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC5C607E8
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AC5C607E8
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 20:45:28 +0000 (UTC)
X-CSE-ConnectionGUID: 5XYujtKPQ36qgiiKxfJjXw==
X-CSE-MsgGUID: jhg0xF8xRZ+iN1/QNkMqSA==
X-IronPort-AV: E=Sophos;i="6.11,175,1725292800"; d="scan'208";a="29091917"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Oct 2024 04:45:27 +0800
IronPort-SDR: 66fef56d_bAiNfMh6VsiOYYef1CB04bS0MsS5eA/VWLLv4355oLN6yfU
 X5j6teGzMgfujcfhoytoq+Cvsegi7R3PibRE7uQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2024 12:50:05 -0700
WDCIronportException: Internal
Received: from 5cg1443rlm.ad.shared (HELO ryzen.lan) ([10.224.3.162])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Oct 2024 13:45:27 -0700
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 22:45:14 +0200
Message-ID: <20241003204515.403551-4-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003204515.403551-1-niklas.cassel@wdc.com>
References: <20241003204515.403551-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727988328; x=1759524328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mD7jHr0uDbhnnielqv9yjGIVW5hJ7UvzMBYWW3qidak=;
 b=kmjUcrydngqgvnpFW9mC0bYZZyLnSEfHwn6CQaMbCVxo0eFHP64Su0Wa
 IIGQJ4QyfftyitEUf3WCFCohucOUjhfP6gNEYsZ9r5sBdUzMLEJT7pv9O
 PSSFMu9ibGoSzB0h3ChUB+zhUenrM80aA1u7RVuDGKdQCCAagqFbcOJ3M
 VeByVApU8i1n/PqYca/h9J+LfCibdOQ0VtDFXTJ7qDgU5WKXb+wEeAgnG
 fS6NcpmsrC8BQO9ma1pSBIHXVqISiPvaB6g1dXl3rh/W0QMxYHuFaKYpm
 u9Nb0nhSOGfc1yNrH+V+qBvI2GbycsWUSCNL4ssPVTTA6VAwEnUZdBG2M
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=kmjUcryd
Subject: [Buildroot] [PATCH v2 3/4] configs/rock5b: use the arm64 rootfs
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
