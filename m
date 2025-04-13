Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B2BC3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 10:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B115E81DE8;
	Sun, 13 Apr 2025 10:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YG0-JuhfCLBd; Sun, 13 Apr 2025 10:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAC37819F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC37819F3;
	Sun, 13 Apr 2025 10:02:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BF55DE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 312ED81CA7
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 10:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PrWoY1x46s5 for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 10:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A403F81401
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A403F81401
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A403F81401
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 10:02:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86E43432F7;
 Sun, 13 Apr 2025 10:02:16 +0000 (UTC)
Date: Sun, 13 Apr 2025 12:02:15 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, linux-amarula@amarulasolutions.com
Message-ID: <20250413120215.2f3bc1a1@windsurf>
In-Reply-To: <20250413095900.1940373-1-dario.binacchi@amarulasolutions.com>
References: <20250413095900.1940373-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudejfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveekudevheduveetieejhffffeeujeetteejuddthfeigeejueejvefhtdfgfedunecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgeefgeemlehftdelmedvkedtudemfegsleemjegstghfmeehheelheemvghffegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeefgeemlehftdelmedvkedtudemfegsleemjegstghfmeehheelheemvghffegvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepuggrrhhiohdrsghinhgrtggthhhisegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtp
 hhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsgdrsghilhgrshesghhrihhnnhdqghhlohgsrghlrdgtohhmpdhrtghpthhtohepmhgrrhhlvggvnhdrvhhoshesmhhinhgurdgsvgdprhgtphhtthhopehrghgrlhhlrghishhpohhusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghmrghruhhlrgesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744538537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cDKoq6UT3wgFKMLQFmp/XDpYLLONDRrY/ZhE9JrSQ24=;
 b=Z++k/Iz1Y/NeX2H4w9TtV5vdAUjPQ6zzkt/EvKcNjkdv3oFR1+iNiYPafcZF4x9Dj+yHNf
 Fz4ytzt5QgQUb1D/PI/Co6wj0CiOE2kIw9ICP8tfj5qBygmXg9W9VFRwglqK+VVX5sTNPd
 mpWKpQneCqITGSh9KCHQWuOjFTD4+m12kpY+kYCpqMy5Zan/Ngu9QQRa9ew4jXQsOFmesF
 fNT9DHaGSgLZ5WEmC/LQJDULchJjQ515ko+zSMJzWVosq39KKYmq0CnqIjQ+/JOun/8LpM
 cUPtMwAyra3Q5DsRkmfnIVLufkCwvpEXHmhDXDAQeH0EHGH+B7wX7C4QEI+M7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z++k/Iz1
Subject: Re: [Buildroot] [PATCH v3 1/2] configs/stm32mp135f_dk: fix optee
 hash
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

On Sun, 13 Apr 2025 11:58:59 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The build command:
> 
> make stm32mp135f_dk_defconfig
> 
> fails with the errors:
> 
> ERROR: No hash found for optee-client-4.3.0.tar.gz
> ERROR: No hash found for optee-os-4.3.0.tar.gz

I'm assuming this should have:

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/9690369624

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
