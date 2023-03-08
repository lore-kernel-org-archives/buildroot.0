Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FE5C678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 20:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B78940520;
	Wed,  8 Mar 2023 20:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B78940520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t5j4P-Iv_T5K; Wed,  8 Mar 2023 20:33:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFD54404FF;
	Wed,  8 Mar 2023 20:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFD54404FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4D471BF426
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 20:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F575408AE
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 20:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F575408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ypZ7ZwsA8A2 for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 20:33:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 113D040438
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 113D040438
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 20:33:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 85ED2240002;
 Wed,  8 Mar 2023 20:33:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pa0Tp-005WBo-S6; Wed, 08 Mar 2023 21:33:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230308180751.20525-1-fontaine.fabrice@gmail.com>
Date: Wed, 08 Mar 2023 21:33:45 +0100
In-Reply-To: <20230308180751.20525-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 8 Mar 2023 19:07:51 +0100")
Message-ID: <87fsaf2dau.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: needs NPTL
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
Cc: Steve Kenton <skenton@ou.edu>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mpv unconditionally uses pthread_getcpuclockid since version 0.33.0 and
 > https://github.com/mpv-player/mpv/commit/fd3caa264ea0848e7e30db94390063c87e247003
 > resulting in the following build failure without NPTL since commit
 > e3cf26dda31e6c1720c53e0229d93fe2a5ea18aa:

 > ../common/stats.c: In function 'get_thread_cpu_time_ns':
 > ../common/stats.c:75:9: error: implicit declaration of function
 > 'pthread_getcpuclockid'; did you mean 'pthread_getspecific'?
 > [-Werror=implicit-function-declaration]
 >    75 |     if (pthread_getcpuclockid(thread, &id) == 0 &&
 >       |         ^~~~~~~~~~~~~~~~~~~~~
 >       |         pthread_getspecific

 > Fixes:
 >  - http://autobuild.buildroot.org/results/98cde5cbb0844c6ef483a75cf9a6f3fd3a46c693

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
