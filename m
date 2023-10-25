Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA83C0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 21:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBEA9405E1;
	Wed, 25 Oct 2023 21:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBEA9405E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o-Aq-asi9wLT; Wed, 25 Oct 2023 21:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7BFD405D1;
	Wed, 25 Oct 2023 21:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7BFD405D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C80E1BF377
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 21:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 033F2405D1
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 21:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 033F2405D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 91M6uRC0Zl0n for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 21:46:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 079DD405A9
 for <buildroot@uclibc.org>; Wed, 25 Oct 2023 21:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 079DD405A9
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id E830285EDF; Wed, 25 Oct 2023 21:46:44 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 25 Oct 2023 21:46:44 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.4
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kadir.c.yilmaz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14931-163-fCOPEuzNur@https.bugs.busybox.net/>
In-Reply-To: <bug-14931-163@https.bugs.busybox.net/>
References: <bug-14931-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14931] package/qt5/qt5webengine: build fails with
 unicode/uchar.h not found
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

https://bugs.busybox.net/show_bug.cgi?id=14931

--- Comment #5 from Kadir Yilmaz <kadir.c.yilmaz@gmail.com> ---
I have just submitted a patch to this  bug:

https://lists.buildroot.org/pipermail/buildroot/2023-October/677826.html

It manifests itself in 2 ways:

- If the build host has unicode/uchar.h in default include dirs, e.g. on 
ubuntu /usr/include/unicode/uchar.h provided by libicu-dev package, build finds
the header and later on linking fails.

- Otherwise fails with the error described in this bug.

By removing "webengine-icu" config option qt5webengine, build uses the one
bundled in qt, which addresses at least the build failure.

Here are the some hints in qt config files:

qtwebengine/src/core/configure.json:16:            "webengine-icu": { "type":
"enum", "name": "webengine-system-icu", "values": { "system": "yes", "qt": "no"
} },

qtwebengine/config_help.txt:8:  -webengine-icu ................. Use system ICU
libraries [system/qt]

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
