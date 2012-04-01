From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  1 Apr 2012 06:40:46 +0000 (UTC)
Subject: [Buildroot] [Bug 5006] New: make performs library lookup in the
 build and host library directores and not in the staging area
Message-ID: <bug-5006-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5006

           Summary: make performs library lookup in the build and host
                    library directores and not in the staging area
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: develop at kristov.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Consider the following Makefile:

CC = gcc
prog: prog.o -lcrypt
        $(CC) -o $@ $^

This links prog.o to libcrypt.so in the staging area, but GNU make searches for
the library in the following directories:

/lib
/usr/lib
$(HOST_DIR)/usr/lib

which is obviously wrong in a cross-compiling environment. (The paths are
hard-coded in remake.c at the beginning of the function directory_search).

I have attached a patch that fixes this bug. It removes LIBDIR (which is
defined to $(HOST_DIR)/usr/lib in the make's Makefile) from the search path and
replaces the hard-coded paths by @LIBDIR@ and @USRLIBDIR@, respectively. In the
buildroot's make.mk, these strings are replaced by the correct staging library
paths.

However, this patch only works in combination with a host-make as requested in
bug #4922, where the discussion has not reached a final consensus yet :-(

Regards,

Christoph Schulz

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
