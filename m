Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F84C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 21:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD38182D12;
	Wed,  4 May 2022 21:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fS0M68wvz1pC; Wed,  4 May 2022 21:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E018274E;
	Wed,  4 May 2022 21:48:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07E6E1BF8B4
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 21:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA74440A06
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 21:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_STES5e43er for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 21:48:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D6A240961
 for <buildroot@buildroot.org>; Wed,  4 May 2022 21:48:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D9C7E200002;
 Wed,  4 May 2022 21:48:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nmMqu-00E1dz-Ma; Wed, 04 May 2022 23:48:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Fainelli <f.fainelli@gmail.com>
References: <20220504182038.1828037-1-f.fainelli@gmail.com>
 <87wnf1106v.fsf@dell.be.48ers.dk>
 <43e15313-c8b8-f549-089b-eb3cbb5943f4@gmail.com>
Date: Wed, 04 May 2022 23:48:08 +0200
In-Reply-To: <43e15313-c8b8-f549-089b-eb3cbb5943f4@gmail.com> (Florian
 Fainelli's message of "Wed, 4 May 2022 14:06:17 -0700")
Message-ID: <87sfpp0y1z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package: Add cpulimit
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
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com, mmayer@broadcom.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Florian" == Florian Fainelli <f.fainelli@gmail.com> writes:

Hi,

 >> > +Subject: [PATCH] Fix crash (and compiler warnings)
 >> > +
 >> > +Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
 >> > +---
 >> > + src/cpulimit.c                | 2 +-
 >> > + src/process_group.c           | 4 ++++
 >> > + tests/process_iterator_test.c | 2 +-
 >> > + 3 files changed, 6 insertions(+), 2 deletions(-)
 >> > +
 >> > +diff --git a/src/cpulimit.c b/src/cpulimit.c
 >> > +index 50eabeacf214..42d7ca280738 100644
 >> > +--- a/src/cpulimit.c
 >> > ++++ b/src/cpulimit.c
 >> > +@@ -43,7 +43,7 @@
 >> > + #include <sys/types.h>
 >> > + #include <sys/wait.h>
 >> > +
 >> > +-#ifdef __APPLE__ || __FREEBSD__
 >> > ++#if defined(__APPLE__) || defined(__FREEBSD__)
 >> > + #include <libgen.h>
 >> > + #endif
 >> Why is this patch interesting in the context of Buildroot?
 >> Presumably
 >> neither __APPLE__ or __FREEBSD__ will be defined?

 > Right, neither would be defined and therefore we would get the
 > following build warning:

 > /usr/include/x86_64-linux-gnu/sys/sysctl.h:21:2: warning: #warning
 > "The <sys/sysctl.h> header is deprecated and will be removed." [-Wcpp]
 >    21 | #warning "The <sys/sysctl.h> header is deprecated and will be
 >    removed."
 >       |  ^~~~~~~
 > cpulimit.c:46:18: warning: extra tokens at end of #ifdef directive
 >    46 | #ifdef __APPLE__ || __FREEBSD__
 >       |                  ^~

Ok, so it is about the 2nd warning? The commit message mentioned
something about a crash, which sounded odd to me.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
