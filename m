Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD2BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAA7E60FB9;
	Tue,  7 Jun 2022 15:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V6FzPn6HqJuL; Tue,  7 Jun 2022 15:04:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D174160F30;
	Tue,  7 Jun 2022 15:03:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 300A01BF397
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C16982CFA
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9NqNggFgpNoF for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:03:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C810582C99
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:03:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CA8BFF823;
 Tue,  7 Jun 2022 15:03:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyakI-0009vc-BJ; Tue, 07 Jun 2022 17:03:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220602210421.426648-1-yann.morin.1998@free.fr>
Date: Tue, 07 Jun 2022 17:03:50 +0200
In-Reply-To: <20220602210421.426648-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 2 Jun 2022 23:04:21 +0200")
Message-ID: <87a6ao5xd5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] linux: disable -Werror when building host
 tools
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
Cc: Anders Pitman <buildroot@apitman.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > gcc-12 is starting to trickle down to some distros, like Archlinux.
 > gcc-12 has new warnings, and detects more cases of isues, like new
 > UAF cases, which is causing build issues in code that was previously
 > building fine, as reported in 14826:

 >     In file included from sigchain.c:3:
 >     In function 'xrealloc',
 >         inlined from 'sigchain_push.isra' at sigchain.c:26:2:
 >     subcmd-util.h:56:23: error: pointer may be used after 'realloc' [-Werror=use-after-free]
 >        56 |                 ret = realloc(ptr, size);
 >           |                       ^~~~~~~~~~~~~~~~~~
 >     subcmd-util.h:52:21: note: call to 'realloc' here
 >        52 |         void *ret = realloc(ptr, size);
 >           |                     ^~~~~~~~~~~~~~~~~~
 >     subcmd-util.h:58:31: error: pointer may be used after 'realloc' [-Werror=use-after-free]
 >        58 |                         ret = realloc(ptr, 1);
 >           |                               ^~~~~~~~~~~~~~~
 >     subcmd-util.h:52:21: note: call to 'realloc' here
 >        52 |         void *ret = realloc(ptr, size);
 >           |                     ^~~~~~~~~~~~~~~~~~

 > In that case, the kernel has already fixed their code, which is part of
 > 5.17:
 >     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=52a9dab6d892763b2a8334a568bd4e2c1a6fde66

 > However, we can't easily carry that patch, because we don't know
 > whether the kernel the user uses already has the fix ir not.

 > Instead, we can just tell the kernel to disable use of -Werror when
 > building host tools.

 > As a consequence, we can drop it from the perf-specific setting.

 > Fixes: #14826

 > Reported-by: Anders Pitman <buildroot@apitman.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
