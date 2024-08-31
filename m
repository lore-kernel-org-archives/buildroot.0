Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03920CA101C
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 12:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F90742401;
	Sat, 31 Aug 2024 12:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sc0T-IpQThp8; Sat, 31 Aug 2024 12:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 196394242A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 196394242A;
	Sat, 31 Aug 2024 12:08:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36DE21BF5F5
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 12:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3028184120
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 12:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbAwjeH9GiuT for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 12:08:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA5AB84127
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA5AB84127
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA5AB84127
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 12:08:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso3719987a12.1
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 05:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725106126; x=1725710926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JSKYc6C8TT6iYubA26m8JbSuDNI8sNNGFRv1JezIBfI=;
 b=L6ef8CVg7yCUoZoLQOGeNUMAfRItyxaXcMeAcKLnKdT99odB09KKHuHok/vzvEKnNW
 joLwSPnOfU1u+j7FzyEaaGOfTyWohr6vIFlmdSl3b97+53BHsTQ5QwKYLUJ8lpFkrX0d
 XB5+ibS2hjgH/efwL9kdIEubq+0jHfgpwDIm02ch5mcLTfgNt/KlccAIjsShiFgEvdgb
 d7Q3zq4t2pQxFNZMvg9HVvUD7VzYRlqRKMIvrgQSylT1L7A6f29JR0BFDcjmKeflvAsG
 Vr17YUY9Mv4JJLAAj43MF03kaQenEuKS4WHm3PIbFHCh27+PP0CAjopXRlyPtXnf1V+S
 qWNg==
X-Gm-Message-State: AOJu0Yy8np3oanw/xjgVjwsFocLhrlbyyCBuQmvWspsSMgRO8rxM3lae
 EkuCj+31RWJebB0hfuSHnlFlzSWscDeaDsffzFdJtf7EOZq7bfziJkCoMNQ9xxnSLkRyiy06goI
 VCP4=
X-Google-Smtp-Source: AGHT+IH/xgUb4JeEXeTgChvQB/vzVvEfrG5YMJ8ZxWB04MYs6eXqXmvf5wHSfvpYiAX+AgrGslJLFg==
X-Received: by 2002:a05:6402:518a:b0:5c2:4dcc:b90a with SMTP id
 4fb4d7f45d1cf-5c24dccbb2emr368947a12.34.1725106125330; 
 Sat, 31 Aug 2024 05:08:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-52-249.retail.telecomitalia.it. [82.48.52.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ce4f47sm2938178a12.88.2024.08.31.05.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 05:08:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 14:08:33 +0200
Message-ID: <20240831120833.2915529-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240831120833.2915529-1-dario.binacchi@amarulasolutions.com>
References: <20240831120833.2915529-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725106126; x=1725710926;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JSKYc6C8TT6iYubA26m8JbSuDNI8sNNGFRv1JezIBfI=;
 b=MWznTGL+nPrU4WdM5ja1HtQdLnLvx4KQkvFeOBNlqGbVc7wpceA4WCI6zWHsmiiMCx
 OIt/905lx6Zk0sMzeD0QEtl777Wy2ML3Jyq3xR3Rc3rLeEXWzvliY2gtw3pcpolVK76q
 1sTkVS8fixtA7I2KGMbryiC2bGMNGDhBQCLAE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MWznTGL+
Subject: [Buildroot] [PATCH v4 3/3] board/canaan/k210-soc: use tinyinit as
 Linux init process
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
Cc: linux-amarula@amarulasolutions.com, Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The initialization script provided by the tinyinit package is the same
as the one contained in board/canaan/k210-soc/rootfs_overlay/sbin/init
except for the Linux logo, which has been removed. The patch reworks
the configurations that use this overlay directory by replacing the
initialization process contained within it with the one provided by
the tinyinit package.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v3 -> v4:
 - Replace BR2_INIT_NONE=y and BR2_PACKAGE_TINYINIT=y with
   BR2_INIT_TINYINIT=y in stm32f746_disco_sd_defconfig

Changes v2 -> v3:
 - Replace BR2_INIT_TINYINIT=y with BR2_INIT_NONE=y and
   BR2_PACKAGE_TINYINIT=y in stm32f746_disco_sd_defconfig.

Changes v1 -> v2:
 - Remove the logo management.
 - Update the commit message.

 .checkpackageignore                           |  1 -
 board/canaan/k210-soc/rootfs_overlay/init     |  1 -
 .../canaan/k210-soc/rootfs_overlay/sbin/init  | 41 -------------------
 configs/canaan_kd233_defconfig                |  3 +-
 configs/sipeed_maix_bit_defconfig             |  3 +-
 configs/sipeed_maix_bit_sdcard_defconfig      |  3 +-
 configs/sipeed_maix_dock_defconfig            |  3 +-
 configs/sipeed_maix_dock_sdcard_defconfig     |  3 +-
 configs/sipeed_maix_go_defconfig              |  3 +-
 configs/sipeed_maix_go_sdcard_defconfig       |  3 +-
 configs/sipeed_maixduino_defconfig            |  3 +-
 configs/sipeed_maixduino_sdcard_defconfig     |  3 +-
 12 files changed, 9 insertions(+), 61 deletions(-)
 delete mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 delete mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init

diff --git a/.checkpackageignore b/.checkpackageignore
index 4cfc202153c7..849bb2a55e47 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -22,7 +22,6 @@ board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh Shellcheck
 board/bsh/imx8mn-bsh-smm-s2/flash.sh Shellcheck lib_shellscript.EmptyLastLine
 board/bsh/imx8mn-bsh-smm-s2/post-build.sh Shellcheck
 board/canaan/k210-soc/post-build.sh Shellcheck
-board/canaan/k210-soc/rootfs_overlay/sbin/init Shellcheck
 board/chromebook/elm/sign.sh Shellcheck
 board/chromebook/mksd.sh Shellcheck
 board/chromebook/snow/sign.sh Shellcheck
diff --git a/board/canaan/k210-soc/rootfs_overlay/init b/board/canaan/k210-soc/rootfs_overlay/init
deleted file mode 120000
index a0b71977c06f..000000000000
--- a/board/canaan/k210-soc/rootfs_overlay/init
+++ /dev/null
@@ -1 +0,0 @@
-/sbin/init
\ No newline at end of file
diff --git a/board/canaan/k210-soc/rootfs_overlay/sbin/init b/board/canaan/k210-soc/rootfs_overlay/sbin/init
deleted file mode 100755
index d4bf53d45231..000000000000
--- a/board/canaan/k210-soc/rootfs_overlay/sbin/init
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/bin/sh
-
-# This script replaces the default busybox init process to avoid having that
-# process staying alive and sleeping in the background, (uselessly) consuming
-# precious memory.
-
-# Mount procfs and sysfs
-/bin/mount -t proc proc /proc
-/bin/mount -t sysfs sysfs /sys
-
-# When the kernel is directly booted, devtmpfs is not automatically mounted.
-# Manually mount it if needed.
-devmnt=$(mount | grep -c devtmpfs)
-if [ ${devmnt} -eq 0 ]; then
-    /bin/mount -t devtmpfs devtmpfs /dev
-fi
-
-# Use the /dev/console device node from devtmpfs if possible to not
-# confuse glibc's ttyname_r().
-# This may fail (E.G. booted with console=), and errors from exec will
-# terminate the shell, so use a subshell for the test
-if (exec 0</dev/console) 2>/dev/null; then
-    exec 0</dev/console
-    exec 1>/dev/console
-    exec 2>/dev/console
-fi
-
-# Clear memory to reduce page fragmentation
-echo 3 > /proc/sys/vm/drop_caches
-
-# Print a fun logo :)
-echo "          __  _"
-echo "         / / (_) ____   _   _ __  __"
-echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
-echo "       / /___| || | | || |_| | >  < "
-echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
-echo "    64-bits RISC-V Kendryte K210 NOMMU"
-echo ""
-
-# Finally, let's start an interactive shell
-exec /bin/sh
diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 832f8363a75c..27624aff4a9a 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index 238e082a3d40..5119307330de 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 28aa143583bd..4047da159221 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_bit"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index ee1b0d837284..0caa4d4e3ae3 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index 41a062c7a179..ecb640a47bb2 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_dock"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index a5b09e17ac1c..21075a9ed004 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 0e80d9c83ad8..5448bd0ce351 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_go"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index 7ba7653e8d5f..6c93b29b4343 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index 7bdd36e1d09f..0b42cae45df7 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maixduino"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
