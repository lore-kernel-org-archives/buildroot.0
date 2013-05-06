From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 16:36:53 +0200
Subject: [Buildroot] [PATCH v4 4/5] configs: add defconfig for Telit
	EVK-PRO3
In-Reply-To: <1367849457-31738-5-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Mon, 6 May 2013 16:10:56 +0200")
References: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
 <1367849457-31738-5-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <874negi396.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 Fabio> For more info, please find board/telit/evk-pro3/readme.txt
 Fabio> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 Fabio> ---
 Fabio>  ...04.0-0001-watchdog-add-keep-alive-support.patch |  88 ++++++++
 Fabio>  ...02-watchdog-add-at91sam9-watchdog-support.patch | 228 +++++++++++++++++++++
 Fabio>  ...0003-at91sam9260-9g20-add-wathdog-support.patch |  40 ++++
 Fabio>  ...0004-at91sam9260-9g20-fix-wathdog-support.patch |  26 +++
 Fabio>  ...13.04.0-0005-watchdog-enable-for-evk-pro3.patch |  26 +++
 Fabio>  ...t91-at91_dt_defconfig-update-for-evk-pro3.patch |  44 ++++
 Fabio>  board/telit/evk-pro3/readme.txt                    |  28 +++
 Fabio>  configs/telit_evk_pro3_defconfig                   |  15 ++
 Fabio>  8 files changed, 495 insertions(+)
 Fabio>  create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
 Fabio>  create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
 Fabio>  create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
 Fabio>  create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
 Fabio>  create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
 Fabio>  create mode 100644 board/telit/evk-pro3/linux-0001-ARM-at91-at91_dt_defconfig-update-for-evk-pro3.patch
 Fabio>  create mode 100644 board/telit/evk-pro3/readme.txt
 Fabio>  create mode 100644 configs/telit_evk_pro3_defconfig

 Fabio> +++ b/board/telit/evk-pro3/linux-0001-ARM-at91-at91_dt_defconfig-update-for-evk-pro3.patch
 Fabio> @@ -0,0 +1,44 @@
 Fabio> +From fb5e64e2f3aae7189f6d40f1d24570c092f13afd Mon Sep 17 00:00:00 2001
 Fabio> +From: Fabio Porcedda <fabio.porcedda@gmail.com>
 Fabio> +Date: Tue, 25 Sep 2012 09:47:58 +0200
 Fabio> +Subject: [PATCH] ARM: at91: at91_dt_defconfig: update for evk-pro3
 Fabio> +
 Fabio> +- enable ubifs
 Fabio> +- enable /sys/class/gpio
 Fabio> +- choose lzo decompression
 Fabio> +

It would imho be cleaner to stick a evk specific defconfig in
board/telit/evk-pro3/linux.config

 Fabio> +++ b/configs/telit_evk_pro3_defconfig
 Fabio> @@ -0,0 +1,15 @@
 Fabio> +BR2_arm=y
 Fabio> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y

It would be good to add a bit of comments similar to
E.G. sheevaplug_defconfig. An explicit BR2_arm926t=y would also be good.

 Fabio> +BR2_PACKAGE_BUSYBOX_WATCHDOG=y

Is this absolutely required? (E.G. does barebox arm the watchdog?) It
could be nice with a comment about this.

 Fabio> +BR2_TARGET_ROOTFS_UBIFS=y
 Fabio> +BR2_TARGET_ROOTFS_UBI=y
 Fabio> +BR2_TARGET_BAREBOX=y
 Fabio> +BR2_TARGET_BAREBOX_CUSTOM_VERSION=y
 Fabio> +BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE="2013.04.0"
 Fabio> +BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/telit/evk-pro3"
 Fabio> +BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="telit_evk_pro3"
 Fabio> +BR2_LINUX_KERNEL=y
 Fabio> +BR2_LINUX_KERNEL_PATCH="board/telit/evk-pro3"
 Fabio> +BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 Fabio> +BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
 Fabio> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="evk-pro3"

Please also lock down the kernel version like you do for barebox.

-- 
Bye, Peter Korsgaard
