Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C36C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 22:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B348405F6;
	Fri, 29 Jul 2022 22:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B348405F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYgv23gZ8EN9; Fri, 29 Jul 2022 22:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51751401B7;
	Fri, 29 Jul 2022 22:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51751401B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4A7E1BF45A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5D7481971
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D7481971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFZR6Vo_Fx0I for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 22:11:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 891098195C
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 891098195C
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 22:11:41 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id o1so4619977qkg.9
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 15:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qc+JRzqKK1EYCWwD1AeBTc96W3zSdsfAZX726YJiE1M=;
 b=G68dEgKO4GIrhWZgMym3Eh+Dxxuj4ngwCI+ahp3lPd+Hs39GYtjDHNcxm3sPFWHYR3
 tQZSIn5XkXQnvXtld70PkEf+7mCOsFLZkwh/1ONN9XU6i2wuMf9+VvtxmBWZRxa0pDCa
 BQisu5iTgpqPF65SWtMbGU0OGU2sxY+ROVabvbSyty8upobCbVGJ1pQ0WUgmuQGOzsym
 3Ujs04OFK3e+/FSM6Zwp02E6jiHFc7j0boAnBQIMud3G/AFCqFsLB73Zrx1crw/twrUE
 DsSkBGDBkgc53f23MdO+b4/BZzT0UITpYHQJHt2tLstDvQfUO3XTK0FB/2isjpg6Hzc2
 ruSg==
X-Gm-Message-State: AJIora9/Hc/Lx979njHV7jActQerr9bg0wUavqIlVejNN+FOVAv0w9pm
 IKUNWHSddtBerFoU+nLAtvY=
X-Google-Smtp-Source: AGRyM1uoLc0IMVQgVt/F4dubRWz9IreoHI6+ETdYnmhPYWd3lVn/voDuQbywTBcDKsaB6AKOJSrQRA==
X-Received: by 2002:a05:620a:2804:b0:6b8:5f52:c66b with SMTP id
 f4-20020a05620a280400b006b85f52c66bmr4380307qkp.8.1659132700245; 
 Fri, 29 Jul 2022 15:11:40 -0700 (PDT)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188]) by smtp.gmail.com with ESMTPSA id
 y20-20020a05620a25d400b006b56a4400f6sm3225601qko.16.2022.07.29.15.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 15:11:39 -0700 (PDT)
Message-ID: <84f1cfa0-cb94-246e-656a-bea65b43eb81@gmail.com>
Date: Fri, 29 Jul 2022 18:11:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220723160901.272373-1-Mr.Bossman075@gmail.com>
 <c8857f2a-8344-e215-2d3b-f492ed9662fc@benettiengineering.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <c8857f2a-8344-e215-2d3b-f492ed9662fc@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Qc+JRzqKK1EYCWwD1AeBTc96W3zSdsfAZX726YJiE1M=;
 b=qhAT1AZ/ljqZ/0JGqOoG1h3MrrecuIKNqwVGJMwLCYJMtbwpp0CXNlq1fjjn1Iwfds
 YrZe3tOhk2xxyQnp2JXBDoLaNTd5HRYZr1vUxaQX9BWWMgJzYdsmlv0UBhPX2/NHlYeb
 D009zA+hZs/agLU/+8XVe9HYsMLRZxzpeRJREL0JBj/+wNIRXlGjQEe2i8HrMF15FUY7
 tvyxwpINASWsotVphzu4pO+YomRGDu/mJNsLYinGwXyjUbz0JvjSQdPEBUo/iJX/5Rut
 +ETyTz4S/77JTIf69PUO2+8Yc3LnYJbcPMvJ11rgVi8cjm6vQvKFMU71aONfJ+EPTgjf
 xeWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qhAT1AZ/
Subject: Re: [Buildroot] [PATCH v1] configs/imxrt1050-evk: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: festevam@gmail.com, maeva.manuel@oss.nxp.com, stephane.viau@oss.nxp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 7/29/22 18:05, Giulio Benetti wrote:
> Hi Jesse!
> 
> On 23/07/22 18:09, Jesse Taube wrote:
>> The imxrt1050-evk is a development board from NXP.
> 
> Please here provide a brief description of the board and
> an URL pointing to the board page.
> 
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>    DEVELOPERS                                  |  6 ++++
>>    board/freescale/imxrt1050evk/genimage.cfg   | 34 ++++++++++++++++++
>>    board/freescale/imxrt1050evk/post-build.sh  |  4 +++
>>    board/freescale/imxrt1050evk/readme.txt     | 23 ++++++++++++
>>    board/freescale/imxrt1050evk/uboot.fragment |  2 ++
>>    configs/imxrt1050-evk_defconfig             | 40 +++++++++++++++++++++
>>    6 files changed, 109 insertions(+)
>>    create mode 100644 board/freescale/imxrt1050evk/genimage.cfg
>>    create mode 100755 board/freescale/imxrt1050evk/post-build.sh
>>    create mode 100644 board/freescale/imxrt1050evk/readme.txt
>>    create mode 100644 board/freescale/imxrt1050evk/uboot.fragment
>>    create mode 100644 configs/imxrt1050-evk_defconfig
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 0afd697b6c..206bac99e0 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1096,9 +1096,11 @@ F:	package/webp/
>>    F:	package/xapian/
>>    
>>    N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +F:	board/freescale/imxrt1050evk/*
>>    F:	board/olimex/a*
>>    F:	configs/amarula_vyasa_rk3288_defconfig
>>    F:	configs/asus_tinker_rk3288_defconfig
>> +F:	configs/imxrt1050-evk_defconfig
> 
> Thank you for adding me :-)
> 
>>    F:	configs/olimex_a*
>>    F:	package/at/
>>    F:	package/binutils/
>> @@ -1421,6 +1423,10 @@ F:	package/wmctrl/
>>    F:	package/x11r7/xdriver_xf86-video-imx/
>>    F:	package/x11r7/xdriver_xf86-video-imx-viv/
>>    
>> +N:	Jesse Taube <Mr.Bossman075@gmail.com>
>> +F:	board/freescale/imxrt1050evk/*
>> +F:	configs/imxrt1050-evk_defconfig
>> +
>>    N:	Jianhui Zhao <zhaojh329@gmail.com>
>>    F:	package/libuhttpd/
>>    F:	package/libuwsc/
>> diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
>> new file mode 100644
>> index 0000000000..e9f224516f
>> --- /dev/null
>> +++ b/board/freescale/imxrt1050evk/genimage.cfg
>> @@ -0,0 +1,34 @@
>> +image boot.vfat {
>> +	vfat {
>> +		files = {
>> +			"uImage",
>> +			"imxrt1050-evk.dtb",
>> +		}
>> +	}
>> +	size = 6M
>> +}
>> +
>> +image sdcard.img {
>> +	hdimage {}
>> +	partition SPL {
>> +		in-partition-table = "no"
>> +		image = "SPL"
>> +		offset = 1K
>> +		size = 127K
>> +	}
>> +	partition u-boot {
>> +		in-partition-table = "no"
>> +		image = "u-boot.img"
>> +		offset = 128K
>> +		size = 512K
>> +	}
>> +	partition boot {
>> +		partition-type = 0xc
>> +		bootable = "true"
>> +		image = "boot.vfat"
>> +	}
>> +	partition rootfs {
>> +		partition-type = 0x83
>> +		image = "rootfs.ext4"
>> +	}
>> +}
> 
> genimage.cfg has a standard format to follow that you can find in
> Buildroot's manual:
> https://buildroot.org/downloads/manual/manual.html#writing-genimage-cfg
OH... I didn't see this.
> You're missing most all newlines after every closing curly parenthesis.
> 
>> diff --git a/board/freescale/imxrt1050evk/post-build.sh b/board/freescale/imxrt1050evk/post-build.sh
>> new file mode 100755
>> index 0000000000..47557566f9
>> --- /dev/null
>> +++ b/board/freescale/imxrt1050evk/post-build.sh
>> @@ -0,0 +1,4 @@
>> +#!/bin/sh
>> +rm output/images/uImage
>> +mkimage -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d output/images/Image output/images/uImage
> 
> This ^^^ can be achieved by using BR2_LINUX_KERNEL_UIMAGE=y instead of
> the default selected BR2_LINUX_KERNEL_ZIMAGE.
BR2_LINUX_KERNEL_UIMAGE=y doesn't let me select compression `-C none` 
u-boot runs out of memory as it is running in the 512kB address space 
and not the 32MB
>> +./support/scripts/genimage.sh $2 $3
> 
> This ^^^ can be achieved with:
> BR2_ROOTFS_POST_IMAGE_SCRIPT
> and
> BR2_ROOTFS_POST_SCRIPT_ARGS
> 
> you can take as reference:
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/olimex_a33_olinuxino_defconfig#L46-47
> 
> 
>> diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
>> new file mode 100644
>> index 0000000000..d9c183a38f
>> --- /dev/null
>> +++ b/board/freescale/imxrt1050evk/readme.txt
>> @@ -0,0 +1,23 @@
>> +NXP i.MXRT1050 EVK board
>> +---------------------
>> +
>> +To build a minimal support for this board:
>> +
>> +$ make imxrt1050-evk_defconfig
>> +$ make
>> +
>> +Buildroot prepares a bootable "sdcard.img" image in the output/images/
>> +directory, ready to be flashed into the SD card:
>> +
>> +$ sudo dd status=progress oflag=sync bs=4k if=output/images/sdcard.img of=/dev/<sd-card-device>; sync
> 
> This:
> ```
>       # dd if=output/images/sdcard.img of=/dev/sdX
> 
> Where 'sdX' is the device node of the uSD.
> ```
> is sufficient.
> 
>> +Jumper settings:
>> +
>> +   SW7: 1 0 1 0
>> +
>> +Where 0 means bottom position and 1 means top position (from the
>> +switch label numbers reference).
>> +
>> +Connect the USB cable between the EVK and the PC for the console.
>> +
>> +Insert the micro SD card in the board, power it up and U-Boot messages should come up.
>> diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
>> new file mode 100644
>> index 0000000000..1c5bb6af35
>> --- /dev/null
>> +++ b/board/freescale/imxrt1050evk/uboot.fragment
>> @@ -0,0 +1,2 @@
>> +CONFIG_USE_BOOTCOMMAND=y
>> +CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 uImage;bootm 0x80000000 - 0x80800000"
>> diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
>> new file mode 100644
>> index 0000000000..03a47c1fd6
>> --- /dev/null
>> +++ b/configs/imxrt1050-evk_defconfig
>> @@ -0,0 +1,40 @@
>> +# Architecture
>> +BR2_arm=y
>> +BR2_cortex_m7=y
>> +
>> +# Image
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imxrt1050evk/post-build.sh"
>> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
> 
> After modified like above for post-build.sh you have to modify these 2
> lines ^^^ and drop post-build.sh script.
> 
>> +
>> +# Kernel
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19-rc5"
> 
> Here it would be better using a stable version. 5 days ago Linux
> 5.19-rc8 has been released so I expect the final release to land
> on Sunday or in the beginning of the next week. So please, use version
> 5.19.
> 
>> +BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
>> +BR2_LINUX_KERNEL_IMAGE_NAME="Image"
> 
> As pointed above here ^^^ use uImage.
> 
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
>> +
>> +# Filesystem
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_4=y
>> +BR2_TARGET_ROOTFS_EXT2_LABEL="root"
>> +BR2_TARGET_ROOTFS_EXT2_SIZE="3M"
>> +
>> +
>> +# Bootloader
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
>> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
>> +BR2_TARGET_UBOOT_FORMAT_IMG=y
>> +BR2_TARGET_UBOOT_SPL=y
>> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
>> +
>> +# Required tools to create the SD card image
>> +BR2_PACKAGE_HOST_GENIMAGE=y
>> +BR2_PACKAGE_HOST_MKPASSWD=y
>> +
>> +# Misc
>> +BR2_BINUTILS_VERSION_2_36_X=y
> 
> I remember there is a reason to force using binutils 2.36, maybe the
> thumb2 ADR bug in u-boot? If yes, please briefly explain why this is
> here.
> 
> I've given a build using Buildroot's utils/docker-run but it fails due
> to missing BR2_TARGET_UBOOT_NEEDS_OPENSSL=y. So please next time build
> with utils/docker-run to catch any possible missing host dependency.
> 
> Waiting for V2 then.
> 
> Thanks for contributing!
> Kind regards
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
