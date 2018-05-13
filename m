From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 14:22:22 +0200
Subject: [Buildroot] [PATCH] package/rauc: add workaround for older kernel
 headers
Message-ID: <20180513122222.18412-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/621/621587906bd2bb27c43b6fcbb051d75f20e32e7c/
    http://autobuild.buildroot.org/results/52c/52ca760f0227075ca988754bb9eb8df0ea3e1563/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Andrey Yurovsky <yurovsky@gmail.com>
---
 ...001-emmc-add-workaround-for-older-kernels.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/rauc/0001-emmc-add-workaround-for-older-kernels.patch

diff --git a/package/rauc/0001-emmc-add-workaround-for-older-kernels.patch b/package/rauc/0001-emmc-add-workaround-for-older-kernels.patch
new file mode 100644
index 0000000000..2d661e42a5
--- /dev/null
+++ b/package/rauc/0001-emmc-add-workaround-for-older-kernels.patch
@@ -0,0 +1,33 @@
+From 7c67c0ef267d470fcec950d2be49507255f39fc5 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 13 May 2018 14:17:44 +0200
+Subject: [PATCH] emmc: add workaround for older kernels
+
+Kernels up to (and including 3.3) forgot to include types.h in their
+mmc/ioctl.h, and thus __u32 (and others) are not defined, causing
+compilation errors:
+
+    http://autobuild.buildroot.org/results/621/621587906bd2bb27c43b6fcbb051d75f20e32e7c/build-end.log
+
+Fix that by explicitly including types.h before mmc/ioctl.h.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ src/emmc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/emmc.c b/src/emmc.c
+index e8b0b05..2ce3373 100644
+--- a/src/emmc.c
++++ b/src/emmc.c
+@@ -4,6 +4,7 @@
+ #include <fcntl.h>
+ #include <glib/gstdio.h>
+ #include <linux/major.h>
++#include <linux/type.h> /* kernel < 3.4 forgot that in mmc/ioctl.h */
+ #include <linux/mmc/ioctl.h>
+ #include <string.h>
+ #include <sys/ioctl.h>
+-- 
+2.14.1
+
-- 
2.14.1
