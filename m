From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Mar 2016 22:32:52 +0200
Subject: [Buildroot] [PATCH] raspberrypi,
 raspberrypi2: add a serial console
In-Reply-To: <1459202897-21440-1-git-send-email-luca@lucaceresoli.net>
References: <1459202897-21440-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <56FAE674.6080004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/29/16 00:08, Luca Ceresoli wrote:
> The current Buildroot defconfigs for Raspberry Pi and Raspberry Pi 2
> instantiate a console on tty1, which appears on HDMI. Add a console on
> the serial port (ttyAMA0) to be more consistent with other defconfigs
> and provide a better out-of-the-box experience to users used to have a
> serial console from Buildroot defconfigs.
>
> This requires two changes:
>   1. have two 'console=' entries in the kernel command line;
>   2. add a new getty process to the generated inittab.
>
> Step 2 requires a post-build script since the Buildroot makefiles can
> configure only one console. But instead of simply adding a new getty
> on ttyAMA0 (which would work) this patch actually changes
> BR2_TARGET_GENERIC_GETTY_PORT from tty1 to ttyAMA0, then adds back
> tty1 via post-build.sh. This is done only to avoid the
> "GENERIC_SERIAL" comment where we instantiate an HDMI console, then
> instantiate a really-serial console on another line.
>
> The result is these two inittab lines:
>
>    ttyAMA0::respawn:/sbin/getty -L  ttyAMA0 0 vt100 # GENERIC_SERIAL
>    tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console
>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> ---
>
> Tested on both Raspberry Pi B and Raspberry Pi 2, each on serial and
> HDMI console.
> ---
>   board/raspberrypi/post-build.sh  | 9 +++++++++
>   configs/raspberrypi2_defconfig   | 3 ++-
>   configs/raspberrypi_defconfig    | 3 ++-
>   package/rpi-firmware/cmdline.txt | 2 +-
>   4 files changed, 14 insertions(+), 3 deletions(-)
>   create mode 100755 board/raspberrypi/post-build.sh
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
> index ce41ee31adba..0ffc6cdaf158 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -5,7 +5,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
>
>   BR2_TOOLCHAIN_BUILDROOT_CXX=y
>
> -BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"

  Why not keep the default "console"? That should work, no? Or doesn't that work 
if there are two consoles?


  Regards,
  Arnout


>
>   # Linux headers same as kernel, a 4.1 series
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> @@ -33,4 +33,5 @@ BR2_PACKAGE_HOST_MTOOLS=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index 3b3cc504c2be..717d798b3851 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -2,7 +2,7 @@ BR2_arm=y
>   BR2_arm1176jzf_s=y
>   BR2_ARM_EABIHF=y
>
> -BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"

>
>   # Linux headers same as kernel, a 4.1 series
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> @@ -32,4 +32,5 @@ BR2_PACKAGE_HOST_MTOOLS=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
> diff --git a/package/rpi-firmware/cmdline.txt b/package/rpi-firmware/cmdline.txt
> index 38aa3782621b..155a54693bff 100644
> --- a/package/rpi-firmware/cmdline.txt
> +++ b/package/rpi-firmware/cmdline.txt
> @@ -1 +1 @@
> -root=/dev/mmcblk0p2 rootwait
> +root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
