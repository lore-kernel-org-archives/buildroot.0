From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Mar 2012 09:38:06 +0000 (UTC)
Subject: [Buildroot] [Bug 4988] New: flex and m4 problems
Message-ID: <bug-4988-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4988

           Summary: flex and m4 problems
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


Created attachment 4196
  --> https://bugs.busybox.net/attachment.cgi?id=4196
adds BR2_PACKAGE_M4 as dependency

Hello,

there is a problem installing flex to the target area. flex ultimatively
depends on m4 at run-time (see [1]), but this is not accounted for in the
buildroot's flex.mk. Worse, the flex binary includes a fully qualified path to
the host area's m4 (see main.c and the use of the M4 define, set in config.h).
This is wrong for both flex installed to the staging area and flex installed to
the target area.

I attached three patches to solve these problems. The first patch
(Config.in.diff) adds BR2_PACKAGE_M4 to flex/Config.in. The second patch
(flex.mk.diff) uses the M4 environment variable to force the configure script
not to look for the host's m4 tool but to assume /usr/bin/m4. The last patch
(flex-2.5.35-fix-cross-compiling.patch) disables checking the features of the
cross m4 and it prevents the tools from being built as they reference the
target m4 tool in an incompatible way.

Regards,

Christoph Schulz

[1] http://flex.sourceforge.net/manual/M4-Dependency.html

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
