From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 11:46:00 +0100
Subject: [Buildroot] [git commit] package/gdb: fix compilation for
 arc-2018.09 in some cases
Message-ID: <20181210104223.DE4ED7FBD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fcc7599d5d787a2ffbb192b5044b50c52cb98b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In some cases which seem to depend on how toolchain headers
got installed or configured we may face well-known by now failure
fixed in upstream with [1]:
------------------------------>8----------------------------
In file included from nat/linux-ptrace.c:20:
nat/linux-ptrace.h:175:22: error: expected identifier before numeric constant
 # define TRAP_HWBKPT 4
                      ^
nat/linux-ptrace.h:175:22: error: expected '}' before numeric constant
In file included from .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/signal.h:58,
                 from build-gnulib/import/signal.h:52,
                 from .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/sys/wait.h:36,
                 from ./common/gdb_wait.h:23,
                 from nat/linux-ptrace.c:24:
.../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/bits/siginfo-consts.h:156:1: note: to match this '{'
 {
 ^
In file included from nat/linux-ptrace.c:20:
nat/linux-ptrace.h:175:22: error: expected unqualified-id before numeric constant
 # define TRAP_HWBKPT 4
                      ^
In file included from .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/features.h:428,
                 from .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                 from .../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/stdio.h:27,
                 from build-gnulib/import/stdio.h:43,
                 from ./common/common-defs.h:52,
                 from nat/linux-ptrace.c:19:
.../output/host/arc-buildroot-linux-gnu/sysroot/usr/include/sys/wait.h:158:1: error: expected declaration before '}' token
 __END_DECLS
 ^~~~~~~~~~~
------------------------------>8----------------------------

Back-porting the fix for ARC now to get predictably successful results.

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...4-defining-TRAP_HWBKPT-before-including-g.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/gdb/arc-2018.09-gdb/0001-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch b/package/gdb/arc-2018.09-gdb/0001-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
new file mode 100644
index 0000000000..1ee39658f1
--- /dev/null
+++ b/package/gdb/arc-2018.09-gdb/0001-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
@@ -0,0 +1,52 @@
+From e213d8e1b5317389c3beee648811bc649d62d743 Mon Sep 17 00:00:00 2001
+From: James Clarke <jrtc27@jrtc27.com>
+Date: Fri, 19 Jan 2018 17:22:49 +0000
+Subject: [PATCH] gdb: Fix ia64 defining TRAP_HWBKPT before including
+ gdb_wait.h
+
+On ia64, gdb_wait.h eventually includes siginfo-consts-arch.h, which
+contains an enum with TRAP_HWBKPT, along with a #define. Thus we cannot
+define TRAP_HWBKPT to 4 beforehand, and so gdb_wait.h must be included
+earlier; include it from linux-ptrace.h so it can never come afterwards.
+
+gdb/ChangeLog:
+
+	* nat/linux-ptrace.c: Remove unnecessary reinclusion of
+	gdb_ptrace.h, and move including gdb_wait.h ...
+	* nat/linux-ptrace.h: ... to here.
+
+[Backport from upstream 5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8]
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ gdb/nat/linux-ptrace.c | 2 --
+ gdb/nat/linux-ptrace.h | 1 +
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
+index 438177fa7622..1240eead0d50 100644
+--- a/gdb/nat/linux-ptrace.c
++++ b/gdb/nat/linux-ptrace.c
+@@ -21,8 +21,6 @@
+ #include "linux-procfs.h"
+ #include "linux-waitpid.h"
+ #include "buffer.h"
+-#include "gdb_wait.h"
+-#include "gdb_ptrace.h"
+ #ifdef HAVE_SYS_PROCFS_H
+ #include <sys/procfs.h>
+ #endif
+diff --git a/gdb/nat/linux-ptrace.h b/gdb/nat/linux-ptrace.h
+index 59549452c099..6faa89b22a0e 100644
+--- a/gdb/nat/linux-ptrace.h
++++ b/gdb/nat/linux-ptrace.h
+@@ -21,6 +21,7 @@
+ struct buffer;
+ 
+ #include "nat/gdb_ptrace.h"
++#include "gdb_wait.h"
+ 
+ #ifdef __UCLIBC__
+ #if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_HAS_MMU__))
+-- 
+2.19.2
+
