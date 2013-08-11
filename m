From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Aug 2013 20:37:59 +0000 (UTC)
Subject: [Buildroot] [Bug 6428] New: util-linux libmount segfaults with
 patch from buildroot
Message-ID: <bug-6428-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6428

           Summary: util-linux libmount segfaults with patch from
                    buildroot
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: daniel at exxm.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5012
  --> https://bugs.busybox.net/attachment.cgi?id=5012
Patch

The patch file package/util-linux/util-linux-001-sscanf-no-ms-as.patch
introduces a bug in libmount that causes /bin/mount to segfault most of the
time. As a result, the root filesystem does not get remounted read/write.
The reason it segfaults is that it passes a (char **) where sscanf expects a
(char *).

You could also use a different patch from
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-apps/util-linux/files/util-linux-2.21.1-no-printf-alloc.patch?revision=1.2
If you do so, be careful! It's against 2.21.1. 2.22 introduced the function
mnt_parse_swaps_line() which also makes use of the %a modifier. You'd need to
enhance the patch to fix mnt_parse_swaps_line() as well.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
