Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B02C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 09:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 716C1813B0;
	Thu, 20 Mar 2025 09:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ptsm9d4P_qXL; Thu, 20 Mar 2025 09:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EBC381323
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EBC381323;
	Thu, 20 Mar 2025 09:47:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E71D1A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 09:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 522914081D
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 09:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1bJEZAVFbXz for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 09:47:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com;
 envelope-from=meena.murthy@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C846F40862
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C846F40862
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C846F40862
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 09:47:03 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-523eb86b31aso260899e0c.0
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 02:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742464022; x=1743068822;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vTGeTnHl11Y4ZNeF+pbohpaig7MLbolTFQ2Jv4oWElo=;
 b=IiAGV4KVPj9Cbd6cFP4rxwk4C7TjS45EXEyrI/6JnjjOH7HaIVvfOW4zze64sjfNIj
 k8LfiUos6umzS1PIAXSXavCooHslb6YqK+IUu/mOlxw6j+Qa0o2tKYf0rCh6MC1ZZ+Fm
 FjIEltgmAbQwNvB/jeXpSIYuj536xnrytvxf8+voFiftBOfmZuQlEUeM2y5REKRfYhuK
 5lFo3/ZQlwlISvGHJZru354SYfo5M6D4SmBQLGoAciMA+MmtOvclT/Eg1etZCASwBoV0
 0gzailEE3aqeY7dDnpnO1z8GJKe97WrvfaawWbLQEK4Ch/Gdcmma2xfr5qAOvPEFLbMW
 fvMg==
X-Gm-Message-State: AOJu0Yw+nIfiWAWnUMb73XUUj9+epRwD/5CFZdKOE3zo5VwVYeMFF+Db
 O6UM9jVGHudhT7nmUfpZdWfOfGaR8l6gJpwMxEXmWeo78HuTMnZWtn/j1UjLVJ7MYLGBwQ1AA3c
 lK5I8RX6SCw544nDOjNhak8LzQzO3pkgr2X8Z
X-Gm-Gg: ASbGncsVG6L6tmDCa4OgUw6vnX/nHSjZ81aLbwJ04H+AnAiMTTnKkpK6HhkyLwz+eXr
 ouMQtiXHqsAxgvJbOI0tJuVipkmyr8XVlyuC1Z/GML+q+kec07mPCZa1YXJRwcmV9p2tnxaKni6
 0KB1ZtRNmHwkLc2u9twdUjKnTR
X-Google-Smtp-Source: AGHT+IEARudFm8FMQmOAHDXRfKjM+NNnlBSIfcAAOu0/RuuAr5dAKhJn4KeeQnfFt+7Yt2slOyU/32e+g5ezErLKmOg=
X-Received: by 2002:a05:6102:4415:b0:4c1:8e07:40b8 with SMTP id
 ada2fe7eead31-4c4ec661b2emr4149099137.6.1742464022201; Thu, 20 Mar 2025
 02:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250310055356.273718-2-meena.murthy@amarulasolutions.com>
 <e79f82c56b52b16221625312fab2894f@free.fr>
In-Reply-To: <e79f82c56b52b16221625312fab2894f@free.fr>
From: Meena Murthy <meena.murthy@amarulasolutions.com>
Date: Thu, 20 Mar 2025 15:16:26 +0530
X-Gm-Features: AQ5f1JoI_N0WbVW7Ds2CiZheNQnxe47yyRFxFVyQH2SafzS0Zy7g7kTm-XeV760
Message-ID: <CAFaLCFUEW6auKyGF4xBf28W4nJLW8f5oHX5568AR-Hd5v3W7qg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742464022; x=1743068822;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vTGeTnHl11Y4ZNeF+pbohpaig7MLbolTFQ2Jv4oWElo=;
 b=b7dGJGVtj60b6H4HzNvSwPvLLdJgDwmmgMTEDJ6H3KF+TFS3BWnlkotArHWaClR8ww
 KcGAXvATngYLisk17phaWILVcE+zG9O0RRdjI6dSvedtxasFL9JZds8ubeL3L/39Dk+r
 DvmW4Td6A6vT9WIjySQpPSvwAHxgxGwcKBGoA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=b7dGJGVt
Subject: Re: [Buildroot] [PATCH v3] board: Add support for Engicam PX30 SOM
 board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0682855430316528508=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0682855430316528508==
Content-Type: multipart/alternative; boundary="00000000000013ecc00630c30565"

--00000000000013ecc00630c30565
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thank you for taking the time to review my patch, starting to work on your
feedback.

Regards,

*Meena Murthy*

Software Engineer

M. +91 994 5695125

meena.murthy@amarulasolutions.com

__________________________________


*Amarula Solutions Pvt. Ltd*

405/E-Block, Sri Lakshmi Shubham Arcade, Chandanagar, Hyderabad - 500050, I=
N
info@amarulasolutions.com

www.amarulasolutions.com



On Sun, Mar 16, 2025 at 10:47=E2=80=AFPM Julien Olivain <ju.o@free.fr> wrot=
e:

> Hi Meena,
>
> Thanks for the patch!  I have few comments.
>
> First, to follow the "convention" with other commits, could you
> change the commit one-liner title to:
>
> configs/engicam_px30_core_defconfig: new defconfig
>
> See for example:
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/27b3e6774fe447dc5eb12=
cc7f498ec8868eb65c9
>
> On 10/03/2025 06:53, Meena Murthy wrote:
> > Add initial support for Engicam PX30 SOM board
> > with below features:
> > - U-Boot 2024.01
> > - Linux 6.4.16
> > - Default packages from buildroot
> >
> > px30 ctouch2 with 10 inches display
> >
> > https://www.engicam.com/vis-prod/C-Touch-2-0-Carrier-Board/ \
> >
>  General-purpose-carrier-board-with-capacitive-touch-interface-EDIMM-20-c=
ompliant
> >
> > ---
> >
> > Changes v2 -> v3:
> > Used BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS so tht arguments are passed only
> > to BR2_ROOTFS_POST_IMAGE_SCRIPT
> >
> > Changes v1 -> v2:
> > Based on code review comments
> > - Added more details in readme.txt for Engicam board
> > - Corrected board name
> > - Removed android-sparse image from genimage.cfg
> > - Changes to configuration file
> >
> > Signed-off-by: Meena Murthy <meena.murthy@amarulasolutions.com>
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>
> Those "Signed-off-by" lines should be moved in the previous section
> (before "---", as this patch change list gets removed when applied).
>
> > ---
> >  DEVELOPERS                                    |  4 ++
> >  board/engicam/px30core/extlinux.conf          |  4 ++
> >  board/engicam/px30core/genimage.cfg           | 22 +++++++
> >  .../patches/linux-headers/linux-headers.hash  |  1 +
> >  .../engicam/px30core/patches/linux/linux.hash |  2 +
> >  .../engicam/px30core/patches/uboot/uboot.hash |  2 +
> >  board/engicam/px30core/post-build.sh          |  5 ++
> >  board/engicam/px30core/readme.txt             | 60 +++++++++++++++++++
> >  configs/engicam_px30_core_defconfig           | 55 +++++++++++++++++
> >  9 files changed, 155 insertions(+)
> >  create mode 100644 board/engicam/px30core/extlinux.conf
> >  create mode 100644 board/engicam/px30core/genimage.cfg
> >  create mode 120000
> > board/engicam/px30core/patches/linux-headers/linux-headers.hash
> >  create mode 100644 board/engicam/px30core/patches/linux/linux.hash
> >  create mode 100644 board/engicam/px30core/patches/uboot/uboot.hash
> >  create mode 100755 board/engicam/px30core/post-build.sh
> >  create mode 100644 board/engicam/px30core/readme.txt
> >  create mode 100644 configs/engicam_px30_core_defconfig
>
> [...]
>
> > diff --git a/board/engicam/px30core/patches/linux/linux.hash
> > b/board/engicam/px30core/patches/linux/linux.hash
> > new file mode 100644
> > index 0000000000..db84a5e56b
> > --- /dev/null
> > +++ b/board/engicam/px30core/patches/linux/linux.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
>
> Since you are using an upstream Kernel, we can get hashes from
> upstream. Can you change this "# Locally calculated" with:
>
> # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
>
> > +sha256
> > 9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d
> > linux-6.4.16.tar.xz
>
> [...]
>
> > diff --git a/configs/engicam_px30_core_defconfig
> > b/configs/engicam_px30_core_defconfig
> > new file mode 100644
> > index 0000000000..d92dba69ed
> > --- /dev/null
> > +++ b/configs/engicam_px30_core_defconfig
> > @@ -0,0 +1,55 @@
> > +BR2_aarch64=3Dy
> > +BR2_cortex_a72_a53=3Dy
>
> The Kernel device tree you reference below is:
> rockchip/px30-engicam-px30-core-ctouch2-of10
>
>  From:
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts?h=3Dv=
6.4.16#n9
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/arch/arm64/boot/dts/rockchip/px30.dtsi?h=3Dv6.4.16#n38
>
> this DTS describes 4x Cortex-A35 CPUs in the PX30.
> This should preferably be:
>
> BR2_cortex_a35=3Dy
>
> Can you double-check, and correct if needed?
>
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=3Dy
>
> I recommend to switch to 6.12.x series, so this should become:
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=3Dy
> See also my comment for BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE.
>
> > +BR2_BINUTILS_VERSION_2_42_X=3Dy
>
> Buildroot defconfigs usually keep the default binutils version. So
> this "BR2_BINUTILS_VERSION_2_42_X=3Dy" can be removed.
>
> > +BR2_CURL=3D"curl -q --ftp-pasv --retry 3"
> > +BR2_WGET=3D"wget -nd -t 3"
> > +BR2_SVN=3D"svn --non-interactive"
> > +BR2_SCP=3D"scp"
> > +BR2_SFTP=3D"sftp"
> > +BR2_GNU_MIRROR=3D"http://ftpmirror.gnu.org"
>
> BR2_CURL to BR2_GNU_MIRROR variables does not seem specific to this
> board defconfig. They can be removed so the defconfig can use the
> Buildroot default values.
>
> > +BR2_GLOBAL_PATCH_DIR=3D"board/engicam/px30core/patches"
> > +BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy
> > +BR2_TARGET_GENERIC_HOSTNAME=3D""
>
> BR2_TARGET_GENERIC_HOSTNAME should preferably contain a string
> identifying the board, like "engicam-px30-core", or could be
> completely removed (to use the default value). Could you change
> to use one of those two options?
>
> > +BR2_TARGET_GENERIC_ISSUE=3D""
>
> Same comment for BR2_TARGET_GENERIC_ISSUE. Can you use a string
> identifying the board, like "Welcome to Engicam PX30.Core C.TOUCH 2.0"
> or remove this config variable (to use the default value)?
>
> > +BR2_ROOTFS_MERGED_USR=3Dy
>
> BR2_ROOTFS_MERGED_USR should be a choice left to the end user.
> Can you remove this configuration from this defconfig?
>
> > +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=3Dy
> > +BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/engicam/px30core/post-build.sh"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS=3D"-c
> > board/engicam/px30core/genimage.cfg"
> > +BR2_LINUX_KERNEL=3Dy
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.4.16"
>
> Kernel 6.4.x series is not LTS and is no longer maintained. Since
> this board is still maintained upstream, could you update the
> kernel to the latest LTS? At this time, this is v6.12.19. See:
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts?h=3Dv=
6.12.19
>
> > +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> >
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"rockchip/px30-engicam-px30-core-ctou=
ch2-of10"
> > +BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
> > +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> > +BR2_TARGET_ROOTFS_EXT2=3Dy
> > +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> > +BR2_TARGET_ROOTFS_EXT2_SIZE=3D"150M"
> > +BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS=3D"-O 64bit"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=3Dy
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=3D"
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
>
> The _CUSTOM_REPO_URL given here is the same as the Buildroot
> default value. See:
>
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc2/boot/arm-tr=
usted-firmware/arm-trusted-firmware.mk?ref_type=3Dtags#L19
>
> So _CUSTOM_GIT and _CUSTOM_REPO_URL can be removed.
>
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION=3D"v2.9"
>
> Since this platform seems to be supported upstream, can you
> update to the latest lts version? At this time, it is "lts-v2.12.1".
> See:
>
> https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.g=
it/+/refs/tags/lts-v2.12.1
>
> So this should become:
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=3Dy
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D"lts-v2.12.1"
>
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D"px30"
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=3D""
> > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=3Dy
> > +BR2_TARGET_UBOOT=3Dy
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2024.01"
>
> Same comment for u-boot. Since this board seems to be supported in
> upstream u-boot, it could be updated to v2025.01. See:
>
> https://source.denx.de/u-boot/u-boot/-/blob/v2025.01/configs/px30-core-ct=
ouch2-of10-px30_defconfig
>
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"px30-core-ctouch2-of10-px30"
> > +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> > +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> > +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=3Dy
> > +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=3Dy
> > +BR2_TARGET_UBOOT_USE_BINMAN=3Dy
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=3Dy
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME=3D"u-boot.itb"
> > +BR2_TARGET_UBOOT_SPL=3Dy
> > +BR2_TARGET_UBOOT_SPL_NAME=3D"idbloader.img"
> > +BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> > +BR2_PACKAGE_HOST_GENIMAGE=3Dy
> > +BR2_PACKAGE_HOST_MTOOLS=3Dy
>
> Can you send an updated version of this patch with those changes,
> please?
>
> Best regards,
>
> Julien.
>

--00000000000013ecc00630c30565
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien,<br><br>Thank you for taking the time to re=
view my patch, starting to work on your feedback.<br><br>Regards,</div><div=
><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-height:1.7999999999=
999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font=
-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:transparent;ver=
tical-align:baseline;white-space:pre-wrap"><b>Meena Murthy</b></span></p><p=
 dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quo=
t;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:b=
aseline;white-space:pre-wrap">Software Engineer</span></p><p dir=3D"ltr" st=
yle=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;co=
lor:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-s=
pace:pre-wrap">M. +91 994 5695125</span></p><p dir=3D"ltr" style=3D"line-he=
ight:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
><a href=3D"mailto:meena.murthy@amarulasolutions.com" target=3D"_blank">mee=
na.murthy@amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-h=
eight:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0=
);background-color:transparent;vertical-align:baseline;white-space:pre-wrap=
">__________________________________</span></p><p dir=3D"ltr" style=3D"line=
-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0=
,0);background-color:transparent;vertical-align:baseline;white-space:pre-wr=
ap"><br></span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;=
color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white=
-space:pre-wrap"><b>Amarula Solutions Pvt. Ltd</b></span></p><p dir=3D"ltr"=
 style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;whit=
e-space:pre-wrap">405/E-Block, Sri Lakshmi Shubham Arcade, Chandanagar, Hyd=
erabad - 500050, IN</span><span style=3D"font-size:10pt;font-family:&quot;U=
buntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;ve=
rtical-align:baseline;white-space:pre-wrap"><br></span><span style=3D"font-=
size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);ba=
ckground-color:transparent;vertical-align:baseline;white-space:pre-wrap"><a=
 href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@amarulaso=
lutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.79999999999=
99998;margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasoluti=
ons.com/" target=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot=
;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;=
vertical-align:baseline;white-space:pre-wrap">www.amarulasolutions.com</spa=
n></a></p><div><br></div></span></div></div></div><br></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, Mar 16, 2025 at 10:47=E2=80=AFPM Julien Olivain &lt;<a href=3D"ma=
ilto:ju.o@free.fr">ju.o@free.fr</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Meena,<br>
<br>
Thanks for the patch!=C2=A0 I have few comments.<br>
<br>
First, to follow the &quot;convention&quot; with other commits, could you<b=
r>
change the commit one-liner title to:<br>
<br>
configs/engicam_px30_core_defconfig: new defconfig<br>
<br>
See for example:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/27b3e6774fe4=
47dc5eb12cc7f498ec8868eb65c9" rel=3D"noreferrer" target=3D"_blank">https://=
gitlab.com/buildroot.org/buildroot/-/commit/27b3e6774fe447dc5eb12cc7f498ec8=
868eb65c9</a><br>
<br>
On 10/03/2025 06:53, Meena Murthy wrote:<br>
&gt; Add initial support for Engicam PX30 SOM board<br>
&gt; with below features:<br>
&gt; - U-Boot 2024.01<br>
&gt; - Linux 6.4.16<br>
&gt; - Default packages from buildroot<br>
&gt; <br>
&gt; px30 ctouch2 with 10 inches display<br>
&gt; <br>
&gt; <a href=3D"https://www.engicam.com/vis-prod/C-Touch-2-0-Carrier-Board/=
" rel=3D"noreferrer" target=3D"_blank">https://www.engicam.com/vis-prod/C-T=
ouch-2-0-Carrier-Board/</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0General-purpose-carrier-board-with-capacitiv=
e-touch-interface-EDIMM-20-compliant<br>
&gt; <br>
&gt; ---<br>
&gt; <br>
&gt; Changes v2 -&gt; v3:<br>
&gt; Used BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS so tht arguments are passed onl=
y <br>
&gt; to BR2_ROOTFS_POST_IMAGE_SCRIPT<br>
&gt; <br>
&gt; Changes v1 -&gt; v2:<br>
&gt; Based on code review comments<br>
&gt; - Added more details in readme.txt for Engicam board<br>
&gt; - Corrected board name<br>
&gt; - Removed android-sparse image from genimage.cfg<br>
&gt; - Changes to configuration file<br>
&gt; <br>
&gt; Signed-off-by: Meena Murthy &lt;<a href=3D"mailto:meena.murthy@amarula=
solutions.com" target=3D"_blank">meena.murthy@amarulasolutions.com</a>&gt;<=
br>
&gt; Signed-off-by: Michael Trimarchi &lt;<a href=3D"mailto:michael@amarula=
solutions.com" target=3D"_blank">michael@amarulasolutions.com</a>&gt;<br>
<br>
Those &quot;Signed-off-by&quot; lines should be moved in the previous secti=
on<br>
(before &quot;---&quot;, as this patch change list gets removed when applie=
d).<br>
<br>
&gt; ---<br>
&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++<br>
&gt;=C2=A0 board/engicam/px30core/extlinux.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 ++<br>
&gt;=C2=A0 board/engicam/px30core/genimage.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 22 +++++++<br>
&gt;=C2=A0 .../patches/linux-headers/linux-headers.hash=C2=A0 |=C2=A0 1 +<b=
r>
&gt;=C2=A0 .../engicam/px30core/patches/linux/linux.hash |=C2=A0 2 +<br>
&gt;=C2=A0 .../engicam/px30core/patches/uboot/uboot.hash |=C2=A0 2 +<br>
&gt;=C2=A0 board/engicam/px30core/post-build.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 5 ++<br>
&gt;=C2=A0 board/engicam/px30core/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 60 +++++++++++++++++++<br>
&gt;=C2=A0 configs/engicam_px30_core_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 55 +++++++++++++++++<br>
&gt;=C2=A0 9 files changed, 155 insertions(+)<br>
&gt;=C2=A0 create mode 100644 board/engicam/px30core/extlinux.conf<br>
&gt;=C2=A0 create mode 100644 board/engicam/px30core/genimage.cfg<br>
&gt;=C2=A0 create mode 120000 <br>
&gt; board/engicam/px30core/patches/linux-headers/linux-headers.hash<br>
&gt;=C2=A0 create mode 100644 board/engicam/px30core/patches/linux/linux.ha=
sh<br>
&gt;=C2=A0 create mode 100644 board/engicam/px30core/patches/uboot/uboot.ha=
sh<br>
&gt;=C2=A0 create mode 100755 board/engicam/px30core/post-build.sh<br>
&gt;=C2=A0 create mode 100644 board/engicam/px30core/readme.txt<br>
&gt;=C2=A0 create mode 100644 configs/engicam_px30_core_defconfig<br>
<br>
[...]<br>
<br>
&gt; diff --git a/board/engicam/px30core/patches/linux/linux.hash <br>
&gt; b/board/engicam/px30core/patches/linux/linux.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..db84a5e56b<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/engicam/px30core/patches/linux/linux.hash<br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +# Locally calculated<br>
<br>
Since you are using an upstream Kernel, we can get hashes from<br>
upstream. Can you change this &quot;# Locally calculated&quot; with:<br>
<br>
# From <a href=3D"https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.a=
sc" rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/pub/linux/k=
ernel/v6.x/sha256sums.asc</a><br>
<br>
&gt; +sha256=C2=A0 <br>
&gt; 9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d=C2=A0=
 <br>
&gt; linux-6.4.16.tar.xz<br>
<br>
[...]<br>
<br>
&gt; diff --git a/configs/engicam_px30_core_defconfig <br>
&gt; b/configs/engicam_px30_core_defconfig<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d92dba69ed<br>
&gt; --- /dev/null<br>
&gt; +++ b/configs/engicam_px30_core_defconfig<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +BR2_aarch64=3Dy<br>
&gt; +BR2_cortex_a72_a53=3Dy<br>
<br>
The Kernel device tree you reference below is:<br>
rockchip/px30-engicam-px30-core-ctouch2-of10<br>
<br>
=C2=A0From:<br>
<a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
.git/tree/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.=
dts?h=3Dv6.4.16#n9" rel=3D"noreferrer" target=3D"_blank">https://web.git.ke=
rnel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts=
/rockchip/px30-engicam-px30-core-ctouch2-of10.dts?h=3Dv6.4.16#n9</a><br>
<a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
.git/tree/arch/arm64/boot/dts/rockchip/px30.dtsi?h=3Dv6.4.16#n38" rel=3D"no=
referrer" target=3D"_blank">https://web.git.kernel.org/pub/scm/linux/kernel=
/git/stable/linux.git/tree/arch/arm64/boot/dts/rockchip/px30.dtsi?h=3Dv6.4.=
16#n38</a><br>
<br>
this DTS describes 4x Cortex-A35 CPUs in the PX30.<br>
This should preferably be:<br>
<br>
BR2_cortex_a35=3Dy<br>
<br>
Can you double-check, and correct if needed?<br>
<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=3Dy<br>
<br>
I recommend to switch to 6.12.x series, so this should become:<br>
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=3Dy<br>
See also my comment for BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE.<br>
<br>
&gt; +BR2_BINUTILS_VERSION_2_42_X=3Dy<br>
<br>
Buildroot defconfigs usually keep the default binutils version. So<br>
this &quot;BR2_BINUTILS_VERSION_2_42_X=3Dy&quot; can be removed.<br>
<br>
&gt; +BR2_CURL=3D&quot;curl -q --ftp-pasv --retry 3&quot;<br>
&gt; +BR2_WGET=3D&quot;wget -nd -t 3&quot;<br>
&gt; +BR2_SVN=3D&quot;svn --non-interactive&quot;<br>
&gt; +BR2_SCP=3D&quot;scp&quot;<br>
&gt; +BR2_SFTP=3D&quot;sftp&quot;<br>
&gt; +BR2_GNU_MIRROR=3D&quot;<a href=3D"http://ftpmirror.gnu.org" rel=3D"no=
referrer" target=3D"_blank">http://ftpmirror.gnu.org</a>&quot;<br>
<br>
BR2_CURL to BR2_GNU_MIRROR variables does not seem specific to this<br>
board defconfig. They can be removed so the defconfig can use the<br>
Buildroot default values.<br>
<br>
&gt; +BR2_GLOBAL_PATCH_DIR=3D&quot;board/engicam/px30core/patches&quot;<br>
&gt; +BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy<br>
&gt; +BR2_TARGET_GENERIC_HOSTNAME=3D&quot;&quot;<br>
<br>
BR2_TARGET_GENERIC_HOSTNAME should preferably contain a string<br>
identifying the board, like &quot;engicam-px30-core&quot;, or could be<br>
completely removed (to use the default value). Could you change<br>
to use one of those two options?<br>
<br>
&gt; +BR2_TARGET_GENERIC_ISSUE=3D&quot;&quot;<br>
<br>
Same comment for BR2_TARGET_GENERIC_ISSUE. Can you use a string<br>
identifying the board, like &quot;Welcome to Engicam PX30.Core C.TOUCH 2.0&=
quot;<br>
or remove this config variable (to use the default value)?<br>
<br>
&gt; +BR2_ROOTFS_MERGED_USR=3Dy<br>
<br>
BR2_ROOTFS_MERGED_USR should be a choice left to the end user.<br>
Can you remove this configuration from this defconfig?<br>
<br>
&gt; +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=3Dy<br>
&gt; +BR2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;board/engicam/px30core/post-buil=
d.sh&quot;<br>
&gt; +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot=
;<br>
&gt; +BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS=3D&quot;-c <br>
&gt; board/engicam/px30core/genimage.cfg&quot;<br>
&gt; +BR2_LINUX_KERNEL=3Dy<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.4.16&quot;<br>
<br>
Kernel 6.4.x series is not LTS and is no longer maintained. Since<br>
this board is still maintained upstream, could you update the<br>
kernel to the latest LTS? At this time, this is v6.12.19. See:<br>
<a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
.git/tree/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.=
dts?h=3Dv6.12.19" rel=3D"noreferrer" target=3D"_blank">https://web.git.kern=
el.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/r=
ockchip/px30-engicam-px30-core-ctouch2-of10.dts?h=3Dv6.12.19</a><br>
<br>
&gt; +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy<br>
&gt; +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
&gt; +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;rockchip/px30-engicam-px30-c=
ore-ctouch2-of10&quot;<br>
&gt; +BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy<br>
&gt; +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
&gt; +BR2_TARGET_ROOTFS_EXT2=3Dy<br>
&gt; +BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
&gt; +BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;150M&quot;<br>
&gt; +BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS=3D&quot;-O 64bit&quot;<br>
&gt; +BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy<br>
&gt; +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=3Dy<br>
&gt; +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=3D&quot;<a href=3D"ht=
tps://git.trustedfirmware.org/TF-A/trusted-firmware-a.git" rel=3D"noreferre=
r" target=3D"_blank">https://git.trustedfirmware.org/TF-A/trusted-firmware-=
a.git</a>&quot;<br>
<br>
The _CUSTOM_REPO_URL given here is the same as the Buildroot<br>
default value. See:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc2/bo=
ot/arm-trusted-firmware/arm-trusted-firmware.mk?ref_type=3Dtags#L19" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/buildroot/-=
/blob/2025.02-rc2/boot/arm-trusted-firmware/arm-trusted-firmware.mk?ref_typ=
e=3Dtags#L19</a><br>
<br>
So _CUSTOM_GIT and _CUSTOM_REPO_URL can be removed.<br>
<br>
&gt; +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION=3D&quot;v2.9&quot=
;<br>
<br>
Since this platform seems to be supported upstream, can you<br>
update to the latest lts version? At this time, it is &quot;lts-v2.12.1&quo=
t;.<br>
See:<br>
<a href=3D"https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-fir=
mware-a.git/+/refs/tags/lts-v2.12.1" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/=
+/refs/tags/lts-v2.12.1</a><br>
<br>
So this should become:<br>
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=3Dy<br>
BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D&quot;lts-v2.12.1&qu=
ot;<br>
<br>
&gt; +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D&quot;px30&quot;<br>
&gt; +BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=3D&quot;&quot;<br>
&gt; +BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=3Dy<br>
&gt; +BR2_TARGET_UBOOT=3Dy<br>
&gt; +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
&gt; +BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
&gt; +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2024.01&quot;<br>
<br>
Same comment for u-boot. Since this board seems to be supported in<br>
upstream u-boot, it could be updated to v2025.01. See:<br>
<a href=3D"https://source.denx.de/u-boot/u-boot/-/blob/v2025.01/configs/px3=
0-core-ctouch2-of10-px30_defconfig" rel=3D"noreferrer" target=3D"_blank">ht=
tps://source.denx.de/u-boot/u-boot/-/blob/v2025.01/configs/px30-core-ctouch=
2-of10-px30_defconfig</a><br>
<br>
&gt; +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;px30-core-ctouch2-of10-px30&=
quot;<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=3Dy<br>
&gt; +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=3Dy<br>
&gt; +BR2_TARGET_UBOOT_USE_BINMAN=3Dy<br>
&gt; +BR2_TARGET_UBOOT_FORMAT_CUSTOM=3Dy<br>
&gt; +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME=3D&quot;u-boot.itb&quot;<br>
&gt; +BR2_TARGET_UBOOT_SPL=3Dy<br>
&gt; +BR2_TARGET_UBOOT_SPL_NAME=3D&quot;idbloader.img&quot;<br>
&gt; +BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
&gt; +BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
&gt; +BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
<br>
Can you send an updated version of this patch with those changes,<br>
please?<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--00000000000013ecc00630c30565--

--===============0682855430316528508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0682855430316528508==--
