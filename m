From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Apr 2019 03:02:40 +0000
Subject: [Buildroot] [Bug 11811] New: lsblk (util-linux) should depend on
 libudev if available
Message-ID: <bug-11811-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11811

            Bug ID: 11811
           Summary: lsblk (util-linux) should depend on libudev if
                    available
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pmorici at dev295.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Several of the output columns of lsblk such as SERIAL and WWN are incorrectly
reported as empty strings. ie: 'lsblk -do SERIAL'  

The cause is that lsblk uses libudev to obtain this information but the
util-linux package doesn't list the udev package as a dependency if it is
selected. If util-linux gets built before udev then many parts of lsblk return
empty strings for various fields.

Adding the following to packages/util-linux/util-linux.mk fixes the problem.

 ifeq ($(BR2_PACKAGE_UDEV),y)
 UTIL_LINUX_DEPENDENCIES += udev
 endif

-- 
You are receiving this mail because:
You are on the CC list for the bug.
