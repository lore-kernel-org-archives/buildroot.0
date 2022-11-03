Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFE0C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91E2140297;
	Thu,  3 Nov 2022 13:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91E2140297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cj2igjjFa2rm; Thu,  3 Nov 2022 13:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 916B5404A1;
	Thu,  3 Nov 2022 13:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 916B5404A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 654EE1BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40A3081EB5
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A3081EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ykuXDMkeyHN for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:49:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC03480A9E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC03480A9E
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:49:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9E89340005;
 Thu,  3 Nov 2022 13:49:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqaaf-00AWz9-Q4; Thu, 03 Nov 2022 14:49:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <9796_1665746309_63494585_9796_388_2_2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
Date: Thu, 03 Nov 2022 14:49:05 +0100
In-Reply-To: <9796_1665746309_63494585_9796_388_2_2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
 (yann morin's message of "Fri, 14 Oct 2022 13:18:25 +0200")
Message-ID: <87pme4p2r2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] Makefile: really generate glibc locales
 in parallel
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > To generate the glibc locale data, we call into a recursive Makefile,
 > so as to generate locales in parallel. This is done as part of a
 > target-fialize hook.

 > However, that hook is registered after all packages have been parsed,
 > and as such, it maye be registered after hooks defined in packages.

 > Furthermore, the expansion of target-finalize hooks is done in a recipe,
 > so it is not easy to understand whether this generates a "simple" rule
 > or not.

 > As a consequence, despite the use of $(MAKE), make may not notice that
 > the command is a recursive call, and will decide to close the jobserver
 > file-descriptors, yieldiong warnings like:
 >     make[2]: warning: jobserver unavailable: using -j1.  Add '+' to
 >     parent make rule.

 > This causes the lcoale data to not be generated in parallel, which is
 > initially all the fuss about using a sub-makefile...

 > So, do as suggested, and prepend the hook with a '+', so that it
 > isexplicit to make that it should not close its jobserver fds.

 > Fixes: 6fbdf5159607 (Makefile: Parallelize glibc locale generation)

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Gleb Mazovetskiy <glex.spb@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
