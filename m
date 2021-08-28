Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4682DC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:07:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D816F60E77
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D816F60E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 867C1832E7;
	Sat, 28 Aug 2021 20:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IarfOYUp_vhq; Sat, 28 Aug 2021 20:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDBA2832E8;
	Sat, 28 Aug 2021 20:06:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38E431BF3E5
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 227CA6065A
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MO95W4kHNyp for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 20:06:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 261FB60656
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 20:06:48 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id e63so666321yba.7
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=if70g3051xEGMoir9azsBaGwrgMxhFY4+XSaXC99WoE=;
 b=M2w2kBVxZVm6vTTh+5XzLAHZ8Jmb2C3VIwsQspT1V/z+KtlXwgTMK1rfKLvDrTSyW/
 vYn0kig7dXxhY49utF8fMotSHpyI4qJzFg/UHBD+O8e5XrLdlmViAzUQcGJjnmnd5rSf
 Y3xUPuYTdBXSvWxqnplO7oI3CflGV0Vs3Z+oxW/HS9xIyX+Ok1a0tMxFV6M+fhfj5WzE
 XN1Ido8nIO+zVmJIq9gGKEcCVtElmza5Fu3qSpRxeeFFI8+FZxTCdKJDw0gY94M5QVws
 yhGCaC16yAYkxBzhGIkNqMxCSFR66voKvI4JpftyI/lWu50l21egnDRCnTgewueQdqy8
 U/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=if70g3051xEGMoir9azsBaGwrgMxhFY4+XSaXC99WoE=;
 b=Din7nCS4vkf6/AZs5mPIfJN46+wVT/ZQb8tr/iRYz9X40RAsxrXxjqe4+JROY9cvYA
 I5qrfpxoBFDJ3CVJLUfIXY5jOna0b64TOKgHuJ0PUiwbmyOilhKWyT//ZOSeDOzRwxLF
 GiiDr+KAk1JhTXeVkDAvCVPNQwSr2K8krZvqcWeKXPwKmbF9luuIUY+mVoUCAgTAl4fn
 /2OveQxVRquwcAO5tzuVCZoAO9DNwT/iQ0MSWZ8sTxZ81Dc6tVe+WAUX4FbuY1d2hnaJ
 1DS3cJDhy3ysgTEFgc9U6WL6ZzYlsbBh2rTHPLiovcXVsOsIw9Q50bfKavinX7/CwZto
 1YyQ==
X-Gm-Message-State: AOAM532VwOBH+Vb1LA3iaplp+lcavLtSkXmwpNKpmGg0VUfWmQcJceCz
 8B5askacK7xlDhiVTdvRMEdqhWkykmT+U2JDORY=
X-Google-Smtp-Source: ABdhPJyf2C/bWANoI54PUOkheiVIWjWsjpz+yDZAPShLrP6kRrWQUbuYsKkPx4U3cMi95FKuaYhZ2LsPePUajcQxYAc=
X-Received: by 2002:a25:31d7:: with SMTP id
 x206mr13487594ybx.297.1630181205522; 
 Sat, 28 Aug 2021 13:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210825181858.801574-1-eugentoo@gmail.com>
 <20210825181858.801574-2-eugentoo@gmail.com>
 <a0e8c46c-16ad-5b31-832b-377dda07ef0c@mind.be>
In-Reply-To: <a0e8c46c-16ad-5b31-832b-377dda07ef0c@mind.be>
From: Yauheni Saldatsenka <eugentoo@gmail.com>
Date: Sat, 28 Aug 2021 23:06:33 +0300
Message-ID: <CADj5-Ay1rChLmWYSHoFPawMv8hsi-mESd667G_zTLSNJK8+jPg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 2/3] [PATCH v2 1/1]
 configs/stm32f469_disco_xip_defconfig: alternative defconfig for XIP
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7679036817577629413=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7679036817577629413==
Content-Type: multipart/alternative; boundary="000000000000acbd6b05caa423c1"

--000000000000acbd6b05caa423c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Arnout.

Thanks for bringing your efforts to this patchset!

In case there would be any further questions feel free to ask.

Best regards,
Yauheni Saldatsenka

=D1=81=D0=B1, 28 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 17:57, Arnout Vand=
ecappelle <arnout@mind.be>:

>  Hi Yauheni,
>
>  There were still a number of things not OK with this patch, but I've
> fixed them
> up and applied to next, thanks.
>
>  First of all, it should have been only a single commit, not split over 3
> for
> the different versions. Separate commits should only be made when you do
> separate, more or less independent things. In this case, however, it's
> really a
> single change you're making (adding the new defconfig). So I've squashed
> everything into a single commit.
>
>
> On 25/08/2021 20:18, Yauheni Saldatsenka wrote:
> > Result of make tinyconfig was taken as a starting point to fit kernel
> > into flash memory.
> > Current setup kernel + rootfs fits in 1.6MB on-chip flash memory.
> >
> > Fixes:
> >     - Move kernel to new flash bank due to growth of dtb size
> >     - Fix kernel start address in bootloader
> >
> > For better binary size optimization gcc LTO is turned on.
> >
> > Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
>
> [snip]
> > diff --git a/board/stmicroelectronics/stm32f469-disco/linux/defconfig
> b/board/stmicroelectronics/stm32f469-disco/linux/linux.config
> > similarity index 100%
> > rename from board/stmicroelectronics/stm32f469-disco/linux/defconfig
> > rename to board/stmicroelectronics/stm32f469-disco/linux/linux.config
>
>  linux/linux.config is not a very useful name, so I've moved it up one
> directory. I also called it linux-xip.config, to distinguish it more
> clearly
> from the existing linux.fragment.
>
>
> > diff --git
> a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm3=
2f469-i-Update-kernel-start-address.patch
> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm3=
2f469-i-Update-kernel-start-address.patch
> > new file mode 100644
> > index 0000000000..d5d1e5a8ad
> > --- /dev/null
> > +++
> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm3=
2f469-i-Update-kernel-start-address.patch
> > @@ -0,0 +1,56 @@
> > +From fe5f3a86d07e378baeeddc1dfecd0686d83aa42f Mon Sep 17 00:00:00 2001
> > +From: Yauheni Saldatsenka <eugentoo@gmail.com>
> > +Date: Sat, 14 Aug 2021 18:54:51 +0300
> > +Subject: [PATCH] stm32f469-i: Update kernel start address
> > +
> > +As of GNU/Linux v5.12 kernel device tree binary grows above 0x08008000
> > +and overwrites kernel binary
> > +Therefore this commit moves kernel to the next flash bank
> > +
> > +Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
>
>  Has this patch been sent upstream to afboot-stm32?
>
>
> > +---
> > + stm32f469i-disco.c | 7 +++----
> > + 1 file changed, 3 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
> > +index 2da1f4b..46fc06a 100644
> > +--- a/stm32f469i-disco.c
> > ++++ b/stm32f469i-disco.c
> > +@@ -6,6 +6,7 @@
> > + #include "gpio.h"
> > + #include "mpu.h"
> > +
> > ++#define KERNEL_ADDR     0x08010000
> > + #define CONFIG_HSE_HZ       8000000
> > + #define CONFIG_PLL_M        8
> > + #define CONFIG_PLL_N        360
> > +@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)
> > +
> > + void start_kernel(void)
> > + {
> > +-    void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) =3D
> (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
> > ++    void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) =3D
> (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);
> > +
> > +     kernel(0, ~0UL, 0x08004000);
> > + }
> > +@@ -102,7 +103,7 @@ int main(void)
> > +     volatile uint32_t *SYSCFG_MEMRMP =3D (void *)(SYSCFG_BASE + 0x00)=
;
> > +     int i;
> > +
> > +-    mpu_config(0x0);
> > ++    mpu_config(0xc0000000);
>
>  It's not clear how this is related to moving the kernel address...
>
> > +
> > +     if (*FLASH_CR & FLASH_CR_LOCK) {
> > +             *FLASH_KEYR =3D 0x45670123;
> > +@@ -195,8 +196,6 @@ int main(void)
> > +     usart_setup(usart_base, 45000000);
> > +     usart_putch(usart_base, '.');
> > +
> > +-    *SYSCFG_MEMRMP =3D 0x4;
>
>  This also is not clear why it's removed.
>
>  I still applied the patch as is.
>
> > +-
> > +     start_kernel();
> > +
> > +     return 0;
> > +--
> > +2.32.0
> [snip]
> > diff --git
> a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default=
-dram-address-without-remapping.patch
> b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default=
-dram-address-without-remapping.patch
> > new file mode 100644
> > index 0000000000..68fe8380a2
> > --- /dev/null
> > +++
> b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default=
-dram-address-without-remapping.patch
> > @@ -0,0 +1,38 @@
> > +From 8ccf9f625d00138d86fb7d70f3efd58a8fb4d7ff Mon Sep 17 00:00:00 2001
> > +From: Yauheni Saldatsenka <eugentoo@gmail.com>
> > +Date: Mon, 23 Aug 2021 02:54:22 +0300
> > +Subject: [PATCH] Use default dram address without remapping
> > +
> > +Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
> > +---
> > + arch/arm/boot/dts/stm32f469-disco.dts | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/arch/arm/boot/dts/stm32f469-disco.dts
> b/arch/arm/boot/dts/stm32f469-disco.dts
> > +index 2e1b3bbbe4b5..06845614a19a 100644
> > +--- a/arch/arm/boot/dts/stm32f469-disco.dts
> > ++++ b/arch/arm/boot/dts/stm32f469-disco.dts
> > +@@ -60,9 +60,9 @@ chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +-    memory@00000000 {
> > ++    memory@c0000000 {
>
>  It's good that you update the device tree with a patch now instead of
> copying
> it. However, the full dts was still there in the board directory, but
> unused. So
> I removed it.
>
>  Also, there were a few changes that you didn't keep - but I guess those
> weren't
> actually needed.
>
> > +             device_type =3D "memory";
> > +-            reg =3D <0x00000000 0x1000000>;
> > ++            reg =3D <0xc0000000 0x1000000>;
> > +     };
> > +
> > +     aliases {
> > +@@ -84,7 +84,7 @@ vdd_dsi: vdd-dsi {
> > +     };
> > +
> > +     soc {
> > +-            dma-ranges =3D <0xc0000000 0x0 0x10000000>;
> > ++            dma-ranges =3D <0xc0000000 0xc0000000 0x10000000>;
> > +     };
> > +
> > +     leds {
> > +--
> > +2.32.0
> > +
> > diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt
> b/board/stmicroelectronics/stm32f469-disco/readme.txt
> > index c1e1d30e69..646f340382 100644
> > --- a/board/stmicroelectronics/stm32f469-disco/readme.txt
> > +++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
> > @@ -4,23 +4,37 @@ STM32F469 Discovery
> >  This tutorial describes how to use the predefined Buildroot
> >  configuration for the STM32F469 Discovery evaluation platform.
> >
> > +There are two setups supported:
> > +1. Internal flash memory is fully occupied with u-boot bootloader whic=
h
> boots kernel with
> > +   root filesystem from MMC.
> > +2. Internal flash memory stores simple afboot-stm32 bootloader, device
> tree and
> > +   in place (XIP) kernel with built-in initramfs.
>
>  Very good readme! I've just added here a sentence to say that no SD card
> is
> needed, to make that explicit.
>
>
>  Regards,
>  Arnout
>
> > +   Kernel is based on tinyconfig.
> > +
> >  Building
> >  --------
> > +  Type
> > +  "make stm32f469_disco_defconfig"
> > +  to build u-boot setup
> > +  or
> > +  "make stm32f469_disco_xip_defconfig"
> > +  to build xip setup
> > +
> > +  Then
> >
> > -  make stm32f469_disco_defconfig
> > -  make
> > +  "make"
> >
> >  Flashing
> >  --------
> >
> > -  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
> > +  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
> <BUILD_TYPE>
> >
> > -It will flash the U-boot bootloader.
> > +  <BUILD_TYPE> can be "xip" or "uboot"
> >
> > -Creating SD card
> > +Creating SD card for u-boot setup
> >  ----------------
> >
> > -Buildroot prepares an"sdcard.img" image in the output/images/ director=
y,
> > +Buildroot prepares an "sdcard.img" image in the output/images/
> directory,
> >  ready to be dumped on a SD card. Launch the following command as root:
> >
> >    dd if=3Doutput/images/sdcard.img of=3D/dev/<your-sd-device>
> > diff --git a/configs/stm32f469_disco_xip_defconfig
> b/configs/stm32f469_disco_xip_defconfig
> > index 81bdb0d6d6..fd2946ab8b 100644
> > --- a/configs/stm32f469_disco_xip_defconfig
> > +++ b/configs/stm32f469_disco_xip_defconfig
> > @@ -1,24 +1,18 @@
> >  BR2_arm=3Dy
> >  BR2_cortex_m4=3Dy
> >  BR2_GLOBAL_PATCH_DIR=3D"board/stmicroelectronics/stm32f469-disco/patch=
es"
> > -BR2_KERNEL_HEADERS_5_13=3Dy
> >  # BR2_UCLIBC_INSTALL_UTILS is not set
> > -BR2_GCC_VERSION_11_X=3Dy
> >  BR2_GCC_ENABLE_LTO=3Dy
> >
> -BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/stmicroelectronics/common/stm32f4x=
x/stm32-post-build.sh"
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/stmicroelectronics/stm32f46=
9-disco/linux/defconfig"
> >
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/stmicroelectronics/stm32f46=
9-disco/linux/linux.config"
> >  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy
> >  BR2_LINUX_KERNEL_XZ=3Dy
> >  BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=3D"xipImage"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"stm32f469-disco"
> >
> -BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"board/stmicroelectronics/stm32f469-d=
isco/linux/stm32f469-disco.dts"
> >  BR2_PACKAGE_BUSYBOX_CONFIG=3D"package/busybox/busybox-minimal.config"
> > -BR2_PACKAGE_ZLIB=3Dy
> >  BR2_TARGET_ROOTFS_INITRAMFS=3Dy
> >  # BR2_TARGET_ROOTFS_TAR is not set
> >  BR2_TARGET_AFBOOT_STM32=3Dy
> >  BR2_PACKAGE_HOST_OPENOCD=3Dy
> > -BR2_PACKAGE_HOST_UTIL_LINUX=3Dy
> >
>

--000000000000acbd6b05caa423c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hello Arnout.<br><br></div>Thanks for  brin=
ging your efforts to this patchset!<br><br></div><div>In case there would b=
e any further questions feel free to ask.<br><br></div><div>Best regards,<b=
r></div><div>Yauheni Saldatsenka<br></div></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D0=B1, 28 =D0=B0=D0=
=B2=D0=B3. 2021 =D0=B3. =D0=B2 17:57, Arnout Vandecappelle &lt;<a href=3D"m=
ailto:arnout@mind.be">arnout@mind.be</a>&gt;:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">=C2=A0Hi Yauheni,<br>
<br>
=C2=A0There were still a number of things not OK with this patch, but I&#39=
;ve fixed them<br>
up and applied to next, thanks.<br>
<br>
=C2=A0First of all, it should have been only a single commit, not split ove=
r 3 for<br>
the different versions. Separate commits should only be made when you do<br=
>
separate, more or less independent things. In this case, however, it&#39;s =
really a<br>
single change you&#39;re making (adding the new defconfig). So I&#39;ve squ=
ashed<br>
everything into a single commit.<br>
<br>
<br>
On 25/08/2021 20:18, Yauheni Saldatsenka wrote:<br>
&gt; Result of make tinyconfig was taken as a starting point to fit kernel<=
br>
&gt; into flash memory.<br>
&gt; Current setup kernel + rootfs fits in 1.6MB on-chip flash memory.<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Move kernel to new flash bank due to growth of dt=
b size<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Fix kernel start address in bootloader<br>
&gt; <br>
&gt; For better binary size optimization gcc LTO is turned on.<br>
&gt; <br>
&gt; Signed-off-by: Yauheni Saldatsenka &lt;<a href=3D"mailto:eugentoo@gmai=
l.com" target=3D"_blank">eugentoo@gmail.com</a>&gt;<br>
<br>
[snip]<br>
&gt; diff --git a/board/stmicroelectronics/stm32f469-disco/linux/defconfig =
b/board/stmicroelectronics/stm32f469-disco/linux/linux.config<br>
&gt; similarity index 100%<br>
&gt; rename from board/stmicroelectronics/stm32f469-disco/linux/defconfig<b=
r>
&gt; rename to board/stmicroelectronics/stm32f469-disco/linux/linux.config<=
br>
<br>
=C2=A0linux/linux.config is not a very useful name, so I&#39;ve moved it up=
 one<br>
directory. I also called it linux-xip.config, to distinguish it more clearl=
y<br>
from the existing linux.fragment.<br>
<br>
<br>
&gt; diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-s=
tm32/0001-stm32f469-i-Update-kernel-start-address.patch b/board/stmicroelec=
tronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel=
-start-address.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d5d1e5a8ad<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/00=
01-stm32f469-i-Update-kernel-start-address.patch<br>
&gt; @@ -0,0 +1,56 @@<br>
&gt; +From fe5f3a86d07e378baeeddc1dfecd0686d83aa42f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Yauheni Saldatsenka &lt;<a href=3D"mailto:eugentoo@gmail.com" t=
arget=3D"_blank">eugentoo@gmail.com</a>&gt;<br>
&gt; +Date: Sat, 14 Aug 2021 18:54:51 +0300<br>
&gt; +Subject: [PATCH] stm32f469-i: Update kernel start address<br>
&gt; +<br>
&gt; +As of GNU/Linux v5.12 kernel device tree binary grows above 0x0800800=
0<br>
&gt; +and overwrites kernel binary<br>
&gt; +Therefore this commit moves kernel to the next flash bank<br>
&gt; +<br>
&gt; +Signed-off-by: Yauheni Saldatsenka &lt;<a href=3D"mailto:eugentoo@gma=
il.com" target=3D"_blank">eugentoo@gmail.com</a>&gt;<br>
<br>
=C2=A0Has this patch been sent upstream to afboot-stm32?<br>
<br>
<br>
&gt; +---<br>
&gt; + stm32f469i-disco.c | 7 +++----<br>
&gt; + 1 file changed, 3 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c<br>
&gt; +index 2da1f4b..46fc06a 100644<br>
&gt; +--- a/stm32f469i-disco.c<br>
&gt; ++++ b/stm32f469i-disco.c<br>
&gt; +@@ -6,6 +6,7 @@<br>
&gt; + #include &quot;gpio.h&quot;<br>
&gt; + #include &quot;mpu.h&quot;<br>
&gt; + <br>
&gt; ++#define KERNEL_ADDR=C2=A0 =C2=A0 =C2=A00x08010000<br>
&gt; + #define CONFIG_HSE_HZ=C2=A0 =C2=A0 =C2=A0 =C2=A08000000<br>
&gt; + #define CONFIG_PLL_M=C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
&gt; + #define CONFIG_PLL_N=C2=A0 =C2=A0 =C2=A0 =C2=A0 360<br>
&gt; +@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)<br>
&gt; + <br>
&gt; + void start_kernel(void)<br>
&gt; + {<br>
&gt; +-=C2=A0 =C2=A0 void (*kernel)(uint32_t reserved, uint32_t mach, uint3=
2_t dt) =3D (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);<br>
&gt; ++=C2=A0 =C2=A0 void (*kernel)(uint32_t reserved, uint32_t mach, uint3=
2_t dt) =3D (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0kernel(0, ~0UL, 0x08004000);<br>
&gt; + }<br>
&gt; +@@ -102,7 +103,7 @@ int main(void)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0volatile uint32_t *SYSCFG_MEMRMP =3D (void *)(SYS=
CFG_BASE + 0x00);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 mpu_config(0x0);<br>
&gt; ++=C2=A0 =C2=A0 mpu_config(0xc0000000);<br>
<br>
=C2=A0It&#39;s not clear how this is related to moving the kernel address..=
.<br>
<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (*FLASH_CR &amp; FLASH_CR_LOCK) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*FLASH_KEYR =3D 0x456=
70123;<br>
&gt; +@@ -195,8 +196,6 @@ int main(void)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usart_setup(usart_base, 45000000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usart_putch(usart_base, &#39;.&#39;);<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 *SYSCFG_MEMRMP =3D 0x4;<br>
<br>
=C2=A0This also is not clear why it&#39;s removed.<br>
<br>
=C2=A0I still applied the patch as is.<br>
<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start_kernel();<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +-- <br>
&gt; +2.32.0<br>
[snip]<br>
&gt; diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/00=
01-Use-default-dram-address-without-remapping.patch b/board/stmicroelectron=
ics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-rem=
apping.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..68fe8380a2<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-=
default-dram-address-without-remapping.patch<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +From 8ccf9f625d00138d86fb7d70f3efd58a8fb4d7ff Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Yauheni Saldatsenka &lt;<a href=3D"mailto:eugentoo@gmail.com" t=
arget=3D"_blank">eugentoo@gmail.com</a>&gt;<br>
&gt; +Date: Mon, 23 Aug 2021 02:54:22 +0300<br>
&gt; +Subject: [PATCH] Use default dram address without remapping<br>
&gt; +<br>
&gt; +Signed-off-by: Yauheni Saldatsenka &lt;<a href=3D"mailto:eugentoo@gma=
il.com" target=3D"_blank">eugentoo@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + arch/arm/boot/dts/stm32f469-disco.dts | 6 +++---<br>
&gt; + 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dt=
s/stm32f469-disco.dts<br>
&gt; +index 2e1b3bbbe4b5..06845614a19a 100644<br>
&gt; +--- a/arch/arm/boot/dts/stm32f469-disco.dts<br>
&gt; ++++ b/arch/arm/boot/dts/stm32f469-disco.dts<br>
&gt; +@@ -60,9 +60,9 @@ chosen {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =3D &quot=
;serial0:115200n8&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 memory@00000000 {<br>
&gt; ++=C2=A0 =C2=A0 memory@c0000000 {<br>
<br>
=C2=A0It&#39;s good that you update the device tree with a patch now instea=
d of copying<br>
it. However, the full dts was still there in the board directory, but unuse=
d. So<br>
I removed it.<br>
<br>
=C2=A0Also, there were a few changes that you didn&#39;t keep - but I guess=
 those weren&#39;t<br>
actually needed.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D &quot=
;memory&quot;;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x00000000 0x1=
000000&gt;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0xc0000000 0x1=
000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0aliases {<br>
&gt; +@@ -84,7 +84,7 @@ vdd_dsi: vdd-dsi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0soc {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma-ranges =3D &lt;0xc0000=
000 0x0 0x10000000&gt;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma-ranges =3D &lt;0xc0000=
000 0xc0000000 0x10000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0leds {<br>
&gt; +-- <br>
&gt; +2.32.0<br>
&gt; +<br>
&gt; diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/boa=
rd/stmicroelectronics/stm32f469-disco/readme.txt<br>
&gt; index c1e1d30e69..646f340382 100644<br>
&gt; --- a/board/stmicroelectronics/stm32f469-disco/readme.txt<br>
&gt; +++ b/board/stmicroelectronics/stm32f469-disco/readme.txt<br>
&gt; @@ -4,23 +4,37 @@ STM32F469 Discovery<br>
&gt;=C2=A0 This tutorial describes how to use the predefined Buildroot<br>
&gt;=C2=A0 configuration for the STM32F469 Discovery evaluation platform.<b=
r>
&gt;=C2=A0 <br>
&gt; +There are two setups supported:<br>
&gt; +1. Internal flash memory is fully occupied with u-boot bootloader whi=
ch boots kernel with<br>
&gt; +=C2=A0 =C2=A0root filesystem from MMC.<br>
&gt; +2. Internal flash memory stores simple afboot-stm32 bootloader, devic=
e tree and<br>
&gt; +=C2=A0 =C2=A0in place (XIP) kernel with built-in initramfs.<br>
<br>
=C2=A0Very good readme! I&#39;ve just added here a sentence to say that no =
SD card is<br>
needed, to make that explicit.<br>
<br>
<br>
=C2=A0Regards,<br>
=C2=A0Arnout<br>
<br>
&gt; +=C2=A0 =C2=A0Kernel is based on tinyconfig.<br>
&gt; +<br>
&gt;=C2=A0 Building<br>
&gt;=C2=A0 --------<br>
&gt; +=C2=A0 Type<br>
&gt; +=C2=A0 &quot;make stm32f469_disco_defconfig&quot;<br>
&gt; +=C2=A0 to build u-boot setup<br>
&gt; +=C2=A0 or<br>
&gt; +=C2=A0 &quot;make stm32f469_disco_xip_defconfig&quot;<br>
&gt; +=C2=A0 to build xip setup<br>
&gt; +<br>
&gt; +=C2=A0 Then<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 make stm32f469_disco_defconfig<br>
&gt; -=C2=A0 make<br>
&gt; +=C2=A0 &quot;make&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Flashing<br>
&gt;=C2=A0 --------<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 ./board/stmicroelectronics/stm32f469-disco/flash.sh output/<br=
>
&gt; +=C2=A0 ./board/stmicroelectronics/stm32f469-disco/flash.sh output/ &l=
t;BUILD_TYPE&gt;<br>
&gt;=C2=A0 <br>
&gt; -It will flash the U-boot bootloader.<br>
&gt; +=C2=A0 &lt;BUILD_TYPE&gt; can be &quot;xip&quot; or &quot;uboot&quot;=
<br>
&gt;=C2=A0 <br>
&gt; -Creating SD card<br>
&gt; +Creating SD card for u-boot setup<br>
&gt;=C2=A0 ----------------<br>
&gt;=C2=A0 <br>
&gt; -Buildroot prepares an&quot;sdcard.img&quot; image in the output/image=
s/ directory,<br>
&gt; +Buildroot prepares an &quot;sdcard.img&quot; image in the output/imag=
es/ directory,<br>
&gt;=C2=A0 ready to be dumped on a SD card. Launch the following command as=
 root:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 dd if=3Doutput/images/sdcard.img of=3D/dev/&lt;your-sd-de=
vice&gt;<br>
&gt; diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469=
_disco_xip_defconfig<br>
&gt; index 81bdb0d6d6..fd2946ab8b 100644<br>
&gt; --- a/configs/stm32f469_disco_xip_defconfig<br>
&gt; +++ b/configs/stm32f469_disco_xip_defconfig<br>
&gt; @@ -1,24 +1,18 @@<br>
&gt;=C2=A0 BR2_arm=3Dy<br>
&gt;=C2=A0 BR2_cortex_m4=3Dy<br>
&gt;=C2=A0 BR2_GLOBAL_PATCH_DIR=3D&quot;board/stmicroelectronics/stm32f469-=
disco/patches&quot;<br>
&gt; -BR2_KERNEL_HEADERS_5_13=3Dy<br>
&gt;=C2=A0 # BR2_UCLIBC_INSTALL_UTILS is not set<br>
&gt; -BR2_GCC_VERSION_11_X=3Dy<br>
&gt;=C2=A0 BR2_GCC_ENABLE_LTO=3Dy<br>
&gt; -BR2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;board/stmicroelectronics/common/=
stm32f4xx/stm32-post-build.sh&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/stmicroelectronics/=
stm32f469-disco/linux/defconfig&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/stmicroelectronics/=
stm32f469-disco/linux/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_XZ=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=3D&quot;xipImage&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;stm32f469-disco&quot;<b=
r>
&gt; -BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D&quot;board/stmicroelectronics/stm=
32f469-disco/linux/stm32f469-disco.dts&quot;<br>
&gt;=C2=A0 BR2_PACKAGE_BUSYBOX_CONFIG=3D&quot;package/busybox/busybox-minim=
al.config&quot;<br>
&gt; -BR2_PACKAGE_ZLIB=3Dy<br>
&gt;=C2=A0 BR2_TARGET_ROOTFS_INITRAMFS=3Dy<br>
&gt;=C2=A0 # BR2_TARGET_ROOTFS_TAR is not set<br>
&gt;=C2=A0 BR2_TARGET_AFBOOT_STM32=3Dy<br>
&gt;=C2=A0 BR2_PACKAGE_HOST_OPENOCD=3Dy<br>
&gt; -BR2_PACKAGE_HOST_UTIL_LINUX=3Dy<br>
&gt; <br>
</blockquote></div>

--000000000000acbd6b05caa423c1--

--===============7679036817577629413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7679036817577629413==--
