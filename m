Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB53C4725D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 11:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A880403C5;
	Mon, 22 Jan 2024 11:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A880403C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccUcEIG0ydNI; Mon, 22 Jan 2024 11:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490D041693;
	Mon, 22 Jan 2024 11:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 490D041693
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADADC1BF3F2
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 11:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E69824DC
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 11:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82E69824DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRq8rJvVu2Ua for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 11:05:33 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 775B082416
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 11:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 775B082416
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6d9b37f4804so2349745b3a.1
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 03:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705921533; x=1706526333;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dd6jnTLzx/ZQGcd8z8vkkM9NW0LcMlTaEA/sYsPh4Sw=;
 b=ON8etbzDwzijh5gDsgbtdMTutgLBPGxaaSQtHvDANk7pNXEK9Fvti9vuKeSHsw8qe3
 duUkLPF+dnSxfqLPvE5B7426mAhniuqxZaoIbgmBI1G1fqeFtn9zwbaoWrMGqS3U21dP
 19t+VECDzoJKBMjSLFNPkr04DecQDdcoYBjIuWR/5r5ab2icMrph92rlkCi6JGGQy8FG
 YOXUk+2FXRmY8jaH2sq+Aw2+usUnqvKO7CDynl2rEXP6X/qWZmf1VpGJBZDiDOfKmjtw
 CmTO9Z7PZErgeBhkGfgoeW9VZe7AwRcHgGYiz7Y3inGdzxfiw4F5fUKDeWgOIC3y6kG7
 6dmQ==
X-Gm-Message-State: AOJu0YyBf/95Ff4ZgLy9bznB3DNS1dif0XLiI5s/GZXv0o48sKTRd6le
 M4/60Pz4yYDkbNO747uYggzgwURxAf8WgMafxLDXyWyq+ReiETy1
X-Google-Smtp-Source: AGHT+IH2RlmLpKA8mTUCr80mu+cbnbSyd1SPf/bAZlngbcBNggLZAjvJmffwLnLlbj6xgQEuIhI5Xg==
X-Received: by 2002:a05:6a20:9152:b0:19b:6424:cd7d with SMTP id
 x18-20020a056a20915200b0019b6424cd7dmr3843679pzc.27.1705921532723; 
 Mon, 22 Jan 2024 03:05:32 -0800 (PST)
Received: from p1g2 ([2001:861:3201:3d10:c328:92c5:7d77:c274])
 by smtp.gmail.com with ESMTPSA id
 d21-20020aa78695000000b006dbd3d7e242sm3155819pfo.126.2024.01.22.03.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 03:05:32 -0800 (PST)
Date: Mon, 22 Jan 2024 12:05:28 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <Za5L-Hg0l5wCdejw@p1g2>
References: <20240109172600.12811-1-sebastien.szymanski@armadeus.com>
 <20240109172600.12811-3-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109172600.12811-3-sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705921533; x=1706526333; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Dd6jnTLzx/ZQGcd8z8vkkM9NW0LcMlTaEA/sYsPh4Sw=;
 b=bbGj52ocp8239TlCrVkN9y9sV4EZajDTggzBNhGtMFOO96Ij2MqKLa1UuNfApjbVz4
 +V8QEfQrtfPJFJoy9LRpQjS9bYmg38O36m3/9nLl/Wd+Ue/vRrSCpiCcmTnJSn+hZcuH
 ZVPwJrGTPMU1R/iJgbBEkzEeg6b+sfrWZOrVMeDtL4ezKs01k5I9heL9VNw3DQQOM0Q8
 z8JDje53jAiq/C9wuhIVhDhbTcBAfgYN0K9Ou5K7hcIJGZI1tjP35s2Qgq90ezF/Jana
 hLyW+3/iStYazutTwEWbw9/YBjDuHzFLtGiGULsyB334tfm7WaCp4LT9/XG4COQ+uxfu
 Buig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bbGj52oc
Subject: Re: [Buildroot] [PATCH v3 2/3]
 package/freescale-imx/firmware-ele-imx: new package
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Tue, Jan 09, 2024 at 06:25:59PM +0100, S=E9bastien Szymanski wrote:
> This package provides firmware blobs for the Edgelock Secure
> Enclave (ELE) [1] present on i.MX8ULP and i.MX9 Socs.
> This version comes from the 6.1.55-2.2.0 release.
> =

> [1] https://www.nxp.com/products/nxp-product-information/nxp-product-prog=
rams/edgelock-secure-enclave:EDGELOCK-SECURE-ENCLAVE
> =

> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
> =

> Changes for v3:
>  - rename package from firmware-sentinel to package firmware-ele-imx
> =

> Changes for v2:
>  - none
> =

>  package/freescale-imx/Config.in               | 30 +++++++++++++++++++
>  .../freescale-imx/firmware-ele-imx/Config.in  | 21 +++++++++++++
>  .../firmware-ele-imx/firmware-ele-imx.hash    |  4 +++
>  .../firmware-ele-imx/firmware-ele-imx.mk      | 27 +++++++++++++++++
>  4 files changed, 82 insertions(+)
>  create mode 100644 package/freescale-imx/firmware-ele-imx/Config.in
>  create mode 100644 package/freescale-imx/firmware-ele-imx/firmware-ele-i=
mx.hash
>  create mode 100644 package/freescale-imx/firmware-ele-imx/firmware-ele-i=
mx.mk
> =

> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Conf=
ig.in
> index 0229eaf0271f..da60d0879840 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -69,6 +69,35 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
>  =

>  endchoice
>  =

> +choice
> +	prompt "i.MX platform asic version"

Please rename "i.MX Silicon Revision" in order to match the Datasheet
naming (see 1.1 Ordering Information section).

> +	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A1 \
> +		if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
> +	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1 \
> +		if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
> +	help
> +	  Some packages related to the selected i.MX platform need
> +	  to know the asic version of the platform they will run on.
> +	  If you don't know, leave the default value.
> +
> +	  Note - mismatches may result in a failure to boot!
> +
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A1
> +	bool "imx91a1"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
> +
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A0
> +	bool "imx93a0"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
> +
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
> +	bool "imx93a1"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
> +
> +endchoice
> +

Actually, can you add that part above with the previous patch?
I believe this should be part of the overall CPU addition support.

>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>  	string
>  	default "IMX25_3STACK" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STA=
CK
> @@ -125,6 +154,7 @@ source "package/freescale-imx/imx-uuc/Config.in"
>  source "package/freescale-imx/imx-vpu/Config.in"
>  source "package/freescale-imx/imx-vpu-hantro/Config.in"
>  source "package/freescale-imx/imx-vpuwrap/Config.in"
> +source "package/freescale-imx/firmware-ele-imx/Config.in"
>  source "package/freescale-imx/firmware-imx/Config.in"
>  source "package/freescale-imx/imx-sc-firmware/Config.in"
>  source "package/freescale-imx/imx-seco/Config.in"
> diff --git a/package/freescale-imx/firmware-ele-imx/Config.in b/package/f=
reescale-imx/firmware-ele-imx/Config.in
> new file mode 100644
> index 000000000000..7867c3712c9c
> --- /dev/null
> +++ b/package/freescale-imx/firmware-ele-imx/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_FIRMWARE_ELE_IMX
> +	bool "firmware-ele-imx"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
> +	help
> +	  Firmware blobs for the Edgelock Secure Enclave (ELE)
> +	  present on i.MX8ULP and i.MX9 SoCs.
> +
> +	  This library is provided by NXP as-is and doesn't have an
> +	  upstream.
> +
> +if BR2_PACKAGE_FIRMWARE_ELE_IMX
> +
> +config BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE
> +	string
> +	default "mx93a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFO=
RM_IMX93A0
> +	default "mx93a1-ahab-container.img" if \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A1 || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
> +
> +endif # BR2_PACKAGE_FIRMWARE_ELE_IMX
> diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash=
 b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
> new file mode 100644
> index 000000000000..58565cef43e9
> --- /dev/null
> +++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  4a0440168d8dfb95989a17be8fafb149589e110e7d4518e5e8a33463dfb5e5ca=
  firmware-ele-imx-0.1.0.bin
> +sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84=
  COPYING
> +sha256  c800aaca3a7e9f470d99d7cde0a48c95982ed601d4c306f7b8f43f3710054f28=
  SCR.txt
> diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b=
/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
> new file mode 100644
> index 000000000000..600b50c5b456
> --- /dev/null
> +++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
> @@ -0,0 +1,27 @@
> +########################################################################=
########
> +#
> +# firmware-ele-imx
> +#
> +########################################################################=
########
> +
> +FIRMWARE_ELE_IMX_VERSION =3D 0.1.0
> +FIRMWARE_ELE_IMX_SITE =3D $(FREESCALE_IMX_SITE)
> +FIRMWARE_ELE_IMX_SOURCE =3D firmware-ele-imx-$(FIRMWARE_ELE_IMX_VERSION)=
.bin
> +
> +FIRMWARE_ELE_IMX_LICENSE =3D NXP Semiconductor Software License Agreement
> +FIRMWARE_ELE_IMX_LICENSE_FILES =3D COPYING SCR.txt
> +FIRMWARE_ELE_IMX_REDISTRIBUTE =3D NO
> +
> +FIRMWARE_ELE_IMX_INSTALL_IMAGES =3D YES
> +
> +define FIRMWARE_ELE_IMX_EXTRACT_CMDS
> +	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_ELE_IMX_DL_DIR)/$(FIRMWARE_ELE_IMX=
_SOURCE))
> +endef
> +
> +FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE =3D $(call qstrip,$(BR2_PACKAGE_FI=
RMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE))
> +
> +define FIRMWARE_ELE_IMX_INSTALL_IMAGES_CMDS
> +	cp $(@D)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/ahab-=
container.img
> +endef
> +
> +$(eval $(generic-package))

The rest looks ok to me.

Thanks,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
