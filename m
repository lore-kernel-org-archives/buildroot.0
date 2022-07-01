Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32436C43334
	for <buildroot@archiver.kernel.org>; Fri,  1 Jul 2022 06:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CBA083F25;
	Fri,  1 Jul 2022 06:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CBA083F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzQ5zqvTbyXq; Fri,  1 Jul 2022 06:58:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F0D783F17;
	Fri,  1 Jul 2022 06:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F0D783F17
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6234C1BF317
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 06:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AA1140195
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 06:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AA1140195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KcEn7WzxxmK8 for <buildroot@lists.busybox.net>;
 Fri,  1 Jul 2022 06:58:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BF1C40182
 for <buildroot@uclibc.org>; Fri,  1 Jul 2022 06:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BF1C40182
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 5D03786E4D; Fri,  1 Jul 2022 06:46:08 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 01 Jul 2022 06:58:53 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14886-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14886] New: Python ctypes find_library() not
 working correctly.
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

            Bug ID: 14886
           Summary: Python ctypes find_library() not working correctly.
           Product: buildroot
           Version: 2022.02.3
          Hardware: PC
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: pmorici@dev295.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

The find_library() function in the ctypes Python standard library is not
working properly.

  https://docs.python.org/3/library/ctypes.html#finding-shared-libraries

You can reproduce the issue by trying the following in the python shell...

>>> from ctypes.util import find_library
>>> find_library("c")

This should return the string "libc.so.0" but returns nothing, this is the same
for any library name I tried even though you can see the libraries are
installed and "ldconfig -v" lists the libraries.

This has the effect of causing libraries like pyusb to not work properly
because they reply on ctypes & find_library() to find libusb.

Digging a bit deeper on how find_library() works it calls either ldconfig -p,
ld, or gcc.  buildroot doesn't have ld or gcc installed so I assume that means
it is using "ldconfig -p".  ldconfig is part of the uclibc library and uclibc
has caching turned off in its configuration so ldconfig -p just prints a
message says, "Library cache disabled" instead of printing a list of libraries
and their absolute paths.

https://github.com/python/cpython/blob/main/Lib/ctypes/util.py

There is an option in the uclibc menuconfig to enable the cache
(LDSO_CACHE_SUPPORT) but when I did that it didn't seem to change anything. 
Any ideas how to fix this?

I'm using the pc_x86_64_efi_defconfig with Python enabled.  No other changes.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
