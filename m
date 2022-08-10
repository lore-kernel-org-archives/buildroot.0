Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E3BC19F2D
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 00:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC64409DE;
	Wed, 10 Aug 2022 00:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC64409DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPCFTSOpye7Y; Wed, 10 Aug 2022 00:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F0CE40951;
	Wed, 10 Aug 2022 00:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F0CE40951
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDA721BF9C6
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 00:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 970A840951
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 00:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 970A840951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVsoh_no0rkR for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 00:17:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E13744092D
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E13744092D
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 00:17:03 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id p18so12801656plr.8
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 17:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4ZeLe+4yXevNCWzgGRKbraHNRa7bUr5yjQ/ui/+0U5k=;
 b=AlKH6VuJkzOtkT0WFljN5e6pcb82nAUdXt75DCSaUBDIaYot25tRPwNzpMvxnM03jB
 Ny8rUCbmqV+dV2DsDWVVBY+kf8+I4aVBlAgchgUlzv2nr5qhD1UH+lZJEmfuveBCrYh4
 xMYb4SVnIa49i4d1S6506oS+6/ShqL2YALgWqO1WxDxvxPQqTT/Nkp+JssBZ6Qv0cxt7
 WYqqlx6eNd2wuyPpxquPjoSj5m8GLxkhIekkBWHyTU4u6MeYIfcGQkA+fqoTzXaBkITz
 BVorzjBl8ZqFZ1wgr157n/8NlWDb668LYgfaapb9055hQKOzxdPhzo3dxHizI66u5KiH
 i4cQ==
X-Gm-Message-State: ACgBeo2da7RoAWOY1tz7T/qGh/I/gT5Tr4Ie17IseEQtanOQ76h26Cmm
 uhDmT/tmHscTrLR6exRQNeGVLsrX6xbuLD5rQ7eH280QtEw=
X-Google-Smtp-Source: AA6agR6CXbbaDwXP2jGF/+eEjg2W4w4vkmmBoCSrtAEFCmFX6STqDRqZIvZ1SRiU0pZ5WpahTmVcigY+W5VSbx0KP+s=
X-Received: by 2002:a17:90b:17c9:b0:1f3:3a7c:a3a7 with SMTP id
 me9-20020a17090b17c900b001f33a7ca3a7mr1006863pjb.76.1660090622603; Tue, 09
 Aug 2022 17:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <CA+2=KW=N8uk9D4ajpL61O+JZGyMLcuthvpGfEKOA6EvY=u0xSQ@mail.gmail.com>
In-Reply-To: <CA+2=KW=N8uk9D4ajpL61O+JZGyMLcuthvpGfEKOA6EvY=u0xSQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 9 Aug 2022 21:16:49 -0300
Message-ID: <CAOMZO5D4ke-2aHMnHaArsgDnQpLR6_kEa8aeVfij8NGwGecpXg@mail.gmail.com>
To: Wyatt SanSoucie <wyatt.n.sansoucie@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=4ZeLe+4yXevNCWzgGRKbraHNRa7bUr5yjQ/ui/+0U5k=;
 b=gC0Uq5bLone1W/CVWYoYJrjqTG8nRrdmENx79nSWsEeMBGcZjzT0C7mTXWcDDMdxsu
 +P+CWqfNyc6tiGJaqjj4xgFuhwbf+qPRGdES8CSh4+j3ACBhTTPgfAnrMSAljHU3E0fT
 PbdGNEpeifFa7bQEmaO3ySBptaA7JBAvY6lE9+8LvN4xiCKT/UIkK/B3N512CdfKV8gc
 xBLZOtIPYbwz2JI0xy40htehuMVUud1u7/IdXLp4inbeKdkpldbyaZk5YzzJ0qMHHy7h
 XFm84OZuTiF+u+F4PJnOLhQL/Qhy/VAD/n7oOFrMoZdKADL0Rbg1X5nLuj49XeJT5rSE
 9gBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gC0Uq5bL
Subject: Re: [Buildroot] freescale_imx8mnevk_defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Wyatt,

On Tue, Aug 9, 2022 at 9:06 PM Wyatt SanSoucie
<wyatt.n.sansoucie@gmail.com> wrote:
>
> Hello Everyone,
>
> I am trying to build an SD card image for the NXP iMX8MN EVK board.  I had to change the configuration from DDR to LPDDR in order for u-boot to get past RAM initialization but now I am stuck at this point:
>
> DDRINFO: start DRAM init
> DDRINFO: DRAM rate 3200MTS
> DDRINFO:ddrphy calibration done
> DDRINFO: ddrmix config done
> Normal Boot
> Trying to boot from BOOTROM
> image offset 0x8000, pagesize 0x200, ivt offset 0x0
> Can't support legacy image
> SPL: failed to boot from all boot devices
> ### ERROR ### Please RESET the board ###
>
> I also get this build warning even though the file exists in the /buildroot/output/images folder:
> WARNING 'ddr4_imem_1d.bin' not found, resulting binary is not-functional

The existing configs/freescale_imx8mnevk_defconfig is targeted for the
imx8mn evk populated with DDR4.

If you want to generate an image for an imx8mn evk with LPDDR4, then I
suggest creating a
new configs/freescale_imx8mnevk_lpddr4_defconfig with the content below:

BR2_aarch64=y
BR2_ARM_FPU_VFPV3=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh
board/freescale/common/imx/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mn-evk.dtb"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-evk"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_FREESCALE_IMX=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y
BR2_PACKAGE_FIRMWARE_IMX=y
BR2_PACKAGE_FIRMWARE_IMX_LPDDR4=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_evk"
BR2_TARGET_UBOOT_NEEDS_DTC=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
BR2_TARGET_UBOOT_SPL=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_IMX_MKIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y
BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
