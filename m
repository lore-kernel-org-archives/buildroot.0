From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 21:17:06 +0200
Subject: [Buildroot] [git commit] package/gdb: fix build of 8.1.1 since the
 bump to glibc 2.29
Message-ID: <20190513191509.A7A71885DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cbc81729e04c48f74482f412a2ef84924413e98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Between glibc 2.28 and glibc 2.29, commit
89983cb37c9319806a551e8fe9f3a11ff8f973e1 ("Update siginfo constants
from Linux kernel (bug 21286)") was merged. This commit moved the
TRAP_HWBKPT definition from an IA64-specific header to an
architecture-agnostic header.

This change exhibited a build issue that until then was only visible
on IA64 (which Buildroot does not support). This Buildroot commit
backports a patch from gdb upstream (which is in gdb since 8.2) which
mentions IA64 because it was originally meant to fix only the
IA64-related issue. But the glibc change, this change has become
visible on all architectures.

Fixes:

 - http://autobuild.buildroot.org/results/a81eb395bd95306fcbb07c1443c9134fd63fa379

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: extend commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...g-TRAP_HWBKPT-before-including-gdb_wait-h.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/gdb/8.1.1/0007-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch b/package/gdb/8.1.1/0007-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch
new file mode 100644
index 0000000000..1e85d9314c
--- /dev/null
+++ b/package/gdb/8.1.1/0007-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch
@@ -0,0 +1,54 @@
+From 5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and updated to remove ChangeLog update) from:
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8]
+---
+ gdb/ChangeLog          | 6 ++++++
+ gdb/nat/linux-ptrace.c | 2 --
+ gdb/nat/linux-ptrace.h | 1 +
+ 3 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
+index 5c4ddc9..1f21ef0 100644
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
+index 60967a3..dc180fb 100644
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
+2.9.3
+
