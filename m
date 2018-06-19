From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Jun 2018 14:14:24 +0000
Subject: [Buildroot] [Bug 11101] New: host-patchelf Endian Issue with
 relative RPATH
Message-ID: <bug-11101-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11101

            Bug ID: 11101
           Summary: host-patchelf Endian Issue with relative RPATH
           Product: buildroot
           Version: 2018.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: bryce.ferguson at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

This problem was discovered with the package: sudo.  In builds for PowerPC
architecture, the sudo ELF file contains an invalid symbol after fix-rpath
script is run.  The following entry below:

0x1d000000 (<unknown>: 1d000000)        0xb77

When it should be:

0x0000001d (RUNPATH)                    Library runpath

Should be the RUNPATH entry (0x1d).  Because of this, sudo cannot find the
proper libraries at runtime and fails to execute.  It appears, when looking at
the readelf output, that there is an endian problem here when the host differs
from the target.

I have traced this to the host-patchelf utility. (Patchelf is executed by the
fix-rpath script.)  When the --make-rpath-relative option is specified, there
is a possibility that this can occur.  Wondering why this does not occur on
other packages, I added the --debug option to the patchelf command in the
fix-rpath script and ran the build again.  This time, I see that most of the
packages in my build report "No RPATH to make relative", except for sudo.

I've tried to build for mutliple architectures (ARM, x86/_64, PPC).  So far
this only occurs for PowerPC builds.  Perhaps a possible workaround having to
do with the install location of the sudo libraries is needed?

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
