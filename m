Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF232C04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8782E80C42;
	Fri, 23 Sep 2022 21:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8782E80C42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hd75TZB-g-m4; Fri, 23 Sep 2022 21:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA31C82591;
	Fri, 23 Sep 2022 21:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA31C82591
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 516761BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D1E160E7B
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D1E160E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MPmtubhc23i for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:36:27 +0000 (UTC)
X-Greylist: delayed 00:40:43 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 355A4608D8
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 355A4608D8
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:36:27 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28NKth4l110965;
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28NKtheV015661
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 23
 Sep 2022 15:55:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 23 Sep 2022 15:55:43 -0500
Received: from uda0393673 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28NKthRJ055927;
 Fri, 23 Sep 2022 15:55:43 -0500
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1obpi3-006N72-2o;
 Fri, 23 Sep 2022 15:55:43 -0500
From: Anand Gadiyar <gadiyar@ti.com>
To: <buildroot@buildroot.org>
Date: Fri, 23 Sep 2022 15:55:40 -0500
Message-ID: <20220923205543.1518798-1-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1663966543;
 bh=P8+VBkTkNZPip1qbjB9FgbEXL7OA4bzio5p3oiH2uBI=;
 h=From:To:CC:Subject:Date;
 b=ZyNH6lGIFE4f0sgbkuz2Tq6zNd3SstJ1ueQwwPeiW4pGlPZVxYAWCgYGdgwEoaFla
 5RlN7yl1taBkRucaSONiVGFbY2NGq0d6q31EGWH+VXHikRU+jzp4KnGBF6pgJekswO
 xgbxwWQjrdzGIuyLNe70D6YISKsTSxf8NQfQoJQQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ZyNH6lGI
Subject: [Buildroot] [PATCH v5 0/3] add support for TI's AM64x boards
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series introduces support for TI's AM64x SK boards.

It was previously sent out by Xuanhao in August and reviewed by
Giulio Benetti (Thanks!).

If this looks okay, I'll mark the previous series as superceded
in patchwork. Let me know if there's anything more to be done to
get these patches merged, as this is the first time we're engaging
with the buildroot community and may not be familiar with the
process.

We would like to add support for the AM62x SK as well, but are
currently blocked by availability of some firmware. Hopefully that
will get sorted out soon.


Changes in v4:
- rebased to latest master and retested
- dropped OPTEE CUSTOM* options as we don't need them.

Changes in v3:
- Fix boot/ti-k3-r5-loader package's build options and dependencies.
- Fix boot/ti-k3-image-gen package's config
- Add more details in board/ti/am64x_sk's readme
- Trim configs/am64x_sk's toolchain options and 
  fix uboot and genimage dependencies.
- Remove board/ti/am62x_sk and configs/am62x_sk for now due to some
  firmware dependency problems. Will be added back in the future.

Changes in v2:
- Revert arm-gnu-toolchain back to version 10.x due to a bug.
  When the pre-packaged GCC was built, it could be targeting
  a newer x86_64 architecture than the processor being used.
- Add boot/ti-k3-r5-loader package that builds a separate U-Boot
  for the R5 cores on TI's K3 devices.
- Add boot/ti-k3-image-gen package that builds the full boot binary
  tiboot3.bin from the spl built from ti-k3-r5-loader.
- Add board/ti directory to include sdcard config and board information
  for AM64x_sk and AM62x_sk boards.
- Add the Buildroot defconfigs for AM64x_sk and AM62x_sk.
- Add to DEVELOPERS list.

Xuanhao Shi (3):
  boot/ti-k3-r5-loader: add new package
  boot/ti-k3-image-gen: add new package
  board/ti/am64x_sk: add new board

 DEVELOPERS                                | 12 ++++++
 board/ti/am64x_sk/genimage.cfg            | 27 +++++++++++++
 board/ti/am64x_sk/readme.txt              | 49 +++++++++++++++++++++++
 boot/Config.in                            |  2 +
 boot/ti-k3-image-gen/Config.in            | 24 +++++++++++
 boot/ti-k3-image-gen/ti-k3-image-gen.hash |  2 +
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 33 +++++++++++++++
 boot/ti-k3-r5-loader/Config.in            | 13 ++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |  2 +
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 45 +++++++++++++++++++++
 configs/am64x_sk_defconfig                | 45 +++++++++++++++++++++
 11 files changed, 254 insertions(+)
 create mode 100644 board/ti/am64x_sk/genimage.cfg
 create mode 100644 board/ti/am64x_sk/readme.txt
 create mode 100644 boot/ti-k3-image-gen/Config.in
 create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
 create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
 create mode 100644 boot/ti-k3-r5-loader/Config.in
 create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
 create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
 create mode 100644 configs/am64x_sk_defconfig

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
