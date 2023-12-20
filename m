Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F98C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 18:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E314E61534;
	Wed, 20 Dec 2023 18:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E314E61534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlnaD_Wd9liD; Wed, 20 Dec 2023 18:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4866960FFA;
	Wed, 20 Dec 2023 18:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4866960FFA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4134A1BF3BD
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 18:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B068143D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 18:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26B068143D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkfuX7yuuUdl for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 18:35:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0069F81417
 for <buildroot@uclibc.org>; Wed, 20 Dec 2023 18:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0069F81417
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id E303F87C2E; Wed, 20 Dec 2023 18:35:30 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 20 Dec 2023 18:35:30 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.08
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-15895-163-G8FFnxbTBr@https.bugs.busybox.net/>
In-Reply-To: <bug-15895-163@https.bugs.busybox.net/>
References: <bug-15895-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15895] glibc version 'GLIBC_VERSION' does not
 match released glibc version
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

https://bugs.busybox.net/show_bug.cgi?id=15895

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998@free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Peter, All,

As for the reason why we use such a version string, one can read the fine
details in that very good (as usual) LWN article; it dates back 4 years
now, but the reasons are still the same, and boils down to the fact that
glibc does not do dot-releases:
    https://lwn.net/Articles/736429/

So, rather than backport all and every patch going on the maintenance
branch, we sinply choose the latest commit on said branch whenever there
is a reason to update the version.

I understand that this does not help with CPE/CVE identification, but as
Thomas points out, we have a way out, something along the lines of:

    GLIBC_VERSION_MAJOR = 2.38
    GLIBC_VERSION_MINOR = 27-g750a45a783906a19591fb8ff6b7841470f1f5701
    GLIBC_VERSION = $(GLIBC_VERSION_MAJOR)-$(GLIBC_VERSION_MINOR)

    GLIBC_CPE_ID_VERSION = $(GLIBC_VERSION_MAJOR)
    # CVE-YYYY-XXXXXX fixed in [sha1 of commit fix]
    GLIBC_IGNORE_CVES += CVE-YYYY-XXXXX
    # CVE-YYYY-XXXXXX fixed in [sha1 of commit fix]
    GLIBC_IGNORE_CVES += CVE-YYYY-XXXXX

and so on... It is indeed a bit tedious, but we have to play with whatever
cards upstream dealt us; in this case, no dot-release.

It would be awesome if you were willing to submit such a patch!

Regards,
Yann e. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
