Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214A0C6FA8E
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 22:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D62C821CA;
	Fri, 24 Feb 2023 22:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D62C821CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9Ukg2_436OZ; Fri, 24 Feb 2023 22:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B50820A8;
	Fri, 24 Feb 2023 22:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1B50820A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 550061BF574
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 22:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E3FB61217
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 22:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E3FB61217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oimlefHmOXbW for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 22:00:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C640610E4
 for <buildroot@uclibc.org>; Fri, 24 Feb 2023 22:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C640610E4
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4A2EA86A19; Fri, 24 Feb 2023 22:00:19 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 24 Feb 2023 22:00:19 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.8
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contact@jookia.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15181-163-o1O1GIOZhd@https.bugs.busybox.net/>
In-Reply-To: <bug-15181-163@https.bugs.busybox.net/>
References: <bug-15181-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15181] Building libcurl fails due to faulty
 package definition
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

https://bugs.busybox.net/show_bug.cgi?id=15181

--- Comment #2 from Jookia <contact@jookia.org> ---
My friend Xogium hit this issue this month and after a few debugging sessions
we tracked this down. Here's what I've found:

- Arch Linux's host toolchain now sets runpath instead of rpath
- libcurl sets LD_LIBRARY_PATH to /lib:/usr/lib
- Buildroot pkgconf and Arch Linux pkgconf versions line up
- Arch Linux pkgconf library is installed to /usr/lib/libpkgconf.so
- Buildroot pkgconf uses the host libpkgconf.so due to LD_LIBRARY_PATH
- this is respected because rpath does not override it
- The Buildroot pkg-conf script sets LIBPATH to build/host/bin/../sysroot/...
and SYSROOT to build/host/sysroot
- pkgconf 1.8 silently ignores LIBPATH if it's outside sysroot
- pkgconf 1.8 does not normalize paths
- pkgconf reverted LIBPATH to the one in the host's libpkg.so, /lib and
/usr/lib
- curl build tries to find openssl but can't

Two fixes are needed:

- libcurl build should not set LD_LIBRARY_PATH
- the pkg-config wrapper should use normalized paths

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
