Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCC6C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D45080D9A;
	Fri, 12 Jul 2024 22:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ke7tBBLwowwG; Fri, 12 Jul 2024 22:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0663080E15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0663080E15;
	Fri, 12 Jul 2024 22:14:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 960C71BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82283404F7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWdkuVW_kkRN for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:13:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B218404F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B218404F6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B218404F6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:13:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4279ca8af51so11778035e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720822436; x=1721427236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ShrnL0gbfN/WdjafKWhrfoKqIrBME342HxyB31Vzs8o=;
 b=VYUpXIhH7EQknjRMvzBI6ODie5QocMud+jl+pvKGpFFl46Z2duc2TEdQPmEFZIFaI4
 xNYZO8Ui2aHyqC2PiHt6zb3GcY8s/pgdSPqWU8AKTEYaiD0hshlDEv9SpTAM20TnPziH
 Pt0+5jH3gViNxPF/FsWxB+17A/KaVg92UyFUJCDmUqUwotMmu+2jPuIHBJEeC6GgPj0O
 jb1ppY7MMeeF+6jAiaTDzHz4oC5n/+/46zh5fO2diHISG39UkUybgrbf4fRV0RwzQOrW
 o7KYVVWzav9FPjYELEqmtyIgXIsA48US4vyv889DIE0a11n1e7hw4jhsvxUa1mVlq0Jy
 /scA==
X-Gm-Message-State: AOJu0YwVpXqYRGniaXmzJvVuXiqdpJHh8/yNX5trT52m++o10Uu69LD+
 1WgskFkNkwNcw8FRJPgSTsOl40fVmx1CbyW/h6ey8vVat2Qul2a7X57UZA==
X-Google-Smtp-Source: AGHT+IF4YBl7b0KX/czu2gzAv7FU5LWh96MEPBXUvavvwezSCaRXxBxAElvR1kwYdOKVMsOIMDz0iA==
X-Received: by 2002:a05:600c:6d8f:b0:426:6f0e:a60 with SMTP id
 5b1f17b1804b1-426707e2ffdmr85533875e9.17.1720822435983; 
 Fri, 12 Jul 2024 15:13:55 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25ac47sm35481525e9.18.2024.07.12.15.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 15:13:55 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 00:13:33 +0200
Message-ID: <20240712221333.909756-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720822436; x=1721427236; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ShrnL0gbfN/WdjafKWhrfoKqIrBME342HxyB31Vzs8o=;
 b=CHm5vYh+tLxQAQXBkcbeP2dGcc1wnf/UFHMapX3Hd3SPmkKBGk45Z0q/c1eVWELq94
 +kdnxNefyJZNeC9hq8zqG2USdwJ31lCj7BPQSibuFVy5s+W9PNt5oWgEnh0nvufMV7uW
 PPvwVZv7vl4n3pEh0CmHGCWJ3LteW9znihIH3JZ0p1mEKqKravjgZI/ljVdCfxPlfmO/
 mCdLHtqVRER7h9plwV01K59XnSbm7LeZMS5a8ebmSMaww5Ufo0Nxlof/B8mCmMhxSBtC
 0npO63L6Xw+QkN8EIxqA53lBuVnqXZgQNdhcxy9AGipimfoa07/RIxvNqPOKsXVoj/oC
 CXfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CHm5vYh+
Subject: [Buildroot] [PATCH v2 1/1] configs/stm32mp157c_dk2: bump {TF-A,
 U-Boot, Linux} versions up
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump TF-A to v2.9
Bump U-Boot to v2024.07
Bump Linux to v6.0

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v2:
  - Keep comments
  - Update TF-A and U-Boot along with the kernel
  - Use explicit versions
---
 configs/stm32mp157c_dk2_defconfig | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index c48705b2fb..c923d2cd60 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 5.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+# Linux headers same as kernel, a 6.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
 
 # System configuration
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
@@ -12,11 +12,11 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-im
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-dk2"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157c-dk2"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Filesystem
@@ -27,7 +27,8 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
@@ -39,11 +40,11 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
-# BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
