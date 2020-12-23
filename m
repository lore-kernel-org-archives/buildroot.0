From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 13:14:20 +0100
Subject: [Buildroot] [git commit] package/rauc: fix build with headers < 4.14
Message-ID: <20201223120720.E5E2A88023@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45a09e9041cf22196ae4b1f6c4f22731967abb0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/829ae7ed66686c11a941ac99bd08a06f754affb4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-src-mount.c-fix-build-with-kernel-4.14.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/rauc/0001-src-mount.c-fix-build-with-kernel-4.14.patch b/package/rauc/0001-src-mount.c-fix-build-with-kernel-4.14.patch
new file mode 100644
index 0000000000..9604e8878a
--- /dev/null
+++ b/package/rauc/0001-src-mount.c-fix-build-with-kernel-4.14.patch
@@ -0,0 +1,43 @@
+From f73eefdbc0577b125f7d36f54a27d8e95af831dd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 22 Dec 2020 11:52:31 +0100
+Subject: [PATCH] src/mount.c: fix build with kernel < 4.14
+
+Build with kernel headers < 4.14 fails since version 1.5.0 and
+https://github.com/rauc/rauc/commit/527bf2f7f746e0253f7843542e19cb0fa0c7c869:
+
+src/mount.c: In function 'r_setup_loop':
+src/mount.c:201:25: error: 'LOOP_SET_BLOCK_SIZE' undeclared (first use in this function)
+  looprc = ioctl(loopfd, LOOP_SET_BLOCK_SIZE, 4096);
+                         ^
+
+Indeed, LOOP_SET_BLOCK_SIZE is only defined since
+https://github.com/torvalds/linux/commit/89e4fdecb51cf5535867026274bc97de9480ade5
+
+Fixes:
+ - http://autobuild.buildroot.org/results/829ae7ed66686c11a941ac99bd08a06f754affb4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rauc/rauc/pull/673]
+---
+ src/mount.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/mount.c b/src/mount.c
+index 2e593ca..75acf49 100644
+--- a/src/mount.c
++++ b/src/mount.c
+@@ -11,6 +11,10 @@
+ #include "mount.h"
+ #include "utils.h"
+ 
++#ifndef LOOP_SET_BLOCK_SIZE
++#define LOOP_SET_BLOCK_SIZE 0x4C09
++#endif
++
+ gboolean r_mount_bundle(const gchar *source, const gchar *mountpoint, GError **error)
+ {
+ 	const unsigned long flags = MS_NODEV | MS_NOSUID | MS_RDONLY;
+-- 
+2.29.2
+
