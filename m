Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE978C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 10:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A1AB428DE;
	Fri, 27 May 2022 10:24:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44MnF6jHK3bp; Fri, 27 May 2022 10:24:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29C35428D7;
	Fri, 27 May 2022 10:24:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7CA1BF841
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2433F84926
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hP-wwYHG1ww for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 10:24:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C53E848ED
 for <buildroot@buildroot.org>; Fri, 27 May 2022 10:24:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id k30so5296394wrd.5
 for <buildroot@buildroot.org>; Fri, 27 May 2022 03:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A+uOJvEGF3MLzJjJJnSTP5WKEzaAM5PJgLQPbmHLAmY=;
 b=XRoYLAOET3gcmVwmjaNUV4mwcZeHiXm8tXcL+RmhdNX2Cs//97fYO1vwr8BsJBjKpG
 VwAeCY6Gl2WDT8lmt/bT2IIgkjBNmeYE8Des83uD6K9GyKQPPl5tEOeF+OlciRLo89Id
 IpbLysx21mGKXKuOWB9VUFhtERF2DyRy3VNSaRCRsFPFRiP3/V8Ee12yqMAD2DK3asPK
 Lgfcd3+a/u5SnMZXovkOSG8TI7oCFFyiF4LIOoznFYyyLlrgVwgLdvVGcsesanPYeBWV
 jC+tJcDWo6rjOo/iFToIVGA8TOw4dxjJ9ZiXm1wvgEmi9vk8wQs1GeF6tujkacXUzkjn
 DmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+uOJvEGF3MLzJjJJnSTP5WKEzaAM5PJgLQPbmHLAmY=;
 b=mifFN5IsRYJ5xCPKt1EDnGDQ5n44n3qZbqrmI3cWcWVCfNfx9RbjY6HpTvQRwcFZeV
 q3u1Mt48nmWUKWhMQFU8Fk+Fm4791CYCUsNhNAwcZTKi3GlsiaoqUb1XxvH++DcYttZL
 e3423fhr8njcECuRBye5Z+yoafWIrN5GsqNuU2U2PZfSj91k3YI7NbMnlbQNdCtekDd9
 hgVXgzfgJdvWM1NBAOcnegO50Rwn+X1j0qc+wPRxWjhyKWzafPkA8rNFsFCQbeK2d0NV
 /hfrAIDHSZlA3r6kNVukHkXrG1MWjHqAZSo3FAJ3FvUOmiASHO8lWeZ45hnvXnJrlC7H
 0CMw==
X-Gm-Message-State: AOAM531WsDZpE4FIDm3y+r5W8uc/KInlBWT/dxYqNwbDpEL3ufh2bIRK
 eQ/cmBFEXQNehZew/QEmFm2u6ZlU5H9b4h+c0kms/bNEksI=
X-Google-Smtp-Source: ABdhPJy8reeaYuIE9MsxEsbXR5A5gg84r1D81BORp2GNlomlAtPXThy62U2uOu7UO8F0xGpr8byOxdlSEYEMrX66h/0=
X-Received: by 2002:adf:ecc7:0:b0:210:824:52b1 with SMTP id
 s7-20020adfecc7000000b00210082452b1mr6609875wro.553.1653647061127; Fri, 27
 May 2022 03:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220524220006.906954-1-festevam@gmail.com>
In-Reply-To: <20220524220006.906954-1-festevam@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 27 May 2022 12:24:09 +0200
Message-ID: <CAEyMn7ZADNXiVpg2=AL4OrsJ7=ywmp0NmkX37uW72X5D8pFy0Q@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [Buildroot] [PATCH] configs/imx6-sabresd: bump U-Boot and kernel
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

Hi Fabio,

Am Mi., 25. Mai 2022 um 00:00 Uhr schrieb Fabio Estevam <festevam@gmail.com>:
>
> Bump U-Boot to 2022.04 and kernel to 5.15.41 version.

Just to let you know: U-Boot will need gnutls.h on host since 2022.04.
Thus some additional host dependencies are required. This will be
fixed in the patch series I provided [1]

[1] https://lists.buildroot.org/pipermail/buildroot/2022-May/643129.html

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6-sabresd_defconfig     | 4 ++--
>  configs/imx6-sabresd_qt5_defconfig | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
> index 19986f2cbb54..c237c2dc7c5a 100644
> --- a/configs/imx6-sabresd_defconfig
> +++ b/configs/imx6-sabresd_defconfig
> @@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="SPL"
> @@ -33,7 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.12"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.41"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
> diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
> index 38a86131dda3..d962ac6897b2 100644
> --- a/configs/imx6-sabresd_qt5_defconfig
> +++ b/configs/imx6-sabresd_qt5_defconfig
> @@ -30,7 +30,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="SPL"
> @@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.12"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.41"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
