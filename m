From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Apr 2016 01:56:37 +0000
Subject: [Buildroot] [Bug 8851] New: Make sure fio can compile with libaio
 support if it the package is installed
Message-ID: <bug-8851-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8851

            Bug ID: 8851
           Summary: Make sure fio can compile with libaio support if it
                    the package is installed
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ckhardin at exablox.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

if libaio is being used, then make fio depend on it so that it gets compiled
with aio support.

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 08fef5f..384be2e 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -9,6 +9,10 @@ FIO_SITE = git://git.kernel.dk/fio.git
 FIO_LICENSE = GPLv2 + special obligations
 FIO_LICENSE_FILES = COPYING

+ifeq ($(BR2_PACKAGE_LIBAIO),y)
+FIO_DEPENDENCIES += libaio
+endif
+
 define FIO_CONFIGURE_CMDS
        (cd $(@D); ./configure --cc="$(TARGET_CC)"
--extra-cflags="$(TARGET_CFLAGS)")
 endef

-- 
You are receiving this mail because:
You are on the CC list for the bug.
