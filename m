From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 15 Jun 2021 09:50:31 +0200
Subject: [Buildroot] Trouble with u-boot on a ZynqMP board
Message-ID: <CAM+bi4s4Nueb96Xyo5dY7vwDhJO1xFnzcdrky5U3qsBBNf8EHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I'm trying to use buildroot to generate a system for the Digilent
Genesys board, which is based on the zynqmp SOC. Thanks to the
wonderful job of Luca and others, it should be pretty straightforward,
but I'm having trouble getting it to boot, and I was hoping I could
get some guidance on what to do next.

I'm using buildroot version 2021.05, with u-boot version 2021.04,
which has latest patches that should allow booting completely via
u-boot, without using Xilinx' FSBL

I'm using Digient's reference design to generate configuration object
pm_cfg_obj.c and PSU init file psu_init_gpl.c, which shall be fed to
u-boot. Alongside these files, I'm make buildroot download a generic
PMU firmware built by Luca at
https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/master/bin/pmufw-v2018.3.bin
and here is the relevant configuration:

BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_Genesys_PATH)/uboot_defconfig"
BR2_TARGET_UBOOT_NEEDS_DTC=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
BR2_TARGET_UBOOT_ZYNQMP=y
BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/master/bin/pmufw-v2018.3.bin"
BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="/tmp/pm_cfg_obj.c"
BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE="/tmp/psu_init_gpl.c"
BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="$(BR2_EXTERNAL_Genesys_PATH)/orig.dts"

To provide Arm Trusted Firmware, I'm passing buildroot the same
configuration as already exists on configs/zynqmp_zcu106_defconfig
which is:

BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y

The device tree I'm using is extracted from Digilent's kernel image,
so it should be correct, although I had to manually patch u-boot to
include my "orig.dtb" as a target of dtb-$(CONFIG_ARCH_ZYNQMP)

So, it is assumption that this should make u-boot prompt appear after
power up, but I must be wrong because nothing appears at all on the
serial console.

Provided image by Digilent follows the Xilinx' booting workflow, so
only a BOOT.BIN file is on the sdcard which includes xilinx' FSBL, PMU
firmware with configuration object, u-boot, kernel, device tree, etc,
so at least I know that the board is fine as this firmware works
flawlessly. I also was able to load the kernel and device tree as
built by buildroot over this instance of u-boot, so at least I can
load my own kernel, but I can't progress deeper than that.

I've only worked before with Zynq based devices and they were no such
trouble, so I'm quite a bit lost right now and would appreciate any
help that I can get.

Thanks a lot!

-- 
?lvaro G?mez Machado
