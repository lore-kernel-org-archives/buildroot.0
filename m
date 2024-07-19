Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11285C3DA70
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 07:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2D484022B;
	Fri, 19 Jul 2024 07:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13OnD1QRnOfQ; Fri, 19 Jul 2024 07:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BB0240F53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BB0240F53;
	Fri, 19 Jul 2024 07:51:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19BEE1BF575
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07E49607D2
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTx5u6q698K2 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 07:51:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F150607C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F150607C0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F150607C0
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 07:51:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74981FF808;
 Fri, 19 Jul 2024 07:51:16 +0000 (UTC)
Date: Fri, 19 Jul 2024 09:51:15 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240719095115.226b1d51@booty>
In-Reply-To: <b165fb5e-38f5-4751-9873-765ab3239549@mind.be>
References: <20240718-boot-uboot-env-select-v1-1-e6c778e814d8@collins.com>
 <20240718191355.34e1a05e@booty>
 <b165fb5e-38f5-4751-9873-765ab3239549@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721375476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8oEKKkoDuis+w6ZmDskw0rKPkabAIqcQufmbOqTThH4=;
 b=j7dWMDAiAoL4vGLZi2ILWR/bLPHFTDYaYCCeHDcVmtq+JAOm2Of6TwvCYDT0sQ1ArZcbip
 7ijFFYLPYnMuCMAjKkXeCPeuO4CMHVJAm/e+HPFuFIaZzNghtSR0my33TKcp1fObOESIJB
 ao+wVF4oHjtV9Uqs1vFwagTnEqR+S4mzafI7TZUoR4P3n0fIUEFyGGcjxkv4OzI1hOKpk2
 Oul+a29C0mxObCj/qawjMWlJXQ7IUBclNQBEyq/Me3oxOj9GOAnSwRZDZt0WAXOjK9M7pY
 FBlBxU27J6QM9i432DceStY1VuwAeIL/gQsQY+I+nBVM6xoDu+GMGb1LCDstxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j7dWMDAi
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix Kconfig warning for
 DEFAULT_ENV_FILE
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, Thomas, Brandon,

On Thu, 18 Jul 2024 22:32:21 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 18/07/2024 19:13, Luca Ceresoli wrote:
> > Hello Brandon, Arnout,
> > 
> > On Thu, 18 Jul 2024 15:45:45 +0000
> > Brandon Maier <brandon.maier@collins.com> wrote:
> >   
> >> The following warning occurs from commit "boot/uboot: allow taking the
> >> entire default environment from a text file".
> >>
> >>    boot/uboot/Config.in:141:warning: config symbol
> >>    'BR2_TARGET_UBOOT_DEFAULT_ENV_FILE' uses select, but is not bool or
> >>    tristate  
> 
>   Oh right, Kconfig is too stupid for that. You need a helper config but it can 
> be blind. Like:
> 
> config BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE
> 	bool
> 	default y
> 	depends on BR2_TARGET_UBOOT_DEFAULT_ENV_FILE != ""
> 	select BR2_TARGET_UBOOT_NEEDS_XXD

Ah, right! And it's similar to what Thomas proposed. Thanks both.

> > Hum, apologies, didn't notice this, at least when working on v2 (see
> > below).
> >   
> >> Add a 'bool' config so we can enable dependencies.  
> > 
> > That's basically what I did in v1 [0], possibly for this same reason,
> > but I'm afraid I don't remember exactly.
> > 
> > Then in his review Arnout suggested to have only a string option, and I
> > did not recall any good reason to not do so, and so v2 came without the
> > bool.
> >   
> >> In addition, the DEFAULT_ENV_FILE works by setting Kconfig options,
> >> therefore we also need to depend on
> >> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG.  
> 
>   Oh yes, but that's a simple depends on in the 
> BR2_TARGET_UBOOT_DEFAULT_ENV_FILE option.

Indeed it has to be added.

> > Arnout, do you think the issues reported by Brandon can be fixed while
> > keeping a single string option?  
> 
>   Yes I think so. But it needs to be tested so I'd prefer is _someone_ <grin> 
> would do that.

Sure, _someone_ will. :) And that will be me, perhaps next week however,
unless Brandon wants to send a patch before I do.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
