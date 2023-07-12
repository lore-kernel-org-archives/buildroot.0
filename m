Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8CCEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 12:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B509282848;
	Wed, 12 Jul 2023 12:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B509282848
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmkQR8BpXEE9; Wed, 12 Jul 2023 12:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F7E82324;
	Wed, 12 Jul 2023 12:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F7E82324
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 909AD1BF3C1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A60E401DF
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 12:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A60E401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhkGB2ErqHrf for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 12:52:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B13DD400CC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B13DD400CC
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 12:52:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="235077399"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2023 05:51:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 05:51:58 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 12 Jul 2023 05:51:56 -0700
To: <buildroot@buildroot.org>
Date: Wed, 12 Jul 2023 13:51:52 +0100
Message-ID: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689166320; x=1720702320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AGLKAj0KQOi/YnBwQkq7ByrvqptweTyCjvmmnC6tfGA=;
 b=Vr4RwxeFKkkJMn3GOTLv8UKkPe2RW9aW5Xc5GOOVSXMMzHA2PQ+8glpq
 QTFf809lGORxx11KCu7vahBx6g0YBG7Mh84kRIIkOVafjm94NhH2nyKyx
 V0aBjp1em18RpZPYVahZgWgnRDh5JRaD81Y130X27qpKB6vDLCsLDnfB/
 39jhsavNNggEfkRNAJz9oww6QeQ16x1NG7yf2XVzrJP28myHQQN0QvUjy
 cpmiSE24s+T41p5NxqIPe5NYt4XWeBsvY1Xw3NkMvqxI2DoX+zpz0w616
 I6zIPL8lnVFKc5rihDKfvHfihmeJHuTQVqYrfUGc1doGya9F14kgIxGJg
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Vr4RwxeF
Subject: [Buildroot] [PATCH v3 0/2] Add Microchip PolarFire SoC Icicle Kit
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
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

The following patch series is to add support for Microchip's PolarFire SoC
development board, the icicle kit. We are adding all the necessary supporting
files, including a new defconfig and one required host package, the
hss-payload-generator. I look forward to recieving your feedback on the series.

Regards,
Jamie

Changes v1 -> v2:
- cleanup package makefile file
- update U-Boot and kernel versions
- add to Developers

Changes v2 -> v3:
- added missing host dependency in hss-payload-generator package
- removed unnecessary partition type uuids
- add missing package to fix build error
- fixed styling errors

Jamie Gibbons (2):
  package/microchip-hss-payload-generator: add host package
  configs/microchip_mpfs_icicle: add support for Microchip's Icicle Kit

 DEVELOPERS                                    |  5 ++
 board/microchip/mpfs_icicle/README.txt        | 62 +++++++++++++++++++
 board/microchip/mpfs_icicle/config.yaml       | 28 +++++++++
 board/microchip/mpfs_icicle/genimage.cfg      | 34 ++++++++++
 board/microchip/mpfs_icicle/linux.fragment    |  1 +
 board/microchip/mpfs_icicle/mpfs_icicle.its   | 53 ++++++++++++++++
 board/microchip/mpfs_icicle/post-image.sh     | 13 ++++
 board/microchip/mpfs_icicle/uboot-env.txt     | 16 +++++
 .../mpfs_icicle/uboot-fragment-rootfs.config  |  3 +
 configs/microchip_mpfs_icicle_defconfig       | 34 ++++++++++
 package/Config.in.host                        |  1 +
 .../Config.in.host                            | 11 ++++
 .../microchip-hss-payload-generator.mk        | 25 ++++++++
 13 files changed, 286 insertions(+)
 create mode 100644 board/microchip/mpfs_icicle/README.txt
 create mode 100644 board/microchip/mpfs_icicle/config.yaml
 create mode 100644 board/microchip/mpfs_icicle/genimage.cfg
 create mode 100644 board/microchip/mpfs_icicle/linux.fragment
 create mode 100644 board/microchip/mpfs_icicle/mpfs_icicle.its
 create mode 100755 board/microchip/mpfs_icicle/post-image.sh
 create mode 100644 board/microchip/mpfs_icicle/uboot-env.txt
 create mode 100644 board/microchip/mpfs_icicle/uboot-fragment-rootfs.config
 create mode 100644 configs/microchip_mpfs_icicle_defconfig
 create mode 100644 package/microchip-hss-payload-generator/Config.in.host
 create mode 100644 package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
