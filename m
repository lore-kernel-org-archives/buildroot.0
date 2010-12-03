From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  3 Dec 2010 14:32:50 +0000 (UTC)
Subject: [Buildroot] [Bug 2887] New: tar "buffer overflow detected" error
Message-ID: <bug-2887-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2887

           Summary: tar "buffer overflow detected" error
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: andyg1001 at hotmail.co.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2755
  --> https://bugs.busybox.net/attachment.cgi?id=2755
Patch to bump tar version 1.21 to 1.25

tar 1.21 will generate a "buffer overflow detected" error when creating a new
archive, such as the following:

[root at test]# tar cvf mytest.tar test
*** buffer overflow detected ***: tar terminated
======= Backtrace: =========
/lib/libc.so.6(__fortify_fail+0x44)[0xff43dcc]
/lib/libc.so.6(+0xfd86c)[0xff4286c]
/lib/libc.so.6(__strcpy_chk+0x4c)[0xff41680]
tar[0x10009dd4]
tar[0x1000ae50]
tar[0x1000a300]
tar[0x1000b288]
tar[0x1002188c]
/lib/libc.so.6(+0x1f8c4)[0xfe648c4]
/lib/libc.so.6(+0x1fa50)[0xfe64a50]
======= Memory map: ========
00100000-00103000 r-xp 00100000 00:00 0          [vdso]
0fe0a000-0fe21000 r-xp 00000000 08:01 1978       /lib/libpthread-2.12.1.so
0fe21000-0fe31000 ---p 00017000 08:01 1978       /lib/libpthread-2.12.1.so
0fe31000-0fe32000 r--p 00017000 08:01 1978       /lib/libpthread-2.12.1.so
0fe32000-0fe33000 rwxp 00018000 08:01 1978       /lib/libpthread-2.12.1.so
0fe33000-0fe35000 rwxp 0fe33000 00:00 0 
0fe45000-0ffa3000 r-xp 00000000 08:01 3019       /lib/libc-2.12.1.so
0ffa3000-0ffb3000 ---p 0015e000 08:01 3019       /lib/libc-2.12.1.so
0ffb3000-0ffb5000 r--p 0015e000 08:01 3019       /lib/libc-2.12.1.so
0ffb5000-0ffb8000 rwxp 00160000 08:01 3019       /lib/libc-2.12.1.so
0ffb8000-0ffbb000 rwxp 0ffb8000 00:00 0 
0ffcb000-0ffd4000 r-xp 00000000 08:01 3018       /lib/librt-2.12.1.so
0ffd4000-0ffe3000 ---p 00009000 08:01 3018       /lib/librt-2.12.1.so
0ffe3000-0ffe4000 r--p 00008000 08:01 3018       /lib/librt-2.12.1.so
0ffe4000-0ffe5000 rwxp 00009000 08:01 3018       /lib/librt-2.12.1.so
0ffe5000-0fff0000 rwxp 0ffe5000 00:00 0 
10000000-10053000 r-xp 00000000 08:01 2579       /usr/bin/tar
10062000-10063000 r--p 00052000 08:01 2579       /usr/bin/tar
10063000-10065000 rwxp 00053000 08:01 2579       /usr/bin/tar
10065000-10087000 rwxp 10065000 00:00 0          [heap]
48000000-48020000 r-xp 00000000 08:01 4274       /lib/ld-2.12.1.so
48020000-48021000 r--p 00020000 08:01 4274       /lib/ld-2.12.1.so
48021000-48023000 rwxp 00021000 08:01 4274       /lib/ld-2.12.1.so
48023000-48025000 rw-p 48023000 00:00 0 
bff1b000-bff30000 rwxp bffeb000 00:00 0          [stack]
Aborted


This is a bug within tar, as reported at
http://bugs.gentoo.org/show_bug.cgi?id=317139, and occurs when gcc 4.5 is used.
 It is fixed in tar 1.25.

The attached patch fixes the problem for buildroot by bumping tar from 1.21 to
1.25.

Regards
Andy

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
