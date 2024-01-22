Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9ACC47DAF
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 11:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 368124160B;
	Mon, 22 Jan 2024 11:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 368124160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6loAsCmxYo06; Mon, 22 Jan 2024 11:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D684167E;
	Mon, 22 Jan 2024 11:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51D684167E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E9E91BF369
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 11:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1586F4167E
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 11:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1586F4167E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWbPlGA5DsZM for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 11:01:37 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B0CF4160B
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 11:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B0CF4160B
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d71e24845aso14043125ad.0
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 03:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705921296; x=1706526096;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WHEp44qv+LrtWQPIUS7vSOm3MVdDXXNmDJVO+fx68d0=;
 b=etiuplpjryN9zT+Ph2+pZPEatHI3BQNnJF43WDg9rdANSTaL7AVCOafl/rhOHc84ZC
 hz+dQ6652mKtsu8SP08hQtbAj2WP/UN/j/X8e978a6twnGvPRWbwknCgAfEaAl4GWxeU
 bK0MOPsN3D6zsA6wRcOqLwN0fb4XcEFqXE2AtJHaBTNwi4DJ7fYoWcbyWXMqAXhy+gCQ
 s2qQhY5p1x1tZy1aQXOl+8iE0qh67kue1tXPrPZR+RcQjCg9/KOBy9Wey71F5OyRvP0h
 FYYhVjS476/rjxneEK9NUoVjBzStvhRVoceb7RFYM3d7unbyoJj/rAj7eh4cm6h4xpAT
 T3aQ==
X-Gm-Message-State: AOJu0YzBKLEf1o7nIzCvODySTo5ovUXvmAI4JcdaEpfHfpEbghd8eUci
 xkvq+e8k11W6X1g5ZDynRpZqTvT/ipHgejNzbGWo4anyE4/02tO/
X-Google-Smtp-Source: AGHT+IF9gmyIJeBOIfXOH42ja5AwzS9c+b7tnhrPGc763+c1W4tcx3r0lBBvz8tHB0i7TGsd4HUUTA==
X-Received: by 2002:a17:903:2587:b0:1d0:8383:741d with SMTP id
 jb7-20020a170903258700b001d08383741dmr1422545plb.30.1705921295685; 
 Mon, 22 Jan 2024 03:01:35 -0800 (PST)
Received: from p1g2 ([2001:861:3201:3d10:c328:92c5:7d77:c274])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902e29100b001d73228cd99sm3414745plc.99.2024.01.22.03.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 03:01:34 -0800 (PST)
Date: Mon, 22 Jan 2024 12:01:31 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <Za5LC0fMBoDVzuiS@p1g2>
References: <20240109172600.12811-1-sebastien.szymanski@armadeus.com>
 <20240109172600.12811-2-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109172600.12811-2-sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705921296; x=1706526096; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WHEp44qv+LrtWQPIUS7vSOm3MVdDXXNmDJVO+fx68d0=;
 b=jv76UT1062S90nScNssZfpgqxmErQ+goE/l2IiMM758n1YjMSmdK/WsDHEEmPNaHVb
 bLTRQVh4RLfj7grdAXzEPDLEqkGTfUF9lX01ZtxdqmZwIUsD40XDl5alxawrDxX6aid2
 EoOVGPklbDNUnGmniuMd6EF6j+0Nbgskxemvs4W7V2Rt5ntjrTe3n8oCdw1fgiiUjZOc
 4ZCnZPceS0IArnsDuo5bdjgDLgDTFsFeHGyK2bHRF0obunT7ZPPIfZwYbf5NWrsWw3fa
 40K9l06OR3jvfWhlZrOZ5W7009TA+oe/vDpY0TgxvoR6BWn7HlmtV4f9oq13cb892HQq
 FNeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jv76UT10
Subject: Re: [Buildroot] [PATCH v3 1/3] package/freescale-imx: add i.MX91
 and i.MX93 SoC support
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

Hi S=E9bastien,

On Tue, Jan 09, 2024 at 06:25:58PM +0100, S=E9bastien Szymanski wrote:
> This commit adds i.MX91 and i.MX93 support to Buildroot.
> https://www.nxp.com/products/processors-and-microcontrollers/arm-processo=
rs/i-mx-applications-processors/i-mx-9-processors:IMX9-PROCESSORS
> =

> There is no i.MX95 software provided by NXP at the moment that's why
> i.MX95 is left behind.
> =

> Adapt package firmware-imx for the LPPDR4 firwmares binaries.
> =

> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
> =

> Changes for v3:
>  - none
> =

> Changes for v2:
>  - none
> =

>  package/freescale-imx/Config.in               |  8 +++++++
>  package/freescale-imx/firmware-imx/Config.in  |  9 ++++++++
>  .../firmware-imx/firmware-imx.mk              | 23 +++++++++++++++++++
>  3 files changed, 40 insertions(+)
> =

> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Conf=
ig.in
> index 1c26b3cc6f4c..0229eaf0271f 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -61,6 +61,12 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
>  	bool "imx8dxl"
>  =

> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
> +	bool "imx91"
> +
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
> +	bool "imx93"
> +
>  endchoice
>  =

>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
> @@ -80,6 +86,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>  	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
>  	default "IMX8MN" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
>  	default "IMX8MP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
> +	default "IMX91" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
> +	default "IMX93" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
>  =

>  config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>  	bool
> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/frees=
cale-imx/firmware-imx/Config.in
> index 087ddef8771b..7be6761253c9 100644
> --- a/package/freescale-imx/firmware-imx/Config.in
> +++ b/package/freescale-imx/firmware-imx/Config.in
> @@ -55,6 +55,8 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
>  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
>  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
>  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
>  =

>  if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
>  =

> @@ -73,11 +75,15 @@ config BR2_PACKAGE_FIRMWARE_IMX_LPDDR4
>  =

>  config BR2_PACKAGE_FIRMWARE_IMX_DDR4
>  	bool "DDR4"
> +	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
> +	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
>  	help
>  	  Use DDR4 binaries (i.e.: ddr4_*_201810.bin).
>  =

>  config BR2_PACKAGE_FIRMWARE_IMX_DDR3
>  	bool "DDR3"
> +	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
> +	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
>  	help
>  	  Use DDR3 binaries (i.e.: ddr3_*_201810.bin).
>  =

> @@ -89,6 +95,9 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION
>  	# unconditionally use HW version 201810 when DDR3/DDR4 was
>  	# selected
>  	default "201810" if BR2_PACKAGE_FIRMWARE_IMX_DDR3 || BR2_PACKAGE_FIRMWA=
RE_IMX_DDR4
> +	default "202201" if \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93

Why not having the DDR version set as "v202201" here?

>  	help
>  	  Use a specific version of the imx ddr binaries. Leaving this
>  	  field empty will select the default version.
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package=
/freescale-imx/firmware-imx/firmware-imx.mk
> index 66ef8c3930be..a08e8c4fb097 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -43,11 +43,33 @@ endef
>  FIRMWARE_IMX_DDR_VERSION =3D $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_DD=
R_VERSION))
>  ifneq ($(FIRMWARE_IMX_DDR_VERSION),)
>  FIRMWARE_IMX_DDR_VERSION_SUFFIX =3D _$(FIRMWARE_IMX_DDR_VERSION)
> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91)$(BR2_PACKAGE_FREESCALE=
_IMX_PLATFORM_IMX93),y)
> +FIRMWARE_IMX_DDR_VERSION_SUFFIX =3D _v$(FIRMWARE_IMX_DDR_VERSION)
> +endif

That would allow to get rid of the above and keep the suffix variable
somewhat generic across the CPUs?
No strong feelings here, just a suggestion to make the patch even
smaller.

>  endif
>  =

>  ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),y)
>  FIRMWARE_IMX_DDRFW_DIR =3D $(@D)/firmware/ddr/synopsys
>  =

> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91)$(BR2_PACKAGE_FREESCALE=
_IMX_PLATFORM_IMX93),y)
> +define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
> +	# Create padded versions of lpddr4_pmu_* and generate lpddr4_pmu_train_=
fw.bin.
> +	# lpddr4_pmu_train_fw.bin is needed when generating imx9-boot-sd.bin
> +	# which is done in post-image script.
> +	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
> +		lpddr4_imem_1d$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
> +		lpddr4_dmem_1d$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
> +		lpddr4_pmu_train_1d_fw)
> +	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
> +		lpddr4_imem_2d$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
> +		lpddr4_dmem_2d$(FIRMWARE_IMX_DDR_VERSION_SUFFIX),
> +		lpddr4_pmu_train_2d_fw)
> +	cat $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_1d_fw.bin \
> +		$(FIRMWARE_IMX_DDRFW_DIR)/lpddr4_pmu_train_2d_fw.bin > \
> +		$(BINARIES_DIR)/lpddr4_pmu_train_fw.bin
> +	ln -sf $(BINARIES_DIR)/lpddr4_pmu_train_fw.bin $(BINARIES_DIR)/ddr_fw.b=
in
> +endef
> +else
>  define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
>  	# Create padded versions of lpddr4_pmu_* and generate lpddr4_pmu_train_=
fw.bin.
>  	# lpddr4_pmu_train_fw.bin is needed when generating imx8-boot-sd.bin
> @@ -71,6 +93,7 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
>  	cp $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4*.bin $(BINARIES_DIR)/
>  endef
>  endif
> +endif
>  =

>  ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR4),y)
>  FIRMWARE_IMX_DDRFW_DIR =3D $(@D)/firmware/ddr/synopsys

Otherwise the rest looks good.

Regards,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
