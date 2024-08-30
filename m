Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0B0CA0EFB
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 10:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DD226066A;
	Fri, 30 Aug 2024 10:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3Gy15N1fAdU; Fri, 30 Aug 2024 10:20:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51ABF6120F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51ABF6120F;
	Fri, 30 Aug 2024 10:20:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A848A1BF3B0
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 10:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FED5423E8
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 10:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_GFjljs5Xkm for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 10:20:47 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 30 Aug 2024 10:20:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93CB2423DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93CB2423DD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=965de3954=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93CB2423DD
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 10:20:47 +0000 (UTC)
X-CSE-ConnectionGUID: UYNsJEqDTrS6ODHmC0i0pA==
X-CSE-MsgGUID: 6U/dbrY3SzS9Iri0rmE+GQ==
X-IronPort-AV: E=Sophos;i="6.10,188,1719849600"; d="scan'208";a="25938666"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2024 18:13:40 +0800
IronPort-SDR: 66d18e91_YR2MBCDt9WnxKDuhcWPTQ3yMa1/z3qKiu42wjwiD82YZBpR
 lKD+GsWjik1/nOkGFERJL7oCJhnW3QRHq9bfEpQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2024 02:19:14 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.215])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Aug 2024 03:13:39 -0700
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 12:13:23 +0200
Message-ID: <20240830101327.2000179-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725013247; x=1756549247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mE/gEubwDjDWS7PBWQqzZkvo4piptXJL7tHFCJQQ3ro=;
 b=C0/Xjor7X7wvpmAA0wl4vQsd1iI0WlIgLawV9mnqvIhmzc5uTQqzzkUd
 cBc2h+CORqZRG4mCv8u3082Uu4/LaNRarUJWTDtuzOwAg6g3YLnRkCRaP
 OvZSsVZFC77+YAIUFFh7EUfi4dji+Mjh4xSyf5lase6sTNmhwHcVhP+3D
 Qf+c8FtCFPstTpv/AtQ/KZQ1qPkqEew+5fcT6mNFwENN8kAEYXZ/zp/xt
 VlIc0cfS1wu4eUKBYq+O6kZ60zI/ojwqzEo2L/q0RdtSIvn2Yac68KRWI
 RVN+zKdxgCgBiDnR+I9DZF+93mL+Lnq7huww9i+vZ3us97hDEwm8tUVgX
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=C0/Xjor7
Subject: [Buildroot] [PATCH 0/4] rock5b minor improvements
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

Hello all,

Here are some minor improvements for the rock5b board that:
-Removes superfluous arguments on the kernel command line.
-Adds firmware for the onboard NIC to avoid errors in dmesg.

Kind regards,
Niklas

Niklas Cassel (4):
  board/radxa/rock5b: use PARTLABEL to specify rootfs
  board/radxa/rock5b: there is no need to specify rootfstype
  board/radxa/rock5b: do not let the kernel mount the rootfs as rw
  configs/rock5b: add firmware for the RTL8125 NIC

 board/radxa/rock5b/extlinux.conf | 2 +-
 configs/rock5b_defconfig         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
