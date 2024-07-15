Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD55C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 13:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2DC881080;
	Mon, 15 Jul 2024 13:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjhubM214K5f; Mon, 15 Jul 2024 13:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B332A80FA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B332A80FA0;
	Mon, 15 Jul 2024 13:51:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B68201BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A418F80FA0
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZErfXcYjDRQP for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 13:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E825280F79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E825280F79
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E825280F79
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 13:51:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC19B1BF210;
 Mon, 15 Jul 2024 13:51:45 +0000 (UTC)
Date: Mon, 15 Jul 2024 15:51:44 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240715155144.227dab3e@booty>
In-Reply-To: <bb557f20-2d9c-4b1b-9b33-4072d41fe129@mind.be>
References: <20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com>
 <bb557f20-2d9c-4b1b-9b33-4072d41fe129@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721051506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=okL3Ehku38nr1OMEffBJvEc5xRIMv/yogwhWO2Tpg0U=;
 b=XfC47ybCA7iIXKRsJuMHIUWhLDuqXYiqi/T4JVEtsw/Hjw5m6QuPz9Vk0p1Ww/4I2RiCbw
 CgSqh0hKlMyQGH9oJlLJepw29WUVpFI5JwNhzLs5xd1rQElsUB5VOP+ZVkXkC1Q1c5WodT
 IWcP+q0XoUvD4KZBNfk+Ko7irPhUbJideVCLIhUNJZImoGj32p44XLpVYMyO1Y1aNaYzhD
 I5IrEHvY14uKPwNyU3GIocYrr+ACgfnDaMBbrjZBaY0sgxp/d+6CxgB0Rl71XP1wUsPRkN
 QqADnddFeebbcU0qNueqk5yXgdrk4Ow2lkrWZKOitL9rezEFjpsMKPUj0U90yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XfC47ybC
Subject: Re: [Buildroot] [PATCH] uboot: allow taking the entire default
 environment from a text file
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
Cc: =?UTF-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Fri, 12 Jul 2024 11:23:12 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   Hi Luca,
> 
> On 17/06/2024 18:00, Luca Ceresoli via buildroot wrote:
> > By default U-Boot builds a default environment from its own configuration
> > and a board-specific set of variables. However it also allows to bypass
> > this entirely and define the entire default environment from a text file.
> > 
> > Expose this feature to Buildroot. This allows to have a file e.g. in
> > board/.../uboot.env which contains an easy to maintain text file with the
> > wanted default environment, without patching the U-Boot source code.  
> 
>   Earlier, Heiko sent a similar patch but using a different U-Boot config option 
> [1]. We're going to merge only one of them :-)

Wrong URL (below). i think you refer to this, dating almost a year ago
so congratulations for your memory:

  https://lore.kernel.org/all/20230804085118.315117-1-heiko.thiery@gmail.com/

Thanks for letting me know about this.


>   This one is a bit more elegant I think because it doesn't require discovering 
> the vendor directory.

Ok, good to know, so let me refine it and send a v2.

> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -136,6 +136,35 @@ config BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
> >   	  that will be merged to the main U-Boot configuration file.
> >   endif
> >   
> > +config BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE
> > +	bool "Generate default environment from text file"  
> 
>   I think that rather than two options, we want just one string option. If it's 
> empty, it is disabled.

OK.

> > +	select BR2_TARGET_UBOOT_NEEDS_XXD
> > +	help
> > +	  Define the entire U-Boot default environment from a file,
> > +	  disabling all the logic to generate it from the U-Boot source
> > +	  code and other configuration values.
> > +
> > +	  Based on the USE_DEFAULT_ENV_FILE and DEFAULT_ENV_FILE U-Boot
> > +	  configuration variables.
> > +
> > +	  Requires U-Boot >= v2018.05.
> > +
> > +config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
> > +	string "Text file with default environment"
> > +	depends on BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE
> > +	help
> > +	  Text file containing the variables to be used as the default
> > +	  environment in U-Boot.
> > +
> > +	  From the U-Boot documentation:
> > +
> > +	    The format is the same as accepted by the mkenvimage tool, with
> > +	    lines containing key=value pairs. Blank lines and lines
> > +	    beginning with '#' are ignored.
> > +
> > +	  For more info see:
> > +	  https://docs.u-boot.org/en/latest/usage/environment.html#external-environment-file  
> 
>   Excellent help text!

Thanks!

[that's because I'm lazy: finding the info was painful, I don't want to
do that again so let's write it down, upstream it and let the Internet
make it available to the future myself :) ]

> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -390,6 +390,14 @@ UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
> >   # override again. In addition, host-ccache is not ready at kconfig
> >   # time, so use HOSTCC_NOCCACHE.
> >   UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=""
> > +
> > +ifeq ($(BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE),y)
> > +UBOOT_DEFAULT_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE))
> > +define UBOOT_KCONFIG_DEFAULT_ENV_FILE
> > +	$(call KCONFIG_SET_OPT,CONFIG_USE_DEFAULT_ENV_FILE,y)
> > +	$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENV_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")  
> 
>   I think we mostly use `` rather than $(shell ...) - with the backticks, it's 
> much easier to understand when it's going to be evaluated.

I did some quick tests with the backticks and wasn't able to make it
work, but if you have a suggestion to make it work I'll be glad to try
that.

So I'm sending v2 still using $(shell ...) for the time being.

About which is the "common habit", I found very few cases with both, so
no obvious winner apparently. However in this same file
(boot/uboot/uboot.mk) there are two readlink usages already, both using
the $(shell ...) pattern. Disclaimer: both have been added by me :)

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
