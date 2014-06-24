From: bruce bushby <bruce.bushby@gmail.com>
Date: Tue, 24 Jun 2014 10:22:47 +0100
Subject: [Buildroot] dtb or dtsi ?
Message-ID: <CAHvj1qbZWcdUvq7du=Xo2KXpA_WjXvPr8+wg61niR7TeLVToRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi


Apologies if these are junior/lazy questions....but I've been struggling
for 5 days now :(

What is the difference between "dtb" and "dtsi"?


I find that buildroot appends ".dtb" to the name defined by:
BR2_LINUX_KERNEL_INTREE_DTS_NAME

rather then append "dtsi"  ...what am I missing?


I feel I should be using
BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20.dtsi"


make[1]: Entering directory
`/disk/software/drone/buildroot/output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee'
make[2]: *** No rule to make target `arch/arm/boot/dts/sun7i-a20.dtb'.
 Stop.
make[1]: *** [sun7i-a20.dtb] Error 2



 ....Do I still need "fex" if i am using "dts"?

Running a find through an egrep shows a wild combination of dtb & dts files
together with various combinations of "d.pre.tmp"


[bruce at core buildroot]$ find . -name "*sun7i*" | egrep -i
"fex|dtb|dts|defconfig"
./output/images/sun7i-a20-olinuxino-micro.dtb
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dtb
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/.sun7i-a20-olinuxino-micro.dtb.cmd
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/.sun7i-a20-olinuxino-micro.dtb.d.dtc.tmp
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/.sun7i-a20-olinuxino-micro.dtb.dts.tmp
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/sun7i-a20.dtsi
./output/build/linux-a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee/arch/arm/boot/dts/.sun7i-a20-olinuxino-micro.dtb.d.pre.tmp
./output/build/linux-headers-3.15.1/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
./output/build/linux-headers-3.15.1/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
./output/build/linux-headers-3.15.1/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
./output/build/linux-headers-3.15.1/arch/arm/boot/dts/sun7i-a20.dtsi
[bruce at core buildroot]$



Any ideas how I force buildroot to use my custom kernel for the kernel
headers? So far I've tried:
BR2_KERNEL_HEADERS_SNAP=y
BR2_LINUX_KERNEL_SAME_AS_HEADERS=y



Thanks
Bruce



My a20-som_defconfig:
(I copied cubieboard2_defconfig,  thank you Carlo Caione!!!)

# Architecture
BR2_arm=y
BR2_cortex_a7=y

# System configuration
BR2_TARGET_GENERIC_HOSTNAME="A20-SOM"
BR2_TARGET_GENERIC_ISSUE="Welcome to A20-SOM"
BR2_TARGET_GENERIC_GETTY=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/a20-som/post-build.sh"

# Toolchain
BR2_STRIP_sstrip=n
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=n


# Additional tools
BR2_PACKAGE_HOST_SUNXI_TOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y
BR2_PACKAGE_SUNXI_TOOLS=y
BR2_PACKAGE_SUNXI_BOARDS=y
BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/a20-olinuxino_micro.fex"

# Kernel headers
#BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
#BR2_KERNEL_HEADERS_SNAP=y


# Kernel (master: 3.16.0 rc2)
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_VERSION="master"
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/torvalds/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee"
BR2_LINUX_KERNEL_PATCH="board/olimex/a20-som/kernel-patches/"
BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
BR2_LINUX_KERNEL_APPENDED_DTB=y
BR2_LINUX_KERNEL_USE_INTREE_DTS=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-micro"
#BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20"


# Bootloaders (sunxi-next uboot provides PSCI for SMP )
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="Cubieboard2"
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_VERSION="sunxi-next"
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="
https://github.com/jwrdegoede/u-boot-sunxi.git"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="257ae94e88ff27dbd92018f17cd22b16b585e67d"
BR2_TARGET_UBOOT_FORMAT_BIN=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140624/fe7fc9bb/attachment.html>
