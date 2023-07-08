Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F188FEB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 23:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C7C981E66;
	Sat,  8 Jul 2023 23:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C7C981E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EwvLip7h8wv5; Sat,  8 Jul 2023 23:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BCB281E69;
	Sat,  8 Jul 2023 23:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BCB281E69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA28B1BF2C7
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 23:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 845CC60A9F
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 23:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 845CC60A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ur7nwUUAUJ-m for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 23:12:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8280160A95
 for <buildroot@uclibc.org>; Sat,  8 Jul 2023 23:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8280160A95
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 6597486345; Sat,  8 Jul 2023 23:12:26 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 08 Jul 2023 23:12:25 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rpe2101@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15685-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15685] New: Buildroot fails to build due to
 host-ncurses' tic crashing on _nc_disable_period
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

https://bugs.busybox.net/show_bug.cgi?id=15685

            Bug ID: 15685
           Summary: Buildroot fails to build due to host-ncurses' tic
                    crashing on  _nc_disable_period
           Product: buildroot
           Version: 2023.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: rpe2101@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Problem appears to be that the host-ncurses tic only is built with linker
RUNPATH vs. the old RPATH.  Buildroot's tic is trying to use the system so
file.  GCC version in Ubuntu 23.04 takes the RPATH flag and makes it a RUNPATH
with the builtroot's current default ldflags.  Either this or the scripts using
buildroot built host programs need to update LD_LIBRARY_PATH to use buildroot's
version of dynamic libraries, in this case ncurses.so.  Have potential diff at
end.

System:
$ neofetch --stdout

robert@OptiPlex-9020
OS: Ubuntu 23.04 x86_64
Host: OptiPlex 9020 00
Kernel: 6.2.0-24-generic
Uptime: 19 hours, 22 mins
Packages: 3215 (dpkg), 21 (snap)
Shell: zsh 5.9
Resolution: 3840x2160
DE: GNOME 44.0
WM: Mutter
WM Theme: Adwaita
Theme: Yaru [GTK2/3]
Icons: Yaru [GTK2/3]
Terminal: tmux
CPU: Intel i7-4770 (8) @ 3.900GHz
GPU: Intel HD Graphics
Memory: 3576MiB / 15882MiB

$ gcc -version
gcc (Ubuntu 12.2.0-17ubuntu1) 12.2.0
Copyright (C) 2022 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

The Distilled moment:
DESTDIR=/home/robert/output/host/riscv64-buildroot-linux-gnu/sysroot \
prefix=/usr \
exec_prefix=/usr \
bindir=/usr/bin \
top_srcdir=.. \
srcdir=. \
datadir=/usr/share \
ticdir=/usr/share/terminfo \
source=terminfo.tmp \
cross_compiling=yes \
/bin/bash ./run_tic.sh
** Building terminfo database, please wait...
Running tic to install
/home/robert/output/host/riscv64-buildroot-linux-gnu/sysroot/usr/share/terminfo
...

        You may see messages regarding extended capabilities, e.g., AX.
        These are extended terminal capabilities which are compiled
        using
                tic -x
        If you have ncurses 4.2 applications, you should read the INSTALL
        document, and install the terminfo without the -x option.

tic: symbol lookup error: tic: undefined symbol: _nc_disable_period
tic: symbol lookup error: tic: undefined symbol: _nc_disable_period
? tic could not build
/home/robert/output/host/riscv64-buildroot-linux-gnu/sysroot/usr/share/terminfo
make[3]: *** [Makefile:109: install.data] Error 1
make[2]: *** [Makefile:139: install] Error 2
make[1]: *** [package/pkg-generic.mk:332:
/home/robert/output/build/ncurses-6.4-20230429/.stamp_staging_installed] Error
2

.config attached.

I was able to fix this by forcing all host programs to be build with a flag to
use the RPATH's.  I believe the below diff is the correct location to put the
change.

diff --git a/package/Makefile.in b/package/Makefile.in
index 24089a4a..0dbfcdd8 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -242,7 +242,7 @@ HOST_CPPFLAGS  = -I$(HOST_DIR)/include
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
-HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
+HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
-Wl,--disable-new-dtags

 # host-intltool should be executed with the system perl, so we save
 # the path to the system perl, before a host-perl built by Buildroot

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
