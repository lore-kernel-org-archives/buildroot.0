Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C7FF55134
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 06:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF9A41223;
	Sun,  8 Mar 2026 06:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZ2R0r_JtUx8; Sun,  8 Mar 2026 06:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E13B741B86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772951709;
	bh=aJ4eu/UtzEZ20MLdXnttjVmg/W7tib5KAsN7O1SBneg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=guwCHBM1Jow4t/ovN7F7mCyR3+sx2GKMjXpc4rzPF8laZrlNvDq/GJKuwdhmTfGpw
	 NxSxVNX/qDKMTFzFtUZcpog9ICnlLstHHm83Xii7d4QWTj2DqeLV35mUzK5f5sXIUN
	 v1Qv/bSbtBxpNt7RM1GQLepEOSPUuNZ5Xkaj5yGkleLjc9zatlNnM/gb9iEMtZ23f2
	 /PkkfoLMApwy42y0ZVwGMrquhNtqle/Iqj1hu2F+0QKA2UGeYV+IOHOUjTIr3hRMIA
	 LcU40JvvqEqyJ3v2RKEUL24Pvx2k3pWRXJeO/VqgeOlno1AZJq8y4gPAU2+a10wUeH
	 FpgrmCh7XCQGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E13B741B86;
	Sun,  8 Mar 2026 06:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3B97119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 06:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A94D140471
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 06:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OIu0ULLtzzY for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 06:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132b; helo=mail-dy1-x132b.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE1A940229
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE1A940229
Received: from mail-dy1-x132b.google.com (mail-dy1-x132b.google.com
 [IPv6:2607:f8b0:4864:20::132b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE1A940229
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 06:35:06 +0000 (UTC)
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-2be0711f493so2664062eec.0
 for <buildroot@buildroot.org>; Sat, 07 Mar 2026 22:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772951705; x=1773556505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAKuHWZBP+1p1YrAW8BZP8VCniRTLOUhpUJUsZKZOpI=;
 b=WZbXIh0Ls+EkYV5VtjVOHye9PVSka6zrzDy4bm05VyXy4nlXjXB7AZKT/jcTkYj9Ol
 G/Fv3M3kXF8M+gvciHXSOZdwiNOpOi/BkSqLtBlZfmyV/9oP2fvT3dJMGbt0xRMN3yIt
 +0fDz+zlLZmxUHx+jWgPiWrDf2r8yjPYWe07ibT/5btKjZjUw30yUhrRnwuejFStvov6
 97EuXGzPzw5iruBY/RHFixQsp85LUod8LrzrYqPhbWLtKtD5oIqiQPZ3pwO7zUH21yHP
 6Z6GWJ6hYafdOzFC3ersCa0dAkMP37dZmdXO8UjJaXlR4MwedEmn1yohppgSicASq+mp
 QFRg==
X-Gm-Message-State: AOJu0YxKUfej/CXTJKx1Ap9GllCMieYuGLgJ7Cwc3irHzvw/Z8EWYMVu
 DzRkCWDlbfiYjipINLFCWvR3nTamyH5eOlbEIEP/rI09KwHp+iGa0qcHi1Z1kA==
X-Gm-Gg: ATEYQzyaLCwRstIrHnJ6pY/TkdBBqW7w8S/tD93CdYbnKh2nqXiVielJlLJcYAEPy4x
 b54iVQDyXR1H3Jrco1GpeNYeQX/AkSRsTcRrB1HfK+gsJufkYhJ1l5Wd5w4bTaHVZsvEvUgq/SN
 EZhZRRADDk6TbEpprKm7GvaOrCfcyWYQ5q9LqV2c1OCGjsZ8HlfAPnF8UjGPH05gZOTXaNYyLj/
 3CFR961v5HxM5xsxvWWbZLF+ZOlHh2oPVo6RYrzwG8HsttFY8CcxXDPx6F8JBhToppFt95H1LcQ
 nHVRkXOOSO+bcDOtRrXIiLGd0EomaO/84CV4od/q/iW8YfvisNjodlaQl5xYGjlPb72ay00oHGm
 mT3fJsEOtVkGMsAq9QbIyw+1lbrTA2oem9B9YMoQAe7XYRZhYbrF4hCfWg2Vcif9Qe9rRsKQGO/
 s1CO58o0LwIP6GbQWnvOzWEpMieZVzOg==
X-Received: by 2002:a05:7022:684:b0:11b:2a5:3b9b with SMTP id
 a92af1059eb24-128c30b480fmr2731236c88.8.1772951705058; 
 Sat, 07 Mar 2026 22:35:05 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-128c3f4351bsm4681928c88.11.2026.03.07.22.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 22:35:03 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Sun,  8 Mar 2026 14:34:32 +0800
Message-ID: <20260308063433.16295-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772951705; x=1773556505; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dAKuHWZBP+1p1YrAW8BZP8VCniRTLOUhpUJUsZKZOpI=;
 b=HKHwikBOGRx5RMjgdnH3T6dIz1fmFyKwWZQzX/6teoARM/21CAHlLndD2GEz5jPd+E
 XFGHNrDc6OBg2ec+hOpixbpNNBquAbJeOWOBAZZiW/LzBZm2su1TX6ieRBgUMZbsU3HZ
 He7nghf3x6QAbNlQPpxsU1o6XzeGJ+eS1s+ok9zHD7t/7RM3PHN2M4TOFUL3LI8lbPHx
 zPluRBOboJgWat2X7xGOpKeNQ02s6fJ1s+LQAyjr6sWWHBZM5x422/f5PhG2iSBca8HC
 BohVmquvynpk2M/YGIkLnaLCf3pilTWzPSlQ44EndcImkZIHalliJMJB7gluomeZ92Cl
 Z0+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HKHwikBO
Subject: [Buildroot] [PATCH] configs/cubieboard{1,
 2}: bump Linux to 6.19.6 and U-Boot to 2026.01
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

This commit will also switch to the Bootlin glibc stable toolchain.

Switch to Bootlin glibc stable toolchain as requested by the 2024
Buildroot meeting report:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
 board/cubietech/cubieboard2/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard2/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard1_defconfig                        | 8 +++++---
 configs/cubieboard2_defconfig                        | 8 +++++---
 6 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 9ef8b4af9c..8c2bcd4d63 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4850cf670a032c70f38b713a27d62046c5f747caf028c5f50b18f98606a9eb1  linux-6.12.52.tar.xz
+sha256  4d9f3ff73214f68c0194ef02db9ca4b7ba713253ac1045441d4e9f352bc22e14  linux-6.19.6.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
index 98a5c53aaf..b6a925ea4e 100644
--- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/cubietech/cubieboard2/patches/linux/linux.hash b/board/cubietech/cubieboard2/patches/linux/linux.hash
index 9ef8b4af9c..8c2bcd4d63 100644
--- a/board/cubietech/cubieboard2/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4850cf670a032c70f38b713a27d62046c5f747caf028c5f50b18f98606a9eb1  linux-6.12.52.tar.xz
+sha256  4d9f3ff73214f68c0194ef02db9ca4b7ba713253ac1045441d4e9f352bc22e14  linux-6.19.6.tar.xz
diff --git a/board/cubietech/cubieboard2/patches/uboot/uboot.hash b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
index 98a5c53aaf..b6a925ea4e 100644
--- a/board/cubietech/cubieboard2/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index 7948ab3b19..47d882c04f 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard1/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard1/rootfs_overlay"
@@ -8,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.52"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.19.6"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -18,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 43ef33e329..0de3edb93e 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard2/rootfs_overlay"
@@ -9,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.52"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.19.6"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
@@ -19,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
