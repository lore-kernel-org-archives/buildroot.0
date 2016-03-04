From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  4 Mar 2016 11:15:10 +0100
Subject: [Buildroot] [PATCH] glibc: backport patch to fix Microblaze build
	issue
Message-ID: <1457086510-32279-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit backports a glibc patch that fixes the build of glibc 2.22
on the Microblaze architecture.

Fixes:

  http://autobuild.buildroot.org/results/673/67348953fac469affd1965e04d61485ebb41e252/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-microblaze-include-unix-sysdep.h.patch    | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/glibc/2.22/0002-microblaze-include-unix-sysdep.h.patch

diff --git a/package/glibc/2.22/0002-microblaze-include-unix-sysdep.h.patch b/package/glibc/2.22/0002-microblaze-include-unix-sysdep.h.patch
new file mode 100644
index 0000000..28f4b6e
--- /dev/null
+++ b/package/glibc/2.22/0002-microblaze-include-unix-sysdep.h.patch
@@ -0,0 +1,43 @@
+From 8415fb8d4f05c023b9d79e44dff197cc285fd1e5 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Thu, 6 Aug 2015 02:10:46 -0400
+Subject: [PATCH] microblaze: include unix/sysdep.h
+
+The semi-recent SYSCALL_CANCEL inclusion broke microblaze due to the
+sysdep.h header not including the unix/sysdep.h header.  Include it
+here like all other ports.
+
+(cherry picked from commit 5d5de49c3ccd69f65b801f1ca490a0112d1cbd7d)
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[edited to remove ChangeLog modifications, which cause conflicts.]
+---
+ sysdeps/unix/sysv/linux/microblaze/sysdep.h | 7 ++++++-
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/sysdeps/unix/sysv/linux/microblaze/sysdep.h b/sysdeps/unix/sysv/linux/microblaze/sysdep.h
+index 83c0340..9d5c542 100644
+--- a/sysdeps/unix/sysv/linux/microblaze/sysdep.h
++++ b/sysdeps/unix/sysv/linux/microblaze/sysdep.h
+@@ -16,8 +16,11 @@
+    License along with the GNU C Library; if not, see
+    <http://www.gnu.org/licenses/>.  */
+ 
++#ifndef _LINUX_MICROBLAZE_SYSDEP_H
++#define _LINUX_MICROBLAZE_SYSDEP_H 1
++
++#include <sysdeps/unix/sysdep.h>
+ #include <sysdeps/microblaze/sysdep.h>
+-#include <sys/syscall.h>
+ 
+ /* Defines RTLD_PRIVATE_ERRNO.  */
+ #include <dl-sysdep.h>
+@@ -305,3 +308,5 @@ SYSCALL_ERROR_LABEL_DCL:                            \
+ # define PTR_DEMANGLE(var) (void) (var)
+ 
+ #endif /* not __ASSEMBLER__ */
++
++#endif /* _LINUX_MICROBLAZE_SYSDEP_H */
+-- 
+2.6.4
+
-- 
2.6.4
