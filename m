From: stefan.nickl at gmail.com <stefan.nickl@gmail.com>
Date: Mon, 13 May 2019 22:00:58 +0200
Subject: [Buildroot] [PATCH] package/musl: Make scheduler functions
 Linux-compatible
Message-ID: <509e7dab95b95c040af26c842e94777b069d6ba5.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
 package/musl/0002-sched-linux-compat.patch | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 package/musl/0002-sched-linux-compat.patch

diff --git a/package/musl/0002-sched-linux-compat.patch
b/package/musl/0002-sched-linux-compat.patch
new file mode 100644
index 0000000000..c1626ea7c3
--- /dev/null
+++ b/package/musl/0002-sched-linux-compat.patch
@@ -0,0 +1,74 @@
+The POSIX functions sched_getscheduler(), sched_setscheduler(),
+sched_getparam(), sched_setparam() are technically not correctly
+implemented by the Linux syscalls of the same name, because what the
+kernel calls a PID and what POSIX calls a PID isn't truly the same,
+resulting in somewhat different semantics as to what these functions
+exactly apply to.
+
+Since the musl developers put a high premium on POSIX compliance, they
+deliberately implement these functions to return -ENOSYS instead of
+relaying them to the respective Linux syscalls as glibc/uClibc do.
+
+This means that virtually all programs written for Linux using these
+functions are currently broken. For example running 'chrt -p 1' fails
+with "Function not implemented" on a musl-libc based system.
+
+While the musl developers are right strictly speaking, it seems
+unfeasible to fix all affected programs in a way that hardly any Linux
+developer will consider to be broken in the first place. So this patch
+simply changes musl to fall in line with the other libcs.
+
+Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
+---
+diff -ru a/src/sched/sched_getparam.c b/src/sched/sched_getparam.c
+--- a/src/sched/sched_getparam.c	2019-04-10 02:39:21.000000000
+0200
++++ b/src/sched/sched_getparam.c	2019-05-07 08:51:00.980363141
+0200
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
+diff -ru a/src/sched/sched_getscheduler.c
b/src/sched/sched_getscheduler.c
+--- a/src/sched/sched_getscheduler.c	2019-04-10 02:39:21.000000000
+0200
++++ b/src/sched/sched_getscheduler.c	2019-05-07 08:50:48.246021455
+0200
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
+diff -ru a/src/sched/sched_setparam.c b/src/sched/sched_setparam.c
+--- a/src/sched/sched_setparam.c	2019-04-10 02:39:21.000000000
+0200
++++ b/src/sched/sched_setparam.c	2019-05-07 08:51:03.603227550
+0200
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
+diff -ru a/src/sched/sched_setscheduler.c
b/src/sched/sched_setscheduler.c
+--- a/src/sched/sched_setscheduler.c	2019-04-10 02:39:21.000000000
+0200
++++ b/src/sched/sched_setscheduler.c	2019-05-07 08:50:53.379756063
+0200
+@@ -1,8 +1,7 @@
+ #include <sched.h>
+-#include <errno.h>
+ #include "syscall.h"
+ 
+ int sched_setscheduler(pid_t pid, int sched, const struct sched_param
*param)
+ {
+-	return __syscall_ret(-ENOSYS);
++	return syscall(SYS_sched_setscheduler, pid, sched, param);
+ }
