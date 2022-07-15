Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4429C43334
	for <buildroot@archiver.kernel.org>; Fri, 15 Jul 2022 00:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15A886101B;
	Fri, 15 Jul 2022 00:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A886101B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2BCtGDvAP8u; Fri, 15 Jul 2022 00:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE2A560A75;
	Fri, 15 Jul 2022 00:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE2A560A75
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65DB11C11A9
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 00:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3786A60A75
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 00:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3786A60A75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzHmeA7x4rUZ for <buildroot@lists.busybox.net>;
 Fri, 15 Jul 2022 00:47:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71A25606EC
 for <buildroot@uclibc.org>; Fri, 15 Jul 2022 00:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71A25606EC
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id F276D82A38; Fri, 15 Jul 2022 00:34:03 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 15 Jul 2022 00:47:21 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmorici@dev295.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14886-163-LqkJMXHf6D@https.bugs.busybox.net/>
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

--- Comment #3 from Pete Morici <pmorici@dev295.com> ---
    I was able to solve this by enabling the LDSO_CACHE_SUPPORT option in
uclibc via a configuration fragment and then patching the file
Lib/ctypes/util.py in the python3 package to change the mapping of "x86_64-64"
from "libc6,x86_64" to "libc0".  I wasn't able to find a way to generate the
cache file during the build process so you have to run ldconfig on first boot,
you could use and init script, before using Python to generate /etc/ls.so.cache
and then ctypes will work correctly.

    The crux of the issue is that, on Linux, Python's ctypes module just isn't
compatible with anything except glibc because is explicitly looks for "libc6"
and other glibc specific items in the output of ldconfig -p which is uses to
resolve paths to libraries loaded with ctypes.  If you are using uclibc, of
musl you are going to run into this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
