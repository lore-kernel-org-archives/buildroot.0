From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Jun 2016 14:58:40 +0000
Subject: [Buildroot] [Bug 9016] New: arceb-buildroot-linux-uclibc ld uses
 incorrect default format
Message-ID: <bug-9016-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9016

            Bug ID: 9016
           Summary: arceb-buildroot-linux-uclibc ld uses incorrect default
                    format
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: uwe at hermann-uwe.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

With the arceb-buildroot-linux-uclibc toolchain you can get issues like this
when compiling certain files/libs:

~/buildroot-arceb-buildroot-linux-uclibc/output/host/usr/arceb-buildroot-linux-uclibc/bin/ld:
ERROR: Endian Match failed. Attempting to link blah.a(foo.o) with binary baz.o
of opposite endian-ness


The reason seems to be that "ld" uses the incorrect default output format.
Adding "-BE" would probably fix it, but IMHO it's a bug already that the
default is not set to BE (but please correct me if I'm wrong).


ARC, little endian, correct default:
~/buildroot-arc-buildroot-linux-uclibc/output/host/usr/arc-buildroot-linux-uclibc/bin/ld
--print-output-format
elf32-littlearc

ARC, big endian, WRONG default (should be "elf32-bigarc"):
~/buildroot-arceb-buildroot-linux-uclibc/output/host/usr/arceb-buildroot-linux-uclibc/bin/ld
--print-output-format
elf32-littlearc


For comparison, here's another LE/BE toolchain example where this is handled
correctly:

AARCH64, little endian, correct default:
~/buildroot-aarch64-buildroot-linux-gnu/output/host/usr/aarch64-buildroot-linux-gnu/bin/ld
--print-output-format
elf64-littleaarch64

AARCH64, big endian, correct default:
~/buildroot-aarch64_be-buildroot-linux-gnu/output/host/usr/aarch64_be-buildroot-linux-gnu/bin/ld
--print-output-format
elf64-bigaarch64

-- 
You are receiving this mail because:
You are on the CC list for the bug.
