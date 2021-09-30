Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D14C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 20:41:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A1C61246
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 20:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29A1C61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7B2C84223;
	Thu, 30 Sep 2021 20:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zV8Meyaxo7Ro; Thu, 30 Sep 2021 20:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 039E784220;
	Thu, 30 Sep 2021 20:41:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDA841BF947
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 20:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D812084220
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 20:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9-XeDYNdW2a for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 20:41:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD3318421C
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 20:41:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1957:9ac2:5e5e:60b1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F3EF3B0053B;
 Thu, 30 Sep 2021 22:41:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633034490;
 bh=W+dZjqNWO5AE8RmrvDi3MGED5PtZAc6xcvRXM+gKV6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B5FXIvQaMT9sMQE+sPl4IrCyU5fTsEWJU+apl9gJwqomvCz/mesPXdmXaHt2ZHiB/
 dTynPhAydoOk8K/Ny27ElcQUa7wquUF7agXmqdvWO4LURDBQNvZTzoA6xdYO56Aa7l
 M0gga2uFNoKM7203RBYOwDYC5KRBLk2d8PNW70AEzYOIdHyr1T1iKzv5/wQomGDRKE
 MMjYXhABZq5o2Dc9aV0cGFrc1+Pf/ldUcKEja1CH1rn0F6wTbbmRtZPEQuEODVtH0A
 F4Novarzt6EPEl/5hve8s0ctAEXDNvg4D42nFlmMDQ4yNP4JcacC29xa9znrDjwreN
 FYFi37r2Crwtg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 30 Sep 2021 22:41:23 +0200
Date: Thu, 30 Sep 2021 22:41:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20210930204123.GQ1504958@scaer>
References: <20210921205112.39176-1-petr.vorel@gmail.com>
 <fee5adb3-0cd8-3538-bf3e-d04af8153007@mind.be>
 <20210930200402.GO1504958@scaer> <YVYbAxgEomvMo5IQ@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YVYbAxgEomvMo5IQ@pevik>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC PATCH 0/2] use `command -v' instead of `which'
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petr, All,

On 2021-09-30 22:16 +0200, Petr Vorel spake thusly:
> > Petr, Arnout, All,
> > On 2021-09-26 23:32 +0200, Arnout Vandecappelle spake thusly:
> > > On 21/09/2021 22:51, Petr Vorel wrote:
> > > >I've tested the patchset on dash as the default shell. But it certainly
> > > >deserve more people to have look and test.
> > >  Well, as the commit message says: it's POSIX so it should be supported by
> > > everything. which has a much smaller chance of being supported.
> > This is causing quite some issues.
> 
> > First, 'command -v' does not behave the same way 'which' used to, when
> > passed more than one parameter, because some shells are not compliant to
> > POSIX (this might be a bug, but nonetheless it affects the most widely
> > used shell out there, bash) [0].
> Yes, there has been a proposal, how to fix this.

The problem I see with that proposal, is that it catters for a few
variables only. We might not even notice until much later that something
else is borken in some weird ways... And we were lucky that Markus did
the investigation and was able to find the actual root cause.

> > Second, this is causing a lot of error messages:
> >     $ make defconfig
> >     [...]
> >     $ make help
> >     make[1]: command: Command not found
> >     [...]
> New error. But I was not able to reproduce it on x86_64 on current master
> (5916cc5011). What am I missing to reproduce it?

I'm on a bog-down standard Ubuntu 20.04, prety up-to-date. My /bin/sh is
bash.

> > The original commit reports that 'which' is broken in Debian, but I was
> > not able to reproduce in Bullseye, where 'which' still works as expected
> > and does not emit any extra warning.
> Yes, the waring is in debianutils 5.x, which is still in Debian unstable (not
> even in the testing) [1].
> 
> > So, we are trying to fix something that is broken on a development
> > version of Debian, but that still works in all known released
> > distributions.
> 'command -v' and 'type' has been here quite long time as well.

I am not denying this. I'm just saying that we are trading a working
situation in all released distributions and a failure in Debian
unstable, for a failure in a quite a lot, in not most, of the previously
working cases.

> > I usually am quite in favour of sticking to POSIX tools, but which has
> > been ubiquitous in the past 30 years or so, and I would consider that
> > Debian's which *is* broken for reporting such deprecation warnings.
> 
> > So, I suggest that we do revert this patch, and work on a better
> > transition away from which, if at all. One very quick solution would be
> > to bundle our own which in Buildroot and then we'd have a quick way out
> > of that Debian's mess...
> Sure, if it causes problems which are not easily fixed, I'm not against
> reverting it. But I don't think that problem is that complex, that we'd need to
> compile which.

which is a shell script in Debian; we need not compile it at all. Let's
just grab the latest working which that did not have that warning:

    $ file /usr/bin/which
    /usr/bin/which: POSIX shell script, ASCII text executable

> But I apologize for causing troubles.

Do not apologise, this is not needed. The trouble (as you say) is
standard development issues that will eventually be resolved, one way or
another, no worries. ;-)

Thank you! :-)

Regards,
Yann E. MORIN.

> Kind regards,
> Petr
> 
> > Anyway, I'd vote "revert".
> 
> > Regards,
> > Yann E. MORIN.
> 
> > [0] https://lore.kernel.org/buildroot/YVTIghzHs82uFBIe@pevik/T/#m95c17eb8374e4e3dd6eee700d397aa12cca0739e
> [1] https://tracker.debian.org/pkg/debianutils

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
