Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D35C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 02:58:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 621A761054
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 02:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 621A761054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED66E402A3;
	Fri,  3 Sep 2021 02:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kcJVPR8iFSA; Fri,  3 Sep 2021 02:58:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13877400D8;
	Fri,  3 Sep 2021 02:58:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2471BF331
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 02:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B38983684
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 02:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLbOqGGUdTYl for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 02:58:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A47F8367B
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 02:58:27 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id gf5so2423474qvb.9
 for <buildroot@busybox.net>; Thu, 02 Sep 2021 19:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KeJbkcEz+l5/nQoBLgFO64teqKQM+OPTDiuie/I0vrw=;
 b=BV5oV353IYlZyCE+H3jf0/RD9ikSnzog3px8mu928vcZz0gc+OOXmZ5L3RL2OifMNU
 EC5pWJmC79601pFMfNO6td/YAbQfQZGgkgHNB9M/ofLo1Q7eNiEdJ7rOYUMUE1R/N7qG
 ffZD7iTA6egRsN4YnQQ+I/x3pLzJoGXGpjPUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KeJbkcEz+l5/nQoBLgFO64teqKQM+OPTDiuie/I0vrw=;
 b=lu38ZcwI+FALIK7MHzIJAdyQLtf25e4DwfUY/3RTdpKqRFw7bAoopjeHgVNuy52fa7
 JxI+BkbfnyzBu5N+nPvzEH7SXcIoO12xqz1FL0yeKu8id5JDqNO/7xfqkLAUG767DQkA
 MeKEPjWdJU5hssAeknRNzgs3zRybgpWZ4WlcMtG1PQ1LFqiRUzrMa7FR5YZF/q/Mf0qb
 br3iIXmjImfB5tRPf5UyyuGgJVNmz1GWxE8bDCa7BCjTN3D1LnZUfr74X87LXh+y20aI
 vLeJ9sRKMr3gpVXojd3+sGvLdyCc7Mymz1umJYS+KDeXyTSlmXZA2vnG6BcZVWRXBnPp
 ZXKQ==
X-Gm-Message-State: AOAM533ZT9wlVwc4nZZrCbgyWO4yql4LKp+fDJwQ4NHXkzaLDF4tVXWl
 /c1FeQCD4v9aN8axrce5DM7ByCxPrXnp3862Uus=
X-Google-Smtp-Source: ABdhPJwXnO3gNLVgmiC68UCXFRC+02wThOqeXaFdm9SPrnNPdk/ej57TB3LsOBzo33pQogYKq3fhj3hAE0nK578tAGk=
X-Received: by 2002:a05:6214:371:: with SMTP id
 t17mr1452268qvu.55.1630637906074; 
 Thu, 02 Sep 2021 19:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <YS/GToWU8Wx8XOR6@pevik>
 <CACPK8XcMS1nW446xL--CLShQTZA0opSNE4Yr_cnY1Ayh3vYe=A@mail.gmail.com>
 <20210903092217.7f02055a@canb.auug.org.au>
 <e65b04b32ae2d249310cdd85647e2a69321f8275.camel@ozlabs.org>
 <20210903105610.790366ac@canb.auug.org.au>
In-Reply-To: <20210903105610.790366ac@canb.auug.org.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Sep 2021 02:58:13 +0000
Message-ID: <CACPK8XeXgXtf69BW1f4xQOrixt2OAzXNsCqFaa+zDNeWqfkomA@mail.gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [Buildroot] What's wrong with patchwork
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Fri, 3 Sept 2021 at 00:56, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Jeremy,
>
> On Fri, 03 Sep 2021 08:40:58 +0800 Jeremy Kerr <jk@ozlabs.org> wrote:
> >
> > Looking through the mail logs, I see there seems to be a period of time
> > where no messages were received by the patchwork feed (for buildroot),
> > at the SMTP level. Message counts by day:
> >
> >   2021-08-31: 37
> >   2021-09-01: 44
> >   2021-09-02: 14
> >   2021-09-03: 0
> >   04 - now  : 51
> >
> > Stephen, I assume all has been OK with the SMTP server? Buildroot folks,
> > has anything happened with delivery through the list?
>
> We received no emails for incoming-buildroot -at- patchwork.ozlabs.org
> during the 24 hours to 6:45 am today (GMT+10), but we did receive
> emails for some other lists from the same mail host.

I just noticed that my buildroot list filter is no longer working. The
listid used to be:

List-Id: Discussion and development of buildroot <buildroot.busybox.net>

but now it is set to:

List-Id: Discussion and development of buildroot <buildroot.lists.buildroot.org>

It looks like buildroot list changed domains recently. Perhaps the
subscription for incoming-buildroot@ didn't get moved over to the new
setup?

Cheers,

Joel
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
