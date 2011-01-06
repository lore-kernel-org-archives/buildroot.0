From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Jan 2011 07:07:25 +0000 (UTC)
Subject: [Buildroot] [Bug 3049] New: binutils prior to 2.21 have a sysroot
	bug in ld
Message-ID: <bug-3049-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3049

           Summary: binutils prior to 2.21 have a sysroot bug in ld
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rick at sloservers.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2839
  --> https://bugs.busybox.net/attachment.cgi?id=2839
Patch I used to test with binutils-2.20.1

I ran into problems using buildroot to cross-compile mpc (and gcc-4.5.x for
which mpc is a dependency).  The build would fail and the cross-compile-ld
would complain that it couldn't find /lib//libc.so.0

It turns out this is a bug in ld from binutils that was fixed in binutils 2.21:
https://bugs.launchpad.net/binutils/+bug/625320

Basically ld ignores the sysroot path when absolute library paths are given,
which causes errors when cross-compiling.

This issue affects any package that uses absolute library paths, such as mpc
and others.  

The fix (which is basically this
http://bugs.gentoo.org/attachment.cgi?id=195936) ought to be added to the
buildroot patches for binutils versions prior to 2.21.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
