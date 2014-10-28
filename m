From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Oct 2014 13:08:33 +0000 (UTC)
Subject: [Buildroot] [Bug 7574] New: quota-4.01 fails to build statically
Message-ID: <bug-7574-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7574

           Summary: quota-4.01 fails to build statically
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: abrodkin at synopsys.com
                CC: buildroot at uclibc.org,
                    thomas.petazzoni at free-electrons.com,
                    abrodkin at synopsys.com
   Estimated Hours: 0.0


--->---
.../arm-buildroot-linux-uclibcgnueabi-gcc -static -lintl  quotastats.o common.o
pot.o   -o quotastats
.../arm-buildroot-linux-uclibcgnueabi-gcc -static -lintl  xqmstats.o common.o
pot.o   -o xqmstats
quotastats.o: In function `get_proc_num':
quotastats.c:(.text+0x58): undefined reference to `libintl_gettext'
quotastats.o: In function `main':
quotastats.c:(.text.startup+0x138): undefined reference to `libintl_gettext'
quotastats.c:(.text.startup+0x1b4): undefined reference to `libintl_gettext'
quotastats.c:(.text.startup+0x1c4): undefined reference to `libintl_gettext'
quotastats.c:(.text.startup+0x228): undefined reference to `libintl_gettext'
quotastats.o:quotastats.c:(.text.startup+0x238): more undefined references to
`libintl_gettext' follow
pot.o: In function `gettexton':
pot.c:(.text+0x1c): undefined reference to `libintl_bindtextdomain'
pot.c:(.text+0x28): undefined reference to `libintl_textdomain'
collect2: error: ld returned 1 exit status
make[2]: *** [quotastats] Error 1
make[2]: *** Waiting for unfinished jobs....
xqmstats.o: In function `main':
xqmstats.c:(.text.startup+0x70): undefined reference to `libintl_gettext'
xqmstats.c:(.text.startup+0x100): undefined reference to `libintl_gettext'
xqmstats.c:(.text.startup+0x10c): undefined reference to `libintl_gettext'
xqmstats.c:(.text.startup+0x11c): undefined reference to `libintl_gettext'
xqmstats.c:(.text.startup+0x12c): undefined reference to `libintl_gettext'
xqmstats.o:xqmstats.c:(.text.startup+0x13c): more undefined references to
`libintl_gettext' follow
--->---

The reason seems to be in improper location of "-lintl".
Incase of static linkage it should be after (on left side) object files that
call symbols of the library.

In other words following command line will work:
--->---
arm-buildroot-linux-uclibcgnueabi-gcc -static quotastats.o common.o pot.o
-lintl  -o quotastats
--->---

In its turn "-lintl" is put in the beginning of command line because it's a
part of LDFLAGS in quota's Makefile. And in "package/quota/quota.mk" we
explicitly set it with "QUOTA_LDFLAGS += -lintl".

So the only proper fix I may think of is modification of quota's Makefile.in so
that libraries are appended in the end of link command separately from LDFLAGS
or move LDFLAGS in the end.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
