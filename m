Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED64C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 07:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE75C40129;
	Sun, 18 Aug 2024 07:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ag57FIVcMkN; Sun, 18 Aug 2024 07:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D8B1401B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D8B1401B1;
	Sun, 18 Aug 2024 07:59:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 247621BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E847401B1
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTuFDxghBFS4 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 07:59:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 919D640129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 919D640129
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 919D640129
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 07:59:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5E4B813F81D;
 Sun, 18 Aug 2024 09:59:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Aug 2024 09:59:45 +0200
Date: Sun, 18 Aug 2024 09:59:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsGp8VSleNiIxs-H@landeda>
References: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723967988;
 bh=qpjE//ZLX2fzCybNscKz4w3h+jNteTjBEK/6y+3v+LE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aBDDsOEV+Z/Z8/VTgGi0K7RPL1fF+jG3tvXRzHhhktickP2pAV/aEqOytOZNrTQLI
 T6hiJtg/ekRBIwYmWrCuFmNfiAxY/Sc4kXW7GLUsDpi2Dw/CelEw1a9/gH8A2r0z3z
 eR7tS6A04cXLTI40m44Rzb1q2+MDQhycgvSYgogFx5AiRtvUyRrRkfGIDxVtjUSR86
 /oy2R48YMZj2xV8X39sFC/00WctUcPrWLtV3qvH4Df7bzKv49zZGXAYFz3/2y5r2Vc
 oK+msMg8Cc4meKPEJCEYJ7bKGPDhb3tOoByep45RlL6Ic+Mqw7F4e7o5rPib0mxpii
 QShFchg5f0dCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aBDDsOEV
Subject: Re: [Buildroot] [PATCH 0/5] Misc utils/genrandconfig improvements
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-16 14:06 +0200, Thomas Petazzoni via buildroot spake thusly:
> My starting point for this series was that I wanted to create some
> configurations that have BR2_BACKUP_SITE="", so that we do not use the
> Buildroot backup mirror, to ensure that upstream locations are still
> around.
> 
> While implementing this, I realized that all the semi-random
> configuration tweaks that we do in gen_config() are in fact completely
> overridden by "make randconfig", when genrandconfig is used without
> any toolchain CSV.

So, I have not tried to bisect the series, but here genrandconfig is no
longer random at all:

    $ ./utils/genrandconfig -o pouet
    $ ./utils/genrandconfig -o blark
    $ sha1sum pouet/.config blark/.config
    d60e28f2da3cda03c41a40c24d2f783a38cce2bc  pouet/.config
    d60e28f2da3cda03c41a40c24d2f783a38cce2bc  blark/.config

Regards,
Yann E. MORIN.

> So I thought it was time for a bit of clean-up:
> 
> - Drop some fixups related to toolchains that are no longer tested
>   (patch 1)
> 
> - Completely remove the support for using a toolchain CSV file. "make
>   randconfig" support has been around for quite a while, it gives good
>   results, so let's use that as the default now and only use fully
>   random configurations (patch 2)
> 
> - Adapt the fine-tuning logic to the fact that "make randconfig"
>   overwrites everything: move the fine-tuning logic *after* "make
>   randconfig", but keep only what makes sense, since "make randconfig"
>   already randomizes everything (patch 3)
> 
> - Implement what I wanted: set BR2_BACKUP_SITE="" for some builds
>   (patch 4)
> 
> - Rework the logging of genrandconfig, as it is quite noisy right now,
>   but only with irrelevant messages (patch 5)
> 
> Let me know what you think.
> 
> Thomas
> 
> Thomas Petazzoni (5):
>   utils/genrandconfig: remove fixups related to untested CT-NG
>     toolchains
>   utils/genrandconfig: remove support for toolchain CSV
>   utils/genrandconfig: rework fine-tuning logic
>   utils/genrandconfig: do not use BR2_BACKUP_SITE for some builds
>   utils/genrandconfig: improve logging
> 
>  utils/genrandconfig | 268 ++++++++------------------------------------
>  1 file changed, 44 insertions(+), 224 deletions(-)
> 
> -- 
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
