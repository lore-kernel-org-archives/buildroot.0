Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FDDC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 15:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C00DF40493;
	Wed,  1 May 2024 15:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAPCIxt0dRIS; Wed,  1 May 2024 15:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68AA240677
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68AA240677;
	Wed,  1 May 2024 15:27:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 510CC1BF297
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 15:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 370AD4029F
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 15:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0EmFLre0XvPs for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 15:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15F9B40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15F9B40139
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15F9B40139
 for <buildroot@buildroot.org>; Wed,  1 May 2024 15:27:40 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 441FRdr2004122;
 Wed, 1 May 2024 10:27:39 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 441FRdIC052907
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 1 May 2024 10:27:39 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 May 2024 10:27:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 May 2024 10:27:39 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 441FRdgA070261;
 Wed, 1 May 2024 10:27:39 -0500
Date: Wed, 1 May 2024 10:27:23 -0500
Message-ID: <20240430-optee-update-v1-0-6f73c4903ec3@ti.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFtfMmYC/x2NQQrDIBQFrxL+uoKxbuxVShdqnvVDMKJJCUjun
 k+XMzDMoI7G6PSaBjX8uPNWBObHRDH78oXiRZiMNlbbp1Zb3QF11MXvUMHFOUQLl4wjSYLvIps
 vMUtUjnUVWRsSn//H+3NdN+WWUElzAAAA
To: Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2759; i=bb@ti.com;
 h=from:subject:message-id; bh=lRiGKL1MgWA+iL/7Q6pfZ3HLx/mArxvtGOzMfalhj+w=;
 b=owNCWmg5MUFZJlNZLnp+fwAAbf////7r/zXuO/b9+9f8/Tu7n2072V7/2Vr9W35v8lx/+/ewA
 RloIepoyMjTRpoaAAyaAAAADQ0Bo0AANPUNAaGho0aGhoMmgDEAepk0xNGTT0CaeogAyNDJo0yN
 A00NNGhoaYgAxGQNGJkyNGE0GQBk0aNADTQaBoNAGjNINMmgBoGUGRk0002po0AaNGmgA0GQGmg
 yBkyBhADRkAMmgxAYQ9QaMgBiaGg0NAZAAYMcFHA6R7GTFM/g+EuFHiMZjgLpbrTIAgTG5EDwPZ
 RDqOgBhlPQeANOI1jJN3GqPeF3TREO3fEWf33tnJcyZHahB8YHadz2UMnrjPEIvk8NrN4fEfd1g
 OaBVlSq07/EPg0gOfQul7GQZhSRZd+qySoS5YRamVPbYanFAhaSEunPzkyMUFBxuIPvhfMMM/bb
 Zvy/D7CZpbTvUf9iEjYu1vwDqKEP7z1US6dABltL+pHz3K0eByaUEzyvTg9vAme4zLDzSroJoxO
 E0bgx0yw0Gxec9qpJRMDC4qk6vboQrdRolPJwLbBCEBAGKarMCsBGrBM/gM6raOFFogWbiI4sRL
 WO8GTqe1dQj154MNnhS4bUA0ULOSQCrY51Tdr1mLOKAaNeFsqSaAz1ERht0kXdhMIcfQDiMHetx
 JP9KuQHLAquEEqjasT/F3JFOFCQLnp+fw==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714577259;
 bh=sItceLM6cGNSBG3NEXjy7TbxQk3TImA1OmLwcvhKjqI=;
 h=From:Subject:Date:To:CC;
 b=bbH2oKMkdlGD/8msAY+pnhV/t7v4pROhaCz93vbbL46O2jxrXyhj3zyqeeO6bKjSy
 Ukd13uivO23bnrg6+4Q4PrTLm8P3xjVznOh3hG/bXft1mlq/UhaNosCVwA+DHvHLXu
 au9CGxKBY0RD0kfD5+BcnctvMZJIipUe8yluTzNQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=bbH2oKMk
Subject: [Buildroot] [PATCH 00/11] update bsp binaries for TI SoCs
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Bryan Brattlof via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone!

This series updates all the boot binaries (U-Boot, OP-TEE, TF-A, and 
Linux) to their latest versions to pull in all bug fixes and new 
features additions in these projects.

This also includes a patch I send out a while ago just to keep things 
organized. 

  https://lore.kernel.org/buildroot/20240402153328.1859642-1-bb@ti.com/

and finally some proof I didn't completely break something ;)

  https://paste.sr.ht/~bryanb/b666adef7da412de76efb5e4a68e68e0651f7928

Thanks for reviewing
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (10):
      boot/optee-os: bump to release v4.2.0
      boot/uboot: bump to latest v2024.04 release of U-Boot
      boot/ti-k3-r5-loader: bump to latest U-Boot release
      configs/ti_am62x_sk_defconfig: update TFA to latest lts release
      configs/ti_am64x_sk_defconfig: update TFA to latest lts release
      configs/ti_am62x_sk_defconfig: update uboot to latest release
      configs/ti_am64x_sk_defconfig: update uboot to latest release
      configs/ti_am62x_sk_defconfig: update to latest kernel
      configs/ti_am64x_sk_defconfig: update to latest kernel
      DEVELOPERS: add myself to TI's packages and reference boards

Bryan Brattlof via buildroot (1):
      boot/ti-k3-boot-firmware: bump to latest version

 DEVELOPERS                                                       | 8 ++++++++
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
 board/ti/am62x-sk/patches/linux/linux.hash                       | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
 board/ti/am64x-sk/patches/linux/linux.hash                       | 2 +-
 boot/optee-os/Config.in                                          | 4 ++--
 boot/optee-os/optee-os.hash                                      | 4 ++--
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash                | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk                  | 4 +---
 boot/ti-k3-r5-loader/Config.in                                   | 4 ++--
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash                        | 2 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk                          | 1 +
 boot/uboot/Config.in                                             | 6 +++---
 boot/uboot/uboot.hash                                            | 2 +-
 configs/ti_am62x_sk_defconfig                                    | 9 ++++-----
 configs/ti_am64x_sk_defconfig                                    | 9 ++++-----
 16 files changed, 34 insertions(+), 29 deletions(-)
---
base-commit: 39ed602169ecf7677328d1387d30869baeb28cea
change-id: 20240430-optee-update-b9c1bc4e9f29

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
