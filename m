Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8554FCA0EFB
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 10:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 479AA6123E;
	Fri, 30 Aug 2024 10:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFaZtciHuQYP; Fri, 30 Aug 2024 10:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29CEF61396
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29CEF61396;
	Fri, 30 Aug 2024 10:21:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C027F1BF3B0
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 10:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABBD5423E8
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 10:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6u2UEhhUtE-y for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 10:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=965de3954=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C96D6423DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96D6423DD
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C96D6423DD
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 10:20:50 +0000 (UTC)
X-CSE-ConnectionGUID: O6Nhjfc9Rn2wuwDn/NW7BA==
X-CSE-MsgGUID: cLj+7CY/RsmAZAgfzIH4hQ==
X-IronPort-AV: E=Sophos;i="6.10,188,1719849600"; d="scan'208";a="25938673"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2024 18:13:44 +0800
IronPort-SDR: 66d18e96_Ho+PnX34uEfda8dRDtdFfcjIY/viuzX2Uox1pucszK2Yqy3
 OtvDhS1ZCuwyNh+bXN3ydddh0SCH/32zOoSWLUQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2024 02:19:18 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.215])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Aug 2024 03:13:43 -0700
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 12:13:26 +0200
Message-ID: <20240830101327.2000179-4-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830101327.2000179-1-niklas.cassel@wdc.com>
References: <20240830101327.2000179-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725013250; x=1756549250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3J8hBrhtR6jr9f275KKWkKTSnLFYeW72bDP/X+LvU8=;
 b=aIX1IRSUPxvFzFNJNnhyt1q+f3cS0D4ElGH/Yq+Jep/bE9vVNpMjlry5
 pYDiKp8kUgr048D8UDrwByI+qGbGEUtLBjpFTTOeriR+4qsWDkf26C72I
 O53jfT+VnO/PSTVvB8iRkcAx2B6ErAxu6DrmFBbNxK/TThxovCLrJV2Cf
 I5NGmEnmEpx0OCGLtqntRR2b3aVbCCMX0TWBKco5CX6DPr9lpxTx6Qk4h
 ktUJ9cagebpf0qDecD0OPKv187ywSJJGg7yvmuup3QAU6GI7CpGlljtSs
 NZPlKLZ8g5uubX/A9eXFHNEJYLgidO9Lq3XcgGlG0Y1wMdqAVumGod/74
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=aIX1IRSU
Subject: [Buildroot] [PATCH 3/4] board/radxa/rock5b: do not let the kernel
 mount the rootfs as rw
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

Do not let the kernel mount the rootfs as rw.
There is no need for this, and init will remount the rootfs as rw anyway.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 board/radxa/rock5b/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rock5b/extlinux.conf b/board/radxa/rock5b/extlinux.conf
index bca99a3aa8..c4198deaa0 100644
--- a/board/radxa/rock5b/extlinux.conf
+++ b/board/radxa/rock5b/extlinux.conf
@@ -1,4 +1,4 @@
 label Radxa Rock 5b Linux
   kernel /boot/Image
   devicetree /boot/rk3588-rock-5b.dtb
-  append root=PARTLABEL=rootfs rw earlycon rootwait
+  append root=PARTLABEL=rootfs earlycon rootwait
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
