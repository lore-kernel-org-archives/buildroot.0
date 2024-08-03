Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67575C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 15:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2086440454;
	Sat,  3 Aug 2024 15:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skV6WG3lz_vl; Sat,  3 Aug 2024 15:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3304D40364
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3304D40364;
	Sat,  3 Aug 2024 15:55:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4BE91BF3B8
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 15:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF7E640386
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 15:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llpMJll_FJ-a for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 15:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4168040384
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4168040384
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4168040384
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 15:55:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7a9e25008aso1193239366b.0
 for <buildroot@buildroot.org>; Sat, 03 Aug 2024 08:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722700534; x=1723305334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLlK8DpAj3i+PORXra4uCLYCCGZK6FyfsbHouFXp1c0=;
 b=Oz+UXfp/lklxoiBychsG8AqrQAIEFJ/aiKJlCyQ0lZytr5IXvOA69nxU2mLnPPEENY
 izcLaQkQaUjYo97+0s9CQ2GD3PSdXy5mOoWCaIyYJynRb8hLL02qhPzGryTBCjahX1hR
 8bNAcsPTQ4R+HOOOe5exlEknNwjnAQ3hk0SpJP1PLMpf5FrJ3wwnjQyYu0krFQQAln4z
 FEdEdL0PtRFMzElPJ1x48RkKj1MmR4A8kv4Scjn0Lml4K0/ewdGbK9/tKO+5nbL0CYt6
 jepoJ2buFUphqjtzbV5/+LBXr1oqkKocuH3G3ssvEvpvk9yO40vbQpiELSIRyr5+2Srw
 gBTQ==
X-Gm-Message-State: AOJu0YyinXsVv3iMyfXSrorWBx+IYtapsZxWy+47g7/ydSdXnR29uaUU
 8K24HaEbTAuVg0oa3Ib8WhyK780ryUhcoI8H5vlDluWozLDwaSp0T6J+PS1bg+ZSrzy31q2bBsg
 B
X-Google-Smtp-Source: AGHT+IEPYXvfZ6wdewm03a4/PDKmH76Gdt50+zOnUKF681JRzGBzx2U3hQEJWTZPYOyq1JX+2ZmLWQ==
X-Received: by 2002:a17:907:d92:b0:a77:dbf0:d22 with SMTP id
 a640c23a62f3a-a7dc50a4603mr522313866b.65.1722700534120; 
 Sat, 03 Aug 2024 08:55:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-17-93-104.retail.telecomitalia.it. [79.17.93.104])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc9db6sm228584966b.8.2024.08.03.08.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 08:55:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 17:55:17 +0200
Message-ID: <20240803155517.3499273-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
References: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1722700534; x=1723305334;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MLlK8DpAj3i+PORXra4uCLYCCGZK6FyfsbHouFXp1c0=;
 b=XE0xe1OPfPzIZYnU/BEh/L4Kcs4iZXPddb+ASueEdFEFFKbiqPmhu4whcLHbWurBki
 eXjFHWKCQbsbR8rlkZPnrNhtNCWAvv+GBxU1DOfGDW0OQu9+BEqTqK3S4iQ9+atUtrjG
 CcsyMxh7qGljEsPLxFfAr894/NLYd9ddt5XhA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XE0xe1OP
Subject: [Buildroot] [PATCH 3/3] board/canaan/k210-soc: use tinit as Linux
 init process
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The initialization script provided by the tinit package is the same as
the one contained in board/canaan/k210-soc/rootfs_overlay/sbin/init
except for the Linux logo, which has been removed. The patch reworks
the configurations that use this overlay directory by replacing the
initialization process contained within it with the one provided by
the tinit package and adding to it the textual logo displayed by the
old init script.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 board/canaan/k210-soc/rootfs_overlay/init     |  1 -
 .../canaan/k210-soc/rootfs_overlay/sbin/init  | 41 -------------------
 board/canaan/k210-soc/tinit-logo.txt          |  7 ++++
 board/canaan/k210-soc/tinit-setup.sh          | 10 +++++
 configs/canaan_kd233_defconfig                |  4 +-
 configs/sipeed_maix_bit_defconfig             |  4 +-
 configs/sipeed_maix_bit_sdcard_defconfig      |  5 +--
 configs/sipeed_maix_dock_defconfig            |  4 +-
 configs/sipeed_maix_dock_sdcard_defconfig     |  5 +--
 configs/sipeed_maix_go_defconfig              |  4 +-
 configs/sipeed_maix_go_sdcard_defconfig       |  4 +-
 configs/sipeed_maixduino_defconfig            |  4 +-
 configs/sipeed_maixduino_sdcard_defconfig     |  5 +--
 14 files changed, 35 insertions(+), 64 deletions(-)
 delete mode 120000 board/canaan/k210-soc/rootfs_overlay/init
 delete mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
 create mode 100644 board/canaan/k210-soc/tinit-logo.txt
 create mode 100755 board/canaan/k210-soc/tinit-setup.sh

diff --git a/.checkpackageignore b/.checkpackageignore
index 10662bb11edc..61e2116c5055 100644
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
diff --git a/board/canaan/k210-soc/tinit-logo.txt b/board/canaan/k210-soc/tinit-logo.txt
new file mode 100644
index 000000000000..ab4484da6475
--- /dev/null
+++ b/board/canaan/k210-soc/tinit-logo.txt
@@ -0,0 +1,7 @@
+echo "          __  _"
+echo "         / / (_) ____   _   _ __  __"
+echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
+echo "       / /___| || | | || |_| | >  < "
+echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
+echo "    64-bits RISC-V Kendryte K210 NOMMU"
+echo ""
diff --git a/board/canaan/k210-soc/tinit-setup.sh b/board/canaan/k210-soc/tinit-setup.sh
new file mode 100755
index 000000000000..f6564dda46a6
--- /dev/null
+++ b/board/canaan/k210-soc/tinit-setup.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+
+# Add the Linux logo
+INIT_PATH="${TARGET_DIR}/sbin/init"
+INIT_LOGO_TAG="# Print a fun logo"
+if grep -Eq "^${INIT_LOGO_TAG}" "${INIT_PATH}"; then
+	sed "/^${INIT_LOGO_TAG}/r ${BOARD_DIR}/tinit-logo.txt" -i "${INIT_PATH}"
+	sed "s/^${INIT_LOGO_TAG}/# Print Linux logo/g" -i "${INIT_PATH}"
+fi
diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 832f8363a75c..46ebce77e61d 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -32,6 +32,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/tinit-setup.sh"
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index 238e082a3d40..1d5b16ee25aa 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -32,6 +32,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/tinit-setup.sh"
\ No newline at end of file
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 28aa143583bd..039290aca9ed 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -33,11 +33,10 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_bit"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh board/canaan/k210-soc/tinit-setup.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
 
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index ee1b0d837284..b0cdc3d154a3 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -32,6 +32,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/tinit-setup.sh"
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index 41a062c7a179..068d3748dc42 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -33,11 +33,10 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_dock"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh board/canaan/k210-soc/tinit-setup.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
 
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index a5b09e17ac1c..53ff9c5e5052 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -32,6 +32,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/tinit-setup.sh"
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 0e80d9c83ad8..2d2c26f59f7e 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -33,11 +33,11 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_go"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh board/canaan/k210-soc/tinit-setup.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
 
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index 7ba7653e8d5f..96ee9892852d 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -32,6 +32,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/tinit-setup.sh"
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index 7bdd36e1d09f..120cc127c571 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -33,11 +33,10 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maixduino"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh board/canaan/k210-soc/tinit-setup.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
