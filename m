Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E6BE7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E83940569;
	Sun, 15 Dec 2024 10:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzOOwAYaKszk; Sun, 15 Dec 2024 10:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D7A54057A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D7A54057A;
	Sun, 15 Dec 2024 10:14:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18927CE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 064524057A
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSfOm8lpvC7f for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:14:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A83940569
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A83940569
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A83940569
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:07 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so3424422e87.0
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 02:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734257644; x=1734862444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iH4k30l5fSQa2Q/ULdofXPwbYp0M8AciPc57iLt29xI=;
 b=nudkgI637+TSLODhTs4R7FxfrgbD4VlosQR+9VtXoUhBuGaUUojfaoh0CuNVelON2r
 MBSKjNRbp6UVtqX1r08/EjA065E+V6XOccjlPNw+lvwhV6qM+Qaimm9JEBzZ2gn67KLG
 9scN9ypOlZ9gzJTZ2JwMkc6JeMxDU5szrYd5WA/Q7iGuDU3ZXdKtdZLqgi3f2U3o0uK0
 c/iLc+OMXFwSDY+6Di4uLRj4zUDrvPWdCCF9d19iYVJ/+lnf7jU7sOammV97VHnIDHHV
 XPWxk1LVLynlTkrmcJu8xPRR6uR5y6JukfbMa9yE6b8G87GRzjYCqS/tR9nXExK8LMwe
 2A+Q==
X-Gm-Message-State: AOJu0Yxuu8y464en8orQu7y0BcnVL1XeojY29n1lEMYLiX9XMjSBr6vc
 KBDys9CugaWxWU5n9MZs/wniFOSYtMjXCZptZLP2ot0PyXnhLRmaPpLEDIZixkk=
X-Gm-Gg: ASbGncsbNPS0e449gqtLZhF+GadJXuAHpqzR/6N+gFCA8oHtE8N+nAeDShLn23ghuo/
 WV10hkAsuwtllt7bz9Yr3tvP782yuGf6txGDti4hAGH1Zjnx8NrfIc2+n6Nkq5nGz/oewcB7AFx
 rDL3xSZ7NrNM81Q30ixCPF32Lbpeaqdc2ZBZ4JD/d3xvTfiyFGsPbIlkhv8oNp+3PPfMAdGpLKZ
 Y6XKK1OyyW6QS0P2ZITDGbU0dKEntaPwkPzcX4gD42tvQfQgW80dIy6wPtvFRrF
X-Google-Smtp-Source: AGHT+IExU4sg+BcU3iE6dmGAtEW4FM8WztKJSxAoJ3kNxXVWKTc97pcFGJPN4zlDfIFP28D3YL/szA==
X-Received: by 2002:a05:6512:2208:b0:53e:3a73:d179 with SMTP id
 2adb3069b0e04-5409056808bmr2944040e87.31.1734257643928; 
 Sun, 15 Dec 2024 02:14:03 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54120c13d69sm462646e87.217.2024.12.15.02.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 02:14:01 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 13:12:55 +0300
Message-ID: <20241215101353.3214256-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215101353.3214256-1-geomatsi@gmail.com>
References: <20241215101353.3214256-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734257644; x=1734862444; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iH4k30l5fSQa2Q/ULdofXPwbYp0M8AciPc57iLt29xI=;
 b=HcQSD2/svh//X0rLocg4VJuYYitplrl4RXmgDZD4VtVWSrUIXV3yDotNW1mt1OjT+F
 YmA7/Wfme2COUnO8m8UPmCQwuZyOXxxotokrT8TF0KN7Hob7SBbrZhSb69yBqZB4F8Qr
 8HAamEqbEeM0qCwxB6NN8KwrXSvLqWwBs6BM0qp9ZqoyjMTcVFRynkH6cxMtqqkhbyii
 Cmbt32O0ZwqoFKLYY9J8+SoEkJA2minV19noVnPvHv122jFyshMRlM3yf2PDkDeiBzId
 mmvnbfIA3xA/3Alsl0sOiidMzjLatt2pmGzkxV4ECSI9zgpCAZFQsR+XpsJrcdmN9Seb
 Bgvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HcQSD2/s
Subject: [Buildroot] [PATCH 1/4] configs/orangepi_pc_plus: bump BSP versions
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the new Linux LTS release 6.12.3 and to U-Boot 2024.10.
Force check of hashes for Linux kernel, headers, U-Boot. Finally,
add BR2_TARGET_UBOOT_NEEDS_GNUTLS option required by new U-Boot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .checkpackageignore                                      | 1 -
 .../patches/linux-headers/linux-headers.hash             | 1 +
 board/orangepi/orangepi-pc-plus/patches/linux/linux.hash | 2 ++
 board/orangepi/orangepi-pc-plus/patches/uboot/uboot.hash | 2 ++
 configs/orangepi_pc_plus_defconfig                       | 9 ++++++---
 5 files changed, 11 insertions(+), 4 deletions(-)
 create mode 120000 board/orangepi/orangepi-pc-plus/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-pc-plus/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-pc-plus/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index e886d631a6..3e4704a577 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -203,7 +203,6 @@ configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_pc_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/orangepi/orangepi-pc-plus/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-pc-plus/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-pc-plus/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc-plus/patches/linux/linux.hash b/board/orangepi/orangepi-pc-plus/patches/linux/linux.hash
new file mode 100644
index 0000000000..aea771e7bf
--- /dev/null
+++ b/board/orangepi/orangepi-pc-plus/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
diff --git a/board/orangepi/orangepi-pc-plus/patches/uboot/uboot.hash b/board/orangepi/orangepi-pc-plus/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/orangepi/orangepi-pc-plus/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index 1eb54cb43e..878c7294de 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-pc-plus/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC_Plus"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC Plus"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -11,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc-plus/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,11 +34,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
