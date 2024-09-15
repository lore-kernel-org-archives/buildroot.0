Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E80AC35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 203C14028E;
	Sun, 15 Sep 2024 07:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIEoGUSWD4-y; Sun, 15 Sep 2024 07:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA01402C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA01402C6;
	Sun, 15 Sep 2024 07:31:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE50B1BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC59580B87
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRchNK11fiZW for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:31:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC0E380B82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC0E380B82
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC0E380B82
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:31:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8B2E1BF204;
 Sun, 15 Sep 2024 07:31:28 +0000 (UTC)
Date: Sun, 15 Sep 2024 09:31:27 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20240915093127.76eea2a8@windsurf>
In-Reply-To: <CA+h8R2ouJqmjxHv_DswDwOMuJO1Pv9=_3p4uxdNYGR3H=GFbFw@mail.gmail.com>
References: <CAEpB38MKaFVyTLAwjsT6uGEU+w7L9MpUg31Oftqb9oaP2DNPiA@mail.gmail.com>
 <20240914110036.13d08b21@windsurf>
 <CA+h8R2ouJqmjxHv_DswDwOMuJO1Pv9=_3p4uxdNYGR3H=GFbFw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726385489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XfGzTl4bLUohvcu+frt2B4rnFHgDTB5b6Ags345tpTY=;
 b=BHMr4WJHr63RiXgw/8HHyAau13U5Su1NkKTAU3Iw+dvX/ACUuoU34T+818Dc/YTjOrlZkb
 6KVqm250j0UAfRz71JyzatgLfoIWuDwIY25bG0EUa+aow15cLEMQaXnIs4Ryiu/+2Az2ML
 11OO018AkjntZEvK6w97J9QEbzrEzl2n6BxWVYy2vgZc1mNJgbRwD8GzYV74rsICB3aKrz
 52LVWJuI6ODsBkhDq53IxvwBWenpIL7LRWJ7xpJHtvRqaRCpd5+56Ng/pOeu/EjSpCjLYP
 MX8yD2s6xWcdwSfDrnAOmzF7+SFVwex2w9mLcyAhRZuiEXUbCmI1/Ckj6UhBYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BHMr4WJH
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 go1.22.7
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 20:07:37 -0700
Christian Stewart <christian@aperture.us> wrote:

> Gmail just destroys the line length it seems. It's hard to send
> patches or plaintext emails via gmail as it wraps at 78chars

A number of other people use gmail and git send-email and don't have
this issue, so I'm not sure what's going on in your case?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
