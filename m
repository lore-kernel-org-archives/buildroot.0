Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC73C25B74
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA7082378;
	Mon,  6 May 2024 20:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAGGyz4i63NK; Mon,  6 May 2024 20:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C54EF82419
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C54EF82419;
	Mon,  6 May 2024 20:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03DFF1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E275882419
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAJsrgQGnyBc for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6419E82378
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6419E82378
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6419E82378
 for <buildroot@busybox.net>; Mon,  6 May 2024 20:21:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0610CFF803;
 Mon,  6 May 2024 20:21:43 +0000 (UTC)
Date: Mon, 6 May 2024 22:21:43 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240506222143.075e7731@windsurf>
In-Reply-To: <Zjk7W9fZXDBusRc2@landeda>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506210440.323ccb15@windsurf> <Zjk7W9fZXDBusRc2@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kqb4Mf2jKlblr6DdO0iycHrYoQxbYyD9giFMaHy3hpw=;
 b=YElv3NwP8FeVOkzvTWKRdcEed/AB3PWpSGjbzLpzgqhtvYs08UnKwxmFVjeAH647Mc9+KK
 aNM2IdyD9pZeYrsAkNLHFQR158dWRthkxlWacVuzEEAzlSSAALOd5ZpjqItPX9ewK1xESE
 Sq7apEHQSrUpQvB076xXQJqHknk6wQ55QX2TABs4ml6x0WqyJZteF++RlvA5APBKNBozIY
 COxmnO+yDBlXl8+hOduGfWykiiIjA304ItRngkaxJxgxK/ogqS7I09thsVFSDOD6coDskX
 EOfcvzMGK7S9Tu3XXzSR2ZMZeI099IU9L+zOL5RSglw8ktmATp2TxAjvNMfQBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YElv3NwP
Subject: Re: [Buildroot] [PATCH v1 0/8] support/kconfig: bump to
 linux-v6.9-rc5 version
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>,
 Peter Seiderer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 6 May 2024 22:19:39 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > So this commit without the next two leads to a broken situation,
> > correct? (Note: this is not a complaint, I agree with them being split).  
> 
> Except they should be reversed: the new commits can work with the
> kconfig we currently have, so it looks like it should be OK to do the
> required changes before doing the kconfig bump.

I don't think the logic changed in "support/kconfig: reference
environment variables directly (remove 'option env=')" can work with
the current kconfig code base.

> > I remember Yann saying that this was
> > a problematic change for us in the upstream kconfig code.  
> 
> Yes, so given that there are two problematic changes:
>   - source statements in choices,
>   - environment variable direct expansion,
> I wonder if it makes sense for us to update our kconfig infra...

But we'd hate to stay stuck on an old kconfig code base forever. Gtk is
going to move on, Qt is going to move on, which means at some point in
the future, our "make xconfig" and "make gconfig" would no longer work.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
