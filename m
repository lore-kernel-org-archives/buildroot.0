From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 15:15:22 +0200
Subject: [Buildroot] [PATCH v2 1/3] Board: Add Bananapi M64 support
In-Reply-To: <1497804482-3511-1-git-send-email-jteki@openedev.com>
References: <1497804482-3511-1-git-send-email-jteki@openedev.com>
Message-ID: <20170624151522.4257c605@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 22:18:01 +0530, Jagan Teki wrote:

>  DEVELOPERS                               |  2 ++
>  board/bananapi/bananapi-m64/boot.cmd     |  6 +++++
>  board/bananapi/bananapi-m64/genimage.cfg | 38 +++++++++++++++++++++++++++
>  board/bananapi/bananapi-m64/readme.txt   | 34 ++++++++++++++++++++++++
>  board/bananapi/post-build.sh             | 10 +++++++
>  configs/bananapi_m64_defconfig           | 45 ++++++++++++++++++++++++++++++++

Please update the .gitlab-ci.yml at the same time.

> diff --git a/board/bananapi/post-build.sh b/board/bananapi/post-build.sh
> new file mode 100755
> index 0000000..d22bc3d
> --- /dev/null
> +++ b/board/bananapi/post-build.sh
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +# args from BR2_ROOTFS_POST_SCRIPT_ARGS
> +# $4 path of boot.cmd
> +
> +MKIMAGE=${HOST_DIR}/usr/bin/mkimage
> +BOOT_CMD="${4}"
> +BOOT_CMD_H="${BINARIES_DIR}/boot.scr"
> +
> +# U-Boot script
> +"${MKIMAGE}" -C none -A arm -T script -d "${BOOT_CMD}" "${BOOT_CMD_H}"

Please drop this post-build script, and instead use the newly
introduced BR2_TARGET_UBOOT_BOOT_SCRIPT option. See
https://git.buildroot.org/buildroot/commit/?id=c40e673c5c8f580bb6066c5dcf69aea3c4d9de63.

> diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
> new file mode 100644
> index 0000000..c1e876e
> --- /dev/null
> +++ b/configs/bananapi_m64_defconfig
> @@ -0,0 +1,45 @@
> +BR2_aarch64=y
> +BR2_cortex_a53=y
> +BR2_ARM_FPU_VFPV4=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Please drop this line, there is no need to enable C++ support.

> +# Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="allwinner"

This version is a branch, which is not good. Please use either a tag,
or a full commit hash.

> +# Filesystem
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M64"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_PACKAGE_HOST_GENIMAGE=y

Please add HOST_DOSFSTOOLS and HOST_MTOOLS, since you're generating a
VFAT filesystem.

> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/post-build.sh"

Those two lines can be dropped when you switch to
BR2_TARGET_UBOOT_BOOT_SCRIPT.

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m64/genimage.cfg board/bananapi/bananapi-m64/boot.cmd"

The last argument here can be dropped when you switch to
BR2_TARGET_UBOOT_BOOT_SCRIPT.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
