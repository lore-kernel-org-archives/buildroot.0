From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:34:29 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/rauc:
 package/rauc: bump version to 1.5.1
Message-ID: <20210210191435.3FC367FD9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38b229167c44ba592e84ccf4040bd9af23f2996e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Removed patch applied upstream.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f786969f2abdddee4f10bc5eb2475c06864535cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-src-mount.c-fix-build-with-kernel-4.14.patch | 43 ----------------------
 package/rauc/rauc.hash                             |  4 +-
 package/rauc/rauc.mk                               |  2 +-
 3 files changed, 3 insertions(+), 46 deletions(-)

diff --git a/package/rauc/0001-src-mount.c-fix-build-with-kernel-4.14.patch b/package/rauc/0001-src-mount.c-fix-build-with-kernel-4.14.patch
deleted file mode 100644
index 9604e8878a..0000000000
--- a/package/rauc/0001-src-mount.c-fix-build-with-kernel-4.14.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f73eefdbc0577b125f7d36f54a27d8e95af831dd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 22 Dec 2020 11:52:31 +0100
-Subject: [PATCH] src/mount.c: fix build with kernel < 4.14
-
-Build with kernel headers < 4.14 fails since version 1.5.0 and
-https://github.com/rauc/rauc/commit/527bf2f7f746e0253f7843542e19cb0fa0c7c869:
-
-src/mount.c: In function 'r_setup_loop':
-src/mount.c:201:25: error: 'LOOP_SET_BLOCK_SIZE' undeclared (first use in this function)
-  looprc = ioctl(loopfd, LOOP_SET_BLOCK_SIZE, 4096);
-                         ^
-
-Indeed, LOOP_SET_BLOCK_SIZE is only defined since
-https://github.com/torvalds/linux/commit/89e4fdecb51cf5535867026274bc97de9480ade5
-
-Fixes:
- - http://autobuild.buildroot.org/results/829ae7ed66686c11a941ac99bd08a06f754affb4
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rauc/rauc/pull/673]
----
- src/mount.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/mount.c b/src/mount.c
-index 2e593ca..75acf49 100644
---- a/src/mount.c
-+++ b/src/mount.c
-@@ -11,6 +11,10 @@
- #include "mount.h"
- #include "utils.h"
- 
-+#ifndef LOOP_SET_BLOCK_SIZE
-+#define LOOP_SET_BLOCK_SIZE 0x4C09
-+#endif
-+
- gboolean r_mount_bundle(const gchar *source, const gchar *mountpoint, GError **error)
- {
- 	const unsigned long flags = MS_NODEV | MS_NOSUID | MS_RDONLY;
--- 
-2.29.2
-
diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 73c1add995..a025257845 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.5/rauc-1.5.tar.xz.asc
-sha256  5dfbc46e808240c5014d318cfe64f0431307c37aa79cb2b013caa12daaf96d9d  rauc-1.5.tar.xz
+# https://github.com/rauc/rauc/releases/download/v1.5.1/rauc-1.5.1.tar.xz.asc
+sha256  d4ea009ce702bcb083d942398ccfedec959c6bbb7adc0fd77ae9314ce11d9d91  rauc-1.5.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index fd39f000a8..1bd83e03aa 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.5
+RAUC_VERSION = 1.5.1
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
