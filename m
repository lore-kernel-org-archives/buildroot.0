Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D074C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 06:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06D4982FCB;
	Wed, 17 Aug 2022 06:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06D4982FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUEK8dkdWKTA; Wed, 17 Aug 2022 06:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D36882F77;
	Wed, 17 Aug 2022 06:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D36882F77
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6AD61BF9C6
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1CAE82F77
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1CAE82F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ibc9fL1f93ZQ for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 06:50:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 753B382F19
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 753B382F19
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 06:50:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 15E9A240005;
 Wed, 17 Aug 2022 06:50:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oOCsY-00Bx8L-4D; Wed, 17 Aug 2022 08:50:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20220725094456.15051-1-romain.naour@smile.fr>
Date: Wed, 17 Aug 2022 08:50:14 +0200
In-Reply-To: <20220725094456.15051-1-romain.naour@smile.fr> (Romain Naour's
 message of "Mon, 25 Jul 2022 11:44:56 +0200")
Message-ID: <87lern9xeh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gcc: disable split-stack for
 non-thread builds
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Since commit [1], the autobuilder script generate fully random
 > configurations that can triggers configuration that was not tested
 > before.

 > Here, the toolchain build with uClibc-ng without threads support
 > (BR2_PTHREADS_NONE=y) fail to build due to missing pthread.h header.

 > ../../../libgcc/generic-morestack-thread.c:42:10: fatal error: pthread.h: No such file or directory
 >    42 | #include <pthread.h>

 > This issue was actually fixed by this commit [2] adding a patch for
 > gcc 4.8, 4.9, 5.3. But it get lost when gcc 6 was added to Buildroot [3].

 > Since then the issue was present in Buildroot but has not been noticed.

 > [1] https://git.buildroot.net/buildroot-test/commit/?id=27b18dcb1686a98ce718b6a816e98f8505957a6c
 > [2] 2631219f648f4aa13fa36d06a483e4507cb6f3d7
 > [3] 519d83bfa0442439026db4e71e605a5c1347e566

 > Fixes:
 > http://autobuild.buildroot.org/results/5ec/5ec9eefacd27ef4fa73066013188796b43a30428
 > https://bugs.busybox.net/show_bug.cgi?id=8766

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.05.x and 2022.02.x (without the gcc 12.1.0 patch), thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
