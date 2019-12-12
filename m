From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 12 Dec 2019 18:09:10 +0100
Subject: [Buildroot] Zynqmp ZCU-102 Xilinx
In-Reply-To: <CADDW7LNdqK-6fw-hRF5HcCWN7s6Spyq-KGm9O3XcV-tX3O1NwA@mail.gmail.com>
References: <CADDW7LPbh8ep74a5kcu1CZQuaFxuUGyCUxuJT6uo6Y=m9ftmOA@mail.gmail.com>
 <d46c58a9-4b07-878f-b638-1a4d1554e9b1@lucaceresoli.net>
 <CADDW7LPZ+oD9NzjqvbjVBDYj59K_6q1d8beoqwyQ==jFNTq=KA@mail.gmail.com>
 <6efe98a4-0570-32fa-c2f4-c692907815a4@lucaceresoli.net>
 <CADDW7LNdqK-6fw-hRF5HcCWN7s6Spyq-KGm9O3XcV-tX3O1NwA@mail.gmail.com>
Message-ID: <95b0cf7d-204c-92f0-a236-beae2a5d0477@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adrian,

please keep the Buildroot mailing-list in Cc when replying.

On 10/12/19 10:34, Adrian martinez munera wrote:
> Hi Luca,
> when I say that the rootfs is empty I mean that if you use 'ls' command
> there are no directories. Looks that there is a boot console to start,
> halt or reboot the ZCU102. ---> " ZynqMP> "

This is the U-Boot prompt. This explains why "the rootfs is empty":
there's no such thing as a root filesystem in U-Boot.

Now the question is: why U-Boot stops instead of loading a kernel?
Please send the entire boot log or other people can only do guesswork.

> I think that 'mmcblkt' is the name that the board assigns to the sdcard.
> 
> As you said me, I've used the same version for all (--> 2017.04) but I
> dont know how to create pmufw with the version 2017.04. Using Vivado
> 2017.04?

Using zynqmp-pumfw-builder:

  git clone --recursive \
      https://github.com/lucaceresoli/zynqmp-pmufw-builder.git
  cd zynqmp-pmufw-builder
  git checkout v2017.4
  git sumbodule update
  cp /your/own/zcu102/pm_cfg_obj.c .
  ./build.sh pmufw-patch
  ./build.sh pmufw-build

Otherwise you can use the Xilinx XSDK.

> The defconfig would be this:
> *
> *
> *BR2_aarch64=y
> #BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"? *--> By default, the
> patches of Buidlroot only work for ZCU106

Those patches should work (or at least not hurt) on any board. Which
one(s) do you think is giving troubles?

> *BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git
> <http://github.com/Xilinx/linux-xlnx.git>"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
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
> BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.4"
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu102_rev1_0"
> BR2_TARGET_UBOOT_NEEDS_DTC=y
> BR2_TARGET_UBOOT_SPL=y
> BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> BR2_TARGET_UBOOT_ZYNQMP=y
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW="/home/adrian/Documents/ZCU-102/pmufw_builder/zynqmp-pmufw-builder/pmufw.bin"
> BR2_PACKAGE_HOST_DOSFSTOOLS=y
> BR2_PACKAGE_HOST_GENIMAGE=y
> BR2_PACKAGE_HOST_MTOOLS=y*

Ok, so your config is quite similar to the zcu106 one in mainline Buildroot:

$ diff -u0 configs/zynqmp_zcu106_defconfig  adrian-zcu102
--- configs/zynqmp_zcu106_defconfig	2019-08-30 15:24:02.493487657 +0200
+++ adrian-zcu102	2019-12-12 17:27:28.885746282 +0100
@@ -2 +2 @@
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
+#BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"  --> By default, the
patches of Buidlroot only work for ZCU106

Not OK, as above.

@@ -11 +11 @@
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"

OK, just changing the board.

@@ -25,2 +25,2 @@
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.4"

I don't remember why I used that specific commit instead of
xilinx-v2017.4, but since that's the one I had tested and running, I'd
stick to that.

-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu106_revA"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu102_rev1_0"

OK

@@ -31 +31 @@
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/53fdb7b6c92860ceb0ec5fd14deee302f4a84269/bin/pmufw-zcu106-default-v2017.4.bin"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="/home/adrian/Documents/ZCU-102/pmufw_builder/zynqmp-pmufw-builder/pmufw.bin"

OK


> This defconfig builds a project which returns this error:
> 
> *<debug_uart> Debug uart enabled ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
> ? ? ?
> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
> ? ? ?
> U-Boot SPL 2017.01 (Dec 05 2019 - 13:16:42) ? ? ? ? ? ? ? ? ? ? ? ? ? ?
> ? ? ?
> EL Level: ? ? ? EL3 ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
> ? ? ?
> Trying to boot from MMC1 ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
> ? ?
> reading u-boot.bin ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
> reading atf-uboot.ub ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
> reading atf-uboot.ub ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
> NOTICE: ?ATF running on XCZU9EG/silicon v3/RTL5.1 at 0xfffea000
> NOTICE: ?BL31: Secure code at 0x0 ? ? ? ? ? ? ? ? ? ? ?
> NOTICE: ?BL31: Non secure code at 0x8000000 ? ? ? ? ? ?
> NOTICE: ?BL31: v1.5(release):
> NOTICE: ?BL31: Built : 13:16:32, Dec ?5 2019
> PMUFW is not found - Please load it!

I think this is due to the fact that you didn't apply the u-boot
patches. Patch 3 is needed for Buildroot to tell U-Boot where the pmufw
file is, I'm not surprised U-Boot won't find it without the patch.

Retry with a defconfig that is equal to the original one, except for the
board changes and the change in the pmufw path (i.e. the changes that I
commented with "OK" above).

Indeed having these machines booting is tricky. Damn tricky. Be very,
very, very cautious and conservative about the things you do and always
stay as similar as possible to a working configuration. Once you have
something booting you can try to modify one piece at a time and see what
happens.

-- 
Luca
