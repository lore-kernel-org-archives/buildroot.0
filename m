From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 21:21:51 +0200
Subject: [Buildroot] [git commit] libv4l: fix build with glibc 2.28
Message-ID: <20180920192636.49FD888669@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5411515e92d4b1d32202035bff338e783b9065b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two upstream patches adding the needed header for the major/minor
macros.

Fixes:
http://autobuild.buildroot.net/results/f38/f3858970c1bbb7b0201389f7656c9ccf15a59fda/

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0005-libv4lconvert-fix-compiler-warning.patch  | 45 ++++++++++++++++++++++
 .../0006-v4l2-ctl-fix-glibc-2.28-build.patch       | 30 +++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/package/libv4l/0005-libv4lconvert-fix-compiler-warning.patch b/package/libv4l/0005-libv4lconvert-fix-compiler-warning.patch
new file mode 100644
index 0000000000..941a51e638
--- /dev/null
+++ b/package/libv4l/0005-libv4lconvert-fix-compiler-warning.patch
@@ -0,0 +1,45 @@
+From 380fe7d4548a99bfcfc1594b6f0b3dd2369978f1 Mon Sep 17 00:00:00 2001
+From: Hans Verkuil <hans.verkuil@cisco.com>
+Date: Sun, 1 Apr 2018 12:10:33 +0200
+Subject: [PATCH] libv4lconvert: fix compiler warning
+
+  CC       control/libv4lconvert_la-libv4lcontrol.lo
+control/libv4lcontrol.c: In function ???v4lcontrol_get_usb_info???:
+control/libv4lcontrol.c:391:13: warning: In the GNU C Library, "minor" is defined
+ by <sys/sysmacros.h>. For historical compatibility, it is
+ currently defined by <sys/types.h> as well, but we plan to
+ remove this soon. To use "minor", include <sys/sysmacros.h>
+ directly. If you did not intend to use a system-defined macro
+ "minor", you should undefine it after including <sys/types.h>.
+       c == '\n' && minor_dev == minor(st.st_rdev))
+             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Dropped the '#if defined(MAJOR_IN_SYSMACROS)' to ensure that sysmacros.h
+is always included. It seems that #if is no longer needed. At least,
+nobody complained when I removed it in other places earlier :-)
+
+Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 380fe7d4548a9
+
+ lib/libv4lconvert/control/libv4lcontrol.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/lib/libv4lconvert/control/libv4lcontrol.c b/lib/libv4lconvert/control/libv4lcontrol.c
+index 1e784eda8a92..59f28b137b98 100644
+--- a/lib/libv4lconvert/control/libv4lcontrol.c
++++ b/lib/libv4lconvert/control/libv4lcontrol.c
+@@ -20,9 +20,7 @@
+  */
+ 
+ #include <sys/types.h>
+-#if defined(MAJOR_IN_SYSMACROS)
+ #include <sys/sysmacros.h>
+-#endif
+ #include <sys/mman.h>
+ #include <fcntl.h>
+ #include <sys/stat.h>
+-- 
+2.18.0
+
diff --git a/package/libv4l/0006-v4l2-ctl-fix-glibc-2.28-build.patch b/package/libv4l/0006-v4l2-ctl-fix-glibc-2.28-build.patch
new file mode 100644
index 0000000000..c66f4d8033
--- /dev/null
+++ b/package/libv4l/0006-v4l2-ctl-fix-glibc-2.28-build.patch
@@ -0,0 +1,30 @@
+From f7eb207a3b90fef6a9c8fbdc506e809cc9757bd1 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 20 Sep 2018 21:20:16 +0200
+Subject: [PATCH] v4l2-ctl: fix glibc 2.28 build
+
+Include header needed for the major/minor macros in glibc 2.28+.
+
+This patch is extracted from upstream commit 65e7b2a4076845d (v4l2-ctl: show
+media/entity info if available).
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ utils/v4l2-ctl/v4l2-ctl.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
+index e02dc756..12a19bc7 100644
+--- a/utils/v4l2-ctl/v4l2-ctl.cpp
++++ b/utils/v4l2-ctl/v4l2-ctl.cpp
+@@ -33,6 +33,7 @@
+ #include <errno.h>
+ #include <sys/ioctl.h>
+ #include <sys/time.h>
++#include <sys/sysmacros.h>
+ #include <dirent.h>
+ #include <math.h>
+ 
+-- 
+2.14.4
+
