From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Apr 2016 00:03:14 +0200
Subject: [Buildroot] [PATCH v2] raspberrypi,
	raspberrypi2: add a serial console
In-Reply-To: <1460929546-11966-1-git-send-email-luca@lucaceresoli.net>
References: <1460929546-11966-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160417220314.GA3633@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-04-17 23:45 +0200, Luca Ceresoli spake thusly:
> The current Buildroot defconfigs for Raspberry Pi and Raspberry Pi 2
> instantiate a console on tty1, which appears on HDMI. Add a console on
> the serial port (ttyAMA0) to be more consistent with other defconfigs
> and provide a better out-of-the-box experience to users used to have a
> serial console from Buildroot defconfigs.
> 
> This requires three changes:
>  1. have two 'console=' entries in the kernel command line: tty1,
>     then ttyAMA0;
>  2. change BR2_TARGET_GENERIC_GETTY_PORT to "console", so it starts
>     a getty on the last console= passed to the kernel, ttyAMA0;
>  3. add a new getty on tty1 to the generated inittab.
> 
> Step 2 is actually obtained by removing BR2_TARGET_GENERIC_GETTY_PORT
> entirely from the defconfigs, since "console" is the default value.
> 
> Step 3 requires a post-build script since the Buildroot makefiles can
> configure only one console.
> 
> Note: instead of simply adding a new getty on ttyAMA0 (which would
> work) this patch actually changes BR2_TARGET_GENERIC_GETTY_PORT to
> instantiate a console on UART, then adds back tty1 via
> post-build.sh. This is done only to avoid the "GENERIC_SERIAL" comment
> where we instantiate an HDMI console, then instantiate a really-serial
> console on another line.
> 
> The result is these two inittab lines:
> 
>   console::respawn:/sbin/getty -L  console 0 vt100 # GENERIC_SERIAL
>   tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> 
> v2:
>  - remove BR2_TARGET_GENERIC_GETTY_PORT, it defaults to "console"
>  - rebase on current master
> 
> Tested on both Raspberry Pi B and Raspberry Pi 2, each on serial and
> HDMI console.
> ---
>  board/raspberrypi/post-build.sh  | 9 +++++++++
>  configs/raspberrypi2_defconfig   | 2 +-
>  configs/raspberrypi_defconfig    | 2 +-
>  package/rpi-firmware/cmdline.txt | 2 +-
>  4 files changed, 12 insertions(+), 3 deletions(-)
>  create mode 100755 board/raspberrypi/post-build.sh
> 
> diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
> new file mode 100755
> index 000000000000..7eae14a88569
> --- /dev/null
> +++ b/board/raspberrypi/post-build.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +set -u
> +set -e
> +
> +# Add a console on tty1
> +grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
> +sed -i '/GENERIC_SERIAL/a\
> +tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index 506330cd0780..7fc39c234c32 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -5,7 +5,6 @@ BR2_ARM_FPU_NEON_VFPV4=y
>  
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
> -BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>  BR2_SYSTEM_DHCP="eth0"
>  
>  # Linux headers same as kernel, a 4.1 series
> @@ -33,4 +32,5 @@ BR2_PACKAGE_HOST_MTOOLS=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index 1795b2c03d53..8d13381105c1 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -2,7 +2,6 @@ BR2_arm=y
>  BR2_arm1176jzf_s=y
>  BR2_ARM_EABIHF=y
>  
> -BR2_TARGET_GENERIC_GETTY_PORT="tty1"
>  BR2_SYSTEM_DHCP="eth0"
>  
>  # Linux headers same as kernel, a 4.1 series
> @@ -32,4 +31,5 @@ BR2_PACKAGE_HOST_MTOOLS=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
> diff --git a/package/rpi-firmware/cmdline.txt b/package/rpi-firmware/cmdline.txt
> index 38aa3782621b..155a54693bff 100644
> --- a/package/rpi-firmware/cmdline.txt
> +++ b/package/rpi-firmware/cmdline.txt
> @@ -1 +1 @@
> -root=/dev/mmcblk0p2 rootwait
> +root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
