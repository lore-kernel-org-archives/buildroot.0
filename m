From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Mar 2010 15:14:56 +0100
Subject: [Buildroot] [git commit master] setserial: fix build with 2.6.33+
	kernel headers on x86
Message-ID: <20100315141649.C47A77764D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5a2844c74815976d32265395b4b3836fdab786a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux/hayesesp.h got removed in 2.6.33, but some archs (like x86) still
define the TIOCGHAYESESP ioctl, breaking the build.

It's very unlikely to be of interest anymore, so just undef it.

Reported-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 .../setserial-tiocghayesesp-build-fix.patch        |   28 ++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 package/setserial/setserial-tiocghayesesp-build-fix.patch

diff --git a/CHANGES b/CHANGES
index f1edd16..dce7efb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 	X.org updated to 7.5.
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
-	mtd-utils, squashfs
+	mtd-utils, setserial, squashfs
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/setserial/setserial-tiocghayesesp-build-fix.patch b/package/setserial/setserial-tiocghayesesp-build-fix.patch
new file mode 100644
index 0000000..176a0c9
--- /dev/null
+++ b/package/setserial/setserial-tiocghayesesp-build-fix.patch
@@ -0,0 +1,28 @@
+[PATCH] setserial: fix build with 2.6.33+ kernel headers
+
+linux/hayesesp.h got removed in 2.6.33, but some archs (like x86) still
+define the TIOCGHAYESESP ioctl, breaking the build.
+
+It's very unlikely to be of interest anymore, so just undef it.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ setserial.c |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+Index: setserial-2.17/setserial.c
+===================================================================
+--- setserial-2.17.orig/setserial.c
++++ setserial-2.17/setserial.c
+@@ -24,6 +24,11 @@
+ #endif
+ #include <linux/serial.h>
+ 
++/* linux/hayesesp.h got removed in 2.6.33 but some archs (like x86)
++   still define TIOCGHAYESESP. It's very unlikely to be of interest
++   anymore, so just undef it */
++#undef TIOCGHAYESESP
++
+ #include "version.h"
+ 
+ static char version_str[] = "setserial version " SETSERIAL_VERSION ", "
-- 
1.6.3.3
