Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1B2C25B75
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 10:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06FE041181;
	Thu, 23 May 2024 10:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efWhIlLpenZW; Thu, 23 May 2024 10:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E55840430
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E55840430;
	Thu, 23 May 2024 10:33:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 480FF1C5C21
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 10:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34DE140430
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 10:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfoUWeUU0Ctj for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 10:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0241E400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0241E400B9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0241E400B9
 for <buildroot@buildroot.org>; Thu, 23 May 2024 10:33:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4B3820007;
 Thu, 23 May 2024 10:33:44 +0000 (UTC)
Date: Thu, 23 May 2024 12:33:43 +0200
To: <Jamie.Gibbons@microchip.com>
Message-ID: <20240523123343.28a90afa@windsurf>
In-Reply-To: <c6b4014930339dbdddcad705965e58e61576bdc7.camel@microchip.com>
References: <20240507143409.230685-1-jamie.gibbons@microchip.com>
 <20240509220334.1641f661@windsurf>
 <c6b4014930339dbdddcad705965e58e61576bdc7.camel@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1716460425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVnRpU5CBwaM51isFzSv0nhar3c65dWABpllaNFaFdw=;
 b=YUZ6uVqlyro/eiDDLZcemmSmBzxJhXL6kMIKOBlMssRBZwuXzx+H5jw85Lz58hct4y2fNQ
 ugOC3vCbta2YKzqW+ckA8T/73TS9vws9u51voNE8yxdAZD64yy6bJYEA2XDThyhAv5KB3x
 UwFnaLegMmaoMwQDszPRwC7VyEPQHgFw8YHFTNzK6FKfUYWMeGNnSUack33iF0+AXX1Ppy
 9RpOpMI+ASM4289mUSJzPvzNQptTOdZsvNeEw//8h0kkifreiLcp94f9Riro0/vjafwozT
 GtYavOnV0wsOtETWSsBe0ryEjTtkADwmZ7Yeo77iYOXl+5eN9QRAZWmli4iq9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YUZ6uVql
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglev_fire: add support for
 BeagleV Fire
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Valentina.FernandezAlanis@microchip.com, Conor.Dooley@microchip.com,
 Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jamie,

On Wed, 22 May 2024 16:06:54 +0000
<Jamie.Gibbons@microchip.com> wrote:

> > Nowadays, we try to use distro bootcmd instead of custom uBoot
> > environment scripts. See
> > https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/doc/develop/distro.rst
> > for some details.  
> 
> Could you clarify the change you are looking for here? We do use distro
> bootcmd (#include <config_distro_bootcmd.h> in our U-Boot config). This
> scans for our boot.scr, which as far as I can see is supported under
> that link you sent. Are you asking for us to replace the boot.scr with
> extlinux.conf? I can see other boards use "extlinux.conf" or
> "boot.cmd". Our preference is to use "boot.cmd" as this allows us to
> use FITImage and FDT set. Could you clarify your request?

Yes, we ideally like new defconfigs to use extlinux.conf when possible.
One motivation is precisely that boot script tend to do random hacks
that are not very nice. That's not a strong requirement though, more of
a "nice to have".

> > > +BR2_PACKAGE_BASH=y  
> > 
> > Why?  
> The above four packages were used to support the gateware scripts.
> These will likely be removed for v2 due to the changes in those
> scripts.

I suppose such scripts don't really require bash, the Busybox shell
should be more than enough.

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
