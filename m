Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67524C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:48:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C8D60F02
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04C8D60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3E7640530;
	Tue,  3 Aug 2021 19:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEs-kE_rGW5N; Tue,  3 Aug 2021 19:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C7B140544;
	Tue,  3 Aug 2021 19:48:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 609351BF2E4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E53D400E7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytunaLAlHye4 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 19:48:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0FE440001
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 19:48:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c16b:768b:a985:c6d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 43F17B0053B;
 Tue,  3 Aug 2021 21:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628020087;
 bh=jNh6UJkXwQrcK5+HDMOEESyJiEX6pkBybCdt10r3ubI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RVGnKVRA0m/B1I0CYWFVQTPH4ZDEWiQ2S4ZIjmrPGofCXVvjWvwR7/xjRdw8VMzC6
 5hLJ2RGrISriv9rckdPHX4GMMAgXyEt95W9qwap4HjyUGhs6vytqgAyuv1DJvaev3U
 HELwytH/b9ryu0EeyVopn4S+nxTq4BNzA+gSsNIvjOLBki9CKEUEKgvAdVNWK4n5CN
 FmCDO+X1nT/hHrJMHCKRCJWbNs/EIM0Vtovl+8YKdP+9ArnGs2667fZc3Lzs+ny4tZ
 1k8X/SHShpGbp9VxORhbAuWly5ceL7Q9Nls0gTRr6urtzPCf/Q3XyvpxIzI+kBb0Jn
 OnVCRnC1uXiIw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Aug 2021 21:47:58 +0200
Date: Tue, 3 Aug 2021 21:47:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20210803194758.GH27036@scaer>
References: <20210802162244.620782-1-arnout@mind.be>
 <20210802162244.620782-2-arnout@mind.be>
 <20210803054842.GF27036@scaer>
 <4b68e8fc-81ce-d0f9-9337-df95eb3715ea@mind.be>
 <68f35ba6-c038-6d46-c4ea-ee0cbc46bceb@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68f35ba6-c038-6d46-c4ea-ee0cbc46bceb@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC 2/2] docs/manual/migrating.txt: add
 "individual packages" section
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Micheal, All,

On 2021-08-03 20:56 +0200, Michael Nosthoff spake thusly:
> On 03.08.21 17:19, Arnout Vandecappelle wrote:
> >On 03/08/2021 07:48, Yann E. MORIN wrote:
> >>On 2021-08-02 18:22 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> >>>Add a section to the migrating documentation to explain what changed in
> >>>individual packages and how it may affect your build.
[--SNIP--]
> >>Instead, I would just suggest that people run "git log --oneline" or
> >>"git log -p --stat" on the packages they are interested in.
> >  That's good advice as well. Simple "git log" should be sufficient though, if
> >the commit log is OK. "git log --oneline" is definitely not OK, because
> >important changes during a version bump will not appear in the oneline.
> >
> >  I'm going to add a bullet point for this and merge it into the first patch.
> 
> One thing I want to point out: The releases are tarballs. Should we assume
> the user has the git history available?

People are really still using tarballs in these days? ;-) But OK, you've
got a point.

However, I would still think that people who want to follow a process
when updating are probably already using buildroot a git submodule of
some sorts, so yes, they will have a git tree to look at.

People who use a released tarball are not really looking for a sustained
or long-term vision, and are not planning on upgrading.

So, I think we can state something like:

  - look at the CHANGES file, and run 'git log' on the packages of your
    interest; if you are not using git, clone the upstream repository
    for this.

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
