From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Jul 2017 13:24:47 +0200
Subject: [Buildroot] [linux-sunxi] [PATCH v2 1/3] board: Add Bananapi
	M64 support
In-Reply-To: <1500124091-21190-1-git-send-email-jteki@openedev.com> (Jagan
 Teki's message of "Sat, 15 Jul 2017 18:38:09 +0530")
References: <1500124091-21190-1-git-send-email-jteki@openedev.com>
Message-ID: <87mv848w00.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jagan" == Jagan Teki <jagannadh.teki@gmail.com> writes:

 > From: Jagan Teki <jagan@amarulasolutions.com>
 > Add initial support for bananapi M64 board with below features:
 > - U-Boot 2017.07
 > - Linux 4.11.5
 > - Default packages from buildroot

 > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Odd - For some reason, I don't find these patches in patchwork?


 > +image sdcard.img {
 > +	hdimage {
 > +	}
 > +
 > +	partition spl {
 > +		in-partition-table = "no"
 > +		image = "sunxi-spl.bin"
 > +		offset = 8192
 > +	}
 > +
 > +	partition u-boot {
 > +		in-partition-table = "no"
 > +		image = "u-boot.itb"
 > +		offset = 40K
 > +	}

No reserved space after the image? Does this platform not use the u-boot
environment on the SD card?

grep CONFIG_ENV build/uboot-2017.07/.config
CONFIG_ENV_IS_IN_MMC=y
# CONFIG_ENV_IS_NOWHERE is not set
CONFIG_ENV_OFFSET=0x88000
CONFIG_ENV_SIZE=0x20000

So presumably the boot partition should only start at offset 0xa8000?

The easiest way of handling this is to set the size of the u-boot
partition like it is done in
E.G. board/orangepi/orangepi/orangepi-pc/genimage.cfg.


 > diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
 > new file mode 100644
 > index 0000000..6f22b23
 > --- /dev/null
 > +++ b/configs/bananapi_m64_defconfig
 > @@ -0,0 +1,46 @@
 > +BR2_aarch64=y
 > +BR2_cortex_a53=y
 > +BR2_ARM_FPU_VFPV4=y
 > +
 > +# Linux headers same as kernel, a 4.11 series
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 > +
 > +# Firmware
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="bl31"
 > +
 > +# Bootloader
 > +BR2_TARGET_UBOOT=y
 > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 > +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
 > +BR2_TARGET_UBOOT_NEEDS_DTC=y
 > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"

This is the first time I see the itb format. If I understand things
correctly, this is a fit image containing both u-boot and atf. How does
u-boot find the atf image / how do we ensure u-boot is (re)built after
atf?

Looking at board/sunxi/README.sunxi64, bl31.bin is apparently found in
the toplevel u-boot directory or at the location specified by the BL31
environment variable, neither of which are used here.

Looking at u-boot.its, it seems to fallback to /dev/null instead:

grep -A1 Trusted build/uboot-2017.07/u-boot.its
                        description = "ARM Trusted Firmware";
                        data = /incbin/("/dev/null");

Checking the generated images seems to confirm this:

strings -n 20 images/bl31.bin | head -n 1
Built : 12:24:28, Jul 16 2017

strings images/u-boot.itb | grep Built

(no match).

I think a better approach would be to generate the .itb file in the
post-build script instead.

-- 
Bye, Peter Korsgaard
