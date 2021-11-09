Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414A3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:51:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D89E1611BD
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D89E1611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AB2B402F5;
	Tue,  9 Nov 2021 08:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aS4Fw6XvxopL; Tue,  9 Nov 2021 08:51:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B24F4402F6;
	Tue,  9 Nov 2021 08:50:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4881BF3B9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1652840362
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YsFS5R3Ap-jm for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:50:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D496240184
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:50:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:710f:610b:602a:e07])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 97E3C20039E;
 Tue,  9 Nov 2021 09:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636447853;
 bh=IuJQUdsOccxBLs40YMBe+9RgLHmkuktZwTpohOlUSnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fOhaMQ1gk4QEC5sJgSegZFhf4gsnfMy3fJXmJRWM2WmOJ2eVb6gyzFfPRzAnjbusD
 6R/4IyjowstRWL+zMZz6ucC1PtxZKQQeV/DEB2uXf9M4NCqMSr4kzw/mvRKB9bFEUp
 rjyH0ukbFlU244S4a51a9DhoZeeoBP4r9AA6RHIG9UEUSty0YA/0ag9jAyvDD9QBbS
 akxIetq4ELj8Q/iPEPPRYufZ5LwKRmIgxswbb7xm2hXJQ2mZkzDmpkR2GodMWE85ST
 32SdzgB3rtnAYJ63ocxYX79V9gU89xgJngz9egbAZd7ORD2bOVoJbbEiKUpJ7DmBvF
 ki6fks2xgJNLQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 Nov 2021 09:50:32 +0100
Date: Tue, 9 Nov 2021 09:50:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Walle <michael@walle.cc>
Message-ID: <20211109085032.GF680793@scaer>
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
 <20211108230520.4007148-8-giulio.benetti@benettiengineering.com>
 <eea83befc9a6f40dad4efa7a4ae019de@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eea83befc9a6f40dad4efa7a4ae019de@walle.cc>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 7/7] board/kontron/smarc-sal28/genimage.cfg:
 fix option suffix
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 =?utf-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2021-11-09 09:04 +0100, Michael Walle spake thusly:
> Am 2021-11-09 00:05, schrieb Giulio Benetti:
> >Option 'offset = 4k' must be 'option = 4K'.
> Why is this is a 'must'? Apparently it works, no? So if anything
> it is for unifying; but even then it's moving in the wrong
> direction. There is no "K" prefix in si units. Stictly speaking
> there is no "KB"; there is a "kB" or a "KiB".

This SI reference was also my comment on the preceding series, but
unfortunately, that ship has sailed now that the series has been
applied...

Regards,
Yann E. MORIN.

> Anyway. I'll let the buildroot maintainers decide on this.
> 
> -michael

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
