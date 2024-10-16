Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71087D1AD56
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 13:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2421780E7E;
	Wed, 16 Oct 2024 13:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEm2V0DX7MVK; Wed, 16 Oct 2024 13:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E5A080E3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E5A080E3F;
	Wed, 16 Oct 2024 13:24:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B45A1BF306
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05C8D80E7E
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 13:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-iKkM9zCuya for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 13:24:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=012b9cad8=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01AC580E29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01AC580E29
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01AC580E29
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 13:24:51 +0000 (UTC)
X-CSE-ConnectionGUID: VRV4eD+ISi+d5ivYpvxEfw==
X-CSE-MsgGUID: 99I5oFEPT4G06lc64Hcv1w==
X-IronPort-AV: E=Sophos;i="6.11,208,1725292800"; d="scan'208";a="29192763"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2024 21:24:49 +0800
IronPort-SDR: 670fb051_pw2Tc2f6dUDNvix6mGf3FxxjrPXwDDjNgW5uvq0/DpYB7eU
 +cSGu999MFrgMpQMdh8+jsDWyFvWerU5StYjhTA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2024 05:23:46 -0700
WDCIronportException: Internal
Received: from 5cg1421gq2.ad.shared (HELO ryzen.wdc.com) ([10.224.3.238])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2024 06:24:49 -0700
To: buildroot@buildroot.org
Date: Wed, 16 Oct 2024 15:24:39 +0200
Message-ID: <20241016132443.3859149-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729085091; x=1760621091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T639vjv8sNcvb6roGl1MPrrlxVx+UlQdkoKq3xUKmoA=;
 b=MamSFo9zC2R4aodL7uul4lZUwYZdz7065BO43YhJhQ6Dawg4zL2vOGMA
 zTnuS4l84fBkm1WM5WxF+hJ3nmuRjG5gym5FkOpNht9jcN1FwgMSAwGyI
 eAEMrdxMLN4zzhVRX4CTw8hnVjCx7zn2DpqINq14wWD+U+vhGFQobFJAW
 CA51XrUqmxvPrXDF3mQEr25Jap01mPJTB1YJSkAyLcR4gpd0QxSb3AOO/
 P72o9mP6ny6avNqDaqF4lfgq/fcjLtUzicObBiwGylOMKXhPJE9UXLu3p
 MT2X3tSbpi4w/n0fM/v+RKIe7Yi5AUJ72O6pSOTMrd0IfIWL0yMi+vwLR
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=MamSFo9z
Subject: [Buildroot] [PATCH v3 0/4] rock5b improvements
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

This series depends on:
https://lore.kernel.org/buildroot/20241013103341.78501-1-bernd@kuhls.net/
which adds support for linux 6.11.x.


Hello all,

The first patch updates linux to 6.11.3.

The second patch updates uboot to 2024.10.

The third patch uses a more correct partition-type-uuid.

The fourth patch defines a uboot-env on the SD card,
so that setenv and saveenv commands can be used.


Kind regards,
Niklas


Changes since v2:
-Bump linux to an even newer version (6.11.3).
-Bump uboot to an even newer version (2024.10).


Niklas Cassel (4):
  configs/rock5b: update to linux 6.11.3
  configs/rock5b: update to uboot 2024.10
  configs/rock5b: use the arm64 rootfs partition-type-uuid
  configs/rock5b: enable uboot-env on the SD card

 board/radxa/rock5b/genimage.cfg             |  8 +++++++-
 board/radxa/rock5b/patches/linux/linux.hash |  4 ++--
 board/radxa/rock5b/patches/uboot/uboot.hash |  2 +-
 board/radxa/rock5b/u-boot.fragment          |  5 +++++
 configs/rock5b_defconfig                    | 10 +++++++---
 5 files changed, 22 insertions(+), 7 deletions(-)
 create mode 100644 board/radxa/rock5b/u-boot.fragment

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
