From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  2 Mar 2010 12:43:15 +0000 (UTC)
Subject: [Buildroot] [Bug 1219] New: kernel headers not correctly installed
 into toolchain/staging
Message-ID: <bug-1219-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1219

           Summary: kernel headers not correctly installed into
                    toolchain/staging
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will_wagner at carallon.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Currently not all the kernel headers are installed into staging. This is
because of old code in uclibc.mk that relates to 2.4 kernels.

Looking at uclibc.mk, the problem seems to happen three times, first copying
into $(TOOLCHAIN_DIR)/uClibc_dev/usr/include, then into
$(STAGING_DIR)/usr/include and finally into $(TARGET_DIR)/usr/include (only if
libc.a is on target)

All of these cases have different behavior depending on whether ifeq
($(LINUX_HEADERS_IS_KERNEL),y) is true. If it is it just copies all the files,
otherwise it picks out a specific subset. However in a search of all the
buildroot files LINUX_HEADERS_IS_KERNEL is never mentioned except in uclibc.mk

Looking back through earlier buildroot versions, Peter removed the last mention
to LINUX_HEADERS_IS_KERNEL with this commit to remove 2.4.x kernel header
support http://lists.busybox.net/pipermail/buildroot/2009-February/026144.html

It appears that before this LINUX_HEADERS_IS_KERNEL was set true for 2.6.x and
false for 2.4.x. It looks to me like that change broke the copying of kernel
headers for 2.6.x and left code in uclibc.mk that was meant for 2.4.x headers. 

This issue has come up on the list a number of times with people complaining
about a lack of mtd/mtd.h

Attached patch fixes the issue.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
