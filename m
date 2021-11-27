Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE43FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 21:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2422D80F2D;
	Sat, 27 Nov 2021 21:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCh4-e1UbeNf; Sat, 27 Nov 2021 21:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7197180F1D;
	Sat, 27 Nov 2021 21:32:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 119C01BF5A7
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 21:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C6264013E
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 21:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwVCzWs6dhPg for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 21:32:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A8A3400C7
 for <buildroot@uclibc.org>; Sat, 27 Nov 2021 21:32:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 2429C88CB2; Sat, 27 Nov 2021 21:28:07 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 27 Nov 2021 21:32:43 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.08.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: yann.morin.1998@free.fr
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14396-163-UtCiPyiOkS@https.bugs.busybox.net/>
In-Reply-To: <bug-14396-163@https.bugs.busybox.net/>
References: <bug-14396-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14396] GIthub schema is broken
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14396

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Olga, All,

Thanks for the report.

Indeed, this is very broken: for tags, github.com returns 404, while for
hashes, it returns 500. It sometimes also returns 502 or 504 in either
case.

> it's now:
> https://github.com/<user>/<project>/archive/refs/tags/<version>.tar.gz

This unfortunately does not work either: it returns 500:

    wget wget
https://github.com/google/googletest/refs/tags/release-1.11.0.tar.gz
    [...]
    HTTP request sent, awaiting response... 500 Internal Server Error

Another try a few minutes later yielded:

    HTTP request sent, awaiting response... 502 Bad Gateway

Besides, the URLs makes it look that it would anyway only work for tag, not
hashes.

Of course, this is not going to be easy to fix, and there does not seem like
there is an obvious fix anyway...

My opinion is that we should stop using the forges' archive mechanisms, which
have proved to be fluky in time, and use git for what it is and use git-clone
to retrieve git-hosted code (or svn et al.). This will however raise two
issues.
First, we have a lot (like a *lot*) of packages using the github macro; fixing
them is quite easy with a bit of sed, and manual review/tweaks in corner cases.
Second, this will trigger much bigger downloads, which can be a bit
overwhelming
for large repositories. That latter issue is smoothened by the use of the local
git cache, so this is only really a problem on the first download.

But right now, github.com seems to be having issues; it is very slow to return
any result, and even the website is very un-responsive... I'll try to
investigate
further tomorrow (GMT+1)...

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
