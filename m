Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A83BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:18:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9119560F9E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9119560F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4345F4050D;
	Mon, 18 Oct 2021 20:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHPaWAzdxlNi; Mon, 18 Oct 2021 20:18:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA913404D7;
	Mon, 18 Oct 2021 20:18:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF391BF27A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E09C401CA
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id de5wDt9r2Mdj for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:18:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79C3240164
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:18:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87d:8477:c454:3318])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 729282003DC;
 Mon, 18 Oct 2021 22:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634588296;
 bh=Y66vXd3yapCH12wQFGMZwq4Nhl1o9sUcFvpsTqK4fM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ml89QfO5gToaahxP7zvF8qJx0nVaEOSpV8gY6cx5dyRYHoC+JPZanb9gDrmXKFYrq
 +3x4/JGWPpZSB2MhaM2hWEu71jnHl743Tzrv4ne6dFy7fR2IYWa/7sljGOHGNu4YGj
 hr56oPm5BBKIfXowUkE7aczFCNu60gkg9pA7GVlFgtyHnBALw34kgedl4fTw1btmXf
 Qh/qIhoHiL5uVvLPrkmEqJ8bkaRyGZTUimfMzU9IvJKUGjDDEofbTe44fL0IxEZZay
 7HgoM8Fd/GBZomxcKkUvH0dnFFW4kEtu0wlV2sp5M6808bFl6ccltTanazncJpH6oB
 Xh6CHKH1aZljQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Oct 2021 22:18:08 +0200
Date: Mon, 18 Oct 2021 22:18:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211018201808.GT2400@scaer>
References: <20211016093234.2477835-1-fontaine.fabrice@gmail.com>
 <20211016093234.2477835-2-fontaine.fabrice@gmail.com>
 <20211018220427.5971bba1@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211018220427.5971bba1@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,2/2] package/knock: add knockd option
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
Cc: Michael Rommel <rommel@layer-7.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-10-18 22:04 +0200, Thomas Petazzoni spake thusly:
> On Sat, 16 Oct 2021 11:32:34 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > +ifeq ($(BR2_PACKAGE_KNOCK_KNOCKD),y)
> > +KNOCK_DEPENDENCIES = libpcap
> From commit 97f3ad7af3dd54a15a10aa35786e7fa08cf5e7b1:
>     Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
>     conditional is the root of all evil."
> Care to repeat after me ? :-)

OK, I missed that in my review of v1...
/me hides in shame...

But seriously though: why is that not caught by check-package?

Because it is not actually an override: the variable is not yet set
there, so it is valid to unconditionally set it.

check-package should probably recognise that the variable is
<FOO>_DEPENDENCIES and consider that conditional assignment should
still be forbidden in that case.

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
