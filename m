Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB761C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 15:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3446841872;
	Wed, 15 Mar 2023 15:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3446841872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Ysh83uk5PGN; Wed, 15 Mar 2023 15:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 583E4417B1;
	Wed, 15 Mar 2023 15:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 583E4417B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4B41BF95F
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 15:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E81A9415D6
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 15:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E81A9415D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lddWstk7EQj6 for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 15:04:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA1EF417B1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA1EF417B1
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 15:04:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 18F7C1BF205;
 Wed, 15 Mar 2023 15:04:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pcSfd-002ASa-8e; Wed, 15 Mar 2023 16:04:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230308180751.20525-1-fontaine.fabrice@gmail.com>
Date: Wed, 15 Mar 2023 16:04:05 +0100
In-Reply-To: <20230308180751.20525-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 8 Mar 2023 19:07:51 +0100")
Message-ID: <87lejy12fu.fsf@dell.be.48ers.dk>
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

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
