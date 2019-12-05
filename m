From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 5 Dec 2019 11:21:21 +0100
Subject: [Buildroot] Zynqmp ZCU-102 Xilinx
In-Reply-To: <CADDW7LPZ+oD9NzjqvbjVBDYj59K_6q1d8beoqwyQ==jFNTq=KA@mail.gmail.com>
References: <CADDW7LPbh8ep74a5kcu1CZQuaFxuUGyCUxuJT6uo6Y=m9ftmOA@mail.gmail.com>
 <d46c58a9-4b07-878f-b638-1a4d1554e9b1@lucaceresoli.net>
 <CADDW7LPZ+oD9NzjqvbjVBDYj59K_6q1d8beoqwyQ==jFNTq=KA@mail.gmail.com>
Message-ID: <6efe98a4-0570-32fa-c2f4-c692907815a4@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adrian,

On 03/12/19 09:44, Adrian martinez munera wrote:
> Hi Luca,
> thanks for your answer!
> How I said to Thomas, I'm trying to compile a Linux image to my ZCU-102
> with EPICS (https://epics.anl.gov). But, as first step, I'd want build a
> simple Linux image, all of this using Buildroot.?
> Using yours steps, I've created a pmufw.bin with your builder and the
> 'pm_cfg_obj.c', created by the Vivado project (xilpm library enabled).
> Now I've a new two errors at the boot:
> 1. boot console [cdns0] disabled
> 2. The root file system is empty

What do you mean by "The root file system is empty"? It has not been
built? It has not been copied to the boot medium? It has not neeb
mounted? ...

> *defconfig* file that I'm using:
> 
> BR2_aarch64=y
> BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git
> <http://github.com/Xilinx/linux-xlnx.git>"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2018.3"
> BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_4=y
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> BR2_TARGET_UBOOT_CUSTOM_GIT=y
> BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git <http://github.com/xilinx/u-boot-xlnx.git>"
> BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu102_rev1_0"
> BR2_TARGET_UBOOT_NEEDS_DTC=y
> BR2_TARGET_UBOOT_SPL=y
> BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> BR2_TARGET_UBOOT_ZYNQMP=y
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW="/home/adrian/Documents/ZCU-102/pmufw_builder/zynqmp-pmufw-builder/pmufw.bin"
> BR2_PACKAGE_HOST_DOSFSTOOLS=y
> BR2_PACKAGE_HOST_GENIMAGE=y
> BR2_PACKAGE_HOST_MTOOLS=y

Not sure what is the problem here, but I recommend using the same
versions of kernel, PMUFW and U-Boot as the zcu106 defconfig. Xilinx
versions of these software are known to not work properly if you mix
these versions, at least this used to happen in the 2017.x~2018.x era.
So try to use 2017.04 for the three components. If it works then you can
try to upgrade them.

Also enable debug prints in the PMUFW, they are useful in debugging boot
issues.

-- 
Luca
