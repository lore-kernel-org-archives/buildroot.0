Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2114C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 14:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD06784490;
	Tue,  4 Jun 2024 14:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6HqMB74IoJZ; Tue,  4 Jun 2024 14:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A81E584501
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A81E584501;
	Tue,  4 Jun 2024 14:06:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BA3A1BF869
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7668584501
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJ8_eiqDhpLC for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 14:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9954F84557
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9954F84557
 for <buildroot@uclibc.org>; Tue,  4 Jun 2024 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 8201B86A7F; Tue,  4 Jun 2024 14:06:07 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 04 Jun 2024 14:06:07 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lancethepants@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16093-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16093] New: kmod and gcc-14 build error
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

https://bugs.busybox.net/show_bug.cgi?id=16093

            Bug ID: 16093
           Summary: kmod and gcc-14 build error
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: lancethepants@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Trying out 2024.05-rc1 ran into this issue when using gcc-14. Minimum defconfig
below. I saw a patch in patchwork, but it wasn't gcc-14 related and didn't work
here when applying it.

libkmod/libkmod-config.c: In function 'conf_files_insert_sorted':
libkmod/libkmod-config.c:797:24: error: implicit declaration of function
'basename' [-Wimplicit-function-declaration]
  797 |                 name = basename(path);
      |                        ^~~~~~~~
libkmod/libkmod-config.c:797:24: warning: nested extern declaration of
'basename' [-Wnested-externs]
libkmod/libkmod-config.c:797:22: error: assignment to 'const char *' from 'int'
makes pointer from integer without a cast [-Wint-conversion]
  797 |                 name = basename(path);
      |                      ^
make[3]: *** [Makefile:1771: libkmod/libkmod-config.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
shared/util.c: In function 'path_to_modname':
shared/util.c:177:19: error: implicit declaration of function 'basename'
[-Wimplicit-function-declaration]
  177 |         modname = basename(path);
      |                   ^~~~~~~~
shared/util.c:177:19: warning: nested extern declaration of 'basename'
[-Wnested-externs]
shared/util.c:177:17: error: assignment to 'char *' from 'int' makes pointer
from integer without a cast [-Wint-conversion]
  177 |         modname = basename(path);


BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_KERNEL_HEADERS_6_6=y
BR2_BINUTILS_VERSION_2_42_X=y
BR2_GCC_VERSION_14_X=y
BR2_PACKAGE_KMOD=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
