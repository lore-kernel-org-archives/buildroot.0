Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6986BC52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE4D60E4E;
	Thu, 22 Aug 2024 18:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75BkSO32PnbN; Thu, 22 Aug 2024 18:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E49CA60E92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E49CA60E92;
	Thu, 22 Aug 2024 18:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 107CE1BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F17C540CBB
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51QwtFDlSh7M for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6151540CA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6151540CA3
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6151540CA3
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:37:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3719398eafcso565052f8f.1
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 11:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724351869; x=1724956669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJUf+8K8O1zRMG27X0FoRloRUfG4XE2Ky2O3u3qn/5M=;
 b=lghlzIjPDG7mfp0ofgswWV4ALOgsU3JPMTt1f7uORvlzwgsukxWuvO3KZyNoNf4t/2
 EDCnGRLzbjeZ4LYQUYqcgTKlaYkGKY5K7EO+br07Wt2cDMwAATmQ2TSiiXL7QzDEjRwE
 49SdVRkp9lRlp1guoHvs0NhJNxLfriJkTyDdCvTMzyKgPd7P7HpdjCd7oKKS9RipCbo0
 NhqL3ItlSrjJ5VyQXmbgN1F084Yqsh0takS5nRQlZX4l/zum7FjDJZQwoJ5KTcrsnSwV
 AExrGuRMheCN0qAynO5m3UBoERB5B00b4gi6J1zXka/GOTTUcZEYK22mzrCYmTKxbZN+
 8ZTw==
X-Gm-Message-State: AOJu0Yy3Zm82Rt1G2vq4dfToF65o702eIlKKpqBlHsnjzEaaB5mDBlLE
 JXsf2nFEJklbfDZ6Ss9kR2naqpWaw8NBjCnR9s9cJoLj82K2FnCZuHAUFVmL2llKBqXgu3fNRak
 QmOM=
X-Google-Smtp-Source: AGHT+IEYPkDLtf5ZRoJsqduXDy5k79x6Tr2I8P0OlVL7IVCZ5fGwXPSirEhQu/IRCQaNKuB+RIyAcA==
X-Received: by 2002:adf:fe4f:0:b0:36c:b5a1:f108 with SMTP id
 ffacd0b85a97d-37308d71e1fmr1669066f8f.39.1724351868559; 
 Thu, 22 Aug 2024 11:37:48 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730811001fsm2276397f8f.20.2024.08.22.11.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 11:37:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:37:42 +0200
Message-ID: <20240822183742.3550055-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
References: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724351869; x=1724956669;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJUf+8K8O1zRMG27X0FoRloRUfG4XE2Ky2O3u3qn/5M=;
 b=SjoOODNr7oWnfj46XHIVYF//B+Z4Wza8HG5iv6TXiFrGri74zr0KZNgIbSafHIUc8A
 PoJCNVa8jHuIITL6GRsfaALWWHWn8qrebTQrsLGr8anm+UJfp5U8ookhxLC+5LP11hQP
 VFSQZL2iRum/HObPpw4kl886wjk3AdZrt4C3Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SjoOODNr
Subject: [Buildroot] [PATCH v3 3/3] board/canaan/k210-soc: use tinyinit as
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>,
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

Changes v2 -> v3:
 - Replace BR2_INIT_TINYINIT=y with BR2_INIT_NONE=y and
   BR2_PACKAGE_TINYINIT=y in stm32f746_disco_sd_defconfig.

Changes v1 -> v2:
 - Remove the logo management.
 - Update the commit message.

 .checkpackageignore                           |  1 -
 board/canaan/k210-soc/rootfs_overlay/init     |  1 -
 .../canaan/k210-soc/rootfs_overlay/sbin/init  | 41 -------------------
 configs/canaan_kd233_defconfig                |  2 +-
 configs/sipeed_maix_bit_defconfig             |  2 +-
 configs/sipeed_maix_bit_sdcard_defconfig      |  2 +-
 configs/sipeed_maix_dock_defconfig            |  2 +-
 configs/sipeed_maix_dock_sdcard_defconfig     |  2 +-
 configs/sipeed_maix_go_defconfig              |  2 +-
 configs/sipeed_maix_go_sdcard_defconfig       |  2 +-
 configs/sipeed_maixduino_defconfig            |  2 +-
 configs/sipeed_maixduino_sdcard_defconfig     |  2 +-
 12 files changed, 9 insertions(+), 52 deletions(-)
 delete mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 delete mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init

diff --git a/.checkpackageignore b/.checkpackageignore
index 81e48bf85909..e1ba013fcbc5 100644
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
index 832f8363a75c..dda42836ae1d 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -33,5 +33,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 
 # Filesystem
 BR2_INIT_NONE=y
+BR2_PACKAGE_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index 238e082a3d40..2bd203c45681 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -33,5 +33,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 
 # Filesystem
 BR2_INIT_NONE=y
+BR2_PACKAGE_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 28aa143583bd..fd5f19d5793a 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -34,9 +34,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_bit"
 
 # Filesystem
 BR2_INIT_NONE=y
+BR2_PACKAGE_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index ee1b0d837284..0faa06b7dcb2 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -33,5 +33,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 
 # Filesystem
 BR2_INIT_NONE=y
+BR2_PACKAGE_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index 41a062c7a179..379d228d4c7e 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -34,9 +34,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_dock"
 
 # Filesystem
 BR2_INIT_NONE=y
+BR2_PACKAGE_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index a5b09e17ac1c..33599c19f505 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -33,5 +33,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 
 # Filesystem
 BR2_INIT_NONE=y
+BR2_PACKAGE_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 0e80d9c83ad8..1b03cf6165ad 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -34,9 +34,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_go"
 
 # Filesystem
 BR2_INIT_NONE=y
+BR2_PACKAGE_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index 7ba7653e8d5f..0cdd16df3f87 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -33,5 +33,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 
 # Filesystem
 BR2_INIT_NONE=y
+BR2_PACKAGE_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index 7bdd36e1d09f..629205c5bc49 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -34,9 +34,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maixduino"
 
 # Filesystem
 BR2_INIT_NONE=y
+BR2_PACKAGE_TINYINIT=y
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
