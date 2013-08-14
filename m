From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Aug 2013 05:11:17 +0000 (UTC)
Subject: [Buildroot] [Bug 6452] New: eglibc from Linaro 2013.07 not copied
 to target correctly
Message-ID: <bug-6452-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6452

           Summary: eglibc from Linaro 2013.07 not copied to target
                    correctly
           Product: buildroot
           Version: 2013.05
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: henry at echelon.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5042
  --> https://bugs.busybox.net/attachment.cgi?id=5042
Preserve toolchain sysroot lib's directory structure on target

When building buildroot with Linaro 2013.07 (configured as external or custom
tool), the target would fail to come up, with error:

/sbin/init: error while loading shared libraries: libc.so.6: cannot open shared
object file: No such file or directory

The reason is that starting with Linaro 2013.07, they switched to eglibc-2.17
with multi-arch support. Arch-specific libraries, including libc.so.6, are
expected to be in /lib/arm-linux-gnueabihf/ instead of just /lib. However,
copy_toolchain_lib_root() in helper.mk would end up copying them to /lib rather
than arch-specific directories.

Attached is my own patch to preserve the toolchain sysroot's lib directory
structure, except for SUPPORT_LIB_DIR which are still copied directly under
DESTDIR.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
