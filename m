Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A0DC02189
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC4680D4D;
	Sat, 14 Sep 2024 09:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqs7zisW2rWw; Sat, 14 Sep 2024 09:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4FD380D4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4FD380D4E;
	Sat, 14 Sep 2024 09:35:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 994611BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E92FA4043A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9SEG0BtCvip for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D810C40179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D810C40179
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D810C40179
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:35:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6789D78035E;
 Sat, 14 Sep 2024 11:35:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 11:35:23 +0200
Date: Sat, 14 Sep 2024 11:35:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZuVY2zDb9SKGa28s@landeda>
References: <20240831120833.2915529-1-dario.binacchi@amarulasolutions.com>
 <20240831120833.2915529-4-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240831120833.2915529-4-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726306529;
 bh=jyvL1rpVgLJryNzbT4eygmZ6ufHCe/D8gl0FA0T4GX4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZk4tOQoCrsCbc+p1Omq2hTm96jdxfilvRkV+IdEYoW61eGlBkbvQ2bFYzymW83rh
 lq3ieGZUzUOgdIQ61qoa823rnY93HXhdE5at4OdzY9vDiNZZAs1Z1Zic61bK5J9r0o
 8wVi4oHjJ6CrLQbsilJdiHllfXMXnEVyL1+ypI1fvdSl9il4Ri9wJcGenpHRW0fERp
 G10rmJzTnbZFxrLT7owjeFkbvfKOBOS0XZD7woJfSej54TC+Fh8JRdnXfpRkFUymPd
 H+kwFnrgowJmmt7BIRQqEl+OueBl65lvlLsvC3H9sVTAonDwV4D2f/mCwtpkNr+KF0
 MgAL5EcpL21NA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MZk4tOQo
Subject: Re: [Buildroot] [PATCH v4 3/3] board/canaan/k210-soc: use tinyinit
 as Linux init process
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-08-31 14:08 +0200, Dario Binacchi spake thusly:
> The initialization script provided by the tinyinit package is the same
> as the one contained in board/canaan/k210-soc/rootfs_overlay/sbin/init
> except for the Linux logo, which has been removed. The patch reworks
> the configurations that use this overlay directory by replacing the
> initialization process contained within it with the one provided by
> the tinyinit package.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v3 -> v4:
>  - Replace BR2_INIT_NONE=y and BR2_PACKAGE_TINYINIT=y with
>    BR2_INIT_TINYINIT=y in stm32f746_disco_sd_defconfig
> 
> Changes v2 -> v3:
>  - Replace BR2_INIT_TINYINIT=y with BR2_INIT_NONE=y and
>    BR2_PACKAGE_TINYINIT=y in stm32f746_disco_sd_defconfig.
> 
> Changes v1 -> v2:
>  - Remove the logo management.
>  - Update the commit message.
> 
>  .checkpackageignore                           |  1 -
>  board/canaan/k210-soc/rootfs_overlay/init     |  1 -
>  .../canaan/k210-soc/rootfs_overlay/sbin/init  | 41 -------------------
>  configs/canaan_kd233_defconfig                |  3 +-
>  configs/sipeed_maix_bit_defconfig             |  3 +-
>  configs/sipeed_maix_bit_sdcard_defconfig      |  3 +-
>  configs/sipeed_maix_dock_defconfig            |  3 +-
>  configs/sipeed_maix_dock_sdcard_defconfig     |  3 +-
>  configs/sipeed_maix_go_defconfig              |  3 +-
>  configs/sipeed_maix_go_sdcard_defconfig       |  3 +-
>  configs/sipeed_maixduino_defconfig            |  3 +-
>  configs/sipeed_maixduino_sdcard_defconfig     |  3 +-
>  12 files changed, 9 insertions(+), 61 deletions(-)
>  delete mode 120000 board/canaan/k210-soc/rootfs_overlay/init
>  delete mode 100755 board/canaan/k210-soc/rootfs_overlay/sbin/init
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 4cfc202153c7..849bb2a55e47 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -22,7 +22,6 @@ board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh Shellcheck
>  board/bsh/imx8mn-bsh-smm-s2/flash.sh Shellcheck lib_shellscript.EmptyLastLine
>  board/bsh/imx8mn-bsh-smm-s2/post-build.sh Shellcheck
>  board/canaan/k210-soc/post-build.sh Shellcheck
> -board/canaan/k210-soc/rootfs_overlay/sbin/init Shellcheck
>  board/chromebook/elm/sign.sh Shellcheck
>  board/chromebook/mksd.sh Shellcheck
>  board/chromebook/snow/sign.sh Shellcheck
> diff --git a/board/canaan/k210-soc/rootfs_overlay/init b/board/canaan/k210-soc/rootfs_overlay/init
> deleted file mode 120000
> index a0b71977c06f..000000000000
> --- a/board/canaan/k210-soc/rootfs_overlay/init
> +++ /dev/null
> @@ -1 +0,0 @@
> -/sbin/init
> \ No newline at end of file
> diff --git a/board/canaan/k210-soc/rootfs_overlay/sbin/init b/board/canaan/k210-soc/rootfs_overlay/sbin/init
> deleted file mode 100755
> index d4bf53d45231..000000000000
> --- a/board/canaan/k210-soc/rootfs_overlay/sbin/init
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -#!/bin/sh
> -
> -# This script replaces the default busybox init process to avoid having that
> -# process staying alive and sleeping in the background, (uselessly) consuming
> -# precious memory.
> -
> -# Mount procfs and sysfs
> -/bin/mount -t proc proc /proc
> -/bin/mount -t sysfs sysfs /sys
> -
> -# When the kernel is directly booted, devtmpfs is not automatically mounted.
> -# Manually mount it if needed.
> -devmnt=$(mount | grep -c devtmpfs)
> -if [ ${devmnt} -eq 0 ]; then
> -    /bin/mount -t devtmpfs devtmpfs /dev
> -fi
> -
> -# Use the /dev/console device node from devtmpfs if possible to not
> -# confuse glibc's ttyname_r().
> -# This may fail (E.G. booted with console=), and errors from exec will
> -# terminate the shell, so use a subshell for the test
> -if (exec 0</dev/console) 2>/dev/null; then
> -    exec 0</dev/console
> -    exec 1>/dev/console
> -    exec 2>/dev/console
> -fi
> -
> -# Clear memory to reduce page fragmentation
> -echo 3 > /proc/sys/vm/drop_caches
> -
> -# Print a fun logo :)
> -echo "          __  _"
> -echo "         / / (_) ____   _   _ __  __"
> -echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
> -echo "       / /___| || | | || |_| | >  < "
> -echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
> -echo "    64-bits RISC-V Kendryte K210 NOMMU"
> -echo ""
> -
> -# Finally, let's start an interactive shell
> -exec /bin/sh
> diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
> index 832f8363a75c..27624aff4a9a 100644
> --- a/configs/canaan_kd233_defconfig
> +++ b/configs/canaan_kd233_defconfig
> @@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  
>  # Filesystem
> -BR2_INIT_NONE=y
> +BR2_INIT_TINYINIT=y
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> -BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
> diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
> index 238e082a3d40..5119307330de 100644
> --- a/configs/sipeed_maix_bit_defconfig
> +++ b/configs/sipeed_maix_bit_defconfig
> @@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  
>  # Filesystem
> -BR2_INIT_NONE=y
> +BR2_INIT_TINYINIT=y
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> -BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
> diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
> index 28aa143583bd..4047da159221 100644
> --- a/configs/sipeed_maix_bit_sdcard_defconfig
> +++ b/configs/sipeed_maix_bit_sdcard_defconfig
> @@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_bit"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  
>  # Filesystem
> -BR2_INIT_NONE=y
> +BR2_INIT_TINYINIT=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
> -BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
> diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
> index ee1b0d837284..0caa4d4e3ae3 100644
> --- a/configs/sipeed_maix_dock_defconfig
> +++ b/configs/sipeed_maix_dock_defconfig
> @@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  
>  # Filesystem
> -BR2_INIT_NONE=y
> +BR2_INIT_TINYINIT=y
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> -BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
> diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
> index 41a062c7a179..ecb640a47bb2 100644
> --- a/configs/sipeed_maix_dock_sdcard_defconfig
> +++ b/configs/sipeed_maix_dock_sdcard_defconfig
> @@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_dock"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  
>  # Filesystem
> -BR2_INIT_NONE=y
> +BR2_INIT_TINYINIT=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
> -BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
> diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
> index a5b09e17ac1c..21075a9ed004 100644
> --- a/configs/sipeed_maix_go_defconfig
> +++ b/configs/sipeed_maix_go_defconfig
> @@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  
>  # Filesystem
> -BR2_INIT_NONE=y
> +BR2_INIT_TINYINIT=y
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> -BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
> diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
> index 0e80d9c83ad8..5448bd0ce351 100644
> --- a/configs/sipeed_maix_go_sdcard_defconfig
> +++ b/configs/sipeed_maix_go_sdcard_defconfig
> @@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_go"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  
>  # Filesystem
> -BR2_INIT_NONE=y
> +BR2_INIT_TINYINIT=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
> -BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
> diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
> index 7ba7653e8d5f..6c93b29b4343 100644
> --- a/configs/sipeed_maixduino_defconfig
> +++ b/configs/sipeed_maixduino_defconfig
> @@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  
>  # Filesystem
> -BR2_INIT_NONE=y
> +BR2_INIT_TINYINIT=y
>  BR2_TARGET_ROOTFS_INITRAMFS=y
> -BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
> diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
> index 7bdd36e1d09f..0b42cae45df7 100644
> --- a/configs/sipeed_maixduino_sdcard_defconfig
> +++ b/configs/sipeed_maixduino_sdcard_defconfig
> @@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maixduino"
>  # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  
>  # Filesystem
> -BR2_INIT_NONE=y
> +BR2_INIT_TINYINIT=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
> -BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
