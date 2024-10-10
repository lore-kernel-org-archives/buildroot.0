Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7143DCFC5E1
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 16:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20FCC81BD9;
	Thu, 10 Oct 2024 16:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siYBLERzEtyG; Thu, 10 Oct 2024 16:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18C4A81BE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C4A81BE3;
	Thu, 10 Oct 2024 16:12:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA6C21BF4D6
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 16:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5B734048B
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 16:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H65B4jR33mPD for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 16:12:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59A9E41011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59A9E41011
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59A9E41011
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 16:12:16 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c8784e3bc8so1446475a12.1
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 09:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728576734; x=1729181534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lghDjjYkL3BqmUIeb6+Cv12sVx748lbmdx3tFYZAO1w=;
 b=uhQztP8/DRP3GlkJ3ExEUsw/qEXdhAWIfgonnCD4DLKrwC/qyv5Yq0tRZq9hWQNcUJ
 lt9OkridSyLRi4rF4OJs4QBquP/Dn7zgqx+xWWioCk6pF/nq5sgKTz0Ttd+ZCE2IqWao
 iermYTpnDuq/E9lEnKMbQgKmSuU8orAQhF1e/NG6VAvAeO5qxpEGHR1QPrmJnAC8TOny
 8zdzXNv8x6/6aGqaR1OtUOc48sawqLuEp/KNcwTcFCoqRF0kk4qIo9iXvxvKMU6aCqIH
 I/T/SjycNGmy/elfm2x/hYCEVZ1BLDBrngYr7+z6p9S8A2LO8RaJ+lWaest5pF4RgVwz
 +XVQ==
X-Gm-Message-State: AOJu0Yw/2y5qn4+Rh8ri3TO224pgsNZdaCSeuKXDixsKxUTOGtFAtHDB
 AzfsuuYHNL1PGILwGlpicUZlfrjSJSmZKmY6mbJQDypnBYT/AeQM5iY+9Fd5sn/hnWcDlWEHvth
 zkio=
X-Google-Smtp-Source: AGHT+IHL9/ZcnaLEKWQA2RnWzFkCVtRIOrBhF7aTvvBs6J0/J7uuDswrQl7CUGFza1bBdwEL5Vn6lw==
X-Received: by 2002:a05:6402:35c6:b0:5c9:60a:5bc2 with SMTP id
 4fb4d7f45d1cf-5c93252fabamr3075449a12.17.1728576734086; 
 Thu, 10 Oct 2024 09:12:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:a293:3a9f:6dc0:1d29])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c9370d2383sm950965a12.11.2024.10.10.09.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 09:12:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 18:12:09 +0200
Message-ID: <20241010161210.3595876-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728576734; x=1729181534;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lghDjjYkL3BqmUIeb6+Cv12sVx748lbmdx3tFYZAO1w=;
 b=ijadoTQ6T8ts6JfpAA0tT61sZZ32ZMNM3+P0Zc6UpbjFzwqnW1Pw9Sh4GfDUZBoL00
 B4e9Kr0wZVgDAB03hgtBrIJVmtfeloDcwN/upmP69ECVfITzeAGb+sKVeaEWm1Ezvrvs
 k4Ph20j8bKnRMSTFInfJpNKh38mNgAhatNL7g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ijadoTQ6
Subject: [Buildroot] [PATCH v2 1/1] configs/ti_am62x_sk: bump Linux to
 6.10.13 and U-Boot to 2024.10
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Bryan Brattlof <bb@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.10.13 and U-Boot to
version 2024.10. As for U-Boot, the new version has added EFI Capsule
support, which depends on GnuTLS, thus requiring the activation of
BR2_TARGET_UBOOT_NEEDS_GNUTLS.
Arm trusted firmware is already up to date.

Co-developed-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Enable BR2_TARGET_UBOOT_NEEDS_GNUTLS.

 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 7 ++++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 53eb1438945b..706ddb8dbbd4 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
+sha256  5ffceb2350db1547e69231a63df2d3beed015a313d7d7adf8b5cb71dedaeb16a  linux-6.10.13.tar.xz
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index fe9b4f53dc63..904fa56c02a3 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index e11b803b73e4..0c37fdc167f0 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.13"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -27,15 +27,16 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
