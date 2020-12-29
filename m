From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 22:43:14 +0100
Subject: [Buildroot] [git commit] package/gdb: drop gdb 8.2
Message-ID: <20201229212933.4366B82DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86c779ee0dc3956e7a13e989dd9003f180d47a19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the introduction of gdb 10.1, we now have four versions of gdb
supported, so let's drop support for the oldest.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |  7 +++
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 -------------------
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 ---------------
 package/gdb/8.2.1/0003-use-asm-sgidefs.h.patch     | 40 --------------
 .../8.2.1/0004-gdbserver-fix-build-for-m68k.patch  | 62 ----------------------
 ...-nat-fork-inferior-include-linux-ptrace.h.patch | 51 ------------------
 ...ct-use-of-is-operator-for-comparison-in-p.patch | 42 ---------------
 package/gdb/Config.in.host                         |  4 --
 package/gdb/gdb.hash                               |  1 -
 9 files changed, 7 insertions(+), 298 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 899a72d57b..ca7fe0671b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_GDB_VERSION_8_2
+	bool "gdb 8.2.x has been removed"
+	select BR2_LEGACY
+	help
+	  gdb 8.2 support has been removed, you can use a newer
+	  version such as 8.3 or more recent.
+
 config BR2_PACKAGE_HOST_RCW
 	bool "rcw package was renamed to oriq-rcw"
 	select BR2_PACKAGE_HOST_QORIQ_RCW
diff --git a/package/gdb/8.2.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.2.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
deleted file mode 100644
index 1672ad2a15..0000000000
--- a/package/gdb/8.2.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 7dd846212d46b5d0930c938222181cd305254951 Mon Sep 17 00:00:00 2001
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
-index 47428c1529c..841a5e02b9d 100644
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
- #include "arch/ppc-linux-common.h"
- #include "arch/ppc-linux-tdesc.h"
-diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index 3d4d4fdc563..5b93af8d3a3 100644
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
-2.14.4
-
diff --git a/package/gdb/8.2.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.2.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
deleted file mode 100644
index ef2a94295c..0000000000
--- a/package/gdb/8.2.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6fade51aa4efd700e4a4054aaddb22eda0de7576 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 3 Jun 2017 21:23:52 +0200
-Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on !GLIBC
- systems
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
-index 76876f08078..ec4491474ac 100644
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
-2.14.4
-
diff --git a/package/gdb/8.2.1/0003-use-asm-sgidefs.h.patch b/package/gdb/8.2.1/0003-use-asm-sgidefs.h.patch
deleted file mode 100644
index 08146d3031..0000000000
--- a/package/gdb/8.2.1/0003-use-asm-sgidefs.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b286989e94e09c992462771cdbd3dc684f660b4f Mon Sep 17 00:00:00 2001
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
-index 21b1f583b92..de525ae6b01 100644
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
-2.14.4
-
diff --git a/package/gdb/8.2.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.2.1/0004-gdbserver-fix-build-for-m68k.patch
deleted file mode 100644
index c8f8ffb80c..0000000000
--- a/package/gdb/8.2.1/0004-gdbserver-fix-build-for-m68k.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 69cbbbbbd425111428db5ae91767dae5436ba63d Mon Sep 17 00:00:00 2001
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
diff --git a/package/gdb/8.2.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/8.2.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
deleted file mode 100644
index a47dcf31e8..0000000000
--- a/package/gdb/8.2.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From fa319a6202cfe6e0415d28d6995019b18c16cd60 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 24 Jun 2018 23:33:55 +0200
-Subject: [PATCH] nat/fork-inferior: include linux-ptrace.h
-
-To decide whether fork() or vfork() should be used, fork-inferior.c
-uses the following test:
-
-  #if !(defined(__UCLIBC__) && defined(HAS_NOMMU))
-
-However, HAS_NOMMU is never defined, because it gets defined in
-linux-ptrace.h, which is not included by fork-inferior.c. Due to this,
-gdbserver fails to build on noMMU architectures. This commit fixes
-that by simply including linux-ptrace.h.
-
-This bug was introduced by commit
-2090129c36c7e582943b7d300968d19b46160d84 ("Share fork_inferior et al
-with gdbserver"). Indeed, the same fork()/vfork() selection was done,
-but in another file where linux-ptrace.h was included.
-
-Fixes the following build issue:
-
-../nat/fork-inferior.c: In function 'pid_t fork_inferior(const char*, const string&, char**, void (*)(), void (*)(int), void (*)(), const char*, void (*)(const char*, char* const*, char* const*))':
-../nat/fork-inferior.c:376:11: error: 'fork' was not declared in this scope
-     pid = fork ();
-           ^~~~
-../nat/fork-inferior.c:376:11: note: suggested alternative: 'vfork'
-     pid = fork ();
-           ^~~~
-           vfork
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- gdb/nat/fork-inferior.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gdb/nat/fork-inferior.c b/gdb/nat/fork-inferior.c
-index ea71aad25f7..77b9e03878b 100644
---- a/gdb/nat/fork-inferior.c
-+++ b/gdb/nat/fork-inferior.c
-@@ -26,6 +26,7 @@
- #include "common-gdbthread.h"
- #include "signals-state-save-restore.h"
- #include "gdb_tilde_expand.h"
-+#include "linux-ptrace.h"
- #include <vector>
- 
- extern char **environ;
--- 
-2.14.4
-
diff --git a/package/gdb/8.2.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch b/package/gdb/8.2.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
deleted file mode 100644
index 989a5b1347..0000000000
--- a/package/gdb/8.2.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e00c211d51bec301cf04719b77076a8783ef44b5 Mon Sep 17 00:00:00 2001
-From: Raul Tambre <raul@tambre.ee>
-Date: Sat, 4 May 2019 15:48:17 -0400
-Subject: [PATCH] Fix incorrect use of 'is' operator for comparison in
- python/lib/gdb/command/prompt.py
-
-The 'is' operator is not meant to be used for comparisons. It currently working
-is an implementation detail of CPython.  CPython 3.8 has added a SyntaxWarning
-for this.
-
-(cherry picked from commit b6484282f85bf7f11451b2441599c241d302ad9d)
-[Romain: backport to gdb 8.x]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdb/python/lib/gdb/command/prompt.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gdb/python/lib/gdb/command/prompt.py b/gdb/python/lib/gdb/command/prompt.py
-index 3d662a7d3f..04b9e49c22 100644
---- a/gdb/python/lib/gdb/command/prompt.py
-+++ b/gdb/python/lib/gdb/command/prompt.py
-@@ -45,7 +45,7 @@ The currently defined substitutions are:
-         self.hook_set = False
- 
-     def get_show_string (self, pvalue):
--        if self.value is not '':
-+        if self.value:
-            return "The extended prompt is: " + self.value
-         else:
-            return "The extended prompt is not set."
-@@ -57,7 +57,7 @@ The currently defined substitutions are:
-         return ""
- 
-     def before_prompt_hook(self, current):
--        if self.value is not '':
-+        if self.value:
-             return gdb.prompt.substitute_prompt(self.value)
-         else:
-             return None
--- 
-2.25.4
-
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index f4e1c6d9ba..9ac939ec1e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -69,9 +69,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-config BR2_GDB_VERSION_8_2
-	bool "gdb 8.2.x"
-
 config BR2_GDB_VERSION_8_3
 	bool "gdb 8.3.x"
 
@@ -90,7 +87,6 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
-	default "8.2.1"    if BR2_GDB_VERSION_8_2
 	default "8.3.1"    if BR2_GDB_VERSION_8_3
 	default "9.2"      if BR2_GDB_VERSION_9_2 || !BR2_PACKAGE_HOST_GDB
 	default "10.1"	   if BR2_GDB_VERSION_10
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 779ca141bc..3b4845d64c 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11  gdb-8.2.1.tar.xz
 sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b127fff000b65c334826ff8304a54ff6098428365a8e997cca886c39e9a  gdb-8.3.1.tar.xz
 sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
 sha512  0dc54380435c6853db60f1e388b94836d294dfa9ad7f518385a27db4edd03cb970f8717d5f1e9c9a0d4a33d7fcf91bc2e5d6c9cf9e4b561dcc74e65b806c1537  gdb-10.1.tar.xz
