Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE91C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 09:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E8C40236;
	Wed, 15 Mar 2023 09:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64E8C40236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cq9eh6a4km8B; Wed, 15 Mar 2023 09:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DA5440240;
	Wed, 15 Mar 2023 09:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DA5440240
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81F471BF2C1
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68D4B40127
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D4B40127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CaFwPCSEhOZN for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 09:17:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7B7E4011B
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7B7E4011B
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 09:17:56 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id cn6so5505827pjb.2
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 02:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yAjRTUjwRLMdchW4KY6OzEvvKPUfJxFJq86PQNfONPs=;
 b=Chheb3f6Fn7qaNykv/x+Er9EOsJ49xm6Esni1kIoer8AJF3BSv/iwcE3qXXc0XvYun
 r8/cOnKz8XOj/z5mZIeckuR+OhPlxJkU1kiKW6HwteCEnpCcKJslRBLdvd77L6gg//Xs
 xoJIBlPbEjcOTmFG+EPvClauqR1+7hFlVISLAGrBQ/9bwrJB6HC0358z2hgPj85+FdrW
 jLL0oiCdZw8Z8x5vVjc4Q8mdh+fAYirb5gREwPiWlTLspQaEBDy4rUQjo13psiXvCb9g
 Fb0f/jIMB1LLG9MfmKU5psw8SpNrWZ7C1flVQDiysM21S4GDJVVzRic3DqQMmI80QHJ8
 yPGA==
X-Gm-Message-State: AO0yUKXuuom2/Fw7g4YQJgrB0rIQH6tbrSW7MbQRIXBm4bR6hzwtjsq4
 LpABNUmYnWYentgU9ayinjFkjESJYCAxRzXW3mo=
X-Google-Smtp-Source: AK7set9NB7BLdh7W2HLzc1Htre4Eh+tBj6ASSJEthpSSSGXPmQQLX4JeOG4g8tM2aCWzQh60DsG/DQ==
X-Received: by 2002:a17:90a:740f:b0:23b:3641:cf16 with SMTP id
 a15-20020a17090a740f00b0023b3641cf16mr13496252pjg.11.1678871875533; 
 Wed, 15 Mar 2023 02:17:55 -0700 (PDT)
Received: from localhost.localdomain ([193.37.32.210])
 by smtp.gmail.com with ESMTPSA id
 h35-20020a631223000000b0050301521335sm2872100pgl.11.2023.03.15.02.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:17:55 -0700 (PDT)
From: Javad Rahimi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 12:47:27 +0330
Message-Id: <20230315091729.1771792-1-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678871876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yAjRTUjwRLMdchW4KY6OzEvvKPUfJxFJq86PQNfONPs=;
 b=cKvbM2TMM4ymUWcgpbzVnIcuiVenx+58zMDHlDvYGwaMfav+PmOcYJgza0PG5cREA3
 eGGXEj0WRRYCZq8btJSiOr+MtsI9EhTDSYQYHt7bwrWlRIQkHAt9y2kZCApIW0FW+Mpg
 PvRysV/XpQ79x7+8N6O6RRvmElWpM29szO/aXGvudTszJ6/ArL305YgFZbAg2//67yod
 xqrBAgzmVzg1ek4HtPf4x8Knsyy3W4ASEj/xZ6h/gtQ9WivnHGFR4jqbFoc1tMkO/O0B
 0DkSGifcGcHjv5rEc1QNVQpKL/LRN4IEgPde4hhzzA2zmZzVJBQ/ennDvUTIk31+CwL5
 T1OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cKvbM2TM
Subject: [Buildroot] [PATCH 1/3] configs/orangepi_pc2: add board support
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
Cc: Javad Rahimi <javad321javad@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds requried configuration for OrangePI PC2 board.
It was supproted before, however due to problems in
building Arm Trusted PLatform, it was removed in
 commit "eeede611f81d8f83b72e4a6671cd7d1e46b266b0"

Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
---
 configs/orangepi_pc2_defconfig | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 configs/orangepi_pc2_defconfig

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
new file mode 100644
index 0000000000..3de067ae54
--- /dev/null
+++ b/configs/orangepi_pc2_defconfig
@@ -0,0 +1,36 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
