Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCEAE7716E
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 03:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F0A140821;
	Fri,  6 Dec 2024 03:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oq6hCNb8C0us; Fri,  6 Dec 2024 03:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D865407ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D865407ED;
	Fri,  6 Dec 2024 03:04:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D801FAE8
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A104A404B1
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FU2ly7GTdpym for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 03:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D68B400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D68B400FB
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D68B400FB
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:04:30 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-215909152c5so18299435ad.3
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 19:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733454269; x=1734059069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J4nYGOOKlVAGAUqFLfU/3CawUcs5UFrwnOWYLPNjy9c=;
 b=SUjlxSwx1f2V444YBWi5kUmN6qEY3W2XmtsZ5iqjCCWmtYsZh/DDhlo7xKf68cXSrg
 Dse8SMTwk5CbG3/bGgeyozxDPulDsmtGuncks1aXZFIE5vxCzAEv/H/tYSCVsxJHohx3
 SgHflmi2dZyS7TPLJQdmmGySiuKC4Z8i3JuWZMvwaJcb4vgAkqiIOfDGkzfAcyakkuHY
 IMatJxrfmDAF0qWafA9MhKbNetA+uQzKruIZVcyKmud9zTwyNLQXoc3Exi8GiDS4cNs3
 6Rz34SVKjcUPCEdZkZ5JCRt4a0xge4iy9CnxbwrH5zfqGh4YVeZ14N1Se129DNgaoo6O
 xxPg==
X-Gm-Message-State: AOJu0Yw6udy9pHcATht03PlRlau/jwJsfVnuoKqCMgAKUzWBstUWR1RJ
 wBDhUxOFIYMAqNxLvHaeJMCI1sL73GLlGMyKLOxNK4PD/xlETNCuglGwiA==
X-Gm-Gg: ASbGncswASB/Vih+VfnHnMsJivvJmDXzVjG7/KtV8xqTaCAISzYZFuM38zBFlC6V2a/
 8M4y8ltooztNY+LXJlkEo6c5XP6VB93fhoqSYcZMsUb6hMUhrg3zmlePs64wHnfeCXmw0Z6n1FJ
 Lm6Vtqn1Jnizr8m6dPmmn8YtklV1eFYh+h9PKRjAjSaRmgGWreQMFeMAeOaB8a3Ht9AYs9p3WTX
 8bsUVHcXLY9Qp+VfZJLsynHI5OiSQc03ujAMtUKcSTpXiI=
X-Google-Smtp-Source: AGHT+IFDzTJb4q30fHpznSktU2CFbOmHtWcTDTNnBHhP16siK94/YUdgHBxLJnHJPsZoMixq+YBktg==
X-Received: by 2002:a17:902:d54a:b0:215:435d:b424 with SMTP id
 d9443c01a7336-21614e05fe8mr18189425ad.47.1733454269356; 
 Thu, 05 Dec 2024 19:04:29 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8e66c1esm19428545ad.102.2024.12.05.19.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 19:04:28 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Fri,  6 Dec 2024 11:04:17 +0800
Message-ID: <20241206030420.246832-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733454269; x=1734059069; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J4nYGOOKlVAGAUqFLfU/3CawUcs5UFrwnOWYLPNjy9c=;
 b=bTYqcKbLGpkm9mnAJX/S7XSRXnE7ohiuKkQpt5F4xr9lXPnBUnmDp/EsHQu75FfyRb
 Fq+ZFwS5KvT61RCK4PcZybt3QBYtI9wK7BQQi8tILsq1SoFJmkz8osy4LOWSHnYxGQ7j
 LvNapFTYll21+e4JNgd50LckxljWdyNjDQSmKQkeeuKHBoWy+PoqysAStVKXW0OBwn4Z
 +FnvH+XbMC7yyev7cAfMyF/tGiQcXFzuMLqemU861fJN4ggBZnbsbJGYpb7TSdgSM2/L
 QFYKmZGeBZmF9o+O1Qd7F8QnVOfeJGozHSfqlV5QLOe6YYzv1MVHz6YxlBxIa5li41GN
 IPqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bTYqcKbL
Subject: [Buildroot] [PATCH v3 1/2] configs/cubieboard2: bump Linux to
 6.11.11 and U-Boot to 2024.10
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

The boot.vfat image size is not enough now. The new zImage file
is over 10M, so it is expanded to 16M.

This commit also adds the custom version package hashes, and
the corresponding ".checkpackageignore" entry is also removed.

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - bump linux to 6.11.7
  - add the linux.hash and uboot.hash file
  - remove obsolete entry from the .checkpackageignore file

Changes v2 -> v3:
  - bump linux to 6.11.11
---
 .checkpackageignore                                    |  1 -
 board/cubietech/cubieboard2/genimage.cfg               |  2 +-
 .../patches/linux-headers/linux-headers.hash           |  1 +
 board/cubietech/cubieboard2/patches/linux/linux.hash   |  2 ++
 board/cubietech/cubieboard2/patches/uboot/uboot.hash   |  2 ++
 configs/cubieboard2_defconfig                          | 10 ++++++----
 6 files changed, 12 insertions(+), 6 deletions(-)
 create mode 120000 board/cubietech/cubieboard2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/cubietech/cubieboard2/patches/linux/linux.hash
 create mode 100644 board/cubietech/cubieboard2/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 0dcca5ebc7..7fe1944ae6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -137,7 +137,6 @@ configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
 configs/canaan_kd233_defconfig lib_defconfig.ForceCheckHash
 configs/ci20_defconfig lib_defconfig.ForceCheckHash
-configs/cubieboard2_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
index 0ba74d6be3..f8a8ec05c8 100644
--- a/board/cubietech/cubieboard2/genimage.cfg
+++ b/board/cubietech/cubieboard2/genimage.cfg
@@ -10,7 +10,7 @@ image boot.vfat {
 		}
 	}
 
-	size = 10M
+	size = 16M
 }
 
 image sdcard.img {
diff --git a/board/cubietech/cubieboard2/patches/linux-headers/linux-headers.hash b/board/cubietech/cubieboard2/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/cubietech/cubieboard2/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/cubietech/cubieboard2/patches/linux/linux.hash b/board/cubietech/cubieboard2/patches/linux/linux.hash
new file mode 100644
index 0000000000..4759f8354e
--- /dev/null
+++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
diff --git a/board/cubietech/cubieboard2/patches/uboot/uboot.hash b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 14d080d2d4..42344eaf9e 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,23 +1,25 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard2/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
