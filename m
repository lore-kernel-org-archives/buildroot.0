Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284DAC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 10:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851548328E;
	Mon,  8 Jan 2024 10:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 851548328E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mmOgnWEzfCkl; Mon,  8 Jan 2024 10:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A8383298;
	Mon,  8 Jan 2024 10:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A8383298
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9981B1BF31D
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 10:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CA8A408BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 10:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CA8A408BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w17tWRUvRiG4 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 10:06:43 +0000 (UTC)
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D38E540641
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 10:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D38E540641
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7cdf4b99e7eso467836241.0
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 02:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704708401; x=1705313201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6eHmbkuOdGE/8azC8AtbxLpd7nsndTZd93uh7Kua0ek=;
 b=w3H1QjOgZmU8pVY/4RLba73HdXAGJNz0ICPE3+hraE/0odcPA0SgyUquNPyRuwKOe9
 ykuwy0tz4PnvGEWifhw5LqtVGQPs6xO38u0lJos2K1hDLcCDBmM+QYrqSSQ8IBR8deMr
 kRFJ7d2j7a40G5pglhjB2dv1jH8edBGOkk85VEqOK22xpkgKmbD4lBw3WiyySmPJyhuJ
 CZEcdr4UoMbIriTPXT1Jyia/tcsPD8o/ZuxIusKqDD+po6zp+Eq+iMS06l31f4aM5rcd
 8EvFZGIK41PHBt8pdz/rSEQduum9PNCfU2kNYPqTHEA9RK0C84SbSn1RhULSGhoKKuDo
 1cCg==
X-Gm-Message-State: AOJu0YzcnPBOcYBJXtxysyEMOtJgvBE6yWlVawU+R88OAfaFXdjC0BCj
 mb+qrHO232tPk1goT5riCyfv9Htdk1Fx04tUCZT0+PaawUj+x0u6
X-Google-Smtp-Source: AGHT+IFxhxjlocmvp1ENCIN2ifSE9U8IfrqF7Y9lGJexKjKlCvX+JFbxcExkYHqEgVASgpDziOQ46xHITohPT6ZXFcs=
X-Received: by 2002:a05:6102:3f46:b0:467:697:e8fe with SMTP id
 l6-20020a0561023f4600b004670697e8femr1106417vsv.54.1704708400960; Mon, 08 Jan
 2024 02:06:40 -0800 (PST)
MIME-Version: 1.0
References: <20240107084319.4382-1-asd617140123@gmail.com>
 <1a64e45d-86b5-4416-8a0b-d62d212e3a8b@benettiengineering.com>
In-Reply-To: <1a64e45d-86b5-4416-8a0b-d62d212e3a8b@benettiengineering.com>
From: eric <asd617140123@gmail.com>
Date: Mon, 8 Jan 2024 18:06:26 +0800
Message-ID: <CAKEXHNPcnMOg12yeyfugD8y9wk=Jt4D-CtGnwiSZ8ZLJBKDMdw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704708401; x=1705313201; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6eHmbkuOdGE/8azC8AtbxLpd7nsndTZd93uh7Kua0ek=;
 b=iJIiANLphAj8FzMv39EesQQXNoj8OM8y/hazMpPx4MNYNG7jV2SZpJTuSHnEu0PGVG
 Eoz7Kn6a/wpf2VZcv814fHv+5wE9uAfkBpJiGVIJB8VNY/+TdxvUZd2js+jpClITbl83
 UkVr1vh7SIqOTbd+iyh++IpmfIjGZ/tNSjoUYwO1bFcPA9rTFA7PUEHFiZa9otwT18ob
 Fzue99N6+yEFaY+RW/SkGwH9p13b4J6URYpI+1XIrdiG0tRVrL4EcxrKliXEc+PxgPrQ
 FcESJuEEMxwbux2/AQDpHDWTecSv+8snRQEAv/XMXbaetA88SxU3svvDaq8gK62R1JwI
 4k2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iJIiANLp
Subject: Re: [Buildroot] [V3 1/1] refactor config
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
Cc: thomas.petazzoni@free-electrons.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0405716122100880206=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0405716122100880206==
Content-Type: multipart/alternative; boundary="000000000000af5c32060e6c5ad7"

--000000000000af5c32060e6c5ad7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giulio,
     I have two questions.

     -  This patch definetely needs to be squashed with the other patch
you've
sent to obtain a single patch.

I am confuse above description, I take one example.
my v2 patch is
"0001-board-cubietech-cubieboard4-Add-config-file-for-cubi.patch"
my v3 patch is "0001-refactor-cubieboard4_defconfig.patch"
If I need to squash above two patch.
I can run " git format-patch -s -M -o . -2"., then use the one patch as by
v4 patch, right?

- In my v3 patch, I already  shrink defconfig, I using make saveconfig to
save the config file.

Thank you.
Best regards,
Nigel



Giulio Benetti <giulio.benetti@benettiengineering.com> =E6=96=BC 2024=E5=B9=
=B41=E6=9C=887=E6=97=A5 =E9=80=B1=E6=97=A5
=E4=B8=8B=E5=8D=888:22=E5=AF=AB=E9=81=93=EF=BC=9A

> This patch definetely needs to be squashed with the other patch you've
> sent to obtain a single patch. When you send a patch it's expected that
> it simply works, the previous one doesn't work as you point below and so
> you need this one.
> But all patches have to be bisectable that means that if you move
> forward of backward with commits everything must build and work
> possibly, that's why we need these 2 patches to be only atomic one.
>
> Also, defconfig must be shrinked, otherwise it's unreadable and wastes
> size.
>
> Waiting for V4 of a single patch then,
>
> thank you!
>
> Best regards
> --
> Giulio Benetti
> CEO&CTO@Benetti Engineering sas
>
> On 07/01/24 09:43, Nigel Wang wrote:
> > This is a new defconfig for cubieboard4. The following is board's
> > detail.
> > - SOC: sunxiA80.
> > - DRAM: 2GiB DDR3 @ 672MHZ.
> > - NAND: 8GBeMMC
> > - Power: DC 5V.
> > - Network: Wifi 80211 b/g/n.
> > - Ethernet: RTL8211E
> > reference:
> > https://linux-sunxi.org/Cubietech_Cubieboard4
> >
> > Board support package includes the following components:
> > - mainline Linux Kernel 6.6.8
> > - mainline U-boot 2021.10.
> >
> > Signed-off-by: Nigel Wang <asd617140123@gmail.com>
> > ---
> > v2 -> v3
> > * Add BR2_cortex_a15_a7=3Dy in buildroot defconfig.
> > * Bump linux version to 6.6.8
> > * Using sunxi_defconfig in kernel.
> > * Using "make savedefconfig" to save defconfig, it can only save the
> > changed config in buildroot.
> > * Change kernel's path in extlinux. Make it can boot up successfully.
> >
> > ---
> >   board/cubietech/cubieboard4/extlinux.conf |    2 +-
> >   board/cubietech/cubieboard4/genimage.cfg  |    2 +-
> >   board/cubietech/cubieboard4/post-image.sh |    1 +
> >   configs/cubieboard4_defconfig             | 4843 +-------------------=
-
> >   4 files changed, 24 insertions(+), 4824 deletions(-)
> >
> > diff --git a/board/cubietech/cubieboard4/extlinux.conf
> b/board/cubietech/cubieboard4/extlinux.conf
> > index 42a71012b6..5084e2237b 100644
> > --- a/board/cubietech/cubieboard4/extlinux.conf
> > +++ b/board/cubietech/cubieboard4/extlinux.conf
> > @@ -1,5 +1,5 @@
> >   label linux
> > -    lernel /Image
> > +    kernel /boot/zImage
> >       devicetree /sun9i-a80-cubieboard4.dtb
> >       append console=3DttyS0,115200 earlyprintk root=3D/dev/mmcblk0p2
> rootwait
> >
> > diff --git a/board/cubietech/cubieboard4/genimage.cfg
> b/board/cubietech/cubieboard4/genimage.cfg
> > index 34edb2b306..f1dee13923 100644
> > --- a/board/cubietech/cubieboard4/genimage.cfg
> > +++ b/board/cubietech/cubieboard4/genimage.cfg
> > @@ -6,7 +6,7 @@ image boot.vfat {
> >               files =3D {
> >                       "zImage",
> >                       "sun9i-a80-cubieboard4.dtb",
> > -                     "boot.scr"
> > +                     "extlinux"
> >               }
> >       }
> >
> > diff --git a/board/cubietech/cubieboard4/post-image.sh
> b/board/cubietech/cubieboard4/post-image.sh
> > index c534ddb1a0..e37b960a4d 100755
> > --- a/board/cubietech/cubieboard4/post-image.sh
> > +++ b/board/cubietech/cubieboard4/post-image.sh
> > @@ -2,6 +2,7 @@
> >
> >   BOARD_DIR=3D"$(dirname "$0")"
> >   install -m 0644 -D $BOARD_DIR/extlinux.conf
> $BINARIES_DIR/extlinux/extlinux.conf
> > +
> >   GENIMAGE_CFG=3D"${BOARD_DIR}/genimage.cfg"
> >   GENIMAGE_TMP=3D"${BUILD_DIR}/genimage.tmp"
> >
> > diff --git a/configs/cubieboard4_defconfig
> b/configs/cubieboard4_defconfig
> > index 5a0f0b737c..0592fe4a2d 100644
> > --- a/configs/cubieboard4_defconfig
> > +++ b/configs/cubieboard4_defconfig
> > @@ -1,4840 +1,39 @@
> > -#
> > -# Automatically generated file; DO NOT EDIT.
> > -# Buildroot 2023.11-rc1-25-gcc3088a44b-dirty Configuration
> > -#
> > -BR2_HAVE_DOT_CONFIG=3Dy
> > -BR2_HOST_GCC_AT_LEAST_4_9=3Dy
> > -BR2_HOST_GCC_AT_LEAST_5=3Dy
> > -BR2_HOST_GCC_AT_LEAST_6=3Dy
> > -BR2_HOST_GCC_AT_LEAST_7=3Dy
> > -BR2_HOST_GCC_AT_LEAST_8=3Dy
> > -BR2_HOST_GCC_AT_LEAST_9=3Dy
> > -BR2_HOST_GCC_AT_LEAST_10=3Dy
> > -BR2_HOST_GCC_AT_LEAST_11=3Dy
> > -
> > -#
> > -# Target options
> > -#
> > -BR2_USE_MMU=3Dy
> > -# BR2_arcle is not set
> > -# BR2_arceb is not set
> > -BR2_arm=3Dy
> > -# BR2_armeb is not set
> > -# BR2_aarch64 is not set
> > -# BR2_aarch64_be is not set
> > -# BR2_i386 is not set
> > -# BR2_m68k is not set
> > -# BR2_microblazeel is not set
> > -# BR2_microblazebe is not set
> > -# BR2_mips is not set
> > -# BR2_mipsel is not set
> > -# BR2_mips64 is not set
> > -# BR2_mips64el is not set
> > -# BR2_nios2 is not set
> > -# BR2_or1k is not set
> > -# BR2_powerpc is not set
> > -# BR2_powerpc64 is not set
> > -# BR2_powerpc64le is not set
> > -# BR2_riscv is not set
> > -# BR2_s390x is not set
> > -# BR2_sh is not set
> > -# BR2_sparc is not set
> > -# BR2_sparc64 is not set
> > -# BR2_x86_64 is not set
> > -# BR2_xtensa is not set
> > -BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT=3Dy
> > -BR2_ARCH=3D"arm"
> > -BR2_NORMALIZED_ARCH=3D"arm"
> > -BR2_ENDIAN=3D"LITTLE"
> > -BR2_GCC_TARGET_ABI=3D"aapcs-linux"
> > -BR2_GCC_TARGET_CPU=3D"cortex-a7"
> > -BR2_GCC_TARGET_FPU=3D"neon-vfpv4"
> > -BR2_GCC_TARGET_FLOAT_ABI=3D"hard"
> > -BR2_GCC_TARGET_MODE=3D"arm"
> > -BR2_BINFMT_SUPPORTS_SHARED=3Dy
> > -BR2_READELF_ARCH_NAME=3D"ARM"
> > -BR2_ARM_CPU_HAS_NEON=3Dy
> > -BR2_ARM_CPU_HAS_FPU=3Dy
> > -BR2_ARM_CPU_HAS_VFPV2=3Dy
> > -BR2_ARM_CPU_HAS_VFPV3=3Dy
> > -BR2_ARM_CPU_HAS_VFPV4=3Dy
> > -BR2_ARM_CPU_HAS_ARM=3Dy
> > -BR2_ARM_CPU_HAS_THUMB2=3Dy
> > -BR2_ARM_CPU_ARMV7A=3Dy
> > -
> > -#
> > -# armv4 cores
> > -#
> > -# BR2_arm920t is not set
> > -# BR2_arm922t is not set
> > -# BR2_fa526 is not set
> > -# BR2_strongarm is not set
> > -
> > -#
> > -# armv5 cores
> > -#
> > -# BR2_arm926t is not set
> > -# BR2_xscale is not set
> > -
> > -#
> > -# armv6 cores
> > -#
> > -# BR2_arm1136j_s is not set
> > -# BR2_arm1136jf_s is not set
> > -# BR2_arm1176jz_s is not set
> > -# BR2_arm1176jzf_s is not set
> > -# BR2_arm11mpcore is not set
> > -
> > -#
> > -# armv7a cores
> > -#
> > -# BR2_cortex_a5 is not set
> > -BR2_cortex_a7=3Dy
> > -# BR2_cortex_a8 is not set
> > -# BR2_cortex_a9 is not set
> > -# BR2_cortex_a12 is not set
> > -# BR2_cortex_a15 is not set
> > -# BR2_cortex_a15_a7 is not set
> > -# BR2_cortex_a17 is not set
> > -# BR2_cortex_a17_a7 is not set
> > -# BR2_pj4 is not set
> > -
> > -#
> > -# armv7m cores
> > -#
> > -# BR2_cortex_m3 is not set
> > -# BR2_cortex_m4 is not set
> > -# BR2_cortex_m7 is not set
> > -
> > -#
> > -# armv8 cores
> > -#
> > -# BR2_cortex_a32 is not set
> > -# BR2_cortex_a35 is not set
> > -# BR2_cortex_a53 is not set
> > -# BR2_cortex_a57 is not set
> > -# BR2_cortex_a57_a53 is not set
> > -# BR2_cortex_a72 is not set
> > -# BR2_cortex_a72_a53 is not set
> > -# BR2_cortex_a73 is not set
> > -# BR2_cortex_a73_a35 is not set
> > -# BR2_cortex_a73_a53 is not set
> > -# BR2_exynos_m1 is not set
> > -# BR2_xgene1 is not set
> > -
> > -#
> > -# armv8.1a cores
> > -#
> > -
> > -#
> > -# armv8.2a cores
> > -#
> > -# BR2_cortex_a76 is not set
> > -# BR2_cortex_a76_a55 is not set
> > -# BR2_neoverse_n1 is not set
> > -
> > -#
> > -# armv8.4a cores
> > -#
> > -# BR2_ARM_EABI is not set
> > -BR2_ARM_EABIHF=3Dy
> > -# BR2_ARM_FPU_VFPV2 is not set
> > -# BR2_ARM_FPU_VFPV3 is not set
> > -# BR2_ARM_FPU_VFPV3D16 is not set
> > -# BR2_ARM_FPU_VFPV4 is not set
> > -# BR2_ARM_FPU_VFPV4D16 is not set
> > -# BR2_ARM_FPU_NEON is not set
> > -BR2_ARM_FPU_NEON_VFPV4=3Dy
> > -BR2_ARM_INSTRUCTIONS_ARM=3Dy
> > -# BR2_ARM_INSTRUCTIONS_THUMB2 is not set
> > -BR2_BINFMT_ELF=3Dy
> > -
> > -#
> > -# Toolchain
> > -#
> > -BR2_TOOLCHAIN=3Dy
> > -BR2_TOOLCHAIN_USES_GLIBC=3Dy
> > -BR2_TOOLCHAIN_BUILDROOT=3Dy
> > -# BR2_TOOLCHAIN_EXTERNAL is not set
> > -
> > -#
> > -# Toolchain Buildroot Options
> > -#
> > -BR2_TOOLCHAIN_BUILDROOT_VENDOR=3D"buildroot"
> > -# BR2_TOOLCHAIN_BUILDROOT_UCLIBC is not set
> > -BR2_TOOLCHAIN_BUILDROOT_GLIBC=3Dy
> > -# BR2_TOOLCHAIN_BUILDROOT_MUSL is not set
> > -BR2_TOOLCHAIN_BUILDROOT_LIBC=3D"glibc"
> > -
> > -#
> > -# Kernel Header Options
> > -#
> > -BR2_KERNEL_HEADERS_AS_KERNEL=3Dy
> > -# BR2_KERNEL_HEADERS_4_14 is not set
> > -# BR2_KERNEL_HEADERS_4_19 is not set
> > -# BR2_KERNEL_HEADERS_5_4 is not set
> > -# BR2_KERNEL_HEADERS_5_10 is not set
> > -# BR2_KERNEL_HEADERS_5_15 is not set
> > -# BR2_KERNEL_HEADERS_6_1 is not set
> > -# BR2_KERNEL_HEADERS_6_5 is not set
> > -# BR2_KERNEL_HEADERS_6_6 is not set
> > -# BR2_KERNEL_HEADERS_VERSION is not set
> > -# BR2_KERNEL_HEADERS_CUSTOM_TARBALL is not set
> > -# BR2_KERNEL_HEADERS_CUSTOM_GIT is not set
> > -BR2_KERNEL_HEADERS_LATEST=3Dy
> > -BR2_PACKAGE_LINUX_HEADERS=3Dy
> > -BR2_PACKAGE_MUSL_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_MUSL_SUPPORTS=3Dy
> > -BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_UCLIBC_SUPPORTS=3Dy
> > -BR2_PACKAGE_GLIBC_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_GLIBC_SUPPORTS=3Dy
> > -
> > -#
> > -# Glibc Options
> > -#
> > -BR2_PACKAGE_GLIBC=3Dy
> > -# BR2_PACKAGE_GLIBC_KERNEL_COMPAT is not set
> > -# BR2_PACKAGE_GLIBC_UTILS is not set
> > -
> > -#
> > -# Binutils Options
> > -#
> > -BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI=3Dy
> > -# BR2_BINUTILS_VERSION_2_39_X is not set
> > -BR2_BINUTILS_VERSION_2_40_X=3Dy
> > -# BR2_BINUTILS_VERSION_2_41_X is not set
> > -BR2_BINUTILS_VERSION=3D"2.40"
> > -# BR2_BINUTILS_GPROFNG is not set
> > -BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=3D""
> > -
> > -#
> > -# GCC Options
> > -#
> > -# BR2_GCC_VERSION_11_X is not set
> > -BR2_GCC_VERSION_12_X=3Dy
> > -# BR2_GCC_VERSION_13_X is not set
> > -BR2_GCC_VERSION=3D"12.3.0"
> > -BR2_EXTRA_GCC_CONFIG_OPTIONS=3D""
> > -# BR2_TOOLCHAIN_BUILDROOT_CXX is not set
> > -# BR2_TOOLCHAIN_BUILDROOT_FORTRAN is not set
> > -# BR2_GCC_ENABLE_OPENMP is not set
> > -# BR2_GCC_ENABLE_GRAPHITE is not set
> > -BR2_PACKAGE_GCC_FINAL=3Dy
> > -BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# Host GDB Options
> > -#
> > -# BR2_PACKAGE_HOST_GDB is not set
> > -
> > -#
> > -# Toolchain Generic Options
> > -#
> > -BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS=3Dy
> > -BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK=3Dy
> > -BR2_USE_WCHAR=3Dy
> > -BR2_ENABLE_LOCALE=3Dy
> > -BR2_TOOLCHAIN_HAS_THREADS=3Dy
> > -BR2_TOOLCHAIN_HAS_THREADS_DEBUG=3Dy
> > -BR2_TOOLCHAIN_HAS_THREADS_NPTL=3Dy
> > -BR2_TOOLCHAIN_HAS_SSP=3Dy
> > -BR2_TOOLCHAIN_HAS_SSP_STRONG=3Dy
> > -BR2_TOOLCHAIN_HAS_UCONTEXT=3Dy
> > -BR2_TOOLCHAIN_SUPPORTS_PIE=3Dy
> > -# BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY is not set
> > -BR2_TOOLCHAIN_EXTRA_LIBS=3D""
> > -BR2_TOOLCHAIN_HAS_FULL_GETTEXT=3Dy
> > -BR2_TARGET_OPTIMIZATION=3D""
> > -BR2_TARGET_LDFLAGS=3D""
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6=3Dy
> > -BR2_TOOLCHAIN_HEADERS_LATEST=3Dy
> > -BR2_TOOLCHAIN_HEADERS_AT_LEAST=3D"6.6"
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_4_3=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_4_4=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_4_5=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_4_6=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_4_7=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_4_8=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_4_9=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_5=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_6=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_7=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_8=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_9=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_10=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_11=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST_12=3Dy
> > -BR2_TOOLCHAIN_GCC_AT_LEAST=3D"12"
> > -BR2_TOOLCHAIN_HAS_MNAN_OPTION=3Dy
> > -BR2_TOOLCHAIN_HAS_SYNC_1=3Dy
> > -BR2_TOOLCHAIN_HAS_SYNC_2=3Dy
> > -BR2_TOOLCHAIN_HAS_SYNC_4=3Dy
> > -BR2_TOOLCHAIN_ARM_HAS_SYNC_8=3Dy
> > -BR2_TOOLCHAIN_HAS_SYNC_8=3Dy
> > -BR2_TOOLCHAIN_HAS_LIBATOMIC=3Dy
> > -BR2_TOOLCHAIN_HAS_ATOMIC=3Dy
> > -
> > -#
> > -# Build options
> > -#
> > -
> > -#
> > -# Commands
> > -#
> > -BR2_WGET=3D"wget --passive-ftp -nd -t 3"
> > -BR2_SVN=3D"svn --non-interactive"
> > -BR2_BZR=3D"bzr"
> > -BR2_GIT=3D"git"
> > -BR2_CVS=3D"cvs"
> > -BR2_LOCALFILES=3D"cp"
> > -BR2_SCP=3D"scp"
> > -BR2_SFTP=3D"sftp"
> > -BR2_HG=3D"hg"
> > -BR2_ZCAT=3D"gzip -d -c"
> > -BR2_BZCAT=3D"bzcat"
> > -BR2_XZCAT=3D"xzcat"
> > -BR2_LZCAT=3D"lzip -d -c"
> > -BR2_TAR_OPTIONS=3D""
> > -BR2_DL_DIR=3D"$(TOPDIR)/dl"
> > -BR2_HOST_DIR=3D"$(BASE_DIR)/host"
> > -
> > -#
> > -# Mirrors and Download locations
> > -#
> > -BR2_PRIMARY_SITE=3D""
> > -BR2_BACKUP_SITE=3D"https://sources.buildroot.net"
> > -BR2_KERNEL_MIRROR=3D"https://cdn.kernel.org/pub"
> > -BR2_GNU_MIRROR=3D"http://ftpmirror.gnu.org"
> > -BR2_LUAROCKS_MIRROR=3D"http://rocks.moonscript.org"
> > -BR2_CPAN_MIRROR=3D"https://cpan.metacpan.org"
> > -BR2_JLEVEL=3D0
> > -# BR2_CCACHE is not set
> > -# BR2_ENABLE_DEBUG is not set
> > -# BR2_ENABLE_RUNTIME_DEBUG is not set
> > -BR2_STRIP_strip=3Dy
> > -BR2_STRIP_EXCLUDE_FILES=3D""
> > -BR2_STRIP_EXCLUDE_DIRS=3D""
> > -# BR2_OPTIMIZE_0 is not set
> > -# BR2_OPTIMIZE_1 is not set
> > -# BR2_OPTIMIZE_2 is not set
> > -# BR2_OPTIMIZE_3 is not set
> > -# BR2_OPTIMIZE_G is not set
> > -BR2_OPTIMIZE_S=3Dy
> > -# BR2_OPTIMIZE_FAST is not set
> > -# BR2_ENABLE_LTO is not set
> > -
> > -#
> > -# static only needs a toolchain w/ uclibc or musl
> > -#
> > -BR2_SHARED_LIBS=3Dy
> > -# BR2_SHARED_STATIC_LIBS is not set
> > -BR2_PACKAGE_OVERRIDE_FILE=3D"$(CONFIG_DIR)/local.mk"
> > -BR2_GLOBAL_PATCH_DIR=3D""
> > -
> > -#
> > -# Advanced
> > -#
> > -# BR2_FORCE_HOST_BUILD is not set
> > -
> > -#
> > -# Forcing all downloads to have a valid hash needs a global patch and
> hash directory
> > -#
> > -# BR2_REPRODUCIBLE is not set
> > -# BR2_PER_PACKAGE_DIRECTORIES is not set
> > -# BR2_TIME_BITS_64 is not set
> > -
> > -#
> > -# Security Hardening Options
> > -#
> > -BR2_PIC_PIE_ARCH_SUPPORTS=3Dy
> > -BR2_PIC_PIE=3Dy
> > -# BR2_SSP_NONE is not set
> > -# BR2_SSP_REGULAR is not set
> > -BR2_SSP_STRONG=3Dy
> > -# BR2_SSP_ALL is not set
> > -BR2_SSP_OPTION=3D"-fstack-protector-strong"
> > -# BR2_RELRO_NONE is not set
> > -# BR2_RELRO_PARTIAL is not set
> > -BR2_RELRO_FULL=3Dy
> > -BR2_FORTIFY_SOURCE_ARCH_SUPPORTS=3Dy
> > -# BR2_FORTIFY_SOURCE_NONE is not set
> > -BR2_FORTIFY_SOURCE_1=3Dy
> > -# BR2_FORTIFY_SOURCE_2 is not set
> > -# BR2_FORTIFY_SOURCE_3 is not set
> > -
> > -#
> > -# System configuration
> > -#
> > -BR2_ROOTFS_SKELETON_DEFAULT=3Dy
> > -# BR2_ROOTFS_SKELETON_CUSTOM is not set
> > -BR2_TARGET_GENERIC_HOSTNAME=3D"Cubieboard4"
> > -BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Cubieboard4!"
> > -BR2_TARGET_GENERIC_PASSWD_SHA256=3Dy
> > -# BR2_TARGET_GENERIC_PASSWD_SHA512 is not set
> > -BR2_TARGET_GENERIC_PASSWD_METHOD=3D"sha-256"
> > -BR2_INIT_BUSYBOX=3Dy
> > -# BR2_INIT_SYSV is not set
> > -# BR2_INIT_OPENRC is not set
> > -# BR2_INIT_SYSTEMD is not set
> > -# BR2_INIT_NONE is not set
> > -# BR2_ROOTFS_DEVICE_CREATION_STATIC is not set
> > -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=3Dy
> > -# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
> > -# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is not set
> > -BR2_ROOTFS_DEVICE_TABLE=3D"system/device_table.txt"
> > -# BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES is not set
> > -# BR2_ROOTFS_MERGED_USR is not set
> > -BR2_TARGET_ENABLE_ROOT_LOGIN=3Dy
> > -BR2_TARGET_GENERIC_ROOT_PASSWD=3D""
> > -BR2_SYSTEM_BIN_SH_BUSYBOX=3Dy
> > -
> > -#
> > -# bash, dash, mksh, zsh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> > -#
> > -# BR2_SYSTEM_BIN_SH_NONE is not set
> > -BR2_TARGET_GENERIC_GETTY=3Dy
> > -BR2_TARGET_GENERIC_GETTY_PORT=3D"ttyS0"
> > -BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP=3Dy
> > -# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
> > -# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
> > -# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
> > -# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
> > -# BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200 is not set
> > -BR2_TARGET_GENERIC_GETTY_BAUDRATE=3D"0"
> > -BR2_TARGET_GENERIC_GETTY_TERM=3D"vt100"
> > -BR2_TARGET_GENERIC_GETTY_OPTIONS=3D""
> > -BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=3Dy
> > -BR2_SYSTEM_DHCP=3D""
> > -BR2_SYSTEM_DEFAULT_PATH=3D"/bin:/sbin:/usr/bin:/usr/sbin"
> > -BR2_ENABLE_LOCALE_PURGE=3Dy
> > -BR2_ENABLE_LOCALE_WHITELIST=3D"C en_US"
> > -BR2_GENERATE_LOCALE=3D""
> > -# BR2_SYSTEM_ENABLE_NLS is not set
> > -# BR2_TARGET_TZ_INFO is not set
> > -BR2_ROOTFS_USERS_TABLES=3D""
> > -BR2_ROOTFS_OVERLAY=3D""
> > -BR2_ROOTFS_PRE_BUILD_SCRIPT=3D""
> > -BR2_ROOTFS_POST_BUILD_SCRIPT=3D""
> > -BR2_ROOTFS_POST_FAKEROOT_SCRIPT=3D""
> > -BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/cubietech/cubieboard4/post-image=
.sh"
> > -BR2_ROOTFS_POST_SCRIPT_ARGS=3D""
> > -
> > -#
> > -# Kernel
> > -#
> > -BR2_LINUX_KERNEL=3Dy
> > -BR2_LINUX_KERNEL_LATEST_VERSION=3Dy
> > -# BR2_LINUX_KERNEL_LATEST_CIP_VERSION is not set
> > -# BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION is not set
> > -# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
> > -# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
> > -# BR2_LINUX_KERNEL_CUSTOM_GIT is not set
> > -# BR2_LINUX_KERNEL_CUSTOM_HG is not set
> > -# BR2_LINUX_KERNEL_CUSTOM_SVN is not set
> > -BR2_LINUX_KERNEL_VERSION=3D"6.6.1"
> > -BR2_LINUX_KERNEL_PATCH=3D""
> > -BR2_LINUX_KERNEL_USE_DEFCONFIG=3Dy
> > -# BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG is not set
> > -# BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG is not set
> > -BR2_LINUX_KERNEL_DEFCONFIG=3D"sunxi"
> > -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D""
> > -BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH=3D""
> > -# BR2_LINUX_KERNEL_UIMAGE is not set
> > -# BR2_LINUX_KERNEL_APPENDED_UIMAGE is not set
> > -BR2_LINUX_KERNEL_ZIMAGE=3Dy
> > -# BR2_LINUX_KERNEL_APPENDED_ZIMAGE is not set
> > -# BR2_LINUX_KERNEL_VMLINUX is not set
> > -# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
> > -BR2_LINUX_KERNEL_GZIP=3Dy
> > -# BR2_LINUX_KERNEL_LZ4 is not set
> > -# BR2_LINUX_KERNEL_LZMA is not set
> > -# BR2_LINUX_KERNEL_LZO is not set
> > -# BR2_LINUX_KERNEL_XZ is not set
> > -# BR2_LINUX_KERNEL_ZSTD is not set
> > -BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> > -# BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT is not set
> > -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"allwinner/sun9i-a80-cubieboard4"
> > -BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D""
> > -# BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME is not set
> > -# BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT is not set
> > -# BR2_LINUX_KERNEL_INSTALL_TARGET is not set
> > -# BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL is not set
> > -# BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF is not set
> > -# BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE is not set
> > -
> > -#
> > -# Linux Kernel Extensions
> > -#
> > -# BR2_LINUX_KERNEL_EXT_XENOMAI is not set
> > -# BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS is not set
> > -# BR2_LINUX_KERNEL_EXT_FBTFT is not set
> > -# BR2_LINUX_KERNEL_EXT_AUFS is not set
> > -
> > -#
> > -# Linux Kernel Tools
> > -#
> > -# BR2_PACKAGE_LINUX_TOOLS_CPUPOWER is not set
> > -# BR2_PACKAGE_LINUX_TOOLS_GPIO is not set
> > -# BR2_PACKAGE_LINUX_TOOLS_IIO is not set
> > -# BR2_PACKAGE_LINUX_TOOLS_PCI is not set
> > -# BR2_PACKAGE_LINUX_TOOLS_PERF is not set
> > -
> > -#
> > -# selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/
> dynamic library and headers >=3D 3.14
> > -#
> > -# BR2_PACKAGE_LINUX_TOOLS_USBTOOLS is not set
> > -# BR2_PACKAGE_LINUX_TOOLS_TMON is not set
> > -
> > -#
> > -# Target packages
> > -#
> > -BR2_PACKAGE_BUSYBOX=3Dy
> > -BR2_PACKAGE_BUSYBOX_CONFIG=3D"package/busybox/busybox.config"
> > -BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES=3D""
> > -# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
> > -# BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES is not set
> > -# BR2_PACKAGE_BUSYBOX_WATCHDOG is not set
> > -BR2_PACKAGE_SKELETON=3Dy
> > -BR2_PACKAGE_HAS_SKELETON=3Dy
> > -BR2_PACKAGE_PROVIDES_SKELETON=3D"skeleton-init-sysv"
> > -BR2_PACKAGE_SKELETON_INIT_COMMON=3Dy
> > -BR2_PACKAGE_SKELETON_INIT_SYSV=3Dy
> > -
> > -#
> > -# Audio and video applications
> > -#
> > -# BR2_PACKAGE_ALSA_UTILS is not set
> > -# BR2_PACKAGE_ATEST is not set
> > -# BR2_PACKAGE_AUMIX is not set
> > -# BR2_PACKAGE_BLUEZ_ALSA is not set
> > -# BR2_PACKAGE_DVBLAST is not set
> > -# BR2_PACKAGE_DVDAUTHOR is not set
> > -
> > -#
> > -# dvdrw-tools needs a toolchain w/ threads, C++, wchar
> > -#
> > -
> > -#
> > -# espeak needs a toolchain w/ C++, wchar, threads, dynamic library
> > -#
> > -# BR2_PACKAGE_FAAD2 is not set
> > -BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_FFMPEG is not set
> > -# BR2_PACKAGE_FLAC is not set
> > -# BR2_PACKAGE_FLITE is not set
> > -# BR2_PACKAGE_FLUID_SOUNDFONT is not set
> > -
> > -#
> > -# fluidsynth needs a toolchain w/ threads, wchar, dynamic library, C++
> > -#
> > -# BR2_PACKAGE_GMRENDER_RESURRECT is not set
> > -# BR2_PACKAGE_GSTREAMER1 is not set
> > -# BR2_PACKAGE_JACK1 is not set
> > -
> > -#
> > -# jack2 needs a toolchain w/ threads, C++, dynamic library
> > -#
> > -BR2_PACKAGE_KODI_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/
> C++, threads, wchar, dynamic library, gcc >=3D 9.x
> > -#
> > -
> > -#
> > -# kodi needs udev support for gbm
> > -#
> > -
> > -#
> > -# kodi needs an OpenGL EGL backend with OpenGL or GLES support
> > -#
> > -# BR2_PACKAGE_LAME is not set
> > -# BR2_PACKAGE_MADPLAY is not set
> > -# BR2_PACKAGE_MIMIC is not set
> > -# BR2_PACKAGE_MINIMODEM is not set
> > -
> > -#
> > -# miraclecast needs systemd and a glibc toolchain w/ threads and wchar
> > -#
> > -
> > -#
> > -# mjpegtools needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# modplugtools needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_MOTION is not set
> > -
> > -#
> > -# mpd needs a toolchain w/ C++, threads, wchar, gcc >=3D 8, host gcc >=
=3D 8
> > -#
> > -# BR2_PACKAGE_MPD_MPC is not set
> > -# BR2_PACKAGE_MPG123 is not set
> > -
> > -#
> > -# mpv needs a toolchain w/ C++, NPTL, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_MULTICAT is not set
> > -# BR2_PACKAGE_MUSEPACK is not set
> > -
> > -#
> > -# ncmpc needs a toolchain w/ C++, wchar, threads, gcc >=3D 10
> > -#
> > -
> > -#
> > -# omxplayer needs rpi-userland and a toolchain w/ C++, threads, wchar,
> dynamic library, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_OPUS_TOOLS is not set
> > -# BR2_PACKAGE_PIPEWIRE is not set
> > -BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=3Dy
> > -# BR2_PACKAGE_PULSEAUDIO is not set
> > -# BR2_PACKAGE_SOX is not set
> > -# BR2_PACKAGE_SPEECHD is not set
> > -# BR2_PACKAGE_SQUEEZELITE is not set
> > -# BR2_PACKAGE_TINYCOMPRESS is not set
> > -# BR2_PACKAGE_TSTOOLS is not set
> > -# BR2_PACKAGE_TWOLAME is not set
> > -# BR2_PACKAGE_UDPXY is not set
> > -
> > -#
> > -# upmpdcli needs a toolchain w/ C++, NPTL, gcc >=3D 4.9
> > -#
> > -
> > -#
> > -# v4l2grab needs a toolchain w/ threads, dynamic library, C++ and
> headers >=3D 3.0
> > -#
> > -# BR2_PACKAGE_V4L2LOOPBACK is not set
> > -
> > -#
> > -# vlc needs a toolchain w/ C++, dynamic library, wchar, threads, gcc >=
=3D
> 4.9, headers >=3D 3.7
> > -#
> > -# BR2_PACKAGE_VORBIS_TOOLS is not set
> > -# BR2_PACKAGE_WAVPACK is not set
> > -# BR2_PACKAGE_YAVTA is not set
> > -# BR2_PACKAGE_YMPD is not set
> > -
> > -#
> > -# zynaddsubfx needs a toolchain w/ C++11 and threads
> > -#
> > -
> > -#
> > -# Compressors and decompressors
> > -#
> > -# BR2_PACKAGE_BROTLI is not set
> > -# BR2_PACKAGE_BZIP2 is not set
> > -
> > -#
> > -# lrzip needs a toolchain w/ wchar, threads, C++
> > -#
> > -
> > -#
> > -# lzip needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_LZOP is not set
> > -
> > -#
> > -# p7zip needs a toolchain w/ threads, wchar, C++
> > -#
> > -# BR2_PACKAGE_PIGZ is not set
> > -# BR2_PACKAGE_PIXZ is not set
> > -
> > -#
> > -# unrar needs a toolchain w/ C++, wchar, threads, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_XZ is not set
> > -# BR2_PACKAGE_ZIP is not set
> > -# BR2_PACKAGE_ZSTD is not set
> > -
> > -#
> > -# Debugging, profiling and benchmark
> > -#
> > -# BR2_PACKAGE_BABELTRACE2 is not set
> > -# BR2_PACKAGE_BLKTRACE is not set
> > -
> > -#
> > -# bonnie++ needs a toolchain w/ C++
> > -#
> > -BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_BPFTOOL is not set
> > -# BR2_PACKAGE_CACHE_CALIBRATOR is not set
> > -
> > -#
> > -# clinfo needs an OpenCL provider
> > -#
> > -
> > -#
> > -# clpeak needs an OpenCL provider, a toolchain w/ C++, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_COREMARK is not set
> > -# BR2_PACKAGE_COREMARK_PRO is not set
> > -
> > -#
> > -# dacapo needs OpenJDK
> > -#
> > -# BR2_PACKAGE_DHRYSTONE is not set
> > -# BR2_PACKAGE_DIEHARDER is not set
> > -# BR2_PACKAGE_DMALLOC is not set
> > -# BR2_PACKAGE_DROPWATCH is not set
> > -# BR2_PACKAGE_DSTAT is not set
> > -# BR2_PACKAGE_DT is not set
> > -
> > -#
> > -# duma needs a toolchain w/ C++, threads, dynamic library
> > -#
> > -# BR2_PACKAGE_FIO is not set
> > -BR2_PACKAGE_FWTS_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_FWTS is not set
> > -BR2_PACKAGE_GDB_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# gdb/gdbserver >=3D 8.x needs a toolchain w/ C++, gcc >=3D 4.8
> > -#
> > -BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# google-breakpad requires a glibc or uClibc toolchain w/ wchar,
> thread, C++, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_HYPERFINE is not set
> > -# BR2_PACKAGE_IOZONE is not set
> > -BR2_PACKAGE_KEXEC_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_KEXEC is not set
> > -# BR2_PACKAGE_KMEMD is not set
> > -BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_KVM_UNIT_TESTS is not set
> > -# BR2_PACKAGE_LATENCYTOP is not set
> > -# BR2_PACKAGE_LIBBPF is not set
> > -# BR2_PACKAGE_LMBENCH is not set
> > -BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_LTP_TESTSUITE is not set
> > -BR2_PACKAGE_LTRACE_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_LTRACE is not set
> > -# BR2_PACKAGE_LTTNG_BABELTRACE is not set
> > -# BR2_PACKAGE_LTTNG_MODULES is not set
> > -
> > -#
> > -# lttng-tools needs a toolchain w/ threads, dynamic library, C++
> > -#
> > -# BR2_PACKAGE_MBPOLL is not set
> > -# BR2_PACKAGE_MBW is not set
> > -# BR2_PACKAGE_MEMSTAT is not set
> > -# BR2_PACKAGE_NETPERF is not set
> > -
> > -#
> > -# netsniff-ng needs a toolchain w/ NPTL, C++, headers >=3D 3.0
> > -#
> > -# BR2_PACKAGE_NMON is not set
> > -BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# oprofile needs a toolchain w/ C++, wchar
> > -#
> > -# BR2_PACKAGE_PAX_UTILS is not set
> > -BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_PERFTEST is not set
> > -
> > -#
> > -# piglit needs a glibc or musl toolchain w/ C++
> > -#
> > -BR2_PACKAGE_PLY_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_PLY is not set
> > -# BR2_PACKAGE_POKE is not set
> > -BR2_PACKAGE_PTM2HUMAN_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_PTM2HUMAN is not set
> > -# BR2_PACKAGE_PV is not set
> > -# BR2_PACKAGE_RAMSMP is not set
> > -# BR2_PACKAGE_RAMSPEED is not set
> > -# BR2_PACKAGE_RT_TESTS is not set
> > -
> > -#
> > -# rwmem needs a toolchain w/ C++, wchar, gcc >=3D 10
> > -#
> > -
> > -#
> > -# sentry-native needs a glibc toolchain with w/ wchar, thread, C++, gc=
c
> >=3D 4.8
> > -#
> > -
> > -#
> > -# signal-estimator needs a toochain w/ C++, threads, gcc >=3D 7
> > -#
> > -# BR2_PACKAGE_SPIDEV_TEST is not set
> > -# BR2_PACKAGE_STRACE is not set
> > -# BR2_PACKAGE_STRESS is not set
> > -# BR2_PACKAGE_STRESS_NG is not set
> > -
> > -#
> > -# sysdig needs a glibc toolchain w/ C++, threads, gcc >=3D 5, dynamic
> library, a Linux kernel, and luajit or lua 5.1 to be built
> > -#
> > -# BR2_PACKAGE_TCF_AGENT is not set
> > -BR2_PACKAGE_TCF_AGENT_ARCH=3D"arm"
> > -BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_TINYMEMBENCH is not set
> > -# BR2_PACKAGE_TRACE_CMD is not set
> > -BR2_PACKAGE_TRINITY_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_TRINITY is not set
> > -# BR2_PACKAGE_UCLIBC_NG_TEST is not set
> > -BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_UFTRACE is not set
> > -BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_VALGRIND is not set
> > -# BR2_PACKAGE_VMTOUCH is not set
> > -# BR2_PACKAGE_WHETSTONE is not set
> > -
> > -#
> > -# Development tools
> > -#
> > -# BR2_PACKAGE_AVOCADO is not set
> > -# BR2_PACKAGE_BINUTILS is not set
> > -# BR2_PACKAGE_BITWISE is not set
> > -# BR2_PACKAGE_BSDIFF is not set
> > -# BR2_PACKAGE_CHECK is not set
> > -BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >=3D 4.9=
,
> NPTL
> > -#
> > -
> > -#
> > -# cppunit needs a toolchain w/ C++, dynamic library
> > -#
> > -# BR2_PACKAGE_CUKINIA is not set
> > -# BR2_PACKAGE_CUNIT is not set
> > -# BR2_PACKAGE_CVS is not set
> > -
> > -#
> > -# cxxtest needs a toolchain w/ C++ support
> > -#
> > -# BR2_PACKAGE_FLEX is not set
> > -# BR2_PACKAGE_GETTEXT is not set
> > -BR2_PACKAGE_PROVIDES_HOST_GETTEXT=3D"host-gettext-tiny"
> > -# BR2_PACKAGE_GIT is not set
> > -
> > -#
> > -# git-crypt needs a toolchain w/ C++, gcc >=3D 4.9
> > -#
> > -
> > -#
> > -# gperf needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_JO is not set
> > -# BR2_PACKAGE_JQ is not set
> > -# BR2_PACKAGE_LIBTOOL is not set
> > -# BR2_PACKAGE_MAKE is not set
> > -# BR2_PACKAGE_MAWK is not set
> > -# BR2_PACKAGE_PKGCONF is not set
> > -# BR2_PACKAGE_RIPGREP is not set
> > -# BR2_PACKAGE_SUBVERSION is not set
> > -# BR2_PACKAGE_TREE is not set
> > -# BR2_PACKAGE_UNIFDEF is not set
> > -
> > -#
> > -# Filesystem and flash utilities
> > -#
> > -# BR2_PACKAGE_ABOOTIMG is not set
> > -# BR2_PACKAGE_AUFS_UTIL is not set
> > -# BR2_PACKAGE_AUTOFS is not set
> > -# BR2_PACKAGE_BTRFS_PROGS is not set
> > -# BR2_PACKAGE_CIFS_UTILS is not set
> > -# BR2_PACKAGE_CPIO is not set
> > -# BR2_PACKAGE_CRAMFS is not set
> > -# BR2_PACKAGE_CURLFTPFS is not set
> > -# BR2_PACKAGE_DAVFS2 is not set
> > -# BR2_PACKAGE_DOSFSTOOLS is not set
> > -# BR2_PACKAGE_DUST is not set
> > -# BR2_PACKAGE_E2FSPROGS is not set
> > -# BR2_PACKAGE_E2TOOLS is not set
> > -# BR2_PACKAGE_ECRYPTFS_UTILS is not set
> > -# BR2_PACKAGE_EROFS_UTILS is not set
> > -# BR2_PACKAGE_EXFAT is not set
> > -# BR2_PACKAGE_EXFAT_UTILS is not set
> > -# BR2_PACKAGE_EXFATPROGS is not set
> > -# BR2_PACKAGE_F2FS_TOOLS is not set
> > -# BR2_PACKAGE_FIRMWARE_UTILS is not set
> > -# BR2_PACKAGE_FLASHBENCH is not set
> > -# BR2_PACKAGE_FSCRYPTCTL is not set
> > -# BR2_PACKAGE_FUSE_OVERLAYFS is not set
> > -# BR2_PACKAGE_FWUP is not set
> > -# BR2_PACKAGE_GENEXT2FS is not set
> > -# BR2_PACKAGE_GENPART is not set
> > -# BR2_PACKAGE_GENROMFS is not set
> > -# BR2_PACKAGE_GOCRYPTFS is not set
> > -# BR2_PACKAGE_IMX_USB_LOADER is not set
> > -# BR2_PACKAGE_MMC_UTILS is not set
> > -# BR2_PACKAGE_MTD is not set
> > -# BR2_PACKAGE_MTOOLS is not set
> > -# BR2_PACKAGE_NFS_UTILS is not set
> > -# BR2_PACKAGE_NILFS_UTILS is not set
> > -# BR2_PACKAGE_NTFS_3G is not set
> > -# BR2_PACKAGE_SP_OOPS_EXTRACT is not set
> > -# BR2_PACKAGE_SQUASHFS is not set
> > -# BR2_PACKAGE_SSHFS is not set
> > -# BR2_PACKAGE_SUNXI_TOOLS is not set
> > -# BR2_PACKAGE_UDFTOOLS is not set
> > -# BR2_PACKAGE_UNIONFS is not set
> > -
> > -#
> > -# xfsprogs needs a toolchain w/ threads, C++
> > -#
> > -# BR2_PACKAGE_ZEROFREE is not set
> > -
> > -#
> > -# zfs needs udev /dev management
> > -#
> > -
> > -#
> > -# Fonts, cursors, icons, sounds and themes
> > -#
> > -
> > -#
> > -# Cursors
> > -#
> > -# BR2_PACKAGE_COMIX_CURSORS is not set
> > -# BR2_PACKAGE_OBSIDIAN_CURSORS is not set
> > -
> > -#
> > -# Fonts
> > -#
> > -# BR2_PACKAGE_BITSTREAM_VERA is not set
> > -# BR2_PACKAGE_CANTARELL is not set
> > -# BR2_PACKAGE_DEJAVU is not set
> > -# BR2_PACKAGE_FONT_AWESOME is not set
> > -# BR2_PACKAGE_GHOSTSCRIPT_FONTS is not set
> > -# BR2_PACKAGE_INCONSOLATA is not set
> > -# BR2_PACKAGE_LIBERATION is not set
> > -# BR2_PACKAGE_WQY_ZENHEI is not set
> > -
> > -#
> > -# Icons
> > -#
> > -# BR2_PACKAGE_HICOLOR_ICON_THEME is not set
> > -
> > -#
> > -# Sounds
> > -#
> > -# BR2_PACKAGE_SOUND_THEME_BOREALIS is not set
> > -# BR2_PACKAGE_SOUND_THEME_FREEDESKTOP is not set
> > -
> > -#
> > -# Themes
> > -#
> > -
> > -#
> > -# Games
> > -#
> > -# BR2_PACKAGE_ASCII_INVADERS is not set
> > -# BR2_PACKAGE_CHOCOLATE_DOOM is not set
> > -
> > -#
> > -# flare-engine needs a toolchain w/ C++, dynamic library
> > -#
> > -# BR2_PACKAGE_FROTZ is not set
> > -
> > -#
> > -# gnuchess needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_LBREAKOUT2 is not set
> > -# BR2_PACKAGE_LTRIS is not set
> > -
> > -#
> > -# minetest needs a toolchain w/ C++, gcc >=3D 5.1, threads
> > -#
> > -# BR2_PACKAGE_OPENTYRIAN is not set
> > -# BR2_PACKAGE_PRBOOM is not set
> > -# BR2_PACKAGE_SL is not set
> > -
> > -#
> > -# solarus needs OpenGL and a toolchain w/ C++, gcc >=3D 4.9, NPTL,
> dynamic library, and luajit or lua 5.1
> > -#
> > -
> > -#
> > -# stella needs a toolchain w/ dynamic library, C++, threads, gcc >=3D =
7
> > -#
> > -# BR2_PACKAGE_XORCURSES is not set
> > -
> > -#
> > -# Graphic libraries and applications (graphic/text)
> > -#
> > -
> > -#
> > -# Graphic applications
> > -#
> > -
> > -#
> > -# cage needs udev, EGL w/ Wayland backend and OpenGL ES support
> > -#
> > -
> > -#
> > -# cog needs wpewebkit and a toolchain w/ threads
> > -#
> > -# BR2_PACKAGE_FSWEBCAM is not set
> > -# BR2_PACKAGE_GHOSTSCRIPT is not set
> > -
> > -#
> > -# glmark2 needs a toolchain w/ C++, gcc >=3D 4.9
> > -#
> > -
> > -#
> > -# glslsandbox-player needs openGL ES and EGL driver
> > -#
> > -# BR2_PACKAGE_GNUPLOT is not set
> > -# BR2_PACKAGE_JHEAD is not set
> > -
> > -#
> > -# kmscube needs EGL, GBM and OpenGL ES, and a toolchain w/ thread
> support
> > -#
> > -
> > -#
> > -# libva-utils needs a toolchain w/ C++, threads, dynamic library
> > -#
> > -BR2_PACKAGE_MIDORI_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# midori needs a glibc toolchain w/ C++, wchar, threads, dynamic
> library, gcc >=3D 7, host gcc >=3D 8
> > -#
> > -
> > -#
> > -# midori needs libgtk3 w/ X11 or wayland backend
> > -#
> > -BR2_PACKAGE_NETSURF_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_NETSURF is not set
> > -# BR2_PACKAGE_PNGQUANT is not set
> > -# BR2_PACKAGE_RRDTOOL is not set
> > -
> > -#
> > -# spirv-tools needs a toolchain w/ C++, gcc >=3D 7
> > -#
> > -
> > -#
> > -# stellarium needs Qt5 and an OpenGL provider
> > -#
> > -
> > -#
> > -# sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES suppo=
rt
> > -#
> > -
> > -#
> > -# sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc
> >=3D 4.9
> > -#
> > -# BR2_PACKAGE_SWAYBG is not set
> > -
> > -#
> > -# tesseract-ocr needs a toolchain w/ threads, C++, gcc >=3D 7, dynamic
> library, wchar
> > -#
> > -# BR2_PACKAGE_TINIFIER is not set
> > -
> > -#
> > -# Graphic libraries
> > -#
> > -
> > -#
> > -# cegui needs a toolchain w/ C++, threads, dynamic library, wchar, gcc
> >=3D 5
> > -#
> > -
> > -#
> > -# directfb needs a glibc or uClibc toolchain w/ C++, NPTL, gcc >=3D 4.=
5,
> dynamic library
> > -#
> > -
> > -#
> > -# efl needs a toolchain w/ C++, dynamic library, gcc >=3D 4.9, host gc=
c
> >=3D 4.9, threads, wchar
> > -#
> > -# BR2_PACKAGE_FB_TEST_APP is not set
> > -# BR2_PACKAGE_FBDUMP is not set
> > -# BR2_PACKAGE_FBGRAB is not set
> > -
> > -#
> > -# fbterm needs a toolchain w/ C++, wchar, locale
> > -#
> > -# BR2_PACKAGE_FBV is not set
> > -
> > -#
> > -# flutter-gallery needs flutter-engine
> > -#
> > -
> > -#
> > -# flutter-pi needs flutter-engine
> > -#
> > -
> > -#
> > -# flutter-pi needs GBM, systemd, and udev
> > -#
> > -
> > -#
> > -# freerdp needs a toolchain w/ wchar, dynamic library, threads, C++
> > -#
> > -# BR2_PACKAGE_GRAPHICSMAGICK is not set
> > -# BR2_PACKAGE_IMAGEMAGICK is not set
> > -# BR2_PACKAGE_LIBGLVND is not set
> > -# BR2_PACKAGE_LINUX_FUSION is not set
> > -
> > -#
> > -# mesa3d needs a toolchain w/ gcc >=3D8, C++, NPTL, dynamic library
> > -#
> > -
> > -#
> > -# ocrad needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# ogre needs a toolchain w/ C++, dynamic library, gcc >=3D 4.8, thread=
s,
> wchar
> > -#
> > -# BR2_PACKAGE_PSPLASH is not set
> > -# BR2_PACKAGE_SDL is not set
> > -# BR2_PACKAGE_SDL2 is not set
> > -
> > -#
> > -# spirv-headers needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_VULKAN_HEADERS is not set
> > -
> > -#
> > -# vulkan-loader needs a toolchain w/ C++, dynamic library, threads
> > -#
> > -
> > -#
> > -# vulkan-tools needs a toolchain w/ C++, dynamic library, threads, gcc
> >=3D 4.9
> > -#
> > -
> > -#
> > -# Other GUIs
> > -#
> > -BR2_PACKAGE_QT5_JSCORE_AVAILABLE=3Dy
> > -
> > -#
> > -# Qt5 needs host g++ >=3D 5.0, and a toolchain w/ gcc >=3D 5.0, wchar,
> NPTL, C++, dynamic library
> > -#
> > -BR2_PACKAGE_QT6_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# qt6 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >=
=3D
> 8, host gcc >=3D 8
> > -#
> > -
> > -#
> > -# tekui needs a Lua interpreter and a toolchain w/ threads, dynamic
> library
> > -#
> > -
> > -#
> > -# weston needs udev and a toolchain w/ locale, threads, dynamic
> library, headers >=3D 3.0
> > -#
> > -# BR2_PACKAGE_XORG7 is not set
> > -
> > -#
> > -# apitrace needs a toolchain w/ C++, wchar, dynamic library, threads,
> gcc >=3D 7
> > -#
> > -
> > -#
> > -# mupdf needs a toolchain w/ C++, gcc >=3D 4.9
> > -#
> > -
> > -#
> > -# vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >=
=3D
> 10
> > -#
> > -
> > -#
> > -# vte needs an OpenGL or an OpenGL-EGL/wayland backend
> > -#
> > -# BR2_PACKAGE_XKEYBOARD_CONFIG is not set
> > -
> > -#
> > -# Hardware handling
> > -#
> > -
> > -#
> > -# Firmware
> > -#
> > -# BR2_PACKAGE_AM33X_CM3 is not set
> > -# BR2_PACKAGE_ARMBIAN_FIRMWARE is not set
> > -# BR2_PACKAGE_B43_FIRMWARE is not set
> > -# BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI is not set
> > -# BR2_PACKAGE_LINUX_FIRMWARE is not set
> > -# BR2_PACKAGE_MURATA_CYW_FW is not set
> > -# BR2_PACKAGE_ODROIDC2_FIRMWARE is not set
> > -# BR2_PACKAGE_QCOM_DB410C_FIRMWARE is not set
> > -# BR2_PACKAGE_QORIQ_FM_UCODE is not set
> > -# BR2_PACKAGE_RCW_SMARC_SAL28 is not set
> > -# BR2_PACKAGE_RPI_FIRMWARE is not set
> > -# BR2_PACKAGE_SUNXI_BOARDS is not set
> > -# BR2_PACKAGE_TS4900_FPGA is not set
> > -# BR2_PACKAGE_UX500_FIRMWARE is not set
> > -# BR2_PACKAGE_WILC1000_FIRMWARE is not set
> > -# BR2_PACKAGE_WILC3000_FIRMWARE is not set
> > -# BR2_PACKAGE_WILINK_BT_FIRMWARE is not set
> > -# BR2_PACKAGE_ZD1211_FIRMWARE is not set
> > -# BR2_PACKAGE_18XX_TI_UTILS is not set
> > -# BR2_PACKAGE_A10DISP is not set
> > -# BR2_PACKAGE_ACPICA is not set
> > -# BR2_PACKAGE_ACPID is not set
> > -
> > -#
> > -# acpitool needs a toolchain w/ threads, C++, dynamic library
> > -#
> > -# BR2_PACKAGE_AER_INJECT is not set
> > -# BR2_PACKAGE_ALTERA_STAPL is not set
> > -# BR2_PACKAGE_AM335X_PRU_PACKAGE is not set
> > -
> > -#
> > -# apcupsd needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_AVRDUDE is not set
> > -
> > -#
> > -# bcache-tools needs udev /dev management
> > -#
> > -
> > -#
> > -# brickd needs udev /dev management, a toolchain w/ threads, wchar
> > -#
> > -# BR2_PACKAGE_BRLTTY is not set
> > -# BR2_PACKAGE_CBOOTIMAGE is not set
> > -
> > -#
> > -# cc-tool needs a toolchain w/ C++, threads, wchar, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_CDRKIT is not set
> > -BR2_PACKAGE_CPUBURN_ARM_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_CPUBURN_ARM is not set
> > -# BR2_PACKAGE_CRUCIBLE is not set
> > -# BR2_PACKAGE_CRYPTSETUP is not set
> > -# BR2_PACKAGE_CWIID is not set
> > -# BR2_PACKAGE_DAHDI_LINUX is not set
> > -# BR2_PACKAGE_DAHDI_TOOLS is not set
> > -# BR2_PACKAGE_DAVINCI_BOOTCOUNT is not set
> > -# BR2_PACKAGE_DBUS is not set
> > -
> > -#
> > -# dbusbroker needs systemd and a toolchain w/ threads
> > -#
> > -
> > -#
> > -# dbus-cxx needs a toolchain w/ C++, threads, gcc >=3D 7 and dynamic
> library support
> > -#
> > -# BR2_PACKAGE_DFU_PROGRAMMER is not set
> > -# BR2_PACKAGE_DFU_UTIL is not set
> > -# BR2_PACKAGE_DMRAID is not set
> > -
> > -#
> > -# dt-utils needs udev /dev management
> > -#
> > -# BR2_PACKAGE_DTBOCFG is not set
> > -# BR2_PACKAGE_DTV_SCAN_TABLES is not set
> > -# BR2_PACKAGE_DUMP1090 is not set
> > -# BR2_PACKAGE_DVB_APPS is not set
> > -# BR2_PACKAGE_DVBSNOOP is not set
> > -
> > -#
> > -# edid-decode needs a toolchain w/ C++, gcc >=3D 4.7
> > -#
> > -# BR2_PACKAGE_ESP_HOSTED is not set
> > -
> > -#
> > -# eudev needs eudev /dev management
> > -#
> > -# BR2_PACKAGE_EVEMU is not set
> > -# BR2_PACKAGE_EVTEST is not set
> > -# BR2_PACKAGE_FAN_CTRL is not set
> > -# BR2_PACKAGE_FCONFIG is not set
> > -BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_FLASHROM is not set
> > -# BR2_PACKAGE_FMTOOLS is not set
> > -# BR2_PACKAGE_FREEIPMI is not set
> > -# BR2_PACKAGE_FREESCALE_IMX is not set
> > -# BR2_PACKAGE_FXLOAD is not set
> > -# BR2_PACKAGE_GCNANO_BINARIES is not set
> > -# BR2_PACKAGE_GPM is not set
> > -# BR2_PACKAGE_GPSD is not set
> > -
> > -#
> > -# gptfdisk needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_GVFS is not set
> > -# BR2_PACKAGE_HDDTEMP is not set
> > -# BR2_PACKAGE_HWDATA is not set
> > -# BR2_PACKAGE_HWLOC is not set
> > -# BR2_PACKAGE_INPUT_EVENT_DAEMON is not set
> > -# BR2_PACKAGE_IPMITOOL is not set
> > -# BR2_PACKAGE_IRDA_UTILS is not set
> > -# BR2_PACKAGE_KBD is not set
> > -# BR2_PACKAGE_LCDPROC is not set
> > -
> > -#
> > -# ledmon needs udev and a toolchain w/ threads
> > -#
> > -
> > -#
> > -# libiec61850 needs a toolchain w/ C++, threads, dynamic library
> > -#
> > -# BR2_PACKAGE_LIBMANETTE is not set
> > -# BR2_PACKAGE_LIBUBOOTENV is not set
> > -# BR2_PACKAGE_LIBUIO is not set
> > -# BR2_PACKAGE_LINUX_BACKPORTS is not set
> > -# BR2_PACKAGE_LINUX_SERIAL_TEST is not set
> > -# BR2_PACKAGE_LINUXCONSOLETOOLS is not set
> > -
> > -#
> > -# lirc-tools needs a toolchain w/ threads, dynamic library, C++
> > -#
> > -# BR2_PACKAGE_LM_SENSORS is not set
> > -
> > -#
> > -# lshw needs a toolchain w/ C++, wchar
> > -#
> > -# BR2_PACKAGE_LSSCSI is not set
> > -# BR2_PACKAGE_LSUIO is not set
> > -# BR2_PACKAGE_LUKSMETA is not set
> > -# BR2_PACKAGE_LVM2 is not set
> > -# BR2_PACKAGE_MALI_DRIVER is not set
> > -# BR2_PACKAGE_MALI_T76X is not set
> > -# BR2_PACKAGE_MBPFAN is not set
> > -# BR2_PACKAGE_MDADM is not set
> > -# BR2_PACKAGE_MDEVD is not set
> > -# BR2_PACKAGE_MDIO_TOOLS is not set
> > -# BR2_PACKAGE_MEMTESTER is not set
> > -# BR2_PACKAGE_MEMTOOL is not set
> > -# BR2_PACKAGE_MHZ is not set
> > -# BR2_PACKAGE_MINICOM is not set
> > -# BR2_PACKAGE_NANOCOM is not set
> > -# BR2_PACKAGE_NEARD is not set
> > -# BR2_PACKAGE_NVIDIA_MODPROBE is not set
> > -# BR2_PACKAGE_NVIDIA_PERSISTENCED is not set
> > -# BR2_PACKAGE_NVME is not set
> > -# BR2_PACKAGE_OFONO is not set
> > -
> > -#
> > -# ola needs a toolchain w/ C++, threads, dynamic library, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_OPEN2300 is not set
> > -
> > -#
> > -# openfpgaloader needs a toolchain w/ threads, C++, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_OPENIPMI is not set
> > -# BR2_PACKAGE_OPENOCD is not set
> > -
> > -#
> > -# owl-linux is only supported on ARM9 architecture
> > -#
> > -# BR2_PACKAGE_PARTED is not set
> > -# BR2_PACKAGE_PCIUTILS is not set
> > -# BR2_PACKAGE_PDBG is not set
> > -# BR2_PACKAGE_PICOCOM is not set
> > -# BR2_PACKAGE_PIFMRDS is not set
> > -# BR2_PACKAGE_PIGPIO is not set
> > -
> > -#
> > -# powertop needs a toolchain w/ C++, threads, wchar
> > -#
> > -# BR2_PACKAGE_PPS_TOOLS is not set
> > -# BR2_PACKAGE_PRU_SOFTWARE_SUPPORT is not set
> > -# BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE is not set
> > -# BR2_PACKAGE_RASPI_GPIO is not set
> > -# BR2_PACKAGE_RDMA_CORE is not set
> > -# BR2_PACKAGE_READ_EDID is not set
> > -# BR2_PACKAGE_RNG_TOOLS is not set
> > -
> > -#
> > -# rockchip-mali needs a glibc toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_ROCKCHIP_RKBIN is not set
> > -
> > -#
> > -# rpi-userland needs a toolchain w/ C++, threads, dynamic library
> > -#
> > -# BR2_PACKAGE_RS485CONF is not set
> > -# BR2_PACKAGE_RTC_TOOLS is not set
> > -# BR2_PACKAGE_RTL8188EU is not set
> > -# BR2_PACKAGE_RTL8189ES is not set
> > -# BR2_PACKAGE_RTL8189FS is not set
> > -# BR2_PACKAGE_RTL8192EU is not set
> > -# BR2_PACKAGE_RTL8723BU is not set
> > -# BR2_PACKAGE_RTL8723DS is not set
> > -# BR2_PACKAGE_RTL8723DS_BT is not set
> > -# BR2_PACKAGE_RTL8812AU_AIRCRACK_NG is not set
> > -# BR2_PACKAGE_RTL8821AU is not set
> > -# BR2_PACKAGE_RTL8821CU is not set
> > -# BR2_PACKAGE_RTL8822CS is not set
> > -# BR2_PACKAGE_SANE_BACKENDS is not set
> > -# BR2_PACKAGE_SDPARM is not set
> > -BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# sedutil needs a toolchain w/ C++, gcc >=3D 4.8, headers >=3D 3.12
> > -#
> > -# BR2_PACKAGE_SETSERIAL is not set
> > -# BR2_PACKAGE_SG3_UTILS is not set
> > -# BR2_PACKAGE_SIGROK_CLI is not set
> > -# BR2_PACKAGE_SISPMCTL is not set
> > -
> > -#
> > -# smartmontools needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_SMSTOOLS3 is not set
> > -# BR2_PACKAGE_SPI_TOOLS is not set
> > -# BR2_PACKAGE_SREDIRD is not set
> > -# BR2_PACKAGE_STATSERIAL is not set
> > -# BR2_PACKAGE_STM32FLASH is not set
> > -# BR2_PACKAGE_SUNXI_CEDARX is not set
> > -# BR2_PACKAGE_SUNXI_MALI_UTGARD is not set
> > -# BR2_PACKAGE_SYSSTAT is not set
> > -
> > -#
> > -# targetcli-fb depends on Python
> > -#
> > -# BR2_PACKAGE_TI_GFX is not set
> > -# BR2_PACKAGE_TI_SGX_KM is not set
> > -
> > -#
> > -# ti-sgx-um needs udev and a glibc toolchain w/ threads
> > -#
> > -# BR2_PACKAGE_TI_UIM is not set
> > -# BR2_PACKAGE_TI_UTILS is not set
> > -# BR2_PACKAGE_TIO is not set
> > -# BR2_PACKAGE_TRIGGERHAPPY is not set
> > -# BR2_PACKAGE_UBOOT_TOOLS is not set
> > -# BR2_PACKAGE_UBUS is not set
> > -
> > -#
> > -# udisks needs udev /dev management
> > -#
> > -# BR2_PACKAGE_UHUBCTL is not set
> > -# BR2_PACKAGE_UMTPRD is not set
> > -
> > -#
> > -# upower needs udev /dev management
> > -#
> > -# BR2_PACKAGE_USB_MODESWITCH is not set
> > -# BR2_PACKAGE_USB_MODESWITCH_DATA is not set
> > -
> > -#
> > -# usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >=
=3D 8
> > -#
> > -
> > -#
> > -# usbmount requires udev to be enabled
> > -#
> > -
> > -#
> > -# usbutils needs udev /dev management and toolchain w/ threads, gcc >=
=3D
> 4.9
> > -#
> > -# BR2_PACKAGE_W_SCAN is not set
> > -# BR2_PACKAGE_WF111 is not set
> > -# BR2_PACKAGE_WILC_DRIVER is not set
> > -# BR2_PACKAGE_WIPE is not set
> > -# BR2_PACKAGE_XORRISO is not set
> > -# BR2_PACKAGE_XR819_XRADIO is not set
> > -
> > -#
> > -# Interpreter languages and scripting
> > -#
> > -# BR2_PACKAGE_4TH is not set
> > -# BR2_PACKAGE_ENSCRIPT is not set
> > -BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_ERLANG_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_ERLANG is not set
> > -# BR2_PACKAGE_EXECLINE is not set
> > -# BR2_PACKAGE_FICL is not set
> > -BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_GAUCHE is not set
> > -# BR2_PACKAGE_GUILE is not set
> > -# BR2_PACKAGE_HASERL is not set
> > -# BR2_PACKAGE_JANET is not set
> > -# BR2_PACKAGE_JIMTCL is not set
> > -# BR2_PACKAGE_LUA is not set
> > -BR2_PACKAGE_PROVIDES_HOST_LUAINTERPRETER=3D"host-lua"
> > -BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_LUAJIT is not set
> > -# BR2_PACKAGE_MICROPYTHON is not set
> > -# BR2_PACKAGE_MOARVM is not set
> > -BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_MONO_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# mono needs a toolchain w/ C++, NPTL, dynamic library
> > -#
> > -BR2_PACKAGE_NODEJS_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >=3D 10,
> wchar, host gcc >=3D 10
> > -#
> > -
> > -#
> > -# octave needs a toolchain w/ C++ and fortran, gcc >=3D 4.8
> > -#
> > -BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# openjdk needs X.Org
> > -#
> > -
> > -#
> > -# openjdk needs glibc, and a toolchain w/ wchar, dynamic library,
> threads, C++, gcc >=3D 4.9, host gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_PERL is not set
> > -BR2_PACKAGE_PHP_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_PHP is not set
> > -# BR2_PACKAGE_PYTHON3 is not set
> > -# BR2_PACKAGE_QUICKJS is not set
> > -# BR2_PACKAGE_RUBY is not set
> > -# BR2_PACKAGE_TCL is not set
> > -
> > -#
> > -# Libraries
> > -#
> > -
> > -#
> > -# Audio/Sound
> > -#
> > -# BR2_PACKAGE_ALSA_LIB is not set
> > -
> > -#
> > -# alure needs a toolchain w/ C++, gcc >=3D 4.9, NPTL, wchar
> > -#
> > -# BR2_PACKAGE_AUBIO is not set
> > -# BR2_PACKAGE_BCG729 is not set
> > -
> > -#
> > -# caps needs a toolchain w/ C++, dynamic library
> > -#
> > -BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# fdk-aac needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_LIBAO is not set
> > -# BR2_PACKAGE_LIBBROADVOICE is not set
> > -# BR2_PACKAGE_LIBCANBERRA is not set
> > -# BR2_PACKAGE_LIBCDAUDIO is not set
> > -# BR2_PACKAGE_LIBCDDB is not set
> > -# BR2_PACKAGE_LIBCDIO is not set
> > -# BR2_PACKAGE_LIBCDIO_PARANOIA is not set
> > -# BR2_PACKAGE_LIBCODEC2 is not set
> > -# BR2_PACKAGE_LIBCUE is not set
> > -# BR2_PACKAGE_LIBCUEFILE is not set
> > -# BR2_PACKAGE_LIBEBUR128 is not set
> > -# BR2_PACKAGE_LIBG7221 is not set
> > -# BR2_PACKAGE_LIBGSM is not set
> > -# BR2_PACKAGE_LIBID3TAG is not set
> > -# BR2_PACKAGE_LIBILBC is not set
> > -# BR2_PACKAGE_LIBLO is not set
> > -# BR2_PACKAGE_LIBMAD is not set
> > -
> > -#
> > -# libmodplug needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_LIBMPD is not set
> > -# BR2_PACKAGE_LIBMPDCLIENT is not set
> > -# BR2_PACKAGE_LIBREPLAYGAIN is not set
> > -# BR2_PACKAGE_LIBSAMPLERATE is not set
> > -
> > -#
> > -# libsidplay2 needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_LIBSILK is not set
> > -# BR2_PACKAGE_LIBSNDFILE is not set
> > -
> > -#
> > -# libsoundtouch needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_LIBSOXR is not set
> > -# BR2_PACKAGE_LIBVORBIS is not set
> > -# BR2_PACKAGE_LILV is not set
> > -# BR2_PACKAGE_LV2 is not set
> > -
> > -#
> > -# mp4v2 needs a toolchain w/ C++
> > -#
> > -BR2_PACKAGE_OPENAL_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# openal needs a toolchain w/ NPTL, C++, gcc >=3D 4.9
> > -#
> > -
> > -#
> > -# opencore-amr needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_OPUS is not set
> > -# BR2_PACKAGE_OPUSFILE is not set
> > -# BR2_PACKAGE_PORTAUDIO is not set
> > -# BR2_PACKAGE_SBC is not set
> > -# BR2_PACKAGE_SPANDSP is not set
> > -# BR2_PACKAGE_SPEEX is not set
> > -# BR2_PACKAGE_SPEEXDSP is not set
> > -# BR2_PACKAGE_SRATOM is not set
> > -
> > -#
> > -# taglib needs a toolchain w/ C++, wchar
> > -#
> > -# BR2_PACKAGE_TINYALSA is not set
> > -# BR2_PACKAGE_TREMOR is not set
> > -# BR2_PACKAGE_VO_AACENC is not set
> > -BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# webrtc-audio-processing needs a toolchain w/ C++, NPTL, gcc >=3D 4.8
> > -#
> > -
> > -#
> > -# Compression and decompression
> > -#
> > -# BR2_PACKAGE_LIBARCHIVE is not set
> > -# BR2_PACKAGE_LIBDEFLATE is not set
> > -# BR2_PACKAGE_LIBMSPACK is not set
> > -
> > -#
> > -# libsquish needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_LIBZIP is not set
> > -# BR2_PACKAGE_LZ4 is not set
> > -# BR2_PACKAGE_LZO is not set
> > -# BR2_PACKAGE_MINIZIP is not set
> > -# BR2_PACKAGE_MINIZIP_ZLIB is not set
> > -
> > -#
> > -# snappy needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_SZIP is not set
> > -# BR2_PACKAGE_ZCHUNK is not set
> > -BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_ZLIB is not set
> > -BR2_PACKAGE_PROVIDES_HOST_ZLIB=3D"host-libzlib"
> > -# BR2_PACKAGE_ZZIPLIB is not set
> > -
> > -#
> > -# Crypto
> > -#
> > -# BR2_PACKAGE_BEARSSL is not set
> > -# BR2_PACKAGE_BEECRYPT is not set
> > -BR2_PACKAGE_BOTAN_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# botan needs a toolchain w/ C++, threads, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_CA_CERTIFICATES is not set
> > -# BR2_PACKAGE_CRYPTODEV_LINUX is not set
> > -
> > -#
> > -# cryptopp needs a toolchain w/ C++, dynamic library, wchar
> > -#
> > -# BR2_PACKAGE_GCR is not set
> > -# BR2_PACKAGE_GNUTLS is not set
> > -# BR2_PACKAGE_LIBARGON2 is not set
> > -# BR2_PACKAGE_LIBASSUAN is not set
> > -# BR2_PACKAGE_LIBB2 is not set
> > -# BR2_PACKAGE_LIBGCRYPT is not set
> > -BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_LIBGPG_ERROR is not set
> > -BR2_PACKAGE_LIBGPG_ERROR_SYSCFG=3D"arm-unknown-linux-gnueabi"
> > -# BR2_PACKAGE_LIBGPGME is not set
> > -# BR2_PACKAGE_LIBKCAPI is not set
> > -# BR2_PACKAGE_LIBKSBA is not set
> > -# BR2_PACKAGE_LIBMD is not set
> > -# BR2_PACKAGE_LIBMHASH is not set
> > -# BR2_PACKAGE_LIBNSS is not set
> > -
> > -#
> > -# libolm needs a toolchain w/ C++, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_LIBP11 is not set
> > -# BR2_PACKAGE_LIBSCRYPT is not set
> > -# BR2_PACKAGE_LIBSECRET is not set
> > -# BR2_PACKAGE_LIBSHA1 is not set
> > -# BR2_PACKAGE_LIBSODIUM is not set
> > -# BR2_PACKAGE_LIBSSH is not set
> > -# BR2_PACKAGE_LIBSSH2 is not set
> > -# BR2_PACKAGE_LIBTOMCRYPT is not set
> > -# BR2_PACKAGE_LIBUECC is not set
> > -# BR2_PACKAGE_LIBXCRYPT is not set
> > -# BR2_PACKAGE_MBEDTLS is not set
> > -# BR2_PACKAGE_NETTLE is not set
> > -# BR2_PACKAGE_OPENSSL is not set
> > -BR2_PACKAGE_PROVIDES_HOST_OPENSSL=3D"host-libopenssl"
> > -# BR2_PACKAGE_PKCS11_HELPER is not set
> > -# BR2_PACKAGE_RHASH is not set
> > -# BR2_PACKAGE_TINYDTLS is not set
> > -# BR2_PACKAGE_TPM2_PKCS11 is not set
> > -# BR2_PACKAGE_TPM2_TSS is not set
> > -# BR2_PACKAGE_TROUSERS is not set
> > -# BR2_PACKAGE_USTREAM_SSL is not set
> > -BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS=3Dy
> > -# BR2_PACKAGE_WOLFSSL is not set
> > -# BR2_PACKAGE_WOLFTPM is not set
> > -
> > -#
> > -# Database
> > -#
> > -# BR2_PACKAGE_BERKELEYDB is not set
> > -# BR2_PACKAGE_GDBM is not set
> > -# BR2_PACKAGE_HIREDIS is not set
> > -
> > -#
> > -# kompexsqlite needs a toolchain w/ C++, wchar, threads, dynamic libra=
ry
> > -#
> > -
> > -#
> > -# leveldb needs a toolchain w/ C++, threads, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_LIBDBI is not set
> > -# BR2_PACKAGE_LIBDBI_DRIVERS is not set
> > -# BR2_PACKAGE_LIBGIT2 is not set
> > -# BR2_PACKAGE_LIBMDBX is not set
> > -
> > -#
> > -# libodb needs a toolchain w/ C++, threads
> > -#
> > -BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc >=3D 7
> > -#
> > -
> > -#
> > -# mysql needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_POSTGRESQL is not set
> > -# BR2_PACKAGE_REDIS is not set
> > -
> > -#
> > -# redis-plus-plus needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_SQLCIPHER is not set
> > -# BR2_PACKAGE_SQLITE is not set
> > -# BR2_PACKAGE_UNIXODBC is not set
> > -
> > -#
> > -# Filesystem
> > -#
> > -# BR2_PACKAGE_GAMIN is not set
> > -# BR2_PACKAGE_LIBCONFIG is not set
> > -# BR2_PACKAGE_LIBCONFUSE is not set
> > -# BR2_PACKAGE_LIBFUSE is not set
> > -# BR2_PACKAGE_LIBFUSE3 is not set
> > -# BR2_PACKAGE_LIBLOCKFILE is not set
> > -# BR2_PACKAGE_LIBNFS is not set
> > -# BR2_PACKAGE_LIBSYSFS is not set
> > -# BR2_PACKAGE_LOCKDEV is not set
> > -
> > -#
> > -# physfs needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# Graphics
> > -#
> > -
> > -#
> > -# assimp needs a toolchain w/ C++, wchar, gcc >=3D 7
> > -#
> > -# BR2_PACKAGE_AT_SPI2_CORE is not set
> > -
> > -#
> > -# atkmm needs a toolchain w/ C++, wchar, threads, gcc >=3D 7
> > -#
> > -
> > -#
> > -# atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc >=3D 4.=
9
> > -#
> > -BR2_PACKAGE_BAYER2RGB_NEON_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# bayer2rgb-neon needs a toolchain w/ C++, dynamic library, gcc >=3D 4=
.9
> > -#
> > -
> > -#
> > -# bullet needs a toolchain w/ C++, dynamic library, threads, wchar
> > -#
> > -# BR2_PACKAGE_CAIRO is not set
> > -
> > -#
> > -# cairomm needs a toolchain w/ C++, wchar, threads, gcc >=3D 7
> > -#
> > -
> > -#
> > -# cairomm (1.14.x) needs a toolchain w/ C++, wchar, threads, gcc >=3D =
4.9
> > -#
> > -
> > -#
> > -# chipmunk needs an OpenGL backend
> > -#
> > -
> > -#
> > -# exempi needs a toolchain w/ C++, dynamic library, threads, wchar
> > -#
> > -
> > -#
> > -# exiv2 needs a uClibc or glibc toolchain w/ C++, wchar, dynamic
> library, threads
> > -#
> > -BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# flutter-engine needs an OpenGL or OpenGLES backend
> > -#
> > -
> > -#
> > -# flutter-engine needs a glibc toolchain w/ wchar, C++, gcc >=3D 5,
> dynamic library, host gcc >=3D 5, NPTL
> > -#
> > -# BR2_PACKAGE_FONTCONFIG is not set
> > -# BR2_PACKAGE_FREETYPE is not set
> > -# BR2_PACKAGE_GD is not set
> > -# BR2_PACKAGE_GDK_PIXBUF is not set
> > -# BR2_PACKAGE_GIFLIB is not set
> > -
> > -#
> > -# granite needs libgtk3 and a toolchain w/ wchar, threads, gcc >=3D 4.=
9
> > -#
> > -
> > -#
> > -# graphite2 needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >=
=3D
> 4.9
> > -#
> > -
> > -#
> > -# harfbuzz needs a toolchain w/ C++, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_IJS is not set
> > -# BR2_PACKAGE_IMLIB2 is not set
> > -
> > -#
> > -# intel-gmmlib needs a toolchain w/ dynamic library, C++, threads
> > -#
> > -
> > -#
> > -# irrlicht needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_JASPER is not set
> > -# BR2_PACKAGE_JBIG2DEC is not set
> > -BR2_PACKAGE_JPEG_SIMD_SUPPORT=3Dy
> > -# BR2_PACKAGE_JPEG is not set
> > -
> > -#
> > -# kms++ needs a toolchain w/ threads, C++, gcc >=3D 4.8, headers >=3D =
4.11,
> wchar
> > -#
> > -# BR2_PACKAGE_LCMS2 is not set
> > -
> > -#
> > -# lensfun needs a toolchain w/ C++, threads, wchar
> > -#
> > -# BR2_PACKAGE_LEPTONICA is not set
> > -# BR2_PACKAGE_LIBART is not set
> > -
> > -#
> > -# libdecor needs a toolchain w/ wchar, threads, C++, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_LIBDMTX is not set
> > -# BR2_PACKAGE_LIBDRM is not set
> > -
> > -#
> > -# libepoxy needs an OpenGL and/or OpenGL EGL backend
> > -#
> > -# BR2_PACKAGE_LIBEXIF is not set
> > -
> > -#
> > -# libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >=3D 4=
.9
> > -#
> > -# BR2_PACKAGE_LIBFM_EXTRA is not set
> > -
> > -#
> > -# libfreeglut depends on X.org and needs an OpenGL backend
> > -#
> > -
> > -#
> > -# libfreeimage needs a toolchain w/ C++, dynamic library, wchar
> > -#
> > -
> > -#
> > -# libgeotiff needs a toolchain w/ C++, gcc >=3D 4.7, threads, wchar
> > -#
> > -
> > -#
> > -# libglew depends on X.org and needs an OpenGL backend
> > -#
> > -
> > -#
> > -# libglfw depends on X.org or Wayland and an OpenGL or GLES backend
> > -#
> > -
> > -#
> > -# libglu needs an OpenGL backend
> > -#
> > -# BR2_PACKAGE_LIBGTA is not set
> > -
> > -#
> > -# libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >=3D 4.9
> > -#
> > -
> > -#
> > -# libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend
> > -#
> > -
> > -#
> > -# libjxl needs a toolchain with C++, threads, gcc >=3D 7, dynamic libr=
ary
> > -#
> > -# BR2_PACKAGE_LIBMEDIAART is not set
> > -# BR2_PACKAGE_LIBMNG is not set
> > -# BR2_PACKAGE_LIBPNG is not set
> > -# BR2_PACKAGE_LIBQRENCODE is not set
> > -
> > -#
> > -# libraw needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# librsvg needs a toolchain w/ wchar, threads, C++, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_LIBSVG is not set
> > -# BR2_PACKAGE_LIBSVG_CAIRO is not set
> > -# BR2_PACKAGE_LIBSVGTINY is not set
> > -# BR2_PACKAGE_LIBVA is not set
> > -
> > -#
> > -# libvips needs a toolchain w/ wchar, threads, C++
> > -#
> > -
> > -#
> > -# libwpe needs a toolchain w/ C++, dynamic library and an
> OpenEGL-capable backend
> > -#
> > -# BR2_PACKAGE_MENU_CACHE is not set
> > -BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# onevpl needs a toolchain w/ dynamic library, gcc >=3D 7, C++, thread=
s
> > -#
> > -
> > -#
> > -# onevpl-intel-gpu needs a toolchain w/ dynamic library, gcc >=3D 7, C=
++,
> NPTL
> > -#
> > -
> > -#
> > -# opencv3 needs a toolchain w/ C++, NPTL, wchar, dynamic library
> > -#
> > -
> > -#
> > -# opencv4 needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc
> >=3D 4.8
> > -#
> > -# BR2_PACKAGE_OPENJPEG is not set
> > -
> > -#
> > -# pango needs a toolchain w/ wchar, threads, C++, gcc >=3D 4.9
> > -#
> > -
> > -#
> > -# pangomm needs a toolchain w/ C++, wchar, threads, gcc >=3D 7
> > -#
> > -
> > -#
> > -# pangomm (2.46.x) needs a toolchain w/ C++, wchar, threads, gcc >=3D =
4.9
> > -#
> > -# BR2_PACKAGE_PIXMAN is not set
> > -
> > -#
> > -# poppler needs a toolchain w/ wchar, C++, threads, dynamic library,
> gcc >=3D 7
> > -#
> > -# BR2_PACKAGE_STB is not set
> > -# BR2_PACKAGE_TIFF is not set
> > -# BR2_PACKAGE_WAYLAND is not set
> > -BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads,
> dynamic library, gcc >=3D 9, host gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_WEBP is not set
> > -
> > -#
> > -# wlroots needs udev, EGL w/ Wayland backend and OpenGL ES support
> > -#
> > -
> > -#
> > -# woff2 needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic
> library and an OpenEGL-capable Wayland backend
> > -#
> > -BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library,
> gcc >=3D 9, host gcc >=3D 4.9
> > -#
> > -
> > -#
> > -# wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend
> > -#
> > -
> > -#
> > -# zbar needs a toolchain w/ threads, C++ and headers >=3D 3.0
> > -#
> > -
> > -#
> > -# zxing-cpp needs a toolchain w/ C++, wchar, dynamic library
> > -#
> > -
> > -#
> > -# Hardware handling
> > -#
> > -# BR2_PACKAGE_ACSCCID is not set
> > -# BR2_PACKAGE_BCM2835 is not set
> > -# BR2_PACKAGE_C_PERIPHERY is not set
> > -# BR2_PACKAGE_CCID is not set
> > -# BR2_PACKAGE_DTC is not set
> > -BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_GNU_EFI is not set
> > -# BR2_PACKAGE_HACKRF is not set
> > -
> > -#
> > -# hidapi needs udev /dev management and a toolchain w/ NPTL, threads,
> gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_JITTERENTROPY_LIBRARY is not set
> > -
> > -#
> > -# lcdapi needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# let-me-create needs a toolchain w/ C++, threads, dynamic library
> > -#
> > -# BR2_PACKAGE_LIBAIO is not set
> > -
> > -#
> > -# libatasmart requires udev to be enabled
> > -#
> > -
> > -#
> > -# libblockdev needs udev /dev management and a toolchain w/ wchar,
> threads, dynamic library, locale
> > -#
> > -
> > -#
> > -# libcec needs a toolchain w/ C++, wchar, threads, dynamic library, gc=
c
> >=3D 4.7
> > -#
> > -# BR2_PACKAGE_LIBDISPLAY_INFO is not set
> > -# BR2_PACKAGE_LIBFREEFARE is not set
> > -# BR2_PACKAGE_LIBFTDI is not set
> > -# BR2_PACKAGE_LIBFTDI1 is not set
> > -# BR2_PACKAGE_LIBGPHOTO2 is not set
> > -# BR2_PACKAGE_LIBGPIOD is not set
> > -
> > -#
> > -# libgudev needs udev /dev handling and a toolchain w/ wchar, threads
> > -#
> > -# BR2_PACKAGE_LIBHID is not set
> > -# BR2_PACKAGE_LIBIIO is not set
> > -
> > -#
> > -# libinput needs udev /dev management
> > -#
> > -# BR2_PACKAGE_LIBIQRF is not set
> > -# BR2_PACKAGE_LIBLLCP is not set
> > -# BR2_PACKAGE_LIBMBIM is not set
> > -# BR2_PACKAGE_LIBNFC is not set
> > -# BR2_PACKAGE_LIBNVME is not set
> > -# BR2_PACKAGE_LIBPCIACCESS is not set
> > -# BR2_PACKAGE_LIBPHIDGET is not set
> > -# BR2_PACKAGE_LIBPRI is not set
> > -# BR2_PACKAGE_LIBQMI is not set
> > -# BR2_PACKAGE_LIBQRTR_GLIB is not set
> > -# BR2_PACKAGE_LIBRAW1394 is not set
> > -# BR2_PACKAGE_LIBRTLSDR is not set
> > -
> > -#
> > -# libserial needs a toolchain w/ C++, gcc >=3D 5, threads, wchar
> > -#
> > -# BR2_PACKAGE_LIBSERIALPORT is not set
> > -# BR2_PACKAGE_LIBSIGROK is not set
> > -# BR2_PACKAGE_LIBSIGROKDECODE is not set
> > -# BR2_PACKAGE_LIBSOC is not set
> > -# BR2_PACKAGE_LIBSS7 is not set
> > -# BR2_PACKAGE_LIBUSB is not set
> > -# BR2_PACKAGE_LIBUSBGX is not set
> > -
> > -#
> > -# libv4l needs a toolchain w/ threads, C++ and headers >=3D 3.0
> > -#
> > -# BR2_PACKAGE_LIBXKBCOMMON is not set
> > -BR2_PACKAGE_MRAA_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_MRAA is not set
> > -# BR2_PACKAGE_MTDEV is not set
> > -BR2_PACKAGE_NE10_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_NE10 is not set
> > -# BR2_PACKAGE_NEARDAL is not set
> > -BR2_PACKAGE_OPENCSD_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# opencsd needs a toolchain w/ C++11, gcc >=3D 4.8, dynamic library
> > -#
> > -# BR2_PACKAGE_OPENSC is not set
> > -# BR2_PACKAGE_OWFS is not set
> > -# BR2_PACKAGE_PCSC_LITE is not set
> > -
> > -#
> > -# rpi-rgb-led-matrix needs a toolchain w/ C++, threads, dynamic librar=
y
> > -#
> > -# BR2_PACKAGE_TSLIB is not set
> > -
> > -#
> > -# uhd needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >=3D=
 5
> > -#
> > -
> > -#
> > -# urg needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# Javascript
> > -#
> > -# BR2_PACKAGE_ANGULARJS is not set
> > -# BR2_PACKAGE_BOOTSTRAP is not set
> > -# BR2_PACKAGE_CHARTJS is not set
> > -# BR2_PACKAGE_DATATABLES is not set
> > -# BR2_PACKAGE_DUKTAPE is not set
> > -# BR2_PACKAGE_EXPLORERCANVAS is not set
> > -# BR2_PACKAGE_FLOT is not set
> > -# BR2_PACKAGE_FORGE is not set
> > -# BR2_PACKAGE_JQUERY is not set
> > -# BR2_PACKAGE_JSMIN is not set
> > -# BR2_PACKAGE_JSON_JAVASCRIPT is not set
> > -# BR2_PACKAGE_JSZIP is not set
> > -# BR2_PACKAGE_OPENLAYERS is not set
> > -# BR2_PACKAGE_POPPERJS is not set
> > -# BR2_PACKAGE_VIS_NETWORK is not set
> > -# BR2_PACKAGE_VUEJS is not set
> > -
> > -#
> > -# JSON/XML
> > -#
> > -
> > -#
> > -# benejson needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_CJSON is not set
> > -# BR2_PACKAGE_EXPAT is not set
> > -# BR2_PACKAGE_JANSSON is not set
> > -# BR2_PACKAGE_JOSE is not set
> > -# BR2_PACKAGE_JSMN is not set
> > -# BR2_PACKAGE_JSON_C is not set
> > -
> > -#
> > -# json-for-modern-cpp needs a toolchain w/ C++, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_JSON_GLIB is not set
> > -
> > -#
> > -# jsoncpp needs a toolchain w/ C++, gcc >=3D 4.7
> > -#
> > -# BR2_PACKAGE_LIBBSON is not set
> > -# BR2_PACKAGE_LIBFASTJSON is not set
> > -
> > -#
> > -# libjson needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_LIBROXML is not set
> > -# BR2_PACKAGE_LIBUCL is not set
> > -# BR2_PACKAGE_LIBXML2 is not set
> > -
> > -#
> > -# libxml++ needs a toolchain w/ C++, wchar, threads, gcc >=3D 7
> > -#
> > -# BR2_PACKAGE_LIBXMLRPC is not set
> > -# BR2_PACKAGE_LIBXSLT is not set
> > -# BR2_PACKAGE_LIBYAML is not set
> > -# BR2_PACKAGE_MXML is not set
> > -
> > -#
> > -# pugixml needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# rapidjson needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_RAPIDXML is not set
> > -# BR2_PACKAGE_RAPTOR is not set
> > -# BR2_PACKAGE_SERD is not set
> > -# BR2_PACKAGE_SORD is not set
> > -
> > -#
> > -# tinyxml needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# tinyxml2 needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# valijson needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# xerces-c++ needs a toolchain w/ C++, dynamic library, wchar
> > -#
> > -
> > -#
> > -# xml-security-c needs a toolchain w/ C++, wchar, dynamic library,
> threads, gcc >=3D 4.7
> > -#
> > -# BR2_PACKAGE_YAJL is not set
> > -
> > -#
> > -# yaml-cpp needs a toolchain w/ C++, gcc >=3D 4.7
> > -#
> > -
> > -#
> > -# Logging
> > -#
> > -
> > -#
> > -# glog needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# hawktracer needs a toolchain w/ C++, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_LIBLOG4C_LOCALTIME is not set
> > -# BR2_PACKAGE_LIBLOGGING is not set
> > -
> > -#
> > -# log4cplus needs a toolchain w/ C++, wchar, threads, gcc >=3D 4.8
> > -#
> > -
> > -#
> > -# log4cpp needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# log4cxx needs a toolchain w/ C++, threads, dynamic library
> > -#
> > -
> > -#
> > -# log4qt needs qt5
> > -#
> > -
> > -#
> > -# opentracing-cpp needs a toolchain w/ C++, threads, dynamic library,
> gcc >=3D 4.8
> > -#
> > -
> > -#
> > -# spdlog needs a toolchain w/ C++, threads, wchar
> > -#
> > -
> > -#
> > -# ulog needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_ZLOG is not set
> > -
> > -#
> > -# Multimedia
> > -#
> > -
> > -#
> > -# bento4 support needs a toolchain with C++
> > -#
> > -# BR2_PACKAGE_BITSTREAM is not set
> > -# BR2_PACKAGE_DAV1D is not set
> > -
> > -#
> > -# kvazaar needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_LIBAACS is not set
> > -
> > -#
> > -# libass needs a toolchain w/ C++, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_LIBBDPLUS is not set
> > -# BR2_PACKAGE_LIBBLURAY is not set
> > -BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# libcamera needs a toolchain w/ C++, threads, wchar, dynamic library,
> gcc >=3D 8
> > -#
> > -
> > -#
> > -# libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic
> library, gcc >=3D 8
> > -#
> > -
> > -#
> > -# libde265 needs a toolchain w/ threads, C++
> > -#
> > -# BR2_PACKAGE_LIBDVBCSA is not set
> > -# BR2_PACKAGE_LIBDVBPSI is not set
> > -
> > -#
> > -# libdvbsi++ needs a toolchain w/ C++, wchar, threads
> > -#
> > -# BR2_PACKAGE_LIBDVDCSS is not set
> > -# BR2_PACKAGE_LIBDVDNAV is not set
> > -# BR2_PACKAGE_LIBDVDREAD is not set
> > -
> > -#
> > -# libebml needs a toolchain w/ C++, wchar, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_LIBHDHOMERUN is not set
> > -
> > -#
> > -# libheif needs a toolchain w/ C++, gcc >=3D 4.8
> > -#
> > -
> > -#
> > -# libimxvpuapi needs an i.MX platform with VPU support
> > -#
> > -
> > -#
> > -# libmatroska needs a toolchain w/ C++, wchar, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_LIBMMS is not set
> > -# BR2_PACKAGE_LIBMPEG2 is not set
> > -# BR2_PACKAGE_LIBOGG is not set
> > -# BR2_PACKAGE_LIBOPENAPTX is not set
> > -BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# libopenh264 needs a toolchain w/ C++, dynamic library, threads
> > -#
> > -# BR2_PACKAGE_LIBOPUSENC is not set
> > -# BR2_PACKAGE_LIBTHEORA is not set
> > -# BR2_PACKAGE_LIBUDFREAD is not set
> > -# BR2_PACKAGE_LIBVPX is not set
> > -
> > -#
> > -# libyuv needs a toolchain w/ C++, dynamic library
> > -#
> > -
> > -#
> > -# live555 needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# mediastreamer needs a toolchain w/ threads, C++, dynamic library, gc=
c
> >=3D 5
> > -#
> > -# BR2_PACKAGE_X264 is not set
> > -
> > -#
> > -# x265 needs a toolchain w/ C++, threads, dynamic library
> > -#
> > -
> > -#
> > -# Networking
> > -#
> > -
> > -#
> > -# agent++ needs a toolchain w/ threads, C++, dynamic library
> > -#
> > -
> > -#
> > -# azmq needs a toolchain w/ C++11, wchar and threads
> > -#
> > -
> > -#
> > -# azure-iot-sdk-c needs a toolchain w/ C++, NPTL and wchar
> > -#
> > -# BR2_PACKAGE_BATMAN_ADV is not set
> > -
> > -#
> > -# belle-sip needs a toolchain w/ threads, C++, dynamic library, wchar
> > -#
> > -# BR2_PACKAGE_C_ARES is not set
> > -# BR2_PACKAGE_CGIC is not set
> > -# BR2_PACKAGE_CNI_PLUGINS is not set
> > -
> > -#
> > -# cppzmq needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# curlpp needs a toolchain w/ C++, dynamic library
> > -#
> > -
> > -#
> > -# czmq needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_DAQ is not set
> > -# BR2_PACKAGE_DAQ3 is not set
> > -# BR2_PACKAGE_DAVICI is not set
> > -# BR2_PACKAGE_DHT is not set
> > -# BR2_PACKAGE_ENET is not set
> > -
> > -#
> > -# filemq needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_FLICKCURL is not set
> > -# BR2_PACKAGE_FREERADIUS_CLIENT is not set
> > -# BR2_PACKAGE_GENSIO is not set
> > -# BR2_PACKAGE_GEOIP is not set
> > -# BR2_PACKAGE_GLIB_NETWORKING is not set
> > -
> > -#
> > -# grpc needs a toolchain w/ C++, threads, dynamic library, gcc >=3D 5
> > -#
> > -# BR2_PACKAGE_GSSDP is not set
> > -# BR2_PACKAGE_GUPNP is not set
> > -# BR2_PACKAGE_GUPNP_AV is not set
> > -# BR2_PACKAGE_GUPNP_DLNA is not set
> > -
> > -#
> > -# ibrcommon needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# ibrdtn needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_LIBCGI is not set
> > -
> > -#
> > -# libcgicc needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_LIBCOAP is not set
> > -
> > -#
> > -# libcpprestsdk needs a toolchain w/ NPTL, C++, wchar, locale
> > -#
> > -# BR2_PACKAGE_LIBCURL is not set
> > -# BR2_PACKAGE_LIBDNET is not set
> > -# BR2_PACKAGE_LIBEXOSIP2 is not set
> > -# BR2_PACKAGE_LIBEST is not set
> > -# BR2_PACKAGE_LIBFCGI is not set
> > -# BR2_PACKAGE_LIBGSASL is not set
> > -# BR2_PACKAGE_LIBHTP is not set
> > -# BR2_PACKAGE_LIBHTTPPARSER is not set
> > -
> > -#
> > -# libhttpserver needs a toolchain w/ C++, threads, gcc >=3D 5
> > -#
> > -# BR2_PACKAGE_LIBIDN is not set
> > -# BR2_PACKAGE_LIBIDN2 is not set
> > -# BR2_PACKAGE_LIBISCSI is not set
> > -# BR2_PACKAGE_LIBKRB5 is not set
> > -# BR2_PACKAGE_LIBLDNS is not set
> > -# BR2_PACKAGE_LIBMAXMINDDB is not set
> > -# BR2_PACKAGE_LIBMBUS is not set
> > -
> > -#
> > -# libmemcached needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_LIBMICROHTTPD is not set
> > -# BR2_PACKAGE_LIBMINIUPNPC is not set
> > -# BR2_PACKAGE_LIBMNL is not set
> > -# BR2_PACKAGE_LIBMODBUS is not set
> > -
> > -#
> > -# libmodsecurity needs a toolchain w/ C++, threads, dynamic library
> > -#
> > -# BR2_PACKAGE_LIBNATPMP is not set
> > -# BR2_PACKAGE_LIBNDP is not set
> > -# BR2_PACKAGE_LIBNET is not set
> > -# BR2_PACKAGE_LIBNETCONF2 is not set
> > -# BR2_PACKAGE_LIBNETFILTER_ACCT is not set
> > -# BR2_PACKAGE_LIBNETFILTER_CONNTRACK is not set
> > -# BR2_PACKAGE_LIBNETFILTER_CTHELPER is not set
> > -# BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT is not set
> > -# BR2_PACKAGE_LIBNETFILTER_LOG is not set
> > -# BR2_PACKAGE_LIBNETFILTER_QUEUE is not set
> > -# BR2_PACKAGE_LIBNFNETLINK is not set
> > -# BR2_PACKAGE_LIBNFTNL is not set
> > -# BR2_PACKAGE_LIBNICE is not set
> > -# BR2_PACKAGE_LIBNIDS is not set
> > -# BR2_PACKAGE_LIBNL is not set
> > -
> > -#
> > -# libnpupnp needs a toolchain w/ C++, threads, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_LIBOAUTH is not set
> > -# BR2_PACKAGE_LIBOPING is not set
> > -# BR2_PACKAGE_LIBOSIP2 is not set
> > -# BR2_PACKAGE_LIBPAGEKITE is not set
> > -# BR2_PACKAGE_LIBPCAP is not set
> > -
> > -#
> > -# libpjsip needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_LIBPSL is not set
> > -# BR2_PACKAGE_LIBRELP is not set
> > -# BR2_PACKAGE_LIBRSYNC is not set
> > -# BR2_PACKAGE_LIBSHAIRPLAY is not set
> > -# BR2_PACKAGE_LIBSHOUT is not set
> > -# BR2_PACKAGE_LIBSOCKETCAN is not set
> > -# BR2_PACKAGE_LIBSOUP is not set
> > -# BR2_PACKAGE_LIBSOUP3 is not set
> > -# BR2_PACKAGE_LIBSRTP is not set
> > -# BR2_PACKAGE_LIBSTROPHE is not set
> > -# BR2_PACKAGE_LIBTEAM is not set
> > -# BR2_PACKAGE_LIBTELNET is not set
> > -# BR2_PACKAGE_LIBTIRPC is not set
> > -
> > -#
> > -# libtorrent needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc >=
=3D
> 4.9
> > -#
> > -# BR2_PACKAGE_LIBUEV is not set
> > -# BR2_PACKAGE_LIBUHTTPD is not set
> > -# BR2_PACKAGE_LIBUPNP is not set
> > -
> > -#
> > -# libupnpp needs a toolchain w/ C++, threads, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_LIBURIPARSER is not set
> > -
> > -#
> > -# libutp support needs a toolchain with C++
> > -#
> > -# BR2_PACKAGE_LIBUWSC is not set
> > -# BR2_PACKAGE_LIBVNCSERVER is not set
> > -# BR2_PACKAGE_LIBWEBSOCK is not set
> > -# BR2_PACKAGE_LIBWEBSOCKETS is not set
> > -# BR2_PACKAGE_LIBYANG is not set
> > -# BR2_PACKAGE_LIBZENOH_PICO is not set
> > -# BR2_PACKAGE_LKSCTP_TOOLS is not set
> > -# BR2_PACKAGE_MBUFFER is not set
> > -# BR2_PACKAGE_MDNSD is not set
> > -# BR2_PACKAGE_MONGOOSE is not set
> > -# BR2_PACKAGE_NANOMSG is not set
> > -# BR2_PACKAGE_NEON is not set
> > -
> > -#
> > -# netopeer2 needs a toolchain w/ gcc >=3D 4.8, C++, threads, dynamic
> library
> > -#
> > -# BR2_PACKAGE_NGHTTP2 is not set
> > -
> > -#
> > -# norm needs a toolchain w/ C++, threads, dynamic library
> > -#
> > -# BR2_PACKAGE_NSS_MYHOSTNAME is not set
> > -# BR2_PACKAGE_NSS_PAM_LDAPD is not set
> > -
> > -#
> > -# oatpp needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# omniORB needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_OPEN_ISNS is not set
> > -# BR2_PACKAGE_OPEN62541 is not set
> > -# BR2_PACKAGE_OPENLDAP is not set
> > -
> > -#
> > -# openmpi needs a toolchain w/ dynamic library, NPTL, wchar, C++
> > -#
> > -# BR2_PACKAGE_OPENPGM is not set
> > -
> > -#
> > -# openzwave needs a toolchain w/ C++, dynamic library, NPTL, wchar
> > -#
> > -
> > -#
> > -# ortp needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_PAHO_MQTT_C is not set
> > -
> > -#
> > -# paho-mqtt-cpp needs a toolchain w/ threads, C++
> > -#
> > -
> > -#
> > -# pistache needs a toolchain w/ C++, gcc >=3D 7, threads, wchar, not
> binutils bug 27597
> > -#
> > -# BR2_PACKAGE_QDECODER is not set
> > -
> > -#
> > -# qpid-proton needs a toolchain w/ C++, dynamic library, threads
> > -#
> > -# BR2_PACKAGE_RABBITMQ_C is not set
> > -
> > -#
> > -# resiprocate needs a toolchain w/ C++, threads, wchar
> > -#
> > -
> > -#
> > -# restclient-cpp needs a toolchain w/ C++, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_RTMPDUMP is not set
> > -# BR2_PACKAGE_SIPROXD is not set
> > -# BR2_PACKAGE_SLIRP is not set
> > -# BR2_PACKAGE_SLIRP4NETNS is not set
> > -
> > -#
> > -# snmp++ needs a toolchain w/ threads, C++, dynamic library
> > -#
> > -# BR2_PACKAGE_SOFIA_SIP is not set
> > -# BR2_PACKAGE_SSCEP is not set
> > -
> > -#
> > -# sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc >=3D 4.=
8
> > -#
> > -
> > -#
> > -# thrift needs a toolchain w/ C++, wchar, threads
> > -#
> > -# BR2_PACKAGE_USBREDIR is not set
> > -
> > -#
> > -# wampcc needs a toolchain w/ C++, NPTL, dynamic library, gcc >=3D 4.9
> > -#
> > -
> > -#
> > -# websocketpp needs a toolchain w/ C++ and gcc >=3D 4.8
> > -#
> > -
> > -#
> > -# zeromq needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# zmqpp needs a toolchain w/ C++, threads, gcc >=3D 4.7
> > -#
> > -
> > -#
> > -# zyre needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# Other
> > -#
> > -
> > -#
> > -# ACE needs a glibc toolchain, dynamic library, C++, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_APR is not set
> > -# BR2_PACKAGE_APR_UTIL is not set
> > -
> > -#
> > -# armadillo needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# atf needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_AVRO_C is not set
> > -
> > -#
> > -# bctoolbox needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_BDWGC is not set
> > -
> > -#
> > -# belr needs a toolchain w/ threads, C++
> > -#
> > -
> > -#
> > -# boost needs a toolchain w/ C++, threads, wchar
> > -#
> > -
> > -#
> > -# c-capnproto needs host and target gcc >=3D 5 w/ C++14, threads, atom=
ic,
> ucontext and not gcc bug 64735
> > -#
> > -
> > -#
> > -# capnproto needs host and target gcc >=3D 5 w/ C++14, threads, atomic=
,
> ucontext and not gcc bug 64735
> > -#
> > -
> > -#
> > -# catch2 needs a toolchain w/ C++, wchar, threads, gcc >=3D 5
> > -#
> > -
> > -#
> > -# cctz needs a toolchain w/ C++, threads, gcc >=3D 4.8
> > -#
> > -
> > -#
> > -# cereal needs a toolchain w/ C++, gcc >=3D 4.7, threads, wchar
> > -#
> > -
> > -#
> > -# clang needs a toolchain w/ wchar, threads, C++, gcc >=3D 7, dynamic
> library, host gcc >=3D 7
> > -#
> > -# BR2_PACKAGE_CMOCKA is not set
> > -
> > -#
> > -# cppcms needs a toolchain w/ C++, NPTL, wchar, dynamic library
> > -#
> > -# BR2_PACKAGE_CRACKLIB is not set
> > -
> > -#
> > -# dawgdic needs a toolchain w/ C++, gcc >=3D 4.6
> > -#
> > -# BR2_PACKAGE_DING_LIBS is not set
> > -# BR2_PACKAGE_DOTCONF is not set
> > -
> > -#
> > -# double-conversion needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# eigen needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_ELFUTILS is not set
> > -# BR2_PACKAGE_ELL is not set
> > -# BR2_PACKAGE_FFTW is not set
> > -
> > -#
> > -# flann needs a toolchain w/ C++, dynamic library, gcc >=3D 4.7
> > -#
> > -
> > -#
> > -# flatbuffers needs a toolchain w/ C++, gcc >=3D 4.7
> > -#
> > -# BR2_PACKAGE_FLATCC is not set
> > -# BR2_PACKAGE_FXDIV is not set
> > -# BR2_PACKAGE_GCONF is not set
> > -
> > -#
> > -# gdal needs a toolchain w/ C++, dynamic library, gcc >=3D 4.7, not
> binutils bug 27597, threads, wchar
> > -#
> > -
> > -#
> > -# gflags needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# gli needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# glibmm needs a toolchain w/ C++, wchar, threads, gcc >=3D 7
> > -#
> > -
> > -#
> > -# glibmm (2.66.x) needs a toolchain w/ C++, wchar, threads, gcc >=3D 4=
.9
> > -#
> > -
> > -#
> > -# glm needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_GMP is not set
> > -BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# gobject-introspection needs python3
> > -#
> > -# BR2_PACKAGE_GSL is not set
> > -
> > -#
> > -# gtest needs a toolchain w/ C++, wchar, threads, gcc >=3D 5
> > -#
> > -# BR2_PACKAGE_GUMBO_PARSER is not set
> > -
> > -#
> > -# highway needs a toolchain w/ C++, gcc >=3D 7
> > -#
> > -BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_JEMALLOC is not set
> > -BR2_PACKAGE_LAPACK_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# lapack/blas needs a toolchain w/ fortran
> > -#
> > -BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# libabseil-cpp needs a toolchain w/ gcc >=3D 4.9, C++, threads, dynam=
ic
> library
> > -#
> > -# BR2_PACKAGE_LIBARGTABLE2 is not set
> > -BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_LIBATOMIC_OPS is not set
> > -# BR2_PACKAGE_LIBAVL is not set
> > -# BR2_PACKAGE_LIBB64 is not set
> > -# BR2_PACKAGE_LIBBACKTRACE is not set
> > -BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_LIBBSD is not set
> > -# BR2_PACKAGE_LIBBYTESIZE is not set
> > -# BR2_PACKAGE_LIBCAP is not set
> > -# BR2_PACKAGE_LIBCAP_NG is not set
> > -
> > -#
> > -# libcgroup needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_LIBCLC is not set
> > -# BR2_PACKAGE_LIBCOFI is not set
> > -# BR2_PACKAGE_LIBCORRECT is not set
> > -
> > -#
> > -# libcrossguid needs a toolchain w/ C++, gcc >=3D 4.7
> > -#
> > -# BR2_PACKAGE_LIBCSV is not set
> > -# BR2_PACKAGE_LIBDAEMON is not set
> > -# BR2_PACKAGE_LIBDILL is not set
> > -# BR2_PACKAGE_LIBEE is not set
> > -# BR2_PACKAGE_LIBEV is not set
> > -# BR2_PACKAGE_LIBEVDEV is not set
> > -# BR2_PACKAGE_LIBEVENT is not set
> > -
> > -#
> > -# libexecinfo needs a musl or uclibc toolchain w/ dynamic library
> > -#
> > -# BR2_PACKAGE_LIBFFI is not set
> > -
> > -#
> > -# libfutils needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_LIBGEE is not set
> > -
> > -#
> > -# libgeos needs a toolchain w/ C++, wchar, gcc >=3D 4.9, threads not
> binutils bug 27597
> > -#
> > -# BR2_PACKAGE_LIBGLIB2 is not set
> > -# BR2_PACKAGE_LIBGLOB is not set
> > -
> > -#
> > -# libical needs a toolchain w/ C++, dynamic library, wchar
> > -#
> > -# BR2_PACKAGE_LIBITE is not set
> > -
> > -#
> > -# libks needs a toolchain w/ C++, NPTL, dynamic library
> > -#
> > -
> > -#
> > -# liblinear needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# libloki needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_LIBNPTH is not set
> > -BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT=3Dy
> > -# BR2_PACKAGE_LIBNSPR is not set
> > -
> > -#
> > -# libosmium needs a toolchain w/ C++, wchar, threads, gcc >=3D 4.7
> > -#
> > -
> > -#
> > -# libpeas needs python3
> > -#
> > -# BR2_PACKAGE_LIBPFM4 is not set
> > -
> > -#
> > -# libplist needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_LIBPTHREAD_STUBS is not set
> > -# BR2_PACKAGE_LIBPTHSEM is not set
> > -# BR2_PACKAGE_LIBPWQUALITY is not set
> > -# BR2_PACKAGE_LIBQB is not set
> > -BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_LIBSECCOMP is not set
> > -
> > -#
> > -# libshdata needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# libsigc++ needs a toolchain w/ C++, gcc >=3D 7
> > -#
> > -
> > -#
> > -# libsigc++ (2.x.x) needs a toolchain w/ C++, gcc >=3D 4.9
> > -#
> > -BR2_PACKAGE_LIBSIGSEGV_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_LIBSIGSEGV is not set
> > -# BR2_PACKAGE_LIBSOLV is not set
> > -
> > -#
> > -# libspatialindex needs a toolchain w/ C++, gcc >=3D 4.7
> > -#
> > -# BR2_PACKAGE_LIBTALLOC is not set
> > -# BR2_PACKAGE_LIBTASN1 is not set
> > -# BR2_PACKAGE_LIBTOMMATH is not set
> > -# BR2_PACKAGE_LIBTPL is not set
> > -# BR2_PACKAGE_LIBUBOX is not set
> > -# BR2_PACKAGE_LIBUCI is not set
> > -BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_LIBUNWIND is not set
> > -BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# liburcu needs a toolchain w/ threads, C++
> > -#
> > -# BR2_PACKAGE_LIBURING is not set
> > -# BR2_PACKAGE_LIBUV is not set
> > -# BR2_PACKAGE_LIGHTNING is not set
> > -# BR2_PACKAGE_LINUX_PAM is not set
> > -# BR2_PACKAGE_LIQUID_DSP is not set
> > -BR2_PACKAGE_LLVM_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_LLVM_TARGET_ARCH=3D"ARM"
> > -
> > -#
> > -# llvm needs a toolchain w/ wchar, threads, C++, gcc >=3D 7, dynamic
> library, host gcc >=3D 7
> > -#
> > -
> > -#
> > -# lttng-libust needs a toolchain w/ dynamic library, wchar, threads, C=
++
> > -#
> > -# BR2_PACKAGE_MATIO is not set
> > -# BR2_PACKAGE_MPC is not set
> > -# BR2_PACKAGE_MPDECIMAL is not set
> > -# BR2_PACKAGE_MPFR is not set
> > -# BR2_PACKAGE_MPIR is not set
> > -
> > -#
> > -# msgpack needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_NEON_2_SSE is not set
> > -BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET=3D"ARMV7"
> > -BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_OPENBLAS is not set
> > -# BR2_PACKAGE_ORC is not set
> > -# BR2_PACKAGE_P11_KIT is not set
> > -BR2_PACKAGE_POCO_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >=
=3D 5
> w/ C++14
> > -#
> > -BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >=
=3D
> 4.8
> > -#
> > -
> > -#
> > -# protobuf-c needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# protozero needs a toolchain w/ C++, gcc >=3D 4.7
> > -#
> > -
> > -#
> > -# qhull needs a toolchain w/ C++, gcc >=3D 4.4
> > -#
> > -# BR2_PACKAGE_QLIBC is not set
> > -# BR2_PACKAGE_REPROC is not set
> > -
> > -#
> > -# riemann-c-client needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# shapelib needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_SKALIBS is not set
> > -# BR2_PACKAGE_SPHINXBASE is not set
> > -
> > -#
> > -# tbb needs a glibc or musl toolchain w/ dynamic library, threads, C++
> > -#
> > -# BR2_PACKAGE_TINYCBOR is not set
> > -
> > -#
> > -# tl-expected needs a toolchain w/ C++, gcc >=3D 4.8
> > -#
> > -
> > -#
> > -# uvw needs a toolchain w/ NPTL, dynamic library, C++, gcc >=3D 7
> > -#
> > -
> > -#
> > -# volk needs a toolchain w/ C++, NPTL, wchar, dynamic library
> > -#
> > -
> > -#
> > -# xapian needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# Security
> > -#
> > -# BR2_PACKAGE_LIBAPPARMOR is not set
> > -# BR2_PACKAGE_LIBSELINUX is not set
> > -# BR2_PACKAGE_LIBSEMANAGE is not set
> > -# BR2_PACKAGE_LIBSEPOL is not set
> > -# BR2_PACKAGE_SAFECLIB is not set
> > -
> > -#
> > -# softhsm2 needs a toolchain w/ C++, threads, gcc >=3D 4.8 and dynamic
> library support
> > -#
> > -
> > -#
> > -# Text and terminal handling
> > -#
> > -# BR2_PACKAGE_AUGEAS is not set
> > -
> > -#
> > -# cli11 needs a toolchain w/ C++, gcc >=3D 4.8
> > -#
> > -
> > -#
> > -# docopt-cpp needs a toolchain w/ C++, gcc >=3D 4.7
> > -#
> > -
> > -#
> > -# enchant needs a toolchain w/ C++, threads, wchar
> > -#
> > -
> > -#
> > -# fmt needs a toolchain w/ C++, wchar
> > -#
> > -# BR2_PACKAGE_FSTRCMP is not set
> > -
> > -#
> > -# icu needs a toolchain w/ C++, wchar, threads, gcc >=3D 4.9, host gcc=
 >=3D
> 4.9
> > -#
> > -# BR2_PACKAGE_INIH is not set
> > -# BR2_PACKAGE_LIBCLI is not set
> > -# BR2_PACKAGE_LIBEDIT is not set
> > -# BR2_PACKAGE_LIBENCA is not set
> > -# BR2_PACKAGE_LIBESTR is not set
> > -# BR2_PACKAGE_LIBFRIBIDI is not set
> > -# BR2_PACKAGE_LIBUNIBREAK is not set
> > -# BR2_PACKAGE_LIBUNISTRING is not set
> > -# BR2_PACKAGE_LINENOISE is not set
> > -# BR2_PACKAGE_NCURSES is not set
> > -# BR2_PACKAGE_NEWT is not set
> > -# BR2_PACKAGE_ONIGURUMA is not set
> > -# BR2_PACKAGE_PCRE is not set
> > -# BR2_PACKAGE_PCRE2 is not set
> > -# BR2_PACKAGE_POPT is not set
> > -
> > -#
> > -# re2 needs a toolchain w/ C++, threads, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_READLINE is not set
> > -# BR2_PACKAGE_SLANG is not set
> > -
> > -#
> > -# tclap needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# termcolor needs a toolchain w/ C++, gcc >=3D 4.8
> > -#
> > -# BR2_PACKAGE_UTF8PROC is not set
> > -
> > -#
> > -# Mail
> > -#
> > -# BR2_PACKAGE_DOVECOT is not set
> > -# BR2_PACKAGE_EXIM is not set
> > -# BR2_PACKAGE_FETCHMAIL is not set
> > -# BR2_PACKAGE_HEIRLOOM_MAILX is not set
> > -# BR2_PACKAGE_LIBESMTP is not set
> > -# BR2_PACKAGE_MSMTP is not set
> > -# BR2_PACKAGE_MUTT is not set
> > -
> > -#
> > -# Miscellaneous
> > -#
> > -# BR2_PACKAGE_AESPIPE is not set
> > -# BR2_PACKAGE_BC is not set
> > -BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# bitcoin needs a toolchain w/ C++, threads, wchar
> > -#
> > -
> > -#
> > -# clamav needs a toolchain w/ C++, dynamic library, threads, wchar
> > -#
> > -# BR2_PACKAGE_COLLECTD is not set
> > -# BR2_PACKAGE_COLLECTL is not set
> > -
> > -#
> > -# domoticz needs lua 5.3 and a toolchain w/ C++, gcc >=3D 6, NPTL, wch=
ar,
> dynamic library
> > -#
> > -# BR2_PACKAGE_EMPTY is not set
> > -# BR2_PACKAGE_FFT_EVAL is not set
> > -# BR2_PACKAGE_GITLAB_RUNNER is not set
> > -
> > -#
> > -# gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc
> >=3D 8
> > -#
> > -# BR2_PACKAGE_GOOGLEFONTDIRECTORY is not set
> > -
> > -#
> > -# gqrx needs a toolchain w/ C++, threads, wchar, dynamic library, gcc
> >=3D 8
> > -#
> > -
> > -#
> > -# gqrx needs qt5
> > -#
> > -# BR2_PACKAGE_GSETTINGS_DESKTOP_SCHEMAS is not set
> > -# BR2_PACKAGE_HAVEGED is not set
> > -# BR2_PACKAGE_LINUX_SYSCALL_SUPPORT is not set
> > -# BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set
> > -# BR2_PACKAGE_NETDATA is not set
> > -
> > -#
> > -# proj needs a toolchain w/ C++, gcc >=3D 4.7, threads, wchar
> > -#
> > -BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=3Dy
> > -# BR2_PACKAGE_QEMU is not set
> > -
> > -#
> > -# qpdf needs a toolchain w/ C++, gcc >=3D 5
> > -#
> > -# BR2_PACKAGE_RTL_433 is not set
> > -# BR2_PACKAGE_SHARED_MIME_INFO is not set
> > -
> > -#
> > -# sunwait needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# taskd needs a toolchain w/ C++, wchar, dynamic library
> > -#
> > -BR2_PACKAGE_XMRIG_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library, C++,
> gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_XUTIL_UTIL_MACROS is not set
> > -BR2_PACKAGE_Z3_ARCH_SUPPORTS=3Dy
> > -
> > -#
> > -# Networking applications
> > -#
> > -
> > -#
> > -# aircrack-ng needs a toolchain w/ dynamic library, threads, C++
> > -#
> > -# BR2_PACKAGE_ALFRED is not set
> > -# BR2_PACKAGE_AOETOOLS is not set
> > -# BR2_PACKAGE_APACHE is not set
> > -# BR2_PACKAGE_ARGUS is not set
> > -# BR2_PACKAGE_ARP_SCAN is not set
> > -# BR2_PACKAGE_ARPTABLES is not set
> > -
> > -#
> > -# asterisk needs a glibc or uClibc toolchain w/ C++, dynamic library,
> threads, wchar
> > -#
> > -# BR2_PACKAGE_ATFTP is not set
> > -# BR2_PACKAGE_AVAHI is not set
> > -# BR2_PACKAGE_AXEL is not set
> > -# BR2_PACKAGE_BABELD is not set
> > -# BR2_PACKAGE_BANDWIDTHD is not set
> > -# BR2_PACKAGE_BATCTL is not set
> > -
> > -#
> > -# bcusdk needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_BIND is not set
> > -# BR2_PACKAGE_BIRD is not set
> > -# BR2_PACKAGE_BLUEZ5_UTILS is not set
> > -# BR2_PACKAGE_BMON is not set
> > -# BR2_PACKAGE_BMX7 is not set
> > -
> > -#
> > -# boinc needs a toolchain w/ dynamic library, C++, threads, gcc >=3D 4=
.8
> > -#
> > -# BR2_PACKAGE_BRCM_PATCHRAM_PLUS is not set
> > -# BR2_PACKAGE_BRIDGE_UTILS is not set
> > -# BR2_PACKAGE_BWM_NG is not set
> > -# BR2_PACKAGE_C_ICAP is not set
> > -# BR2_PACKAGE_CAN_UTILS is not set
> > -
> > -#
> > -# cannelloni needs a toolchain w/ C++, threads, dynamic library, gcc >=
=3D
> 4.8
> > -#
> > -# BR2_PACKAGE_CASYNC is not set
> > -# BR2_PACKAGE_CFM is not set
> > -# BR2_PACKAGE_CHRONY is not set
> > -# BR2_PACKAGE_CIVETWEB is not set
> > -# BR2_PACKAGE_CONNMAN is not set
> > -
> > -#
> > -# connman-gtk needs libgtk3 and a glibc or uClibc toolchain w/ wchar,
> threads, resolver, dynamic library
> > -#
> > -# BR2_PACKAGE_CONNTRACK_TOOLS is not set
> > -# BR2_PACKAGE_CORKSCREW is not set
> > -# BR2_PACKAGE_CRDA is not set
> > -
> > -#
> > -# ctorrent needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# cups needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# cups-filters needs a toolchain w/ wchar, C++, threads and dynamic
> library, gcc >=3D 5
> > -#
> > -# BR2_PACKAGE_DANTE is not set
> > -# BR2_PACKAGE_DARKHTTPD is not set
> > -# BR2_PACKAGE_DEHYDRATED is not set
> > -# BR2_PACKAGE_DHCPCD is not set
> > -# BR2_PACKAGE_DHCPDUMP is not set
> > -# BR2_PACKAGE_DNSMASQ is not set
> > -# BR2_PACKAGE_DRBD_UTILS is not set
> > -# BR2_PACKAGE_DROPBEAR is not set
> > -# BR2_PACKAGE_EASYFRAMES is not set
> > -# BR2_PACKAGE_EBTABLES is not set
> > -
> > -#
> > -# ejabberd needs erlang, toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_ETHTOOL is not set
> > -# BR2_PACKAGE_FAIFA is not set
> > -# BR2_PACKAGE_FASTD is not set
> > -# BR2_PACKAGE_FCGIWRAP is not set
> > -# BR2_PACKAGE_FIREWALLD is not set
> > -# BR2_PACKAGE_FLANNEL is not set
> > -# BR2_PACKAGE_FPING is not set
> > -# BR2_PACKAGE_FREERADIUS_SERVER is not set
> > -
> > -#
> > -# freeswitch needs a toolchain w/ C++, dynamic library, threads, wchar
> > -#
> > -# BR2_PACKAGE_FRR is not set
> > -
> > -#
> > -# gerbera needs a toolchain w/ C++, dynamic library, threads, wchar,
> gcc >=3D 8
> > -#
> > -# BR2_PACKAGE_GESFTPSERVER is not set
> > -
> > -#
> > -# gloox needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_GLORYTUN is not set
> > -
> > -#
> > -# gupnp-tools needs libgtk3
> > -#
> > -
> > -#
> > -# hans needs a toolchain w/ C++
> > -#
> > -BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_HAPROXY is not set
> > -# BR2_PACKAGE_HIAWATHA is not set
> > -# BR2_PACKAGE_HOSTAPD is not set
> > -# BR2_PACKAGE_HTPDATE is not set
> > -# BR2_PACKAGE_HTTPING is not set
> > -
> > -#
> > -# i2pd needs a toolchain w/ C++, NPTL, wchar
> > -#
> > -
> > -#
> > -# ibrdtn-tools needs a toolchain w/ C++, threads
> > -#
> > -
> > -#
> > -# ibrdtnd needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_IFMETRIC is not set
> > -# BR2_PACKAGE_IFTOP is not set
> > -BR2_PACKAGE_IFUPDOWN_SCRIPTS=3Dy
> > -# BR2_PACKAGE_IGD2_FOR_LINUX is not set
> > -# BR2_PACKAGE_IGH_ETHERCAT is not set
> > -# BR2_PACKAGE_IGMPPROXY is not set
> > -# BR2_PACKAGE_INADYN is not set
> > -# BR2_PACKAGE_IODINE is not set
> > -
> > -#
> > -# iperf needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_IPERF3 is not set
> > -# BR2_PACKAGE_IPROUTE2 is not set
> > -# BR2_PACKAGE_IPSET is not set
> > -# BR2_PACKAGE_IPTABLES is not set
> > -# BR2_PACKAGE_IPTRAF_NG is not set
> > -# BR2_PACKAGE_IPUTILS is not set
> > -# BR2_PACKAGE_IRSSI is not set
> > -# BR2_PACKAGE_IW is not set
> > -# BR2_PACKAGE_IWD is not set
> > -# BR2_PACKAGE_JANUS_GATEWAY is not set
> > -# BR2_PACKAGE_KEEPALIVED is not set
> > -
> > -#
> > -# kismet needs a toolchain w/ threads, C++, gcc >=3D 5
> > -#
> > -# BR2_PACKAGE_KNOCK is not set
> > -# BR2_PACKAGE_KSMBD_TOOLS is not set
> > -# BR2_PACKAGE_LEAFNODE2 is not set
> > -# BR2_PACKAGE_LFT is not set
> > -
> > -#
> > -# lftp requires a toolchain w/ C++, wchar
> > -#
> > -# BR2_PACKAGE_LIGHTTPD is not set
> > -
> > -#
> > -# linknx needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_LINKS is not set
> > -
> > -#
> > -# linphone needs a toolchain w/ threads, C++, dynamic library, wchar,
> gcc >=3D 5
> > -#
> > -# BR2_PACKAGE_LINUX_ZIGBEE is not set
> > -# BR2_PACKAGE_LINUXPTP is not set
> > -# BR2_PACKAGE_LLDPD is not set
> > -# BR2_PACKAGE_LRZSZ is not set
> > -# BR2_PACKAGE_LYNX is not set
> > -# BR2_PACKAGE_MACCHANGER is not set
> > -# BR2_PACKAGE_MEMCACHED is not set
> > -# BR2_PACKAGE_MII_DIAG is not set
> > -# BR2_PACKAGE_MINI_SNMPD is not set
> > -# BR2_PACKAGE_MINIDLNA is not set
> > -# BR2_PACKAGE_MINISSDPD is not set
> > -# BR2_PACKAGE_MJPG_STREAMER is not set
> > -# BR2_PACKAGE_MODEM_MANAGER is not set
> > -BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=3Dy
> > -
> > -#
> > -# mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, dynamic
> library
> > -#
> > -
> > -#
> > -# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc
> >=3D 4.8
> > -#
> > -# BR2_PACKAGE_MOSQUITTO is not set
> > -# BR2_PACKAGE_MROUTED is not set
> > -# BR2_PACKAGE_MRP is not set
> > -# BR2_PACKAGE_MSTPD is not set
> > -# BR2_PACKAGE_MTR is not set
> > -# BR2_PACKAGE_NBD is not set
> > -# BR2_PACKAGE_NCFTP is not set
> > -# BR2_PACKAGE_NDISC6 is not set
> > -# BR2_PACKAGE_NETATALK is not set
> > -# BR2_PACKAGE_NETCALC is not set
> > -# BR2_PACKAGE_NETPLUG is not set
> > -# BR2_PACKAGE_NETSNMP is not set
> > -# BR2_PACKAGE_NETSTAT_NAT is not set
> > -
> > -#
> > -# NetworkManager needs udev /dev management and a glibc toolchain w/
> headers >=3D 4.6, dynamic library, wchar, threads, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_NFACCT is not set
> > -# BR2_PACKAGE_NFTABLES is not set
> > -# BR2_PACKAGE_NGINX is not set
> > -# BR2_PACKAGE_NGIRCD is not set
> > -# BR2_PACKAGE_NGREP is not set
> > -
> > -#
> > -# nload needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# nmap-nmap needs a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_NOIP is not set
> > -# BR2_PACKAGE_NTP is not set
> > -# BR2_PACKAGE_NTPSEC is not set
> > -# BR2_PACKAGE_NUTTCP is not set
> > -# BR2_PACKAGE_ODHCP6C is not set
> > -# BR2_PACKAGE_ODHCPLOC is not set
> > -# BR2_PACKAGE_OLSR is not set
> > -# BR2_PACKAGE_OPEN_ISCSI is not set
> > -# BR2_PACKAGE_OPEN_LLDP is not set
> > -# BR2_PACKAGE_OPEN_PLC_UTILS is not set
> > -# BR2_PACKAGE_OPENNTPD is not set
> > -# BR2_PACKAGE_OPENOBEX is not set
> > -# BR2_PACKAGE_OPENRESOLV is not set
> > -# BR2_PACKAGE_OPENSSH is not set
> > -# BR2_PACKAGE_OPENSWAN is not set
> > -# BR2_PACKAGE_OPENVPN is not set
> > -# BR2_PACKAGE_P910ND is not set
> > -# BR2_PACKAGE_PARPROUTED is not set
> > -# BR2_PACKAGE_PHIDGETWEBSERVICE is not set
> > -# BR2_PACKAGE_PHYTOOL is not set
> > -# BR2_PACKAGE_PIMD is not set
> > -# BR2_PACKAGE_PIXIEWPS is not set
> > -# BR2_PACKAGE_POUND is not set
> > -# BR2_PACKAGE_PPPD is not set
> > -# BR2_PACKAGE_PPTP_LINUX is not set
> > -# BR2_PACKAGE_PRIVOXY is not set
> > -# BR2_PACKAGE_PROFTPD is not set
> > -
> > -#
> > -# prosody needs the lua interpreter, dynamic library
> > -#
> > -# BR2_PACKAGE_PROXYCHAINS_NG is not set
> > -# BR2_PACKAGE_PTPD is not set
> > -# BR2_PACKAGE_PTPD2 is not set
> > -# BR2_PACKAGE_PURE_FTPD is not set
> > -# BR2_PACKAGE_PUTTY is not set
> > -# BR2_PACKAGE_QUAGGA is not set
> > -# BR2_PACKAGE_RADVD is not set
> > -# BR2_PACKAGE_REAVER is not set
> > -# BR2_PACKAGE_REDIR is not set
> > -# BR2_PACKAGE_RP_PPPOE is not set
> > -# BR2_PACKAGE_RPCBIND is not set
> > -# BR2_PACKAGE_RSH_REDONE is not set
> > -# BR2_PACKAGE_RSYNC is not set
> > -
> > -#
> > -# rtorrent needs a toolchain w/ C++, threads, wchar, gcc >=3D 4.9
> > -#
> > -# BR2_PACKAGE_RTPTOOLS is not set
> > -
> > -#
> > -# rygel needs python3 and a glibc toolchain w/ wchar, threads, gcc >=
=3D
> 4.9, host gcc >=3D 8
> > -#
> > -# BR2_PACKAGE_S6_DNS is not set
> > -# BR2_PACKAGE_S6_NETWORKING is not set
> > -# BR2_PACKAGE_SAMBA4 is not set
> > -
> > -#
> > -# sconeserver needs a toolchain with dynamic library, C++, NPTL
> > -#
> > -# BR2_PACKAGE_SER2NET is not set
> > -# BR2_PACKAGE_SHADOWSOCKS_LIBEV is not set
> > -
> > -#
> > -# shairport-sync needs a toolchain w/ C++, NPTL
> > -#
> > -# BR2_PACKAGE_SHELLINABOX is not set
> > -# BR2_PACKAGE_SMCROUTE is not set
> > -# BR2_PACKAGE_SNGREP is not set
> > -# BR2_PACKAGE_SNORT is not set
> > -
> > -#
> > -# snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, gc=
c
> >=3D 4.9
> > -#
> > -# BR2_PACKAGE_SOCAT is not set
> > -# BR2_PACKAGE_SOCKETCAND is not set
> > -# BR2_PACKAGE_SOFTETHER is not set
> > -# BR2_PACKAGE_SPAWN_FCGI is not set
> > -# BR2_PACKAGE_SPICE_PROTOCOL is not set
> > -
> > -#
> > -# squid needs a toolchain w/ C++, threads, gcc >=3D 4.8 not affected b=
y
> bug 64735
> > -#
> > -# BR2_PACKAGE_SSDP_RESPONDER is not set
> > -# BR2_PACKAGE_SSHGUARD is not set
> > -# BR2_PACKAGE_SSHPASS is not set
> > -# BR2_PACKAGE_SSLH is not set
> > -# BR2_PACKAGE_STRONGSWAN is not set
> > -# BR2_PACKAGE_STUNNEL is not set
> > -# BR2_PACKAGE_SURICATA is not set
> > -# BR2_PACKAGE_TCPDUMP is not set
> > -# BR2_PACKAGE_TCPING is not set
> > -# BR2_PACKAGE_TCPREPLAY is not set
> > -# BR2_PACKAGE_THTTPD is not set
> > -# BR2_PACKAGE_TINC is not set
> > -# BR2_PACKAGE_TINYPROXY is not set
> > -# BR2_PACKAGE_TINYSSH is not set
> > -# BR2_PACKAGE_TOR is not set
> > -# BR2_PACKAGE_TRACEROUTE is not set
> > -
> > -#
> > -# transmission needs a toolchain w/ dynamic library, threads, C++, gcc
> >=3D 7
> > -#
> > -# BR2_PACKAGE_TUNCTL is not set
> > -# BR2_PACKAGE_TVHEADEND is not set
> > -# BR2_PACKAGE_UACME is not set
> > -# BR2_PACKAGE_UDPCAST is not set
> > -# BR2_PACKAGE_UFTP is not set
> > -# BR2_PACKAGE_UHTTPD is not set
> > -# BR2_PACKAGE_ULOGD is not set
> > -# BR2_PACKAGE_UNBOUND is not set
> > -# BR2_PACKAGE_UQMI is not set
> > -# BR2_PACKAGE_UREDIR is not set
> > -# BR2_PACKAGE_USHARE is not set
> > -# BR2_PACKAGE_USSP_PUSH is not set
> > -# BR2_PACKAGE_VDE2 is not set
> > -
> > -#
> > -# vdr needs a toolchain w/ C++, dynamic library, NPTL, wchar, headers
> >=3D 3.9
> > -#
> > -# BR2_PACKAGE_VNSTAT is not set
> > -# BR2_PACKAGE_VPNC is not set
> > -# BR2_PACKAGE_VSFTPD is not set
> > -# BR2_PACKAGE_VTUN is not set
> > -# BR2_PACKAGE_WAVEMON is not set
> > -# BR2_PACKAGE_WIREGUARD_TOOLS is not set
> > -# BR2_PACKAGE_WIRELESS_REGDB is not set
> > -# BR2_PACKAGE_WIRELESS_TOOLS is not set
> > -
> > -#
> > -# wireshark needs a toolchain w/ wchar, threads, dynamic library, C++
> > -#
> > -# BR2_PACKAGE_WPA_SUPPLICANT is not set
> > -# BR2_PACKAGE_WPAN_TOOLS is not set
> > -# BR2_PACKAGE_XINETD is not set
> > -# BR2_PACKAGE_XL2TP is not set
> > -# BR2_PACKAGE_XTABLES_ADDONS is not set
> > -# BR2_PACKAGE_ZABBIX is not set
> > -
> > -#
> > -# zeek needs a toolchain w/ C++, wchar, threads, dynamic library, gcc
> >=3D 7, host gcc >=3D 7
> > -#
> > -
> > -#
> > -# znc needs a toolchain w/ C++, dynamic library, gcc >=3D 4.8, threads
> > -#
> > -
> > -#
> > -# Package managers
> > -#
> > -
> > -#
> > -# -------------------------------------------------------
> > -#
> > -
> > -#
> > -# Please note:
> > -#
> > -
> > -#
> > -# - Buildroot does *not* generate binary packages,
> > -#
> > -
> > -#
> > -# - Buildroot does *not* install any package database.
> > -#
> > -
> > -#
> > -# *
> > -#
> > -
> > -#
> > -# It is up to you to provide those by yourself if you
> > -#
> > -
> > -#
> > -# want to use any of those package managers.
> > -#
> > -
> > -#
> > -# *
> > -#
> > -
> > -#
> > -# See the manual:
> > -#
> > -
> > -#
> > -# http://buildroot.org/manual.html#faq-no-binary-packages
> > -#
> > -
> > -#
> > -# -------------------------------------------------------
> > -#
> > -# BR2_PACKAGE_OPKG is not set
> > -# BR2_PACKAGE_OPKG_UTILS is not set
> > -
> > -#
> > -# Real-Time
> > -#
> > -BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_XENOMAI is not set
> > -
> > -#
> > -# Security
> > -#
> > -
> > -#
> > -# apparmor needs a toolchain w/ headers >=3D 3.16, threads, C++
> > -#
> > -# BR2_PACKAGE_CHECKPOLICY is not set
> > -# BR2_PACKAGE_IMA_EVM_UTILS is not set
> > -# BR2_PACKAGE_OPTEE_CLIENT is not set
> > -# BR2_PACKAGE_PAXTEST is not set
> > -# BR2_PACKAGE_POLICYCOREUTILS is not set
> > -# BR2_PACKAGE_REFPOLICY is not set
> > -# BR2_PACKAGE_RESTORECOND is not set
> > -# BR2_PACKAGE_SELINUX_PYTHON is not set
> > -# BR2_PACKAGE_SEMODULE_UTILS is not set
> > -
> > -#
> > -# setools needs python3
> > -#
> > -BR2_PACKAGE_URANDOM_SCRIPTS=3Dy
> > -
> > -#
> > -# Shell and utilities
> > -#
> > -
> > -#
> > -# Shells
> > -#
> > -# BR2_PACKAGE_MKSH is not set
> > -# BR2_PACKAGE_NUSHELL is not set
> > -# BR2_PACKAGE_ZSH is not set
> > -
> > -#
> > -# Utilities
> > -#
> > -# BR2_PACKAGE_APG is not set
> > -# BR2_PACKAGE_AT is not set
> > -# BR2_PACKAGE_CATATONIT is not set
> > -# BR2_PACKAGE_CCRYPT is not set
> > -# BR2_PACKAGE_DIALOG is not set
> > -# BR2_PACKAGE_DTACH is not set
> > -# BR2_PACKAGE_EASY_RSA is not set
> > -# BR2_PACKAGE_EZA is not set
> > -# BR2_PACKAGE_FILE is not set
> > -# BR2_PACKAGE_GNUPG is not set
> > -BR2_PACKAGE_GNUPG2_DEPENDS=3Dy
> > -# BR2_PACKAGE_GNUPG2 is not set
> > -# BR2_PACKAGE_INOTIFY_TOOLS is not set
> > -# BR2_PACKAGE_LOCKFILE_PROGS is not set
> > -# BR2_PACKAGE_LOGROTATE is not set
> > -# BR2_PACKAGE_LOGSURFER is not set
> > -# BR2_PACKAGE_PDMENU is not set
> > -# BR2_PACKAGE_PINENTRY is not set
> > -# BR2_PACKAGE_QPRINT is not set
> > -# BR2_PACKAGE_RANGER is not set
> > -# BR2_PACKAGE_RTTY is not set
> > -# BR2_PACKAGE_SCREEN is not set
> > -# BR2_PACKAGE_SEXPECT is not set
> > -# BR2_PACKAGE_SUDO is not set
> > -# BR2_PACKAGE_TINI is not set
> > -# BR2_PACKAGE_TMUX is not set
> > -# BR2_PACKAGE_TTYD is not set
> > -# BR2_PACKAGE_WTFUTIL is not set
> > -# BR2_PACKAGE_XMLSTARLET is not set
> > -# BR2_PACKAGE_XXHASH is not set
> > -# BR2_PACKAGE_YTREE is not set
> > -
> > -#
> > -# System tools
> > -#
> > -# BR2_PACKAGE_ACL is not set
> > -# BR2_PACKAGE_ANDROID_TOOLS is not set
> > -# BR2_PACKAGE_ATOP is not set
> > -# BR2_PACKAGE_ATTR is not set
> > -BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_AUDIT is not set
> > -# BR2_PACKAGE_BALENA_ENGINE is not set
> > -# BR2_PACKAGE_BUBBLEWRAP is not set
> > -# BR2_PACKAGE_CGROUPFS_MOUNT is not set
> > -
> > -#
> > -# circus needs Python 3 and a toolchain w/ C++, threads
> > -#
> > -# BR2_PACKAGE_CONMON is not set
> > -# BR2_PACKAGE_CONTAINERD is not set
> > -# BR2_PACKAGE_CPULIMIT is not set
> > -# BR2_PACKAGE_CPULOAD is not set
> > -BR2_PACKAGE_CRIU_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_CRUN is not set
> > -# BR2_PACKAGE_DAEMON is not set
> > -# BR2_PACKAGE_DC3DD is not set
> > -
> > -#
> > -# ddrescue needs a toolchain w/ C++
> > -#
> > -# BR2_PACKAGE_DOCKER_CLI is not set
> > -
> > -#
> > -# docker-compose needs docker-cli and a toolchain w/ threads
> > -#
> > -# BR2_PACKAGE_DOCKER_ENGINE is not set
> > -# BR2_PACKAGE_EARLYOOM is not set
> > -# BR2_PACKAGE_EFIBOOTMGR is not set
> > -BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_EFIVAR is not set
> > -# BR2_PACKAGE_EMBIGGEN_DISK is not set
> > -# BR2_PACKAGE_EMLOG is not set
> > -# BR2_PACKAGE_FLUENT_BIT is not set
> > -# BR2_PACKAGE_FTOP is not set
> > -# BR2_PACKAGE_GETENT is not set
> > -# BR2_PACKAGE_GKRELLM is not set
> > -# BR2_PACKAGE_HTOP is not set
> > -# BR2_PACKAGE_IBM_SW_TPM2 is not set
> > -BR2_PACKAGE_INITSCRIPTS=3Dy
> > -
> > -#
> > -# iotop depends on python3
> > -#
> > -# BR2_PACKAGE_IPRUTILS is not set
> > -# BR2_PACKAGE_IRQBALANCE is not set
> > -# BR2_PACKAGE_KEYUTILS is not set
> > -# BR2_PACKAGE_KMOD is not set
> > -# BR2_PACKAGE_KVMTOOL is not set
> > -# BR2_PACKAGE_LIBOSTREE is not set
> > -# BR2_PACKAGE_LXC is not set
> > -BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_MAKEDUMPFILE is not set
> > -# BR2_PACKAGE_MENDER is not set
> > -# BR2_PACKAGE_MENDER_CONNECT is not set
> > -# BR2_PACKAGE_MFOC is not set
> > -# BR2_PACKAGE_MOBY_BUILDKIT is not set
> > -# BR2_PACKAGE_MONIT is not set
> > -
> > -#
> > -# multipath-tools needs udev and a toolchain w/ threads, dynamic
> library, C++
> > -#
> > -# BR2_PACKAGE_NCDU is not set
> > -# BR2_PACKAGE_NERDCTL is not set
> > -
> > -#
> > -# netifrc needs openrc as init system
> > -#
> > -# BR2_PACKAGE_NUMACTL is not set
> > -
> > -#
> > -# nut needs a toolchain w/ C++
> > -#
> > -
> > -#
> > -# pamtester depends on linux-pam
> > -#
> > -
> > -#
> > -# petitboot needs a toolchain w/ wchar, dynamic library, threads, udev
> /dev management
> > -#
> > -# BR2_PACKAGE_POLKIT is not set
> > -# BR2_PACKAGE_PROCRANK_LINUX is not set
> > -# BR2_PACKAGE_PROCS is not set
> > -# BR2_PACKAGE_PWGEN is not set
> > -# BR2_PACKAGE_QUOTA is not set
> > -# BR2_PACKAGE_QUOTATOOL is not set
> > -# BR2_PACKAGE_RAUC is not set
> > -# BR2_PACKAGE_RAUC_HAWKBIT_UPDATER is not set
> > -# BR2_PACKAGE_RUNC is not set
> > -# BR2_PACKAGE_S6 is not set
> > -# BR2_PACKAGE_S6_LINUX_INIT is not set
> > -# BR2_PACKAGE_S6_LINUX_UTILS is not set
> > -# BR2_PACKAGE_S6_PORTABLE_UTILS is not set
> > -# BR2_PACKAGE_S6_RC is not set
> > -# BR2_PACKAGE_SCRUB is not set
> > -# BR2_PACKAGE_SCRYPT is not set
> > -
> > -#
> > -# sdbus-c++ needs systemd and a toolchain w/ C++, gcc >=3D 7
> > -#
> > -
> > -#
> > -# sdbusplus needs systemd and a toolchain w/ C++, gcc >=3D 7
> > -#
> > -# BR2_PACKAGE_SEATD is not set
> > -# BR2_PACKAGE_SHADOW is not set
> > -# BR2_PACKAGE_SMACK is not set
> > +# Architecture
> > +BR2_arm=3Dy
> > +BR2_cortex_a15_a7=3Dy
> > +BR2_ARM_FPU_NEON_VFPV4=3Dy
> >
> > -#
> > -# supervisor needs a python interpreter
> > -#
> > -# BR2_PACKAGE_SWUPDATE is not set
> > -BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_TEALDEER is not set
> > -# BR2_PACKAGE_TPM_TOOLS is not set
> > -# BR2_PACKAGE_TPM2_ABRMD is not set
> > -# BR2_PACKAGE_TPM2_TOOLS is not set
> > -# BR2_PACKAGE_TPM2_TOTP is not set
> > -# BR2_PACKAGE_UNSCD is not set
> > -# BR2_PACKAGE_UTIL_LINUX is not set
> > -# BR2_PACKAGE_WATCHDOG is not set
> > -# BR2_PACKAGE_WATCHDOGD is not set
> > -# BR2_PACKAGE_XDG_DBUS_PROXY is not set
> > -# BR2_PACKAGE_XEN is not set
> > -BR2_PACKAGE_XVISOR_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_XVISOR is not set
> > +# System
> > +BR2_TARGET_GENERIC_HOSTNAME=3D"Cubieboard4"
> > +BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Cubieboard4!"
> > +BR2_TARGET_GENERIC_GETTY_PORT=3D"ttyS0"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/cubietech/cubieboard4/post-image=
.sh"
> >
> > -#
> > -# Text editors and viewers
> > -#
> > -# BR2_PACKAGE_BAT is not set
> > -# BR2_PACKAGE_ED is not set
> > -# BR2_PACKAGE_JOE is not set
> > -# BR2_PACKAGE_MC is not set
> > -# BR2_PACKAGE_MG is not set
> > -# BR2_PACKAGE_MOST is not set
> > -# BR2_PACKAGE_NANO is not set
> > -# BR2_PACKAGE_UEMACS is not set
> > +# Kernel
> > +BR2_LINUX_KERNEL=3Dy
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.6.8"
> > +BR2_LINUX_KERNEL_DEFCONFIG=3D"sunxi"
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"allwinner/sun9i-a80-cubieboard4"
> >
> > -#
> > -# Filesystem images
> > -#
> > -# BR2_TARGET_ROOTFS_AXFS is not set
> > -# BR2_TARGET_ROOTFS_BTRFS is not set
> > -# BR2_TARGET_ROOTFS_CLOOP is not set
> > -# BR2_TARGET_ROOTFS_CPIO is not set
> > -# BR2_TARGET_ROOTFS_CRAMFS is not set
> > -# BR2_TARGET_ROOTFS_EROFS is not set
> > +# Filesystem
> >   BR2_TARGET_ROOTFS_EXT2=3Dy
> > -# BR2_TARGET_ROOTFS_EXT2_2r0 is not set
> > -# BR2_TARGET_ROOTFS_EXT2_2r1 is not set
> > -# BR2_TARGET_ROOTFS_EXT2_3 is not set
> >   BR2_TARGET_ROOTFS_EXT2_4=3Dy
> > -BR2_TARGET_ROOTFS_EXT2_GEN=3D4
> > -BR2_TARGET_ROOTFS_EXT2_REV=3D1
> > -BR2_TARGET_ROOTFS_EXT2_LABEL=3D"rootfs"
> > -BR2_TARGET_ROOTFS_EXT2_SIZE=3D"60M"
> > -BR2_TARGET_ROOTFS_EXT2_INODES=3D0
> > -BR2_TARGET_ROOTFS_EXT2_INODE_SIZE=3D256
> > -BR2_TARGET_ROOTFS_EXT2_RESBLKS=3D5
> > -BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS=3D"-O ^64bit"
> > -BR2_TARGET_ROOTFS_EXT2_NONE=3Dy
> > -# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
> > -# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
> > -# BR2_TARGET_ROOTFS_EXT2_LZ4 is not set
> > -# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
> > -# BR2_TARGET_ROOTFS_EXT2_LZO is not set
> > -# BR2_TARGET_ROOTFS_EXT2_XZ is not set
> > -# BR2_TARGET_ROOTFS_EXT2_ZSTD is not set
> > -# BR2_TARGET_ROOTFS_F2FS is not set
> > -# BR2_TARGET_ROOTFS_INITRAMFS is not set
> > -# BR2_TARGET_ROOTFS_JFFS2 is not set
> > -# BR2_TARGET_ROOTFS_OCI is not set
> > -# BR2_TARGET_ROOTFS_ROMFS is not set
> > -# BR2_TARGET_ROOTFS_SQUASHFS is not set
> > -BR2_TARGET_ROOTFS_TAR=3Dy
> > -BR2_TARGET_ROOTFS_TAR_NONE=3Dy
> > -# BR2_TARGET_ROOTFS_TAR_GZIP is not set
> > -# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
> > -# BR2_TARGET_ROOTFS_TAR_LZ4 is not set
> > -# BR2_TARGET_ROOTFS_TAR_LZMA is not set
> > -# BR2_TARGET_ROOTFS_TAR_LZO is not set
> > -# BR2_TARGET_ROOTFS_TAR_XZ is not set
> > -# BR2_TARGET_ROOTFS_TAR_ZSTD is not set
> > -BR2_TARGET_ROOTFS_TAR_OPTIONS=3D""
> > -# BR2_TARGET_ROOTFS_UBI is not set
> > -# BR2_TARGET_ROOTFS_UBIFS is not set
> > -# BR2_TARGET_ROOTFS_YAFFS2 is not set
> >
> > -#
> > -# Bootloaders
> > -#
> > -# BR2_TARGET_AFBOOT_STM32 is not set
> > -# BR2_TARGET_AT91BOOTSTRAP3 is not set
> > -# BR2_TARGET_ARM_TRUSTED_FIRMWARE is not set
> > -# BR2_TARGET_BAREBOX is not set
> > -BR2_TARGET_GRUB2_ARCH_SUPPORTS=3Dy
> > -# BR2_TARGET_GRUB2 is not set
> > -# BR2_TARGET_MXS_BOOTLETS is not set
> > -# BR2_TARGET_OPTEE_OS is not set
> > -# BR2_TARGET_S500_BOOTLOADER is not set
> > -BR2_PACKAGE_SHIM_ARCH_SUPPORTS=3Dy
> > -# BR2_TARGET_SHIM is not set
> > +# Bootloader
> >   BR2_TARGET_UBOOT=3Dy
> >   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> > -# BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY is not set
> > -# BR2_TARGET_UBOOT_LATEST_VERSION is not set
> >   BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> > -# BR2_TARGET_UBOOT_CUSTOM_TARBALL is not set
> > -# BR2_TARGET_UBOOT_CUSTOM_GIT is not set
> > -# BR2_TARGET_UBOOT_CUSTOM_HG is not set
> > -# BR2_TARGET_UBOOT_CUSTOM_SVN is not set
> >   BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2021.10"
> > -BR2_TARGET_UBOOT_VERSION=3D"2021.10"
> > -BR2_TARGET_UBOOT_PATCH=3D""
> > -BR2_TARGET_UBOOT_USE_DEFCONFIG=3Dy
> > -# BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG is not set
> >   BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"Cubieboard4"
> > -BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES=3D""
> >   BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> > -# BR2_TARGET_UBOOT_NEEDS_PYTHON3 is not set
> > -# BR2_TARGET_UBOOT_NEEDS_PYLIBFDT is not set
> > -# BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS is not set
> > -# BR2_TARGET_UBOOT_NEEDS_OPENSSL is not set
> > -# BR2_TARGET_UBOOT_NEEDS_LZOP is not set
> > -# BR2_TARGET_UBOOT_NEEDS_GNUTLS is not set
> > -# BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX is not set
> > -# BR2_TARGET_UBOOT_NEEDS_XXD is not set
> > -
> > -#
> > -# U-Boot binary format
> > -#
> > -# BR2_TARGET_UBOOT_FORMAT_AIS is not set
> > -BR2_TARGET_UBOOT_FORMAT_BIN=3Dy
> > -# BR2_TARGET_UBOOT_FORMAT_DTB is not set
> > -# BR2_TARGET_UBOOT_FORMAT_DTB_BIN is not set
> > -# BR2_TARGET_UBOOT_FORMAT_NAND_BIN is not set
> > -# BR2_TARGET_UBOOT_FORMAT_ELF is not set
> > -# BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF is not set
> > -# BR2_TARGET_UBOOT_FORMAT_IMG is not set
> > -# BR2_TARGET_UBOOT_FORMAT_DTB_IMG is not set
> > -# BR2_TARGET_UBOOT_FORMAT_IMX is not set
> > -# BR2_TARGET_UBOOT_FORMAT_DTB_IMX is not set
> > -# BR2_TARGET_UBOOT_FORMAT_ITB is not set
> > -# BR2_TARGET_UBOOT_FORMAT_KWB is not set
> > -# BR2_TARGET_UBOOT_FORMAT_NAND is not set
> > -# BR2_TARGET_UBOOT_FORMAT_SB is not set
> > -# BR2_TARGET_UBOOT_FORMAT_SD is not set
> > -# BR2_TARGET_UBOOT_FORMAT_STM32 is not set
> > -# BR2_TARGET_UBOOT_FORMAT_CUSTOM is not set
> > -# BR2_TARGET_UBOOT_OMAP_IFT is not set
> > +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy
> > +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=3Dy
> > +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> >   BR2_TARGET_UBOOT_SPL=3Dy
> >   BR2_TARGET_UBOOT_SPL_NAME=3D"u-boot-sunxi-with-spl.bin"
> > -# BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC is not set
> > -BR2_TARGET_UBOOT_CUSTOM_DTS_PATH=3D""
> > -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D""
> > -
> > -#
> > -# Host utilities
> > -#
> > -# BR2_PACKAGE_HOST_ABOOTIMG is not set
> > -# BR2_PACKAGE_HOST_AESPIPE is not set
> > -# BR2_PACKAGE_HOST_AGENT_PROXY is not set
> > -# BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP is not set
> > -# BR2_PACKAGE_HOST_ANDROID_TOOLS is not set
> > -# BR2_PACKAGE_HOST_ASN1C is not set
> > -# BR2_PACKAGE_HOST_BABELTRACE2 is not set
> > -# BR2_PACKAGE_HOST_BMAP_TOOLS is not set
> > -# BR2_PACKAGE_HOST_BOOTGEN is not set
> > -# BR2_PACKAGE_HOST_BTRFS_PROGS is not set
> > -# BR2_PACKAGE_HOST_CBOOTIMAGE is not set
> > -# BR2_PACKAGE_HOST_CHECKPOLICY is not set
> > -# BR2_PACKAGE_HOST_CHECKSEC is not set
> > -# BR2_PACKAGE_HOST_CMAKE is not set
> > -BR2_HOST_CMAKE_AT_LEAST=3D"3.18"
> > -# BR2_PACKAGE_HOST_COMPOSER is not set
> > -# BR2_PACKAGE_HOST_CRAMFS is not set
> > -# BR2_PACKAGE_HOST_CRUDINI is not set
> > -# BR2_PACKAGE_HOST_CRYPTSETUP is not set
> > -# BR2_PACKAGE_HOST_DBUS_PYTHON is not set
> > -# BR2_PACKAGE_HOST_DELVE is not set
> > -# BR2_PACKAGE_HOST_DEPOT_TOOLS is not set
> > -# BR2_PACKAGE_HOST_DFU_UTIL is not set
> > -# BR2_PACKAGE_HOST_DOS2UNIX is not set
> >   BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> > -# BR2_PACKAGE_HOST_DOXYGEN is not set
> > -BR2_PACKAGE_HOST_DTC=3Dy
> > -BR2_PACKAGE_HOST_E2FSPROGS=3Dy
> > -# BR2_PACKAGE_HOST_E2TOOLS is not set
> > -# BR2_PACKAGE_HOST_ENVIRONMENT_SETUP is not set
> > -# BR2_PACKAGE_HOST_EROFS_UTILS is not set
> > -# BR2_PACKAGE_HOST_EXFATPROGS is not set
> > -# BR2_PACKAGE_HOST_F2FS_TOOLS is not set
> > -# BR2_PACKAGE_HOST_FAKETIME is not set
> > -# BR2_PACKAGE_HOST_FATCAT is not set
> > -# BR2_PACKAGE_HOST_FIRMWARE_UTILS is not set
> > -BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_HOST_FLUTTER_SDK_BIN is not set
> > -# BR2_PACKAGE_HOST_FWUP is not set
> > -# BR2_PACKAGE_HOST_GENEXT2FS is not set
> >   BR2_PACKAGE_HOST_GENIMAGE=3Dy
> > -# BR2_PACKAGE_HOST_GENPART is not set
> > -# BR2_PACKAGE_HOST_GNUPG is not set
> > -BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS=3Dy
> > -BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE1_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_HOST_GPTFDISK is not set
> > -# BR2_PACKAGE_HOST_IMAGEMAGICK is not set
> > -# BR2_PACKAGE_HOST_IMX_MKIMAGE is not set
> > -# BR2_PACKAGE_HOST_IMX_USB_LOADER is not set
> > -# BR2_PACKAGE_HOST_JQ is not set
> > -# BR2_PACKAGE_HOST_JSMIN is not set
> > -BR2_PACKAGE_HOST_KMOD=3Dy
> > -# BR2_PACKAGE_HOST_KMOD_GZ is not set
> > -# BR2_PACKAGE_HOST_KMOD_ZSTD is not set
> > -# BR2_PACKAGE_HOST_KMOD_XZ is not set
> > -# BR2_PACKAGE_HOST_LIBP11 is not set
> > -# BR2_PACKAGE_HOST_LLD is not set
> > -# BR2_PACKAGE_HOST_LPC3250LOADER is not set
> > -# BR2_PACKAGE_HOST_LTTNG_BABELTRACE is not set
> > -# BR2_PACKAGE_HOST_LZMA_ALONE is not set
> > -# BR2_PACKAGE_HOST_MENDER_ARTIFACT is not set
> > -# BR2_PACKAGE_HOST_MESON_TOOLS is not set
> > -# BR2_PACKAGE_HOST_MFGTOOLS is not set
> > -# BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR is not set
> > -# BR2_PACKAGE_HOST_MKPASSWD is not set
> > -# BR2_PACKAGE_HOST_MOBY_BUILDKIT is not set
> > -# BR2_PACKAGE_HOST_MOSQUITTO is not set
> > -# BR2_PACKAGE_HOST_MTD is not set
> >   BR2_PACKAGE_HOST_MTOOLS=3Dy
> > -# BR2_PACKAGE_HOST_MXSLDR is not set
> > -BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_HOST_NODEJS is not set
> > -BR2_PACKAGE_PROVIDES_HOST_NODEJS=3D"host-nodejs-bin"
> > -# BR2_PACKAGE_HOST_ODB is not set
> > -# BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS is not set
> > -# BR2_PACKAGE_HOST_OPENOCD is not set
> > -# BR2_PACKAGE_HOST_OPKG_UTILS is not set
> > -# BR2_PACKAGE_HOST_PAHOLE is not set
> > -# BR2_PACKAGE_HOST_PARTED is not set
> > -BR2_PACKAGE_HOST_PATCHELF=3Dy
> > -# BR2_PACKAGE_HOST_PIGZ is not set
> > -# BR2_PACKAGE_HOST_PKGCONF is not set
> > -# BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT is not set
> > -# BR2_PACKAGE_HOST_PWGEN is not set
> > -# BR2_PACKAGE_HOST_PYTHON_CYTHON is not set
> > -# BR2_PACKAGE_HOST_PYTHON_GREENLET is not set
> > -# BR2_PACKAGE_HOST_PYTHON_INIPARSE is not set
> > -# BR2_PACKAGE_HOST_PYTHON_LXML is not set
> > -# BR2_PACKAGE_HOST_PYTHON_PYYAML is not set
> > -# BR2_PACKAGE_HOST_PYTHON_SIX is not set
> > -# BR2_PACKAGE_HOST_PYTHON_XLRD is not set
> > -# BR2_PACKAGE_HOST_PYTHON3 is not set
> > -BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_HOST_QEMU is not set
> > -# BR2_PACKAGE_HOST_QORIQ_RCW is not set
> > -# BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT is not set
> > -# BR2_PACKAGE_HOST_RAUC is not set
> > -# BR2_PACKAGE_HOST_RISCV_ISA_SIM is not set
> > -# BR2_PACKAGE_HOST_RUNC is not set
> > -BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS=3Dy
> > -BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS=3Dy
> > -BR2_PACKAGE_HOST_RUSTC_ARCH=3D"armv7"
> > -BR2_PACKAGE_HOST_RUSTC_ABI=3D"eabihf"
> > -# BR2_PACKAGE_HOST_RUSTC is not set
> > -BR2_PACKAGE_PROVIDES_HOST_RUSTC=3D"host-rust-bin"
> > -# BR2_PACKAGE_HOST_SAM_BA is not set
> > -# BR2_PACKAGE_HOST_SDBUS_CPP is not set
> > -# BR2_PACKAGE_HOST_SDBUSPLUS is not set
> > -# BR2_PACKAGE_HOST_SENTRY_CLI is not set
> > -# BR2_PACKAGE_HOST_SLOCI_IMAGE is not set
> > -# BR2_PACKAGE_HOST_SQUASHFS is not set
> > -# BR2_PACKAGE_HOST_SUNXI_TOOLS is not set
> > -# BR2_PACKAGE_HOST_SWIG is not set
> > -# BR2_PACKAGE_HOST_SWUGENERATOR is not set
> > -# BR2_PACKAGE_HOST_TEGRARCM is not set
> > -BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS=3Dy
> > -# BR2_PACKAGE_HOST_TI_CGT_PRU is not set
> >   BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy
> > -# BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT is not set
> > -# BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE is not set
> > -# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT is not set
> > -BR2_PACKAGE_HOST_UTIL_LINUX=3Dy
> > -# BR2_PACKAGE_HOST_UTP_COM is not set
> > -# BR2_PACKAGE_HOST_UUU is not set
> > -# BR2_PACKAGE_HOST_VBOOT_UTILS is not set
> > -# BR2_PACKAGE_HOST_XORRISO is not set
> > -# BR2_PACKAGE_HOST_ZIP is not set
> > -# BR2_PACKAGE_HOST_ZSTD is not set
> > -
> > -#
> > -# Legacy config options
> > -#
> > -
> > -#
> > -# Legacy options removed in 2023.11
> > -#
> > -# BR2_PACKAGE_PYTHON_PYXB is not set
> > -# BR2_PACKAGE_OPENJDK_VERSION_11 is not set
> > -# BR2_KERNEL_HEADERS_6_4 is not set
> > -# BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS is not set
> > -# BR2_GDB_VERSION_10 is not set
> > -
> > -#
> > -# Legacy options removed in 2023.08
> > -#
> > -# BR2_TARGET_LPC32XXCDL is not set
> > -# BR2_BINUTILS_VERSION_2_38_X is not set
> > -# BR2_GCC_VERSION_10_X is not set
> > -# BR2_KERNEL_HEADERS_6_3 is not set
> > -# BR2_PACKAGE_TOVID is not set
> > -# BR2_PACKAGE_LIBASPLIB is not set
> > -# BR2_PACKAGE_OCF_LINUX is not set
> > -# BR2_BINUTILS_VERSION_2_37_X is not set
> > -
> > -#
> > -# Legacy options removed in 2023.05
> > -#
> > -# BR2_KERNEL_HEADERS_6_2 is not set
> > -# BR2_PACKAGE_ATK is not set
> > -# BR2_PACKAGE_AT_SPI2_ATK is not set
> > -# BR2_PACKAGE_OPTEE_BENCHMARK is not set
> > -# BR2_PACAKGE_OPENFPGALOADER_CMSIS is not set
> > -
> > -#
> > -# Legacy options removed in 2023.02
> > -#
> > -# BR2_PACKAGE_PUGIXML_HEADER_ONLY is not set
> > -# BR2_PACKAGE_UCCP420WLAN is not set
> > -# BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES is not set
> > -# BR2_KERNEL_HEADERS_6_0 is not set
> > -# BR2_KERNEL_HEADERS_4_9 is not set
> > -# BR2_PACKAGE_DOCKER_PROXY is not set
> > -# BR2_PACKAGE_PYTHON_BUNCH is not set
> > -# BR2_TARGET_GUMMIBOOT is not set
> > -# BR2_PACKAGE_IPUTILS_NINFOD is not set
> > -# BR2_PACKAGE_IPUTILS_RARPD is not set
> > -# BR2_PACKAGE_IPUTILS_RDISC is not set
> > -# BR2_PACKAGE_IPUTILS_RDISC_SERVER is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT is not set
> > -# BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 is not set
> > -# BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV is not set
> > -BR2_PACKAGE_QEMU_CUSTOM_TARGETS=3D""
> > -# BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD is not set
> > -# BR2_TARGET_SUN20I_D1_SPL is not set
> > -# BR2_PACKAGE_PYTHON_M2R is not set
> > -# BR2_PACKAGE_MESA3D_XVMC is not set
> > -# BR2_KERNEL_HEADERS_5_19 is not set
> > -# BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA is not set
> > -# BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT is not set
> > -# BR2_PACKAGE_USBREDIR_SERVER is not set
> > -
> > -#
> > -# Legacy options removed in 2022.11
> > -#
> > -# BR2_BINUTILS_VERSION_2_36_X is not set
> > -# BR2_PACKAGE_RABBITMQ_SERVER is not set
> > -# BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5 is not set
> > -# BR2_PACKAGE_LIBDCADEC is not set
> > -# BR2_KERNEL_HEADERS_5_17 is not set
> > -# BR2_iwmmxt is not set
> > -# BR2_PACKAGE_UHD_N230 is not set
> > -# BR2_PACKAGE_UHD_RFNOC is not set
> > -# BR2_PACKAGE_GPSD_OLDSTYLE is not set
> > -# BR2_GDB_VERSION_9_2 is not set
> > -
> > -#
> > -# Legacy options removed in 2022.08
> > -#
> > -# BR2_ECLIPSE_REGISTER is not set
> > -# BR2_csky is not set
> > -# BR2_PACKAGE_MESA3D_DRI_DRIVER_I915 is not set
> > -# BR2_PACKAGE_MESA3D_DRI_DRIVER_I965 is not set
> > -# BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU is not set
> > -# BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON is not set
> > -# BR2_GCC_VERSION_9_X is not set
> > -# BR2_PACKAGE_PHP_EXT_WDDX is not set
> > -# BR2_nds32 is not set
> > -# BR2_PACKAGE_RTL8723BS is not set
> > -
> > -#
> > -# Legacy options removed in 2022.05
> > -#
> > -# BR2_PACKAGE_KTAP is not set
> > -# BR2_KERNEL_HEADERS_5_16 is not set
> > -# BR2_KERNEL_HEADERS_4_4 is not set
> > -# BR2_BINUTILS_VERSION_2_32_X is not set
> > -# BR2_sh2a is not set
> > -# BR2_BINUTILS_VERSION_2_35_X is not set
> > -# BR2_PACKAGE_BOOST_LAYOUT_TAGGED is not set
> > -# BR2_PACKAGE_BOOST_LAYOUT_VERSIONED is not set
> > -
> > -#
> > -# Legacy options removed in 2022.02
> > -#
> > -BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS=3D""
> > -# BR2_PACKAGE_LIBCURL_LIBNSS is not set
> > -# BR2_PACKAGE_WESTON_DEFAULT_FBDEV is not set
> > -# BR2_PACKAGE_WESTON_FBDEV is not set
> > -# BR2_PACKAGE_PYTHON_PYCLI is not set
> > -# BR2_PACKAGE_LINUX_TOOLS_BPFTOOL is not set
> > -# BR2_TARGET_UBOOT_NEEDS_PYTHON2 is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS is not set
> > -# BR2_PACKAGE_PYTHON_FUNCTOOLS32 is not set
> > -# BR2_PACKAGE_PYTHON_ENUM34 is not set
> > -# BR2_PACKAGE_PYTHON_ENUM is not set
> > -# BR2_PACKAGE_PYTHON_DIALOG is not set
> > -# BR2_PACKAGE_PYTHON_CONFIGOBJ is not set
> > -# BR2_PACKAGE_PYTHON_YIELDFROM is not set
> > -# BR2_PACKAGE_PYTHON_TYPING is not set
> > -# BR2_PACKAGE_PYTHON_SUBPROCESS32 is not set
> > -# BR2_PACKAGE_PYTHON_SINGLEDISPATCH is not set
> > -# BR2_PACKAGE_PYTHON_PYRO is not set
> > -# BR2_PACKAGE_PYTHON_PYPCAP is not set
> > -# BR2_PACKAGE_PYTHON_PATHLIB2 is not set
> > -# BR2_PACKAGE_PYTHON_PAM is not set
> > -# BR2_PACKAGE_PYTHON_NFC is not set
> > -# BR2_PACKAGE_PYTHON_MAD is not set
> > -# BR2_PACKAGE_PYTHON_IPADDRESS is not set
> > -# BR2_PACKAGE_PYTHON_IPADDR is not set
> > -# BR2_PACKAGE_PYTHON_ID3 is not set
> > -# BR2_PACKAGE_PYTHON_FUTURES is not set
> > -# BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME is not set
> > -# BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE is not set
> > -# BR2_PACKAGE_PYTHON_BACKPORTS_ABC is not set
> > -# BR2_PACKAGE_PYTHON is not set
> > -# BR2_TARGET_UBOOT_ZYNQ_IMAGE is not set
> > -# BR2_PACKAGE_RPI_BT_FIRMWARE is not set
> > -# BR2_PACKAGE_RPI_WIFI_FIRMWARE is not set
> > -# BR2_PACKAGE_HOST_GDB_PYTHON is not set
> > -# BR2_PACKAGE_GSTREAMER1_MM is not set
> > -# BR2_KERNEL_HEADERS_5_14 is not set
> > -# BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE is not set
> > -# BR2_PACKAGE_CIVETWEB_WITH_LUA is not set
> > -# BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER is not set
> > -# BR2_PACKAGE_SUNXI_MALI_MAINLINE is not set
> > -# BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2 is not set
> > -# BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1 is not set
> > -# BR2_PACKAGE_QT5WEBKIT_EXAMPLES is not set
> > -# BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE is not se=
t
> > -# BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE is not set
> > -# BR2_PACKAGE_IPUTILS_TFTPD is not set
> > -# BR2_PACKAGE_IPUTILS_TRACEROUTE6 is not set
> > -# BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE is not set
> > -# BR2_PACKAGE_MPD_UPNP is not set
> > -
> > -#
> > -# Legacy options removed in 2021.11
> > -#
> > -# BR2_OPENJDK_VERSION_LTS is not set
> > -# BR2_OPENJDK_VERSION_LATEST is not set
> > -# BR2_PACKAGE_MPD_TIDAL is not set
> > -# BR2_PACKAGE_MROUTED_RSRR is not set
> > -# BR2_BINUTILS_VERSION_CSKY is not set
> > -# BR2_GCC_VERSION_CSKY is not set
> > -# BR2_PACKAGE_CANFESTIVAL is not set
> > -# BR2_PACKAGE_NMAP_NDIFF is not set
> > -# BR2_GDB_VERSION_8_3 is not set
> > -# BR2_PACKAGE_PYTHON_MELD3 is not set
> > -# BR2_PACKAGE_STRONGSWAN_EAP is not set
> > -# BR2_PACKAGE_GNURADIO_PAGER is not set
> > -# BR2_KERNEL_HEADERS_5_11 is not set
> > -# BR2_KERNEL_HEADERS_5_12 is not set
> > -# BR2_KERNEL_HEADERS_5_13 is not set
> > -
> > -#
> > -# Legacy options removed in 2021.08
> > -#
> > -BR2_TARGET_GRUB2_BUILTIN_MODULES=3D""
> > -BR2_TARGET_GRUB2_BUILTIN_CONFIG=3D""
> > -# BR2_PACKAGE_LIBMCRYPT is not set
> > -# BR2_PACKAGE_MCRYPT is not set
> > -# BR2_PACKAGE_PHP_EXT_MCRYPT is not set
> > -# BR2_BINUTILS_VERSION_2_34_X is not set
> > -# BR2_PACKAGE_LIBSOIL is not set
> > -# BR2_PACKAGE_CLAPACK is not set
> > -# BR2_PACKAGE_SPIDERMONKEY is not set
> > -# BR2_PACKAGE_KODI_LIBVA is not set
> > -# BR2_PACKAGE_PYTHON_COHERENCE is not set
> > -# BR2_PACKAGE_PHP_EXT_XMLRPC is not set
> > -# BR2_GCC_VERSION_8_X is not set
> > -
> > -#
> > -# Legacy options removed in 2021.05
> > -#
> > -# BR2_PACKAGE_UDISKS_LVM2 is not set
> > -# BR2_PACKAGE_LVM2_APP_LIBRARY is not set
> > -# BR2_PACKAGE_LVM2_LVMETAD is not set
> > -# BR2_PACKAGE_MONKEY is not set
> > -# BR2_PACKAGE_DOCKER_CONTAINERD is not set
> > -# BR2_PACKAGE_IOSTAT is not set
> > -# BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE is not set
> > -# BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV is not set
> > -# BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_KBD is not set
> > -# BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_MOUSE is not set
> > -# BR2_PACKAGE_MESA3D_OSMESA_CLASSIC is not set
> > -# BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST is not set
> > -# BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH is not set
> > -
> > -#
> > -# Legacy options removed in 2021.02
> > -#
> > -# BR2_PACKAGE_MPD_AUDIOFILE is not set
> > -# BR2_PACKAGE_AUDIOFILE is not set
> > -# BR2_BINUTILS_VERSION_2_33_X is not set
> > -# BR2_PACKAGE_LIBUPNP18 is not set
> > -# BR2_PACKAGE_BOA is not set
> > -# BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA is not set
> > -# BR2_GDB_VERSION_8_2 is not set
> > -# BR2_PACKAGE_HOST_RCW is not set
> > -# BR2_KERNEL_HEADERS_5_9 is not set
> > -# BR2_KERNEL_HEADERS_5_8 is not set
> > -# BR2_powerpc_601 is not set
> > -# BR2_PACKAGE_TI_SGX_LIBGBM is not set
> > -# BR2_PACKAGE_IPSEC_TOOLS is not set
> > -
> > -#
> > -# Legacy options removed in 2020.11
> > -#
> > -# BR2_PACKAGE_GPSD_FIXED_PORT_SPEED is not set
> > -# BR2_PACKAGE_GPSD_RECONFIGURE is not set
> > -# BR2_PACKAGE_GPSD_CONTROLSEND is not set
> > -# BR2_PACKAGE_OPENCV is not set
> > -# BR2_PACKAGE_LIBCROCO is not set
> > -# BR2_PACKAGE_BELLAGIO is not set
> > -# BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY is not set
> > -# BR2_TARGET_UBOOT_BOOT_SCRIPT is not set
> > -# BR2_TARGET_UBOOT_ENVIMAGE is not set
> > -# BR2_PACKAGE_KISMET_CLIENT is not set
> > -# BR2_PACKAGE_KISMET_DRONE is not set
> > -# BR2_GCC_VERSION_7_X is not set
> > -# BR2_PACKAGE_GST1_VALIDATE is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF is not set
> > -# BR2_PACKAGE_GQVIEW is not set
> > -# BR2_PACKAGE_WESTON_IMX is not set
> > -# BR2_KERNEL_HEADERS_5_7 is not set
> > -# BR2_PACKAGE_TINYHTTPD is not set
> > -# BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX is not set
> > -# BR2_PACKAGE_AMD_CATALYST is not set
> > -# BR2_PACKAGE_NVIDIA_TEGRA23 is not set
> > -# BR2_GDB_VERSION_8_1 is not set
> > -
> > -#
> > -# Legacy options removed in 2020.08
> > -#
> > -# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64 is not set
> > -# BR2_KERNEL_HEADERS_5_6 is not set
> > -# BR2_KERNEL_HEADERS_5_5 is not set
> > -# BR2_BINUTILS_VERSION_2_31_X is not set
> > -# BR2_PACKAGE_KODI_PERIPHERAL_STEAMCONTROLLER is not set
> > -
> > -#
> > -# Legacy options removed in 2020.05
> > -#
> > -# BR2_PACKAGE_WIRINGPI is not set
> > -# BR2_PACKAGE_PYTHON_PYCRYPTO is not set
> > -# BR2_PACKAGE_MTDEV2TUIO is not set
> > -# BR2_PACKAGE_EZXML is not set
> > -# BR2_PACKAGE_COLLECTD_LVM is not set
> > -# BR2_PACKAGE_PYTHON_PYASN is not set
> > -# BR2_PACKAGE_PYTHON_PYASN_MODULES is not set
> > -# BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174 is not set
> > -# BR2_PACKAGE_QT5CANVAS3D is not set
> > -# BR2_PACKAGE_KODI_LIBTHEORA is not set
> > -# BR2_PACKAGE_CEGUI06 is not set
> > -# BR2_GCC_VERSION_5_X is not set
> > -
> > -#
> > -# Legacy options removed in 2020.02
> > -#
> > -# BR2_PACKAGE_JAMVM is not set
> > -# BR2_PACKAGE_CLASSPATH is not set
> > -# BR2_PACKAGE_QT5_VERSION_5_6 is not set
> > -# BR2_PACKAGE_CURL is not set
> > -# BR2_PACKAGE_GSTREAMER is not set
> > -# BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS is not set
> > -# BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_NV_SAMPLE_APPS is not set
> > -# BR2_PACKAGE_FREERDP_GSTREAMER is not set
> > -# BR2_PACKAGE_OPENCV3_WITH_GSTREAMER is not set
> > -# BR2_PACKAGE_OPENCV_WITH_GSTREAMER is not set
> > -# BR2_PACKAGE_LIBPLAYER is not set
> > -# BR2_GCC_VERSION_OR1K is not set
> > -# BR2_PACKAGE_BLUEZ_UTILS is not set
> > -# BR2_PACKAGE_GADGETFS_TEST is not set
> > -# BR2_PACKAGE_FIS is not set
> > -BR2_PACKAGE_REFPOLICY_POLICY_VERSION=3D""
> > -# BR2_PACKAGE_CELT051 is not set
> > -# BR2_PACKAGE_WIREGUARD is not set
> > -# BR2_PACKAGE_PERL_NET_PING is not set
> > -# BR2_PACKAGE_PERL_MIME_BASE64 is not set
> > -# BR2_PACKAGE_PERL_DIGEST_MD5 is not set
> > -# BR2_PACKAGE_ERLANG_P1_ICONV is not set
> > -# BR2_KERNEL_HEADERS_5_3 is not set
> > -# BR2_PACKAGE_PYTHON_SCAPY3K is not set
> > -# BR2_BINUTILS_VERSION_2_30_X is not set
> > -# BR2_PACKAGE_RPI_USERLAND_START_VCFILED is not set
> > -# BR2_PACKAGE_TI_SGX_KM_AM335X is not set
> > -# BR2_PACKAGE_TI_SGX_KM_AM437X is not set
> > -# BR2_PACKAGE_TI_SGX_KM_AM4430 is not set
> > -# BR2_PACKAGE_TI_SGX_KM_AM5430 is not set
> > -
> > -#
> > -# Legacy options removed in 2019.11
> > -#
> > -# BR2_PACKAGE_OPENVMTOOLS_PROCPS is not set
> > -# BR2_PACKAGE_ALLJOYN is not set
> > -# BR2_PACKAGE_ALLJOYN_BASE is not set
> > -# BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL is not set
> > -# BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION is not set
> > -# BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING is not set
> > -# BR2_PACKAGE_ALLJOYN_TCL_BASE is not set
> > -# BR2_PACKAGE_ALLJOYN_TCL is not set
> > -BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS=3D""
> > -# BR2_PACKAGE_PYTHON_PYSNMP_APPS is not set
> > -# BR2_KERNEL_HEADERS_5_2 is not set
> > -# BR2_TARGET_RISCV_PK is not set
> > -# BR2_PACKAGE_SQLITE_STAT3 is not set
> > -# BR2_KERNEL_HEADERS_5_1 is not set
> > -# BR2_PACKAGE_DEVMEM2 is not set
> > -# BR2_PACKAGE_USTR is not set
> > -# BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE is not set
> > -# BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE is not set
> > -# BR2_PACKAGE_KODI_AUDIODECODER_OPUS is not set
> > -# BR2_PACKAGE_MESA3D_OSMESA is not set
> > -# BR2_PACKAGE_HOSTAPD_DRIVER_RTW is not set
> > -# BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW is not set
> > -# BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD is not set
> > -
> > -#
> > -# Legacy options removed in 2019.08
> > -#
> > -# BR2_TARGET_TS4800_MBRBOOT is not set
> > -# BR2_PACKAGE_LIBAMCODEC is not set
> > -# BR2_PACKAGE_ODROID_SCRIPTS is not set
> > -# BR2_PACKAGE_ODROID_MALI is not set
> > -# BR2_PACKAGE_KODI_PLATFORM_AML is not set
> > -# BR2_GCC_VERSION_6_X is not set
> > -# BR2_GCC_VERSION_4_9_X is not set
> > -# BR2_GDB_VERSION_7_12 is not set
> > -# BR2_PACKAGE_XAPP_MKFONTDIR is not set
> > -# BR2_GDB_VERSION_8_0 is not set
> > -# BR2_KERNEL_HEADERS_4_20 is not set
> > -# BR2_KERNEL_HEADERS_5_0 is not set
> > -
> > -#
> > -# Legacy options removed in 2019.05
> > -#
> > -# BR2_CSKY_DSP is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD is not set
> > -# BR2_PACKAGE_LUNIT is not set
> > -# BR2_PACKAGE_FFMPEG_FFSERVER is not set
> > -# BR2_PACKAGE_LIBUMP is not set
> > -# BR2_PACKAGE_SUNXI_MALI is not set
> > -# BR2_BINUTILS_VERSION_2_29_X is not set
> > -# BR2_BINUTILS_VERSION_2_28_X is not set
> > -# BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK is not set
> > -
> > -#
> > -# Legacy options removed in 2019.02
> > -#
> > -# BR2_PACKAGE_QT is not set
> > -# BR2_PACKAGE_QTUIO is not set
> > -# BR2_PACKAGE_PINENTRY_QT4 is not set
> > -# BR2_PACKAGE_POPPLER_QT is not set
> > -# BR2_PACKAGE_OPENCV3_WITH_QT is not set
> > -# BR2_PACKAGE_OPENCV_WITH_QT is not set
> > -# BR2_PACKAGE_AMD_CATALYST_CCCLE is not set
> > -# BR2_PACKAGE_SDL_QTOPIA is not set
> > -# BR2_PACKAGE_PYTHON_PYQT is not set
> > -# BR2_PACKAGE_LUACRYPTO is not set
> > -# BR2_PACKAGE_TN5250 is not set
> > -# BR2_PACKAGE_BOOST_SIGNALS is not set
> > -# BR2_PACKAGE_FFTW_PRECISION_SINGLE is not set
> > -# BR2_PACKAGE_FFTW_PRECISION_DOUBLE is not set
> > -# BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE is not set
> > -# BR2_PACKAGE_LUA_5_2 is not set
> > -# BR2_TARGET_GENERIC_PASSWD_MD5 is not set
> > -
> > -#
> > -# Legacy options removed in 2018.11
> > -#
> > -# BR2_TARGET_XLOADER is not set
> > -# BR2_PACKAGE_TIDSP_BINARIES is not set
> > -# BR2_PACKAGE_DSP_TOOLS is not set
> > -# BR2_PACKAGE_GST_DSP is not set
> > -# BR2_PACKAGE_BOOTUTILS is not set
> > -# BR2_PACKAGE_EXPEDITE is not set
> > -# BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT is not set
> > -# BR2_KERNEL_HEADERS_4_10 is not set
> > -# BR2_KERNEL_HEADERS_4_11 is not set
> > -# BR2_KERNEL_HEADERS_4_12 is not set
> > -# BR2_KERNEL_HEADERS_4_13 is not set
> > -# BR2_KERNEL_HEADERS_4_15 is not set
> > -# BR2_KERNEL_HEADERS_4_17 is not set
> > -# BR2_PACKAGE_LIBNFTNL_XML is not set
> > -# BR2_KERNEL_HEADERS_3_2 is not set
> > -# BR2_KERNEL_HEADERS_4_1 is not set
> > -# BR2_KERNEL_HEADERS_4_16 is not set
> > -# BR2_KERNEL_HEADERS_4_18 is not set
> > -
> > -#
> > -# Legacy options removed in 2018.08
> > -#
> > -# BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT is not set
> > -# BR2_PACKAGE_XPROTO_APPLEWMPROTO is not set
> > -# BR2_PACKAGE_XPROTO_BIGREQSPROTO is not set
> > -# BR2_PACKAGE_XPROTO_COMPOSITEPROTO is not set
> > -# BR2_PACKAGE_XPROTO_DAMAGEPROTO is not set
> > -# BR2_PACKAGE_XPROTO_DMXPROTO is not set
> > -# BR2_PACKAGE_XPROTO_DRI2PROTO is not set
> > -# BR2_PACKAGE_XPROTO_DRI3PROTO is not set
> > -# BR2_PACKAGE_XPROTO_FIXESPROTO is not set
> > -# BR2_PACKAGE_XPROTO_FONTCACHEPROTO is not set
> > -# BR2_PACKAGE_XPROTO_FONTSPROTO is not set
> > -# BR2_PACKAGE_XPROTO_GLPROTO is not set
> > -# BR2_PACKAGE_XPROTO_INPUTPROTO is not set
> > -# BR2_PACKAGE_XPROTO_KBPROTO is not set
> > -# BR2_PACKAGE_XPROTO_PRESENTPROTO is not set
> > -# BR2_PACKAGE_XPROTO_RANDRPROTO is not set
> > -# BR2_PACKAGE_XPROTO_RECORDPROTO is not set
> > -# BR2_PACKAGE_XPROTO_RENDERPROTO is not set
> > -# BR2_PACKAGE_XPROTO_RESOURCEPROTO is not set
> > -# BR2_PACKAGE_XPROTO_SCRNSAVERPROTO is not set
> > -# BR2_PACKAGE_XPROTO_VIDEOPROTO is not set
> > -# BR2_PACKAGE_XPROTO_WINDOWSWMPROTO is not set
> > -# BR2_PACKAGE_XPROTO_XCMISCPROTO is not set
> > -# BR2_PACKAGE_XPROTO_XEXTPROTO is not set
> > -# BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO is not set
> > -# BR2_PACKAGE_XPROTO_XF86DGAPROTO is not set
> > -# BR2_PACKAGE_XPROTO_XF86DRIPROTO is not set
> > -# BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO is not set
> > -# BR2_PACKAGE_XPROTO_XINERAMAPROTO is not set
> > -# BR2_PACKAGE_XPROTO_XPROTO is not set
> > -# BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2 is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11 is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123 is not set
> > -# BR2_GDB_VERSION_7_11 is not set
> > -# BR2_GDB_VERSION_7_10 is not set
> > -
> > -#
> > -# Legacy options removed in 2018.05
> > -#
> > -# BR2_PACKAGE_MEDIAART_BACKEND_NONE is not set
> > -# BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF is not set
> > -# BR2_PACKAGE_MEDIAART_BACKEND_QT is not set
> > -# BR2_PACKAGE_TI_SGX_AM335X is not set
> > -# BR2_PACKAGE_TI_SGX_AM437X is not set
> > -# BR2_PACKAGE_TI_SGX_AM4430 is not set
> > -# BR2_PACKAGE_TI_SGX_AM5430 is not set
> > -# BR2_PACKAGE_JANUS_AUDIO_BRIDGE is not set
> > -# BR2_PACKAGE_JANUS_ECHO_TEST is not set
> > -# BR2_PACKAGE_JANUS_RECORDPLAY is not set
> > -# BR2_PACKAGE_JANUS_SIP_GATEWAY is not set
> > -# BR2_PACKAGE_JANUS_STREAMING is not set
> > -# BR2_PACKAGE_JANUS_TEXT_ROOM is not set
> > -# BR2_PACKAGE_JANUS_VIDEO_CALL is not set
> > -# BR2_PACKAGE_JANUS_VIDEO_ROOM is not set
> > -# BR2_PACKAGE_JANUS_MQTT is not set
> > -# BR2_PACKAGE_JANUS_RABBITMQ is not set
> > -# BR2_PACKAGE_JANUS_REST is not set
> > -# BR2_PACKAGE_JANUS_UNIX_SOCKETS is not set
> > -# BR2_PACKAGE_JANUS_WEBSOCKETS is not set
> > -# BR2_PACKAGE_IPSEC_SECCTX_DISABLE is not set
> > -# BR2_PACKAGE_IPSEC_SECCTX_ENABLE is not set
> > -# BR2_PACKAGE_IPSEC_SECCTX_KERNEL is not set
> > -# BR2_PACKAGE_LIBTFDI_CPP is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_BLITZER is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_FLICK is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_REDMOND is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_START is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_SUNNY is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS is not set
> > -# BR2_PACKAGE_JQUERY_UI_THEME_VADER is not set
> > -# BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH is not set
> > -# BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI is not set
> > -# BR2_PACKAGE_BLUEZ5_PLUGINS_NFC is not set
> > -# BR2_PACKAGE_BLUEZ5_PLUGINS_SAP is not set
> > -# BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS is not set
> > -# BR2_PACKAGE_TRANSMISSION_REMOTE is not set
> > -# BR2_PACKAGE_LIBKCAPI_APPS is not set
> > -# BR2_PACKAGE_MPLAYER is not set
> > -# BR2_PACKAGE_MPLAYER_MPLAYER is not set
> > -# BR2_PACKAGE_MPLAYER_MENCODER is not set
> > -# BR2_PACKAGE_LIBPLAYER_MPLAYER is not set
> > -# BR2_PACKAGE_IQVLINUX is not set
> > -# BR2_BINFMT_FLAT_SEP_DATA is not set
> > -# BR2_bfin is not set
> > -# BR2_PACKAGE_KODI_ADSP_BASIC is not set
> > -# BR2_PACKAGE_KODI_ADSP_FREESURROUND is not set
> > -
> > -#
> > -# Legacy options removed in 2018.02
> > -#
> > -# BR2_KERNEL_HEADERS_3_4 is not set
> > -# BR2_KERNEL_HEADERS_3_10 is not set
> > -# BR2_KERNEL_HEADERS_3_12 is not set
> > -# BR2_BINUTILS_VERSION_2_27_X is not set
> > -# BR2_PACKAGE_EEPROG is not set
> > -# BR2_PACKAGE_GNUPG2_GPGV2 is not set
> > -# BR2_PACKAGE_IMX_GPU_VIV_APITRACE is not set
> > -# BR2_PACKAGE_IMX_GPU_VIV_G2D is not set
> > -
> > -#
> > -# Legacy options removed in 2017.11
> > -#
> > -# BR2_PACKAGE_RFKILL is not set
> > -# BR2_PACKAGE_UTIL_LINUX_RESET is not set
> > -# BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW is not set
> > -# BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND is not set
> > -# BR2_PACKAGE_SEPOLGEN is not set
> > -# BR2_PACKAGE_OPENOBEX_BLUEZ is not set
> > -# BR2_PACKAGE_OPENOBEX_LIBUSB is not set
> > -# BR2_PACKAGE_OPENOBEX_APPS is not set
> > -# BR2_PACKAGE_OPENOBEX_SYSLOG is not set
> > -# BR2_PACKAGE_OPENOBEX_DUMP is not set
> > -# BR2_PACKAGE_AICCU is not set
> > -# BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS is not set
> > -
> > -#
> > -# Legacy options removed in 2017.08
> > -#
> > -# BR2_TARGET_GRUB is not set
> > -# BR2_PACKAGE_SIMICSFS is not set
> > -# BR2_BINUTILS_VERSION_2_26_X is not set
> > -BR2_XTENSA_OVERLAY_DIR=3D""
> > -BR2_XTENSA_CUSTOM_NAME=3D""
> > -# BR2_PACKAGE_HOST_MKE2IMG is not set
> > -BR2_TARGET_ROOTFS_EXT2_BLOCKS=3D0
> > -BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES=3D0
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDXAPARSE is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DATAURISRC is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DCCP is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HDVPARSE is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MVE is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PATCHDETECT is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD is not set
> > -# BR2_STRIP_none is not set
> > -# BR2_PACKAGE_BEECRYPT_CPP is not set
> > -# BR2_PACKAGE_SPICE_CLIENT is not set
> > -# BR2_PACKAGE_SPICE_GUI is not set
> > -# BR2_PACKAGE_SPICE_TUNNEL is not set
> > -# BR2_PACKAGE_INPUT_TOOLS is not set
> > -# BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH is not set
> > -# BR2_PACKAGE_INPUT_TOOLS_JSCAL is not set
> > -# BR2_PACKAGE_INPUT_TOOLS_JSTEST is not set
> > -# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH is not set
> > -# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86 is not set
> > -# BR2_GCC_VERSION_4_8_X is not set
> > -
> > -#
> > -# Legacy options removed in 2017.05
> > -#
> > -# BR2_PACKAGE_SUNXI_MALI_R2P4 is not set
> > -# BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT is not set
> > -# BR2_PACKAGE_NODEJS_MODULES_EXPRESS is not set
> > -# BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL is not set
> > -# BR2_PACKAGE_OPENOCD_FT2XXX is not set
> > -# BR2_PACKAGE_KODI_RTMPDUMP is not set
> > -# BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN is not set
> > -# BR2_PACKAGE_PORTMAP is not set
> > -# BR2_BINUTILS_VERSION_2_25_X is not set
> > -# BR2_TOOLCHAIN_BUILDROOT_INET_RPC is not set
> > -BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS=3D0
> > -# BR2_PACKAGE_SYSTEMD_KDBUS is not set
> > -# BR2_PACKAGE_POLARSSL is not set
> > -# BR2_NBD_CLIENT is not set
> > -# BR2_NBD_SERVER is not set
> > -# BR2_PACKAGE_GMOCK is not set
> > -# BR2_KERNEL_HEADERS_4_8 is not set
> > -# BR2_KERNEL_HEADERS_3_18 is not set
> > -# BR2_GLIBC_VERSION_2_22 is not set
> > -
> > -#
> > -# Legacy options removed in 2017.02
> > -#
> > -# BR2_PACKAGE_PERL_DB_FILE is not set
> > -# BR2_KERNEL_HEADERS_4_7 is not set
> > -# BR2_KERNEL_HEADERS_4_6 is not set
> > -# BR2_KERNEL_HEADERS_4_5 is not set
> > -# BR2_KERNEL_HEADERS_3_14 is not set
> > -# BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS is not set
> > -# BR2_UCLIBC_INSTALL_TEST_SUITE is not set
> > -# BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX is not set
> > -# BR2_PACKAGE_MAKEDEVS is not set
> > -# BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A is not set
> > -# BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE is not set
> > -# BR2_PACKAGE_SNOWBALL_HDMISERVICE is not set
> > -# BR2_PACKAGE_SNOWBALL_INIT is not set
> > -# BR2_GDB_VERSION_7_9 is not set
> > -
> > -#
> > -# Legacy options removed in 2016.11
> > -#
> > -# BR2_PACKAGE_PHP_SAPI_CLI_CGI is not set
> > -# BR2_PACKAGE_PHP_SAPI_CLI_FPM is not set
> > -# BR2_PACKAGE_WVSTREAMS is not set
> > -# BR2_PACKAGE_WVDIAL is not set
> > -# BR2_PACKAGE_WEBKITGTK24 is not set
> > -# BR2_PACKAGE_TORSMO is not set
> > -# BR2_PACKAGE_SSTRIP is not set
> > -# BR2_KERNEL_HEADERS_4_3 is not set
> > -# BR2_KERNEL_HEADERS_4_2 is not set
> > -# BR2_PACKAGE_KODI_ADDON_XVDR is not set
> > -# BR2_PACKAGE_IPKG is not set
> > -# BR2_GCC_VERSION_4_7_X is not set
> > -# BR2_BINUTILS_VERSION_2_24_X is not set
> > -# BR2_PACKAGE_WESTON_RPI is not set
> > -# BR2_LINUX_KERNEL_TOOL_CPUPOWER is not set
> > -# BR2_LINUX_KERNEL_TOOL_PERF is not set
> > -# BR2_LINUX_KERNEL_TOOL_SELFTESTS is not set
> > -# BR2_GCC_VERSION_4_8_ARC is not set
> > -# BR2_KERNEL_HEADERS_4_0 is not set
> > -# BR2_KERNEL_HEADERS_3_19 is not set
> > -# BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS is not set
> > -# BR2_PACKAGE_ELEMENTARY is not set
> > -# BR2_LINUX_KERNEL_CUSTOM_LOCAL is not set
> > -
> > -#
> > -# Legacy options removed in 2016.08
> > -#
> > -# BR2_PACKAGE_EFL_JP2K is not set
> > -# BR2_PACKAGE_SYSTEMD_COMPAT is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER is not set
> > -# BR2_PACKAGE_LIBFSLVPUWRAP is not set
> > -# BR2_PACKAGE_LIBFSLPARSER is not set
> > -# BR2_PACKAGE_LIBFSLCODEC is not set
> > -# BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT is not set
> > -# BR2_PTHREADS_OLD is not set
> > -# BR2_BINUTILS_VERSION_2_23_X is not set
> > -# BR2_TOOLCHAIN_BUILDROOT_EGLIBC is not set
> > -# BR2_GDB_VERSION_7_8 is not set
> > -
> > -#
> > -# Legacy options removed in 2016.05
> > -#
> > -# BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL is not set
> > -# BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP is not set
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123 is not set
> > -# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC is not set
> > -# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2 is not set
> > -# BR2_x86_i386 is not set
> > -# BR2_PACKAGE_QT5QUICK1 is not set
> > -BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR=3D""
> > -# BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID is not set
> > -# BR2_KERNEL_HEADERS_3_17 is not set
> > -# BR2_GDB_VERSION_7_7 is not set
> > -# BR2_PACKAGE_FOOMATIC_FILTERS is not set
> > -# BR2_PACKAGE_SAMBA is not set
> > -# BR2_PACKAGE_KODI_WAVPACK is not set
> > -# BR2_PACKAGE_KODI_RSXS is not set
> > -# BR2_PACKAGE_KODI_GOOM is not set
> > -# BR2_PACKAGE_SYSTEMD_ALL_EXTRAS is not set
> > -# BR2_GCC_VERSION_4_5_X is not set
> > -# BR2_PACKAGE_SQLITE_READLINE is not set
> > -
> > -#
> > -# Legacy options removed in 2016.02
> > -#
> > -# BR2_PACKAGE_DOVECOT_BZIP2 is not set
> > -# BR2_PACKAGE_DOVECOT_ZLIB is not set
> > -# BR2_PACKAGE_E2FSPROGS_FINDFS is not set
> > -# BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL is not set
> > -# BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE is not set
> > -# BR2_PACKAGE_OPENPOWERLINK_LIBPCAP is not set
> > -# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
> > -# BR2_PACKAGE_CUPS_PDFTOPS is not set
> > -# BR2_KERNEL_HEADERS_3_16 is not set
> > -# BR2_PACKAGE_PYTHON_PYXML is not set
> > -# BR2_ENABLE_SSP is not set
> > -# BR2_PACKAGE_DIRECTFB_CLE266 is not set
> > -# BR2_PACKAGE_DIRECTFB_UNICHROME is not set
> > -# BR2_PACKAGE_LIBELEMENTARY is not set
> > -# BR2_PACKAGE_LIBEINA is not set
> > -# BR2_PACKAGE_LIBEET is not set
> > -# BR2_PACKAGE_LIBEVAS is not set
> > -# BR2_PACKAGE_LIBECORE is not set
> > -# BR2_PACKAGE_LIBEDBUS is not set
> > -# BR2_PACKAGE_LIBEFREET is not set
> > -# BR2_PACKAGE_LIBEIO is not set
> > -# BR2_PACKAGE_LIBEMBRYO is not set
> > -# BR2_PACKAGE_LIBEDJE is not set
> > -# BR2_PACKAGE_LIBETHUMB is not set
> > -# BR2_PACKAGE_INFOZIP is not set
> > -# BR2_BR2_PACKAGE_NODEJS_0_10_X is not set
> > -# BR2_BR2_PACKAGE_NODEJS_0_12_X is not set
> > -# BR2_BR2_PACKAGE_NODEJS_4_X is not set
> > -
> > -#
> > -# Legacy options removed in 2015.11
> > -#
> > -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL is not set
> > -# BR2_PACKAGE_MEDIA_CTL is not set
> > -# BR2_PACKAGE_SCHIFRA is not set
> > -# BR2_PACKAGE_ZXING is not set
> > -# BR2_PACKAGE_BLACKBOX is not set
> > -# BR2_KERNEL_HEADERS_3_0 is not set
> > -# BR2_KERNEL_HEADERS_3_11 is not set
> > -# BR2_KERNEL_HEADERS_3_13 is not set
> > -# BR2_KERNEL_HEADERS_3_15 is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE is not set
> > -# BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW is not set
> > -# BR2_PACKAGE_KOBS_NG is not set
> > -# BR2_PACKAGE_SAWMAN is not set
> > -# BR2_PACKAGE_DIVINE is not set
> > -
> > -#
> > -# Legacy options removed in 2015.08
> > -#
> > -# BR2_PACKAGE_KODI_PVR_ADDONS is not set
> > -# BR2_BINUTILS_VERSION_2_23_2 is not set
> > -# BR2_BINUTILS_VERSION_2_24 is not set
> > -# BR2_BINUTILS_VERSION_2_25 is not set
> > -# BR2_PACKAGE_PERF is not set
> > -# BR2_BINUTILS_VERSION_2_22 is not set
> > -# BR2_PACKAGE_GPU_VIV_BIN_MX6Q is not set
> > -# BR2_TARGET_UBOOT_NETWORK is not set
> > --
> > 2.34.1
> >
>
>

--000000000000af5c32060e6c5ad7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Giulio,<br>=C2=A0 =C2=A0 =C2=A0I have two questions.<br=
><br>=C2=A0 =C2=A0 =C2=A0-=C2=A0 This patch definetely needs to be squashed=
 with the other patch you&#39;ve<br>sent to obtain a single patch.=C2=A0<br=
><br>I am confuse above description, I take one example.<br>my v2 patch is =
&quot;0001-board-cubietech-cubieboard4-Add-config-file-for-cubi.patch&quot;=
<br>my v3 patch is &quot;0001-refactor-cubieboard4_defconfig.patch&quot;<br=
>If I need to squash above two patch.<br>I can run &quot;=C2=A0git format-p=
atch -s -M -o . -2&quot;., then use the one patch as by v4 patch, right?<br=
><br>- In my v3 patch, I already=C2=A0

shrink defconfig, I using make saveconfig to save the config file.<br><br>T=
hank you.<br>Best regards,<br>Nigel<br><br><br><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Giulio Benetti &lt;<a href=3D"mail=
to:giulio.benetti@benettiengineering.com" target=3D"_blank">giulio.benetti@=
benettiengineering.com</a>&gt; =E6=96=BC 2024=E5=B9=B41=E6=9C=887=E6=97=A5 =
=E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=888:22=E5=AF=AB=E9=81=93=EF=BC=9A<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">This patch definetely =
needs to be squashed with the other patch you&#39;ve<br>
sent to obtain a single patch. When you send a patch it&#39;s expected that=
<br>
it simply works, the previous one doesn&#39;t work as you point below and s=
o<br>
you need this one.<br>
But all patches have to be bisectable that means that if you move <br>
forward of backward with commits everything must build and work <br>
possibly, that&#39;s why we need these 2 patches to be only atomic one.<br>
<br>
Also, defconfig must be shrinked, otherwise it&#39;s unreadable and wastes<=
br>
size.<br>
<br>
Waiting for V4 of a single patch then,<br>
<br>
thank you!<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
CEO&amp;CTO@Benetti Engineering sas<br>
<br>
On 07/01/24 09:43, Nigel Wang wrote:<br>
&gt; This is a new defconfig for cubieboard4. The following is board&#39;s<=
br>
&gt; detail.<br>
&gt; - SOC: sunxiA80.<br>
&gt; - DRAM: 2GiB DDR3 @ 672MHZ.<br>
&gt; - NAND: 8GBeMMC<br>
&gt; - Power: DC 5V.<br>
&gt; - Network: Wifi 80211 b/g/n.<br>
&gt; - Ethernet: RTL8211E<br>
&gt; reference:<br>
&gt; <a href=3D"https://linux-sunxi.org/Cubietech_Cubieboard4" rel=3D"noref=
errer" target=3D"_blank">https://linux-sunxi.org/Cubietech_Cubieboard4</a><=
br>
&gt; <br>
&gt; Board support package includes the following components:<br>
&gt; - mainline Linux Kernel 6.6.8<br>
&gt; - mainline U-boot 2021.10.<br>
&gt; <br>
&gt; Signed-off-by: Nigel Wang &lt;<a href=3D"mailto:asd617140123@gmail.com=
" target=3D"_blank">asd617140123@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2 -&gt; v3<br>
&gt; * Add BR2_cortex_a15_a7=3Dy in buildroot defconfig.<br>
&gt; * Bump linux version to 6.6.8<br>
&gt; * Using sunxi_defconfig in kernel.<br>
&gt; * Using &quot;make savedefconfig&quot; to save defconfig, it can only =
save the<br>
&gt; changed config in buildroot.<br>
&gt; * Change kernel&#39;s path in extlinux. Make it can boot up successful=
ly.<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0board/cubietech/cubieboard4/extlinux.conf |=C2=A0 =C2=A0 2=
 +-<br>
&gt;=C2=A0 =C2=A0board/cubietech/cubieboard4/genimage.cfg=C2=A0 |=C2=A0 =C2=
=A0 2 +-<br>
&gt;=C2=A0 =C2=A0board/cubietech/cubieboard4/post-image.sh |=C2=A0 =C2=A0 1=
 +<br>
&gt;=C2=A0 =C2=A0configs/cubieboard4_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 4843 +--------------------<br>
&gt;=C2=A0 =C2=A04 files changed, 24 insertions(+), 4824 deletions(-)<br>
&gt; <br>
&gt; diff --git a/board/cubietech/cubieboard4/extlinux.conf b/board/cubiete=
ch/cubieboard4/extlinux.conf<br>
&gt; index 42a71012b6..5084e2237b 100644<br>
&gt; --- a/board/cubietech/cubieboard4/extlinux.conf<br>
&gt; +++ b/board/cubietech/cubieboard4/extlinux.conf<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 =C2=A0label linux<br>
&gt; -=C2=A0 =C2=A0 lernel /Image<br>
&gt; +=C2=A0 =C2=A0 kernel /boot/zImage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0devicetree /sun9i-a80-cubieboard4.dtb<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0append console=3DttyS0,115200 earlyprintk ro=
ot=3D/dev/mmcblk0p2 rootwait<br>
&gt; <br>
&gt; diff --git a/board/cubietech/cubieboard4/genimage.cfg b/board/cubietec=
h/cubieboard4/genimage.cfg<br>
&gt; index 34edb2b306..f1dee13923 100644<br>
&gt; --- a/board/cubietech/cubieboard4/genimage.cfg<br>
&gt; +++ b/board/cubietech/cubieboard4/genimage.cfg<br>
&gt; @@ -6,7 +6,7 @@ image boot.vfat {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;zImage&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;sun9i-a80-cubieboard4.dtb&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;boot.scr&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;extlinux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; diff --git a/board/cubietech/cubieboard4/post-image.sh b/board/cubiete=
ch/cubieboard4/post-image.sh<br>
&gt; index c534ddb1a0..e37b960a4d 100755<br>
&gt; --- a/board/cubietech/cubieboard4/post-image.sh<br>
&gt; +++ b/board/cubietech/cubieboard4/post-image.sh<br>
&gt; @@ -2,6 +2,7 @@<br>
&gt; <br>
&gt;=C2=A0 =C2=A0BOARD_DIR=3D&quot;$(dirname &quot;$0&quot;)&quot;<br>
&gt;=C2=A0 =C2=A0install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/=
extlinux/extlinux.conf<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0GENIMAGE_CFG=3D&quot;${BOARD_DIR}/genimage.cfg&quot;<br>
&gt;=C2=A0 =C2=A0GENIMAGE_TMP=3D&quot;${BUILD_DIR}/genimage.tmp&quot;<br>
&gt; <br>
&gt; diff --git a/configs/cubieboard4_defconfig b/configs/cubieboard4_defco=
nfig<br>
&gt; index 5a0f0b737c..0592fe4a2d 100644<br>
&gt; --- a/configs/cubieboard4_defconfig<br>
&gt; +++ b/configs/cubieboard4_defconfig<br>
&gt; @@ -1,4840 +1,39 @@<br>
&gt; -#<br>
&gt; -# Automatically generated file; DO NOT EDIT.<br>
&gt; -# Buildroot 2023.11-rc1-25-gcc3088a44b-dirty Configuration<br>
&gt; -#<br>
&gt; -BR2_HAVE_DOT_CONFIG=3Dy<br>
&gt; -BR2_HOST_GCC_AT_LEAST_4_9=3Dy<br>
&gt; -BR2_HOST_GCC_AT_LEAST_5=3Dy<br>
&gt; -BR2_HOST_GCC_AT_LEAST_6=3Dy<br>
&gt; -BR2_HOST_GCC_AT_LEAST_7=3Dy<br>
&gt; -BR2_HOST_GCC_AT_LEAST_8=3Dy<br>
&gt; -BR2_HOST_GCC_AT_LEAST_9=3Dy<br>
&gt; -BR2_HOST_GCC_AT_LEAST_10=3Dy<br>
&gt; -BR2_HOST_GCC_AT_LEAST_11=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Target options<br>
&gt; -#<br>
&gt; -BR2_USE_MMU=3Dy<br>
&gt; -# BR2_arcle is not set<br>
&gt; -# BR2_arceb is not set<br>
&gt; -BR2_arm=3Dy<br>
&gt; -# BR2_armeb is not set<br>
&gt; -# BR2_aarch64 is not set<br>
&gt; -# BR2_aarch64_be is not set<br>
&gt; -# BR2_i386 is not set<br>
&gt; -# BR2_m68k is not set<br>
&gt; -# BR2_microblazeel is not set<br>
&gt; -# BR2_microblazebe is not set<br>
&gt; -# BR2_mips is not set<br>
&gt; -# BR2_mipsel is not set<br>
&gt; -# BR2_mips64 is not set<br>
&gt; -# BR2_mips64el is not set<br>
&gt; -# BR2_nios2 is not set<br>
&gt; -# BR2_or1k is not set<br>
&gt; -# BR2_powerpc is not set<br>
&gt; -# BR2_powerpc64 is not set<br>
&gt; -# BR2_powerpc64le is not set<br>
&gt; -# BR2_riscv is not set<br>
&gt; -# BR2_s390x is not set<br>
&gt; -# BR2_sh is not set<br>
&gt; -# BR2_sparc is not set<br>
&gt; -# BR2_sparc64 is not set<br>
&gt; -# BR2_x86_64 is not set<br>
&gt; -# BR2_xtensa is not set<br>
&gt; -BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT=3Dy<br>
&gt; -BR2_ARCH=3D&quot;arm&quot;<br>
&gt; -BR2_NORMALIZED_ARCH=3D&quot;arm&quot;<br>
&gt; -BR2_ENDIAN=3D&quot;LITTLE&quot;<br>
&gt; -BR2_GCC_TARGET_ABI=3D&quot;aapcs-linux&quot;<br>
&gt; -BR2_GCC_TARGET_CPU=3D&quot;cortex-a7&quot;<br>
&gt; -BR2_GCC_TARGET_FPU=3D&quot;neon-vfpv4&quot;<br>
&gt; -BR2_GCC_TARGET_FLOAT_ABI=3D&quot;hard&quot;<br>
&gt; -BR2_GCC_TARGET_MODE=3D&quot;arm&quot;<br>
&gt; -BR2_BINFMT_SUPPORTS_SHARED=3Dy<br>
&gt; -BR2_READELF_ARCH_NAME=3D&quot;ARM&quot;<br>
&gt; -BR2_ARM_CPU_HAS_NEON=3Dy<br>
&gt; -BR2_ARM_CPU_HAS_FPU=3Dy<br>
&gt; -BR2_ARM_CPU_HAS_VFPV2=3Dy<br>
&gt; -BR2_ARM_CPU_HAS_VFPV3=3Dy<br>
&gt; -BR2_ARM_CPU_HAS_VFPV4=3Dy<br>
&gt; -BR2_ARM_CPU_HAS_ARM=3Dy<br>
&gt; -BR2_ARM_CPU_HAS_THUMB2=3Dy<br>
&gt; -BR2_ARM_CPU_ARMV7A=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# armv4 cores<br>
&gt; -#<br>
&gt; -# BR2_arm920t is not set<br>
&gt; -# BR2_arm922t is not set<br>
&gt; -# BR2_fa526 is not set<br>
&gt; -# BR2_strongarm is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# armv5 cores<br>
&gt; -#<br>
&gt; -# BR2_arm926t is not set<br>
&gt; -# BR2_xscale is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# armv6 cores<br>
&gt; -#<br>
&gt; -# BR2_arm1136j_s is not set<br>
&gt; -# BR2_arm1136jf_s is not set<br>
&gt; -# BR2_arm1176jz_s is not set<br>
&gt; -# BR2_arm1176jzf_s is not set<br>
&gt; -# BR2_arm11mpcore is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# armv7a cores<br>
&gt; -#<br>
&gt; -# BR2_cortex_a5 is not set<br>
&gt; -BR2_cortex_a7=3Dy<br>
&gt; -# BR2_cortex_a8 is not set<br>
&gt; -# BR2_cortex_a9 is not set<br>
&gt; -# BR2_cortex_a12 is not set<br>
&gt; -# BR2_cortex_a15 is not set<br>
&gt; -# BR2_cortex_a15_a7 is not set<br>
&gt; -# BR2_cortex_a17 is not set<br>
&gt; -# BR2_cortex_a17_a7 is not set<br>
&gt; -# BR2_pj4 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# armv7m cores<br>
&gt; -#<br>
&gt; -# BR2_cortex_m3 is not set<br>
&gt; -# BR2_cortex_m4 is not set<br>
&gt; -# BR2_cortex_m7 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# armv8 cores<br>
&gt; -#<br>
&gt; -# BR2_cortex_a32 is not set<br>
&gt; -# BR2_cortex_a35 is not set<br>
&gt; -# BR2_cortex_a53 is not set<br>
&gt; -# BR2_cortex_a57 is not set<br>
&gt; -# BR2_cortex_a57_a53 is not set<br>
&gt; -# BR2_cortex_a72 is not set<br>
&gt; -# BR2_cortex_a72_a53 is not set<br>
&gt; -# BR2_cortex_a73 is not set<br>
&gt; -# BR2_cortex_a73_a35 is not set<br>
&gt; -# BR2_cortex_a73_a53 is not set<br>
&gt; -# BR2_exynos_m1 is not set<br>
&gt; -# BR2_xgene1 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# armv8.1a cores<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# armv8.2a cores<br>
&gt; -#<br>
&gt; -# BR2_cortex_a76 is not set<br>
&gt; -# BR2_cortex_a76_a55 is not set<br>
&gt; -# BR2_neoverse_n1 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# armv8.4a cores<br>
&gt; -#<br>
&gt; -# BR2_ARM_EABI is not set<br>
&gt; -BR2_ARM_EABIHF=3Dy<br>
&gt; -# BR2_ARM_FPU_VFPV2 is not set<br>
&gt; -# BR2_ARM_FPU_VFPV3 is not set<br>
&gt; -# BR2_ARM_FPU_VFPV3D16 is not set<br>
&gt; -# BR2_ARM_FPU_VFPV4 is not set<br>
&gt; -# BR2_ARM_FPU_VFPV4D16 is not set<br>
&gt; -# BR2_ARM_FPU_NEON is not set<br>
&gt; -BR2_ARM_FPU_NEON_VFPV4=3Dy<br>
&gt; -BR2_ARM_INSTRUCTIONS_ARM=3Dy<br>
&gt; -# BR2_ARM_INSTRUCTIONS_THUMB2 is not set<br>
&gt; -BR2_BINFMT_ELF=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Toolchain<br>
&gt; -#<br>
&gt; -BR2_TOOLCHAIN=3Dy<br>
&gt; -BR2_TOOLCHAIN_USES_GLIBC=3Dy<br>
&gt; -BR2_TOOLCHAIN_BUILDROOT=3Dy<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Toolchain Buildroot Options<br>
&gt; -#<br>
&gt; -BR2_TOOLCHAIN_BUILDROOT_VENDOR=3D&quot;buildroot&quot;<br>
&gt; -# BR2_TOOLCHAIN_BUILDROOT_UCLIBC is not set<br>
&gt; -BR2_TOOLCHAIN_BUILDROOT_GLIBC=3Dy<br>
&gt; -# BR2_TOOLCHAIN_BUILDROOT_MUSL is not set<br>
&gt; -BR2_TOOLCHAIN_BUILDROOT_LIBC=3D&quot;glibc&quot;<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Kernel Header Options<br>
&gt; -#<br>
&gt; -BR2_KERNEL_HEADERS_AS_KERNEL=3Dy<br>
&gt; -# BR2_KERNEL_HEADERS_4_14 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_19 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_4 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_10 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_15 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_6_1 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_6_5 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_6_6 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_VERSION is not set<br>
&gt; -# BR2_KERNEL_HEADERS_CUSTOM_TARBALL is not set<br>
&gt; -# BR2_KERNEL_HEADERS_CUSTOM_GIT is not set<br>
&gt; -BR2_KERNEL_HEADERS_LATEST=3Dy<br>
&gt; -BR2_PACKAGE_LINUX_HEADERS=3Dy<br>
&gt; -BR2_PACKAGE_MUSL_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_MUSL_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_UCLIBC_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_GLIBC_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_GLIBC_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Glibc Options<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_GLIBC=3Dy<br>
&gt; -# BR2_PACKAGE_GLIBC_KERNEL_COMPAT is not set<br>
&gt; -# BR2_PACKAGE_GLIBC_UTILS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Binutils Options<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI=3Dy<br>
&gt; -# BR2_BINUTILS_VERSION_2_39_X is not set<br>
&gt; -BR2_BINUTILS_VERSION_2_40_X=3Dy<br>
&gt; -# BR2_BINUTILS_VERSION_2_41_X is not set<br>
&gt; -BR2_BINUTILS_VERSION=3D&quot;2.40&quot;<br>
&gt; -# BR2_BINUTILS_GPROFNG is not set<br>
&gt; -BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=3D&quot;&quot;<br>
&gt; -<br>
&gt; -#<br>
&gt; -# GCC Options<br>
&gt; -#<br>
&gt; -# BR2_GCC_VERSION_11_X is not set<br>
&gt; -BR2_GCC_VERSION_12_X=3Dy<br>
&gt; -# BR2_GCC_VERSION_13_X is not set<br>
&gt; -BR2_GCC_VERSION=3D&quot;12.3.0&quot;<br>
&gt; -BR2_EXTRA_GCC_CONFIG_OPTIONS=3D&quot;&quot;<br>
&gt; -# BR2_TOOLCHAIN_BUILDROOT_CXX is not set<br>
&gt; -# BR2_TOOLCHAIN_BUILDROOT_FORTRAN is not set<br>
&gt; -# BR2_GCC_ENABLE_OPENMP is not set<br>
&gt; -# BR2_GCC_ENABLE_GRAPHITE is not set<br>
&gt; -BR2_PACKAGE_GCC_FINAL=3Dy<br>
&gt; -BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Host GDB Options<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_HOST_GDB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Toolchain Generic Options<br>
&gt; -#<br>
&gt; -BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS=3Dy<br>
&gt; -BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK=3Dy<br>
&gt; -BR2_USE_WCHAR=3Dy<br>
&gt; -BR2_ENABLE_LOCALE=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_THREADS=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_THREADS_DEBUG=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_THREADS_NPTL=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_SSP=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_SSP_STRONG=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_UCONTEXT=3Dy<br>
&gt; -BR2_TOOLCHAIN_SUPPORTS_PIE=3Dy<br>
&gt; -# BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY is not set<br>
&gt; -BR2_TOOLCHAIN_EXTRA_LIBS=3D&quot;&quot;<br>
&gt; -BR2_TOOLCHAIN_HAS_FULL_GETTEXT=3Dy<br>
&gt; -BR2_TARGET_OPTIMIZATION=3D&quot;&quot;<br>
&gt; -BR2_TARGET_LDFLAGS=3D&quot;&quot;<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_7=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_LATEST=3Dy<br>
&gt; -BR2_TOOLCHAIN_HEADERS_AT_LEAST=3D&quot;6.6&quot;<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_4_3=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_4_4=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_4_5=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_4_6=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_4_7=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_4_8=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_4_9=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_5=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_6=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_7=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_8=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_9=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_10=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_11=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST_12=3Dy<br>
&gt; -BR2_TOOLCHAIN_GCC_AT_LEAST=3D&quot;12&quot;<br>
&gt; -BR2_TOOLCHAIN_HAS_MNAN_OPTION=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_SYNC_1=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_SYNC_2=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_SYNC_4=3Dy<br>
&gt; -BR2_TOOLCHAIN_ARM_HAS_SYNC_8=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_SYNC_8=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_LIBATOMIC=3Dy<br>
&gt; -BR2_TOOLCHAIN_HAS_ATOMIC=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Build options<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Commands<br>
&gt; -#<br>
&gt; -BR2_WGET=3D&quot;wget --passive-ftp -nd -t 3&quot;<br>
&gt; -BR2_SVN=3D&quot;svn --non-interactive&quot;<br>
&gt; -BR2_BZR=3D&quot;bzr&quot;<br>
&gt; -BR2_GIT=3D&quot;git&quot;<br>
&gt; -BR2_CVS=3D&quot;cvs&quot;<br>
&gt; -BR2_LOCALFILES=3D&quot;cp&quot;<br>
&gt; -BR2_SCP=3D&quot;scp&quot;<br>
&gt; -BR2_SFTP=3D&quot;sftp&quot;<br>
&gt; -BR2_HG=3D&quot;hg&quot;<br>
&gt; -BR2_ZCAT=3D&quot;gzip -d -c&quot;<br>
&gt; -BR2_BZCAT=3D&quot;bzcat&quot;<br>
&gt; -BR2_XZCAT=3D&quot;xzcat&quot;<br>
&gt; -BR2_LZCAT=3D&quot;lzip -d -c&quot;<br>
&gt; -BR2_TAR_OPTIONS=3D&quot;&quot;<br>
&gt; -BR2_DL_DIR=3D&quot;$(TOPDIR)/dl&quot;<br>
&gt; -BR2_HOST_DIR=3D&quot;$(BASE_DIR)/host&quot;<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Mirrors and Download locations<br>
&gt; -#<br>
&gt; -BR2_PRIMARY_SITE=3D&quot;&quot;<br>
&gt; -BR2_BACKUP_SITE=3D&quot;<a href=3D"https://sources.buildroot.net" rel=
=3D"noreferrer" target=3D"_blank">https://sources.buildroot.net</a>&quot;<b=
r>
&gt; -BR2_KERNEL_MIRROR=3D&quot;<a href=3D"https://cdn.kernel.org/pub" rel=
=3D"noreferrer" target=3D"_blank">https://cdn.kernel.org/pub</a>&quot;<br>
&gt; -BR2_GNU_MIRROR=3D&quot;<a href=3D"http://ftpmirror.gnu.org" rel=3D"no=
referrer" target=3D"_blank">http://ftpmirror.gnu.org</a>&quot;<br>
&gt; -BR2_LUAROCKS_MIRROR=3D&quot;<a href=3D"http://rocks.moonscript.org" r=
el=3D"noreferrer" target=3D"_blank">http://rocks.moonscript.org</a>&quot;<b=
r>
&gt; -BR2_CPAN_MIRROR=3D&quot;<a href=3D"https://cpan.metacpan.org" rel=3D"=
noreferrer" target=3D"_blank">https://cpan.metacpan.org</a>&quot;<br>
&gt; -BR2_JLEVEL=3D0<br>
&gt; -# BR2_CCACHE is not set<br>
&gt; -# BR2_ENABLE_DEBUG is not set<br>
&gt; -# BR2_ENABLE_RUNTIME_DEBUG is not set<br>
&gt; -BR2_STRIP_strip=3Dy<br>
&gt; -BR2_STRIP_EXCLUDE_FILES=3D&quot;&quot;<br>
&gt; -BR2_STRIP_EXCLUDE_DIRS=3D&quot;&quot;<br>
&gt; -# BR2_OPTIMIZE_0 is not set<br>
&gt; -# BR2_OPTIMIZE_1 is not set<br>
&gt; -# BR2_OPTIMIZE_2 is not set<br>
&gt; -# BR2_OPTIMIZE_3 is not set<br>
&gt; -# BR2_OPTIMIZE_G is not set<br>
&gt; -BR2_OPTIMIZE_S=3Dy<br>
&gt; -# BR2_OPTIMIZE_FAST is not set<br>
&gt; -# BR2_ENABLE_LTO is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# static only needs a toolchain w/ uclibc or musl<br>
&gt; -#<br>
&gt; -BR2_SHARED_LIBS=3Dy<br>
&gt; -# BR2_SHARED_STATIC_LIBS is not set<br>
&gt; -BR2_PACKAGE_OVERRIDE_FILE=3D&quot;$(CONFIG_DIR)/<a href=3D"http://loc=
al.mk" rel=3D"noreferrer" target=3D"_blank">local.mk</a>&quot;<br>
&gt; -BR2_GLOBAL_PATCH_DIR=3D&quot;&quot;<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Advanced<br>
&gt; -#<br>
&gt; -# BR2_FORCE_HOST_BUILD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Forcing all downloads to have a valid hash needs a global patch and=
 hash directory<br>
&gt; -#<br>
&gt; -# BR2_REPRODUCIBLE is not set<br>
&gt; -# BR2_PER_PACKAGE_DIRECTORIES is not set<br>
&gt; -# BR2_TIME_BITS_64 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Security Hardening Options<br>
&gt; -#<br>
&gt; -BR2_PIC_PIE_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PIC_PIE=3Dy<br>
&gt; -# BR2_SSP_NONE is not set<br>
&gt; -# BR2_SSP_REGULAR is not set<br>
&gt; -BR2_SSP_STRONG=3Dy<br>
&gt; -# BR2_SSP_ALL is not set<br>
&gt; -BR2_SSP_OPTION=3D&quot;-fstack-protector-strong&quot;<br>
&gt; -# BR2_RELRO_NONE is not set<br>
&gt; -# BR2_RELRO_PARTIAL is not set<br>
&gt; -BR2_RELRO_FULL=3Dy<br>
&gt; -BR2_FORTIFY_SOURCE_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_FORTIFY_SOURCE_NONE is not set<br>
&gt; -BR2_FORTIFY_SOURCE_1=3Dy<br>
&gt; -# BR2_FORTIFY_SOURCE_2 is not set<br>
&gt; -# BR2_FORTIFY_SOURCE_3 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# System configuration<br>
&gt; -#<br>
&gt; -BR2_ROOTFS_SKELETON_DEFAULT=3Dy<br>
&gt; -# BR2_ROOTFS_SKELETON_CUSTOM is not set<br>
&gt; -BR2_TARGET_GENERIC_HOSTNAME=3D&quot;Cubieboard4&quot;<br>
&gt; -BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Cubieboard4!&quot;<br>
&gt; -BR2_TARGET_GENERIC_PASSWD_SHA256=3Dy<br>
&gt; -# BR2_TARGET_GENERIC_PASSWD_SHA512 is not set<br>
&gt; -BR2_TARGET_GENERIC_PASSWD_METHOD=3D&quot;sha-256&quot;<br>
&gt; -BR2_INIT_BUSYBOX=3Dy<br>
&gt; -# BR2_INIT_SYSV is not set<br>
&gt; -# BR2_INIT_OPENRC is not set<br>
&gt; -# BR2_INIT_SYSTEMD is not set<br>
&gt; -# BR2_INIT_NONE is not set<br>
&gt; -# BR2_ROOTFS_DEVICE_CREATION_STATIC is not set<br>
&gt; -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=3Dy<br>
&gt; -# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set<br>
&gt; -# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is not set<br>
&gt; -BR2_ROOTFS_DEVICE_TABLE=3D&quot;system/device_table.txt&quot;<br>
&gt; -# BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES is not set<br>
&gt; -# BR2_ROOTFS_MERGED_USR is not set<br>
&gt; -BR2_TARGET_ENABLE_ROOT_LOGIN=3Dy<br>
&gt; -BR2_TARGET_GENERIC_ROOT_PASSWD=3D&quot;&quot;<br>
&gt; -BR2_SYSTEM_BIN_SH_BUSYBOX=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# bash, dash, mksh, zsh need BR2_PACKAGE_BUSYBOX_SHOW_OTHERS<br>
&gt; -#<br>
&gt; -# BR2_SYSTEM_BIN_SH_NONE is not set<br>
&gt; -BR2_TARGET_GENERIC_GETTY=3Dy<br>
&gt; -BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttyS0&quot;<br>
&gt; -BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP=3Dy<br>
&gt; -# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set<br>
&gt; -# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set<br>
&gt; -# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set<br>
&gt; -# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set<br>
&gt; -# BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200 is not set<br>
&gt; -BR2_TARGET_GENERIC_GETTY_BAUDRATE=3D&quot;0&quot;<br>
&gt; -BR2_TARGET_GENERIC_GETTY_TERM=3D&quot;vt100&quot;<br>
&gt; -BR2_TARGET_GENERIC_GETTY_OPTIONS=3D&quot;&quot;<br>
&gt; -BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=3Dy<br>
&gt; -BR2_SYSTEM_DHCP=3D&quot;&quot;<br>
&gt; -BR2_SYSTEM_DEFAULT_PATH=3D&quot;/bin:/sbin:/usr/bin:/usr/sbin&quot;<b=
r>
&gt; -BR2_ENABLE_LOCALE_PURGE=3Dy<br>
&gt; -BR2_ENABLE_LOCALE_WHITELIST=3D&quot;C en_US&quot;<br>
&gt; -BR2_GENERATE_LOCALE=3D&quot;&quot;<br>
&gt; -# BR2_SYSTEM_ENABLE_NLS is not set<br>
&gt; -# BR2_TARGET_TZ_INFO is not set<br>
&gt; -BR2_ROOTFS_USERS_TABLES=3D&quot;&quot;<br>
&gt; -BR2_ROOTFS_OVERLAY=3D&quot;&quot;<br>
&gt; -BR2_ROOTFS_PRE_BUILD_SCRIPT=3D&quot;&quot;<br>
&gt; -BR2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;&quot;<br>
&gt; -BR2_ROOTFS_POST_FAKEROOT_SCRIPT=3D&quot;&quot;<br>
&gt; -BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/cubietech/cubieboard4/post=
-image.sh&quot;<br>
&gt; -BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;&quot;<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Kernel<br>
&gt; -#<br>
&gt; -BR2_LINUX_KERNEL=3Dy<br>
&gt; -BR2_LINUX_KERNEL_LATEST_VERSION=3Dy<br>
&gt; -# BR2_LINUX_KERNEL_LATEST_CIP_VERSION is not set<br>
&gt; -# BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION is not set<br>
&gt; -# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set<br>
&gt; -# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set<br>
&gt; -# BR2_LINUX_KERNEL_CUSTOM_GIT is not set<br>
&gt; -# BR2_LINUX_KERNEL_CUSTOM_HG is not set<br>
&gt; -# BR2_LINUX_KERNEL_CUSTOM_SVN is not set<br>
&gt; -BR2_LINUX_KERNEL_VERSION=3D&quot;6.6.1&quot;<br>
&gt; -BR2_LINUX_KERNEL_PATCH=3D&quot;&quot;<br>
&gt; -BR2_LINUX_KERNEL_USE_DEFCONFIG=3Dy<br>
&gt; -# BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG is not set<br>
&gt; -# BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG is not set<br>
&gt; -BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;sunxi&quot;<br>
&gt; -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;&quot;<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH=3D&quot;&quot;<br>
&gt; -# BR2_LINUX_KERNEL_UIMAGE is not set<br>
&gt; -# BR2_LINUX_KERNEL_APPENDED_UIMAGE is not set<br>
&gt; -BR2_LINUX_KERNEL_ZIMAGE=3Dy<br>
&gt; -# BR2_LINUX_KERNEL_APPENDED_ZIMAGE is not set<br>
&gt; -# BR2_LINUX_KERNEL_VMLINUX is not set<br>
&gt; -# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set<br>
&gt; -BR2_LINUX_KERNEL_GZIP=3Dy<br>
&gt; -# BR2_LINUX_KERNEL_LZ4 is not set<br>
&gt; -# BR2_LINUX_KERNEL_LZMA is not set<br>
&gt; -# BR2_LINUX_KERNEL_LZO is not set<br>
&gt; -# BR2_LINUX_KERNEL_XZ is not set<br>
&gt; -# BR2_LINUX_KERNEL_ZSTD is not set<br>
&gt; -BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
&gt; -# BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT is not set<br>
&gt; -BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;allwinner/sun9i-a80-cubieboa=
rd4&quot;<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D&quot;&quot;<br>
&gt; -# BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME is not set<br>
&gt; -# BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT is not set<br>
&gt; -# BR2_LINUX_KERNEL_INSTALL_TARGET is not set<br>
&gt; -# BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL is not set<br>
&gt; -# BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF is not set<br>
&gt; -# BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Linux Kernel Extensions<br>
&gt; -#<br>
&gt; -# BR2_LINUX_KERNEL_EXT_XENOMAI is not set<br>
&gt; -# BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS is not set<br>
&gt; -# BR2_LINUX_KERNEL_EXT_FBTFT is not set<br>
&gt; -# BR2_LINUX_KERNEL_EXT_AUFS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Linux Kernel Tools<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LINUX_TOOLS_CPUPOWER is not set<br>
&gt; -# BR2_PACKAGE_LINUX_TOOLS_GPIO is not set<br>
&gt; -# BR2_PACKAGE_LINUX_TOOLS_IIO is not set<br>
&gt; -# BR2_PACKAGE_LINUX_TOOLS_PCI is not set<br>
&gt; -# BR2_PACKAGE_LINUX_TOOLS_PERF is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ =
dynamic library and headers &gt;=3D 3.14<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LINUX_TOOLS_USBTOOLS is not set<br>
&gt; -# BR2_PACKAGE_LINUX_TOOLS_TMON is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Target packages<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_BUSYBOX=3Dy<br>
&gt; -BR2_PACKAGE_BUSYBOX_CONFIG=3D&quot;package/busybox/busybox.config&quo=
t;<br>
&gt; -BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES=3D&quot;&quot;<br>
&gt; -# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set<br>
&gt; -# BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES is not set<br>
&gt; -# BR2_PACKAGE_BUSYBOX_WATCHDOG is not set<br>
&gt; -BR2_PACKAGE_SKELETON=3Dy<br>
&gt; -BR2_PACKAGE_HAS_SKELETON=3Dy<br>
&gt; -BR2_PACKAGE_PROVIDES_SKELETON=3D&quot;skeleton-init-sysv&quot;<br>
&gt; -BR2_PACKAGE_SKELETON_INIT_COMMON=3Dy<br>
&gt; -BR2_PACKAGE_SKELETON_INIT_SYSV=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Audio and video applications<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ALSA_UTILS is not set<br>
&gt; -# BR2_PACKAGE_ATEST is not set<br>
&gt; -# BR2_PACKAGE_AUMIX is not set<br>
&gt; -# BR2_PACKAGE_BLUEZ_ALSA is not set<br>
&gt; -# BR2_PACKAGE_DVBLAST is not set<br>
&gt; -# BR2_PACKAGE_DVDAUTHOR is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# dvdrw-tools needs a toolchain w/ threads, C++, wchar<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# espeak needs a toolchain w/ C++, wchar, threads, dynamic library<br=
>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FAAD2 is not set<br>
&gt; -BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_FFMPEG is not set<br>
&gt; -# BR2_PACKAGE_FLAC is not set<br>
&gt; -# BR2_PACKAGE_FLITE is not set<br>
&gt; -# BR2_PACKAGE_FLUID_SOUNDFONT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# fluidsynth needs a toolchain w/ threads, wchar, dynamic library, C+=
+<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GMRENDER_RESURRECT is not set<br>
&gt; -# BR2_PACKAGE_GSTREAMER1 is not set<br>
&gt; -# BR2_PACKAGE_JACK1 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# jack2 needs a toolchain w/ threads, C++, dynamic library<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_KODI_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/ C=
++, threads, wchar, dynamic library, gcc &gt;=3D 9.x<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# kodi needs udev support for gbm<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# kodi needs an OpenGL EGL backend with OpenGL or GLES support<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LAME is not set<br>
&gt; -# BR2_PACKAGE_MADPLAY is not set<br>
&gt; -# BR2_PACKAGE_MIMIC is not set<br>
&gt; -# BR2_PACKAGE_MINIMODEM is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# miraclecast needs systemd and a glibc toolchain w/ threads and wcha=
r<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mjpegtools needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# modplugtools needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_MOTION is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mpd needs a toolchain w/ C++, threads, wchar, gcc &gt;=3D 8, host g=
cc &gt;=3D 8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_MPD_MPC is not set<br>
&gt; -# BR2_PACKAGE_MPG123 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mpv needs a toolchain w/ C++, NPTL, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_MULTICAT is not set<br>
&gt; -# BR2_PACKAGE_MUSEPACK is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ncmpc needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 10<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# omxplayer needs rpi-userland and a toolchain w/ C++, threads, wchar=
, dynamic library, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPUS_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_PIPEWIRE is not set<br>
&gt; -BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=3Dy<br>
&gt; -# BR2_PACKAGE_PULSEAUDIO is not set<br>
&gt; -# BR2_PACKAGE_SOX is not set<br>
&gt; -# BR2_PACKAGE_SPEECHD is not set<br>
&gt; -# BR2_PACKAGE_SQUEEZELITE is not set<br>
&gt; -# BR2_PACKAGE_TINYCOMPRESS is not set<br>
&gt; -# BR2_PACKAGE_TSTOOLS is not set<br>
&gt; -# BR2_PACKAGE_TWOLAME is not set<br>
&gt; -# BR2_PACKAGE_UDPXY is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# upmpdcli needs a toolchain w/ C++, NPTL, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# v4l2grab needs a toolchain w/ threads, dynamic library, C++ and hea=
ders &gt;=3D 3.0<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_V4L2LOOPBACK is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# vlc needs a toolchain w/ C++, dynamic library, wchar, threads, gcc =
&gt;=3D 4.9, headers &gt;=3D 3.7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_VORBIS_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_WAVPACK is not set<br>
&gt; -# BR2_PACKAGE_YAVTA is not set<br>
&gt; -# BR2_PACKAGE_YMPD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# zynaddsubfx needs a toolchain w/ C++11 and threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Compressors and decompressors<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BROTLI is not set<br>
&gt; -# BR2_PACKAGE_BZIP2 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# lrzip needs a toolchain w/ wchar, threads, C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# lzip needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LZOP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# p7zip needs a toolchain w/ threads, wchar, C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PIGZ is not set<br>
&gt; -# BR2_PACKAGE_PIXZ is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# unrar needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_XZ is not set<br>
&gt; -# BR2_PACKAGE_ZIP is not set<br>
&gt; -# BR2_PACKAGE_ZSTD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Debugging, profiling and benchmark<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BABELTRACE2 is not set<br>
&gt; -# BR2_PACKAGE_BLKTRACE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# bonnie++ needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_BPFTOOL is not set<br>
&gt; -# BR2_PACKAGE_CACHE_CALIBRATOR is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# clinfo needs an OpenCL provider<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# clpeak needs an OpenCL provider, a toolchain w/ C++, gcc &gt;=3D 4.=
8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_COREMARK is not set<br>
&gt; -# BR2_PACKAGE_COREMARK_PRO is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# dacapo needs OpenJDK<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DHRYSTONE is not set<br>
&gt; -# BR2_PACKAGE_DIEHARDER is not set<br>
&gt; -# BR2_PACKAGE_DMALLOC is not set<br>
&gt; -# BR2_PACKAGE_DROPWATCH is not set<br>
&gt; -# BR2_PACKAGE_DSTAT is not set<br>
&gt; -# BR2_PACKAGE_DT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# duma needs a toolchain w/ C++, threads, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FIO is not set<br>
&gt; -BR2_PACKAGE_FWTS_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_FWTS is not set<br>
&gt; -BR2_PACKAGE_GDB_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gdb/gdbserver &gt;=3D 8.x needs a toolchain w/ C++, gcc &gt;=3D 4.8=
<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# google-breakpad requires a glibc or uClibc toolchain w/ wchar, thre=
ad, C++, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_HYPERFINE is not set<br>
&gt; -# BR2_PACKAGE_IOZONE is not set<br>
&gt; -BR2_PACKAGE_KEXEC_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_KEXEC is not set<br>
&gt; -# BR2_PACKAGE_KMEMD is not set<br>
&gt; -BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_KVM_UNIT_TESTS is not set<br>
&gt; -# BR2_PACKAGE_LATENCYTOP is not set<br>
&gt; -# BR2_PACKAGE_LIBBPF is not set<br>
&gt; -# BR2_PACKAGE_LMBENCH is not set<br>
&gt; -BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_LTP_TESTSUITE is not set<br>
&gt; -BR2_PACKAGE_LTRACE_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_LTRACE is not set<br>
&gt; -# BR2_PACKAGE_LTTNG_BABELTRACE is not set<br>
&gt; -# BR2_PACKAGE_LTTNG_MODULES is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# lttng-tools needs a toolchain w/ threads, dynamic library, C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_MBPOLL is not set<br>
&gt; -# BR2_PACKAGE_MBW is not set<br>
&gt; -# BR2_PACKAGE_MEMSTAT is not set<br>
&gt; -# BR2_PACKAGE_NETPERF is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# netsniff-ng needs a toolchain w/ NPTL, C++, headers &gt;=3D 3.0<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_NMON is not set<br>
&gt; -BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# oprofile needs a toolchain w/ C++, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PAX_UTILS is not set<br>
&gt; -BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_PERFTEST is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# piglit needs a glibc or musl toolchain w/ C++<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_PLY_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_PLY is not set<br>
&gt; -# BR2_PACKAGE_POKE is not set<br>
&gt; -BR2_PACKAGE_PTM2HUMAN_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_PTM2HUMAN is not set<br>
&gt; -# BR2_PACKAGE_PV is not set<br>
&gt; -# BR2_PACKAGE_RAMSMP is not set<br>
&gt; -# BR2_PACKAGE_RAMSPEED is not set<br>
&gt; -# BR2_PACKAGE_RT_TESTS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# rwmem needs a toolchain w/ C++, wchar, gcc &gt;=3D 10<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# sentry-native needs a glibc toolchain with w/ wchar, thread, C++, g=
cc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# signal-estimator needs a toochain w/ C++, threads, gcc &gt;=3D 7<br=
>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SPIDEV_TEST is not set<br>
&gt; -# BR2_PACKAGE_STRACE is not set<br>
&gt; -# BR2_PACKAGE_STRESS is not set<br>
&gt; -# BR2_PACKAGE_STRESS_NG is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# sysdig needs a glibc toolchain w/ C++, threads, gcc &gt;=3D 5, dyna=
mic library, a Linux kernel, and luajit or lua 5.1 to be built<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_TCF_AGENT is not set<br>
&gt; -BR2_PACKAGE_TCF_AGENT_ARCH=3D&quot;arm&quot;<br>
&gt; -BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_TINYMEMBENCH is not set<br>
&gt; -# BR2_PACKAGE_TRACE_CMD is not set<br>
&gt; -BR2_PACKAGE_TRINITY_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_TRINITY is not set<br>
&gt; -# BR2_PACKAGE_UCLIBC_NG_TEST is not set<br>
&gt; -BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_UFTRACE is not set<br>
&gt; -BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_VALGRIND is not set<br>
&gt; -# BR2_PACKAGE_VMTOUCH is not set<br>
&gt; -# BR2_PACKAGE_WHETSTONE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Development tools<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_AVOCADO is not set<br>
&gt; -# BR2_PACKAGE_BINUTILS is not set<br>
&gt; -# BR2_PACKAGE_BITWISE is not set<br>
&gt; -# BR2_PACKAGE_BSDIFF is not set<br>
&gt; -# BR2_PACKAGE_CHECK is not set<br>
&gt; -BR2_PACKAGE_CMAKE_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ctest needs a toolchain w/ C++, wchar, dynamic library, gcc &gt;=3D=
 4.9, NPTL<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cppunit needs a toolchain w/ C++, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CUKINIA is not set<br>
&gt; -# BR2_PACKAGE_CUNIT is not set<br>
&gt; -# BR2_PACKAGE_CVS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cxxtest needs a toolchain w/ C++ support<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FLEX is not set<br>
&gt; -# BR2_PACKAGE_GETTEXT is not set<br>
&gt; -BR2_PACKAGE_PROVIDES_HOST_GETTEXT=3D&quot;host-gettext-tiny&quot;<br>
&gt; -# BR2_PACKAGE_GIT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# git-crypt needs a toolchain w/ C++, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gperf needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_JO is not set<br>
&gt; -# BR2_PACKAGE_JQ is not set<br>
&gt; -# BR2_PACKAGE_LIBTOOL is not set<br>
&gt; -# BR2_PACKAGE_MAKE is not set<br>
&gt; -# BR2_PACKAGE_MAWK is not set<br>
&gt; -# BR2_PACKAGE_PKGCONF is not set<br>
&gt; -# BR2_PACKAGE_RIPGREP is not set<br>
&gt; -# BR2_PACKAGE_SUBVERSION is not set<br>
&gt; -# BR2_PACKAGE_TREE is not set<br>
&gt; -# BR2_PACKAGE_UNIFDEF is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Filesystem and flash utilities<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ABOOTIMG is not set<br>
&gt; -# BR2_PACKAGE_AUFS_UTIL is not set<br>
&gt; -# BR2_PACKAGE_AUTOFS is not set<br>
&gt; -# BR2_PACKAGE_BTRFS_PROGS is not set<br>
&gt; -# BR2_PACKAGE_CIFS_UTILS is not set<br>
&gt; -# BR2_PACKAGE_CPIO is not set<br>
&gt; -# BR2_PACKAGE_CRAMFS is not set<br>
&gt; -# BR2_PACKAGE_CURLFTPFS is not set<br>
&gt; -# BR2_PACKAGE_DAVFS2 is not set<br>
&gt; -# BR2_PACKAGE_DOSFSTOOLS is not set<br>
&gt; -# BR2_PACKAGE_DUST is not set<br>
&gt; -# BR2_PACKAGE_E2FSPROGS is not set<br>
&gt; -# BR2_PACKAGE_E2TOOLS is not set<br>
&gt; -# BR2_PACKAGE_ECRYPTFS_UTILS is not set<br>
&gt; -# BR2_PACKAGE_EROFS_UTILS is not set<br>
&gt; -# BR2_PACKAGE_EXFAT is not set<br>
&gt; -# BR2_PACKAGE_EXFAT_UTILS is not set<br>
&gt; -# BR2_PACKAGE_EXFATPROGS is not set<br>
&gt; -# BR2_PACKAGE_F2FS_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_FIRMWARE_UTILS is not set<br>
&gt; -# BR2_PACKAGE_FLASHBENCH is not set<br>
&gt; -# BR2_PACKAGE_FSCRYPTCTL is not set<br>
&gt; -# BR2_PACKAGE_FUSE_OVERLAYFS is not set<br>
&gt; -# BR2_PACKAGE_FWUP is not set<br>
&gt; -# BR2_PACKAGE_GENEXT2FS is not set<br>
&gt; -# BR2_PACKAGE_GENPART is not set<br>
&gt; -# BR2_PACKAGE_GENROMFS is not set<br>
&gt; -# BR2_PACKAGE_GOCRYPTFS is not set<br>
&gt; -# BR2_PACKAGE_IMX_USB_LOADER is not set<br>
&gt; -# BR2_PACKAGE_MMC_UTILS is not set<br>
&gt; -# BR2_PACKAGE_MTD is not set<br>
&gt; -# BR2_PACKAGE_MTOOLS is not set<br>
&gt; -# BR2_PACKAGE_NFS_UTILS is not set<br>
&gt; -# BR2_PACKAGE_NILFS_UTILS is not set<br>
&gt; -# BR2_PACKAGE_NTFS_3G is not set<br>
&gt; -# BR2_PACKAGE_SP_OOPS_EXTRACT is not set<br>
&gt; -# BR2_PACKAGE_SQUASHFS is not set<br>
&gt; -# BR2_PACKAGE_SSHFS is not set<br>
&gt; -# BR2_PACKAGE_SUNXI_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_UDFTOOLS is not set<br>
&gt; -# BR2_PACKAGE_UNIONFS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# xfsprogs needs a toolchain w/ threads, C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ZEROFREE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# zfs needs udev /dev management<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Fonts, cursors, icons, sounds and themes<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Cursors<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_COMIX_CURSORS is not set<br>
&gt; -# BR2_PACKAGE_OBSIDIAN_CURSORS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Fonts<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BITSTREAM_VERA is not set<br>
&gt; -# BR2_PACKAGE_CANTARELL is not set<br>
&gt; -# BR2_PACKAGE_DEJAVU is not set<br>
&gt; -# BR2_PACKAGE_FONT_AWESOME is not set<br>
&gt; -# BR2_PACKAGE_GHOSTSCRIPT_FONTS is not set<br>
&gt; -# BR2_PACKAGE_INCONSOLATA is not set<br>
&gt; -# BR2_PACKAGE_LIBERATION is not set<br>
&gt; -# BR2_PACKAGE_WQY_ZENHEI is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Icons<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_HICOLOR_ICON_THEME is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Sounds<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SOUND_THEME_BOREALIS is not set<br>
&gt; -# BR2_PACKAGE_SOUND_THEME_FREEDESKTOP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Themes<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Games<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ASCII_INVADERS is not set<br>
&gt; -# BR2_PACKAGE_CHOCOLATE_DOOM is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# flare-engine needs a toolchain w/ C++, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FROTZ is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gnuchess needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LBREAKOUT2 is not set<br>
&gt; -# BR2_PACKAGE_LTRIS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# minetest needs a toolchain w/ C++, gcc &gt;=3D 5.1, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPENTYRIAN is not set<br>
&gt; -# BR2_PACKAGE_PRBOOM is not set<br>
&gt; -# BR2_PACKAGE_SL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# solarus needs OpenGL and a toolchain w/ C++, gcc &gt;=3D 4.9, NPTL,=
 dynamic library, and luajit or lua 5.1<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# stella needs a toolchain w/ dynamic library, C++, threads, gcc &gt;=
=3D 7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_XORCURSES is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Graphic libraries and applications (graphic/text)<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Graphic applications<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cage needs udev, EGL w/ Wayland backend and OpenGL ES support<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cog needs wpewebkit and a toolchain w/ threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FSWEBCAM is not set<br>
&gt; -# BR2_PACKAGE_GHOSTSCRIPT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# glmark2 needs a toolchain w/ C++, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# glslsandbox-player needs openGL ES and EGL driver<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GNUPLOT is not set<br>
&gt; -# BR2_PACKAGE_JHEAD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# kmscube needs EGL, GBM and OpenGL ES, and a toolchain w/ thread sup=
port<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libva-utils needs a toolchain w/ C++, threads, dynamic library<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_MIDORI_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# midori needs a glibc toolchain w/ C++, wchar, threads, dynamic libr=
ary, gcc &gt;=3D 7, host gcc &gt;=3D 8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# midori needs libgtk3 w/ X11 or wayland backend<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_NETSURF_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_NETSURF is not set<br>
&gt; -# BR2_PACKAGE_PNGQUANT is not set<br>
&gt; -# BR2_PACKAGE_RRDTOOL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# spirv-tools needs a toolchain w/ C++, gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# stellarium needs Qt5 and an OpenGL provider<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES supp=
ort<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc=
 &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SWAYBG is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# tesseract-ocr needs a toolchain w/ threads, C++, gcc &gt;=3D 7, dyn=
amic library, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_TINIFIER is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Graphic libraries<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cegui needs a toolchain w/ C++, threads, dynamic library, wchar, gc=
c &gt;=3D 5<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# directfb needs a glibc or uClibc toolchain w/ C++, NPTL, gcc &gt;=
=3D 4.5, dynamic library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# efl needs a toolchain w/ C++, dynamic library, gcc &gt;=3D 4.9, hos=
t gcc &gt;=3D 4.9, threads, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FB_TEST_APP is not set<br>
&gt; -# BR2_PACKAGE_FBDUMP is not set<br>
&gt; -# BR2_PACKAGE_FBGRAB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# fbterm needs a toolchain w/ C++, wchar, locale<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FBV is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# flutter-gallery needs flutter-engine<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# flutter-pi needs flutter-engine<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# flutter-pi needs GBM, systemd, and udev<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# freerdp needs a toolchain w/ wchar, dynamic library, threads, C++<b=
r>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GRAPHICSMAGICK is not set<br>
&gt; -# BR2_PACKAGE_IMAGEMAGICK is not set<br>
&gt; -# BR2_PACKAGE_LIBGLVND is not set<br>
&gt; -# BR2_PACKAGE_LINUX_FUSION is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mesa3d needs a toolchain w/ gcc &gt;=3D8, C++, NPTL, dynamic librar=
y<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ocrad needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ogre needs a toolchain w/ C++, dynamic library, gcc &gt;=3D 4.8, th=
reads, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PSPLASH is not set<br>
&gt; -# BR2_PACKAGE_SDL is not set<br>
&gt; -# BR2_PACKAGE_SDL2 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# spirv-headers needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_VULKAN_HEADERS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# vulkan-loader needs a toolchain w/ C++, dynamic library, threads<br=
>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# vulkan-tools needs a toolchain w/ C++, dynamic library, threads, gc=
c &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Other GUIs<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_QT5_JSCORE_AVAILABLE=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Qt5 needs host g++ &gt;=3D 5.0, and a toolchain w/ gcc &gt;=3D 5.0,=
 wchar, NPTL, C++, dynamic library<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_QT6_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# qt6 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc =
&gt;=3D 8, host gcc &gt;=3D 8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# tekui needs a Lua interpreter and a toolchain w/ threads, dynamic l=
ibrary<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# weston needs udev and a toolchain w/ locale, threads, dynamic libra=
ry, headers &gt;=3D 3.0<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_XORG7 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# apitrace needs a toolchain w/ C++, wchar, dynamic library, threads,=
 gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mupdf needs a toolchain w/ C++, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc &=
gt;=3D 10<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# vte needs an OpenGL or an OpenGL-EGL/wayland backend<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_XKEYBOARD_CONFIG is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Hardware handling<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Firmware<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_AM33X_CM3 is not set<br>
&gt; -# BR2_PACKAGE_ARMBIAN_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_B43_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI is not set<br>
&gt; -# BR2_PACKAGE_LINUX_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_MURATA_CYW_FW is not set<br>
&gt; -# BR2_PACKAGE_ODROIDC2_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_QCOM_DB410C_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_QORIQ_FM_UCODE is not set<br>
&gt; -# BR2_PACKAGE_RCW_SMARC_SAL28 is not set<br>
&gt; -# BR2_PACKAGE_RPI_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_SUNXI_BOARDS is not set<br>
&gt; -# BR2_PACKAGE_TS4900_FPGA is not set<br>
&gt; -# BR2_PACKAGE_UX500_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_WILC1000_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_WILC3000_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_WILINK_BT_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_ZD1211_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_18XX_TI_UTILS is not set<br>
&gt; -# BR2_PACKAGE_A10DISP is not set<br>
&gt; -# BR2_PACKAGE_ACPICA is not set<br>
&gt; -# BR2_PACKAGE_ACPID is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# acpitool needs a toolchain w/ threads, C++, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_AER_INJECT is not set<br>
&gt; -# BR2_PACKAGE_ALTERA_STAPL is not set<br>
&gt; -# BR2_PACKAGE_AM335X_PRU_PACKAGE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# apcupsd needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_AVRDUDE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# bcache-tools needs udev /dev management<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# brickd needs udev /dev management, a toolchain w/ threads, wchar<br=
>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BRLTTY is not set<br>
&gt; -# BR2_PACKAGE_CBOOTIMAGE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cc-tool needs a toolchain w/ C++, threads, wchar, gcc &gt;=3D 4.9<b=
r>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CDRKIT is not set<br>
&gt; -BR2_PACKAGE_CPUBURN_ARM_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_CPUBURN_ARM is not set<br>
&gt; -# BR2_PACKAGE_CRUCIBLE is not set<br>
&gt; -# BR2_PACKAGE_CRYPTSETUP is not set<br>
&gt; -# BR2_PACKAGE_CWIID is not set<br>
&gt; -# BR2_PACKAGE_DAHDI_LINUX is not set<br>
&gt; -# BR2_PACKAGE_DAHDI_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_DAVINCI_BOOTCOUNT is not set<br>
&gt; -# BR2_PACKAGE_DBUS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# dbusbroker needs systemd and a toolchain w/ threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# dbus-cxx needs a toolchain w/ C++, threads, gcc &gt;=3D 7 and dynam=
ic library support<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DFU_PROGRAMMER is not set<br>
&gt; -# BR2_PACKAGE_DFU_UTIL is not set<br>
&gt; -# BR2_PACKAGE_DMRAID is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# dt-utils needs udev /dev management<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DTBOCFG is not set<br>
&gt; -# BR2_PACKAGE_DTV_SCAN_TABLES is not set<br>
&gt; -# BR2_PACKAGE_DUMP1090 is not set<br>
&gt; -# BR2_PACKAGE_DVB_APPS is not set<br>
&gt; -# BR2_PACKAGE_DVBSNOOP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# edid-decode needs a toolchain w/ C++, gcc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ESP_HOSTED is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# eudev needs eudev /dev management<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_EVEMU is not set<br>
&gt; -# BR2_PACKAGE_EVTEST is not set<br>
&gt; -# BR2_PACKAGE_FAN_CTRL is not set<br>
&gt; -# BR2_PACKAGE_FCONFIG is not set<br>
&gt; -BR2_PACKAGE_FLASHROM_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_FLASHROM is not set<br>
&gt; -# BR2_PACKAGE_FMTOOLS is not set<br>
&gt; -# BR2_PACKAGE_FREEIPMI is not set<br>
&gt; -# BR2_PACKAGE_FREESCALE_IMX is not set<br>
&gt; -# BR2_PACKAGE_FXLOAD is not set<br>
&gt; -# BR2_PACKAGE_GCNANO_BINARIES is not set<br>
&gt; -# BR2_PACKAGE_GPM is not set<br>
&gt; -# BR2_PACKAGE_GPSD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gptfdisk needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GVFS is not set<br>
&gt; -# BR2_PACKAGE_HDDTEMP is not set<br>
&gt; -# BR2_PACKAGE_HWDATA is not set<br>
&gt; -# BR2_PACKAGE_HWLOC is not set<br>
&gt; -# BR2_PACKAGE_INPUT_EVENT_DAEMON is not set<br>
&gt; -# BR2_PACKAGE_IPMITOOL is not set<br>
&gt; -# BR2_PACKAGE_IRDA_UTILS is not set<br>
&gt; -# BR2_PACKAGE_KBD is not set<br>
&gt; -# BR2_PACKAGE_LCDPROC is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ledmon needs udev and a toolchain w/ threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libiec61850 needs a toolchain w/ C++, threads, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBMANETTE is not set<br>
&gt; -# BR2_PACKAGE_LIBUBOOTENV is not set<br>
&gt; -# BR2_PACKAGE_LIBUIO is not set<br>
&gt; -# BR2_PACKAGE_LINUX_BACKPORTS is not set<br>
&gt; -# BR2_PACKAGE_LINUX_SERIAL_TEST is not set<br>
&gt; -# BR2_PACKAGE_LINUXCONSOLETOOLS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# lirc-tools needs a toolchain w/ threads, dynamic library, C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LM_SENSORS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# lshw needs a toolchain w/ C++, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LSSCSI is not set<br>
&gt; -# BR2_PACKAGE_LSUIO is not set<br>
&gt; -# BR2_PACKAGE_LUKSMETA is not set<br>
&gt; -# BR2_PACKAGE_LVM2 is not set<br>
&gt; -# BR2_PACKAGE_MALI_DRIVER is not set<br>
&gt; -# BR2_PACKAGE_MALI_T76X is not set<br>
&gt; -# BR2_PACKAGE_MBPFAN is not set<br>
&gt; -# BR2_PACKAGE_MDADM is not set<br>
&gt; -# BR2_PACKAGE_MDEVD is not set<br>
&gt; -# BR2_PACKAGE_MDIO_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_MEMTESTER is not set<br>
&gt; -# BR2_PACKAGE_MEMTOOL is not set<br>
&gt; -# BR2_PACKAGE_MHZ is not set<br>
&gt; -# BR2_PACKAGE_MINICOM is not set<br>
&gt; -# BR2_PACKAGE_NANOCOM is not set<br>
&gt; -# BR2_PACKAGE_NEARD is not set<br>
&gt; -# BR2_PACKAGE_NVIDIA_MODPROBE is not set<br>
&gt; -# BR2_PACKAGE_NVIDIA_PERSISTENCED is not set<br>
&gt; -# BR2_PACKAGE_NVME is not set<br>
&gt; -# BR2_PACKAGE_OFONO is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ola needs a toolchain w/ C++, threads, dynamic library, gcc &gt;=3D=
 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPEN2300 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# openfpgaloader needs a toolchain w/ threads, C++, gcc &gt;=3D 4.9<b=
r>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPENIPMI is not set<br>
&gt; -# BR2_PACKAGE_OPENOCD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# owl-linux is only supported on ARM9 architecture<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PARTED is not set<br>
&gt; -# BR2_PACKAGE_PCIUTILS is not set<br>
&gt; -# BR2_PACKAGE_PDBG is not set<br>
&gt; -# BR2_PACKAGE_PICOCOM is not set<br>
&gt; -# BR2_PACKAGE_PIFMRDS is not set<br>
&gt; -# BR2_PACKAGE_PIGPIO is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# powertop needs a toolchain w/ C++, threads, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PPS_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_PRU_SOFTWARE_SUPPORT is not set<br>
&gt; -# BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_RASPI_GPIO is not set<br>
&gt; -# BR2_PACKAGE_RDMA_CORE is not set<br>
&gt; -# BR2_PACKAGE_READ_EDID is not set<br>
&gt; -# BR2_PACKAGE_RNG_TOOLS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# rockchip-mali needs a glibc toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ROCKCHIP_RKBIN is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# rpi-userland needs a toolchain w/ C++, threads, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_RS485CONF is not set<br>
&gt; -# BR2_PACKAGE_RTC_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_RTL8188EU is not set<br>
&gt; -# BR2_PACKAGE_RTL8189ES is not set<br>
&gt; -# BR2_PACKAGE_RTL8189FS is not set<br>
&gt; -# BR2_PACKAGE_RTL8192EU is not set<br>
&gt; -# BR2_PACKAGE_RTL8723BU is not set<br>
&gt; -# BR2_PACKAGE_RTL8723DS is not set<br>
&gt; -# BR2_PACKAGE_RTL8723DS_BT is not set<br>
&gt; -# BR2_PACKAGE_RTL8812AU_AIRCRACK_NG is not set<br>
&gt; -# BR2_PACKAGE_RTL8821AU is not set<br>
&gt; -# BR2_PACKAGE_RTL8821CU is not set<br>
&gt; -# BR2_PACKAGE_RTL8822CS is not set<br>
&gt; -# BR2_PACKAGE_SANE_BACKENDS is not set<br>
&gt; -# BR2_PACKAGE_SDPARM is not set<br>
&gt; -BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# sedutil needs a toolchain w/ C++, gcc &gt;=3D 4.8, headers &gt;=3D =
3.12<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SETSERIAL is not set<br>
&gt; -# BR2_PACKAGE_SG3_UTILS is not set<br>
&gt; -# BR2_PACKAGE_SIGROK_CLI is not set<br>
&gt; -# BR2_PACKAGE_SISPMCTL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# smartmontools needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SMSTOOLS3 is not set<br>
&gt; -# BR2_PACKAGE_SPI_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_SREDIRD is not set<br>
&gt; -# BR2_PACKAGE_STATSERIAL is not set<br>
&gt; -# BR2_PACKAGE_STM32FLASH is not set<br>
&gt; -# BR2_PACKAGE_SUNXI_CEDARX is not set<br>
&gt; -# BR2_PACKAGE_SUNXI_MALI_UTGARD is not set<br>
&gt; -# BR2_PACKAGE_SYSSTAT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# targetcli-fb depends on Python<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_TI_GFX is not set<br>
&gt; -# BR2_PACKAGE_TI_SGX_KM is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ti-sgx-um needs udev and a glibc toolchain w/ threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_TI_UIM is not set<br>
&gt; -# BR2_PACKAGE_TI_UTILS is not set<br>
&gt; -# BR2_PACKAGE_TIO is not set<br>
&gt; -# BR2_PACKAGE_TRIGGERHAPPY is not set<br>
&gt; -# BR2_PACKAGE_UBOOT_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_UBUS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# udisks needs udev /dev management<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_UHUBCTL is not set<br>
&gt; -# BR2_PACKAGE_UMTPRD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# upower needs udev /dev management<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_USB_MODESWITCH is not set<br>
&gt; -# BR2_PACKAGE_USB_MODESWITCH_DATA is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# usbguard needs a toolchain w/ C++, threads, dynamic library, gcc &g=
t;=3D 8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# usbmount requires udev to be enabled<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# usbutils needs udev /dev management and toolchain w/ threads, gcc &=
gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_W_SCAN is not set<br>
&gt; -# BR2_PACKAGE_WF111 is not set<br>
&gt; -# BR2_PACKAGE_WILC_DRIVER is not set<br>
&gt; -# BR2_PACKAGE_WIPE is not set<br>
&gt; -# BR2_PACKAGE_XORRISO is not set<br>
&gt; -# BR2_PACKAGE_XR819_XRADIO is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Interpreter languages and scripting<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_4TH is not set<br>
&gt; -# BR2_PACKAGE_ENSCRIPT is not set<br>
&gt; -BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_ERLANG_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_ERLANG is not set<br>
&gt; -# BR2_PACKAGE_EXECLINE is not set<br>
&gt; -# BR2_PACKAGE_FICL is not set<br>
&gt; -BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_GAUCHE is not set<br>
&gt; -# BR2_PACKAGE_GUILE is not set<br>
&gt; -# BR2_PACKAGE_HASERL is not set<br>
&gt; -# BR2_PACKAGE_JANET is not set<br>
&gt; -# BR2_PACKAGE_JIMTCL is not set<br>
&gt; -# BR2_PACKAGE_LUA is not set<br>
&gt; -BR2_PACKAGE_PROVIDES_HOST_LUAINTERPRETER=3D&quot;host-lua&quot;<br>
&gt; -BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_LUAJIT is not set<br>
&gt; -# BR2_PACKAGE_MICROPYTHON is not set<br>
&gt; -# BR2_PACKAGE_MOARVM is not set<br>
&gt; -BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_MONO_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mono needs a toolchain w/ C++, NPTL, dynamic library<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_NODEJS_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc &gt;=3D=
 10, wchar, host gcc &gt;=3D 10<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# octave needs a toolchain w/ C++ and fortran, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# openjdk needs X.Org<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# openjdk needs glibc, and a toolchain w/ wchar, dynamic library, thr=
eads, C++, gcc &gt;=3D 4.9, host gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PERL is not set<br>
&gt; -BR2_PACKAGE_PHP_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_PHP is not set<br>
&gt; -# BR2_PACKAGE_PYTHON3 is not set<br>
&gt; -# BR2_PACKAGE_QUICKJS is not set<br>
&gt; -# BR2_PACKAGE_RUBY is not set<br>
&gt; -# BR2_PACKAGE_TCL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Libraries<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Audio/Sound<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ALSA_LIB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# alure needs a toolchain w/ C++, gcc &gt;=3D 4.9, NPTL, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_AUBIO is not set<br>
&gt; -# BR2_PACKAGE_BCG729 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# caps needs a toolchain w/ C++, dynamic library<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# fdk-aac needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBAO is not set<br>
&gt; -# BR2_PACKAGE_LIBBROADVOICE is not set<br>
&gt; -# BR2_PACKAGE_LIBCANBERRA is not set<br>
&gt; -# BR2_PACKAGE_LIBCDAUDIO is not set<br>
&gt; -# BR2_PACKAGE_LIBCDDB is not set<br>
&gt; -# BR2_PACKAGE_LIBCDIO is not set<br>
&gt; -# BR2_PACKAGE_LIBCDIO_PARANOIA is not set<br>
&gt; -# BR2_PACKAGE_LIBCODEC2 is not set<br>
&gt; -# BR2_PACKAGE_LIBCUE is not set<br>
&gt; -# BR2_PACKAGE_LIBCUEFILE is not set<br>
&gt; -# BR2_PACKAGE_LIBEBUR128 is not set<br>
&gt; -# BR2_PACKAGE_LIBG7221 is not set<br>
&gt; -# BR2_PACKAGE_LIBGSM is not set<br>
&gt; -# BR2_PACKAGE_LIBID3TAG is not set<br>
&gt; -# BR2_PACKAGE_LIBILBC is not set<br>
&gt; -# BR2_PACKAGE_LIBLO is not set<br>
&gt; -# BR2_PACKAGE_LIBMAD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libmodplug needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBMPD is not set<br>
&gt; -# BR2_PACKAGE_LIBMPDCLIENT is not set<br>
&gt; -# BR2_PACKAGE_LIBREPLAYGAIN is not set<br>
&gt; -# BR2_PACKAGE_LIBSAMPLERATE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libsidplay2 needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBSILK is not set<br>
&gt; -# BR2_PACKAGE_LIBSNDFILE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libsoundtouch needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBSOXR is not set<br>
&gt; -# BR2_PACKAGE_LIBVORBIS is not set<br>
&gt; -# BR2_PACKAGE_LILV is not set<br>
&gt; -# BR2_PACKAGE_LV2 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mp4v2 needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_OPENAL_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# openal needs a toolchain w/ NPTL, C++, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# opencore-amr needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPUS is not set<br>
&gt; -# BR2_PACKAGE_OPUSFILE is not set<br>
&gt; -# BR2_PACKAGE_PORTAUDIO is not set<br>
&gt; -# BR2_PACKAGE_SBC is not set<br>
&gt; -# BR2_PACKAGE_SPANDSP is not set<br>
&gt; -# BR2_PACKAGE_SPEEX is not set<br>
&gt; -# BR2_PACKAGE_SPEEXDSP is not set<br>
&gt; -# BR2_PACKAGE_SRATOM is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# taglib needs a toolchain w/ C++, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_TINYALSA is not set<br>
&gt; -# BR2_PACKAGE_TREMOR is not set<br>
&gt; -# BR2_PACKAGE_VO_AACENC is not set<br>
&gt; -BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# webrtc-audio-processing needs a toolchain w/ C++, NPTL, gcc &gt;=3D=
 4.8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Compression and decompression<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBARCHIVE is not set<br>
&gt; -# BR2_PACKAGE_LIBDEFLATE is not set<br>
&gt; -# BR2_PACKAGE_LIBMSPACK is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libsquish needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBZIP is not set<br>
&gt; -# BR2_PACKAGE_LZ4 is not set<br>
&gt; -# BR2_PACKAGE_LZO is not set<br>
&gt; -# BR2_PACKAGE_MINIZIP is not set<br>
&gt; -# BR2_PACKAGE_MINIZIP_ZLIB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# snappy needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SZIP is not set<br>
&gt; -# BR2_PACKAGE_ZCHUNK is not set<br>
&gt; -BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_ZLIB is not set<br>
&gt; -BR2_PACKAGE_PROVIDES_HOST_ZLIB=3D&quot;host-libzlib&quot;<br>
&gt; -# BR2_PACKAGE_ZZIPLIB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Crypto<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BEARSSL is not set<br>
&gt; -# BR2_PACKAGE_BEECRYPT is not set<br>
&gt; -BR2_PACKAGE_BOTAN_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# botan needs a toolchain w/ C++, threads, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CA_CERTIFICATES is not set<br>
&gt; -# BR2_PACKAGE_CRYPTODEV_LINUX is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cryptopp needs a toolchain w/ C++, dynamic library, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GCR is not set<br>
&gt; -# BR2_PACKAGE_GNUTLS is not set<br>
&gt; -# BR2_PACKAGE_LIBARGON2 is not set<br>
&gt; -# BR2_PACKAGE_LIBASSUAN is not set<br>
&gt; -# BR2_PACKAGE_LIBB2 is not set<br>
&gt; -# BR2_PACKAGE_LIBGCRYPT is not set<br>
&gt; -BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_LIBGPG_ERROR is not set<br>
&gt; -BR2_PACKAGE_LIBGPG_ERROR_SYSCFG=3D&quot;arm-unknown-linux-gnueabi&quo=
t;<br>
&gt; -# BR2_PACKAGE_LIBGPGME is not set<br>
&gt; -# BR2_PACKAGE_LIBKCAPI is not set<br>
&gt; -# BR2_PACKAGE_LIBKSBA is not set<br>
&gt; -# BR2_PACKAGE_LIBMD is not set<br>
&gt; -# BR2_PACKAGE_LIBMHASH is not set<br>
&gt; -# BR2_PACKAGE_LIBNSS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libolm needs a toolchain w/ C++, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBP11 is not set<br>
&gt; -# BR2_PACKAGE_LIBSCRYPT is not set<br>
&gt; -# BR2_PACKAGE_LIBSECRET is not set<br>
&gt; -# BR2_PACKAGE_LIBSHA1 is not set<br>
&gt; -# BR2_PACKAGE_LIBSODIUM is not set<br>
&gt; -# BR2_PACKAGE_LIBSSH is not set<br>
&gt; -# BR2_PACKAGE_LIBSSH2 is not set<br>
&gt; -# BR2_PACKAGE_LIBTOMCRYPT is not set<br>
&gt; -# BR2_PACKAGE_LIBUECC is not set<br>
&gt; -# BR2_PACKAGE_LIBXCRYPT is not set<br>
&gt; -# BR2_PACKAGE_MBEDTLS is not set<br>
&gt; -# BR2_PACKAGE_NETTLE is not set<br>
&gt; -# BR2_PACKAGE_OPENSSL is not set<br>
&gt; -BR2_PACKAGE_PROVIDES_HOST_OPENSSL=3D&quot;host-libopenssl&quot;<br>
&gt; -# BR2_PACKAGE_PKCS11_HELPER is not set<br>
&gt; -# BR2_PACKAGE_RHASH is not set<br>
&gt; -# BR2_PACKAGE_TINYDTLS is not set<br>
&gt; -# BR2_PACKAGE_TPM2_PKCS11 is not set<br>
&gt; -# BR2_PACKAGE_TPM2_TSS is not set<br>
&gt; -# BR2_PACKAGE_TROUSERS is not set<br>
&gt; -# BR2_PACKAGE_USTREAM_SSL is not set<br>
&gt; -BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_WOLFSSL is not set<br>
&gt; -# BR2_PACKAGE_WOLFTPM is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Database<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BERKELEYDB is not set<br>
&gt; -# BR2_PACKAGE_GDBM is not set<br>
&gt; -# BR2_PACKAGE_HIREDIS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# kompexsqlite needs a toolchain w/ C++, wchar, threads, dynamic libr=
ary<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# leveldb needs a toolchain w/ C++, threads, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBDBI is not set<br>
&gt; -# BR2_PACKAGE_LIBDBI_DRIVERS is not set<br>
&gt; -# BR2_PACKAGE_LIBGIT2 is not set<br>
&gt; -# BR2_PACKAGE_LIBMDBX is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libodb needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_MONGODB_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mongodb needs a glibc toolchain w/ wchar, threads, C++, gcc &gt;=3D=
 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mysql needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_POSTGRESQL is not set<br>
&gt; -# BR2_PACKAGE_REDIS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# redis-plus-plus needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SQLCIPHER is not set<br>
&gt; -# BR2_PACKAGE_SQLITE is not set<br>
&gt; -# BR2_PACKAGE_UNIXODBC is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Filesystem<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GAMIN is not set<br>
&gt; -# BR2_PACKAGE_LIBCONFIG is not set<br>
&gt; -# BR2_PACKAGE_LIBCONFUSE is not set<br>
&gt; -# BR2_PACKAGE_LIBFUSE is not set<br>
&gt; -# BR2_PACKAGE_LIBFUSE3 is not set<br>
&gt; -# BR2_PACKAGE_LIBLOCKFILE is not set<br>
&gt; -# BR2_PACKAGE_LIBNFS is not set<br>
&gt; -# BR2_PACKAGE_LIBSYSFS is not set<br>
&gt; -# BR2_PACKAGE_LOCKDEV is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# physfs needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Graphics<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# assimp needs a toolchain w/ C++, wchar, gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_AT_SPI2_CORE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# atkmm needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc &gt;=
=3D 4.9<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_BAYER2RGB_NEON_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# bayer2rgb-neon needs a toolchain w/ C++, dynamic library, gcc &gt;=
=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# bullet needs a toolchain w/ C++, dynamic library, threads, wchar<br=
>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CAIRO is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cairomm needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cairomm (1.14.x) needs a toolchain w/ C++, wchar, threads, gcc &gt;=
=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# chipmunk needs an OpenGL backend<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# exempi needs a toolchain w/ C++, dynamic library, threads, wchar<br=
>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# exiv2 needs a uClibc or glibc toolchain w/ C++, wchar, dynamic libr=
ary, threads<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# flutter-engine needs an OpenGL or OpenGLES backend<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# flutter-engine needs a glibc toolchain w/ wchar, C++, gcc &gt;=3D 5=
, dynamic library, host gcc &gt;=3D 5, NPTL<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FONTCONFIG is not set<br>
&gt; -# BR2_PACKAGE_FREETYPE is not set<br>
&gt; -# BR2_PACKAGE_GD is not set<br>
&gt; -# BR2_PACKAGE_GDK_PIXBUF is not set<br>
&gt; -# BR2_PACKAGE_GIFLIB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# granite needs libgtk3 and a toolchain w/ wchar, threads, gcc &gt;=
=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# graphite2 needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc &g=
t;=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# harfbuzz needs a toolchain w/ C++, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_IJS is not set<br>
&gt; -# BR2_PACKAGE_IMLIB2 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# intel-gmmlib needs a toolchain w/ dynamic library, C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# irrlicht needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_JASPER is not set<br>
&gt; -# BR2_PACKAGE_JBIG2DEC is not set<br>
&gt; -BR2_PACKAGE_JPEG_SIMD_SUPPORT=3Dy<br>
&gt; -# BR2_PACKAGE_JPEG is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# kms++ needs a toolchain w/ threads, C++, gcc &gt;=3D 4.8, headers &=
gt;=3D 4.11, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LCMS2 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# lensfun needs a toolchain w/ C++, threads, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LEPTONICA is not set<br>
&gt; -# BR2_PACKAGE_LIBART is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libdecor needs a toolchain w/ wchar, threads, C++, gcc &gt;=3D 4.9<=
br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBDMTX is not set<br>
&gt; -# BR2_PACKAGE_LIBDRM is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libepoxy needs an OpenGL and/or OpenGL EGL backend<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBEXIF is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc &gt;=
=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBFM_EXTRA is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libfreeglut depends on X.org and needs an OpenGL backend<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libfreeimage needs a toolchain w/ C++, dynamic library, wchar<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libgeotiff needs a toolchain w/ C++, gcc &gt;=3D 4.7, threads, wcha=
r<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libglew depends on X.org and needs an OpenGL backend<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libglfw depends on X.org or Wayland and an OpenGL or GLES backend<b=
r>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libglu needs an OpenGL backend<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBGTA is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libgtk3 needs a toolchain w/ wchar, threads, C++, gcc &gt;=3D 4.9<b=
r>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libjxl needs a toolchain with C++, threads, gcc &gt;=3D 7, dynamic =
library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBMEDIAART is not set<br>
&gt; -# BR2_PACKAGE_LIBMNG is not set<br>
&gt; -# BR2_PACKAGE_LIBPNG is not set<br>
&gt; -# BR2_PACKAGE_LIBQRENCODE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libraw needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# librsvg needs a toolchain w/ wchar, threads, C++, gcc &gt;=3D 4.9<b=
r>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBSVG is not set<br>
&gt; -# BR2_PACKAGE_LIBSVG_CAIRO is not set<br>
&gt; -# BR2_PACKAGE_LIBSVGTINY is not set<br>
&gt; -# BR2_PACKAGE_LIBVA is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libvips needs a toolchain w/ wchar, threads, C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libwpe needs a toolchain w/ C++, dynamic library and an OpenEGL-cap=
able backend<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_MENU_CACHE is not set<br>
&gt; -BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# onevpl needs a toolchain w/ dynamic library, gcc &gt;=3D 7, C++, th=
reads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# onevpl-intel-gpu needs a toolchain w/ dynamic library, gcc &gt;=3D =
7, C++, NPTL<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# opencv3 needs a toolchain w/ C++, NPTL, wchar, dynamic library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# opencv4 needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc=
 &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPENJPEG is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# pango needs a toolchain w/ wchar, threads, C++, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# pangomm needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# pangomm (2.46.x) needs a toolchain w/ C++, wchar, threads, gcc &gt;=
=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PIXMAN is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# poppler needs a toolchain w/ wchar, C++, threads, dynamic library, =
gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_STB is not set<br>
&gt; -# BR2_PACKAGE_TIFF is not set<br>
&gt; -# BR2_PACKAGE_WAYLAND is not set<br>
&gt; -BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dyn=
amic library, gcc &gt;=3D 9, host gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_WEBP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# wlroots needs udev, EGL w/ Wayland backend and OpenGL ES support<br=
>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# woff2 needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# wpebackend-fdo needs a toolchain w/ C++, wchar, threads, dynamic li=
brary and an OpenEGL-capable Wayland backend<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library=
, gcc &gt;=3D 9, host gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# zbar needs a toolchain w/ threads, C++ and headers &gt;=3D 3.0<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# zxing-cpp needs a toolchain w/ C++, wchar, dynamic library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Hardware handling<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ACSCCID is not set<br>
&gt; -# BR2_PACKAGE_BCM2835 is not set<br>
&gt; -# BR2_PACKAGE_C_PERIPHERY is not set<br>
&gt; -# BR2_PACKAGE_CCID is not set<br>
&gt; -# BR2_PACKAGE_DTC is not set<br>
&gt; -BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_GNU_EFI is not set<br>
&gt; -# BR2_PACKAGE_HACKRF is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# hidapi needs udev /dev management and a toolchain w/ NPTL, threads,=
 gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_JITTERENTROPY_LIBRARY is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# lcdapi needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# let-me-create needs a toolchain w/ C++, threads, dynamic library<br=
>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBAIO is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libatasmart requires udev to be enabled<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libblockdev needs udev /dev management and a toolchain w/ wchar, th=
reads, dynamic library, locale<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libcec needs a toolchain w/ C++, wchar, threads, dynamic library, g=
cc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBDISPLAY_INFO is not set<br>
&gt; -# BR2_PACKAGE_LIBFREEFARE is not set<br>
&gt; -# BR2_PACKAGE_LIBFTDI is not set<br>
&gt; -# BR2_PACKAGE_LIBFTDI1 is not set<br>
&gt; -# BR2_PACKAGE_LIBGPHOTO2 is not set<br>
&gt; -# BR2_PACKAGE_LIBGPIOD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libgudev needs udev /dev handling and a toolchain w/ wchar, threads=
<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBHID is not set<br>
&gt; -# BR2_PACKAGE_LIBIIO is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libinput needs udev /dev management<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBIQRF is not set<br>
&gt; -# BR2_PACKAGE_LIBLLCP is not set<br>
&gt; -# BR2_PACKAGE_LIBMBIM is not set<br>
&gt; -# BR2_PACKAGE_LIBNFC is not set<br>
&gt; -# BR2_PACKAGE_LIBNVME is not set<br>
&gt; -# BR2_PACKAGE_LIBPCIACCESS is not set<br>
&gt; -# BR2_PACKAGE_LIBPHIDGET is not set<br>
&gt; -# BR2_PACKAGE_LIBPRI is not set<br>
&gt; -# BR2_PACKAGE_LIBQMI is not set<br>
&gt; -# BR2_PACKAGE_LIBQRTR_GLIB is not set<br>
&gt; -# BR2_PACKAGE_LIBRAW1394 is not set<br>
&gt; -# BR2_PACKAGE_LIBRTLSDR is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libserial needs a toolchain w/ C++, gcc &gt;=3D 5, threads, wchar<b=
r>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBSERIALPORT is not set<br>
&gt; -# BR2_PACKAGE_LIBSIGROK is not set<br>
&gt; -# BR2_PACKAGE_LIBSIGROKDECODE is not set<br>
&gt; -# BR2_PACKAGE_LIBSOC is not set<br>
&gt; -# BR2_PACKAGE_LIBSS7 is not set<br>
&gt; -# BR2_PACKAGE_LIBUSB is not set<br>
&gt; -# BR2_PACKAGE_LIBUSBGX is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libv4l needs a toolchain w/ threads, C++ and headers &gt;=3D 3.0<br=
>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBXKBCOMMON is not set<br>
&gt; -BR2_PACKAGE_MRAA_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_MRAA is not set<br>
&gt; -# BR2_PACKAGE_MTDEV is not set<br>
&gt; -BR2_PACKAGE_NE10_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_NE10 is not set<br>
&gt; -# BR2_PACKAGE_NEARDAL is not set<br>
&gt; -BR2_PACKAGE_OPENCSD_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# opencsd needs a toolchain w/ C++11, gcc &gt;=3D 4.8, dynamic librar=
y<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPENSC is not set<br>
&gt; -# BR2_PACKAGE_OWFS is not set<br>
&gt; -# BR2_PACKAGE_PCSC_LITE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# rpi-rgb-led-matrix needs a toolchain w/ C++, threads, dynamic libra=
ry<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_TSLIB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# uhd needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc &gt=
;=3D 5<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# urg needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Javascript<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ANGULARJS is not set<br>
&gt; -# BR2_PACKAGE_BOOTSTRAP is not set<br>
&gt; -# BR2_PACKAGE_CHARTJS is not set<br>
&gt; -# BR2_PACKAGE_DATATABLES is not set<br>
&gt; -# BR2_PACKAGE_DUKTAPE is not set<br>
&gt; -# BR2_PACKAGE_EXPLORERCANVAS is not set<br>
&gt; -# BR2_PACKAGE_FLOT is not set<br>
&gt; -# BR2_PACKAGE_FORGE is not set<br>
&gt; -# BR2_PACKAGE_JQUERY is not set<br>
&gt; -# BR2_PACKAGE_JSMIN is not set<br>
&gt; -# BR2_PACKAGE_JSON_JAVASCRIPT is not set<br>
&gt; -# BR2_PACKAGE_JSZIP is not set<br>
&gt; -# BR2_PACKAGE_OPENLAYERS is not set<br>
&gt; -# BR2_PACKAGE_POPPERJS is not set<br>
&gt; -# BR2_PACKAGE_VIS_NETWORK is not set<br>
&gt; -# BR2_PACKAGE_VUEJS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# JSON/XML<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# benejson needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CJSON is not set<br>
&gt; -# BR2_PACKAGE_EXPAT is not set<br>
&gt; -# BR2_PACKAGE_JANSSON is not set<br>
&gt; -# BR2_PACKAGE_JOSE is not set<br>
&gt; -# BR2_PACKAGE_JSMN is not set<br>
&gt; -# BR2_PACKAGE_JSON_C is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# json-for-modern-cpp needs a toolchain w/ C++, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_JSON_GLIB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# jsoncpp needs a toolchain w/ C++, gcc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBBSON is not set<br>
&gt; -# BR2_PACKAGE_LIBFASTJSON is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libjson needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBROXML is not set<br>
&gt; -# BR2_PACKAGE_LIBUCL is not set<br>
&gt; -# BR2_PACKAGE_LIBXML2 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libxml++ needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 7<br=
>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBXMLRPC is not set<br>
&gt; -# BR2_PACKAGE_LIBXSLT is not set<br>
&gt; -# BR2_PACKAGE_LIBYAML is not set<br>
&gt; -# BR2_PACKAGE_MXML is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# pugixml needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# rapidjson needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_RAPIDXML is not set<br>
&gt; -# BR2_PACKAGE_RAPTOR is not set<br>
&gt; -# BR2_PACKAGE_SERD is not set<br>
&gt; -# BR2_PACKAGE_SORD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# tinyxml needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# tinyxml2 needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# valijson needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# xerces-c++ needs a toolchain w/ C++, dynamic library, wchar<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# xml-security-c needs a toolchain w/ C++, wchar, dynamic library, th=
reads, gcc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_YAJL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# yaml-cpp needs a toolchain w/ C++, gcc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Logging<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# glog needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# hawktracer needs a toolchain w/ C++, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBLOG4C_LOCALTIME is not set<br>
&gt; -# BR2_PACKAGE_LIBLOGGING is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# log4cplus needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 4.8=
<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# log4cpp needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# log4cxx needs a toolchain w/ C++, threads, dynamic library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# log4qt needs qt5<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# opentracing-cpp needs a toolchain w/ C++, threads, dynamic library,=
 gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# spdlog needs a toolchain w/ C++, threads, wchar<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ulog needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ZLOG is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Multimedia<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# bento4 support needs a toolchain with C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BITSTREAM is not set<br>
&gt; -# BR2_PACKAGE_DAV1D is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# kvazaar needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBAACS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libass needs a toolchain w/ C++, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBBDPLUS is not set<br>
&gt; -# BR2_PACKAGE_LIBBLURAY is not set<br>
&gt; -BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libcamera needs a toolchain w/ C++, threads, wchar, dynamic library=
, gcc &gt;=3D 8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic li=
brary, gcc &gt;=3D 8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libde265 needs a toolchain w/ threads, C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBDVBCSA is not set<br>
&gt; -# BR2_PACKAGE_LIBDVBPSI is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libdvbsi++ needs a toolchain w/ C++, wchar, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBDVDCSS is not set<br>
&gt; -# BR2_PACKAGE_LIBDVDNAV is not set<br>
&gt; -# BR2_PACKAGE_LIBDVDREAD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libebml needs a toolchain w/ C++, wchar, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBHDHOMERUN is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libheif needs a toolchain w/ C++, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libimxvpuapi needs an i.MX platform with VPU support<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libmatroska needs a toolchain w/ C++, wchar, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBMMS is not set<br>
&gt; -# BR2_PACKAGE_LIBMPEG2 is not set<br>
&gt; -# BR2_PACKAGE_LIBOGG is not set<br>
&gt; -# BR2_PACKAGE_LIBOPENAPTX is not set<br>
&gt; -BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libopenh264 needs a toolchain w/ C++, dynamic library, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBOPUSENC is not set<br>
&gt; -# BR2_PACKAGE_LIBTHEORA is not set<br>
&gt; -# BR2_PACKAGE_LIBUDFREAD is not set<br>
&gt; -# BR2_PACKAGE_LIBVPX is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libyuv needs a toolchain w/ C++, dynamic library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# live555 needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mediastreamer needs a toolchain w/ threads, C++, dynamic library, g=
cc &gt;=3D 5<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_X264 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# x265 needs a toolchain w/ C++, threads, dynamic library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Networking<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# agent++ needs a toolchain w/ threads, C++, dynamic library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# azmq needs a toolchain w/ C++11, wchar and threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# azure-iot-sdk-c needs a toolchain w/ C++, NPTL and wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BATMAN_ADV is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# belle-sip needs a toolchain w/ threads, C++, dynamic library, wchar=
<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_C_ARES is not set<br>
&gt; -# BR2_PACKAGE_CGIC is not set<br>
&gt; -# BR2_PACKAGE_CNI_PLUGINS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cppzmq needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# curlpp needs a toolchain w/ C++, dynamic library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# czmq needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DAQ is not set<br>
&gt; -# BR2_PACKAGE_DAQ3 is not set<br>
&gt; -# BR2_PACKAGE_DAVICI is not set<br>
&gt; -# BR2_PACKAGE_DHT is not set<br>
&gt; -# BR2_PACKAGE_ENET is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# filemq needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FLICKCURL is not set<br>
&gt; -# BR2_PACKAGE_FREERADIUS_CLIENT is not set<br>
&gt; -# BR2_PACKAGE_GENSIO is not set<br>
&gt; -# BR2_PACKAGE_GEOIP is not set<br>
&gt; -# BR2_PACKAGE_GLIB_NETWORKING is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# grpc needs a toolchain w/ C++, threads, dynamic library, gcc &gt;=
=3D 5<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GSSDP is not set<br>
&gt; -# BR2_PACKAGE_GUPNP is not set<br>
&gt; -# BR2_PACKAGE_GUPNP_AV is not set<br>
&gt; -# BR2_PACKAGE_GUPNP_DLNA is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ibrcommon needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ibrdtn needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBCGI is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libcgicc needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBCOAP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libcpprestsdk needs a toolchain w/ NPTL, C++, wchar, locale<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBCURL is not set<br>
&gt; -# BR2_PACKAGE_LIBDNET is not set<br>
&gt; -# BR2_PACKAGE_LIBEXOSIP2 is not set<br>
&gt; -# BR2_PACKAGE_LIBEST is not set<br>
&gt; -# BR2_PACKAGE_LIBFCGI is not set<br>
&gt; -# BR2_PACKAGE_LIBGSASL is not set<br>
&gt; -# BR2_PACKAGE_LIBHTP is not set<br>
&gt; -# BR2_PACKAGE_LIBHTTPPARSER is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libhttpserver needs a toolchain w/ C++, threads, gcc &gt;=3D 5<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBIDN is not set<br>
&gt; -# BR2_PACKAGE_LIBIDN2 is not set<br>
&gt; -# BR2_PACKAGE_LIBISCSI is not set<br>
&gt; -# BR2_PACKAGE_LIBKRB5 is not set<br>
&gt; -# BR2_PACKAGE_LIBLDNS is not set<br>
&gt; -# BR2_PACKAGE_LIBMAXMINDDB is not set<br>
&gt; -# BR2_PACKAGE_LIBMBUS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libmemcached needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBMICROHTTPD is not set<br>
&gt; -# BR2_PACKAGE_LIBMINIUPNPC is not set<br>
&gt; -# BR2_PACKAGE_LIBMNL is not set<br>
&gt; -# BR2_PACKAGE_LIBMODBUS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libmodsecurity needs a toolchain w/ C++, threads, dynamic library<b=
r>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBNATPMP is not set<br>
&gt; -# BR2_PACKAGE_LIBNDP is not set<br>
&gt; -# BR2_PACKAGE_LIBNET is not set<br>
&gt; -# BR2_PACKAGE_LIBNETCONF2 is not set<br>
&gt; -# BR2_PACKAGE_LIBNETFILTER_ACCT is not set<br>
&gt; -# BR2_PACKAGE_LIBNETFILTER_CONNTRACK is not set<br>
&gt; -# BR2_PACKAGE_LIBNETFILTER_CTHELPER is not set<br>
&gt; -# BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT is not set<br>
&gt; -# BR2_PACKAGE_LIBNETFILTER_LOG is not set<br>
&gt; -# BR2_PACKAGE_LIBNETFILTER_QUEUE is not set<br>
&gt; -# BR2_PACKAGE_LIBNFNETLINK is not set<br>
&gt; -# BR2_PACKAGE_LIBNFTNL is not set<br>
&gt; -# BR2_PACKAGE_LIBNICE is not set<br>
&gt; -# BR2_PACKAGE_LIBNIDS is not set<br>
&gt; -# BR2_PACKAGE_LIBNL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libnpupnp needs a toolchain w/ C++, threads, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBOAUTH is not set<br>
&gt; -# BR2_PACKAGE_LIBOPING is not set<br>
&gt; -# BR2_PACKAGE_LIBOSIP2 is not set<br>
&gt; -# BR2_PACKAGE_LIBPAGEKITE is not set<br>
&gt; -# BR2_PACKAGE_LIBPCAP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libpjsip needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBPSL is not set<br>
&gt; -# BR2_PACKAGE_LIBRELP is not set<br>
&gt; -# BR2_PACKAGE_LIBRSYNC is not set<br>
&gt; -# BR2_PACKAGE_LIBSHAIRPLAY is not set<br>
&gt; -# BR2_PACKAGE_LIBSHOUT is not set<br>
&gt; -# BR2_PACKAGE_LIBSOCKETCAN is not set<br>
&gt; -# BR2_PACKAGE_LIBSOUP is not set<br>
&gt; -# BR2_PACKAGE_LIBSOUP3 is not set<br>
&gt; -# BR2_PACKAGE_LIBSRTP is not set<br>
&gt; -# BR2_PACKAGE_LIBSTROPHE is not set<br>
&gt; -# BR2_PACKAGE_LIBTEAM is not set<br>
&gt; -# BR2_PACKAGE_LIBTELNET is not set<br>
&gt; -# BR2_PACKAGE_LIBTIRPC is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libtorrent needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libtorrent-rasterbar needs a toolchain w/ C++, threads, wchar, gcc =
&gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBUEV is not set<br>
&gt; -# BR2_PACKAGE_LIBUHTTPD is not set<br>
&gt; -# BR2_PACKAGE_LIBUPNP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libupnpp needs a toolchain w/ C++, threads, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBURIPARSER is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libutp support needs a toolchain with C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBUWSC is not set<br>
&gt; -# BR2_PACKAGE_LIBVNCSERVER is not set<br>
&gt; -# BR2_PACKAGE_LIBWEBSOCK is not set<br>
&gt; -# BR2_PACKAGE_LIBWEBSOCKETS is not set<br>
&gt; -# BR2_PACKAGE_LIBYANG is not set<br>
&gt; -# BR2_PACKAGE_LIBZENOH_PICO is not set<br>
&gt; -# BR2_PACKAGE_LKSCTP_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_MBUFFER is not set<br>
&gt; -# BR2_PACKAGE_MDNSD is not set<br>
&gt; -# BR2_PACKAGE_MONGOOSE is not set<br>
&gt; -# BR2_PACKAGE_NANOMSG is not set<br>
&gt; -# BR2_PACKAGE_NEON is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# netopeer2 needs a toolchain w/ gcc &gt;=3D 4.8, C++, threads, dynam=
ic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_NGHTTP2 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# norm needs a toolchain w/ C++, threads, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_NSS_MYHOSTNAME is not set<br>
&gt; -# BR2_PACKAGE_NSS_PAM_LDAPD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# oatpp needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# omniORB needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPEN_ISNS is not set<br>
&gt; -# BR2_PACKAGE_OPEN62541 is not set<br>
&gt; -# BR2_PACKAGE_OPENLDAP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# openmpi needs a toolchain w/ dynamic library, NPTL, wchar, C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPENPGM is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# openzwave needs a toolchain w/ C++, dynamic library, NPTL, wchar<br=
>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ortp needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PAHO_MQTT_C is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# paho-mqtt-cpp needs a toolchain w/ threads, C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# pistache needs a toolchain w/ C++, gcc &gt;=3D 7, threads, wchar, n=
ot binutils bug 27597<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_QDECODER is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# qpid-proton needs a toolchain w/ C++, dynamic library, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_RABBITMQ_C is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# resiprocate needs a toolchain w/ C++, threads, wchar<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# restclient-cpp needs a toolchain w/ C++, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_RTMPDUMP is not set<br>
&gt; -# BR2_PACKAGE_SIPROXD is not set<br>
&gt; -# BR2_PACKAGE_SLIRP is not set<br>
&gt; -# BR2_PACKAGE_SLIRP4NETNS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# snmp++ needs a toolchain w/ threads, C++, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SOFIA_SIP is not set<br>
&gt; -# BR2_PACKAGE_SSCEP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc &gt;=
=3D 4.8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# thrift needs a toolchain w/ C++, wchar, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_USBREDIR is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# wampcc needs a toolchain w/ C++, NPTL, dynamic library, gcc &gt;=3D=
 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# websocketpp needs a toolchain w/ C++ and gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# zeromq needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# zmqpp needs a toolchain w/ C++, threads, gcc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# zyre needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Other<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ACE needs a glibc toolchain, dynamic library, C++, gcc &gt;=3D 4.9<=
br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_APR is not set<br>
&gt; -# BR2_PACKAGE_APR_UTIL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# armadillo needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# atf needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_AVRO_C is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# bctoolbox needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BDWGC is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# belr needs a toolchain w/ threads, C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# boost needs a toolchain w/ C++, threads, wchar<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# c-capnproto needs host and target gcc &gt;=3D 5 w/ C++14, threads, =
atomic, ucontext and not gcc bug 64735<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# capnproto needs host and target gcc &gt;=3D 5 w/ C++14, threads, at=
omic, ucontext and not gcc bug 64735<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# catch2 needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 5<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cctz needs a toolchain w/ C++, threads, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cereal needs a toolchain w/ C++, gcc &gt;=3D 4.7, threads, wchar<br=
>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# clang needs a toolchain w/ wchar, threads, C++, gcc &gt;=3D 7, dyna=
mic library, host gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CMOCKA is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cppcms needs a toolchain w/ C++, NPTL, wchar, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CRACKLIB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# dawgdic needs a toolchain w/ C++, gcc &gt;=3D 4.6<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DING_LIBS is not set<br>
&gt; -# BR2_PACKAGE_DOTCONF is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# double-conversion needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# eigen needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ELFUTILS is not set<br>
&gt; -# BR2_PACKAGE_ELL is not set<br>
&gt; -# BR2_PACKAGE_FFTW is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# flann needs a toolchain w/ C++, dynamic library, gcc &gt;=3D 4.7<br=
>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# flatbuffers needs a toolchain w/ C++, gcc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FLATCC is not set<br>
&gt; -# BR2_PACKAGE_FXDIV is not set<br>
&gt; -# BR2_PACKAGE_GCONF is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gdal needs a toolchain w/ C++, dynamic library, gcc &gt;=3D 4.7, no=
t binutils bug 27597, threads, wchar<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gflags needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gli needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# glibmm needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# glibmm (2.66.x) needs a toolchain w/ C++, wchar, threads, gcc &gt;=
=3D 4.9<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# glm needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GMP is not set<br>
&gt; -BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gobject-introspection needs python3<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GSL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gtest needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 5<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GUMBO_PARSER is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# highway needs a toolchain w/ C++, gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_JEMALLOC is not set<br>
&gt; -BR2_PACKAGE_LAPACK_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# lapack/blas needs a toolchain w/ fortran<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libabseil-cpp needs a toolchain w/ gcc &gt;=3D 4.9, C++, threads, d=
ynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBARGTABLE2 is not set<br>
&gt; -BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_LIBATOMIC_OPS is not set<br>
&gt; -# BR2_PACKAGE_LIBAVL is not set<br>
&gt; -# BR2_PACKAGE_LIBB64 is not set<br>
&gt; -# BR2_PACKAGE_LIBBACKTRACE is not set<br>
&gt; -BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_LIBBSD is not set<br>
&gt; -# BR2_PACKAGE_LIBBYTESIZE is not set<br>
&gt; -# BR2_PACKAGE_LIBCAP is not set<br>
&gt; -# BR2_PACKAGE_LIBCAP_NG is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libcgroup needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBCLC is not set<br>
&gt; -# BR2_PACKAGE_LIBCOFI is not set<br>
&gt; -# BR2_PACKAGE_LIBCORRECT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libcrossguid needs a toolchain w/ C++, gcc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBCSV is not set<br>
&gt; -# BR2_PACKAGE_LIBDAEMON is not set<br>
&gt; -# BR2_PACKAGE_LIBDILL is not set<br>
&gt; -# BR2_PACKAGE_LIBEE is not set<br>
&gt; -# BR2_PACKAGE_LIBEV is not set<br>
&gt; -# BR2_PACKAGE_LIBEVDEV is not set<br>
&gt; -# BR2_PACKAGE_LIBEVENT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libexecinfo needs a musl or uclibc toolchain w/ dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBFFI is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libfutils needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBGEE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libgeos needs a toolchain w/ C++, wchar, gcc &gt;=3D 4.9, threads n=
ot binutils bug 27597<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBGLIB2 is not set<br>
&gt; -# BR2_PACKAGE_LIBGLOB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libical needs a toolchain w/ C++, dynamic library, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBITE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libks needs a toolchain w/ C++, NPTL, dynamic library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# liblinear needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libloki needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBNPTH is not set<br>
&gt; -BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT=3Dy<br>
&gt; -# BR2_PACKAGE_LIBNSPR is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libosmium needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 4.7=
<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libpeas needs python3<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBPFM4 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libplist needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBPTHREAD_STUBS is not set<br>
&gt; -# BR2_PACKAGE_LIBPTHSEM is not set<br>
&gt; -# BR2_PACKAGE_LIBPWQUALITY is not set<br>
&gt; -# BR2_PACKAGE_LIBQB is not set<br>
&gt; -BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_LIBSECCOMP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libshdata needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libsigc++ needs a toolchain w/ C++, gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libsigc++ (2.x.x) needs a toolchain w/ C++, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_LIBSIGSEGV_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_LIBSIGSEGV is not set<br>
&gt; -# BR2_PACKAGE_LIBSOLV is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# libspatialindex needs a toolchain w/ C++, gcc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBTALLOC is not set<br>
&gt; -# BR2_PACKAGE_LIBTASN1 is not set<br>
&gt; -# BR2_PACKAGE_LIBTOMMATH is not set<br>
&gt; -# BR2_PACKAGE_LIBTPL is not set<br>
&gt; -# BR2_PACKAGE_LIBUBOX is not set<br>
&gt; -# BR2_PACKAGE_LIBUCI is not set<br>
&gt; -BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_LIBUNWIND is not set<br>
&gt; -BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# liburcu needs a toolchain w/ threads, C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBURING is not set<br>
&gt; -# BR2_PACKAGE_LIBUV is not set<br>
&gt; -# BR2_PACKAGE_LIGHTNING is not set<br>
&gt; -# BR2_PACKAGE_LINUX_PAM is not set<br>
&gt; -# BR2_PACKAGE_LIQUID_DSP is not set<br>
&gt; -BR2_PACKAGE_LLVM_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_LLVM_TARGET_ARCH=3D&quot;ARM&quot;<br>
&gt; -<br>
&gt; -#<br>
&gt; -# llvm needs a toolchain w/ wchar, threads, C++, gcc &gt;=3D 7, dynam=
ic library, host gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# lttng-libust needs a toolchain w/ dynamic library, wchar, threads, =
C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_MATIO is not set<br>
&gt; -# BR2_PACKAGE_MPC is not set<br>
&gt; -# BR2_PACKAGE_MPDECIMAL is not set<br>
&gt; -# BR2_PACKAGE_MPFR is not set<br>
&gt; -# BR2_PACKAGE_MPIR is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# msgpack needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_NEON_2_SSE is not set<br>
&gt; -BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET=3D&quot;ARMV7&quot;<br>
&gt; -BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_OPENBLAS is not set<br>
&gt; -# BR2_PACKAGE_ORC is not set<br>
&gt; -# BR2_PACKAGE_P11_KIT is not set<br>
&gt; -BR2_PACKAGE_POCO_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc &g=
t;=3D 5 w/ C++14<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# protobuf needs a toolchain w/ C++, threads, dynamic library, gcc &g=
t;=3D 4.8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# protobuf-c needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# protozero needs a toolchain w/ C++, gcc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# qhull needs a toolchain w/ C++, gcc &gt;=3D 4.4<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_QLIBC is not set<br>
&gt; -# BR2_PACKAGE_REPROC is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# riemann-c-client needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# shapelib needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SKALIBS is not set<br>
&gt; -# BR2_PACKAGE_SPHINXBASE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# tbb needs a glibc or musl toolchain w/ dynamic library, threads, C+=
+<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_TINYCBOR is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# tl-expected needs a toolchain w/ C++, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# uvw needs a toolchain w/ NPTL, dynamic library, C++, gcc &gt;=3D 7<=
br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# volk needs a toolchain w/ C++, NPTL, wchar, dynamic library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# xapian needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Security<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIBAPPARMOR is not set<br>
&gt; -# BR2_PACKAGE_LIBSELINUX is not set<br>
&gt; -# BR2_PACKAGE_LIBSEMANAGE is not set<br>
&gt; -# BR2_PACKAGE_LIBSEPOL is not set<br>
&gt; -# BR2_PACKAGE_SAFECLIB is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# softhsm2 needs a toolchain w/ C++, threads, gcc &gt;=3D 4.8 and dyn=
amic library support<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Text and terminal handling<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_AUGEAS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cli11 needs a toolchain w/ C++, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# docopt-cpp needs a toolchain w/ C++, gcc &gt;=3D 4.7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# enchant needs a toolchain w/ C++, threads, wchar<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# fmt needs a toolchain w/ C++, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FSTRCMP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# icu needs a toolchain w/ C++, wchar, threads, gcc &gt;=3D 4.9, host=
 gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_INIH is not set<br>
&gt; -# BR2_PACKAGE_LIBCLI is not set<br>
&gt; -# BR2_PACKAGE_LIBEDIT is not set<br>
&gt; -# BR2_PACKAGE_LIBENCA is not set<br>
&gt; -# BR2_PACKAGE_LIBESTR is not set<br>
&gt; -# BR2_PACKAGE_LIBFRIBIDI is not set<br>
&gt; -# BR2_PACKAGE_LIBUNIBREAK is not set<br>
&gt; -# BR2_PACKAGE_LIBUNISTRING is not set<br>
&gt; -# BR2_PACKAGE_LINENOISE is not set<br>
&gt; -# BR2_PACKAGE_NCURSES is not set<br>
&gt; -# BR2_PACKAGE_NEWT is not set<br>
&gt; -# BR2_PACKAGE_ONIGURUMA is not set<br>
&gt; -# BR2_PACKAGE_PCRE is not set<br>
&gt; -# BR2_PACKAGE_PCRE2 is not set<br>
&gt; -# BR2_PACKAGE_POPT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# re2 needs a toolchain w/ C++, threads, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_READLINE is not set<br>
&gt; -# BR2_PACKAGE_SLANG is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# tclap needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# termcolor needs a toolchain w/ C++, gcc &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_UTF8PROC is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Mail<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DOVECOT is not set<br>
&gt; -# BR2_PACKAGE_EXIM is not set<br>
&gt; -# BR2_PACKAGE_FETCHMAIL is not set<br>
&gt; -# BR2_PACKAGE_HEIRLOOM_MAILX is not set<br>
&gt; -# BR2_PACKAGE_LIBESMTP is not set<br>
&gt; -# BR2_PACKAGE_MSMTP is not set<br>
&gt; -# BR2_PACKAGE_MUTT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Miscellaneous<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_AESPIPE is not set<br>
&gt; -# BR2_PACKAGE_BC is not set<br>
&gt; -BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# bitcoin needs a toolchain w/ C++, threads, wchar<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# clamav needs a toolchain w/ C++, dynamic library, threads, wchar<br=
>
&gt; -#<br>
&gt; -# BR2_PACKAGE_COLLECTD is not set<br>
&gt; -# BR2_PACKAGE_COLLECTL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# domoticz needs lua 5.3 and a toolchain w/ C++, gcc &gt;=3D 6, NPTL,=
 wchar, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_EMPTY is not set<br>
&gt; -# BR2_PACKAGE_FFT_EVAL is not set<br>
&gt; -# BR2_PACKAGE_GITLAB_RUNNER is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library, gc=
c &gt;=3D 8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GOOGLEFONTDIRECTORY is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gqrx needs a toolchain w/ C++, threads, wchar, dynamic library, gcc=
 &gt;=3D 8<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gqrx needs qt5<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GSETTINGS_DESKTOP_SCHEMAS is not set<br>
&gt; -# BR2_PACKAGE_HAVEGED is not set<br>
&gt; -# BR2_PACKAGE_LINUX_SYSCALL_SUPPORT is not set<br>
&gt; -# BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set<br>
&gt; -# BR2_PACKAGE_NETDATA is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# proj needs a toolchain w/ C++, gcc &gt;=3D 4.7, threads, wchar<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET=3Dy<br>
&gt; -# BR2_PACKAGE_QEMU is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# qpdf needs a toolchain w/ C++, gcc &gt;=3D 5<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_RTL_433 is not set<br>
&gt; -# BR2_PACKAGE_SHARED_MIME_INFO is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# sunwait needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# taskd needs a toolchain w/ C++, wchar, dynamic library<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_XMRIG_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library, C++=
, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_XUTIL_UTIL_MACROS is not set<br>
&gt; -BR2_PACKAGE_Z3_ARCH_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Networking applications<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# aircrack-ng needs a toolchain w/ dynamic library, threads, C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ALFRED is not set<br>
&gt; -# BR2_PACKAGE_AOETOOLS is not set<br>
&gt; -# BR2_PACKAGE_APACHE is not set<br>
&gt; -# BR2_PACKAGE_ARGUS is not set<br>
&gt; -# BR2_PACKAGE_ARP_SCAN is not set<br>
&gt; -# BR2_PACKAGE_ARPTABLES is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# asterisk needs a glibc or uClibc toolchain w/ C++, dynamic library,=
 threads, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ATFTP is not set<br>
&gt; -# BR2_PACKAGE_AVAHI is not set<br>
&gt; -# BR2_PACKAGE_AXEL is not set<br>
&gt; -# BR2_PACKAGE_BABELD is not set<br>
&gt; -# BR2_PACKAGE_BANDWIDTHD is not set<br>
&gt; -# BR2_PACKAGE_BATCTL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# bcusdk needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BIND is not set<br>
&gt; -# BR2_PACKAGE_BIRD is not set<br>
&gt; -# BR2_PACKAGE_BLUEZ5_UTILS is not set<br>
&gt; -# BR2_PACKAGE_BMON is not set<br>
&gt; -# BR2_PACKAGE_BMX7 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# boinc needs a toolchain w/ dynamic library, C++, threads, gcc &gt;=
=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BRCM_PATCHRAM_PLUS is not set<br>
&gt; -# BR2_PACKAGE_BRIDGE_UTILS is not set<br>
&gt; -# BR2_PACKAGE_BWM_NG is not set<br>
&gt; -# BR2_PACKAGE_C_ICAP is not set<br>
&gt; -# BR2_PACKAGE_CAN_UTILS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cannelloni needs a toolchain w/ C++, threads, dynamic library, gcc =
&gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CASYNC is not set<br>
&gt; -# BR2_PACKAGE_CFM is not set<br>
&gt; -# BR2_PACKAGE_CHRONY is not set<br>
&gt; -# BR2_PACKAGE_CIVETWEB is not set<br>
&gt; -# BR2_PACKAGE_CONNMAN is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# connman-gtk needs libgtk3 and a glibc or uClibc toolchain w/ wchar,=
 threads, resolver, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CONNTRACK_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_CORKSCREW is not set<br>
&gt; -# BR2_PACKAGE_CRDA is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ctorrent needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cups needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# cups-filters needs a toolchain w/ wchar, C++, threads and dynamic l=
ibrary, gcc &gt;=3D 5<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DANTE is not set<br>
&gt; -# BR2_PACKAGE_DARKHTTPD is not set<br>
&gt; -# BR2_PACKAGE_DEHYDRATED is not set<br>
&gt; -# BR2_PACKAGE_DHCPCD is not set<br>
&gt; -# BR2_PACKAGE_DHCPDUMP is not set<br>
&gt; -# BR2_PACKAGE_DNSMASQ is not set<br>
&gt; -# BR2_PACKAGE_DRBD_UTILS is not set<br>
&gt; -# BR2_PACKAGE_DROPBEAR is not set<br>
&gt; -# BR2_PACKAGE_EASYFRAMES is not set<br>
&gt; -# BR2_PACKAGE_EBTABLES is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ejabberd needs erlang, toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ETHTOOL is not set<br>
&gt; -# BR2_PACKAGE_FAIFA is not set<br>
&gt; -# BR2_PACKAGE_FASTD is not set<br>
&gt; -# BR2_PACKAGE_FCGIWRAP is not set<br>
&gt; -# BR2_PACKAGE_FIREWALLD is not set<br>
&gt; -# BR2_PACKAGE_FLANNEL is not set<br>
&gt; -# BR2_PACKAGE_FPING is not set<br>
&gt; -# BR2_PACKAGE_FREERADIUS_SERVER is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# freeswitch needs a toolchain w/ C++, dynamic library, threads, wcha=
r<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_FRR is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, =
gcc &gt;=3D 8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GESFTPSERVER is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gloox needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GLORYTUN is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# gupnp-tools needs libgtk3<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# hans needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_HAPROXY is not set<br>
&gt; -# BR2_PACKAGE_HIAWATHA is not set<br>
&gt; -# BR2_PACKAGE_HOSTAPD is not set<br>
&gt; -# BR2_PACKAGE_HTPDATE is not set<br>
&gt; -# BR2_PACKAGE_HTTPING is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# i2pd needs a toolchain w/ C++, NPTL, wchar<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ibrdtn-tools needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ibrdtnd needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_IFMETRIC is not set<br>
&gt; -# BR2_PACKAGE_IFTOP is not set<br>
&gt; -BR2_PACKAGE_IFUPDOWN_SCRIPTS=3Dy<br>
&gt; -# BR2_PACKAGE_IGD2_FOR_LINUX is not set<br>
&gt; -# BR2_PACKAGE_IGH_ETHERCAT is not set<br>
&gt; -# BR2_PACKAGE_IGMPPROXY is not set<br>
&gt; -# BR2_PACKAGE_INADYN is not set<br>
&gt; -# BR2_PACKAGE_IODINE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# iperf needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_IPERF3 is not set<br>
&gt; -# BR2_PACKAGE_IPROUTE2 is not set<br>
&gt; -# BR2_PACKAGE_IPSET is not set<br>
&gt; -# BR2_PACKAGE_IPTABLES is not set<br>
&gt; -# BR2_PACKAGE_IPTRAF_NG is not set<br>
&gt; -# BR2_PACKAGE_IPUTILS is not set<br>
&gt; -# BR2_PACKAGE_IRSSI is not set<br>
&gt; -# BR2_PACKAGE_IW is not set<br>
&gt; -# BR2_PACKAGE_IWD is not set<br>
&gt; -# BR2_PACKAGE_JANUS_GATEWAY is not set<br>
&gt; -# BR2_PACKAGE_KEEPALIVED is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# kismet needs a toolchain w/ threads, C++, gcc &gt;=3D 5<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_KNOCK is not set<br>
&gt; -# BR2_PACKAGE_KSMBD_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_LEAFNODE2 is not set<br>
&gt; -# BR2_PACKAGE_LFT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# lftp requires a toolchain w/ C++, wchar<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LIGHTTPD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# linknx needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LINKS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# linphone needs a toolchain w/ threads, C++, dynamic library, wchar,=
 gcc &gt;=3D 5<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_LINUX_ZIGBEE is not set<br>
&gt; -# BR2_PACKAGE_LINUXPTP is not set<br>
&gt; -# BR2_PACKAGE_LLDPD is not set<br>
&gt; -# BR2_PACKAGE_LRZSZ is not set<br>
&gt; -# BR2_PACKAGE_LYNX is not set<br>
&gt; -# BR2_PACKAGE_MACCHANGER is not set<br>
&gt; -# BR2_PACKAGE_MEMCACHED is not set<br>
&gt; -# BR2_PACKAGE_MII_DIAG is not set<br>
&gt; -# BR2_PACKAGE_MINI_SNMPD is not set<br>
&gt; -# BR2_PACKAGE_MINIDLNA is not set<br>
&gt; -# BR2_PACKAGE_MINISSDPD is not set<br>
&gt; -# BR2_PACKAGE_MJPG_STREAMER is not set<br>
&gt; -# BR2_PACKAGE_MODEM_MANAGER is not set<br>
&gt; -BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, dynamic=
 library<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc=
 &gt;=3D 4.8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_MOSQUITTO is not set<br>
&gt; -# BR2_PACKAGE_MROUTED is not set<br>
&gt; -# BR2_PACKAGE_MRP is not set<br>
&gt; -# BR2_PACKAGE_MSTPD is not set<br>
&gt; -# BR2_PACKAGE_MTR is not set<br>
&gt; -# BR2_PACKAGE_NBD is not set<br>
&gt; -# BR2_PACKAGE_NCFTP is not set<br>
&gt; -# BR2_PACKAGE_NDISC6 is not set<br>
&gt; -# BR2_PACKAGE_NETATALK is not set<br>
&gt; -# BR2_PACKAGE_NETCALC is not set<br>
&gt; -# BR2_PACKAGE_NETPLUG is not set<br>
&gt; -# BR2_PACKAGE_NETSNMP is not set<br>
&gt; -# BR2_PACKAGE_NETSTAT_NAT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# NetworkManager needs udev /dev management and a glibc toolchain w/ =
headers &gt;=3D 4.6, dynamic library, wchar, threads, gcc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_NFACCT is not set<br>
&gt; -# BR2_PACKAGE_NFTABLES is not set<br>
&gt; -# BR2_PACKAGE_NGINX is not set<br>
&gt; -# BR2_PACKAGE_NGIRCD is not set<br>
&gt; -# BR2_PACKAGE_NGREP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# nload needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# nmap-nmap needs a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_NOIP is not set<br>
&gt; -# BR2_PACKAGE_NTP is not set<br>
&gt; -# BR2_PACKAGE_NTPSEC is not set<br>
&gt; -# BR2_PACKAGE_NUTTCP is not set<br>
&gt; -# BR2_PACKAGE_ODHCP6C is not set<br>
&gt; -# BR2_PACKAGE_ODHCPLOC is not set<br>
&gt; -# BR2_PACKAGE_OLSR is not set<br>
&gt; -# BR2_PACKAGE_OPEN_ISCSI is not set<br>
&gt; -# BR2_PACKAGE_OPEN_LLDP is not set<br>
&gt; -# BR2_PACKAGE_OPEN_PLC_UTILS is not set<br>
&gt; -# BR2_PACKAGE_OPENNTPD is not set<br>
&gt; -# BR2_PACKAGE_OPENOBEX is not set<br>
&gt; -# BR2_PACKAGE_OPENRESOLV is not set<br>
&gt; -# BR2_PACKAGE_OPENSSH is not set<br>
&gt; -# BR2_PACKAGE_OPENSWAN is not set<br>
&gt; -# BR2_PACKAGE_OPENVPN is not set<br>
&gt; -# BR2_PACKAGE_P910ND is not set<br>
&gt; -# BR2_PACKAGE_PARPROUTED is not set<br>
&gt; -# BR2_PACKAGE_PHIDGETWEBSERVICE is not set<br>
&gt; -# BR2_PACKAGE_PHYTOOL is not set<br>
&gt; -# BR2_PACKAGE_PIMD is not set<br>
&gt; -# BR2_PACKAGE_PIXIEWPS is not set<br>
&gt; -# BR2_PACKAGE_POUND is not set<br>
&gt; -# BR2_PACKAGE_PPPD is not set<br>
&gt; -# BR2_PACKAGE_PPTP_LINUX is not set<br>
&gt; -# BR2_PACKAGE_PRIVOXY is not set<br>
&gt; -# BR2_PACKAGE_PROFTPD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# prosody needs the lua interpreter, dynamic library<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PROXYCHAINS_NG is not set<br>
&gt; -# BR2_PACKAGE_PTPD is not set<br>
&gt; -# BR2_PACKAGE_PTPD2 is not set<br>
&gt; -# BR2_PACKAGE_PURE_FTPD is not set<br>
&gt; -# BR2_PACKAGE_PUTTY is not set<br>
&gt; -# BR2_PACKAGE_QUAGGA is not set<br>
&gt; -# BR2_PACKAGE_RADVD is not set<br>
&gt; -# BR2_PACKAGE_REAVER is not set<br>
&gt; -# BR2_PACKAGE_REDIR is not set<br>
&gt; -# BR2_PACKAGE_RP_PPPOE is not set<br>
&gt; -# BR2_PACKAGE_RPCBIND is not set<br>
&gt; -# BR2_PACKAGE_RSH_REDONE is not set<br>
&gt; -# BR2_PACKAGE_RSYNC is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# rtorrent needs a toolchain w/ C++, threads, wchar, gcc &gt;=3D 4.9<=
br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_RTPTOOLS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# rygel needs python3 and a glibc toolchain w/ wchar, threads, gcc &g=
t;=3D 4.9, host gcc &gt;=3D 8<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_S6_DNS is not set<br>
&gt; -# BR2_PACKAGE_S6_NETWORKING is not set<br>
&gt; -# BR2_PACKAGE_SAMBA4 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# sconeserver needs a toolchain with dynamic library, C++, NPTL<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SER2NET is not set<br>
&gt; -# BR2_PACKAGE_SHADOWSOCKS_LIBEV is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# shairport-sync needs a toolchain w/ C++, NPTL<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SHELLINABOX is not set<br>
&gt; -# BR2_PACKAGE_SMCROUTE is not set<br>
&gt; -# BR2_PACKAGE_SNGREP is not set<br>
&gt; -# BR2_PACKAGE_SNORT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, g=
cc &gt;=3D 4.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SOCAT is not set<br>
&gt; -# BR2_PACKAGE_SOCKETCAND is not set<br>
&gt; -# BR2_PACKAGE_SOFTETHER is not set<br>
&gt; -# BR2_PACKAGE_SPAWN_FCGI is not set<br>
&gt; -# BR2_PACKAGE_SPICE_PROTOCOL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# squid needs a toolchain w/ C++, threads, gcc &gt;=3D 4.8 not affect=
ed by bug 64735<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SSDP_RESPONDER is not set<br>
&gt; -# BR2_PACKAGE_SSHGUARD is not set<br>
&gt; -# BR2_PACKAGE_SSHPASS is not set<br>
&gt; -# BR2_PACKAGE_SSLH is not set<br>
&gt; -# BR2_PACKAGE_STRONGSWAN is not set<br>
&gt; -# BR2_PACKAGE_STUNNEL is not set<br>
&gt; -# BR2_PACKAGE_SURICATA is not set<br>
&gt; -# BR2_PACKAGE_TCPDUMP is not set<br>
&gt; -# BR2_PACKAGE_TCPING is not set<br>
&gt; -# BR2_PACKAGE_TCPREPLAY is not set<br>
&gt; -# BR2_PACKAGE_THTTPD is not set<br>
&gt; -# BR2_PACKAGE_TINC is not set<br>
&gt; -# BR2_PACKAGE_TINYPROXY is not set<br>
&gt; -# BR2_PACKAGE_TINYSSH is not set<br>
&gt; -# BR2_PACKAGE_TOR is not set<br>
&gt; -# BR2_PACKAGE_TRACEROUTE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# transmission needs a toolchain w/ dynamic library, threads, C++, gc=
c &gt;=3D 7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_TUNCTL is not set<br>
&gt; -# BR2_PACKAGE_TVHEADEND is not set<br>
&gt; -# BR2_PACKAGE_UACME is not set<br>
&gt; -# BR2_PACKAGE_UDPCAST is not set<br>
&gt; -# BR2_PACKAGE_UFTP is not set<br>
&gt; -# BR2_PACKAGE_UHTTPD is not set<br>
&gt; -# BR2_PACKAGE_ULOGD is not set<br>
&gt; -# BR2_PACKAGE_UNBOUND is not set<br>
&gt; -# BR2_PACKAGE_UQMI is not set<br>
&gt; -# BR2_PACKAGE_UREDIR is not set<br>
&gt; -# BR2_PACKAGE_USHARE is not set<br>
&gt; -# BR2_PACKAGE_USSP_PUSH is not set<br>
&gt; -# BR2_PACKAGE_VDE2 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# vdr needs a toolchain w/ C++, dynamic library, NPTL, wchar, headers=
 &gt;=3D 3.9<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_VNSTAT is not set<br>
&gt; -# BR2_PACKAGE_VPNC is not set<br>
&gt; -# BR2_PACKAGE_VSFTPD is not set<br>
&gt; -# BR2_PACKAGE_VTUN is not set<br>
&gt; -# BR2_PACKAGE_WAVEMON is not set<br>
&gt; -# BR2_PACKAGE_WIREGUARD_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_WIRELESS_REGDB is not set<br>
&gt; -# BR2_PACKAGE_WIRELESS_TOOLS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# wireshark needs a toolchain w/ wchar, threads, dynamic library, C++=
<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_WPA_SUPPLICANT is not set<br>
&gt; -# BR2_PACKAGE_WPAN_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_XINETD is not set<br>
&gt; -# BR2_PACKAGE_XL2TP is not set<br>
&gt; -# BR2_PACKAGE_XTABLES_ADDONS is not set<br>
&gt; -# BR2_PACKAGE_ZABBIX is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# zeek needs a toolchain w/ C++, wchar, threads, dynamic library, gcc=
 &gt;=3D 7, host gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# znc needs a toolchain w/ C++, dynamic library, gcc &gt;=3D 4.8, thr=
eads<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Package managers<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# -------------------------------------------------------<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Please note:<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# - Buildroot does *not* generate binary packages,<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# - Buildroot does *not* install any package database.<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# *<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# It is up to you to provide those by yourself if you<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# want to use any of those package managers.<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# *<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# See the manual:<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# <a href=3D"http://buildroot.org/manual.html#faq-no-binary-packages"=
 rel=3D"noreferrer" target=3D"_blank">http://buildroot.org/manual.html#faq-=
no-binary-packages</a><br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# -------------------------------------------------------<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPKG is not set<br>
&gt; -# BR2_PACKAGE_OPKG_UTILS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Real-Time<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_XENOMAI_COBALT_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_XENOMAI is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Security<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# apparmor needs a toolchain w/ headers &gt;=3D 3.16, threads, C++<br=
>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CHECKPOLICY is not set<br>
&gt; -# BR2_PACKAGE_IMA_EVM_UTILS is not set<br>
&gt; -# BR2_PACKAGE_OPTEE_CLIENT is not set<br>
&gt; -# BR2_PACKAGE_PAXTEST is not set<br>
&gt; -# BR2_PACKAGE_POLICYCOREUTILS is not set<br>
&gt; -# BR2_PACKAGE_REFPOLICY is not set<br>
&gt; -# BR2_PACKAGE_RESTORECOND is not set<br>
&gt; -# BR2_PACKAGE_SELINUX_PYTHON is not set<br>
&gt; -# BR2_PACKAGE_SEMODULE_UTILS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# setools needs python3<br>
&gt; -#<br>
&gt; -BR2_PACKAGE_URANDOM_SCRIPTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Shell and utilities<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Shells<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_MKSH is not set<br>
&gt; -# BR2_PACKAGE_NUSHELL is not set<br>
&gt; -# BR2_PACKAGE_ZSH is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Utilities<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_APG is not set<br>
&gt; -# BR2_PACKAGE_AT is not set<br>
&gt; -# BR2_PACKAGE_CATATONIT is not set<br>
&gt; -# BR2_PACKAGE_CCRYPT is not set<br>
&gt; -# BR2_PACKAGE_DIALOG is not set<br>
&gt; -# BR2_PACKAGE_DTACH is not set<br>
&gt; -# BR2_PACKAGE_EASY_RSA is not set<br>
&gt; -# BR2_PACKAGE_EZA is not set<br>
&gt; -# BR2_PACKAGE_FILE is not set<br>
&gt; -# BR2_PACKAGE_GNUPG is not set<br>
&gt; -BR2_PACKAGE_GNUPG2_DEPENDS=3Dy<br>
&gt; -# BR2_PACKAGE_GNUPG2 is not set<br>
&gt; -# BR2_PACKAGE_INOTIFY_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_LOCKFILE_PROGS is not set<br>
&gt; -# BR2_PACKAGE_LOGROTATE is not set<br>
&gt; -# BR2_PACKAGE_LOGSURFER is not set<br>
&gt; -# BR2_PACKAGE_PDMENU is not set<br>
&gt; -# BR2_PACKAGE_PINENTRY is not set<br>
&gt; -# BR2_PACKAGE_QPRINT is not set<br>
&gt; -# BR2_PACKAGE_RANGER is not set<br>
&gt; -# BR2_PACKAGE_RTTY is not set<br>
&gt; -# BR2_PACKAGE_SCREEN is not set<br>
&gt; -# BR2_PACKAGE_SEXPECT is not set<br>
&gt; -# BR2_PACKAGE_SUDO is not set<br>
&gt; -# BR2_PACKAGE_TINI is not set<br>
&gt; -# BR2_PACKAGE_TMUX is not set<br>
&gt; -# BR2_PACKAGE_TTYD is not set<br>
&gt; -# BR2_PACKAGE_WTFUTIL is not set<br>
&gt; -# BR2_PACKAGE_XMLSTARLET is not set<br>
&gt; -# BR2_PACKAGE_XXHASH is not set<br>
&gt; -# BR2_PACKAGE_YTREE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# System tools<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_ACL is not set<br>
&gt; -# BR2_PACKAGE_ANDROID_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_ATOP is not set<br>
&gt; -# BR2_PACKAGE_ATTR is not set<br>
&gt; -BR2_PACKAGE_AUDIT_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_AUDIT is not set<br>
&gt; -# BR2_PACKAGE_BALENA_ENGINE is not set<br>
&gt; -# BR2_PACKAGE_BUBBLEWRAP is not set<br>
&gt; -# BR2_PACKAGE_CGROUPFS_MOUNT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# circus needs Python 3 and a toolchain w/ C++, threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_CONMON is not set<br>
&gt; -# BR2_PACKAGE_CONTAINERD is not set<br>
&gt; -# BR2_PACKAGE_CPULIMIT is not set<br>
&gt; -# BR2_PACKAGE_CPULOAD is not set<br>
&gt; -BR2_PACKAGE_CRIU_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_CRUN is not set<br>
&gt; -# BR2_PACKAGE_DAEMON is not set<br>
&gt; -# BR2_PACKAGE_DC3DD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# ddrescue needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DOCKER_CLI is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# docker-compose needs docker-cli and a toolchain w/ threads<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DOCKER_ENGINE is not set<br>
&gt; -# BR2_PACKAGE_EARLYOOM is not set<br>
&gt; -# BR2_PACKAGE_EFIBOOTMGR is not set<br>
&gt; -BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_EFIVAR is not set<br>
&gt; -# BR2_PACKAGE_EMBIGGEN_DISK is not set<br>
&gt; -# BR2_PACKAGE_EMLOG is not set<br>
&gt; -# BR2_PACKAGE_FLUENT_BIT is not set<br>
&gt; -# BR2_PACKAGE_FTOP is not set<br>
&gt; -# BR2_PACKAGE_GETENT is not set<br>
&gt; -# BR2_PACKAGE_GKRELLM is not set<br>
&gt; -# BR2_PACKAGE_HTOP is not set<br>
&gt; -# BR2_PACKAGE_IBM_SW_TPM2 is not set<br>
&gt; -BR2_PACKAGE_INITSCRIPTS=3Dy<br>
&gt; -<br>
&gt; -#<br>
&gt; -# iotop depends on python3<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_IPRUTILS is not set<br>
&gt; -# BR2_PACKAGE_IRQBALANCE is not set<br>
&gt; -# BR2_PACKAGE_KEYUTILS is not set<br>
&gt; -# BR2_PACKAGE_KMOD is not set<br>
&gt; -# BR2_PACKAGE_KVMTOOL is not set<br>
&gt; -# BR2_PACKAGE_LIBOSTREE is not set<br>
&gt; -# BR2_PACKAGE_LXC is not set<br>
&gt; -BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_MAKEDUMPFILE is not set<br>
&gt; -# BR2_PACKAGE_MENDER is not set<br>
&gt; -# BR2_PACKAGE_MENDER_CONNECT is not set<br>
&gt; -# BR2_PACKAGE_MFOC is not set<br>
&gt; -# BR2_PACKAGE_MOBY_BUILDKIT is not set<br>
&gt; -# BR2_PACKAGE_MONIT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# multipath-tools needs udev and a toolchain w/ threads, dynamic libr=
ary, C++<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_NCDU is not set<br>
&gt; -# BR2_PACKAGE_NERDCTL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# netifrc needs openrc as init system<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_NUMACTL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# nut needs a toolchain w/ C++<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# pamtester depends on linux-pam<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# petitboot needs a toolchain w/ wchar, dynamic library, threads, ude=
v /dev management<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_POLKIT is not set<br>
&gt; -# BR2_PACKAGE_PROCRANK_LINUX is not set<br>
&gt; -# BR2_PACKAGE_PROCS is not set<br>
&gt; -# BR2_PACKAGE_PWGEN is not set<br>
&gt; -# BR2_PACKAGE_QUOTA is not set<br>
&gt; -# BR2_PACKAGE_QUOTATOOL is not set<br>
&gt; -# BR2_PACKAGE_RAUC is not set<br>
&gt; -# BR2_PACKAGE_RAUC_HAWKBIT_UPDATER is not set<br>
&gt; -# BR2_PACKAGE_RUNC is not set<br>
&gt; -# BR2_PACKAGE_S6 is not set<br>
&gt; -# BR2_PACKAGE_S6_LINUX_INIT is not set<br>
&gt; -# BR2_PACKAGE_S6_LINUX_UTILS is not set<br>
&gt; -# BR2_PACKAGE_S6_PORTABLE_UTILS is not set<br>
&gt; -# BR2_PACKAGE_S6_RC is not set<br>
&gt; -# BR2_PACKAGE_SCRUB is not set<br>
&gt; -# BR2_PACKAGE_SCRYPT is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# sdbus-c++ needs systemd and a toolchain w/ C++, gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# sdbusplus needs systemd and a toolchain w/ C++, gcc &gt;=3D 7<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SEATD is not set<br>
&gt; -# BR2_PACKAGE_SHADOW is not set<br>
&gt; -# BR2_PACKAGE_SMACK is not set<br>
&gt; +# Architecture<br>
&gt; +BR2_arm=3Dy<br>
&gt; +BR2_cortex_a15_a7=3Dy<br>
&gt; +BR2_ARM_FPU_NEON_VFPV4=3Dy<br>
&gt; <br>
&gt; -#<br>
&gt; -# supervisor needs a python interpreter<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SWUPDATE is not set<br>
&gt; -BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_SYSTEMD_BOOTCHART_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_TEALDEER is not set<br>
&gt; -# BR2_PACKAGE_TPM_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_TPM2_ABRMD is not set<br>
&gt; -# BR2_PACKAGE_TPM2_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_TPM2_TOTP is not set<br>
&gt; -# BR2_PACKAGE_UNSCD is not set<br>
&gt; -# BR2_PACKAGE_UTIL_LINUX is not set<br>
&gt; -# BR2_PACKAGE_WATCHDOG is not set<br>
&gt; -# BR2_PACKAGE_WATCHDOGD is not set<br>
&gt; -# BR2_PACKAGE_XDG_DBUS_PROXY is not set<br>
&gt; -# BR2_PACKAGE_XEN is not set<br>
&gt; -BR2_PACKAGE_XVISOR_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_XVISOR is not set<br>
&gt; +# System<br>
&gt; +BR2_TARGET_GENERIC_HOSTNAME=3D&quot;Cubieboard4&quot;<br>
&gt; +BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to Cubieboard4!&quot;<br>
&gt; +BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;ttyS0&quot;<br>
&gt; +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/cubietech/cubieboard4/post=
-image.sh&quot;<br>
&gt; <br>
&gt; -#<br>
&gt; -# Text editors and viewers<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_BAT is not set<br>
&gt; -# BR2_PACKAGE_ED is not set<br>
&gt; -# BR2_PACKAGE_JOE is not set<br>
&gt; -# BR2_PACKAGE_MC is not set<br>
&gt; -# BR2_PACKAGE_MG is not set<br>
&gt; -# BR2_PACKAGE_MOST is not set<br>
&gt; -# BR2_PACKAGE_NANO is not set<br>
&gt; -# BR2_PACKAGE_UEMACS is not set<br>
&gt; +# Kernel<br>
&gt; +BR2_LINUX_KERNEL=3Dy<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.6.8&quot;<br>
&gt; +BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;sunxi&quot;<br>
&gt; +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
&gt; +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;allwinner/sun9i-a80-cubieboa=
rd4&quot;<br>
&gt; <br>
&gt; -#<br>
&gt; -# Filesystem images<br>
&gt; -#<br>
&gt; -# BR2_TARGET_ROOTFS_AXFS is not set<br>
&gt; -# BR2_TARGET_ROOTFS_BTRFS is not set<br>
&gt; -# BR2_TARGET_ROOTFS_CLOOP is not set<br>
&gt; -# BR2_TARGET_ROOTFS_CPIO is not set<br>
&gt; -# BR2_TARGET_ROOTFS_CRAMFS is not set<br>
&gt; -# BR2_TARGET_ROOTFS_EROFS is not set<br>
&gt; +# Filesystem<br>
&gt;=C2=A0 =C2=A0BR2_TARGET_ROOTFS_EXT2=3Dy<br>
&gt; -# BR2_TARGET_ROOTFS_EXT2_2r0 is not set<br>
&gt; -# BR2_TARGET_ROOTFS_EXT2_2r1 is not set<br>
&gt; -# BR2_TARGET_ROOTFS_EXT2_3 is not set<br>
&gt;=C2=A0 =C2=A0BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_GEN=3D4<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_REV=3D1<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_LABEL=3D&quot;rootfs&quot;<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;60M&quot;<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_INODES=3D0<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_INODE_SIZE=3D256<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_RESBLKS=3D5<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS=3D&quot;-O ^64bit&quot;<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_NONE=3Dy<br>
&gt; -# BR2_TARGET_ROOTFS_EXT2_GZIP is not set<br>
&gt; -# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set<br>
&gt; -# BR2_TARGET_ROOTFS_EXT2_LZ4 is not set<br>
&gt; -# BR2_TARGET_ROOTFS_EXT2_LZMA is not set<br>
&gt; -# BR2_TARGET_ROOTFS_EXT2_LZO is not set<br>
&gt; -# BR2_TARGET_ROOTFS_EXT2_XZ is not set<br>
&gt; -# BR2_TARGET_ROOTFS_EXT2_ZSTD is not set<br>
&gt; -# BR2_TARGET_ROOTFS_F2FS is not set<br>
&gt; -# BR2_TARGET_ROOTFS_INITRAMFS is not set<br>
&gt; -# BR2_TARGET_ROOTFS_JFFS2 is not set<br>
&gt; -# BR2_TARGET_ROOTFS_OCI is not set<br>
&gt; -# BR2_TARGET_ROOTFS_ROMFS is not set<br>
&gt; -# BR2_TARGET_ROOTFS_SQUASHFS is not set<br>
&gt; -BR2_TARGET_ROOTFS_TAR=3Dy<br>
&gt; -BR2_TARGET_ROOTFS_TAR_NONE=3Dy<br>
&gt; -# BR2_TARGET_ROOTFS_TAR_GZIP is not set<br>
&gt; -# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set<br>
&gt; -# BR2_TARGET_ROOTFS_TAR_LZ4 is not set<br>
&gt; -# BR2_TARGET_ROOTFS_TAR_LZMA is not set<br>
&gt; -# BR2_TARGET_ROOTFS_TAR_LZO is not set<br>
&gt; -# BR2_TARGET_ROOTFS_TAR_XZ is not set<br>
&gt; -# BR2_TARGET_ROOTFS_TAR_ZSTD is not set<br>
&gt; -BR2_TARGET_ROOTFS_TAR_OPTIONS=3D&quot;&quot;<br>
&gt; -# BR2_TARGET_ROOTFS_UBI is not set<br>
&gt; -# BR2_TARGET_ROOTFS_UBIFS is not set<br>
&gt; -# BR2_TARGET_ROOTFS_YAFFS2 is not set<br>
&gt; <br>
&gt; -#<br>
&gt; -# Bootloaders<br>
&gt; -#<br>
&gt; -# BR2_TARGET_AFBOOT_STM32 is not set<br>
&gt; -# BR2_TARGET_AT91BOOTSTRAP3 is not set<br>
&gt; -# BR2_TARGET_ARM_TRUSTED_FIRMWARE is not set<br>
&gt; -# BR2_TARGET_BAREBOX is not set<br>
&gt; -BR2_TARGET_GRUB2_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_TARGET_GRUB2 is not set<br>
&gt; -# BR2_TARGET_MXS_BOOTLETS is not set<br>
&gt; -# BR2_TARGET_OPTEE_OS is not set<br>
&gt; -# BR2_TARGET_S500_BOOTLOADER is not set<br>
&gt; -BR2_PACKAGE_SHIM_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_TARGET_SHIM is not set<br>
&gt; +# Bootloader<br>
&gt;=C2=A0 =C2=A0BR2_TARGET_UBOOT=3Dy<br>
&gt;=C2=A0 =C2=A0BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
&gt; -# BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY is not set<br>
&gt; -# BR2_TARGET_UBOOT_LATEST_VERSION is not set<br>
&gt;=C2=A0 =C2=A0BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
&gt; -# BR2_TARGET_UBOOT_CUSTOM_TARBALL is not set<br>
&gt; -# BR2_TARGET_UBOOT_CUSTOM_GIT is not set<br>
&gt; -# BR2_TARGET_UBOOT_CUSTOM_HG is not set<br>
&gt; -# BR2_TARGET_UBOOT_CUSTOM_SVN is not set<br>
&gt;=C2=A0 =C2=A0BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2021.10&quot=
;<br>
&gt; -BR2_TARGET_UBOOT_VERSION=3D&quot;2021.10&quot;<br>
&gt; -BR2_TARGET_UBOOT_PATCH=3D&quot;&quot;<br>
&gt; -BR2_TARGET_UBOOT_USE_DEFCONFIG=3Dy<br>
&gt; -# BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG is not set<br>
&gt;=C2=A0 =C2=A0BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;Cubieboard4&quot;=
<br>
&gt; -BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES=3D&quot;&quot;<br>
&gt;=C2=A0 =C2=A0BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
&gt; -# BR2_TARGET_UBOOT_NEEDS_PYTHON3 is not set<br>
&gt; -# BR2_TARGET_UBOOT_NEEDS_PYLIBFDT is not set<br>
&gt; -# BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS is not set<br>
&gt; -# BR2_TARGET_UBOOT_NEEDS_OPENSSL is not set<br>
&gt; -# BR2_TARGET_UBOOT_NEEDS_LZOP is not set<br>
&gt; -# BR2_TARGET_UBOOT_NEEDS_GNUTLS is not set<br>
&gt; -# BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX is not set<br>
&gt; -# BR2_TARGET_UBOOT_NEEDS_XXD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# U-Boot binary format<br>
&gt; -#<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_AIS is not set<br>
&gt; -BR2_TARGET_UBOOT_FORMAT_BIN=3Dy<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_DTB is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_DTB_BIN is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_NAND_BIN is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_ELF is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_IMG is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_DTB_IMG is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_IMX is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_DTB_IMX is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_ITB is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_KWB is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_NAND is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_SB is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_SD is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_STM32 is not set<br>
&gt; -# BR2_TARGET_UBOOT_FORMAT_CUSTOM is not set<br>
&gt; -# BR2_TARGET_UBOOT_OMAP_IFT is not set<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=3Dy<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
&gt;=C2=A0 =C2=A0BR2_TARGET_UBOOT_SPL=3Dy<br>
&gt;=C2=A0 =C2=A0BR2_TARGET_UBOOT_SPL_NAME=3D&quot;u-boot-sunxi-with-spl.bi=
n&quot;<br>
&gt; -# BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC is not set<br>
&gt; -BR2_TARGET_UBOOT_CUSTOM_DTS_PATH=3D&quot;&quot;<br>
&gt; -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D&quot;&quot;<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Host utilities<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_HOST_ABOOTIMG is not set<br>
&gt; -# BR2_PACKAGE_HOST_AESPIPE is not set<br>
&gt; -# BR2_PACKAGE_HOST_AGENT_PROXY is not set<br>
&gt; -# BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP is not set<br>
&gt; -# BR2_PACKAGE_HOST_ANDROID_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_HOST_ASN1C is not set<br>
&gt; -# BR2_PACKAGE_HOST_BABELTRACE2 is not set<br>
&gt; -# BR2_PACKAGE_HOST_BMAP_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_HOST_BOOTGEN is not set<br>
&gt; -# BR2_PACKAGE_HOST_BTRFS_PROGS is not set<br>
&gt; -# BR2_PACKAGE_HOST_CBOOTIMAGE is not set<br>
&gt; -# BR2_PACKAGE_HOST_CHECKPOLICY is not set<br>
&gt; -# BR2_PACKAGE_HOST_CHECKSEC is not set<br>
&gt; -# BR2_PACKAGE_HOST_CMAKE is not set<br>
&gt; -BR2_HOST_CMAKE_AT_LEAST=3D&quot;3.18&quot;<br>
&gt; -# BR2_PACKAGE_HOST_COMPOSER is not set<br>
&gt; -# BR2_PACKAGE_HOST_CRAMFS is not set<br>
&gt; -# BR2_PACKAGE_HOST_CRUDINI is not set<br>
&gt; -# BR2_PACKAGE_HOST_CRYPTSETUP is not set<br>
&gt; -# BR2_PACKAGE_HOST_DBUS_PYTHON is not set<br>
&gt; -# BR2_PACKAGE_HOST_DELVE is not set<br>
&gt; -# BR2_PACKAGE_HOST_DEPOT_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_HOST_DFU_UTIL is not set<br>
&gt; -# BR2_PACKAGE_HOST_DOS2UNIX is not set<br>
&gt;=C2=A0 =C2=A0BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_DOXYGEN is not set<br>
&gt; -BR2_PACKAGE_HOST_DTC=3Dy<br>
&gt; -BR2_PACKAGE_HOST_E2FSPROGS=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_E2TOOLS is not set<br>
&gt; -# BR2_PACKAGE_HOST_ENVIRONMENT_SETUP is not set<br>
&gt; -# BR2_PACKAGE_HOST_EROFS_UTILS is not set<br>
&gt; -# BR2_PACKAGE_HOST_EXFATPROGS is not set<br>
&gt; -# BR2_PACKAGE_HOST_F2FS_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_HOST_FAKETIME is not set<br>
&gt; -# BR2_PACKAGE_HOST_FATCAT is not set<br>
&gt; -# BR2_PACKAGE_HOST_FIRMWARE_UTILS is not set<br>
&gt; -BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_FLUTTER_SDK_BIN is not set<br>
&gt; -# BR2_PACKAGE_HOST_FWUP is not set<br>
&gt; -# BR2_PACKAGE_HOST_GENEXT2FS is not set<br>
&gt;=C2=A0 =C2=A0BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_GENPART is not set<br>
&gt; -# BR2_PACKAGE_HOST_GNUPG is not set<br>
&gt; -BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE1_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_GPTFDISK is not set<br>
&gt; -# BR2_PACKAGE_HOST_IMAGEMAGICK is not set<br>
&gt; -# BR2_PACKAGE_HOST_IMX_MKIMAGE is not set<br>
&gt; -# BR2_PACKAGE_HOST_IMX_USB_LOADER is not set<br>
&gt; -# BR2_PACKAGE_HOST_JQ is not set<br>
&gt; -# BR2_PACKAGE_HOST_JSMIN is not set<br>
&gt; -BR2_PACKAGE_HOST_KMOD=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_KMOD_GZ is not set<br>
&gt; -# BR2_PACKAGE_HOST_KMOD_ZSTD is not set<br>
&gt; -# BR2_PACKAGE_HOST_KMOD_XZ is not set<br>
&gt; -# BR2_PACKAGE_HOST_LIBP11 is not set<br>
&gt; -# BR2_PACKAGE_HOST_LLD is not set<br>
&gt; -# BR2_PACKAGE_HOST_LPC3250LOADER is not set<br>
&gt; -# BR2_PACKAGE_HOST_LTTNG_BABELTRACE is not set<br>
&gt; -# BR2_PACKAGE_HOST_LZMA_ALONE is not set<br>
&gt; -# BR2_PACKAGE_HOST_MENDER_ARTIFACT is not set<br>
&gt; -# BR2_PACKAGE_HOST_MESON_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_HOST_MFGTOOLS is not set<br>
&gt; -# BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR is not set<br>
&gt; -# BR2_PACKAGE_HOST_MKPASSWD is not set<br>
&gt; -# BR2_PACKAGE_HOST_MOBY_BUILDKIT is not set<br>
&gt; -# BR2_PACKAGE_HOST_MOSQUITTO is not set<br>
&gt; -# BR2_PACKAGE_HOST_MTD is not set<br>
&gt;=C2=A0 =C2=A0BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_MXSLDR is not set<br>
&gt; -BR2_PACKAGE_HOST_NODEJS_BIN_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_NODEJS is not set<br>
&gt; -BR2_PACKAGE_PROVIDES_HOST_NODEJS=3D&quot;host-nodejs-bin&quot;<br>
&gt; -# BR2_PACKAGE_HOST_ODB is not set<br>
&gt; -# BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS is not set<br>
&gt; -# BR2_PACKAGE_HOST_OPENOCD is not set<br>
&gt; -# BR2_PACKAGE_HOST_OPKG_UTILS is not set<br>
&gt; -# BR2_PACKAGE_HOST_PAHOLE is not set<br>
&gt; -# BR2_PACKAGE_HOST_PARTED is not set<br>
&gt; -BR2_PACKAGE_HOST_PATCHELF=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_PIGZ is not set<br>
&gt; -# BR2_PACKAGE_HOST_PKGCONF is not set<br>
&gt; -# BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT is not set<br>
&gt; -# BR2_PACKAGE_HOST_PWGEN is not set<br>
&gt; -# BR2_PACKAGE_HOST_PYTHON_CYTHON is not set<br>
&gt; -# BR2_PACKAGE_HOST_PYTHON_GREENLET is not set<br>
&gt; -# BR2_PACKAGE_HOST_PYTHON_INIPARSE is not set<br>
&gt; -# BR2_PACKAGE_HOST_PYTHON_LXML is not set<br>
&gt; -# BR2_PACKAGE_HOST_PYTHON_PYYAML is not set<br>
&gt; -# BR2_PACKAGE_HOST_PYTHON_SIX is not set<br>
&gt; -# BR2_PACKAGE_HOST_PYTHON_XLRD is not set<br>
&gt; -# BR2_PACKAGE_HOST_PYTHON3 is not set<br>
&gt; -BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_QEMU is not set<br>
&gt; -# BR2_PACKAGE_HOST_QORIQ_RCW is not set<br>
&gt; -# BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT is not set<br>
&gt; -# BR2_PACKAGE_HOST_RAUC is not set<br>
&gt; -# BR2_PACKAGE_HOST_RISCV_ISA_SIM is not set<br>
&gt; -# BR2_PACKAGE_HOST_RUNC is not set<br>
&gt; -BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS=3Dy<br>
&gt; -BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS=3Dy<br>
&gt; -BR2_PACKAGE_HOST_RUSTC_ARCH=3D&quot;armv7&quot;<br>
&gt; -BR2_PACKAGE_HOST_RUSTC_ABI=3D&quot;eabihf&quot;<br>
&gt; -# BR2_PACKAGE_HOST_RUSTC is not set<br>
&gt; -BR2_PACKAGE_PROVIDES_HOST_RUSTC=3D&quot;host-rust-bin&quot;<br>
&gt; -# BR2_PACKAGE_HOST_SAM_BA is not set<br>
&gt; -# BR2_PACKAGE_HOST_SDBUS_CPP is not set<br>
&gt; -# BR2_PACKAGE_HOST_SDBUSPLUS is not set<br>
&gt; -# BR2_PACKAGE_HOST_SENTRY_CLI is not set<br>
&gt; -# BR2_PACKAGE_HOST_SLOCI_IMAGE is not set<br>
&gt; -# BR2_PACKAGE_HOST_SQUASHFS is not set<br>
&gt; -# BR2_PACKAGE_HOST_SUNXI_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_HOST_SWIG is not set<br>
&gt; -# BR2_PACKAGE_HOST_SWUGENERATOR is not set<br>
&gt; -# BR2_PACKAGE_HOST_TEGRARCM is not set<br>
&gt; -BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_TI_CGT_PRU is not set<br>
&gt;=C2=A0 =C2=A0BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT is not set<br>
&gt; -# BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE is not set<br>
&gt; -# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT is not set<br>
&gt; -BR2_PACKAGE_HOST_UTIL_LINUX=3Dy<br>
&gt; -# BR2_PACKAGE_HOST_UTP_COM is not set<br>
&gt; -# BR2_PACKAGE_HOST_UUU is not set<br>
&gt; -# BR2_PACKAGE_HOST_VBOOT_UTILS is not set<br>
&gt; -# BR2_PACKAGE_HOST_XORRISO is not set<br>
&gt; -# BR2_PACKAGE_HOST_ZIP is not set<br>
&gt; -# BR2_PACKAGE_HOST_ZSTD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy config options<br>
&gt; -#<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2023.11<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PYTHON_PYXB is not set<br>
&gt; -# BR2_PACKAGE_OPENJDK_VERSION_11 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_6_4 is not set<br>
&gt; -# BR2_PACKAGE_GOOGLE_MATERIAL_DESIGN_ICONS is not set<br>
&gt; -# BR2_GDB_VERSION_10 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2023.08<br>
&gt; -#<br>
&gt; -# BR2_TARGET_LPC32XXCDL is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_38_X is not set<br>
&gt; -# BR2_GCC_VERSION_10_X is not set<br>
&gt; -# BR2_KERNEL_HEADERS_6_3 is not set<br>
&gt; -# BR2_PACKAGE_TOVID is not set<br>
&gt; -# BR2_PACKAGE_LIBASPLIB is not set<br>
&gt; -# BR2_PACKAGE_OCF_LINUX is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_37_X is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2023.05<br>
&gt; -#<br>
&gt; -# BR2_KERNEL_HEADERS_6_2 is not set<br>
&gt; -# BR2_PACKAGE_ATK is not set<br>
&gt; -# BR2_PACKAGE_AT_SPI2_ATK is not set<br>
&gt; -# BR2_PACKAGE_OPTEE_BENCHMARK is not set<br>
&gt; -# BR2_PACAKGE_OPENFPGALOADER_CMSIS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2023.02<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PUGIXML_HEADER_ONLY is not set<br>
&gt; -# BR2_PACKAGE_UCCP420WLAN is not set<br>
&gt; -# BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES is not set<br>
&gt; -# BR2_KERNEL_HEADERS_6_0 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_9 is not set<br>
&gt; -# BR2_PACKAGE_DOCKER_PROXY is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_BUNCH is not set<br>
&gt; -# BR2_TARGET_GUMMIBOOT is not set<br>
&gt; -# BR2_PACKAGE_IPUTILS_NINFOD is not set<br>
&gt; -# BR2_PACKAGE_IPUTILS_RARPD is not set<br>
&gt; -# BR2_PACKAGE_IPUTILS_RDISC is not set<br>
&gt; -# BR2_PACKAGE_IPUTILS_RDISC_SERVER is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT is not set<br>
&gt; -# BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 is not set<br>
&gt; -# BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV is not set<br>
&gt; -BR2_PACKAGE_QEMU_CUSTOM_TARGETS=3D&quot;&quot;<br>
&gt; -# BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD is not set<br>
&gt; -# BR2_TARGET_SUN20I_D1_SPL is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_M2R is not set<br>
&gt; -# BR2_PACKAGE_MESA3D_XVMC is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_19 is not set<br>
&gt; -# BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA is not set<br>
&gt; -# BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT is not set<br>
&gt; -# BR2_PACKAGE_USBREDIR_SERVER is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2022.11<br>
&gt; -#<br>
&gt; -# BR2_BINUTILS_VERSION_2_36_X is not set<br>
&gt; -# BR2_PACKAGE_RABBITMQ_SERVER is not set<br>
&gt; -# BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5 is not set<br>
&gt; -# BR2_PACKAGE_LIBDCADEC is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_17 is not set<br>
&gt; -# BR2_iwmmxt is not set<br>
&gt; -# BR2_PACKAGE_UHD_N230 is not set<br>
&gt; -# BR2_PACKAGE_UHD_RFNOC is not set<br>
&gt; -# BR2_PACKAGE_GPSD_OLDSTYLE is not set<br>
&gt; -# BR2_GDB_VERSION_9_2 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2022.08<br>
&gt; -#<br>
&gt; -# BR2_ECLIPSE_REGISTER is not set<br>
&gt; -# BR2_csky is not set<br>
&gt; -# BR2_PACKAGE_MESA3D_DRI_DRIVER_I915 is not set<br>
&gt; -# BR2_PACKAGE_MESA3D_DRI_DRIVER_I965 is not set<br>
&gt; -# BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU is not set<br>
&gt; -# BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON is not set<br>
&gt; -# BR2_GCC_VERSION_9_X is not set<br>
&gt; -# BR2_PACKAGE_PHP_EXT_WDDX is not set<br>
&gt; -# BR2_nds32 is not set<br>
&gt; -# BR2_PACKAGE_RTL8723BS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2022.05<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_KTAP is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_16 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_4 is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_32_X is not set<br>
&gt; -# BR2_sh2a is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_35_X is not set<br>
&gt; -# BR2_PACKAGE_BOOST_LAYOUT_TAGGED is not set<br>
&gt; -# BR2_PACKAGE_BOOST_LAYOUT_VERSIONED is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2022.02<br>
&gt; -#<br>
&gt; -BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS=3D&quot;&quot;<br>
&gt; -# BR2_PACKAGE_LIBCURL_LIBNSS is not set<br>
&gt; -# BR2_PACKAGE_WESTON_DEFAULT_FBDEV is not set<br>
&gt; -# BR2_PACKAGE_WESTON_FBDEV is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_PYCLI is not set<br>
&gt; -# BR2_PACKAGE_LINUX_TOOLS_BPFTOOL is not set<br>
&gt; -# BR2_TARGET_UBOOT_NEEDS_PYTHON2 is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_FUNCTOOLS32 is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_ENUM34 is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_ENUM is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_DIALOG is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_CONFIGOBJ is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_YIELDFROM is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_TYPING is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_SUBPROCESS32 is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_SINGLEDISPATCH is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_PYRO is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_PYPCAP is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_PATHLIB2 is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_PAM is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_NFC is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_MAD is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_IPADDRESS is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_IPADDR is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_ID3 is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_FUTURES is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE is not set<br=
>
&gt; -# BR2_PACKAGE_PYTHON_BACKPORTS_ABC is not set<br>
&gt; -# BR2_PACKAGE_PYTHON is not set<br>
&gt; -# BR2_TARGET_UBOOT_ZYNQ_IMAGE is not set<br>
&gt; -# BR2_PACKAGE_RPI_BT_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_RPI_WIFI_FIRMWARE is not set<br>
&gt; -# BR2_PACKAGE_HOST_GDB_PYTHON is not set<br>
&gt; -# BR2_PACKAGE_GSTREAMER1_MM is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_14 is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE is not set<br>
&gt; -# BR2_PACKAGE_CIVETWEB_WITH_LUA is not set<br>
&gt; -# BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER is not set<br>
&gt; -# BR2_PACKAGE_SUNXI_MALI_MAINLINE is not set<br>
&gt; -# BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2 is not set<br>
&gt; -# BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1 is not set<br>
&gt; -# BR2_PACKAGE_QT5WEBKIT_EXAMPLES is not set<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE is not s=
et<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE is not se=
t<br>
&gt; -# BR2_PACKAGE_IPUTILS_TFTPD is not set<br>
&gt; -# BR2_PACKAGE_IPUTILS_TRACEROUTE6 is not set<br>
&gt; -# BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE is not set<br>
&gt; -# BR2_PACKAGE_MPD_UPNP is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2021.11<br>
&gt; -#<br>
&gt; -# BR2_OPENJDK_VERSION_LTS is not set<br>
&gt; -# BR2_OPENJDK_VERSION_LATEST is not set<br>
&gt; -# BR2_PACKAGE_MPD_TIDAL is not set<br>
&gt; -# BR2_PACKAGE_MROUTED_RSRR is not set<br>
&gt; -# BR2_BINUTILS_VERSION_CSKY is not set<br>
&gt; -# BR2_GCC_VERSION_CSKY is not set<br>
&gt; -# BR2_PACKAGE_CANFESTIVAL is not set<br>
&gt; -# BR2_PACKAGE_NMAP_NDIFF is not set<br>
&gt; -# BR2_GDB_VERSION_8_3 is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_MELD3 is not set<br>
&gt; -# BR2_PACKAGE_STRONGSWAN_EAP is not set<br>
&gt; -# BR2_PACKAGE_GNURADIO_PAGER is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_11 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_12 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_13 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2021.08<br>
&gt; -#<br>
&gt; -BR2_TARGET_GRUB2_BUILTIN_MODULES=3D&quot;&quot;<br>
&gt; -BR2_TARGET_GRUB2_BUILTIN_CONFIG=3D&quot;&quot;<br>
&gt; -# BR2_PACKAGE_LIBMCRYPT is not set<br>
&gt; -# BR2_PACKAGE_MCRYPT is not set<br>
&gt; -# BR2_PACKAGE_PHP_EXT_MCRYPT is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_34_X is not set<br>
&gt; -# BR2_PACKAGE_LIBSOIL is not set<br>
&gt; -# BR2_PACKAGE_CLAPACK is not set<br>
&gt; -# BR2_PACKAGE_SPIDERMONKEY is not set<br>
&gt; -# BR2_PACKAGE_KODI_LIBVA is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_COHERENCE is not set<br>
&gt; -# BR2_PACKAGE_PHP_EXT_XMLRPC is not set<br>
&gt; -# BR2_GCC_VERSION_8_X is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2021.05<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_UDISKS_LVM2 is not set<br>
&gt; -# BR2_PACKAGE_LVM2_APP_LIBRARY is not set<br>
&gt; -# BR2_PACKAGE_LVM2_LVMETAD is not set<br>
&gt; -# BR2_PACKAGE_MONKEY is not set<br>
&gt; -# BR2_PACKAGE_DOCKER_CONTAINERD is not set<br>
&gt; -# BR2_PACKAGE_IOSTAT is not set<br>
&gt; -# BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE is not set<br>
&gt; -# BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV is not set<br>
&gt; -# BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_KBD is not set<br>
&gt; -# BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_MOUSE is not set<br>
&gt; -# BR2_PACKAGE_MESA3D_OSMESA_CLASSIC is not set<br>
&gt; -# BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST is not set<br>
&gt; -# BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2021.02<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_MPD_AUDIOFILE is not set<br>
&gt; -# BR2_PACKAGE_AUDIOFILE is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_33_X is not set<br>
&gt; -# BR2_PACKAGE_LIBUPNP18 is not set<br>
&gt; -# BR2_PACKAGE_BOA is not set<br>
&gt; -# BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA is not set<br>
&gt; -# BR2_GDB_VERSION_8_2 is not set<br>
&gt; -# BR2_PACKAGE_HOST_RCW is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_9 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_8 is not set<br>
&gt; -# BR2_powerpc_601 is not set<br>
&gt; -# BR2_PACKAGE_TI_SGX_LIBGBM is not set<br>
&gt; -# BR2_PACKAGE_IPSEC_TOOLS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2020.11<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GPSD_FIXED_PORT_SPEED is not set<br>
&gt; -# BR2_PACKAGE_GPSD_RECONFIGURE is not set<br>
&gt; -# BR2_PACKAGE_GPSD_CONTROLSEND is not set<br>
&gt; -# BR2_PACKAGE_OPENCV is not set<br>
&gt; -# BR2_PACKAGE_LIBCROCO is not set<br>
&gt; -# BR2_PACKAGE_BELLAGIO is not set<br>
&gt; -# BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY is not set<br>
&gt; -# BR2_TARGET_UBOOT_BOOT_SCRIPT is not set<br>
&gt; -# BR2_TARGET_UBOOT_ENVIMAGE is not set<br>
&gt; -# BR2_PACKAGE_KISMET_CLIENT is not set<br>
&gt; -# BR2_PACKAGE_KISMET_DRONE is not set<br>
&gt; -# BR2_GCC_VERSION_7_X is not set<br>
&gt; -# BR2_PACKAGE_GST1_VALIDATE is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF is not set<br>
&gt; -# BR2_PACKAGE_GQVIEW is not set<br>
&gt; -# BR2_PACKAGE_WESTON_IMX is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_7 is not set<br>
&gt; -# BR2_PACKAGE_TINYHTTPD is not set<br>
&gt; -# BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX is not set<br>
&gt; -# BR2_PACKAGE_AMD_CATALYST is not set<br>
&gt; -# BR2_PACKAGE_NVIDIA_TEGRA23 is not set<br>
&gt; -# BR2_GDB_VERSION_8_1 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2020.08<br>
&gt; -#<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_6 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_5 is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_31_X is not set<br>
&gt; -# BR2_PACKAGE_KODI_PERIPHERAL_STEAMCONTROLLER is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2020.05<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_WIRINGPI is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_PYCRYPTO is not set<br>
&gt; -# BR2_PACKAGE_MTDEV2TUIO is not set<br>
&gt; -# BR2_PACKAGE_EZXML is not set<br>
&gt; -# BR2_PACKAGE_COLLECTD_LVM is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_PYASN is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_PYASN_MODULES is not set<br>
&gt; -# BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174 is not set<br>
&gt; -# BR2_PACKAGE_QT5CANVAS3D is not set<br>
&gt; -# BR2_PACKAGE_KODI_LIBTHEORA is not set<br>
&gt; -# BR2_PACKAGE_CEGUI06 is not set<br>
&gt; -# BR2_GCC_VERSION_5_X is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2020.02<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_JAMVM is not set<br>
&gt; -# BR2_PACKAGE_CLASSPATH is not set<br>
&gt; -# BR2_PACKAGE_QT5_VERSION_5_6 is not set<br>
&gt; -# BR2_PACKAGE_CURL is not set<br>
&gt; -# BR2_PACKAGE_GSTREAMER is not set<br>
&gt; -# BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS is not set<br=
>
&gt; -# BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_NV_SAMPLE_APPS is not set<br>
&gt; -# BR2_PACKAGE_FREERDP_GSTREAMER is not set<br>
&gt; -# BR2_PACKAGE_OPENCV3_WITH_GSTREAMER is not set<br>
&gt; -# BR2_PACKAGE_OPENCV_WITH_GSTREAMER is not set<br>
&gt; -# BR2_PACKAGE_LIBPLAYER is not set<br>
&gt; -# BR2_GCC_VERSION_OR1K is not set<br>
&gt; -# BR2_PACKAGE_BLUEZ_UTILS is not set<br>
&gt; -# BR2_PACKAGE_GADGETFS_TEST is not set<br>
&gt; -# BR2_PACKAGE_FIS is not set<br>
&gt; -BR2_PACKAGE_REFPOLICY_POLICY_VERSION=3D&quot;&quot;<br>
&gt; -# BR2_PACKAGE_CELT051 is not set<br>
&gt; -# BR2_PACKAGE_WIREGUARD is not set<br>
&gt; -# BR2_PACKAGE_PERL_NET_PING is not set<br>
&gt; -# BR2_PACKAGE_PERL_MIME_BASE64 is not set<br>
&gt; -# BR2_PACKAGE_PERL_DIGEST_MD5 is not set<br>
&gt; -# BR2_PACKAGE_ERLANG_P1_ICONV is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_3 is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_SCAPY3K is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_30_X is not set<br>
&gt; -# BR2_PACKAGE_RPI_USERLAND_START_VCFILED is not set<br>
&gt; -# BR2_PACKAGE_TI_SGX_KM_AM335X is not set<br>
&gt; -# BR2_PACKAGE_TI_SGX_KM_AM437X is not set<br>
&gt; -# BR2_PACKAGE_TI_SGX_KM_AM4430 is not set<br>
&gt; -# BR2_PACKAGE_TI_SGX_KM_AM5430 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2019.11<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPENVMTOOLS_PROCPS is not set<br>
&gt; -# BR2_PACKAGE_ALLJOYN is not set<br>
&gt; -# BR2_PACKAGE_ALLJOYN_BASE is not set<br>
&gt; -# BR2_PACKAGE_ALLJOYN_BASE_CONTROLPANEL is not set<br>
&gt; -# BR2_PACKAGE_ALLJOYN_BASE_NOTIFICATION is not set<br>
&gt; -# BR2_PACKAGE_ALLJOYN_BASE_ONBOARDING is not set<br>
&gt; -# BR2_PACKAGE_ALLJOYN_TCL_BASE is not set<br>
&gt; -# BR2_PACKAGE_ALLJOYN_TCL is not set<br>
&gt; -BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS=3D&quot;&quot;<br>
&gt; -# BR2_PACKAGE_PYTHON_PYSNMP_APPS is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_2 is not set<br>
&gt; -# BR2_TARGET_RISCV_PK is not set<br>
&gt; -# BR2_PACKAGE_SQLITE_STAT3 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_1 is not set<br>
&gt; -# BR2_PACKAGE_DEVMEM2 is not set<br>
&gt; -# BR2_PACKAGE_USTR is not set<br>
&gt; -# BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE is not set<br>
&gt; -# BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE is not set<br>
&gt; -# BR2_PACKAGE_KODI_AUDIODECODER_OPUS is not set<br>
&gt; -# BR2_PACKAGE_MESA3D_OSMESA is not set<br>
&gt; -# BR2_PACKAGE_HOSTAPD_DRIVER_RTW is not set<br>
&gt; -# BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW is not set<br>
&gt; -# BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2019.08<br>
&gt; -#<br>
&gt; -# BR2_TARGET_TS4800_MBRBOOT is not set<br>
&gt; -# BR2_PACKAGE_LIBAMCODEC is not set<br>
&gt; -# BR2_PACKAGE_ODROID_SCRIPTS is not set<br>
&gt; -# BR2_PACKAGE_ODROID_MALI is not set<br>
&gt; -# BR2_PACKAGE_KODI_PLATFORM_AML is not set<br>
&gt; -# BR2_GCC_VERSION_6_X is not set<br>
&gt; -# BR2_GCC_VERSION_4_9_X is not set<br>
&gt; -# BR2_GDB_VERSION_7_12 is not set<br>
&gt; -# BR2_PACKAGE_XAPP_MKFONTDIR is not set<br>
&gt; -# BR2_GDB_VERSION_8_0 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_20 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_5_0 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2019.05<br>
&gt; -#<br>
&gt; -# BR2_CSKY_DSP is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD is not set<br>
&gt; -# BR2_PACKAGE_LUNIT is not set<br>
&gt; -# BR2_PACKAGE_FFMPEG_FFSERVER is not set<br>
&gt; -# BR2_PACKAGE_LIBUMP is not set<br>
&gt; -# BR2_PACKAGE_SUNXI_MALI is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_29_X is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_28_X is not set<br>
&gt; -# BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2019.02<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_QT is not set<br>
&gt; -# BR2_PACKAGE_QTUIO is not set<br>
&gt; -# BR2_PACKAGE_PINENTRY_QT4 is not set<br>
&gt; -# BR2_PACKAGE_POPPLER_QT is not set<br>
&gt; -# BR2_PACKAGE_OPENCV3_WITH_QT is not set<br>
&gt; -# BR2_PACKAGE_OPENCV_WITH_QT is not set<br>
&gt; -# BR2_PACKAGE_AMD_CATALYST_CCCLE is not set<br>
&gt; -# BR2_PACKAGE_SDL_QTOPIA is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_PYQT is not set<br>
&gt; -# BR2_PACKAGE_LUACRYPTO is not set<br>
&gt; -# BR2_PACKAGE_TN5250 is not set<br>
&gt; -# BR2_PACKAGE_BOOST_SIGNALS is not set<br>
&gt; -# BR2_PACKAGE_FFTW_PRECISION_SINGLE is not set<br>
&gt; -# BR2_PACKAGE_FFTW_PRECISION_DOUBLE is not set<br>
&gt; -# BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE is not set<br>
&gt; -# BR2_PACKAGE_LUA_5_2 is not set<br>
&gt; -# BR2_TARGET_GENERIC_PASSWD_MD5 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2018.11<br>
&gt; -#<br>
&gt; -# BR2_TARGET_XLOADER is not set<br>
&gt; -# BR2_PACKAGE_TIDSP_BINARIES is not set<br>
&gt; -# BR2_PACKAGE_DSP_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_GST_DSP is not set<br>
&gt; -# BR2_PACKAGE_BOOTUTILS is not set<br>
&gt; -# BR2_PACKAGE_EXPEDITE is not set<br>
&gt; -# BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_10 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_11 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_12 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_13 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_15 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_17 is not set<br>
&gt; -# BR2_PACKAGE_LIBNFTNL_XML is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_2 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_1 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_16 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_18 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2018.08<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_APPLEWMPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_BIGREQSPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_COMPOSITEPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_DAMAGEPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_DMXPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_DRI2PROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_DRI3PROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_FIXESPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_FONTCACHEPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_FONTSPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_GLPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_INPUTPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_KBPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_PRESENTPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_RANDRPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_RECORDPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_RENDERPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_RESOURCEPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_SCRNSAVERPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_VIDEOPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_WINDOWSWMPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_XCMISCPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_XEXTPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_XF86DGAPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_XF86DRIPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_XINERAMAPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_XPROTO is not set<br>
&gt; -# BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_OPENGL is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLES2 is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_GLX is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_X11 is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_DISPMANX is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123 is not set<br>
&gt; -# BR2_GDB_VERSION_7_11 is not set<br>
&gt; -# BR2_GDB_VERSION_7_10 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2018.05<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_MEDIAART_BACKEND_NONE is not set<br>
&gt; -# BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF is not set<br>
&gt; -# BR2_PACKAGE_MEDIAART_BACKEND_QT is not set<br>
&gt; -# BR2_PACKAGE_TI_SGX_AM335X is not set<br>
&gt; -# BR2_PACKAGE_TI_SGX_AM437X is not set<br>
&gt; -# BR2_PACKAGE_TI_SGX_AM4430 is not set<br>
&gt; -# BR2_PACKAGE_TI_SGX_AM5430 is not set<br>
&gt; -# BR2_PACKAGE_JANUS_AUDIO_BRIDGE is not set<br>
&gt; -# BR2_PACKAGE_JANUS_ECHO_TEST is not set<br>
&gt; -# BR2_PACKAGE_JANUS_RECORDPLAY is not set<br>
&gt; -# BR2_PACKAGE_JANUS_SIP_GATEWAY is not set<br>
&gt; -# BR2_PACKAGE_JANUS_STREAMING is not set<br>
&gt; -# BR2_PACKAGE_JANUS_TEXT_ROOM is not set<br>
&gt; -# BR2_PACKAGE_JANUS_VIDEO_CALL is not set<br>
&gt; -# BR2_PACKAGE_JANUS_VIDEO_ROOM is not set<br>
&gt; -# BR2_PACKAGE_JANUS_MQTT is not set<br>
&gt; -# BR2_PACKAGE_JANUS_RABBITMQ is not set<br>
&gt; -# BR2_PACKAGE_JANUS_REST is not set<br>
&gt; -# BR2_PACKAGE_JANUS_UNIX_SOCKETS is not set<br>
&gt; -# BR2_PACKAGE_JANUS_WEBSOCKETS is not set<br>
&gt; -# BR2_PACKAGE_IPSEC_SECCTX_DISABLE is not set<br>
&gt; -# BR2_PACKAGE_IPSEC_SECCTX_ENABLE is not set<br>
&gt; -# BR2_PACKAGE_IPSEC_SECCTX_KERNEL is not set<br>
&gt; -# BR2_PACKAGE_LIBTFDI_CPP is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_BLITZER is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_FLICK is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_REDMOND is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_START is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_SUNNY is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS is not set<br>
&gt; -# BR2_PACKAGE_JQUERY_UI_THEME_VADER is not set<br>
&gt; -# BR2_PACKAGE_BLUEZ5_PLUGINS_HEALTH is not set<br>
&gt; -# BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI is not set<br>
&gt; -# BR2_PACKAGE_BLUEZ5_PLUGINS_NFC is not set<br>
&gt; -# BR2_PACKAGE_BLUEZ5_PLUGINS_SAP is not set<br>
&gt; -# BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS is not set<br>
&gt; -# BR2_PACKAGE_TRANSMISSION_REMOTE is not set<br>
&gt; -# BR2_PACKAGE_LIBKCAPI_APPS is not set<br>
&gt; -# BR2_PACKAGE_MPLAYER is not set<br>
&gt; -# BR2_PACKAGE_MPLAYER_MPLAYER is not set<br>
&gt; -# BR2_PACKAGE_MPLAYER_MENCODER is not set<br>
&gt; -# BR2_PACKAGE_LIBPLAYER_MPLAYER is not set<br>
&gt; -# BR2_PACKAGE_IQVLINUX is not set<br>
&gt; -# BR2_BINFMT_FLAT_SEP_DATA is not set<br>
&gt; -# BR2_bfin is not set<br>
&gt; -# BR2_PACKAGE_KODI_ADSP_BASIC is not set<br>
&gt; -# BR2_PACKAGE_KODI_ADSP_FREESURROUND is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2018.02<br>
&gt; -#<br>
&gt; -# BR2_KERNEL_HEADERS_3_4 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_10 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_12 is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_27_X is not set<br>
&gt; -# BR2_PACKAGE_EEPROG is not set<br>
&gt; -# BR2_PACKAGE_GNUPG2_GPGV2 is not set<br>
&gt; -# BR2_PACKAGE_IMX_GPU_VIV_APITRACE is not set<br>
&gt; -# BR2_PACKAGE_IMX_GPU_VIV_G2D is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2017.11<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_RFKILL is not set<br>
&gt; -# BR2_PACKAGE_UTIL_LINUX_RESET is not set<br>
&gt; -# BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW is not set<br>
&gt; -# BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND is not set<br>
&gt; -# BR2_PACKAGE_SEPOLGEN is not set<br>
&gt; -# BR2_PACKAGE_OPENOBEX_BLUEZ is not set<br>
&gt; -# BR2_PACKAGE_OPENOBEX_LIBUSB is not set<br>
&gt; -# BR2_PACKAGE_OPENOBEX_APPS is not set<br>
&gt; -# BR2_PACKAGE_OPENOBEX_SYSLOG is not set<br>
&gt; -# BR2_PACKAGE_OPENOBEX_DUMP is not set<br>
&gt; -# BR2_PACKAGE_AICCU is not set<br>
&gt; -# BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2017.08<br>
&gt; -#<br>
&gt; -# BR2_TARGET_GRUB is not set<br>
&gt; -# BR2_PACKAGE_SIMICSFS is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_26_X is not set<br>
&gt; -BR2_XTENSA_OVERLAY_DIR=3D&quot;&quot;<br>
&gt; -BR2_XTENSA_CUSTOM_NAME=3D&quot;&quot;<br>
&gt; -# BR2_PACKAGE_HOST_MKE2IMG is not set<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_BLOCKS=3D0<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES=3D0<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDXAPARSE is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DATAURISRC is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DCCP is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HDVPARSE is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MVE is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PATCHDETECT is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD is not set<br>
&gt; -# BR2_STRIP_none is not set<br>
&gt; -# BR2_PACKAGE_BEECRYPT_CPP is not set<br>
&gt; -# BR2_PACKAGE_SPICE_CLIENT is not set<br>
&gt; -# BR2_PACKAGE_SPICE_GUI is not set<br>
&gt; -# BR2_PACKAGE_SPICE_TUNNEL is not set<br>
&gt; -# BR2_PACKAGE_INPUT_TOOLS is not set<br>
&gt; -# BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH is not set<br>
&gt; -# BR2_PACKAGE_INPUT_TOOLS_JSCAL is not set<br>
&gt; -# BR2_PACKAGE_INPUT_TOOLS_JSTEST is not set<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH is not set<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86 is not set<br>
&gt; -# BR2_GCC_VERSION_4_8_X is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2017.05<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_SUNXI_MALI_R2P4 is not set<br>
&gt; -# BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT is not set<br>
&gt; -# BR2_PACKAGE_NODEJS_MODULES_EXPRESS is not set<br>
&gt; -# BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL is not set<br>
&gt; -# BR2_PACKAGE_OPENOCD_FT2XXX is not set<br>
&gt; -# BR2_PACKAGE_KODI_RTMPDUMP is not set<br>
&gt; -# BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN is not set<br>
&gt; -# BR2_PACKAGE_PORTMAP is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_25_X is not set<br>
&gt; -# BR2_TOOLCHAIN_BUILDROOT_INET_RPC is not set<br>
&gt; -BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS=3D0<br>
&gt; -# BR2_PACKAGE_SYSTEMD_KDBUS is not set<br>
&gt; -# BR2_PACKAGE_POLARSSL is not set<br>
&gt; -# BR2_NBD_CLIENT is not set<br>
&gt; -# BR2_NBD_SERVER is not set<br>
&gt; -# BR2_PACKAGE_GMOCK is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_8 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_18 is not set<br>
&gt; -# BR2_GLIBC_VERSION_2_22 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2017.02<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PERL_DB_FILE is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_7 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_6 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_5 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_14 is not set<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS is not set<br>
&gt; -# BR2_UCLIBC_INSTALL_TEST_SUITE is not set<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX is not set<br>
&gt; -# BR2_PACKAGE_MAKEDEVS is not set<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A is not set<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE is not set<br>
&gt; -# BR2_PACKAGE_SNOWBALL_HDMISERVICE is not set<br>
&gt; -# BR2_PACKAGE_SNOWBALL_INIT is not set<br>
&gt; -# BR2_GDB_VERSION_7_9 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2016.11<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_PHP_SAPI_CLI_CGI is not set<br>
&gt; -# BR2_PACKAGE_PHP_SAPI_CLI_FPM is not set<br>
&gt; -# BR2_PACKAGE_WVSTREAMS is not set<br>
&gt; -# BR2_PACKAGE_WVDIAL is not set<br>
&gt; -# BR2_PACKAGE_WEBKITGTK24 is not set<br>
&gt; -# BR2_PACKAGE_TORSMO is not set<br>
&gt; -# BR2_PACKAGE_SSTRIP is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_3 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_2 is not set<br>
&gt; -# BR2_PACKAGE_KODI_ADDON_XVDR is not set<br>
&gt; -# BR2_PACKAGE_IPKG is not set<br>
&gt; -# BR2_GCC_VERSION_4_7_X is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_24_X is not set<br>
&gt; -# BR2_PACKAGE_WESTON_RPI is not set<br>
&gt; -# BR2_LINUX_KERNEL_TOOL_CPUPOWER is not set<br>
&gt; -# BR2_LINUX_KERNEL_TOOL_PERF is not set<br>
&gt; -# BR2_LINUX_KERNEL_TOOL_SELFTESTS is not set<br>
&gt; -# BR2_GCC_VERSION_4_8_ARC is not set<br>
&gt; -# BR2_KERNEL_HEADERS_4_0 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_19 is not set<br>
&gt; -# BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS is not set<br>
&gt; -# BR2_PACKAGE_ELEMENTARY is not set<br>
&gt; -# BR2_LINUX_KERNEL_CUSTOM_LOCAL is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2016.08<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_EFL_JP2K is not set<br>
&gt; -# BR2_PACKAGE_SYSTEMD_COMPAT is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER is not set<br>
&gt; -# BR2_PACKAGE_LIBFSLVPUWRAP is not set<br>
&gt; -# BR2_PACKAGE_LIBFSLPARSER is not set<br>
&gt; -# BR2_PACKAGE_LIBFSLCODEC is not set<br>
&gt; -# BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT is not set<br=
>
&gt; -# BR2_PTHREADS_OLD is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_23_X is not set<br>
&gt; -# BR2_TOOLCHAIN_BUILDROOT_EGLIBC is not set<br>
&gt; -# BR2_GDB_VERSION_7_8 is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2016.05<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL is not set<br>
&gt; -# BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP is not set<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123 is not set<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC is not set<br>
&gt; -# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2 is not set<br>
&gt; -# BR2_x86_i386 is not set<br>
&gt; -# BR2_PACKAGE_QT5QUICK1 is not set<br>
&gt; -BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR=3D&quot;&quot;<br>
&gt; -# BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_17 is not set<br>
&gt; -# BR2_GDB_VERSION_7_7 is not set<br>
&gt; -# BR2_PACKAGE_FOOMATIC_FILTERS is not set<br>
&gt; -# BR2_PACKAGE_SAMBA is not set<br>
&gt; -# BR2_PACKAGE_KODI_WAVPACK is not set<br>
&gt; -# BR2_PACKAGE_KODI_RSXS is not set<br>
&gt; -# BR2_PACKAGE_KODI_GOOM is not set<br>
&gt; -# BR2_PACKAGE_SYSTEMD_ALL_EXTRAS is not set<br>
&gt; -# BR2_GCC_VERSION_4_5_X is not set<br>
&gt; -# BR2_PACKAGE_SQLITE_READLINE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2016.02<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_DOVECOT_BZIP2 is not set<br>
&gt; -# BR2_PACKAGE_DOVECOT_ZLIB is not set<br>
&gt; -# BR2_PACKAGE_E2FSPROGS_FINDFS is not set<br>
&gt; -# BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL is not set<br>
&gt; -# BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE is not set<br>
&gt; -# BR2_PACKAGE_OPENPOWERLINK_LIBPCAP is not set<br>
&gt; -# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set<br>
&gt; -# BR2_PACKAGE_CUPS_PDFTOPS is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_16 is not set<br>
&gt; -# BR2_PACKAGE_PYTHON_PYXML is not set<br>
&gt; -# BR2_ENABLE_SSP is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_CLE266 is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_UNICHROME is not set<br>
&gt; -# BR2_PACKAGE_LIBELEMENTARY is not set<br>
&gt; -# BR2_PACKAGE_LIBEINA is not set<br>
&gt; -# BR2_PACKAGE_LIBEET is not set<br>
&gt; -# BR2_PACKAGE_LIBEVAS is not set<br>
&gt; -# BR2_PACKAGE_LIBECORE is not set<br>
&gt; -# BR2_PACKAGE_LIBEDBUS is not set<br>
&gt; -# BR2_PACKAGE_LIBEFREET is not set<br>
&gt; -# BR2_PACKAGE_LIBEIO is not set<br>
&gt; -# BR2_PACKAGE_LIBEMBRYO is not set<br>
&gt; -# BR2_PACKAGE_LIBEDJE is not set<br>
&gt; -# BR2_PACKAGE_LIBETHUMB is not set<br>
&gt; -# BR2_PACKAGE_INFOZIP is not set<br>
&gt; -# BR2_BR2_PACKAGE_NODEJS_0_10_X is not set<br>
&gt; -# BR2_BR2_PACKAGE_NODEJS_0_12_X is not set<br>
&gt; -# BR2_BR2_PACKAGE_NODEJS_4_X is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2015.11<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL is not set<br>
&gt; -# BR2_PACKAGE_MEDIA_CTL is not set<br>
&gt; -# BR2_PACKAGE_SCHIFRA is not set<br>
&gt; -# BR2_PACKAGE_ZXING is not set<br>
&gt; -# BR2_PACKAGE_BLACKBOX is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_0 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_11 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_13 is not set<br>
&gt; -# BR2_KERNEL_HEADERS_3_15 is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE is not set<br>
&gt; -# BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW is not set<br>
&gt; -# BR2_PACKAGE_KOBS_NG is not set<br>
&gt; -# BR2_PACKAGE_SAWMAN is not set<br>
&gt; -# BR2_PACKAGE_DIVINE is not set<br>
&gt; -<br>
&gt; -#<br>
&gt; -# Legacy options removed in 2015.08<br>
&gt; -#<br>
&gt; -# BR2_PACKAGE_KODI_PVR_ADDONS is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_23_2 is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_24 is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_25 is not set<br>
&gt; -# BR2_PACKAGE_PERF is not set<br>
&gt; -# BR2_BINUTILS_VERSION_2_22 is not set<br>
&gt; -# BR2_PACKAGE_GPU_VIV_BIN_MX6Q is not set<br>
&gt; -# BR2_TARGET_UBOOT_NETWORK is not set<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000af5c32060e6c5ad7--


--===============0405716122100880206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0405716122100880206==--

