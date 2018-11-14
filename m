From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Wed, 14 Nov 2018 21:54:33 +0100
Subject: [Buildroot] [PATCH v2] boot/syslinux: Fix build with glibc 2.28+
Message-ID: <20181114205433.3233-1-alexander.sverdlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building with glibc 2.28+, the "major", "minor" and "makedev"
functions are defined in "sys/sysmacros.h". The patch
"extlinux: pull in sys/sysmacros.h for major/minor/makedev",
applied to Syslinux during 2016Apr, should help. Please note that not
only Syslinux is affected by this change in glibc.

Link: https://www.syslinux.org/wiki/index.php?title=Building
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---

Changelog:
v2:
- Commit message: 2.23 -> 2.28

 ...-sysmacros-h-for-major-minor-makedev.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 boot/syslinux/0012-pull-in-sys-sysmacros-h-for-major-minor-makedev.patch

diff --git a/boot/syslinux/0012-pull-in-sys-sysmacros-h-for-major-minor-makedev.patch b/boot/syslinux/0012-pull-in-sys-sysmacros-h-for-major-minor-makedev.patch
new file mode 100644
index 0000000000..beba5cc245
--- /dev/null
+++ b/boot/syslinux/0012-pull-in-sys-sysmacros-h-for-major-minor-makedev.patch
@@ -0,0 +1,34 @@
+From 1a74985b2a404639b08882c57f3147229605dfd5 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Tue, 19 Apr 2016 06:50:31 -0400
+Subject: [PATCH] extlinux: pull in sys/sysmacros.h for major/minor/makedev
+
+These functions are defined in sys/sysmacros.h, so add the include to
+main.c.  This is already handled correctly in mountinfo.c.  Otherwise
+we get build failures like:
+
+main.o: In function 'find_device_sysfs':
+extlinux/main.c:1131: undefined reference to 'minor'
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Gene Cumm <gene.cumm@gmail.com>
+Signed-off-by: Alexander Sverdlin <alexader.sverdlin@gmail.com>
+---
+ extlinux/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/extlinux/main.c b/extlinux/main.c
+index a7ebd49..ebff7ea 100644
+--- a/extlinux/main.c
++++ b/extlinux/main.c
+@@ -38,6 +38,7 @@
+ #include <sysexits.h>
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/mount.h>
+ #include <sys/vfs.h>
+-- 
+2.10.5.GIT
+
-- 
2.19.1
