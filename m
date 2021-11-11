Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D707C433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 10:16:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C330B61261
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 10:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C330B61261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51AAF80FFA;
	Thu, 11 Nov 2021 10:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNVYxsTe4GgP; Thu, 11 Nov 2021 10:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AFC880FFE;
	Thu, 11 Nov 2021 10:16:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAE9E1BF955
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 10:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F6840502
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 10:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7RxXkum7aybw for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 10:16:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 796EF403F9
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 10:16:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d0bf:367b:1b33:f0cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F2E1113F8A7;
 Thu, 11 Nov 2021 11:15:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636625763;
 bh=py5XidEF3fzIQ+9H2bNcH+vSkw6t8as8dxGd3LnLEso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IGILcapQC4mgOd6ZSVBjYXMvrQuQZOeZxeby/4unV6ePhDFa4IqSx/22takqKk889
 dIKYii05rjiLvhXY1FaeeKw8Mk9FC0jxv3cnIVgC2H4tK4gUhT2ZwrTZvA3x9aiGv3
 RYjBkuaAT9vx0ABnep1dYUgeAbOoE7uFdmKBagCe//CBYNIn4ssh5aBGFPM2wdTmrQ
 xKMK2TZgnG7y3G1mSnH3WyDOE+b+RRNErR9iVEP1Jax+9hz4EofeSDywbA7b8pHUIF
 9nxbnowKq+GN2f26nwQqyQlcW8Ra2YnvD0I2n+kn2LTTdIx2V2Sgrssl1Ad4pnu5OC
 6F29qtyzVZoSg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 11:15:56 +0100
Date: Thu, 11 Nov 2021 11:15:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211111101556.GC2504300@scaer>
References: <20211109220328.388872-1-romain.naour@gmail.com>
 <20211111082548.GA2504300@scaer> <20211111110225.50c73fd9@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211111110225.50c73fd9@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 RFC] support/scripts: don't build board
 defconfigs with Gitlab's pipelines trigged on tag
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

Thomas, All,

On 2021-11-11 11:02 +0100, Thomas Petazzoni spake thusly:
> On Thu, 11 Nov 2021 09:25:48 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2021-11-09 23:03 +0100, Romain Naour spake thusly:
> > > In order to reduce the number of long jobs, don't build board
> > > defconfigs with pipelines trigged on tag, keeping only the runtime
> > > tests and the Qemu's defconfigs.
> > Applied to master, thanks.
> I hadn't had the chance to chime in on this one,

Sorry, I could have waited a bit more indeed...

> but I don't entirely
> agree with the change (I also don't entirely disagree!). Indeed, I
> believe we do want to have the results of the defconfigs builds on
> tags. If we missed something, and one of our release has defconfigs
> broken, we definitely want to know it and fix it.

On principle, I do agree with that, and that's what I initially coded in
that script.

> This disabling of defconfig builds is only done because there is an
> infrastructure issue. But really, from a proper QA/CI point of view, we
> really want to build the defconfigs on tags I think.

Again, agreed on principle.

But as Romain explained, that creates too much jobs when a tag is cut,
so much so that a lot of them do not even stand a chance to even start.

In that case, the CI is not usefull at all either.

On the other hand, the defconfigs are already built reasonably often,
every week, with a scheduled pipeline. It is thus pretty quick to notice
a build failure.

So, my opinion is that I prefer a partial CI that is stable and
dependable, where each failure is an actual failure, rather than a
full-range CI that has a very low SNR, where people eventually stop
caring about failure reports because they are often spurious failures.

Of course, we can reverse course on that commit; after all, that's what
git-revert is for! ;-)

The better course of action, obviously, would be to have an infra that
is strong enough to absorb all that load when we push a tag, but that's
an order of magnitude more complex to achieve.

One thing, though: maybe some of the runners could be configured to
accept more jobs at once, so even if each job then takes longer to run,
we start them faster and thus do not hit the 24-hour blockage limit.

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
