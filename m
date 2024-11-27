Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACE0D66BB0
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 03:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 567CC855A6;
	Wed, 27 Nov 2024 03:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7tU-eszkrnL; Wed, 27 Nov 2024 03:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E7E2855A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E7E2855A0;
	Wed, 27 Nov 2024 03:23:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35E6F1DA8
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 03:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 169184EC94
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 03:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xH2p5BgkuPi for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 03:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.2;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C28C408A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C28C408A4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C28C408A4
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 03:23:46 +0000 (UTC)
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3X1S5kEZnHFymHg--.795S2;
 Wed, 27 Nov 2024 11:23:40 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: buildroot@buildroot.org
Cc: Andy Yan <andyshrk@163.com>
Date: Wed, 27 Nov 2024 11:23:34 +0800
Message-ID: <20241127032336.345826-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3X1S5kEZnHFymHg--.795S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr4xXrW3Gw13Kw4fXw1DKFg_yoWktFX_ur
 yrJw1kuF18Ar92k34Yka18Jr17G3W3t3Wrua1fKFZYvFyjgFnYva97Wr4j9F9aqa9rWr9x
 Xa95CanrWF1IqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRETa03UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMw6kXmdGj2sqRwAAsv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Sf2Kn
 0RA+3ZmV/SlH9G5xUlSs4k9nCVePf7UBJ55uiA=; b=VFSOm+6FbJYtxRTSLH/8Y
 bhVExO0V5NGVYld0maS5vcMEs5iuzODIMUzKX1qeS8Kep4q45l3eor8DQALJLLVF
 SBPs8/IQvMlAx1O2rac9QghADgcI5r4eqWRvzKkyCZ3ljvZ9z4fx+DKJwcDUHdZC
 UiN1JzmhWJbziIwi8HZtaE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=VFSOm+6F
Subject: [Buildroot] [PATCH] configs/rock5b_defconfig: Increase the
 filesystem size to 512MB
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current 250MB filesystem size is not enough which will casue
failure like bellow:

Copying files into the device: __populate_fs: Could not allocate block
in ext2 filesystem while writing file "libharfbuzz-subset.so.0.60900.0"
mkfs.ext4: Could not allocate block in ext2 filesystem while populating
file system
*** Maybe you need to increase the filesystem size
(BR2_TARGET_ROOTFS_EXT2_SIZE)

Signed-off-by: Andy Yan <andyshrk@163.com>
---
 configs/rock5b_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 38b5aad206..43710b6545 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -28,7 +28,7 @@ BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_273
 BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
