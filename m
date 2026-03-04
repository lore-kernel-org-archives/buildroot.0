Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23507EFCE3B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 18:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F91781FFC;
	Wed,  4 Mar 2026 18:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1sK_OsdjTaL; Wed,  4 Mar 2026 18:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C22681F5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772647234;
	bh=fBv/yikL+Our/s8R/fMLt6Pgkl4lw2FGZi16Zz6PUZ8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dUGDzj9DQQmMKgNNxG5nNQWVWDnq0uROsWv0tneZnnYKqcjBT2sUnv2x6i0pUtewD
	 0awokfzSV6Of0rJb9FYktmuEpKJrUk39LKpQa53yVlyK0PIiAtMNYTLFI7/0D9NQga
	 NO4LDy2rgSrVAWfl8EfKFEm27K4Xw9t/TxfKW1wdCUvoOR0JpeIKfovMC5PTmnRUil
	 jOyHZGDPEFDrQ5kPy4xpP0ag1hq/NEbv42BZvYJCgs5tkOwV76Xs8wjF8EGH2C0L4O
	 l4VKs0aXO0uAta2I+i21GJm02gedxkW6YFuD0+rkQR7jirqykIxnM11plxaqZv6Fkw
	 aeXOJjmfJhRmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C22681F5B;
	Wed,  4 Mar 2026 18:00:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 614911EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52EA440BAB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cs9-wVWh4dWt for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 18:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7541740BA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7541740BA0
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7541740BA0
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:00:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EFDF34E42536;
 Wed,  4 Mar 2026 18:00:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B651B5FF5C;
 Wed,  4 Mar 2026 18:00:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE800103695CE; Wed,  4 Mar 2026 19:00:22 +0100 (CET)
Date: Wed, 4 Mar 2026 19:00:21 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <aahzAZ47FxSAGgEF@windsurf>
References: <20260304152057.3465672-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304152057.3465672-1-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772647226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=1f1VgKXTS0NQk558mFLf/gRsdjZ10ZdTOf8D/Y7Gzmo=;
 b=bYOh+BiPOhy193fX7qHZdk/KqkZGdZdyeSOeEzlf5ganSgvBBZitcGMaTJ/jAMzZg2K5Aa
 ibySJkyxWjQgT/oBU7c/b1VlDPVlEViqOn2qjBiReBdF20IrxC7okJJFjWuy45qKaylVQe
 0ULOTvRY5nYdPkXXMJTnOWaPAGtovof5CVwlgk1TVkKg2/twG0SICP3M2AZPN9VhgfmQSy
 laLhVW8QUlGAYfGMXSHgNaZuvDsh7b1ozUckSDp7Y7b0b7VMZJvLDGEqXCDPGYFbkxmryy
 9OoJuKIcQKpPoha0AHvMtTKW7ijr7HRkTcIdI+1VXvEJg2B/G25Z0VPKPL+pqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bYOh+BiP
Subject: Re: [Buildroot] [PATCH v3 1/3] linux/linux.mk: export LINUX_DTBS
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, buildroot@buildroot.org, brandon.maier@collins.com,
 fiona.klute@gmx.de, ju.o@free.fr, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Mar 04, 2026 at 03:20:55PM +0000, Neal Frager wrote:

>  LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
> +# Post-build scripts may need to reference the LINUX_DTBS,
> +# so export it so it is easier to use
> +export LINUX_DTBS

I find this a bit "meh". What about using "make VARS=LINUX_DTBS
printvars" or "make VARS=LINUX_DTBS show-vars" from your post-build
script?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
