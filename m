From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Fri, 29 May 2015 10:56:14 +0300 (IDT)
Subject: [Buildroot] [PATCH 1/1] Solid-Run HummingBoard i2eX defconfig
 and bootable microSD Bash script
In-Reply-To: <20150529044005.GM2260@tarshish>
References: <1432820170-10513-1-git-send-email-yba@tkos.co.il>
 <20150529044005.GM2260@tarshish>
Message-ID: <alpine.DEB.2.11.1505291022180.2289@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
I provided the board/solid-run/hummingboard-i2eX/make_sd_card.sh script 
rather than use the board/freescale/create-boot-sd.sh script for the 
following reasons.

1. make_sd_card.sh supports OOT builds. Also support parameters in 
environment variables or command line.

2. make_sd_card.sh handles the likely multipath problem that happen in 
newer distros when you change partitions on media.

3. Moved the error control to the begining of the script so that there is 
less chance of leaving a mounted filesystem or temporary mount point if 
some requried file is missing and the -e kicks in.

4. Provides cumulative error control and check for many more types of 
error. That is, doesn't stop at the first error but continues noting all 
errors possible to detect before actually making any changes.

5. Copy only the specific images required rather than using wildcards that 
can result in the wrong images being copied and can leave the newbie 
wondering why the SD doesn't boot.

6. Having a separate script takes into account the fact that we are using 
forked U-Boot repo whose bootcmd might change from the bootcmd in the 
upstream repo.

  - yba


The script that I provided in 
board/solid-run/hummingboard-i2eX/make_sd_card.sh
board/freescale/create-boot-sd.sh

On Fri, 29 May 2015, Baruch Siach wrote:

> Date: Fri, 29 May 2015 07:40:05 +0300
> From: Baruch Siach <baruch@tkos.co.il>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1] Solid-Run HummingBoard i2eX defconfig and
>      bootable microSD Bash script
> 
> Hi Yonatan,
>
> On Thu, May 28, 2015 at 04:36:10PM +0300, Jonathan Ben-Avraham wrote:
>> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
>> ---
>>  board/solid-run/hummingboard-i2eX/make_sd_card.sh | 207 ++++++++++++++++++++++
>
> The board directory should also have a readme.txt file with prose description
> board specific Buildroot installation instructions.
>
>>  configs/hummingboard_i2eX_defconfig               |  24 +++
>>  2 files changed, 231 insertions(+)
>>  create mode 100755 board/solid-run/hummingboard-i2eX/make_sd_card.sh
>>  create mode 100644 configs/hummingboard_i2eX_defconfig
>>
>> diff --git a/board/solid-run/hummingboard-i2eX/make_sd_card.sh b/board/solid-run/hummingboard-i2eX/make_sd_card.sh
>> new file mode 100755
>> index 0000000..55c0f17
>> --- /dev/null
>> +++ b/board/solid-run/hummingboard-i2eX/make_sd_card.sh
>> @@ -0,0 +1,207 @@
>> +#!/bin/bash -eu
>
> Are you sure bash is mandatory? All other scripts we have under board/ or
> support/ use /bin/sh.
>
>> +# @(#) Create a bootable SD card from Buildroot tree for the HummingBoard i2eX
>> +#
>> +# Copyright (c) 2015 Tk Open Systems Ltd. all rights reserved
>> +# License granted for public use under the terms of the "Attribution-ShareAlike
>> +# 4.0 International" license, See full text at
>> +# https://creativecommons.org/licenses/by-sa/4.0/legalcode
>
> Buildroot code itself is under GPLv2. See
> http://nightly.buildroot.org/manual.html#_complying_with_the_buildroot_license.
> Is this license GPLv2 compatible?
>
> Is this script better/different than board/freescale/create-boot-sd.sh? I
> think we should have one script for this job. A "SoM vendor neutral" location
> for this script is likely to be board/freescale/ in this case. The readme.txt
> file, once added, should mention this script.
>
> [...]
>
>> diff --git a/configs/hummingboard_i2eX_defconfig
>> b/configs/hummingboard_i2eX_defconfig
>> new file mode 100644
>> index 0000000..0463bae
>> --- /dev/null
>> +++ b/configs/hummingboard_i2eX_defconfig
>> @@ -0,0 +1,24 @@
>
> Most other defconfigs have section titles. See
> configs/freescale_imx6qsabreauto_defconfig for example.
>
>> +BR2_arm=y
>> +BR2_cortex_a9=y
>> +BR2_ARM_EABIHF=y
>> +BR2_ARM_FPU_VFPV3=y
>> +BR2_TOOLCHAIN_EXTERNAL=y
>> +BR2_TARGET_GENERIC_HOSTNAME="HummingBoard"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to HummingBoard i2eX"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/SolidRun/linux-imx6-3.14.git"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ea83bda1b403d745c67fbf6ea307d05ca138577f"
>> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v7_cbi_hb"
>> +BR2_LINUX_KERNEL_ZIMAGE=y
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-hummingboard"
>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BOARDNAME="mx6_cubox-i"
>> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/SolidRun/u-boot-imx6.git"
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="e817fa3165a607b581433a6abfe37e095a5d1dc9"
>> +BR2_TARGET_UBOOT_SPL=y
>> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
>> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>
> baruch
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
