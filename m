Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDDDC636D3
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CB1681AD1;
	Sun,  5 Feb 2023 14:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CB1681AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eySNfCXN1Z7d; Sun,  5 Feb 2023 14:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57D6A81971;
	Sun,  5 Feb 2023 14:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57D6A81971
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBF791BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6B9F40124
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6B9F40124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Icx_D-yYhOGO for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:12:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD96C4010D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD96C4010D
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:12:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.201])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 63F8B13F8CD;
 Sun,  5 Feb 2023 15:12:43 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 15:12:42 +0100
Date: Sun, 5 Feb 2023 15:12:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230205141242.GI2960@scaer>
References: <20221107214903.1565321-1-yann.morin.1998@free.fr>
 <20230205150023.105dfc14@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205150023.105dfc14@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675606367;
 bh=Fjs8ohyjD/rYNE/tNpp4RwZ/l8E+0m6I1Ei0WOZc8QQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r1/b6FIbnjE5f7teu/S5/pydQgn+M2WX9tjEhXLCAeKCluNQ9X7BJIFaAWsmn/aIW
 WYVZsG7P5QZdr7fSJxDHzXdZC6iYWmPUJ5Eoybo3e6yMC++lJ/OsfYH/3+Wo1ZtAuY
 WAWAxwGjI8WjAdVvfg0iRX2GDxq9KD/bdlZNHI5/J0wNiiEy1lAd6ovyEuBVih4gV1
 O/AEkJxB3YwBMWypiw8tcHHUkFAr6Yr7cgFvM145hK86h98mVjhNKxuGFX4JmVYVI2
 8OY7uQ9yBi0KX/g3OnpzM4wEzJoXjf/SJVa5Fo2tJAHnPsHF8bMrV3mvx37FKjKLng
 eqCJDggYvNM8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r1/b6FIb
Subject: Re: [Buildroot] [PATCH] toolchain: make paranoid check of
 library/header paths unconditional
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-02-05 15:00 +0100, Thomas Petazzoni via buildroot spake thusly:
> On Mon,  7 Nov 2022 22:49:03 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > When we introduced support for the paranoid check of unsafe libraries
> > and headers path with commit 4ac8f78d3771 (Add option for paranoid
> > unsafe path checking) back in 2014, we made it optional, as we expected
> > that would break quite a few packages.
[--SNIP--]
> > It is time to make that globally unconditional now.
> > 
> > There is still a remnant, in our binutils patches. As our toolchain may
> > get used outside of Buildroot, people may got the expectation that path
> > poisoning is only a warning, so we keep the current behaviour.
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Romain Naour <romain.naour@gmail.com>
> > ---
> >  Config.in                               | 18 ------------------
> >  package/Makefile.in                     |  3 +--
> >  support/config-fragments/minimal.config |  1 -
> >  toolchain/toolchain-wrapper.c           | 21 ++++-----------------
> >  4 files changed, 5 insertions(+), 38 deletions(-)
> 
> Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

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
