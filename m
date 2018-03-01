From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Thu, 1 Mar 2018 12:08:14 +0100
Subject: [Buildroot] [PATCH v3 4/4] configs/freescale_imx8mqevk: new
 defconfig
In-Reply-To: <CAAMH-yuesrYLB02cJ4uLDGURm0tGP90Y6H7kaGmiJUsUx7Krxw@mail.gmail.com>
References: <1519807066-21466-1-git-send-email-karl.erik.larsson@gmail.com>
 <1519807066-21466-5-git-send-email-karl.erik.larsson@gmail.com>
 <CAAMH-yuesrYLB02cJ4uLDGURm0tGP90Y6H7kaGmiJUsUx7Krxw@mail.gmail.com>
Message-ID: <CAPP7BN0mDUsUK0QHdX_z4KZc_71KzcPrh5ruTueyMtEn6Oz09A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

2018-03-01 11:42 GMT+01:00 Gary Bisson <gary.bisson@boundarydevices.com>:
> Hi Erik,
>
> On Wed, Feb 28, 2018 at 9:37 AM, Erik Larsson
> <karl.erik.larsson@gmail.com> wrote:
>> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
>> Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
>> ---
>> v3: Change commit message (suggested by Thomas P.)
>>     Make sure to use tags instead of branches in kernel,bootloader and ATF repositorires (Arnout V.)
>>     Use BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG instead of copy kernel defconfig to board folder (suggested by Arnout V.)
>>     Split v2 commit into two commits
>> ---
>>  .../common/imx/genimage.cfg.template_imx8          | 40 ++++++++++++++++++++++
>>  board/freescale/common/imx/post-image.sh           | 10 ++++--
>>  configs/freescale_imx8mqevk_defconfig              | 38 ++++++++++++++++++++
>>  3 files changed, 85 insertions(+), 3 deletions(-)
>>  create mode 100644 board/freescale/common/imx/genimage.cfg.template_imx8
>>  create mode 100644 configs/freescale_imx8mqevk_defconfig
>>
>> diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
>> new file mode 100644
>> index 0000000..138beff
>> --- /dev/null
>> +++ b/board/freescale/common/imx/genimage.cfg.template_imx8
>> @@ -0,0 +1,40 @@
>> +# Minimal SD card image for the Freescale boards Template for SPL Boot
>> +#
>> +# We mimic the .sdcard Freescale's image format:
>> +# * the SD card must have 33 kB free space at the beginning,
>> +# * U-Boot is integrated into imx-boot-imx8mqevk-sd.bin and is dumped as is,
>> +# * a FAT partition at offset 64MB is containing Image and DTB files
>> +# * a single root filesystem partition is required (ext2, ext3 or ext4)
>> +#
>> +
>> +image boot.vfat {
>> +  vfat {
>> +    files = {
>> +      %FILES%
>> +    }
>> +  }
>> +  size = 64M
>> +}
>> +
>> +image sdcard.img {
>> +  hdimage {
>> +  }
>> +
>> +  partition imx-boot {
>> +    in-partition-table = "no"
>> +    image = "imx-boot-imx8mqevk-sd.bin"
>> +    offset = 33K
>> +  }
>> +
>> +  partition boot {
>> +    partition-type = 0xC
>> +    bootable = "true"
>> +    image = "boot.vfat"
>> +    offset = 8M
>> +  }
>> +
>> +  partition rootfs {
>> +    partition-type = 0x83
>> +    image = "rootfs.ext2"
>> +  }
>> +}
>> diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
>> index b239743..264c8a4 100755
>> --- a/board/freescale/common/imx/post-image.sh
>> +++ b/board/freescale/common/imx/post-image.sh
>> @@ -7,10 +7,10 @@
>>  #
>>  dtb_list()
>>  {
>> -       local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
>> +       local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
>>
>>         for dt in $DTB_LIST; do
>> -               echo -n "\"$dt.dtb\", "
>> +               echo -n "\"`basename $dt`.dtb\", "
>>         done
>>  }
>>
>> @@ -23,6 +23,8 @@ linux_image()
>>  {
>>         if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
>>                 echo "\"uImage\""
>> +       elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
>> +               echo "\"Image\""
>>         else
>>                 echo "\"zImage\""
>>         fi
>> @@ -30,7 +32,9 @@ linux_image()
>>
>>  genimage_type()
>>  {
>> -       if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
>> +       if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
>> +               echo "genimage.cfg.template_imx8"
>> +       elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
>>                 echo "genimage.cfg.template_spl"
>>         else
>>                 echo "genimage.cfg.template"
>> diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
>> new file mode 100644
>> index 0000000..eae2c2a
>> --- /dev/null
>> +++ b/configs/freescale_imx8mqevk_defconfig
>> @@ -0,0 +1,38 @@
>> +BR2_aarch64=y
>> +BR2_ARM_FPU_VFPV3=y
>> +BR2_TOOLCHAIN_EXTERNAL=y
>> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.51_8mq_beta"
>> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8mq-evk"
>> +BR2_PACKAGE_FREESCALE_IMX=y
>> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
>> +BR2_PACKAGE_FIRMWARE_IMX=y
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_4=y
>> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.9.51_8mq_beta"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="o8.0.0_1.3.0_8m-prc"
>
> Why do you use the Android Oreo version of U-Boot?
>
> Might be more consistent to use the same rel_imx_4.9.51_8mq_beta tag.

My first version had the branch imx_4.9.51_imx8m_beta, but as Baruch
pointed our for me it should be a tag or a commit and not a branch in
the config. He proposed this tag because it's "close" the to the
imx_4.9.51_imx8m_beta-branch. I thought that was a good tag to build
from. Building from rel_imx_4.9.51_8mq_beta is just "older" then
o8.0.0_1.3.0_8m-prc and don't have some bug fixes from NXP side in it.

To be honest I think "you guys" needs to advice me here. :)

>
> Regards,
> Gary

Regards,
Erik
