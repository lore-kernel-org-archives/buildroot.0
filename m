From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Oct 2013 01:34:38 +0000 (UTC)
Subject: [Buildroot] [Bug 6554] New: gdb needs to dependents on host texinfo
Message-ID: <bug-6554-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6554

           Summary: gdb needs to dependents on host texinfo
           Product: buildroot
           Version: 2013.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: feng.haibo at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When I tried to build a broadcom chipset target with 2013.02 on Fedora 19, and
met a compilation error when installing gdb to the target. The error is that
the gdbint.texinfo files can't be correctly parsed:
./gdbint.texinfo:38: misplaced {
./gdbint.texinfo:38: misplaced }
make[7]: *** [gdbint.info] Error 1
....
make[7]: *** [gdb.info] Error 1
make[6]: *** [subdir_do] Error 1
make[5]: *** [install-only] Error 2
make[4]: *** [install] Error 2
make[3]: *** [install-gdb] Error 2
make[2]: *** [install] Error 2

The reason is that host-texinfo isn't compiled yet, to fix we need to add the
dependency in gdb.mk

ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
GDB_SUBDIR = gdb/gdbserver
HOST_GDB_SUBDIR = .
else
GDB_DEPENDENCIES = ncurses
endif

GDB_DEPENDENCIES += host-texinfo

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
