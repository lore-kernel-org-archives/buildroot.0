From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Apr 2020 07:55:33 +0000
Subject: [Buildroot] [Bug 12801] New: Flag '-Wa,
 --noexecstack' is missing when building uclibc with newer binutils
Message-ID: <bug-12801-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12801

            Bug ID: 12801
           Summary: Flag '-Wa,--noexecstack' is missing when building
                    uclibc with newer binutils
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: m.patzlaff at pilz.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8436
  --> https://bugs.busybox.net/attachment.cgi?id=8436&action=edit
defconfig to reproduce the issue

When I upgraded buildroot from 2019.02.8 to 2020.02 and re-build my
configuration I noticed that all binaries (executables and shared libraries)
have the executable stack requested in the GNU_STACK program header. I did some
research and also tried to narrow the cause. Eventually I found this:

        \         |
binutils \ uclibc | 1.0.31    |  1.0.32 
------------------+-----------+---------------
2.30              | fine      | fine
2.31.1            | execstack | execstack
2.32              | execstack | execstack
2.33.1            | execstack | execstack

So, until binutils 2.30 everything goes fine. Regardless of what GCC version (I
tested with 4.9 and 8.3.0) I used, the uclibc libraries were marked with
non-executable stack and thus all other binaries were OK too. But starting from
binutils 2.31.1 something goes wrong. In the log for binutils 2.30 + uclibc
1.0.31 one can see, that the flag "-Wa,--noexecstack" is properly passed to the
compiler. In the log for binutils 2.32 + uclibc 1.0.32 this flag is missing.
And here is where I am lost. I can't figure out why because executing the flag
detection in Rules.mak from uclibc manually returns the correct result. And I
also double checked the security options in uclibc-menuconfig.

To reproduce the results above it's best to use the attached defconfig on
buildroot versions 2019.02.8 and 2020.02.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
