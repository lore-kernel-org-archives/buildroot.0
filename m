Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F0DC43219
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 926C7415C8;
	Tue,  1 Feb 2022 18:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fna7IhxT1PTX; Tue,  1 Feb 2022 18:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C30C0415C0;
	Tue,  1 Feb 2022 18:33:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CB501BF5D7
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61CD7404E0
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxw5-n5RGwW3 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:33:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26BDB400C4
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:33:34 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Exy8nuBUiroAhExy9nYlFx; Tue, 01 Feb 2022 19:33:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643740413; bh=vPbZKqfFlj1AL2uWSRLYST8pYa1azig7q5dtdqMdExI=;
 h=From:To:Subject:Date:MIME-Version;
 b=PgUjop5r0mEytSgv4EHvbmfOHrL+WdVjZjQlslePR+soN/882YmkZKfiQM5kVcGuu
 JamxZ5PRy15kMTwASE5PJ2E1Blk0Cj2WhNkdjCxQ/fdBAQX7E/BuREnzoyWMQMVdnQ
 Za53STRwx0UFy8dNVxcvib9jLrQP2BlWc28iJBpXYw8JlI08NoWj0JuFliMQXrGnjD
 FyBDF96SCGC3UDo8nh3JKsnomolpuZrCCMV4YsqAns245JfIo+NyS07FtGBlhgOjpd
 c0L3m7XOv53XaLa6Vs5UlTogs2NsRgI9GZeKs/+HMfat3g5Ku4kqfXJ+kOwP6SXHWx
 WNKswn6bjPIRQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 19:33:25 +0100
Message-Id: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJmbze+p9u3tW3IQxDOcEZPa52uQOZdgfb7zLLBaCuddIP+FB0/nyD/20HXpnsZMyhx/56sCGCRQtAfwIDw1jVN2vpFtMydrNp3TID99lzhx4EwU5vSr
 iFIiGVp0UIDACxdg2F0VQiMMO51qepwSoUS8C23tHTbxWP8M/BQEfXceY+c9tS0OW8avFTPTGGK9BnKC6BCrEYVkYJKrIHHpXUaCWWzKOBZHeq410aUWr+JX
 UMGYdUqy9QonbpUKGJKUoXkVrjm8glrMEYF8DylXwzaBwKEh92Bzn1Dq70jkpBRbyjG4Yl1A9PBp06tvAzYR9HYwnJ0XsUEcKreo8sPhB2CbDB4+HzhWNpxk
 ZXM74aBwtXMDCz6z8Tb/BKihoNtT4GkkNLpDlnNn85xK9UO2H/OQfpxhvDLGFqQjdnVcU/KVE/fOflp9ez/nduNBs13W0Q==
Subject: [Buildroot] [PATCH 0/6] Fix gitlab CI build failure due to missing
 HOST_ dependencies
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset fixes the gitlab build failure due to HOST_ dependencies(uboot/linux).

Giulio Benetti (6):
  configs/bananapi_m2_ultra_defconfig: u-boot needs host python3 and
    host openssl
  configs/beaglev_defconfig: linux needs host openssl
  configs/microchip_sama5d2_icp_mmc_defconfig: linux needs host openssl
  configs/microchip_sama5d2_icp_mmc_dev_defconfig: linux needs host
    openssl
  configs/microchip_sama7g5ek_mmc_defconfig: add missing
    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15
  configs/microchip_sama7g5ek_mmc_dev_defconfig: add missing
    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15

 configs/bananapi_m2_ultra_defconfig             | 2 ++
 configs/beaglev_defconfig                       | 1 +
 configs/microchip_sama5d2_icp_mmc_defconfig     | 1 +
 configs/microchip_sama5d2_icp_mmc_dev_defconfig | 1 +
 configs/microchip_sama7g5ek_mmc_defconfig       | 1 +
 configs/microchip_sama7g5ek_mmc_dev_defconfig   | 1 +
 6 files changed, 7 insertions(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
