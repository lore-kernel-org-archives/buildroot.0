From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 04 Sep 2017 13:35:57 +0200
Subject: [Buildroot] [PATCH 1/1] New board: SolidRun ClearFog Base
In-Reply-To: <20170904104128.rbpp3qjkgyi6kafu@sapphire.tkos.co.il>
References: <20170904104128.rbpp3qjkgyi6kafu@sapphire.tkos.co.il>
Message-ID: <199cf974-e7bb-433a-b3eb-ff1ec4f171fa@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
thanks for a review, comments below.

> You can try using a boot script to override any default 
> environment setting. 
> See board/solidrun/mx6cubox/post-build.sh for example.

Ah, right. I looked into the bootscript feature in other defconfigs. I got 
confused on *how* the produced boot.scr gets actually used; some configs 
moved that to a fixed offset within the generated image via `genimage`, 
which looked quite ugly. Now I finally noticed that call to `install` :), 
OK, that's going to work. Thanks.

> Please add a readme.txt file that explains how to write the 
> generated image to 
> SD card, and how to set the DIP switches. See 
> board/freescale/imx6sabre/readme.txt, as an example.

Ack, will do.

>> diff --git a/board/solidrun/clearfog/post-image.sh 
>> b/board/solidrun/clearfog/post-image.sh
>> new file mode 100755
>> index 0000000..b4ac460
>> --- /dev/null
>> +++ b/board/solidrun/clearfog/post-image.sh ...
>
> You can try the generic genimage.sh script. See configs/ci40_defconfig.

Nice, thanks.

>> diff --git a/configs/clearfog_defconfig b/configs/clearfog_defconfig
>> new file mode 100644
>> index 0000000..797c072
>> --- /dev/null
>> +++ b/configs/clearfog_defconfig ...
>
> Please use the internal toolchain for the basic defconfig.

I can make that change, but I wonder what the rationale is. I see that it's 
probably not obvious from the attached config, but it is actually set to 
use the Linaro toolchain to save time during the build. Do you still want 
me to change this?

>> +BR2_TARGET_GENERIC_PASSWD_SHA512=y
>> +BR2_INIT_SYSTEMD=y
>> +# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
>
> Basic defconfigs leave the defaults unchanged.

OK, I'll make it so.

>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/solidrun/clearfog/post-image.sh"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.10"
>> +BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7" ...
>
> Please set BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE to the version you tested.

I created this file via `make menuconfig` followed by `make savedefconfig`. 
In there, I used the default version of U-Boot, the 2017.07. Should I 
really go and change this to hardcode a version which will eventually get 
obsolete in future? I'm not familiar with U-Boot's releases, just 
double-checking here.
