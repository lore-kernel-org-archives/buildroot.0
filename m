From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Feb 2014 08:52:31 +0100
Subject: [Buildroot] [git commit] coreutils: add gnulib patch to fix
	librt/libthread link in static case
Message-ID: <20140221075948.778599CAC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cb2b158d4650ab0f0648056c212686d026997ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

coreutils was not building in the static link case with uClibc, due to
binaries being linked with librt (for timer functions), but not with
libpthread. However, librt uses functions from libpthread, so both
must be specified. This lack of linking against libpthread was caused
by a deficiency in one of the gnulib m4 macro, for which we add a patch.

Fixes:

  http://autobuild.buildroot.org/results/bd4/bd4cc779b46e3837e3d6c43c97eaf42fdfc3a288/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../coreutils/coreutils-02-fix-timer-time-m4.patch |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/coreutils/coreutils-02-fix-timer-time-m4.patch b/package/coreutils/coreutils-02-fix-timer-time-m4.patch
new file mode 100644
index 0000000..3b4d81b
--- /dev/null
+++ b/package/coreutils/coreutils-02-fix-timer-time-m4.patch
@@ -0,0 +1,36 @@
+Fix thread detection with uClibc in timer_time.m4
+
+The timer_time.m4 gl_TIMER_TIME function determines which libraries
+need to be linked to get access to the timer function, generally -lrt
+for Linux systems. On platforms where threads are used, librt
+typically uses thread functions from libpthread.
+
+However, the test to determine whether the platform has thread or not
+is incorrect: it assumes that if the C library is uClibc, then threads
+are not available. This is actually not true: uClibc has configurable
+thread support, and when thread support is available, librt calls
+libpthread functions.
+
+This is important when static linking is used, because otherwise only
+-lrt is used at link time, which fails because librt calls undefined
+thread functions. Both -lrt and -lpthread must be passed.
+
+This problem is fixed by making the uClibc thread detection a bit
+smarter, thanks to the usage of the __HAS_NO_THREADS__ macro defined
+in <bits/uClibc_config.h>, which itself is included by <features.h>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/m4/timer_time.m4
+===================================================================
+--- a/m4/timer_time.m4
++++ b/m4/timer_time.m4
+@@ -28,7 +28,7 @@
+ #include <features.h>
+ #ifdef __GNU_LIBRARY__
+  #if ((__GLIBC__ == 2 && __GLIBC_MINOR__ >= 2) || (__GLIBC__ > 2)) \
+-     && !defined __UCLIBC__
++     && !(__UCLIBC__ && __HAS_NO_THREADS__)
+   Thread emulation available
+  #endif
+ #endif
