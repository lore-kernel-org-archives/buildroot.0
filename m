From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 23:53:36 +0200
Subject: [Buildroot] [git commit] package/gdb: bump to version 8.3
Message-ID: <20190606220726.A21B5810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d39d53e7bd79262e940a2d770840779ff161c90b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase local patches.

See:
https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00007.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 +++++++++++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++++
 package/gdb/8.3/0003-use-asm-sgidefs.h.patch       | 40 ++++++++++++++
 .../8.3/0004-gdbserver-fix-build-for-m68k.patch    | 62 ++++++++++++++++++++++
 ...-nat-fork-inferior-include-linux-ptrace.h.patch | 53 ++++++++++++++++++
 package/gdb/Config.in.host                         |  7 +++
 package/gdb/gdb.hash                               |  1 +
 7 files changed, 261 insertions(+)

diff --git a/package/gdb/8.3/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.3/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000000..ab8dc626f0
--- /dev/null
+++ b/package/gdb/8.3/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,55 @@
+From 72ee19f54fd35595465b2e35eccf1f3d65fe21c6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2016 17:32:50 -0700
+Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Rebase on gdb 8.3]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/gdbserver/linux-ppc-low.c | 6 ++++++
+ gdb/nat/ppc-linux.h           | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
+index 1b695e53fe9..1978347c02c 100644
+--- a/gdb/gdbserver/linux-ppc-low.c
++++ b/gdb/gdbserver/linux-ppc-low.c
+@@ -23,7 +23,13 @@
+ #include "elf/common.h"
+ #include <sys/uio.h>
+ #include <elf.h>
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #include "arch/ppc-linux-common.h"
+ #include "arch/ppc-linux-tdesc.h"
+diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
+index f1561b3b357..40399361c09 100644
+--- a/gdb/nat/ppc-linux.h
++++ b/gdb/nat/ppc-linux.h
+@@ -18,7 +18,13 @@
+ #ifndef NAT_PPC_LINUX_H
+ #define NAT_PPC_LINUX_H
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ #include <asm/cputable.h>
+ 
+ /* This sometimes isn't defined.  */
+-- 
+2.21.0
+
diff --git a/package/gdb/8.3/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.3/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000000..9d508fbf1e
--- /dev/null
+++ b/package/gdb/8.3/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,43 @@
+From ef630288fdc2d4d22651702672f9d5c9cd767e5b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 3 Jun 2017 21:23:52 +0200
+Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on !GLIBC
+ systems
+
+Fixes a pt_{dsp,}regs redefinition when building with the musl C library
+on SuperH.
+
+Inspired by
+http://git.yoctoproject.org/clean/cgit.cgi/poky/plain/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch,
+adapted for SuperH.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Rebase	on gdb 8.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/gdbserver/linux-sh-low.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-sh-low.c b/gdb/gdbserver/linux-sh-low.c
+index 0953721a190..c331c1382f7 100644
+--- a/gdb/gdbserver/linux-sh-low.c
++++ b/gdb/gdbserver/linux-sh-low.c
+@@ -27,7 +27,15 @@ extern const struct target_desc *tdesc_sh;
+ #include <sys/reg.h>
+ #endif
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++# define pt_dspregs uapi_pt_dspregs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++# undef pt_dspregs
++#endif
+ 
+ #define sh_num_regs 41
+ 
+-- 
+2.21.0
+
diff --git a/package/gdb/8.3/0003-use-asm-sgidefs.h.patch b/package/gdb/8.3/0003-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..2909f62c68
--- /dev/null
+++ b/package/gdb/8.3/0003-use-asm-sgidefs.h.patch
@@ -0,0 +1,40 @@
+From 19a0f664809b6858e69aa98188eb739415de044c Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+[Vincent:
+Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ gdb/mips-linux-nat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
+index e68ed1e4da9..bc42aa59685 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -31,7 +31,7 @@
+ #include "gdb_proc_service.h"
+ #include "gregset.h"
+ 
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ #include "nat/gdb_ptrace.h"
+ #include <asm/ptrace.h>
+ #include "inf-ptrace.h"
+-- 
+2.21.0
+
diff --git a/package/gdb/8.3/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.3/0004-gdbserver-fix-build-for-m68k.patch
new file mode 100644
index 0000000000..d718293899
--- /dev/null
+++ b/package/gdb/8.3/0004-gdbserver-fix-build-for-m68k.patch
@@ -0,0 +1,62 @@
+From 448e481aab86c823d908530038e20a14213db0a2 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 22 Jun 2018 22:40:26 +0200
+Subject: [PATCH] gdbserver: fix build for m68k
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+As for strace [1], when <sys/reg.h> is included after <linux/ptrace.h>,
+the build fails on m68k with the following diagnostics:
+
+In file included from ./../nat/linux-ptrace.h:28:0,
+                 from linux-low.h:27,
+                 from linux-m68k-low.c:20:
+[...]/usr/include/sys/reg.h:26:3: error: expected identifier before numeric constant
+   PT_D1 = 0,
+   ^
+[...]usr/include/sys/reg.h:26:3: error: expected ????}???? before numeric constant
+[...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
+In file included from linux-m68k-low.c:27:0:
+[...]usr/include/sys/reg.h:99:1: error: expected declaration before ????}???? token
+ };
+ ^
+
+Fix this by moving <sys/reg.h> on top of "linux-low.h".
+
+[1] https://github.com/strace/strace/commit/6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/gdbserver/linux-m68k-low.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-m68k-low.c b/gdb/gdbserver/linux-m68k-low.c
+index 16f639d02fc..969d9973737 100644
+--- a/gdb/gdbserver/linux-m68k-low.c
++++ b/gdb/gdbserver/linux-m68k-low.c
+@@ -17,16 +17,17 @@
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
+ #include "server.h"
++
++#ifdef HAVE_SYS_REG_H
++#include <sys/reg.h>
++#endif
++
+ #include "linux-low.h"
+ 
+ /* Defined in auto-generated file reg-m68k.c.  */
+ void init_registers_m68k (void);
+ extern const struct target_desc *tdesc_m68k;
+ 
+-#ifdef HAVE_SYS_REG_H
+-#include <sys/reg.h>
+-#endif
+-
+ #define m68k_num_regs 29
+ #define m68k_num_gregs 18
+ 
+-- 
+2.21.0
+
diff --git a/package/gdb/8.3/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/8.3/0005-nat-fork-inferior-include-linux-ptrace.h.patch
new file mode 100644
index 0000000000..394e7a2c2a
--- /dev/null
+++ b/package/gdb/8.3/0005-nat-fork-inferior-include-linux-ptrace.h.patch
@@ -0,0 +1,53 @@
+From d84ecfa3a8c8fbade89229ac66c09f2a97ab00fb Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 24 Jun 2018 23:33:55 +0200
+Subject: [PATCH] nat/fork-inferior: include linux-ptrace.h
+
+To decide whether fork() or vfork() should be used, fork-inferior.c
+uses the following test:
+
+  #if !(defined(__UCLIBC__) && defined(HAS_NOMMU))
+
+However, HAS_NOMMU is never defined, because it gets defined in
+linux-ptrace.h, which is not included by fork-inferior.c. Due to this,
+gdbserver fails to build on noMMU architectures. This commit fixes
+that by simply including linux-ptrace.h.
+
+This bug was introduced by commit
+2090129c36c7e582943b7d300968d19b46160d84 ("Share fork_inferior et al
+with gdbserver"). Indeed, the same fork()/vfork() selection was done,
+but in another file where linux-ptrace.h was included.
+
+Fixes the following build issue:
+
+../nat/fork-inferior.c: In function 'pid_t fork_inferior(const char*, const string&, char**, void (*)(), void (*)(int), void (*)(), const char*, void (*)(const char*, char* const*, char* const*))':
+../nat/fork-inferior.c:376:11: error: 'fork' was not declared in this scope
+     pid = fork ();
+           ^~~~
+../nat/fork-inferior.c:376:11: note: suggested alternative: 'vfork'
+     pid = fork ();
+           ^~~~
+           vfork
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Romain: rebase on gdb 8.3]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/nat/fork-inferior.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/nat/fork-inferior.c b/gdb/nat/fork-inferior.c
+index fe9360a5039..626fe7c1fbf 100644
+--- a/gdb/nat/fork-inferior.c
++++ b/gdb/nat/fork-inferior.c
+@@ -27,6 +27,7 @@
+ #include "common/pathstuff.h"
+ #include "common/signals-state-save-restore.h"
+ #include "common/gdb_tilde_expand.h"
++#include "linux-ptrace.h"
+ #include <vector>
+ 
+ extern char **environ;
+-- 
+2.21.0
+
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 7ce26c1628..f9a67d18dd 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -70,6 +70,11 @@ config BR2_GDB_VERSION_8_2
 	# Needs a C++11 compiler
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
 
+config BR2_GDB_VERSION_8_3
+	bool "gdb 8.3.x"
+	# Needs a C++11 compiler
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+
 endchoice
 
 endif
@@ -90,6 +95,7 @@ config BR2_PACKAGE_GDB_NEEDS_CXX11
 	default y if BR2_GDB_VERSION_8_0
 	default y if BR2_GDB_VERSION_8_1
 	default y if BR2_GDB_VERSION_8_2
+	default y if BR2_GDB_VERSION_8_3
 	default y if BR2_arc
 
 # If cross-gdb is not enabled, the latest working version is chosen.
@@ -101,4 +107,5 @@ config BR2_GDB_VERSION
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
 	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
 	default "8.2.1"    if BR2_GDB_VERSION_8_2
+	default "8.3"	   if BR2_GDB_VERSION_8_3
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index f508b6bffc..76404c533d 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,6 +3,7 @@ sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7
 sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
 sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e2fe8ae4511298a570ef150eeefdc667ef7cf527f0cf60943177ab6c9	gdb-8.1.1.tar.xz
 sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11	gdb-8.2.1.tar.xz
+sha512  47ac074d20a09a3fac8f4a41dce0a0cbe6ef702f7dc21ba8b7d650d306128dcae481e9a16bf65e596b3a541dc82ae57c02bcbb786d551b4ef3e2917b9b6f0ae1	gdb-8.3.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  bc6dcd92991222418795c49b8fc13df7354b34ba7a7f1e4214b108776da0dad730259aa4611086694bc9291126f5182b449bbc22409aeadc44b89e7a42fb4e00 	gdb-arc-2019.03-rc1-gdb.tar.gz
