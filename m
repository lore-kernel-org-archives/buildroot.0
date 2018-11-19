From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:37:15 +0100
Subject: [Buildroot] [git commit] boot/syslinux: fix build with glibc 2.28+
Message-ID: <20181119213519.A1EBE83BEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c91e7da5cf6ecf4690148751f72a4185da6243a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building with glibc 2.28+, the "major", "minor" and "makedev"
functions are defined in "sys/sysmacros.h". This commit backports
upstream commit 1a74985b2a404639b08882c57f3147229605dfd5 to fix the
build with glibc 2.28.

Link: https://www.syslinux.org/wiki/index.php?title=Building
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-sys-sysmacros-h-for-major-minor-makedev.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

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
