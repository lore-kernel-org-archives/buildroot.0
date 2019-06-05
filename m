From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  5 Jun 2019 14:40:16 +0200
Subject: [Buildroot] [PATCH 3/3] package/gdb: remove gdb 8.0.x
In-Reply-To: <20190605124016.13770-1-romain.naour@gmail.com>
References: <20190605124016.13770-1-romain.naour@gmail.com>
Message-ID: <20190605124016.13770-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

8.3 is around and 8.2 is the default version, so drop
8.0. Keep 7.12 which is the latest version that doesn't
requires C++11 support.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 Config.in.legacy                              |  9 +++
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 ----------------
 ...-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 -------------
 .../gdb/8.0.1/0003-use-asm-sgidefs.h.patch    | 40 ------------
 ...x-ptrace.c-add-missing-gdb_byte-cast.patch | 41 ------------
 .../0005-gdbserver-fix-build-for-m68k.patch   | 62 -------------------
 ...P_HWBKPT-before-including-gdb_wait-h.patch | 54 ----------------
 package/gdb/Config.in.host                    |  7 ---
 package/gdb/gdb.hash                          |  1 -
 9 files changed, 9 insertions(+), 303 deletions(-)
 delete mode 100644 package/gdb/8.0.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
 delete mode 100644 package/gdb/8.0.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
 delete mode 100644 package/gdb/8.0.1/0003-use-asm-sgidefs.h.patch
 delete mode 100644 package/gdb/8.0.1/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
 delete mode 100644 package/gdb/8.0.1/0005-gdbserver-fix-build-for-m68k.patch
 delete mode 100644 package/gdb/8.0.1/0006-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index c13399acda..75d6c723a9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2019.08"
+
+config BR2_GDB_VERSION_8_0
+	bool "gdb 8.0.x has been removed"
+	select BR2_LEGACY
+	help
+	  The 8.0.x version of gdb has been removed. Use a newer
+	  version instead.
+
 comment "Legacy options removed in 2019.05"
 
 config BR2_CSKY_DSP
diff --git a/package/gdb/8.0.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.0.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
deleted file mode 100644
index 9e011c728d..0000000000
--- a/package/gdb/8.0.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 2acd9d3eb703b9a64ac92b3880ed546bec92af95 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 6 Aug 2016 17:32:50 -0700
-Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Rebase on gdb 8.0]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdb/gdbserver/linux-ppc-low.c | 6 ++++++
- gdb/nat/ppc-linux.h           | 6 ++++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
-index 33a9feb..1a9141f 100644
---- a/gdb/gdbserver/linux-ppc-low.c
-+++ b/gdb/gdbserver/linux-ppc-low.c
-@@ -21,7 +21,13 @@
- #include "linux-low.h"
- 
- #include <elf.h>
-+#if !defined(__GLIBC__)
-+# define pt_regs uapi_pt_regs
-+#endif
- #include <asm/ptrace.h>
-+#if !defined(__GLIBC__)
-+# undef pt_regs
-+#endif
- 
- #include "nat/ppc-linux.h"
- #include "linux-ppc-tdesc.h"
-diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index 5837ea1..7233929 100644
---- a/gdb/nat/ppc-linux.h
-+++ b/gdb/nat/ppc-linux.h
-@@ -18,7 +18,13 @@
- #ifndef PPC_LINUX_H
- #define PPC_LINUX_H 1
- 
-+#if !defined(__GLIBC__)
-+# define pt_regs uapi_pt_regs
-+#endif
- #include <asm/ptrace.h>
-+#if !defined(__GLIBC__)
-+# undef pt_regs
-+#endif
- #include <asm/cputable.h>
- 
- /* This sometimes isn't defined.  */
--- 
-2.9.4
-
diff --git a/package/gdb/8.0.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.0.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
deleted file mode 100644
index d31e5dd11a..0000000000
--- a/package/gdb/8.0.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From dfe4a40bc9d2fc1fd1b1a11ed733a0c0a1f59f3c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 3 Jun 2017 21:23:52 +0200
-Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on
- !GLIBC systems
-
-Fixes a pt_{dsp,}regs redefinition when building with the musl C library
-on SuperH.
-
-Inspired by
-http://git.yoctoproject.org/clean/cgit.cgi/poky/plain/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch,
-adapted for SuperH.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Rebase	on gdb 8.0]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdb/gdbserver/linux-sh-low.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/gdb/gdbserver/linux-sh-low.c b/gdb/gdbserver/linux-sh-low.c
-index ac084c9..08e104a 100644
---- a/gdb/gdbserver/linux-sh-low.c
-+++ b/gdb/gdbserver/linux-sh-low.c
-@@ -27,7 +27,15 @@ extern const struct target_desc *tdesc_sh;
- #include <sys/reg.h>
- #endif
- 
-+#if !defined(__GLIBC__)
-+# define pt_regs uapi_pt_regs
-+# define pt_dspregs uapi_pt_dspregs
-+#endif
- #include <asm/ptrace.h>
-+#if !defined(__GLIBC__)
-+# undef pt_regs
-+# undef pt_dspregs
-+#endif
- 
- #define sh_num_regs 41
- 
--- 
-2.9.4
-
diff --git a/package/gdb/8.0.1/0003-use-asm-sgidefs.h.patch b/package/gdb/8.0.1/0003-use-asm-sgidefs.h.patch
deleted file mode 100644
index d30336904f..0000000000
--- a/package/gdb/8.0.1/0003-use-asm-sgidefs.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <amccurdy@gmail.com>
-Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH] use <asm/sgidefs.h>
-
-Build fix for MIPS with musl libc
-
-The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
-but not by musl. Regardless of the libc, the kernel headers provide
-<asm/sgidefs.h> which provides the same definitions, so use that
-instead.
-
-Upstream-Status: Pending
-
-[Vincent:
-Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- gdb/mips-linux-nat.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index f2df1b9907..d24664cb56 100644
---- a/gdb/mips-linux-nat.c
-+++ b/gdb/mips-linux-nat.c
-@@ -31,7 +31,7 @@
- #include "gdb_proc_service.h"
- #include "gregset.h"
- 
--#include <sgidefs.h>
-+#include <asm/sgidefs.h>
- #include "nat/gdb_ptrace.h"
- #include <asm/ptrace.h>
- #include "inf-ptrace.h"
--- 
-2.13.1
-
diff --git a/package/gdb/8.0.1/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch b/package/gdb/8.0.1/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
deleted file mode 100644
index 4eb72e4084..0000000000
--- a/package/gdb/8.0.1/0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 09a2c3e0164545324a1ddee70f5c9fdee71e2079 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 18 Jun 2017 23:09:43 +0200
-Subject: [PATCH] nat/linux-ptrace.c: add missing gdb_byte* cast
-
-On noMMU platforms, the following code gets compiled:
-
-  child_stack = xmalloc (STACK_SIZE * 4);
-
-Where child_stack is a gdb_byte*, and xmalloc() returns a void*. While
-the lack of cast is valid in C, it is not in C++, causing the
-following build failure:
-
-../nat/linux-ptrace.c: In function 'int linux_fork_to_function(gdb_byte*, int (*)(void*))':
-../nat/linux-ptrace.c:273:29: error: invalid conversion from 'void*' to 'gdb_byte* {aka unsigned char*}' [-fpermissive]
-       child_stack = xmalloc (STACK_SIZE * 4);
-
-Therefore, this commit adds the appropriate cast.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Upstream commit: ffce45d2243e5f52f411e314fc4e1a69f431a81f]
----
- gdb/nat/linux-ptrace.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
-index 3447e07..33833e2 100644
---- a/gdb/nat/linux-ptrace.c
-+++ b/gdb/nat/linux-ptrace.c
-@@ -270,7 +270,7 @@ linux_fork_to_function (gdb_byte *child_stack, int (*function) (void *))
- #define STACK_SIZE 4096
- 
-     if (child_stack == NULL)
--      child_stack = xmalloc (STACK_SIZE * 4);
-+      child_stack = (gdb_byte*) xmalloc (STACK_SIZE * 4);
- 
-     /* Use CLONE_VM instead of fork, to support uClinux (no MMU).  */
- #ifdef __ia64__
--- 
-2.9.4
-
diff --git a/package/gdb/8.0.1/0005-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.0.1/0005-gdbserver-fix-build-for-m68k.patch
deleted file mode 100644
index 451bed312c..0000000000
--- a/package/gdb/8.0.1/0005-gdbserver-fix-build-for-m68k.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 80c60ea9fb3634272a98ec526eabff25f5255bae Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 22 Jun 2018 22:40:26 +0200
-Subject: [PATCH] gdbserver: fix build for m68k
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-As for strace [1], when <sys/reg.h> is included after <linux/ptrace.h>,
-the build fails on m68k with the following diagnostics:
-
-In file included from ./../nat/linux-ptrace.h:28:0,
-                 from linux-low.h:27,
-                 from linux-m68k-low.c:20:
-[...]/usr/include/sys/reg.h:26:3: error: expected identifier before numeric constant
-   PT_D1 = 0,
-   ^
-[...]usr/include/sys/reg.h:26:3: error: expected ????}???? before numeric constant
-[...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
-In file included from linux-m68k-low.c:27:0:
-[...]usr/include/sys/reg.h:99:1: error: expected declaration before ????}???? token
- };
- ^
-
-Fix this by moving <sys/reg.h> on top of "linux-low.h".
-
-[1] https://github.com/strace/strace/commit/6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdb/gdbserver/linux-m68k-low.c | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/gdb/gdbserver/linux-m68k-low.c b/gdb/gdbserver/linux-m68k-low.c
-index 5594f10f927..19b4ef7b259 100644
---- a/gdb/gdbserver/linux-m68k-low.c
-+++ b/gdb/gdbserver/linux-m68k-low.c
-@@ -17,16 +17,17 @@
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
- #include "server.h"
-+
-+#ifdef HAVE_SYS_REG_H
-+#include <sys/reg.h>
-+#endif
-+
- #include "linux-low.h"
- 
- /* Defined in auto-generated file reg-m68k.c.  */
- void init_registers_m68k (void);
- extern const struct target_desc *tdesc_m68k;
- 
--#ifdef HAVE_SYS_REG_H
--#include <sys/reg.h>
--#endif
--
- #define m68k_num_regs 29
- #define m68k_num_gregs 18
- 
--- 
-2.14.4
-
diff --git a/package/gdb/8.0.1/0006-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch b/package/gdb/8.0.1/0006-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch
deleted file mode 100644
index 1e85d9314c..0000000000
--- a/package/gdb/8.0.1/0006-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8 Mon Sep 17 00:00:00 2001
-From: James Clarke <jrtc27@jrtc27.com>
-Date: Fri, 19 Jan 2018 17:22:49 +0000
-Subject: [PATCH] gdb: Fix ia64 defining TRAP_HWBKPT before including
- gdb_wait.h
-
-On ia64, gdb_wait.h eventually includes siginfo-consts-arch.h, which
-contains an enum with TRAP_HWBKPT, along with a #define. Thus we cannot
-define TRAP_HWBKPT to 4 beforehand, and so gdb_wait.h must be included
-earlier; include it from linux-ptrace.h so it can never come afterwards.
-
-gdb/ChangeLog:
-
-	* nat/linux-ptrace.c: Remove unnecessary reinclusion of
-	gdb_ptrace.h, and move including gdb_wait.h ...
-	* nat/linux-ptrace.h: ... to here.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and updated to remove ChangeLog update) from:
-https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8]
----
- gdb/ChangeLog          | 6 ++++++
- gdb/nat/linux-ptrace.c | 2 --
- gdb/nat/linux-ptrace.h | 1 +
- 3 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
-index 5c4ddc9..1f21ef0 100644
---- a/gdb/nat/linux-ptrace.c
-+++ b/gdb/nat/linux-ptrace.c
-@@ -21,8 +21,6 @@
- #include "linux-procfs.h"
- #include "linux-waitpid.h"
- #include "buffer.h"
--#include "gdb_wait.h"
--#include "gdb_ptrace.h"
- #ifdef HAVE_SYS_PROCFS_H
- #include <sys/procfs.h>
- #endif
-diff --git a/gdb/nat/linux-ptrace.h b/gdb/nat/linux-ptrace.h
-index 60967a3..dc180fb 100644
---- a/gdb/nat/linux-ptrace.h
-+++ b/gdb/nat/linux-ptrace.h
-@@ -21,6 +21,7 @@
- struct buffer;
- 
- #include "nat/gdb_ptrace.h"
-+#include "gdb_wait.h"
- 
- #ifdef __UCLIBC__
- #if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_HAS_MMU__))
--- 
-2.9.3
-
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a395016082..9d3bc0f8a0 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -55,11 +55,6 @@ choice
 config BR2_GDB_VERSION_7_12
 	bool "gdb 7.12.x"
 
-config BR2_GDB_VERSION_8_0
-	bool "gdb 8.0.x"
-	# Needs a C++11 compiler
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
-
 config BR2_GDB_VERSION_8_1
 	bool "gdb 8.1.x"
 	# Needs a C++11 compiler
@@ -92,7 +87,6 @@ endif
 config BR2_PACKAGE_GDB_NEEDS_CXX11
 	bool
 	default y if !BR2_PACKAGE_HOST_GDB
-	default y if BR2_GDB_VERSION_8_0
 	default y if BR2_GDB_VERSION_8_1
 	default y if BR2_GDB_VERSION_8_2
 	default y if BR2_GDB_VERSION_8_3
@@ -104,7 +98,6 @@ config BR2_GDB_VERSION
 	default "arc-2019.03-rc1-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
-	default "8.0.1"    if BR2_GDB_VERSION_8_0
 	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
 	default "8.2.1"    if BR2_GDB_VERSION_8_2
 	default "8.3"	   if BR2_GDB_VERSION_8_3
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 76404c533d..e032cc8f70 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,6 +1,5 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
-sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
 sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e2fe8ae4511298a570ef150eeefdc667ef7cf527f0cf60943177ab6c9	gdb-8.1.1.tar.xz
 sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11	gdb-8.2.1.tar.xz
 sha512  47ac074d20a09a3fac8f4a41dce0a0cbe6ef702f7dc21ba8b7d650d306128dcae481e9a16bf65e596b3a541dc82ae57c02bcbb786d551b4ef3e2917b9b6f0ae1	gdb-8.3.tar.xz
-- 
2.21.0
