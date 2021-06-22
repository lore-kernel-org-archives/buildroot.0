From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 22 Jun 2021 07:58:22 +0200
Subject: [Buildroot] Trouble with u-boot on a ZynqMP board
In-Reply-To: <1ae87e6c-9b70-9492-6efd-b67d06d91433@lucaceresoli.net>
References: <CAM+bi4s4Nueb96Xyo5dY7vwDhJO1xFnzcdrky5U3qsBBNf8EHQ@mail.gmail.com>
 <1ae87e6c-9b70-9492-6efd-b67d06d91433@lucaceresoli.net>
Message-ID: <CAM+bi4sU71gkigZ_-T-AXKYtqYOA1cn+0bU=_TiThf94K2C4yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Luca

El mi?, 16 jun 2021 a las 22:52, Luca Ceresoli
(<luca@lucaceresoli.net>) escribi?:
>
> Hi Alvaro,
>
> On 15/06/21 09:50, Alvaro Gamez wrote:
> > Hi!
> >
> > I'm trying to use buildroot to generate a system for the Digilent
> > Genesys board, which is based on the zynqmp SOC. Thanks to the
> > wonderful job of Luca and others, it should be pretty straightforward,
> > but I'm having trouble getting it to boot, and I was hoping I could
> > get some guidance on what to do next.
>
> Thanks for your appreciation! However I must say setting up zynqmp
> booting is never straightforward... :-/

Yeah, tell me about it :)

>
> > I'm using buildroot version 2021.05, with u-boot version 2021.04,
> > which has latest patches that should allow booting completely via
> > u-boot, without using Xilinx' FSBL
> >
> > I'm using Digient's reference design to generate configuration object
> > pm_cfg_obj.c and PSU init file psu_init_gpl.c, which shall be fed to
> > u-boot. Alongside these files, I'm make buildroot download a generic
> > PMU firmware built by Luca at
> > https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/master/bin/pmufw-v2018.3.bin
> > and here is the relevant configuration:
> >
> > BR2_TARGET_UBOOT=y
> > BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
> > BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_Genesys_PATH)/uboot_defconfig"
> > BR2_TARGET_UBOOT_NEEDS_DTC=y
> > BR2_TARGET_UBOOT_SPL=y
> > BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> > BR2_TARGET_UBOOT_ZYNQMP=y
> > BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/master/bin/pmufw-v2018.3.bin"
> > BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="/tmp/pm_cfg_obj.c"
> > BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE="/tmp/psu_init_gpl.c"
> > BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="$(BR2_EXTERNAL_Genesys_PATH)/orig.dts"
> >
> > To provide Arm Trusted Firmware, I'm passing buildroot the same
> > configuration as already exists on configs/zynqmp_zcu106_defconfig
> > which is:
> >
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> >
> > The device tree I'm using is extracted from Digilent's kernel image,
> > so it should be correct, although I had to manually patch u-boot to
> > include my "orig.dtb" as a target of dtb-$(CONFIG_ARCH_ZYNQMP)
> >
> > So, it is assumption that this should make u-boot prompt appear after
> > power up, but I must be wrong because nothing appears at all on the
> > serial console.
> >
> > Provided image by Digilent follows the Xilinx' booting workflow, so
> > only a BOOT.BIN file is on the sdcard which includes xilinx' FSBL, PMU
> > firmware with configuration object, u-boot, kernel, device tree, etc,
> > so at least I know that the board is fine as this firmware works
> > flawlessly. I also was able to load the kernel and device tree as
> > built by buildroot over this instance of u-boot, so at least I can
> > load my own kernel, but I can't progress deeper than that.
>
> I can't point out a specific potential cause for your problem. I would
> expect to see at least the U-Boot SPL prompt. You might want to enable
> some debug outputs in the pmufw code to see it it starts at least.

I'm going all crazy about configuring U-Boot and my headache is noticeable now.
Won't you happen to have a working u-boot with SPL defconfig that works on any
particular zynqmp board?

> I haven't been working on zynqmp recently but back at the times
> (2018~2019) one needed to have the various booting components "in sync",
> expecially pmufw, U-Boot and SPL or FSBL. I don't remember whether ATF
> was critical too in that respect. By "in sync" I mean the major version
> number (the year) should be the same.
>
> Here you are using a 2018 pmufw and 2021 U-Boot so you muight want to
> build a more recent pmufw and see if you get any improvements.

Great, that's a nice idea, thank you!

>
> I'm afraid I cannot be more helpful at the moment.
>
> --
> Luca

Thanks for your time anyhow, and for your previous work on all this!

Best regards!

-- 
?lvaro G?mez Machado
