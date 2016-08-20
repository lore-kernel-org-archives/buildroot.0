From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:06:43 +0200
Subject: [Buildroot] [git commit] ntfs-3g: add patch to fix musl build issue
Message-ID: <20160820090740.739B081DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4881394c3cdc09a32eba79bcf05f8acca57880d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a simple patch that fixes the build with the musl C
library. The fix was suggested by Khem Raj (thanks!).

Fixes:

  http://autobuild.buildroot.net/results/eb6dabccf729f96a4e06a98526eb4c716fa6bcd2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-libfuse-util-include-paths.h-when-needed.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/ntfs-3g/0001-libfuse-util-include-paths.h-when-needed.patch b/package/ntfs-3g/0001-libfuse-util-include-paths.h-when-needed.patch
new file mode 100644
index 0000000..1765f68
--- /dev/null
+++ b/package/ntfs-3g/0001-libfuse-util-include-paths.h-when-needed.patch
@@ -0,0 +1,43 @@
+From da021ed297ff7a69f3b7532ef68a9b6877a55265 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 20 Aug 2016 11:05:27 +0200
+Subject: [PATCH] libfuse-util: include <paths.h> when needed
+
+Both fusermount.c and mount_util.c use _PATH_MOUNTED, so they should
+include <paths.h>, which provides this definition.
+
+This fixes the build with the musl C library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libfuse-lite/fusermount.c | 1 +
+ libfuse-lite/mount_util.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libfuse-lite/fusermount.c b/libfuse-lite/fusermount.c
+index 4e724db..680fee1 100644
+--- a/libfuse-lite/fusermount.c
++++ b/libfuse-lite/fusermount.c
+@@ -19,6 +19,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <pwd.h>
++#include <paths.h>
+ 
+ #ifdef __SOLARIS__
+ #include <sys/mnttab.h>
+diff --git a/libfuse-lite/mount_util.c b/libfuse-lite/mount_util.c
+index 8ea5e08..8b31722 100644
+--- a/libfuse-lite/mount_util.c
++++ b/libfuse-lite/mount_util.c
+@@ -15,6 +15,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <limits.h>
++#include <paths.h>
+ #include <sys/stat.h>
+ #include <sys/wait.h>
+ #ifdef __SOLARIS__
+-- 
+2.7.4
+
