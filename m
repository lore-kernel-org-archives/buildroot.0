Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB488CF34AD
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 14:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56B8581EB4;
	Thu,  3 Oct 2024 14:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id os_xusyX5pD6; Thu,  3 Oct 2024 14:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F45B81DF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F45B81DF2;
	Thu,  3 Oct 2024 14:01:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 700F51BF311
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 14:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CE2881DF2
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 14:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzyWLuc2qzjR for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 14:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9CBB81D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9CBB81D72
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9CBB81D72
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 14:01:00 +0000 (UTC)
X-CSE-ConnectionGUID: F+qQksMoRjOMCSNdgFZpUw==
X-CSE-MsgGUID: 4HTVfXzRRCKGBP0xlxxfJQ==
X-IronPort-AV: E=Sophos;i="6.11,174,1725292800"; d="scan'208";a="29066240"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Oct 2024 22:00:59 +0800
IronPort-SDR: 66fe955a_C5/XfH2CFvhQxh13ZEpHRl3gt7MvsxBUFzPYKItWiFSSAWi
 qlzGKeP4RLqhNlUalPuUAP1ExrtPIRCau8MCyYw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2024 06:00:10 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.lan) ([10.224.3.161])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Oct 2024 07:00:58 -0700
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 16:00:50 +0200
Message-ID: <20241003140054.250140-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727964060; x=1759500060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gQVynI0tVivT+VC6vb+dVbYHRlH3jj69njZmmYta4/M=;
 b=ey5h7APD4p+9Dfs+/UqR7RBDT5LN/nQYf7FO9Qyn1TVU83oEjk7OCf5G
 As6ZngAiXpJXVKy4HHRoPQG9XqIS8atk5x32Ho6PpFFu4yoktVvXMVUEg
 mWpF/P5pf16+VlaS9GgCwBwspcgLLYWoh5b+gY13xfj2xfVv2HJf7oPmH
 WQolZPmtPUSB2TAabb/WcLqZA62xcZja49CvzTm45RPhsmvHyTef0+j5Y
 qiqO+qCOcHAUwJXSqcDxu4Z4Zt2f8NTFVVSse6ED035khUa3G0T64Nq7I
 pGLR4JDP1yRkH5qTr38DDYbpSD7PWmcUAzP/WRGeJPkgllqIygV6hhqhg
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=ey5h7APD
Subject: [Buildroot] [PATCH 0/4] rock5b improvements
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

Hello all,

First patch updates linux to 6.10.10.

Second patch updates uboot to 2024.07.

Third patch uses a more correct partition-type-uuid.

Fourth patch defines a uboot-env on the SD card,
so that setenv and saveenv commands can be used.


Kind regards,
Niklas


Niklas Cassel (4):
  configs/rock5b: update to linux 6.10.10
  configs/rock5b: update to uboot 2024.07
  configs/rock5b: use the arm64 rootfs partition-type-uuid
  configs/rock5b: enable uboot-env on the SD card

 board/radxa/rock5b/genimage.cfg             | 4 +++-
 board/radxa/rock5b/patches/linux/linux.hash | 2 +-
 board/radxa/rock5b/patches/uboot/uboot.hash | 2 +-
 board/radxa/rock5b/u-boot.fragment          | 5 +++++
 configs/rock5b_defconfig                    | 7 ++++---
 5 files changed, 14 insertions(+), 6 deletions(-)
 create mode 100644 board/radxa/rock5b/u-boot.fragment

-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
