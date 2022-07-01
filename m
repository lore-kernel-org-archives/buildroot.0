Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D039C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Jul 2022 16:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF3E3418D1;
	Fri,  1 Jul 2022 16:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF3E3418D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAL4FOZtkgQt; Fri,  1 Jul 2022 16:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6BC418C8;
	Fri,  1 Jul 2022 16:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B6BC418C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1D641BF4D7
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 16:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABDFE403C2
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 16:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABDFE403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MDuj5vIC4dRd for <buildroot@lists.busybox.net>;
 Fri,  1 Jul 2022 16:55:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFB4C400EF
 for <buildroot@uclibc.org>; Fri,  1 Jul 2022 16:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB4C400EF
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id E0F8187868; Fri,  1 Jul 2022 16:42:43 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 01 Jul 2022 16:55:30 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pscheie@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14886-163-UPQI48kXcZ@https.bugs.busybox.net/>
In-Reply-To: <bug-14886-163@https.bugs.busybox.net/>
References: <bug-14886-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14886] Python ctypes find_library() not working
 correctly.
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

https://bugs.busybox.net/show_bug.cgi?id=14886

--- Comment #1 from Peter Scheie <pscheie@gmail.com> ---
I have seen this bug, too, in building an image for the Beaglebone Black.  It
appears in the iio package in the python binding: In iio.py, CDLL calls
find_library with the argument "iio" to get the name of the libiio.so.0
library, but fails.  Some folks on #beagle said using find_library() this way
was a bad idea because it produces unpredictable results (which I can attest
to).  Instead, it was recommended that CDLL be called with libiio.so.0
directly, removing find_libary().  This works and I am using a patch to
implement it.  BR currently uses version 0.19 of libiio but even in the most
current version, 0.24, it still uses find_library().

I tried find_library() on a few other libs and got the same None result.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
