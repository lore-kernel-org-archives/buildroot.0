Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5425C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BCD8813A4;
	Sun, 11 Dec 2022 20:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BCD8813A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16VzggIYuH98; Sun, 11 Dec 2022 20:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870B1813C7;
	Sun, 11 Dec 2022 20:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 870B1813C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90D0C1BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AE2C4056A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AE2C4056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3csl8TKsdXTq for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:45:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F6C4047B
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80F6C4047B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:45:16 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id c1so15381972lfi.7
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 12:45:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5gLCo44LklUoYk/WrdDYl3bZnI3zkupAxRSjAWMVQTw=;
 b=4m/v15UdKkZAlr0w2NroLBzDjcdUbZ78CbC5YwlQ5IB5Fp/vgC6Q9O4ZBMCP89cp4N
 B2GMbRgayKCAcLvBbfRlpzIt6LfwbHiyK28oUcfhRIP7vwXh4E0s9QXyPwTdV+y99TlE
 gWG3WqiCuTwmOyHnvZV5d1mc2dHr2PCV2AZmYun1zJBTfvKtgjGL18PhDWVy8qy8WLQX
 O/euRZUCYDa4+rmg3/ATaIuf/gHLI5uw9RxQH0FAZweyGjse06ooZ+1OpXNkJNm8FQ8y
 EpDxGIVbi0W+K/ZkprgMdtyzPDa1t1Kvcwcf9gmT42IOjllHJK5INxGwn23mD0eDGVW0
 O69Q==
X-Gm-Message-State: ANoB5pnnKTYEDV6TL3Ho1NXnjTp4aqzKoCYWFNV3mrb55ljyHMH4Gv8Q
 wJ1MgcTKc+26zy9vIHROTMj/OY9U7NM=
X-Google-Smtp-Source: AA0mqf6PAvkf56jmrJwv9Etfug1yKUk1VFLcghNMNvwRXqQyO8F/0VmgdW4Y18G493LfKzMAKwEGlQ==
X-Received: by 2002:ac2:58ea:0:b0:4a4:68b9:66e1 with SMTP id
 v10-20020ac258ea000000b004a468b966e1mr3110664lfo.44.1670791514365; 
 Sun, 11 Dec 2022 12:45:14 -0800 (PST)
Received: from stuudio.localdomain (94.246.253.165.cable.starman.ee.
 [94.246.253.165]) by smtp.gmail.com with ESMTPSA id
 g20-20020ac24d94000000b004acbfa4a18bsm1327258lfe.173.2022.12.11.12.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 12:45:14 -0800 (PST)
Received: by stuudio.localdomain (Postfix, from userid 1000)
 id 2BD922A249F; Sun, 11 Dec 2022 22:17:09 +0200 (EET)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 22:17:00 +0200
Message-Id: <20221211201704.25858-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5gLCo44LklUoYk/WrdDYl3bZnI3zkupAxRSjAWMVQTw=;
 b=LKRbgadVcyueq++8eaPq3q4ra4JjOi/WNyDofm1Ong2EinjPUKB6VZRzAiye7bDtpp
 w1UV9Fec2P8O9yv4Iln8jH5H8/FmxnabO30JDvEYwHMswmeF1grSZnb4hkWnee4STQS2
 uTpCHUQ9OyAx8odHpGOZtSr6rYHVHcHcA1B7zaxV487O3dlJT6gFrpPek75oKuyUlrVt
 m7EPB3FDa7UhI8NYYT8TzlPRRq3F7FnpWaPMuyKmscDbzsgcpNIi0U/+ayi+3SMqwOqC
 KtteJlT3vTtzGVQsE+Pg53JUdBnUX5FTyArYlcCDJvuTd6NQdvt3mbZCzIlK/PosX3gd
 dHnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LKRbgadV
Subject: [Buildroot] [PATCH 1/5] configs/nezha_defconfig: bump versions for
 uboot, sbi and linux kernel
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

kernel: bump to version 6.1.0-rc3 in d1/wip branch
u-boot: use the version with full SPL support from d1-wip branch
opensbi: take in the latest fixes from d1-wip branch

Other:
remove patches directory definition as no patches are needed anymore
update linux headers version
update binary name as the new uboot generates it

Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
---
 configs/nezha_defconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index 5d0948a013..428c443d65 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -1,13 +1,12 @@
 BR2_riscv=y
-BR2_GLOBAL_PATCH_DIR="board/nezha/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/nezha/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/nezha/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,fe178cf0153d98b71cb01a46c8cc050826a17e77)/linux-fe178cf0153d98b71cb01a46c8cc050826a17e77.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nezha"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-nezha"
@@ -17,14 +16,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3)/opensbi-5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3.tar.gz"
 BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_SUN20I_D1_SPL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,d1-2022-05-26)/uboot-d1-2022-05-26.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nezha"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
@@ -33,5 +32,5 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.toc1"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
