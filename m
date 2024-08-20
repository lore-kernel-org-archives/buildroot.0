Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825D2C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D2B40676;
	Tue, 20 Aug 2024 21:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTVJbKlR6neY; Tue, 20 Aug 2024 21:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C338240679
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C338240679;
	Tue, 20 Aug 2024 21:03:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9742E1BF376
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9122940679
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xf1p6wCRpJZK for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:03:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3022740676
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3022740676
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3022740676
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:03:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E39151C0004;
 Tue, 20 Aug 2024 21:03:00 +0000 (UTC)
Date: Tue, 20 Aug 2024 23:02:59 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240820230259.1449837e@windsurf>
In-Reply-To: <CABGWkvr-7ms+bSE5R+h7ocUDmFS-XFXaZs453mkfNbBo3D7StQ@mail.gmail.com>
References: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
 <20240803224527.1a93f941@windsurf>
 <CABGWkvr-7ms+bSE5R+h7ocUDmFS-XFXaZs453mkfNbBo3D7StQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724187781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BzMhQreXvo6sw1Vz7Qc1SbxoD140O3Kl53+vPWUOmI0=;
 b=Ab9mF+72r6N6iAY5DDbifpPQxzWhZYFHM+uaupR8Mh2dAGiOauOYGZGI/AbYYcIrwDnoNZ
 zqc9I+WSgisS6LpCZHBgVXZVyAi/ZcrvBGYbbfIijmBShIlH+/chyNVJ2v7QWKEEssVj0l
 S8k/5tF8Yh6DhigFV7DcNVbRW/T+0hvBAqTvMqKtlihlzOau5MH2n5mNztqRxBRdl3VYEx
 jDKi1+GMHL9TV4krWRHDDyf/uqMYYXYI9dmFq2hoONI/zFx/Z6MsEFxNENW5dG/6k0ffqq
 lHvA8knC3p4QFPuzHgaNXzB3WzXzO61CIDbP4kS67HlYYjNOfIxzuF0Ttr3bAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ab9mF+72
Subject: Re: [Buildroot] [PATCH 0/3] tinit and stm32f746_disco_sd_defconfig
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Tue, 20 Aug 2024 20:47:09 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> > - I believe you should drop entirely the logo thing in tinit, we don't
> >   have such "logos" in any other Buildroot defconfig, so I don't see
> >   why we would have one for those super small noMMU defconfigs. This
> >   would allow to get rid of tiny-setup.sh stuff.  
> 
> I implemented the logo management only to ensure that the patch
> "board/canaan/k210-soc: use tinit as Linux init process" was backward
> compatible.
> The previous script included the Linux logo. But if this is not an
> issue, I agree with you
>  that it's better to adopt a simpler approach.

I think it could be dropped (perhaps as a preparation commit). No other
Buildroot defconfig has this, it doesn't bring anything really useful,
and is just extra complexity for no benefit.

> > Why do we need a busybox-tiny.config? We already have
> > package/busybox/busybox-minimal.config. How different are they?  
> 
> I think this is a configuration I used for upstreaming the Linux
> display driver.
> I will remove it and use the busybox-minimal.config.

Perfect, thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
