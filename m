From: Chakra D <2chakrass@gmail.com>
Date: Fri, 16 Jun 2017 22:06:51 +0530
Subject: [Buildroot] [PATCH] board: Add nanopi-m1 Support
In-Reply-To: <CAA4kGkrMjVABPuLYO70vutnUHG9yEct7zcWw_SyhPqyf8OpxCQ@mail.gmail.com>
References: <1497547465-15445-1-git-send-email-chakra@openedev.com>
 <e3398374-57ce-7280-0219-7625bc5396fe@mind.be>
 <CAA4kGkrMjVABPuLYO70vutnUHG9yEct7zcWw_SyhPqyf8OpxCQ@mail.gmail.com>
Message-ID: <CAA4kGkrYdksC2iUKU2VDzMtHVoWfO5SAX2fSphiHzD1=d02aEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,


On Fri, Jun 16, 2017 at 9:52 PM, Chakra D <2chakrass@gmail.com> wrote:
> Hi Arnout,
>
> Thanks for the feedback....happy to see your comments as it is my
> first patch in the buildroot
>
> On Fri, Jun 16, 2017 at 3:23 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Chakra,
>>
>>  Thanks you for this contribution! I have a few more comments in addition to
>> Thomas's. But it looks pretty good!
>>
>> On 15-06-17 19:24, Chakra Divi wrote:
>>> Add initial support for nanopi-m1 board
>>> with below features
>>> - U-Boot 2017.07-rc1
>>> - Linux 4.11
>>> - Default packages from buildroot
>>>
>>> Created a new folder nanopi under buildroot
>>> board; any new board for nanopi can be added
>>> here
>>
>>  Will you also provide a patch that moves nanopi-neo there, and reuses the same
>> scripts?
>>
>
> Yes will move it under vendor folder "friendlyarm"
>
>>
>>> Signed-off-by: Chakra Divi <chakra@openedev.com>
>>> ---
>>>  board/nanopi/nanopi-m1/boot.cmd      |    8 ++++++++
>>>  board/nanopi/nanopi-m1/genimage.cfg  |   36 ++++++++++++++++++++++++++++++++++
>>>  board/nanopi/nanopi-m1/post-build.sh |    1 +
>>>  board/nanopi/nanopi-m1/post-image.sh |    1 +
>>>  board/nanopi/nanopi-m1/readme.txt    |   29 +++++++++++++++++++++++++++
>>>  board/nanopi/post-build.sh           |   11 +++++++++++
>>>  board/nanopi/post-image.sh           |   14 +++++++++++++
>>>  configs/nanopi_m1_defconfig          |   29 +++++++++++++++++++++++++++
>>>  8 files changed, 129 insertions(+)
>>>  create mode 100644 board/nanopi/nanopi-m1/boot.cmd
>>>  create mode 100644 board/nanopi/nanopi-m1/genimage.cfg
>>>  create mode 120000 board/nanopi/nanopi-m1/post-build.sh
>>>  create mode 120000 board/nanopi/nanopi-m1/post-image.sh
>>>  create mode 100644 board/nanopi/nanopi-m1/readme.txt
>>>  create mode 100755 board/nanopi/post-build.sh
>>>  create mode 100755 board/nanopi/post-image.sh
>>>  create mode 100644 configs/nanopi_m1_defconfig
>>
>>  When adding a defconfig, please also run 'make .gitlab-ci.yml' to update the
>> Gitlab-CI configuration. Yes, we should update the documentation to mention this :-)
>>
>
> Yes will do and send updated patch
>
>>  Also, please add yourself to the DEVELOPERS file for this board (both
>> config/xxx_defconfig and board/nanopi/).
>>
>
> Yes will do -
>
>> [snip]
>>> diff --git a/board/nanopi/nanopi-m1/genimage.cfg b/board/nanopi/nanopi-m1/genimage.cfg
>>> new file mode 100644
>>> index 0000000..23c9c7d
>>> --- /dev/null
>>> +++ b/board/nanopi/nanopi-m1/genimage.cfg
>>> @@ -0,0 +1,36 @@
>>> +# Minimal SD card image for the NanoPi M1
>>> +#
>>> +image boot.vfat {
>>> +     vfat {
>>> +             files = {
>>> +                     "zImage",
>>> +                     "sun8i-h3-nanopi-m1.dtb",
>>> +                     "boot.scr"
>>> +             }
>>> +     }
>>> +     size = 10M
>>> +}
>>> +
>>> +image sdcard.img {
>>> +     hdimage {
>>> +     }
>>> +
>>> +     partition u-boot {
>>> +             in-partition-table = "no"
>>> +             image = "u-boot-sunxi-with-spl.bin"
>>> +             offset = 8192
>>> +             size = 1040384 # 1MB - 8192
>>> +     }
>>> +
>>> +     partition boot {
>>> +             partition-type = 0xC
>>> +             bootable = "true"
>>> +             image = "boot.vfat"
>>> +     }
>>> +
>>> +     partition rootfs {
>>> +             partition-type = 0x83
>>> +             image = "rootfs.ext4"
>>> +             size = 512M
>>
>>  No need to specify the size, genimage will take it from the ext4 file. Yes, I
>> know, many .cfg files don't specify this correctly.
>>
>
> Will make the change
>
>>> +     }
>>> +}
>>> diff --git a/board/nanopi/nanopi-m1/post-build.sh b/board/nanopi/nanopi-m1/post-build.sh
>>> new file mode 120000
>>> index 0000000..cd7f116
>>> --- /dev/null
>>> +++ b/board/nanopi/nanopi-m1/post-build.sh
>>> @@ -0,0 +1 @@
>>> +../post-build.sh
>>> \ No newline at end of file
>>> diff --git a/board/nanopi/nanopi-m1/post-image.sh b/board/nanopi/nanopi-m1/post-image.sh
>>
>>  As mentioned by Thomas, the post-image script isn't needed, instead you can
>> call support/script/genimage.sh directly. You have to add
>> BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/nanopi/nanopi-m1/genimage.cfg"
>>
>
> Do you mean add the following config  def config file ?
> BR2_ROOTFS_POST_SCRIPT_ARGS="-c support/script/genimage.sh'"
>

Sorry about this statement...Understood now will make the changes


>> [snip]
>>> diff --git a/board/nanopi/post-build.sh b/board/nanopi/post-build.sh
>>> new file mode 100755
>>> index 0000000..a544a19
>>> --- /dev/null
>>> +++ b/board/nanopi/post-build.sh
>>> @@ -0,0 +1,11 @@
>>> +#!/bin/sh
>>> +# post-build.sh for OrangePi taken from CubieBoard's post-build.sh
>>
>>  I don't think this is relevant anymore...
>>
> Ok will remove it. I thought post-build.sh might be needed if a specific board
> want to implement something different from normal flow.
>
>>> +# 2013, Carlo Caione <carlo.caione@gmail.com>
>>> +
>>> +BOARD_DIR="$(dirname $0)"
>>> +MKIMAGE=$HOST_DIR/usr/bin/mkimage
>>> +BOOT_CMD=$BOARD_DIR/boot.cmd
>>> +BOOT_CMD_H=$BINARIES_DIR/boot.scr
>>> +
>>> +# U-Boot script
>>> +$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
>> [snip]
>>> diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
>>> new file mode 100644
>>> index 0000000..b1443f8
>>> --- /dev/null
>>> +++ b/configs/nanopi_m1_defconfig
>>> @@ -0,0 +1,29 @@
>>> +BR2_arm=y
>>> +BR2_cortex_a7=y
>>> +BR2_ARM_FPU_VFPV4=y
>>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
>>> +BR2_TARGET_GENERIC_HOSTNAME="nanopi-m1"
>>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi M1"
>>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/nanopi/nanopi-m1/post-build.sh"
>>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nanopi/nanopi-m1/post-image.sh"
>>> +BR2_LINUX_KERNEL=y
>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
>>
>>  Why not 4.11.5?
>>
>
> Will change it 4.11.5
>
>>  Regards,
>>  Arnout
>>
>>> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1"
>>> +BR2_TARGET_ROOTFS_EXT2=y
>>> +BR2_TARGET_ROOTFS_EXT2_4=y
>>> +# BR2_TARGET_ROOTFS_TAR is not set
>>> +BR2_TARGET_UBOOT=y
>>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>>> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
>>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1"
>>> +BR2_TARGET_UBOOT_NEEDS_DTC=y
>>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
>>> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
>>> +BR2_PACKAGE_HOST_GENIMAGE=y
>>> +BR2_PACKAGE_HOST_MTOOLS=y
>>> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>>>
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
