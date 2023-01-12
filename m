Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FC6C54EBD
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 10:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0BCD60B48;
	Thu, 12 Jan 2023 10:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0BCD60B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qA2FAhiY4Ndg; Thu, 12 Jan 2023 10:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3487360B24;
	Thu, 12 Jan 2023 10:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3487360B24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42FD91BF476
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 10:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DF618143A
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 10:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DF618143A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifZruoXCey-j for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 10:20:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA12C81434
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA12C81434
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 10:20:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E39761BF20D;
 Thu, 12 Jan 2023 10:20:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pFuhO-002dvh-Og; Thu, 12 Jan 2023 11:20:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230105015759.63582-1-nhed+buildroot@starry.com>
 <20230105015759.63582-2-nhed+buildroot@starry.com>
 <20230107201526.GA151997@scaer>
Date: Thu, 12 Jan 2023 11:20:42 +0100
In-Reply-To: <20230107201526.GA151997@scaer> (Yann E. MORIN's message of "Sat, 
 7 Jan 2023 21:15:26 +0100")
Message-ID: <87k01sf405.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] core: Use of percent_defconfig seems to
 impact performance
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
Cc: Nevo Hed <nhed+buildroot@starry.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Nevo, All,
 > On 2023-01-04 20:57 -0500, Nevo Hed via buildroot spake thusly:
 >> Noticed a significant slowdown with rise of number of external trees
 >> in our env.  This slowdown seemed to be related to invocations if the
 >> percent_defconfig function (GNU Make 4.3).
 >> 
 >> While I have not do a deep dive in analyzing the performance issue, it
 >> felt like redefining the %_defconfig rule N times impact performance.
 >> 
 >> This patch makes %_defconfig a single rule which combines uses the
 >> first return of a wildcard expression.
 >> 
 >> Timing (seconds) of `make pc_x86_64_bios_defconfig` with 1-8 external
 >> trees:
 >> 
 >> #Trees    Before    After
 >> 1      0.38     0.37
 >> 2      0.32     0.31
 >> 3      0.31     0.33
 >> 4      0.36     0.32
 >> 5      0.45     0.35
 >> 6      1.26     0.36
 >> 7      9.10     0.36
 >> 8     85.93     0.42
 >> 
 >> Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>

 > Thanks for the respin, I like it better than your first iteration, and
 > most importantly, better than my own implementation!

 > I however used most of my commit log, a=exteneded it even further,
 > provided my reproducibility script in the commit log and redid the
 > timings up to 1000 trees (heck, it's manageable now, so why not!).

 > I also slightly reformatted the code, to split the long lines.

 > Finally, I also added David as the reporter, and that his bug #14996
 > is now fixed.

 > Applied to master, thanks.

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
