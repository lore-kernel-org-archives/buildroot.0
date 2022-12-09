Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3647C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 15:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DDBE40FFC;
	Fri,  9 Dec 2022 15:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DDBE40FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAx4x-A7mP62; Fri,  9 Dec 2022 15:44:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B150A40FDE;
	Fri,  9 Dec 2022 15:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B150A40FDE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E2FA1BF3DA
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 15:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2927281DFB
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 15:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2927281DFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvEtWJYeGQfx for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 15:44:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE75181D7D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE75181D7D
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 15:44:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 776FA40007;
 Fri,  9 Dec 2022 15:44:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p3fXb-002e6N-Em; Fri, 09 Dec 2022 16:43:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221204094829.148341-1-fontaine.fabrice@gmail.com>
Date: Fri, 09 Dec 2022 16:43:59 +0100
In-Reply-To: <20221204094829.148341-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 4 Dec 2022 10:48:29 +0100")
Message-ID: <87leng1t1c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-scipy: fix sh4 build
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following sh4 build failure raised since the addition of the
 > package in commit e10431db29e08c3ae56c145165bf110bd17f2a6c:

 > INFO: sh4aeb-linux-gcc: scipy/special/_test_round.c
 > scipy/special/_test_round.c: In function '__pyx_pf_5scipy_7special_11_test_round_have_fenv':
 > scipy/special/_test_round.c:2353:30: error: 'FE_UPWARD' undeclared (first use in this function)
 >  2353 |     __pyx_t_1 = ((fesetround(FE_UPWARD) != 0) != 0);
 >       |                              ^~~~~~~~~

 > Retrieve debian patch as upstream doesn't want to fix this SH4 specific
 > issue: https://github.com/scipy/scipy/issues/15584

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b82d8ed02ba5d094a0d4054e0de28e95c9d3554d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
