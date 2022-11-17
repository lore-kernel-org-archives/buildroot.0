Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFFFC4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 00:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CE9E82004;
	Thu, 17 Nov 2022 00:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CE9E82004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbU8VQHwCpDA; Thu, 17 Nov 2022 00:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A15982008;
	Thu, 17 Nov 2022 00:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A15982008
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05A781BF954
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 00:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D531840136
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 00:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D531840136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uHv1hHwWV3Q9 for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 00:15:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F12C5400B8
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F12C5400B8
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 00:15:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AH0FBIP071549;
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AH0FBfw011499
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 16
 Nov 2022 18:15:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 16 Nov 2022 18:15:11 -0600
Received: from uda0393673 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AH0FBXb069587;
 Wed, 16 Nov 2022 18:15:11 -0600
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1ovSYh-007MC2-ER;
 Wed, 16 Nov 2022 18:15:11 -0600
To: <buildroot@buildroot.org>
Date: Wed, 16 Nov 2022 18:15:08 -0600
Message-ID: <20221117001511.1753592-1-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1668644111;
 bh=QmZuo+ybpJATn2bpmaua7kc43aQHD4tS1HhThTxnJDU=;
 h=From:To:CC:Subject:Date;
 b=VCWfLVA61/QYnzx6Arhp3MKhZEV7InAlntkZiNWjoIFOX2W7LoItenXXfJBpYn6xb
 QQMEsZGIfVyNFEJDWs8DrrMX5AMTjpCrfs+22XI8sO4aWk8sAqWIZDmR4Ml2sMRHPR
 3lB+GOB7EdBhdY43F6EzkL6PPqlDw4PQxNHvJuNI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=VCWfLVA6
Subject: [Buildroot] [PATCH v6 0/3] add support for TI's AM64x boards
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
From: Anand Gadiyar via buildroot <buildroot@buildroot.org>
Reply-To: Anand Gadiyar <gadiyar@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Andrew Davis <afd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series introduces support for TI's AM64x SK boards.

We would like to add support for the AM62x SK as well, but are
currently blocked by availability of some firmware. That's still
on the list, as is the SK-TDA4VM. We should also be able to
enable the beagleboard-ai64 alongside that at the same time.


This series was previously sent out by Xuanhao in August and
was reviewed by Giulio Benetti up to v5 (Thanks!).

This series addresses further review comments for v5 from Romain
Naour. Thanks for the review Romain!

Andrew Davis acked the previous series, except for one new change
that I've addressed in this version.

I addressed all of Romain's comments except one - I couldn't get
the sha256sum for the k3-image-gen package to be updated in the
source repository, so for now it's still manually computed. I'll
see what I can do about getting the repository owners to generate
these automatically at release time.

Changes in v6:
- rebased to latest next branch and retested
- updated u-boot and kernel to latest released versions as of today
From Andrew's comments:
- added a new SOC_TYPE option for k3-image-gen, as requested by Andrew
  Davis in a review comment.
From Romain's comments:
- use "if" instead of "depends on" for sub-options
- move TI K3 R5 Loader defconfig selection to Kconfig
- use $(HOST_DIR) instead of $(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)
- Retain Xuanhao's gmail ID in the MAINTAINERs file, but drop his TI
  email from CC list as it will be inactive till he rejoins TI
- Add a plain-text license file into the k3-image-gen repository and use
  it instead of the HTML manifest file. Confirmed that this is still
  BSD-3-Clause license.
- Add comments in the ti-k3-image-gen.mk file for a couple of options

Changes in v5:
- None (resubmission of Xuanhao's series)

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
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 40 ++++++++++++++++++
 boot/ti-k3-r5-loader/Config.in            | 14 +++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |  2 +
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 45 +++++++++++++++++++++
 configs/am64x_sk_defconfig                | 45 +++++++++++++++++++++
 11 files changed, 262 insertions(+)
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
