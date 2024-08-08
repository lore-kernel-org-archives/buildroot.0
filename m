Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE18DC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 10:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6480180D36;
	Thu,  8 Aug 2024 10:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKcdZ6bjpYVO; Thu,  8 Aug 2024 10:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C06F8175F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C06F8175F;
	Thu,  8 Aug 2024 10:50:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FF431BF868
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 10:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE74F40932
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 10:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6IQn1Sruvdn for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 10:50:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=94397a82f=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF0434091F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF0434091F
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF0434091F
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 10:50:42 +0000 (UTC)
X-CSE-ConnectionGUID: oOcZrOpmQ46aHYlHIWM4Dw==
X-CSE-MsgGUID: CIwZhpLtSGKnflPSOOVhgQ==
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="197670505"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Aug 2024 03:50:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Aug 2024 03:50:18 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 8 Aug 2024 03:50:17 -0700
To: <buildroot@buildroot.org>
Date: Thu, 8 Aug 2024 11:52:19 +0100
Message-ID: <20240808105221.2776341-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1723114243; x=1754650243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xNEeUbGLRaBtx8FD2f44Do8BqZgG58DY2aGS373fYyY=;
 b=DRYmPwLymZFLgkoeDmMv5OHIMtRw6licEBnmdyLZx3FB7KEDWWgWYcTo
 E3nUeB3t8WGxks6KUO6wyaMypAKewcWG8vEQwdBBMIxse+USvhmUpHw4H
 Ii8JhAJv00DTzBXDxRJEyZ62YnsdPnkEtdrcbUMpe0cfHBHMqOKp3JXI8
 SdszOSuzWwO1/CHAH26yWqk9UhnQkKPHc/SlGrPnyH2XVJoQ2OtHVaadN
 HeJ/clIQSF5zXo9aJNQrwvo0CK6InLEXcuR2IMmDgLdsk0zwri80Yu/s4
 MFXsjC3vpynvQmpaN+gT2rAotiVfwBXFlBk01MgZiKJu/r9FeR98hOLJi
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=DRYmPwLy
Subject: [Buildroot] [PATCH v2 0/2] fix mpfs custom tarballs
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
Cc: Jamie Gibbons <jamie.gibbons@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

The following patchset updates the Linux kernel and U-Boot custom tarballs as
they were updated incorrectly. Previously, they were retrieving from a branch,
and storing it into a tarball. This is not the desired functionality. Now, the
custom tarballs retrieve specific release tags instead, as intended. 
This has also meant an additional update to the U-Boot hash is required to
match changes as the content has been updated.

Thanks Thomas for your feedback on v1, greatly appreciated.

Thanks,
Jamie

Jamie Gibbons (2):
  fix: configs/beaglev_fire: update custom tarballs
  fix: configs/microchip_mpfs_icicle: update custom tarballs

 board/beagleboard/beaglev_fire/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
 board/microchip/mpfs_icicle/patches/linux/linux.hash    | 2 +-
 board/microchip/mpfs_icicle/patches/uboot/uboot.hash    | 2 +-
 configs/beaglev_fire_defconfig                          | 4 ++--
 configs/microchip_mpfs_icicle_defconfig                 | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
