Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0531C54FAA
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 13:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3833D80EB9;
	Wed, 28 Aug 2024 13:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHL8FEiQMmJ6; Wed, 28 Aug 2024 13:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 444D58118D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 444D58118D;
	Wed, 28 Aug 2024 13:43:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4791BF2BB
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 13:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4954340B0B
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 13:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJUIkZrQKACu for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 13:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C101B401FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C101B401FB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C101B401FB
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 13:42:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CB981BF20B;
 Wed, 28 Aug 2024 13:42:54 +0000 (UTC)
Date: Wed, 28 Aug 2024 15:42:53 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240828154253.206391b0@windsurf>
In-Reply-To: <87r0a994or.fsf@dell.be.48ers.dk>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf>
 <87r0a994or.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724852575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIX5V4uqdJ72bW4JT8khje5PS6sUjjg3Zun3VQewxx4=;
 b=BoLtWUBIaIAnlh9RrBoyr9cRvUchG9rkhxJ8rMuDH54mmJXDw039MCOKVpQaHoaF6NTOsp
 ujXwD1ujTxZERnNONul/f6FXDJJV3zLthPO1T6SPOIWa2z77cRbE+hUnnNlm+306BYN1r2
 dRiXtkT0EYQDf8ARIpN582y+sqDoLcZt4ZDLBSLaiA2vkiBWbJ9u4PSTDeGD3fYCqNTD2J
 sShbTlA0k0HU7zqtxnbGT1Mi9WrGSbVepDBMzFk/0fzZ7kAuWm+jGiP6Gx0Q/qk/WT19Aw
 d10nnU6OvPdb46VYY6wB3RoIAhq9ldVE63qh4ejvDf5DqX3qVTm2gXwU5Bumfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BoLtWUBI
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: michael@amarulasolutions.com, Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 27 Aug 2024 20:55:00 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Sorry for the slow response, I only got to this now while backporting
> for LTS, but I don't like the fact that it hardcodes gzip compression
> (with a specific compression level), especially as it is
> hidden/optionless now, E.G. it seems quite random that if you have a
> genimage.cfg creating a sdcard.img (or whatever) and you then enable
> host-bmaptools you all of a sudden don't have sdcard.img anymore, but
> sdcard.img.gz (and sdcard.img.bmap) and "waste" time doing the
> compression you may or may not want.
> 
> I would suggest to drop the gzip step and only create the .bmap files
> (which presumably is quite fast?)
> 
> What do you say?

I understand your concern, but compression is also what helps in making
those sparse images small. Of course, as long as you keep them where
Buildroot generated them, they are sparse, so they don't take much
space. But as soon as you "distribute" them, they usually loose their
sparse-ness, and this is where compressing the image + the bmap
metadata file helps in lot in reducing the amount of data.

But fair enough, I assume this compression can be done as a custom
post-processing step by whoever needs it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
