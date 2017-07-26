From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jul 2017 16:01:08 +0000
Subject: [Buildroot] [Bug 10136] New: can't compile systemd with GCC 7.X
 when optimization is on
Message-ID: <bug-10136-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10136

            Bug ID: 10136
           Summary: can't compile systemd with GCC 7.X when optimization
                    is on
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: yurovsky at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7131
  --> https://bugs.busybox.net/attachment.cgi?id=7131&action=edit
workaround

Building systemd will fail due to a bug in GCC if we're using the buildroot GCC
7.X toolchain and have enable optimization (-O3). That is:

BR2_OPTIMIZE_3=y
BR2_GCC_VERSION_7_X=y
BR2_GCC_VERSION="7.1.0"

The problem is with GCC's nonnull detection (there's nothing wrong with the
systemd code in question) and it looks like it has been fixed upstream but we
don't have the backported fix in Buildroot:
https://github.com/systemd/systemd/issues/6119

A quick workaround is to patch systemd with the attached patch but it seems
that GCC should have some patches backported.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
