Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CE1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985BA422DD;
	Sun, 12 Dec 2021 22:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lidJYBEhBd0P; Sun, 12 Dec 2021 22:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15377422D2;
	Sun, 12 Dec 2021 22:53:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9481BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C955422D1
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yeibrHbpHojd for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:53:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47817422D0
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:53:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7DAB7E0005;
 Sun, 12 Dec 2021 22:53:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwXiT-0003o4-Rj; Sun, 12 Dec 2021 23:53:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20211205155459.5E65A801F0@busybox.osuosl.org>
Date: Sun, 12 Dec 2021 23:53:13 +0100
In-Reply-To: <20211205155459.5E65A801F0@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sun, 5 Dec 2021 16:55:44 +0100")
Message-ID: <87czm1toyu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/mkpasswd: define
 _DEFAULT_SOURCE to suppress compiler warning
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=9616ade22234ad3c8316b7450749a5b371a5c566
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > We define _DEFAULT_SOURCE in mkpasswd.c to suppress a compiler warning.

 > In file included from /usr/include/x86_64-linux-gnu/bits/libc-header-start.h:33,
 >                  from /usr/include/stdio.h:27,
 >                  from [...]/buildroot/output/arm64/build/host-mkpasswd/mkpasswd.c:24:
 > /usr/include/features.h:187:3:
 >   187 | # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
 >       |   ^~~~~~~

 > As per GLIBC 2.20 release notes[1]:

 >     The _BSD_SOURCE and _SVID_SOURCE feature test macros are no longer
 >     supported; they now act the same as _DEFAULT_SOURCE (but generate a
 >     warning). Except for cases where _BSD_SOURCE enabled BSD interfaces
 >     that conflicted with POSIX (support for which was removed in 2.19),
 >     the interfaces those macros enabled remain available when compiling
 >     with _GNU_SOURCE defined, with _DEFAULT_SOURCE defined, or without
 >     any feature test macros defined.

 > [1] https://lwn.net/Articles/611162/

 > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
