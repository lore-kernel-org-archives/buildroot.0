From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:19:04 +0200
Subject: [Buildroot] [PATCH v2] board: add support for LinkSprite pcDuino
In-Reply-To: <1465587642-14400-1-git-send-email-geomatsi@gmail.com>
References: <1464291692-28094-1-git-send-email-geomatsi@gmail.com>
 <1465587642-14400-1-git-send-email-geomatsi@gmail.com>
Message-ID: <20160611151904.36d1a0cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 22:40:42 +0300, Sergey Matyukevich wrote:
> Add basic support for LinkSprite pcDuino board series
> including pcDuino, pcDuino-Lite, pcDuino-Lite-WiFi.
> Tested on pcDuino-Lite-WiFi.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Thanks for this new version! It looks pretty good overall, but I have a
few comments here and there.

First of all, you should use pcduino-v1 everywhere, since there are
multiple versions of the pcduino, and not all of them use the same SoC,
nor use the same Device Tree or U-Boot configuration.

>  board/linksprite/pcduino/boot.cmd            |  8 ++++
>  board/linksprite/pcduino/genimage.cfg        | 44 +++++++++++++++++++
>  board/linksprite/pcduino/linux-extras.config | 16 +++++++
>  board/linksprite/pcduino/post-build.sh       | 11 +++++
>  board/linksprite/pcduino/post-image.sh       | 17 ++++++++
>  board/linksprite/pcduino/readme.txt          | 34 +++++++++++++++
>  board/linksprite/pcduino/uboot-env.txt       | 38 ++++++++++++++++

The directory should be named board/linksprite/pcduino-v1/

>  configs/pcduino_defconfig                    | 65 ++++++++++++++++++++++++++++

I think the defconfig should be named linksprite_pcduinov1_defconfig

> +fatload mmc 0 $kernel_addr_r zImage
> +fatload mmc 0 $fdt_addr_r sun4i-a10-pcduino.dtb

So the dtb name does not carry the "v1" thing ?

> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"zImage",
> +			"sun4i-a10-pcduino.dtb",
> +			"boot.scr"
> +		}
> +	}
> +	size = 10M

16M looks more "normal" :)


> +rm -rf "${GENIMAGE_TMP}"
> +mv ${BINARIES_DIR}/sun4i-a10-pcduino.dtb ${BINARIES_DIR}/sun4i-a10-pcduino.dtb

Not sure what this line is doing.

> diff --git a/board/linksprite/pcduino/readme.txt b/board/linksprite/pcduino/readme.txt
> new file mode 100644
> index 0000000..3227e75
> --- /dev/null
> +++ b/board/linksprite/pcduino/readme.txt
> @@ -0,0 +1,34 @@
> +pcDuino v1 (http://www.linksprite.com/linksprite-pcduino)
> +
> +Intro
> +=====
> +
> +This default configuration will allow you to start experimenting with the
> +buildroot environment for the LinkSprite pcDuino v1 board including its flavors
> +pcDuino-Lite and pcDuino-Lite-WiFi. With the current configuration it will bring-up the
> +board and allow access through the serial console as well as ethernet and wireless network interfaces.

Please wrap lines at 72 characters. Your favorite text editor should be
capable of doing this for you.

> +
> +How to build it
> +===============
> +
> +Configure Buildroot:
> +
> +    $ make pcduino_defconfig
> +
> +Modify Buildroot configuration if needed, e.g. add more packages to target:
> +
> +    $ make menuconfig
> +
> +Compile everything and build the SD card image:
> +
> +    $ make
> +
> +How to write the SD card
> +========================
> +
> +Once the build process is finished you will have an image called "sdcard.img"
> +in the output/images/ directory.
> +
> +Copy the bootable "sdcard.img" onto an SD card with "dd":
> +
> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX

Please indicate how to boot the SD card image on the board (if there is
a need to push a button or something).

> diff --git a/board/linksprite/pcduino/uboot-env.txt b/board/linksprite/pcduino/uboot-env.txt
> new file mode 100644
> index 0000000..cf504c6
> --- /dev/null
> +++ b/board/linksprite/pcduino/uboot-env.txt
> @@ -0,0 +1,38 @@
> +baudrate=115200
> +boot_a_script=load ${devtype} ${devnum}:${distro_bootpart} ${scriptaddr} ${prefix}${script}; source ${scriptaddr}
> +boot_extlinux=sysboot ${devtype} ${devnum}:${distro_bootpart} any ${scriptaddr} ${prefix}extlinux/extlinux.conf
> +boot_net_usb_start=usb start
> +boot_prefixes=/ /boot/
> +boot_script_dhcp=boot.scr.uimg
> +boot_scripts=boot.scr.uimg boot.scr
> +boot_targets=fel mmc0 usb0 pxe dhcp
> +bootcmd=run distro_bootcmd
> +bootcmd_dhcp=run boot_net_usb_start; if dhcp ${scriptaddr} ${boot_script_dhcp}; then source ${scriptaddr}; fi
> +bootcmd_fel=if test -n ${fel_booted} && test -n ${fel_scriptaddr}; then echo '(FEL boot)'; source ${fel_scriptaddr}; fi
> +bootcmd_mmc0=setenv devnum 0; run mmc_boot
> +bootcmd_pxe=run boot_net_usb_start; dhcp; if pxe get; then pxe boot; fi
> +bootcmd_usb0=setenv devnum 0; run usb_boot
> +bootdelay=2
> +bootm_size=0xa000000
> +console=ttyS0,115200
> +dfu_alt_info_ram=kernel ram 0x42000000 0x1000000;fdt ram 0x43000000 0x100000;ramdisk ram 0x43300000 0x4000000
> +distro_bootcmd=for target in ${boot_targets}; do run bootcmd_${target}; done
> +ethaddr=02:08:09:80:bb:50
> +fdt_addr_r=0x43000000
> +fdtcontroladdr=4af3c5e0
> +fdtfile=sun4i-a10-pcduino.dtb
> +kernel_addr_r=0x42000000
> +mmc_boot=if mmc dev ${devnum}; then setenv devtype mmc; run scan_dev_for_boot_part; fi
> +preboot=usb start
> +pxefile_addr_r=0x43200000
> +ramdisk_addr_r=0x43300000
> +scan_dev_for_boot=echo Scanning ${devtype} ${devnum}:${distro_bootpart}...; for prefix in ${boot_prefixes}; do run scan_dev_for_extlinux; run scan_dev_for_scripts; done
> +scan_dev_for_boot_part=part list ${devtype} ${devnum} -bootable devplist; env exists devplist || setenv devplist 1; for distro_bootpart in ${devplist}; do if fstype ${devtype} ${devnum}:${distro_bootpart} bootfstype; then run scan_dev_for_boot; fi; done
> +scan_dev_for_extlinux=if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}extlinux/extlinux.conf; then echo Found ${prefix}extlinux/extlinux.conf; run boot_extlinux; echo SCRIPT FAILED: continuing...; fi
> +scan_dev_for_scripts=for script in ${boot_scripts}; do if test -e ${devtype} ${devnum}:${distro_bootpart} ${prefix}${script}; then echo Found U-Boot script ${prefix}${script}; run boot_a_script; echo SCRIPT FAILED: continuing...; fi; done
> +scriptaddr=0x43100000
> +serial#=162367080980bb50
> +stderr=serial,vga
> +stdin=serial,usbkbd
> +stdout=serial,vga
> +usb_boot=usb start; if usb dev ${devnum}; then setenv devtype usb; run scan_dev_for_boot_part; fi

Why do you need such a big U-Boot environment? U-Boot doesn't come with
a sane default environment?

> diff --git a/configs/pcduino_defconfig b/configs/pcduino_defconfig
> new file mode 100644
> index 0000000..f0700b1
> --- /dev/null
> +++ b/configs/pcduino_defconfig
> @@ -0,0 +1,65 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a8=y
> +
> +# System settings
> +BR2_TARGET_GENERIC_HOSTNAME="pcduino"
> +BR2_TARGET_GENERIC_ISSUE="pcDuino buildroot is ready"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"

Leave the default getty port.

> +
> +# SD image scripts
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/linksprite/pcduino/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/linksprite/pcduino/post-image.sh"
> +
> +# For kernel modules autoloading
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +
> +# Linux headers same as kernel, a 4.4 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.6"

Any reason to use 4.4 and not 4.6 ?

> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/linksprite/pcduino/linux-extras.config"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +
> +# U-Boot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_LATEST_VERSION=y

Please use a specific version, not "the latest version" option.

> +BR2_TARGET_UBOOT_USE_DEFCONFIG=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Linksprite_pcDuino"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_TARGET_UBOOT_ENVIMAGE=y
> +BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/linksprite/pcduino/uboot-env.txt"
> +BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x20000"
> +
> +# Host packages
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +
> +# Target packages: board access
> +BR2_PACKAGE_LRZSZ=y
> +BR2_PACKAGE_DROPBEAR=y

Those two packages are not needed.

> +
> +# Target packages: wireless support for pcduino-lite-wifi
> +BR2_PACKAGE_IW=y
> +BR2_PACKAGE_WIRELESS_TOOLS=y
> +BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
> +BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y

Could you rework those minor details, and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
