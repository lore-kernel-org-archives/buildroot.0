Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC44FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 16:48:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A3C961AFB
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 16:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A3C961AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C506360591;
	Mon, 15 Nov 2021 16:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3NzcQDb0-dt; Mon, 15 Nov 2021 16:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37BBB605D8;
	Mon, 15 Nov 2021 16:48:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8E41BF574
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 16:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C60080C43
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 16:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTjaiTm8gTAh for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 16:48:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCAAB80C3B
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 16:48:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e1b9:10a:8619:7c87])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7F318780333;
 Mon, 15 Nov 2021 17:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636994927;
 bh=Ie8MwTRJjwmvi+UoG7NGT5VKNMN6876rym7DMOfgaeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q3U+MHOktONJAPPn9IgdZ/55rpuZ0LD6uCKNzK34XEsiuOCvIAOAClSwEI0OT+A6P
 FvjhuUleU38ARO1hxIbfVRwIFelkVSXVj8eGwhParJzhlMCuBkiiKXMSSa3tj6etzW
 A01FJm9/PAywead3cT7mgh3XB1WIaGoBFbSMhSRqiJc30oJBq52pNdYa8q1EkoO/f4
 4xPF65Xcqo90Kp+9kbUtALnZBJfw/6c67uY8qL5QWRwopTL2PXqLykc1TJTfVyl9cl
 DYcjhe9gPjLH6OantyPHtotS1L/m4Tu78VQ0r/36aBOf/ztC0t4uf+ZWzpscmgVROr
 zKpHC4NlT9g2A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Nov 2021 17:48:37 +0100
Date: Mon, 15 Nov 2021 17:48:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20211115164837.GB247986@scaer>
References: <20211115133000.72041-1-kory.maincent@bootlin.com>
 <20211115133000.72041-2-kory.maincent@bootlin.com>
 <20211115153825.251bff20@windsurf> <87r1bhl97g.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r1bhl97g.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/psplash: add support to missing
 configure options
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, phil.eichinger@gmail.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2021-11-15 17:37 +0200, Baruch Siach via buildroot spake thusly:
> On Mon, Nov 15 2021, Thomas Petazzoni wrote:
> > On Mon, 15 Nov 2021 14:30:00 +0100
> > Kory Maincent <kory.maincent@bootlin.com> wrote:
> >
> >> Add support to three configure options:
> >> --disable-startup-msg: Disable text banner output on startup
> >> --disable-progress-bar: Disable progress bar
> >> --enable-img-fullscreen: Enable the logo image in fullscreen mode
> >> 
> >> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> >> ---
> >>  package/psplash/.Config.in.swp | Bin 0 -> 12288 bytes
> >
> > Are you sure we want this file in Buildroot ? :-)
> 
> A file of this name is already in current master branch. Introduced in
> commit 70440e28c8eef ("package/python-pudb: bump to version 2021.1").

Thanks for the report! I've cleaned up my mess now, by pushing commit
5f92c032369e. Thanks!

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
