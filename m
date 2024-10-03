Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE028CF34AD
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 20:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0172607E2;
	Thu,  3 Oct 2024 20:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXBVWg2rdMz0; Thu,  3 Oct 2024 20:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2F6B607E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2F6B607E4;
	Thu,  3 Oct 2024 20:45:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3E7E1BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C298F607E2
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDSXWij1X1-r for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 20:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2005E60787
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2005E60787
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2005E60787
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 20:45:23 +0000 (UTC)
X-CSE-ConnectionGUID: WINIu7DFRay2JoKYZIiNnQ==
X-CSE-MsgGUID: vHzgTkOKQ860p7T8dT8GiQ==
X-IronPort-AV: E=Sophos;i="6.11,175,1725292800"; d="scan'208";a="29091914"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Oct 2024 04:45:22 +0800
IronPort-SDR: 66fef568_EcrvIVGKOGdj9EGKBgtnrEvxVjg6jAfic6vHwbcLsPadX5w
 ooX49qCIudIIXrNsDGInVBzeF/GG35LepVdjegA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2024 12:50:00 -0700
WDCIronportException: Internal
Received: from 5cg1443rlm.ad.shared (HELO ryzen.lan) ([10.224.3.162])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Oct 2024 13:45:22 -0700
To: buildroot@buildroot.org
Date: Thu,  3 Oct 2024 22:45:11 +0200
Message-ID: <20241003204515.403551-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727988323; x=1759524323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QEFzDmAR7nnw/nVsu+IG+MV/NEooD+BDR3Lke+OvLtE=;
 b=qUHKdgegLPkxXB3nvV+eWghzPF1RML/2v3kbKVMc12zdiZvkrW0Iljvq
 ZCb6x/XECtphAuIvyMVw5no6M1kY/rdkkUn97D0xoBc+RA1sYxGvZBgEA
 E1ohNItNGo/xQfmW5QgCDgzuJ8lmFRCCfTzgmVlAI79Jj/+Eq46ML2YFg
 xXGTAb01QR6Yclbay4fyoO0SpNc494FuI26iuB6rBo2EVd9PKoFgvNxeD
 3YCnas0x0M3QXzNTkx6j15lnm8Y9jRQIMfcxP+DacQZHaNBMv6UqHF58g
 SbFWmciGGLM+qXqT62W1PqrChkCBXB5V5tTNxrvcZ1gbBdA/N0/VcKQIb
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=qUHKdgeg
Subject: [Buildroot] [PATCH v2 0/4] rock5b improvements
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


Changes since v1:
-Define a uboot-env partition instead of using size + offset tricks in
 genimage.cfg.


Niklas Cassel (4):
  configs/rock5b: update to linux 6.10.10
  configs/rock5b: update to uboot 2024.07
  configs/rock5b: use the arm64 rootfs partition-type-uuid
  configs/rock5b: enable uboot-env on the SD card

 board/radxa/rock5b/genimage.cfg             | 8 +++++++-
 board/radxa/rock5b/patches/linux/linux.hash | 2 +-
 board/radxa/rock5b/patches/uboot/uboot.hash | 2 +-
 board/radxa/rock5b/u-boot.fragment          | 5 +++++
 configs/rock5b_defconfig                    | 7 ++++---
 5 files changed, 18 insertions(+), 6 deletions(-)
 create mode 100644 board/radxa/rock5b/u-boot.fragment

-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
