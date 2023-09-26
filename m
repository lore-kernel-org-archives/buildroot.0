Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAE4E7D268
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 08:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD38822B1;
	Tue, 26 Sep 2023 08:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BD38822B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i08mI8qId0rh; Tue, 26 Sep 2023 08:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E041E822AF;
	Tue, 26 Sep 2023 08:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E041E822AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 563E91BF296
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 08:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3692B405AF
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 08:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3692B405AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVK9NNF-naS7 for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 08:53:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A3B1400EF
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 08:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A3B1400EF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2594B24000A;
 Tue, 26 Sep 2023 08:53:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ql3oi-0033B1-Qt; Tue, 26 Sep 2023 10:53:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230923160411.3662885-1-mail@jens-maus.de>
 <20230924095619.GG1469982@scaer>
Date: Tue, 26 Sep 2023 10:53:16 +0200
In-Reply-To: <20230924095619.GG1469982@scaer> (Yann E. MORIN's message of
 "Sun, 24 Sep 2023 11:56:19 +0200")
Message-ID: <87msx9uxhf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/nodejs: fix parallel build
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
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>,
 Jens Maus <mail@jens-maus.de>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Jens, All,
 > On 2023-09-23 18:04 +0200, Jens Maus via buildroot spake thusly:
 >> In ninja-based nodejs builds performing parallel builds using "make -jX"
 >> is not working during buildroot initiated builds because the JOBS
 >> variable is not set in the MAKE_OPTS variables in nodejs.mk. This commit
 >> remedies the issue by setting JOBS to BR2_JLEVEL.

 > I was very confused that nodejs would not build in parallel; that would
 > have made for very, very,very long builds. And indeed, it does build in
 > parallel, in fact.

 > However, what it does, is use as many CPUs as are available, without
 > accounting for the value set by the user in BR2_JLEVEL, thus
 > overshooting the limits set by the user.

 > So, I reworded the whoe commit log to explain that.

 > Applied to master, thanks.

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
