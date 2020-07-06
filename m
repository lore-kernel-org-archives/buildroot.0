From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Mon, 6 Jul 2020 10:07:56 +0530
Subject: [Buildroot] [PATCH v3 2/2] configs/rock_pi_4: new defconfig
In-Reply-To: <f6046092-3cc2-7414-8741-612fddb1145f@aliyun.com>
References: <1593893805-8430-1-git-send-email-sunil@amarulasolutions.com>
 <1593893805-8430-3-git-send-email-sunil@amarulasolutions.com>
 <f6046092-3cc2-7414-8741-612fddb1145f@aliyun.com>
Message-ID: <CAM+7aWur5oFNZVCV5HddosWLVysbD9=heXYeY2QsbpN7JL=WjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 6, 2020 at 7:28 AM Tian Yuanhao <tianyuanhao@aliyun.com> wrote:

> Hi Suniel,
>
> On 2020/7/5 ??4:16, Suniel Mahesh wrote:
>  > Add initial support for RK3399 based rockpi-4 targets (model A, B, C)
>  > with below features:
>  >
>  >     - Custom U-Boot 2020.07-rc4
>  >       https://github.com/amarula/u-boot-amarula.git
>  >       branch rock-pi
>  >     - Linux 5.4.46
>  >     - GPT partition layout is being used
>  >     - Default packages from buildroot
>  >
>  > Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
>  > ---
>  > Changes for v3:
>  > - no changes
>  >
>  > Changes for v2:
>  > - renamed and updated defconfig from rockpi_4c to rock_pi_4 and board
> folder
>  >   from rockpi-4c to rockpi-4, so that this will be valid to board
> Models A, B, C.
>  > - Changed commit description.
>  > - updated gitlab-ci.yml.
>  > - updated DEVELOPERS.
>  > - updated readme.
>  > - updated extlinux.conf.
>  > ---
>  >  .gitlab-ci.yml                     |  1 +
>  >  DEVELOPERS                         |  2 ++
>  >  board/radxa/rockpi-4/extlinux.conf |  4 +++
>  >  board/radxa/rockpi-4/genimage.cfg  | 39 ++++++++++++++++++++++++
>  >  board/radxa/rockpi-4/post-build.sh |  5 ++++
>  >  board/radxa/rockpi-4/readme.txt    | 61
> ++++++++++++++++++++++++++++++++++++++
>  >  configs/rock_pi_4_defconfig        | 57
> +++++++++++++++++++++++++++++++++++
>  >  7 files changed, 169 insertions(+)
>  >  create mode 100644 board/radxa/rockpi-4/extlinux.conf
>  >  create mode 100644 board/radxa/rockpi-4/genimage.cfg
>  >  create mode 100755 board/radxa/rockpi-4/post-build.sh
>  >  create mode 100644 board/radxa/rockpi-4/readme.txt
>  >  create mode 100644 configs/rock_pi_4_defconfig
>  >
>  > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>  > index e271770..ac4288b 100644
>  > --- a/.gitlab-ci.yml
>  > +++ b/.gitlab-ci.yml
>  > @@ -323,6 +323,7 @@ riotboard_defconfig: { extends: .defconfig }
>  >  roc_pc_rk3399_defconfig: { extends: .defconfig }
>  >  rock64_defconfig: { extends: .defconfig }
>  >  rockpro64_defconfig: { extends: .defconfig }
>  > +rock_pi_4_defconfig: { extends: .defconfig }
>  >  rock_pi_n10_defconfig: { extends: .defconfig }
>  >  roseapplepi_defconfig: { extends: .defconfig }
>  >  s6lx9_microboard_defconfig: { extends: .defconfig }
>  > diff --git a/DEVELOPERS b/DEVELOPERS
>  > index 05e435d..50fffda 100644
>  > --- a/DEVELOPERS
>  > +++ b/DEVELOPERS
>  > @@ -2403,12 +2403,14 @@ F:    board/firefly/
>  >  F:    board/friendlyarm/nanopc-t4
>  >  F:    board/friendlyarm/nanopi-m4
>  >  F:    board/orangepi/orangepi-rk3399
>  > +F:    board/radxa/rockpi-4
>  >  F:    board/radxa/rockpi-n10
>  >  F:    board/pine64/rockpro64
>  >  F:     configs/nanopc_t4_defconfig
>  >  F:     configs/nanopi_m4_defconfig
>  >  F:    configs/orangepi_rk3399_defconfig
>  >  F:    configs/roc_pc_rk3399_defconfig
>  > +F:    configs/rock_pi_4_defconfig
>  >  F:    configs/rock_pi_n10_defconfig
>  >  F:    configs/rockpro64_defconfig
>  >  F:    package/arm-gnu-a-toolchain/
>  > diff --git a/board/radxa/rockpi-4/extlinux.conf
> b/board/radxa/rockpi-4/extlinux.conf
>  > new file mode 100644
>  > index 0000000..83374f1
>  > --- /dev/null
>  > +++ b/board/radxa/rockpi-4/extlinux.conf
>  > @@ -0,0 +1,4 @@
>  > +label RK3399_ROCK_PI_4 linux
>  > +  kernel /Image
>  > +  devicetree /rk3399-rock-pi-4.dtb
>  > +  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p4 rw
> rootwait
>  > diff --git a/board/radxa/rockpi-4/genimage.cfg
> b/board/radxa/rockpi-4/genimage.cfg
>  > new file mode 100644
>  > index 0000000..88986df
>  > --- /dev/null
>  > +++ b/board/radxa/rockpi-4/genimage.cfg
>  > @@ -0,0 +1,39 @@
>  > +image boot.vfat {
>  > +    vfat {
>  > +        files = {
>  > +            "Image",
>  > +            "rk3399-rock-pi-4.dtb",
>  > +            "extlinux"
>  > +        }
>  > +    }
>  > +    size = 112M
>  > +}
>  > +
>  > +image sdcard.img {
>  > +
>  > +    hdimage {
>  > +        gpt = true
>  > +    }
>  > +
>  > +    partition loader1 {
>  > +        image = "idbloader.img"
>  > +        offset = 32K
>  > +    }
>  > +
>  > +    partition loader2 {
>  > +        image = "u-boot.itb"
>  > +        offset = 8M
>  > +    }
>
> I think using u-boot-rockchip.bin is simpler.
>          partition u-boot {
>                  offset = "32K"
>                  image = "u-boot-rockchip.bin"
>                  in-partition-table = false
>          }
>

Hi Tian,
Rockchip uses unified GPT as its main partition table. We are just
following that.
doc/README.rockchip (GPT partition layout)
http://rockchip.wikidot.com/partitions


>  > +
>  > +    partition boot {
>  > +        partition-type = 0xC
>  > +        bootable = "true"
>  > +        image = "boot.vfat"
>  > +        offset = 16M
>  > +    }
>  > +
>  > +    partition rootfs {
>  > +        partition-type = 0x83
>  > +        image = "rootfs.ext4"
>  > +    }
>  > +}
>  > diff --git a/board/radxa/rockpi-4/post-build.sh
> b/board/radxa/rockpi-4/post-build.sh
>  > new file mode 100755
>  > index 0000000..ba29375
>  > --- /dev/null
>  > +++ b/board/radxa/rockpi-4/post-build.sh
>  > @@ -0,0 +1,5 @@
>  > +#!/bin/sh
>  > +
>  > +BOARD_DIR="$(dirname $0)"
>  > +
>  > +install -m 0644 -D $BOARD_DIR/extlinux.conf
> $BINARIES_DIR/extlinux/extlinux.conf
>  > diff --git a/board/radxa/rockpi-4/readme.txt
> b/board/radxa/rockpi-4/readme.txt
>  > new file mode 100644
>  > index 0000000..1db7569
>  > --- /dev/null
>  > +++ b/board/radxa/rockpi-4/readme.txt
>  > @@ -0,0 +1,61 @@
>  > +RADXA ROCK_PI_4
>  > +================
>  > +https://rockpi.org/rockpi4
>  > +
>  > +ROCK Pi 4 is a Single Board Computer (SBC) from radxa. This guide is
> valid
>  > +for the below models:
>  > +- ROCK PI 4 Model A
>  > +- ROCK PI 4 Model B
>  > +- ROCK PI 4 Model C
>  > +
>  > +Build:
>  > +======
>  > +  $ make rock_pi_4_defconfig
>  > +  $ make
>  > +
>  > +Files created in output directory
>  > +=================================
>  > +
>  > +output/images
>  > +
>  > +??? bl31.elf
>  > +??? boot.vfat
>  > +??? extlinux
>  > +??? idbloader.img
>  > +??? Image
>  > +??? rk3399-rock-pi-4.dtb
>  > +??? rootfs.ext2
>  > +??? rootfs.ext4 -> rootfs.ext2
>  > +??? rootfs.tar
>  > +??? sdcard.img
>  > +??? u-boot.bin
>  > +??? u-boot.itb
>  > +
>  > +Creating bootable SD card:
>  > +==========================
>  > +
>  > +Simply invoke (as root)
>  > +
>  > +sudo dd if=output/images/sdcard.img of=/dev/sdX && sync
>  > +
>  > +Where X is your SD card device.
>  > +
>  > +Booting:
>  > +========
>  > +
>  > +Serial console:
>  > +---------------
>  > +RockPi4 has a 40-pin GPIO header. The pin layout is as follows:
>  > +
>  > +pin 6:  gnd
>  > +pin 8:  tx
>  > +pin 10: rx
>  > +
>  > +Baudrate for this board is 1500000.
>  > +
>  > +Login:
>  > +------
>  > +Enter 'root' as login user, and the prompt is ready.
>  > +
>  > +Wiki link:
>  > +https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/rock-pi-4.html
>  > diff --git a/configs/rock_pi_4_defconfig b/configs/rock_pi_4_defconfig
>  > new file mode 100644
>  > index 0000000..2c1737a
>  > --- /dev/null
>  > +++ b/configs/rock_pi_4_defconfig
>  > @@ -0,0 +1,57 @@
>  > +# Architecture
>  > +BR2_aarch64=y
>  > +BR2_cortex_a72_a53=y
>  > +
>  > +# Linux headers same as kernel, a 5.4 series
>  > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  > +
>  > +# Firmware
>  > +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>  > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>  >
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
>
> The default URL should be fine.
>
>  >
>
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="11a0a46a899fcc3b1fdb214b382f3d7495d88eca"
>  > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
>  > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>  > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
>  > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
>  > +
>  > +# Bootloader
>  > +BR2_TARGET_UBOOT=y
>  > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
>  >
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="
> https://github.com/amarula/u-boot-amarula.git"
>  >
>
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="cf2747360fdd1eb0d51dd01a984c7c62c7f714fe"
>
> I recommend using the mainline U-Boot.
>

Yes Tian agreed, the patches for this target have been mainlined and
waiting to be merged. Once that
is done we will use mainline u-boot.

Thanks & Regards
Suniel

>
>  > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-pi-4-rk3399"
>  > +BR2_TARGET_UBOOT_NEEDS_DTC=y
>  > +BR2_TARGET_UBOOT_NEEDS_PYTHON=y
>  > +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>  > +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  > +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
>  > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
>  > +BR2_TARGET_UBOOT_SPL=y
>  > +BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
>
> I think using u-boot-rockchip.bin is simpler.
> BR2_TARGET_UBOOT_SPL_NAME="u-boot-rockchip.bin"
>
>  > +
>  > +# Kernel
>  > +BR2_LINUX_KERNEL=y
>  > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.46"
>  > +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-pi-4"
>  > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  > +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  > +
>  > +# Filesystem
>  > +BR2_TARGET_GENERIC_HOSTNAME="rockpi4"
>  > +BR2_TARGET_GENERIC_ISSUE="Welcome to ROCK_PI_4..!!"
>  > +BR2_TARGET_ROOTFS_EXT2=y
>  > +BR2_TARGET_ROOTFS_EXT2_4=y
>  > +BR2_TARGET_ROOTFS_EXT2_SIZE="96M"
>  > +BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  > +BR2_PACKAGE_HOST_GENIMAGE=y
>  > +BR2_PACKAGE_HOST_MTOOLS=y
>  > +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>  > +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  > +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rockpi-4/genimage.cfg"
>  > +BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rockpi-4/post-build.sh"
>  >
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
> Regards,
> Yuanhao
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200706/338f974e/attachment.html>
