Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C8EC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 15:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 955B240362;
	Tue, 30 Jul 2024 15:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cy2V1Z_zm0IL; Tue, 30 Jul 2024 15:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35A2C4038B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A2C4038B;
	Tue, 30 Jul 2024 15:50:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8979E1BF399
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 15:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76C2840362
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 15:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcwuQoovqPnJ for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 15:50:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B851C403EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B851C403EF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B851C403EF
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 15:50:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAF81FF802;
 Tue, 30 Jul 2024 15:50:37 +0000 (UTC)
Date: Tue, 30 Jul 2024 17:50:36 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20240730175036.2d4bd34f@windsurf>
In-Reply-To: <1f90c2c6-ef59-47d8-b547-527879f9d8fc@gmx.de>
References: <20240729122011.1112914-1-fiona.klute@gmx.de>
 <20240729225040.6431a398@windsurf>
 <1f90c2c6-ef59-47d8-b547-527879f9d8fc@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722354638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hei+G2VocWBZTfdzq3JLVj/u8riggT6NTBGhHAEP1cI=;
 b=UoQBFT0GpYvTrVeBIzM9XlLF6RycvWQB874Z2B7B0cLHgDxFeDYFBr0lDe/Lg27u+7+CWa
 fZB7sj+MY8pZDGkFAvEStET1WNafYh4Oinp+ajbek/wAqZmOOHsvpnUVxMOidHXMjo8De0
 irPkFSGqcY3cyOJLbyZBTsmX0KlDo2OebSSFOEn7gvSMwBBBIDR3Xcod0dXy2U6pAJwcBX
 qoUYMeKIuq8WVK6LOyILRTVlVKWsmbYb4T1t2ExRqo1b/iQStRQJI6ROmpd5enjPk6/fnN
 xaaIYfRjlKmCY6fRS+E3wwi+gWhZyEinYCMNjYgjgnEcFGU1F19xNuJ51uAtSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UoQBFT0G
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: rewrite dockerd
 init script
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
Cc: Christian Stewart <christian@aperture.us>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Tue, 30 Jul 2024 17:33:07 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> > While would need the while loop waiting for the daemon to actually be
> > started in the docker-engine init script and not the other services?  
> 
> There isn't a fundamental difference, I might have over-engineered a bit
> while thinking about experiments with the Docker config and how it'd be
> annoying if I change the config and restart, see "OK", and then the
> service isn't running. Effectively the loop only confirms that the
> service reaches the point where it writes its PID file (that's something
> those other services don't do, note the absence of --make-pidfile), but
> it might still crash after.
> 
> It should be fine to drop the loop and accept the same limitation as in
> those other scripts (if the binary can be executed and then crashes,
> output still says "OK").

To me, the whole goal of the effort you have started (and which is
super nice!) is to have consistency among the init scripts, so I would
really prefer that a given situation is handled in exactly the same way
in all init scripts.

BTW, in another e-mail, I had suggested to improve a bit our
documentation to describe the different situations, and how we intend
to handle each situation in our init script.

> I can respin, I'm just hoping to get an opinion on the second patch
> first (the log capture one), so I know whether to modify or drop that in v2.

I don't have a super super strong opinion PATCH 2/2. Wrapper scripts
always tend to make things a bit more "obscure". My initial thought
was: but if all what's missing is --no-close support in Busybox, why
don't we implement it? On the other hand, your wrapper script allows
the logging to go into syslog (which is configurable), while with
--no-close, it simply gets redirected to a file, and that's it (which I
suppose we can say is less configurable than having logs going through
syslog).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
