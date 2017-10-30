From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 30 Oct 2017 15:48:15 +0530
Subject: [Buildroot] [PATCH v4 04/11] board: Add Pine64 support
In-Reply-To: <b8d92229-8f0c-2edf-7451-13ad2393eb4b@arm.com>
References: <1509041511-30956-1-git-send-email-jagan@amarulasolutions.com>
 <1509041511-30956-5-git-send-email-jagan@amarulasolutions.com>
 <b8d92229-8f0c-2edf-7451-13ad2393eb4b@arm.com>
Message-ID: <CAMty3ZDTS0cimM2762cP8M0-L=1PUiNm++svrcWcBz4LxWe2ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 30, 2017 at 3:26 PM, Andre Przywara <andre.przywara@arm.com> wrote:
> Hi,
>
> On 26/10/17 19:11, Jagan Teki wrote:
>> Add initial support for Pine64 board with below features:
>> - U-Boot 2017.09
>> - Linux 4.13.7
>> - Default packages from buildroot
>>
>> Cc: TL Lim <tllim@pine64.org>
>> Cc: Andre Przywara <andre.przywara@arm.com>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>>  .gitlab-ci.yml                   |  1 +
>>  DEVELOPERS                       |  2 ++
>>  board/pine64/pine64/boot.cmd     |  6 +++++
>>  board/pine64/pine64/genimage.cfg | 38 ++++++++++++++++++++++++++++++++
>>  board/pine64/pine64/readme.txt   | 38 ++++++++++++++++++++++++++++++++
>>  configs/pine64_defconfig         | 47 ++++++++++++++++++++++++++++++++++++++++
>>  6 files changed, 132 insertions(+)
>>  create mode 100644 board/pine64/pine64/boot.cmd
>>  create mode 100644 board/pine64/pine64/genimage.cfg
>>  create mode 100644 board/pine64/pine64/readme.txt
>>  create mode 100644 configs/pine64_defconfig
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 3dd4f48..44edc61 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -161,6 +161,7 @@ orangepi_zero_defconfig: *defconfig
>>  pandaboard_defconfig: *defconfig
>>  pc_x86_64_bios_defconfig: *defconfig
>>  pc_x86_64_efi_defconfig: *defconfig
>> +pine64_defconfig: *defconfig
>>  qemu_aarch64_virt_defconfig: *defconfig
>>  qemu_arm_versatile_defconfig: *defconfig
>>  qemu_arm_versatile_nommu_defconfig: *defconfig
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 6521aad..780c674 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -728,8 +728,10 @@ F:       package/keepalived/
>>  N:   Jagan Teki <jagan@amarulasolutions.com>
>>  F:   board/bananapi/
>>  F:   board/engicam/
>> +F:   board/pine64/
>>  F:   configs/bananapi_m1_defconfig
>>  F:   configs/bananapi_m64_defconfig
>> +F:   configs/pine64_defconfig
>>  F:   configs/engicam_imx6qdl_icore_defconfig
>>  F:   configs/engicam_imx6qdl_icore_qt5_defconfig
>>  F:   configs/engicam_imx6qdl_icore_rqs_defconfig
>> diff --git a/board/pine64/pine64/boot.cmd b/board/pine64/pine64/boot.cmd
>> new file mode 100644
>> index 0000000..14f5610
>> --- /dev/null
>> +++ b/board/pine64/pine64/boot.cmd
>> @@ -0,0 +1,6 @@
>> +setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
>> +
>> +fatload mmc 0 $kernel_addr_r Image
>> +fatload mmc 0 $fdt_addr_r sun50i-a64-pine64.dtb
>> +
>> +booti $kernel_addr_r - $fdt_addr_r
>> diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/pine64/genimage.cfg
>> new file mode 100644
>> index 0000000..8e12308
>> --- /dev/null
>> +++ b/board/pine64/pine64/genimage.cfg
>> @@ -0,0 +1,38 @@
>> +image boot.vfat {
>> +     vfat {
>> +             files = {
>> +                     "Image",
>> +                     "sun50i-a64-pine64.dtb",
>> +                     "boot.scr"
>> +             }
>> +     }
>> +     size = 64M
>> +}
>> +
>> +image sdcard.img {
>> +     hdimage {
>> +     }
>> +
>> +     partition spl {
>> +             in-partition-table = "no"
>> +             image = "sunxi-spl.bin"
>> +             offset = 8192
>> +     }
>> +
>> +     partition u-boot {
>> +             in-partition-table = "no"
>> +             image = "u-boot.itb"
>> +             offset = 40K
>> +     }
>> +
>> +     partition boot {
>> +             partition-type = 0xC
>> +             bootable = "true"
>> +             image = "boot.vfat"
>> +     }
>> +
>> +     partition rootfs {
>> +             partition-type = 0x83
>> +             image = "rootfs.ext4"
>> +     }
>> +}
>> diff --git a/board/pine64/pine64/readme.txt b/board/pine64/pine64/readme.txt
>> new file mode 100644
>> index 0000000..54e6f9c
>> --- /dev/null
>> +++ b/board/pine64/pine64/readme.txt
>> @@ -0,0 +1,38 @@
>> +Intro
>> +=====
>> +
>> +This default configuration will allow you to start experimenting with the
>> +buildroot environment for the Pine64. With the current configuration
>> +it will bring-up the board, and allow access through the serial console.
>> +
>> +Pine64 link:
>> +https://www.pine64.org/?page_id=1194
>> +
>> +Wiki link:
>> +https://confluence.amarulasolutions.com/display/ODWIKI/Pine64
>> +
>> +This configuration uses U-Boot mainline and kernel mainline.
>> +
>> +How to build
>> +============
>> +
>> +    $ make pine64_defconfig
>> +
>> +    $ make
>> +
>> +Note: you will need access to the internet to download the required
>> +sources.
>> +
>> +How to write the SD card
>> +========================
>> +
>> +Once the build process is finished you will have an image called "sdcard.img"
>> +in the output/images/ directory.
>> +
>> +Copy the bootable "sdcard.img" onto an SD card with "dd":
>> +
>> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
>> +  $ sudo sync
>> +
>> +Insert the micro SDcard in your Pine64 and power it up. The console
>> +is on the serial line, 115200 8N1.
>> diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
>> new file mode 100644
>> index 0000000..76d2d77
>> --- /dev/null
>> +++ b/configs/pine64_defconfig
>> @@ -0,0 +1,47 @@
>> +BR2_aarch64=y
>> +BR2_cortex_a53=y
>> +BR2_ARM_FPU_VFPV4=y
>> +
>> +# Linux headers same as kernel, a 4.13 series
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
>> +
>> +# Firmware
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
>
> So how stable shall this recipe be, in general? I see a lot of fixed
> versions (ATF, U-Boot, kernel) in here, which means it needs constant
> updating (to benefit from security fixes, for instance)?
> Is that intended? That looks a bit maintenance-heavy to me.
>
> And do you have to specify a certain commit ID here?
> I have some bugfixes on the "allwinner" branch, and am thinking about
> pulling the allwinner-stable branch to the same commit.
> So I strongly recommend to upgrade to the allwinner branch, which fixes
> immediate crashes on CPU off/onlining, among other issues.

I've used "allwinner" branch in first version set instead of commit,
but the Thomas opposed it. Is it possible to create tag for the stable
version? it would be good to use tag rather branch from maintenance
point-of-view.

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
