Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7540CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 17:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16B4A40142;
	Mon, 31 Jan 2022 17:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bR01WcF_H1Lr; Mon, 31 Jan 2022 17:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFED0403E9;
	Mon, 31 Jan 2022 17:11:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1BFA1BF35C
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 17:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9006A41497
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 17:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VsR957RsjzSo for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 17:11:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CED64148D
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 17:11:49 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id EaDQnee6V0FuyEaDQnXiHr; Mon, 31 Jan 2022 18:11:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643649106; bh=3kBBRZt+fJVD2yfnvtkPuYM2N+Y13FuzbbIH3gp3R0k=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ULpJBivqg5w9MCQY+jhe2B4D9teHcwdRBDfCnHEoUjOEmepODucOi5+8o3kFY80nk
 /Tl1KpDlOIS/3BVr/7POWaSxOx6ph0Aza/Gi9fIS0ShTxP+c7SdHsL6rdeAa7Cx7Wp
 vvxnNWAo8y7Wra/9z5R6fUTow7dmVAUFPijU2BF8Y8aRLCaGyWbHdXqAJz1kEHLEDF
 F7qahQOSNTD1zqcGCohzn7q4nFzKGztZImQ6KY2xrY6ik+80+VgEQElxP13qAkvQPT
 xUdG9YmpPXf/iQqYblbALwHL2cGql5fxEKUSziY7PDm7bLpJSfgcbgGfYPfd1CctJK
 01MVoONg3g7Qg==
Message-ID: <86bf975a-1599-005a-5ebc-a149cc973da4@benettiengineering.com>
Date: Mon, 31 Jan 2022 18:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <20220131153022.351662-1-heiko.thiery@gmail.com>
 <CAOf5uwkFjQCGBOD4JMn4MG_SR74-bW1SHoDFiEC7mqH_C8Xq7w@mail.gmail.com>
 <CAEyMn7aDyH24AYVMZaLvt9SQMtVu9yhzftPqbSsuJ671tY-kNQ@mail.gmail.com>
 <12be81a6-7f2e-35b8-4f44-d8a20fce74f1@benettiengineering.com>
 <CAOf5uwmeT8WVUc3xvP0DjrVDLj9egvJz0+JEvWhgojnEVhyTyw@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAOf5uwmeT8WVUc3xvP0DjrVDLj9egvJz0+JEvWhgojnEVhyTyw@mail.gmail.com>
X-CMAE-Envelope: MS4wfLQA3Yp2ux8bODvORAUa+2lUhDDsc1dMi2+qDT7UHSE8J2DpGGa1hOP7/LHlD2dcu0b5Orb9jRNsaX85oEVHau9Kh68sZY4NqpaeyWyccKDbHiepqFcU
 D7zNnIIFHPbFKJEOJbXoHwJyjnvuNjuizQSmLyKlnAoUOLtZt/SyNaw9tCYeiI5KDsItey3tDrBkWrojiz4mnkBYnGP6yhRqT2EGlXCPtqdP2JDNbVL3NHgP
 r/ShUmLE97RqSzpAspR/3QdjSPmrCAPJLL2yVyZJTDhXWp8N40IYWUI5zSmWtP2usPNCl0v08Px8Ma21bw/FmgsaQ/+2ONK6XskoR2BnRrZMaYmD04KsOC6n
 i6tI9BOjhp1v2ht6BpHF6j/XZpO9Lc/K9vkEJQhMqCr0O8S7ACwENDgg2t3egkswst56MJIEZ0qydB1N+5hx30nD70psa9I0tbdqbTxCbgoyPLaCQtA=
Subject: Re: [Buildroot] [PATCH v5] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 31/01/22 17:42, Michael Nazzareno Trimarchi wrote:

[SNIP]

>>>>> diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
>>>>> new file mode 100644
>>>>> index 0000000000..0cf0115bfa
>>>>> --- /dev/null
>>>>> +++ b/configs/kontron_bl_imx8mm_defconfig
>>>>> @@ -0,0 +1,58 @@
>>>>> +# Architecture
>>>>> +BR2_aarch64=y
>>>>> +BR2_ARM_FPU_VFPV3=y
>>>>> +
>>>>> +BR2_GLOBAL_PATCH_DIR="board/kontron/bl-imx8mm/patches"
>>>>> +
>>>>> +# System
>>>>> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
>>>>> +
>>>>> +# Kernel
>>>>> +BR2_LINUX_KERNEL=y
>>>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
>>>>> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>>>>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>>>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-kontron-n801x-s"
>>>>> +BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
>>>>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>>>>> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>>>>> +
>>>>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
>>>>> +
>>>>> +BR2_PACKAGE_FREESCALE_IMX=y
>>>>> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
>>>>> +BR2_PACKAGE_FIRMWARE_IMX=y
>>>>> +
>>>>> +# Filesystem / image
>>>>> +BR2_TARGET_ROOTFS_EXT2=y
>>>>> +BR2_TARGET_ROOTFS_EXT2_4=y
>>>>> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>>>>> +
>>>>> +# Bootloader
>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880000"
>>>>> +BR2_TARGET_UBOOT=y
>>>>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>>>>> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>>>>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
>>>>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
>>>>> +BR2_TARGET_UBOOT_NEEDS_DTC=y
>>>>> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>>>>> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>>>>> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>>>>> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
>>>>> +BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
>>>>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>>>>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
>>>>> +BR2_TARGET_UBOOT_SPL=y
>>>>> +
>>>>> +# Required host tools to create the SD/eMMC image
>>>>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/bl-imx8mm/post-build.sh"
>>>>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>>>>> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>>>>> +BR2_PACKAGE_HOST_GENIMAGE=y
>>>>
>>>> I have seen that some people like to have this organization but it's
>>>> not really nice to maintain. I would like
>>>> to savedefconfig and use that one instead of having nice commented
>>>> part. Is this mandatory?
>>>
>>> As far as I know there is no rule how to do that. For me it seems to
>>> be more readable and clean. But this is only my opinion.
>>
>> As Heiko pointed it's a very good habit.
>>
>> One thing that must be taken into account while doing it, is to keep the
>> various BR2_* configs ordered as they are ordere inside the various
>> Config.in
> 
> There are good information indeed but even those information must be
> keep updated. Daily work show me that work on
> savedefconfig make things nicely. Some of your option can be at some
> point autoselect by another one and so on.

Yes, you're right, I've noticed that too. It's "not that automatic", but 
if you check the first 25 defconfigs you can see that more or less the 
70% use the "descriptive" way. So basically one should savedefconfig to 
another file and compare to the configs/*_defconfig and eventually modify.

Anyway there is still not a standard decided. So maintainers will accept 
both ways.

Cheers
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
