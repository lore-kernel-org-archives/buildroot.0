Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8706C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 17:00:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2770361039
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 17:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2770361039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB48882923;
	Wed, 28 Jul 2021 17:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBB1Rb-rW7b0; Wed, 28 Jul 2021 17:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16D44828B5;
	Wed, 28 Jul 2021 17:00:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7FCA1BF23F
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 17:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C67D3828B5
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 17:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LyclIm63IDJm for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 17:00:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 392CF817BA
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 17:00:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:453b:e753:6c2:161c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C68822003F7;
 Wed, 28 Jul 2021 19:00:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627491635;
 bh=yr6/cVXhIBHkNyR5LFstKzLoJ6ansIKSdH9O/U0c4W4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=knX1hTcX0PmtT7m1ERO7UK6E03x7M3Nj535Oz2T4C0/3yV9At4qH714clErohN+r1
 xOYQcGlUND51bk31lYos9bHeuAdA8AIdgxzMOinE9YTr7mYx2Yi4boHVTdvVrjunqs
 yAJAI7clG9bOfEP2JojRQJHf6Uic/l5sU+iqFwTGEiIGaGP0RpQ60ZR+FFawcZwLbw
 laBm9ZJj+uBTHckxpHmVKfB/DjtSd7s771mTJWqxFf6U+vrrDCFBezzT0jQlYOsp74
 zv9c7atI6k7b+JlykzVfgwB+R9fuJsZfUjkkiXWSrFAWM9BZ6jGJWAHNGNFk76S5wD
 8SokafCdrbLlw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 28 Jul 2021 19:00:22 +0200
Date: Wed, 28 Jul 2021 19:00:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210728170022.GD2382418@scaer>
References: <20210726201244.43070-1-buildroot@heine.tech>
 <20210726230716.2c7079c5@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726230716.2c7079c5@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/bluez5_utils: expose more disable
 options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, All,

On 2021-07-26 23:07 +0200, Thomas Petazzoni spake thusly:
> On Mon, 26 Jul 2021 22:12:42 +0200
> Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:
> > BlueZ builds a lot of Classic BT profiles by default but allows
> > to disable them. This is especially handy when only BLE is needed
> > and enabled in the kernel.
> > 
> > Otherwise this yields warnings like this on bootup:
> > 
> >  profiles/network/bnep.c:bnep_init() kernel lacks bnep-protocol support
> >  src/plugin.c:plugin_init() System does not support network plugin
> > 
> > Also it allows to disable btmon which should not be needed on
> > production systems and is ~800KB in size.
> > 
> > Expose those options but default to 'y' to no break existing
> > configurations.
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> > ---
> >  package/bluez5_utils/Config.in       | 36 ++++++++++++++++++++++++
> >  package/bluez5_utils/bluez5_utils.mk | 41 ++++++++++++++++++++++++++++
> >  2 files changed, 77 insertions(+)
> 
> Applied to master, thanks.
> 
> Arnout, Peter, Yann: in order to preserve backward compatibility,
> Michael has created those new options with a "default y". However,
> while it keeps backward compatibility, it also means that all new users
> will get a more bloated bluez_utils installation than is probably
> necessary. Should we break our backward compatibility rule here and
> drop the "default y" on those new options ?

My opinion is to just drop the 'default y', yes.

We always say that this backward compatibility is being nice to users.
But users who upgrade *must* pay attention to what they do, and I am of
the opinion that this should not be made too easy. Easy enough, yes; too
easy, no.

There are so many things that have to be checked anyway, that we can not
provide for. For example, if the licensing terms of a package changed,
we have no way to propagate that info to the user. Yes, we provide them
with the new terms, but we are not telling them they changed.

Also, the "core" settings, like optimisation, hardening, et al. did
change, but we don't tell users; they have to verify that by themselves.

And when a package brings in a new dependency, we don't tell them
either; they just get that new library that maybe they previously were
fine not having, while now they no longer have the choice...

And changes to the package options are most probably the easiest to
discover: a config that used to build no longer builds because of a
library that is now optionally built, or does not run as expected
because a program is now missing...

And in three years time, we will have a set of Config.in files crippled
because of the excuse that some user rarely upgrade and we just want to
support them... No, thanks. ;-)

That's the same for legacy: how much sensible is it for people to
upgrade in one big leap from a more than 5-year old version to the
latest one? That's is going to be so disruptive that legacy is the
least of the annoyance they will have to face... Upgrading should be
done in small leaps. Even upgrading from one LTS to the next is just a
daunting task... For example, I always upgrade to each intermediate
release and, at the very least, review the configuraton there, resorting
to actual builds and full-CI tests to double check the new version did
not break anything (it always do break some thing or some other)...

For legacy, we do have a central location, so it gets easy to remove
after a while, while for the 'default y', they are scattered everywhere
around the code that it will be impossible to track down...

And then, when we eventually decide to remove them, we won't be able to
do so anyway, because of the excude that existing defconfig files would
now break... :-/

Enough of my ranting, then: "say no to default y". ;-]

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
