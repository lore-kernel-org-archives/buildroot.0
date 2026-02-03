Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A213E83065
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 09:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE61282085;
	Tue,  3 Feb 2026 09:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsbcpABgmK5V; Tue,  3 Feb 2026 09:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB7C7820E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770109834;
	bh=qW6+WT5jZkTsOofADGZBWY4AByzqwIbGD+xugNKzJJw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l2qHfVMktA890mX+WJliQKNGOqFBrlzzaGnqS6qh3soqPhW1U2SZEonzpjk7GPzW/
	 3MZGwMot6KpnTpbYXTw39cnRNX0J2TxMGUW0NUZCL8grfNL0ldiZKmpM9NBRuF6nTm
	 JiYjU0G+tBsbwm1DkN4pZuYceu5xtiadDq1++f9OGHIe6szcjOThVxZKFE3H3skQOh
	 7VBg5PaTh8DIk7KpRQbTKk2Cc1MSA/f4zgFB+N2ajGysf/eRg3aguiRqSPK0e5AGiX
	 gPQKTQio3+nAU6oFdapG30zueU/uIBu5EmzmDuvGlKvlI2EdT5MAdHkIpL5unEvZBn
	 oj6eUoj26pFDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB7C7820E1;
	Tue,  3 Feb 2026 09:10:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76B951A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59A1C40BC6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Khophgo8EaZ8 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 09:10:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5830E40B00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5830E40B00
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5830E40B00
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:10:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7735AC211D6;
 Tue,  3 Feb 2026 09:10:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 545EE60745;
 Tue,  3 Feb 2026 09:10:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7BB3B119A8891; Tue,  3 Feb 2026 10:10:25 +0100 (CET)
Date: Tue, 3 Feb 2026 10:10:24 +0100
To: Jakob Kastelic <kastelic.jakob@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Dick Olsson <hi@senzilla.io>
Message-ID: <aYG5Tc4aQ4QHgWN-@windsurf>
References: <20241219214555.3435133-1-jkastelic@thinksrs.com>
 <20250917024541.1480367-2-kastelic.jakob@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917024541.1480367-2-kastelic.jakob@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770109826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=UcR0xvlLBOvx6/FC9lfecGChQSA0LqqseHQra4RSwnU=;
 b=ETf0acdqdzvoWJS4p5BlQrSua6cq8/wcL0DMDl+xEjtpcE9lNxl5Gp/L369FZUvzdr+CaF
 r+wC4YBFeM92Xlfa0JyG4RE5QArJIY1hnaqdrB3rIzmdQOc2OFALLtgza/VpEmv9Zykxke
 oJkRhUz5mWq6SUXWsaEbAYCKPJ/b8pVM8AtZIUjCTPUoKVgfW4QAIMhFx9cEAp5HabGdVy
 5xGroi6i+6gN1RbD4QA6POgEa6WDrtANL2zkIFi665p1a7kebgm92/pvrNDYeYVhAcG0CG
 pdGJ01OXuEqoEGFlfxFiCSBHA6qEKEJE6te1QkFalIs+NRsH5IUZ4Y0lOFh3Fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ETf0acdq
Subject: Re: [Buildroot] [PATCH v2 1/2] boot/arm-trusted-firmware: optional
 Linux as BL33
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jakob,

Thanks for your patch, and sorry for the delay in getting back to you!

On Tue, Sep 16, 2025 at 07:45:40PM -0700, Jakob Kastelic wrote:
> Arm Trusted Firmware (TF-A) can be used to load U-Boot or another
> bootloader, which in turn loads the Linux kernel. However, TF-A is
> capable of loading the kernel directly. To this end, we need to define
> the BL33 and BL33_CFG compile options containing, respectively, the
> zImage and the DTB.
> 
> This config introduces a new config option,
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33, which sets the BL33 and
> BL33_CFG parameters, and ensures that the kernel is built before the
> TF-A by having linux as a _DEPENDENCY of the TF-A.
>

Your Signed-off-by should have been here. Indeed, anything after "---"
gets stripped when applying your patch.

> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33
> +	bool "Linux kernel"
> +	depends on BR2_LINUX_KERNEL
> +	depends on (BR2_arm || BR2_armeb)
> +	depends on (BR2_LINUX_KERNEL_ZIMAGE || BR2_LINUX_KERNEL_APPENDED_ZIMAGE)
> +	help
> +	  This option allows to embed the Linux kernel as the BL33 part
> +	  of the ARM Trusted Firmware.
> +
> +	  Do not choose this option if you intend to use U-Boot or
> +	  another second-stage bootloader. With this option, TF-A starts
> +	  Linux directly.
> +
> +	  With this option chosen, whenever the Linux zImage changes,
> +	  TF-A may need need to be re-built to create the latest FIP
> +	  file. Since Buildroot does not track package dependencies,
> +	  this has to be done manually by invoking `make
> +	  arm-trusted-firmware-rebuild`. The final boot medium image may
> +	  need to be re-generated as well to include the latest FIP file
> +	  version.

I dropped this last paragraph, because this isn't specific to this
situation, it's also valid for any other BL33 payload.

> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/zImage
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM),stm32mp1)

I've used

+ifeq ($(ARM_TRUSTED_FIRMWARE_PLATFORM),stm32mp1)

instead, where ARM_TRUSTED_FIRMWARE_PLATFORM is already
quote-stripped, while $(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM)
isn't.

> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33_CFG=$(BINARIES_DIR)/$(LINUX_DTBS)

This is a bit "risky" as LINUX_DTBS can potentially contain multiple
entries. One option would be to add a check here that LINUX_DTBS only
contain one entry, like (untested)

ifneq ($(words $(LINUX_DTBS)),1)
$(error "Using BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33 only works when a single Linux DTB is used")
endif

If you think that's useful, you can send a follow-up patch adding
this. But I have applied your patch, with the other fixes mentioned in
this e-mail.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
