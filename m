From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 19:27:36 +0100
Subject: [Buildroot] [git commit] package/musl: Make scheduler functions
 Linux-compatible
Message-ID: <20191027182330.B0A178A423@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0437884e2dd1d321f366c14999ca49c1b74b7286
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The POSIX functions sched_getscheduler(), sched_setscheduler(),
sched_getparam(), sched_setparam() are technically not correctly
implemented by the Linux syscalls of the same name, because what the
kernel calls a PID and what POSIX calls a PID isn't truly the same,
resulting in somewhat different semantics as to what these functions
exactly apply to.
Details: https://sourceware.org/bugzilla/show_bug.cgi?id=14829

Since the musl developers put a high premium on POSIX compliance, they
deliberately implement these functions to return -ENOSYS instead of
relaying them to the respective Linux syscalls as glibc/uClibc do.

Unfortunally this breaks virtually all Linux programs using these
functions under musl. For example running 'chrt -p 1' fails with
'Function not implemented' on a musl-libc based system.
In particular, it affects embedded systems using these interfaces
for scheduling real-time processes.

As it seems unfeasible to fix all affected programs to manually use
syscall wrappers instead of the libc functions, make musl behave the
Linux way.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...l-Make-scheduler-functions-Linux-compatib.patch | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch b/package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch
new file mode 100644
index 0000000000..7c3acf9f02
--- /dev/null
+++ b/package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch
@@ -0,0 +1,76 @@
+From 407c96fc790d0d11ca9603a2a533216c745b5051 Mon Sep 17 00:00:00 2001
+From: Stefan Nickl <Stefan.Nickl@gmail.com>
+Date: Mon, 13 May 2019 22:33:21 +0200
+Subject: [PATCH] Make scheduler functions Linux-compatible
+
+Let sched_getscheduler(), sched_setscheduler(), sched_getparam(),
+sched_setparam() invoke the Linux syscalls of the same name instead
+of returning -ENOSYS.
+
+Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
+---
+ src/sched/sched_getparam.c     | 3 +--
+ src/sched/sched_getscheduler.c | 3 +--
+ src/sched/sched_setparam.c     | 3 +--
+ src/sched/sched_setscheduler.c | 3 +--
+ 4 files changed, 4 insertions(+), 8 deletions(-)
+
+diff --git a/src/sched/sched_getparam.c b/src/sched/sched_getparam.c
+index 76f10e4..65be107 100644
+--- a/src/sched/sched_getparam.c
++++ b/src/sched/sched_getparam.c
+@@ -1,8 +1,7 @@
+ #include <sched.h>
+-#include <errno.h>
+ #include "syscall.h"
+ 
+ int sched_getparam(pid_t pid, struct sched_param *param)
+ {
+-	return __syscall_ret(-ENOSYS);
++	return syscall(SYS_sched_getparam, pid, param);
+ }
+diff --git a/src/sched/sched_getscheduler.c b/src/sched/sched_getscheduler.c
+index 394e508..4c922f6 100644
+--- a/src/sched/sched_getscheduler.c
++++ b/src/sched/sched_getscheduler.c
+@@ -1,8 +1,7 @@
+ #include <sched.h>
+-#include <errno.h>
+ #include "syscall.h"
+ 
+ int sched_getscheduler(pid_t pid)
+ {
+-	return __syscall_ret(-ENOSYS);
++	return syscall(SYS_sched_getscheduler, pid);
+ }
+diff --git a/src/sched/sched_setparam.c b/src/sched/sched_setparam.c
+index 18623ee..f699faf 100644
+--- a/src/sched/sched_setparam.c
++++ b/src/sched/sched_setparam.c
+@@ -1,8 +1,7 @@
+ #include <sched.h>
+-#include <errno.h>
+ #include "syscall.h"
+ 
+ int sched_setparam(pid_t pid, const struct sched_param *param)
+ {
+-	return __syscall_ret(-ENOSYS);
++	return syscall(SYS_sched_setparam, pid, param);
+ }
+diff --git a/src/sched/sched_setscheduler.c b/src/sched/sched_setscheduler.c
+index 4435f21..e678221 100644
+--- a/src/sched/sched_setscheduler.c
++++ b/src/sched/sched_setscheduler.c
+@@ -1,8 +1,7 @@
+ #include <sched.h>
+-#include <errno.h>
+ #include "syscall.h"
+ 
+ int sched_setscheduler(pid_t pid, int sched, const struct sched_param *param)
+ {
+-	return __syscall_ret(-ENOSYS);
++	return syscall(SYS_sched_setscheduler, pid, sched, param);
+ }
+-- 
+2.21.0
+
