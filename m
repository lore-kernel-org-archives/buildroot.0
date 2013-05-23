From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 May 2013 22:48:20 +0200
Subject: [Buildroot] [git commit] libatomic_ops: fix build failure seen with
	toolchain without threads support
Message-ID: <20130523205044.B076F9A4E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=666aa6287c39b32e77e24690bcb4f435ca59ac47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/58c188ad59c62c7897381e110fe3518ccc17867e

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libatomic_ops-nothread-build-failure-fix.patch |   41 ++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops-nothread-build-failure-fix.patch b/package/libatomic_ops/libatomic_ops-nothread-build-failure-fix.patch
new file mode 100644
index 0000000..cc14b1e
--- /dev/null
+++ b/package/libatomic_ops/libatomic_ops-nothread-build-failure-fix.patch
@@ -0,0 +1,41 @@
+From 7e940ce34ff4de254d460344f1a1a486a14fb045 Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Wed, 22 May 2013 16:21:26 -0700
+Subject: [PATCH] Fix build failure seen when using toolchain without threads support
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ src/atomic_ops.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/src/atomic_ops.c b/src/atomic_ops.c
+index b6731a2..5769643 100644
+--- a/src/atomic_ops.c
++++ b/src/atomic_ops.c
+@@ -48,7 +48,9 @@
+ 
+ #undef AO_REQUIRE_CAS
+ 
++#if defined(AO_USE_PTHREAD_DEFS)
+ #include <pthread.h>
++#endif
+ 
+ #ifndef AO_USE_NO_SIGNALS
+ # include <signal.h>
+@@ -72,11 +74,13 @@
+ # include "atomic_ops/sysdeps/standard_ao_double_t.h"
+ #endif
+ 
++#if defined(AO_USE_PTHREAD_DEFS)
+ /*
+  * Lock for pthreads-based implementation.
+  */
+ 
+ pthread_mutex_t AO_pt_lock = PTHREAD_MUTEX_INITIALIZER;
++#endif
+ 
+ /*
+  * Out of line compare-and-swap emulation based on test and set.
+-- 
+1.7.4.1
+
