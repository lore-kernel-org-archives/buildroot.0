Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01884C2BBCA
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 09:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B68141B7E;
	Fri, 28 Jun 2024 09:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id du6-Y4v_EXWO; Fri, 28 Jun 2024 09:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2819441BBC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2819441BBC;
	Fri, 28 Jun 2024 09:32:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4FD61BF3B5
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 09:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EAE584510
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 09:32:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lgghycu_eZhB for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 09:32:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7D7A8450F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7D7A8450F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7D7A8450F
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 09:32:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 612FD60013;
 Fri, 28 Jun 2024 09:32:41 +0000 (UTC)
Date: Fri, 28 Jun 2024 11:32:40 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240628113240.4aaa2436@booty>
In-Reply-To: <20240618074922.3555070-3-neal.frager@amd.com>
References: <20240618074922.3555070-1-neal.frager@amd.com>
 <20240618074922.3555070-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719567162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1rzpZsEqwhnuha4RPmSch2Dh8PNqW+kBd4n0rmJJaM=;
 b=iI86e+TMfCI67d+vBcQrK69XDgjhXJD4buFgO16qaunI4zsTdGgw4yvUxLScjVHPJAWwAS
 Khtu27MjWf2xMiDXHZWRbQiqJWGmyRI0ZnqLhu5bNL1S/jErOtOA4o/b1hOZOGlrfCz66a
 KdEFDC8pSVykQo67boyxNRsKISzcN4+VnJvZI3fJYbmnvplwIf3u9L3a+2wl7uyggpv38D
 QUROzY+kUwmjWphsQQkzCtDVWzlXNfSgh98+rfv8luIYQV+CzNfNGPCvMz33++C/uwpkfP
 7ryeIRz4liPwKWkyEDALGJGaVpRKtxMSarimcj6Ngzeahl5viwv2aydIaAv34Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iI86e+TM
Subject: Re: [Buildroot] [PATCH v3 3/4] boot/uboot.mk: new zynqmp pmufw
 source option
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Jun 2024 08:49:21 +0100
Neal Frager <neal.frager@amd.com> wrote:

> The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option will enable u-boot to
> use the xilinx-source package for building a pmufw.elf that gets included
> in the generated boot.bin.
> 
> If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option is enabled, then the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
> be ignored.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V3:
> - no changes
> ---
>  boot/uboot/Config.in | 20 +++++++++++++++++++-
>  boot/uboot/uboot.mk  |  3 +++
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index f37040a28a..3aef222772 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -512,9 +512,12 @@ config BR2_TARGET_UBOOT_ZYNQMP
>  
>  if BR2_TARGET_UBOOT_ZYNQMP
>  
> +choice
> +	bool "pmufw.elf prebuilt or source"

I find this string not very clear. It should rather look more like
"PMUFW origin", or "Origin of pmufw.elf".

But what is more confusing is the available choice options. With some
combinations of BR2_TARGET_XILINX_PREBUILT, BR2_TARGET_XILINX_SOURCE
and the family variant, we get no selectable options for this choice,
which is very awkward.

If the choice has no selectable options, then it should just disappear.
In its place you might instead put something like:

  comment "both xilinx-source and xilinx-prebuilt disabled, you need to
    pass a valid pmufw"

just before BR2_TARGET_UBOOT_ZYNQMP_PMUFW.

> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +
>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  	bool "xilinx-prebuilt pmufw.elf"
> -	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
>  	depends on BR2_TARGET_XILINX_PREBUILT_ZYNQMP || BR2_TARGET_XILINX_PREBUILT_KRIA
>  	help
>  	  Use xilinx-prebuilt boot package for downloading prebuilt
> @@ -525,10 +528,25 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
>  	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
>  	  PMU firmware in the Xilinx-specific boot format.
>  
> +config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
> +	bool "xilinx-source pmufw.elf"
> +	depends on BR2_TARGET_XILINX_SOURCE_ZYNQMP || BR2_TARGET_XILINX_SOURCE_KRIA
> +	help
> +	  Use xilinx-source boot package for building
> +	  zynqmp pmufw.elf from
> +	    https://github.com/Xilinx/embeddedsw repo.
> +
> +	  U-Boot build process will generate a boot.bin (to be loaded by
> +	  by the ZynqMP boot ROM) containing both the U-Boot SPL and the
> +	  PMU firmware in the Xilinx-specific boot format.	  
> +
> +endchoice
> +
>  config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
>  	string "Custom PMU firmware location"
>  	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
>  	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> +	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE

Very strange: with this patch, when both
BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT and
BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE are =y,
BR2_TARGET_UBOOT_ZYNQMP_PMUFW becomes visible. This looks like a
kconfig/menuconfig bug and certainly not a bug in your patch, but maybe
you can have a deeper look?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
