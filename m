Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9F4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 16:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B86FF82D14;
	Sun, 28 Nov 2021 16:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjuOfTBz4B3a; Sun, 28 Nov 2021 16:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A92882CF9;
	Sun, 28 Nov 2021 16:28:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58A591BF45A
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 16:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 482A982CAC
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 16:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDsH5h0TJx_j for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 16:28:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7400A82B81
 for <buildroot@uclibc.org>; Sun, 28 Nov 2021 16:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id A50D390981; Sun, 28 Nov 2021 16:23:22 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 28 Nov 2021 16:28:01 +0000
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
Message-ID: <bug-14396-163-OVDD6QxI0J@https.bugs.busybox.net/>
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

--- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Jens Maus from comment #6)
> there are a lot of CI driven build environments out there (like in my case)
> where no git cache environment is available, thus packages are always freshly
> downloaded

Yes, sure, this was the reason for the github helper macro in the first place.

But if Github changes their download scheme (that's not the first time), there
is no way we can have our releases that are not broken at some point. For
example, 2021.02.7 (latest LTS release) is now broken, 2021.08.2 (latest
maintenance release) is now broken.

And if we have no way to detect whether we need the hash scheme, or the tag
scheme, what is the alternate option?

(In reply to Olga from comment #2)
> The bluntest solution is to define <PACKAGE>_SOURCE for each package as
> something like release-$(PACKAGE_VERSION).tar.gz,

For some packages, the tag is exactly the version string, for others a
leading 'v' is added, others have a custom, non-standard prefix (like gtest,
which has 'release-').

But such a mass fixup is not very nice... It needs carefull sed replacements
and a lot of review time to catch corner cases... We should try and find
another solution...

> but that means that all mirrors of those packages will fail and have to
> be rebuilt.

sources.buildroot.org is automatically rebuilt, so that is not an issue for
us. Others whi maintain their own mirror, will have to, well, just maintain
it by opushing the new archives as needed. ;-)

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
