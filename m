From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 23 Nov 2012 09:59:23 +0100
Subject: [Buildroot] [git commit] libecore: fix build with glibc >= 2.16
Message-ID: <20121123091456.422C781E9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a645383c841f5016f81e90e29b829fcf6a8a312b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ecore-ecore_exe-fix-build-with-glibc-2-16.patch |   94 ++++++++++++++++++++
 1 files changed, 94 insertions(+), 0 deletions(-)

diff --git a/package/efl/libecore/libecore-ecore_exe-fix-build-with-glibc-2-16.patch b/package/efl/libecore/libecore-ecore_exe-fix-build-with-glibc-2-16.patch
new file mode 100644
index 0000000..d9b439c
--- /dev/null
+++ b/package/efl/libecore/libecore-ecore_exe-fix-build-with-glibc-2-16.patch
@@ -0,0 +1,94 @@
+Backported for commit a0df6712b6afcd07facd32e5a66809170277bdf3
+Fixed the ChangeLog part.
+
+This patch fix build with glibc >=2.16, avoiding the following error occurs:
+
+Making all in ecore
+make[6]: Entering directory `/opt/buildroot/output/build/host-libecore-1.1.0/src/lib/ecore'
+  CC     ecore.lo
+  CC     ecore_anim.lo
+  CC     ecore_app.lo
+  CC     ecore_events.lo
+  CC     ecore_getopt.lo
+  CC     ecore_idle_enterer.lo
+  CC     ecore_idle_exiter.lo
+  CC     ecore_idler.lo
+  CC     ecore_job.lo
+  CC     ecore_main.lo
+  CC     ecore_pipe.lo
+  CC     ecore_poll.lo
+  CC     ecore_time.lo
+  CC     ecore_timer.lo
+  CC     ecore_thread.lo
+  CC     ecore_glib.lo
+  CC     ecore_throttle.lo
+  CC     ecore_signal.lo
+  CC     ecore_exe.lo
+ecore_exe.c: In function ???ecore_exe_pipe_run???:
+ecore_exe.c:486:15: warning: implicit declaration of function ???setpriority??? [-Wimplicit-function-declaration]
+ecore_exe.c:486:27: error ???PRIO_PROCESS??? undeclared (first use in this function)
+ecore_exe.c:486:27: note: each undeclared identifier is reported only once for each function it appears in
+make[6]: *** [ecore_exe.lo] Error 1
+
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+From a0df6712b6afcd07facd32e5a66809170277bdf3 Mon Sep 17 00:00:00 2001
+From: caro <caro>
+Date: Fri, 22 Jun 2012 05:36:00 +0000
+Subject: [PATCH] ecore_exe: fix compilation on fedora 18.
+
+setpriority needs sys/resource.h. See:
+
+http://linux.die.net/man/2/setpriority
+
+I let sys/time.h, it does not hurt on linux and is anyway needed for BSD systems.
+
+
+git-svn-id: http://svn.enlightenment.org/svn/e at 72684 7cbeb6ba-43b4-40fd-8cce-4c39aea84d33
+---
+ ChangeLog                 | 4 ++++
+ src/lib/ecore/ecore_exe.c | 7 ++-----
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index a306f75..549ad19 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -763,3 +763,7 @@
+ 2011-11-29 Mike McCormack
+
+ 	* Allow quitting before entering the glib version of the main loop
++
++2012-06-22 Vincent Torri
++
++	* ecore_exe: fix compilation on fedora 18.
+diff --git a/src/lib/ecore/ecore_exe.c b/src/lib/ecore/ecore_exe.c
+index 7931a96..6db32a9 100644
+--- a/src/lib/ecore/ecore_exe.c
++++ b/src/lib/ecore/ecore_exe.c
+@@ -2,11 +2,6 @@
+ # include <config.h>
+ #endif
+ 
+-#if defined (__FreeBSD__) || defined (__OpenBSD__) || defined (__NetBSD__)
+-# include <sys/time.h>
+-# include <sys/resource.h>
+-#endif
+-
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -14,6 +9,8 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <sys/time.h>
++#include <sys/resource.h>
+ 
+ #ifdef HAVE_SYS_PRCTL_H
+ # include <sys/prctl.h>
+-- 
+1.7.12.2
+
