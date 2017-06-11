From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:00:48 +0200
Subject: [Buildroot] [git commit] gdb: fix build of gdbserver on
	m68k/coldfire
Message-ID: <20170611160107.2D7D37FB8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98d7a9654420ba0e9afe817e13adbda967aa5629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a small patch to gdb that fixes the build of gdbserver
on m68k/coldfire:

../nat/linux-ptrace.c: In function 'linux_fork_to_function':
../nat/linux-ptrace.c:282:19: warning: implicit declaration of function 'clone' [-Wimplicit-function-declaration]
       child_pid = clone (function, child_stack + STACK_SIZE,
                   ^
../nat/linux-ptrace.c:283:5: error: 'CLONE_VM' undeclared (first use in this function)
     CLONE_VM | SIGCHLD, child_stack + STACK_SIZE * 2);
     ^
../nat/linux-ptrace.c:283:5: note: each undeclared identifier is reported only once for each function it appears in

Thanks to Waldemar for pointing out the patch fixing this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - None
Changes since v1:
 - New patch in the series
---
 .../0010-Fix-gdbserver-build-on-uClibc-noMMU.patch | 32 ++++++++++++++++++++++
 .../0005-Fix-gdbserver-build-on-uClibc-noMMU.patch | 32 ++++++++++++++++++++++
 .../0004-Fix-gdbserver-build-on-uClibc-noMMU.patch | 32 ++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/package/gdb/7.10.1/0010-Fix-gdbserver-build-on-uClibc-noMMU.patch b/package/gdb/7.10.1/0010-Fix-gdbserver-build-on-uClibc-noMMU.patch
new file mode 100644
index 0000000..3f877b3
--- /dev/null
+++ b/package/gdb/7.10.1/0010-Fix-gdbserver-build-on-uClibc-noMMU.patch
@@ -0,0 +1,32 @@
+From 6de192acd4807d7fd57caf451567f09308bd8350 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 9 Jun 2017 10:19:32 +0200
+Subject: [PATCH] Fix gdbserver build on uClibc/noMMU
+
+The noMMU specific code requires including <sched.h>.
+
+Originally from
+https://cgit.openadk.org/cgi/cgit/openadk.git/plain/package/gdbserver/patches/nommu.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gdb/nat/linux-ptrace.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gdb/nat/linux-ptrace.h b/gdb/nat/linux-ptrace.h
+index be6c395..c9f85aa 100644
+--- a/gdb/nat/linux-ptrace.h
++++ b/gdb/nat/linux-ptrace.h
+@@ -23,7 +23,8 @@ struct buffer;
+ #include <sys/ptrace.h>
+ 
+ #ifdef __UCLIBC__
+-#if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_HAS_MMU__))
++#include <sched.h>
++#if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_USE_MMU__))
+ /* PTRACE_TEXT_ADDR and friends.  */
+ #include <asm/ptrace.h>
+ #define HAS_NOMMU
+-- 
+2.7.4
+
diff --git a/package/gdb/7.11.1/0005-Fix-gdbserver-build-on-uClibc-noMMU.patch b/package/gdb/7.11.1/0005-Fix-gdbserver-build-on-uClibc-noMMU.patch
new file mode 100644
index 0000000..fc8b3ac
--- /dev/null
+++ b/package/gdb/7.11.1/0005-Fix-gdbserver-build-on-uClibc-noMMU.patch
@@ -0,0 +1,32 @@
+From d6bf0c57a6bf361ac53887653aa1878e60d56335 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 9 Jun 2017 10:19:32 +0200
+Subject: [PATCH] Fix gdbserver build on uClibc/noMMU
+
+The noMMU specific code requires including <sched.h>.
+
+Originally from
+https://cgit.openadk.org/cgi/cgit/openadk.git/plain/package/gdbserver/patches/nommu.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gdb/nat/linux-ptrace.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gdb/nat/linux-ptrace.h b/gdb/nat/linux-ptrace.h
+index 0a23bcb..35b7cbb 100644
+--- a/gdb/nat/linux-ptrace.h
++++ b/gdb/nat/linux-ptrace.h
+@@ -23,7 +23,8 @@ struct buffer;
+ #include "nat/gdb_ptrace.h"
+ 
+ #ifdef __UCLIBC__
+-#if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_HAS_MMU__))
++#include <sched.h>
++#if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_USE_MMU__))
+ /* PTRACE_TEXT_ADDR and friends.  */
+ #include <asm/ptrace.h>
+ #define HAS_NOMMU
+-- 
+2.7.4
+
diff --git a/package/gdb/7.12.1/0004-Fix-gdbserver-build-on-uClibc-noMMU.patch b/package/gdb/7.12.1/0004-Fix-gdbserver-build-on-uClibc-noMMU.patch
new file mode 100644
index 0000000..cbdfc4d
--- /dev/null
+++ b/package/gdb/7.12.1/0004-Fix-gdbserver-build-on-uClibc-noMMU.patch
@@ -0,0 +1,32 @@
+From 430ab62f356d9e45e2231b0483ee33eaf3af5df3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 9 Jun 2017 10:19:32 +0200
+Subject: [PATCH] Fix gdbserver build on uClibc/noMMU
+
+The noMMU specific code requires including <sched.h>.
+
+Originally from
+https://cgit.openadk.org/cgi/cgit/openadk.git/plain/package/gdbserver/patches/nommu.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gdb/nat/linux-ptrace.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gdb/nat/linux-ptrace.h b/gdb/nat/linux-ptrace.h
+index 5954945..80bb674 100644
+--- a/gdb/nat/linux-ptrace.h
++++ b/gdb/nat/linux-ptrace.h
+@@ -23,7 +23,8 @@ struct buffer;
+ #include "nat/gdb_ptrace.h"
+ 
+ #ifdef __UCLIBC__
+-#if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_HAS_MMU__))
++#include <sched.h>
++#if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_USE_MMU__))
+ /* PTRACE_TEXT_ADDR and friends.  */
+ #include <asm/ptrace.h>
+ #define HAS_NOMMU
+-- 
+2.7.4
+
