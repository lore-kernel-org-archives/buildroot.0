Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCC2C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 17:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C7EE84483;
	Mon, 20 Jan 2025 17:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xI0v_KgMbHNM; Mon, 20 Jan 2025 17:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C19DF84450
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C19DF84450;
	Mon, 20 Jan 2025 17:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DDC1D7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 17:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B4C461010
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 17:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITu7PlYeDp1C for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 17:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E68360F3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E68360F3B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E68360F3B
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 17:33:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A19860004;
 Mon, 20 Jan 2025 17:33:23 +0000 (UTC)
Date: Mon, 20 Jan 2025 18:33:21 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250120183321.2dd343a9@booty>
In-Reply-To: <20250120113405.3938838-2-neal.frager@amd.com>
References: <20250120113405.3938838-1-neal.frager@amd.com>
 <20250120113405.3938838-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737394404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukLxv6Ydz+chpPG5jGvNBhAXf1fwzPijHCsrk4JSbsY=;
 b=pOCoQacOidCUAcHpUQvy8rnakIiOVkLllCDRy4Ggr1eQF43B4tgPi5cGtqU5+h4yI/8JiE
 B6bY7nttFmHuTQRv8Ai2s/xbjU5cisKwlXnnjXn93x9d7zPIw0ltiQZm01+iEHXjjIfKMn
 TOlcTY5BdmmI/y5DBaf0+u/xoXMJ8p4lFsbYiQWfNcwLlBrDoalUM8bNPCi7SSpsbsjm67
 wILfRalc0ZBhVicyK6MGrQKuzhvDjvQfKzQ+tGNPoskk21eORSDNGPwzLDbTcy4zwCVodZ
 9uxKa7irP8aM/bv+Cg992XNnDUrVrdxExP0nCVTPSE0HqZZD+18e/aLO/bGckw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pOCoQacO
Subject: Re: [Buildroot] [PATCH v2 2/4] boot/uboot.mk: new zynqmp pmufw
 embeddedsw option
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, romain.naour@smile.fr,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Jan 2025 11:34:03 +0000
Neal Frager <neal.frager@amd.com> wrote:

> The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option will enable u-boot to
> use the xilinx-embeddedsw package for building a pmufw.elf that gets included
> in the generated boot.bin.
> 
> If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option is enabled, then the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw from a
> custom location will be ignored.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - edited Config.in help text to fit within 70 characters
> ---
>  boot/uboot/Config.in | 27 +++++++++++++++++++++++++++
>  boot/uboot/uboot.mk  |  5 ++++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index b6ac2f9380..430191d213 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -572,6 +572,27 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +choice
> +	prompt "xilinx-prebuilt pmufw.elf or build pmufw.elf from source"

Not a very clear string IMO, it should not list the options in the
choice title. I'd rather change it to "PMUFW origin".

> +	default BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
> +	help
> +	  Choose between installing the pmufw.elf from
> +	  xilinx-prebuilt or building the pmufw.elf from
> +	  xilinx-embeddedsw.
> +
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
> +	bool "xilinx-embeddedsw build pmufw.elf from source"

And I'd change this to "Build from source via xilinx-embeddedsw"

> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW

Not sure what is best here:

 a) if xilinx-embeddedsw is enabled, show the option in the choice menu
 b) if the choice is selected in the menu, enable xilinx-embeddedsw

a) is what you implemented, b) is what I had in mind before reading
this patch and it would look more intuitive for users I think. The same
applies for the xilinx-prebuilt option.

Opinions from Buildroot maintainers would be welcome here.

> +	help
> +	  Use xilinx-embeddedsw boot package for building
> +	  zynqmp pmufw.elf from
> +	    https://github.com/Xilinx/embeddedsw repo.
> +
> +	  U-Boot build process will generate a boot.bin (to be loaded
> +	  by the ZynqMP boot ROM) containing both the U-Boot SPL and
> +	  the PMU firmware in the Xilinx-specific boot format.
> +
>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  	bool "xilinx-prebuilt pmufw.elf"

And this to "Prebuilt via xilinx-prebuilt"

>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> @@ -585,9 +606,15 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
>  	  PMU firmware in the Xilinx-specific boot format.
>  
> +endchoice
> +
> +comment "If xilinx-embeddedsw or xilinx-prebuilt is selected for pmufw.elf, custom PMU firmware location will be ignored."
> +	depends on BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW || BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT

This is not needed. If any of those two is selected,
BR2_TARGET_UBOOT_ZYNQMP_PMUFW will not be visible. The commit message
needs to be updated accordingly. See below however.

>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
>  	string "Custom PMU firmware location"
>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW
>  	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT

I think BR2_TARGET_UBOOT_ZYNQMP_PMUFW should become a third option in
the choice you are adding above. In other words we should ask users
"How do you want to get the pmufw? Build from source, download from
xilinx-prebuilt or pre-built at a custom location you provide?".

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
