From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:38:49 +0100
Subject: [Buildroot] [git commit] lftp: add patch to fix gcc 6.x build issue
Message-ID: <20161101154047.DAFDF804FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b474c3bdf7f923eb19acfdd2e28c26808b3f15d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/e1e597300ed5b9bf12ceffe028d5f2687a6f07cd/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../lftp/0002-fix-gcc-6-conflicts-signbit.patch    | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/lftp/0002-fix-gcc-6-conflicts-signbit.patch b/package/lftp/0002-fix-gcc-6-conflicts-signbit.patch
new file mode 100644
index 0000000..e906c7a
--- /dev/null
+++ b/package/lftp/0002-fix-gcc-6-conflicts-signbit.patch
@@ -0,0 +1,57 @@
+Use <cmath> instead of <math.h> to fix gcc 6.x build
+
+This patch fixes the following build issue:
+
+../lib/math.h:2577:1: error: ???int signbit(float)??? conflicts with a previous declaration
+
+that occurs with gcc 6.x.
+
+Patch taken from
+https://raw.githubusercontent.com/openembedded/meta-openembedded/master/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+--- lftp-4.6.3a/src/NetAccess.cc.orig	2016-06-18 10:25:51.063358981 -0400
++++ lftp-4.6.3a/src/NetAccess.cc	2016-06-18 10:26:04.143359209 -0400
+@@ -21,7 +21,7 @@
+ 
+ #include <errno.h>
+ #include <assert.h>
+-#include <math.h>
++#include <cmath>
+ #include <sys/types.h>
+ 
+ #include "NetAccess.h"
+--- lftp-4.6.3a/src/Speedometer.cc.orig	2016-06-18 10:24:58.895358073 -0400
++++ lftp-4.6.3a/src/Speedometer.cc	2016-06-18 10:25:10.879358281 -0400
+@@ -18,7 +18,7 @@
+  */
+ 
+ #include <config.h>
+-#include <math.h>
++#include <cmath>
+ #include <stdlib.h>
+ #include "Speedometer.h"
+ #include "misc.h"
+--- lftp-4.6.3a/src/FileCopy.cc.orig	2016-06-18 10:24:15.939357325 -0400
++++ lftp-4.6.3a/src/FileCopy.cc	2016-06-18 10:24:24.583357475 -0400
+@@ -36,7 +36,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+-#include <math.h>
++#include <cmath>
+ #include <stddef.h>
+ #include "FileCopy.h"
+ #include "url.h"
+--- lftp-4.6.3a/src/ResMgr.cc.orig	2016-06-18 10:23:31.387356549 -0400
++++ lftp-4.6.3a/src/ResMgr.cc	2016-06-18 10:23:41.771356729 -0400
+@@ -23,7 +23,7 @@
+ #include <ctype.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+-#include <math.h>
++#include <cmath>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <errno.h>
