From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:59:32 +0200
Subject: [Buildroot] [git commit] package/gdb: bump to version 8.2
Message-ID: <20180916141031.723EF88331@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4965948ce4075817afa1bf68f235c35b70e8c767
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase existing patches on gdb 8.2.

https://sourceware.org/ml/gdb-announce/2018/msg00003.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  55 +++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  43 +++++
 package/gdb/8.2/0003-use-asm-sgidefs.h.patch       |  40 +++++
 .../8.2/0004-gdbserver-fix-build-for-m68k.patch    |  62 +++++++
 ...-nat-fork-inferior-include-linux-ptrace.h.patch |  51 ++++++
 ...ular_file-from-common-utils.c-to-filestuf.patch | 179 +++++++++++++++++++++
 package/gdb/Config.in.host                         |   7 +
 package/gdb/gdb.hash                               |   1 +
 8 files changed, 438 insertions(+)

diff --git a/package/gdb/8.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000000..1672ad2a15
--- /dev/null
+++ b/package/gdb/8.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,55 @@
+From 7dd846212d46b5d0930c938222181cd305254951 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2016 17:32:50 -0700
+Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Rebase on gdb 8.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/gdbserver/linux-ppc-low.c | 6 ++++++
+ gdb/nat/ppc-linux.h           | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
+index 47428c1529c..841a5e02b9d 100644
+--- a/gdb/gdbserver/linux-ppc-low.c
++++ b/gdb/gdbserver/linux-ppc-low.c
+@@ -21,7 +21,13 @@
+ #include "linux-low.h"
+ 
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
+index 3d4d4fdc563..5b93af8d3a3 100644
+--- a/gdb/nat/ppc-linux.h
++++ b/gdb/nat/ppc-linux.h
+@@ -18,7 +18,13 @@
+ #ifndef PPC_LINUX_H
+ #define PPC_LINUX_H 1
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
+2.14.4
+
diff --git a/package/gdb/8.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000000..ef2a94295c
--- /dev/null
+++ b/package/gdb/8.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,43 @@
+From 6fade51aa4efd700e4a4054aaddb22eda0de7576 Mon Sep 17 00:00:00 2001
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
+index 76876f08078..ec4491474ac 100644
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
+2.14.4
+
diff --git a/package/gdb/8.2/0003-use-asm-sgidefs.h.patch b/package/gdb/8.2/0003-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..08146d3031
--- /dev/null
+++ b/package/gdb/8.2/0003-use-asm-sgidefs.h.patch
@@ -0,0 +1,40 @@
+From b286989e94e09c992462771cdbd3dc684f660b4f Mon Sep 17 00:00:00 2001
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
+index 21b1f583b92..de525ae6b01 100644
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
+2.14.4
+
diff --git a/package/gdb/8.2/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.2/0004-gdbserver-fix-build-for-m68k.patch
new file mode 100644
index 0000000000..c8f8ffb80c
--- /dev/null
+++ b/package/gdb/8.2/0004-gdbserver-fix-build-for-m68k.patch
@@ -0,0 +1,62 @@
+From 69cbbbbbd425111428db5ae91767dae5436ba63d Mon Sep 17 00:00:00 2001
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
+index 5594f10f927..19b4ef7b259 100644
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
+2.14.4
+
diff --git a/package/gdb/8.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/8.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
new file mode 100644
index 0000000000..a47dcf31e8
--- /dev/null
+++ b/package/gdb/8.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
@@ -0,0 +1,51 @@
+From fa319a6202cfe6e0415d28d6995019b18c16cd60 Mon Sep 17 00:00:00 2001
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
+---
+ gdb/nat/fork-inferior.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/nat/fork-inferior.c b/gdb/nat/fork-inferior.c
+index ea71aad25f7..77b9e03878b 100644
+--- a/gdb/nat/fork-inferior.c
++++ b/gdb/nat/fork-inferior.c
+@@ -26,6 +26,7 @@
+ #include "common-gdbthread.h"
+ #include "signals-state-save-restore.h"
+ #include "gdb_tilde_expand.h"
++#include "linux-ptrace.h"
+ #include <vector>
+ 
+ extern char **environ;
+-- 
+2.14.4
+
diff --git a/package/gdb/8.2/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch b/package/gdb/8.2/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch
new file mode 100644
index 0000000000..a228affce7
--- /dev/null
+++ b/package/gdb/8.2/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch
@@ -0,0 +1,179 @@
+From d4b53d090e09f8929df0367e446569dc32cf269d Mon Sep 17 00:00:00 2001
+From: Sergio Durigan Junior <sergiodj@redhat.com>
+Date: Wed, 12 Sep 2018 13:16:02 -0400
+Subject: [PATCH] Move 'is_regular_file' from common-utils.c to filestuff.c
+
+There is no reason for 'is_regular_file' to be in common-utils.c; it
+belongs to 'filestuff.c'.  This commit moves the function definition
+and its prototype to the appropriate files.
+
+The motivation behind this move is a failure that happens on certain
+cross-compilation environments when compiling the IPA library, due to
+the way gnulib probes the need for a 'stat' call replacement.  Because
+configure checks when cross-compiling are more limited, gnulib decides
+that it needs to substitute the 'stat' calls its own 'rpl_stat';
+however, the IPA library doesn't link with gnulib, which leads to an
+error when compiling 'common-utils.c':
+
+  ...
+  /opt/x86-core2--musl--bleeding-edge-2018.09-1/bin/i686-buildroot-linux-musl-g++  -shared -fPIC -Wl,--soname=libinproctrace.so -Wl,--no-undefined -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os      -I. -I. -I./../common -I./../regformats -I./.. -I./../../include -I./../gnulib/import -Ibuild-gnulib-gdbserver/import -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wpointer-arith -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wempty-body -Wunused-but-set-parameter -Wunused-but-set-variable -Wno-sign-compare -Wno-narrowing -Wno-error=maybe-uninitialized  -DGDBSERVER \
+   -Wl,--dynamic-list=./proc-service.list -o libinproctrace.so ax-ipa.o common-utils-ipa.o errors-ipa.o format-ipa.o print-utils-ipa.o regcache-ipa.o remote-utils-ipa.o rsp-low-ipa.o tdesc-ipa.o tracepoint-ipa.o utils-ipa.o vec-ipa.o linux-i386-ipa.o linux-x86-tdesc-ipa.o arch/i386-ipa.o -ldl -pthread
+  /opt/x86-core2--musl--bleeding-edge-2018.09-1/lib/gcc/i686-buildroot-linux-musl/8.2.0/../../../../i686-buildroot-linux-musl/bin/ld: common-utils-ipa.o: in function `is_regular_file(char const*, int*)':
+  common-utils.c:(.text+0x695): undefined reference to `rpl_stat'
+  collect2: error: ld returned 1 exit status
+  Makefile:413: recipe for target 'libinproctrace.so' failed
+  make[1]: *** [libinproctrace.so] Error 1
+  ...
+
+More details can also be found at:
+
+  https://sourceware.org/ml/gdb-patches/2018-09/msg00304.html
+
+The most simple fix for this problem is to move 'is_regular_file' to
+'filestuff.c', which is not used by IPA.  This ends up making the
+files more logically organized as well, since 'is_regular_file' is a
+file operation.
+
+No regressions found.
+
+gdb/ChangeLog:
+2018-09-12  Sergio Durigan Junior  <sergiodj@redhat.com>
+
+	* common/common-utils.c: Don't include '<sys/stat.h>'.
+	(is_regular_file): Move to...
+	* common/filestuff.c (is_regular_file): ... here.
+	* common/common-utils.h (is_regular_file): Move to...
+	* common/filestuff.h (is_regular_file): ... here.
+
+(cherry picked from commit 3c025cfe5efc44eb4dfb03b53dca28e75096dd1e)
+[Romain: backport to gdb 8.2 and remove ChangeLog enty]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/common/common-utils.c | 32 --------------------------------
+ gdb/common/common-utils.h |  5 -----
+ gdb/common/filestuff.c    | 31 +++++++++++++++++++++++++++++++
+ gdb/common/filestuff.h    |  5 +++++
+ 4 files changed, 36 insertions(+), 37 deletions(-)
+
+diff --git a/gdb/common/common-utils.c b/gdb/common/common-utils.c
+index 8d839d10fa8..24b3936f3dc 100644
+--- a/gdb/common/common-utils.c
++++ b/gdb/common/common-utils.c
+@@ -20,7 +20,6 @@
+ #include "common-defs.h"
+ #include "common-utils.h"
+ #include "host-defs.h"
+-#include <sys/stat.h>
+ #include <ctype.h>
+ 
+ /* The xmalloc() (libiberty.h) family of memory management routines.
+@@ -412,37 +411,6 @@ stringify_argv (const std::vector<char *> &args)
+ 
+ /* See common/common-utils.h.  */
+ 
+-bool
+-is_regular_file (const char *name, int *errno_ptr)
+-{
+-  struct stat st;
+-  const int status = stat (name, &st);
+-
+-  /* Stat should never fail except when the file does not exist.
+-     If stat fails, analyze the source of error and return true
+-     unless the file does not exist, to avoid returning false results
+-     on obscure systems where stat does not work as expected.  */
+-
+-  if (status != 0)
+-    {
+-      if (errno != ENOENT)
+-	return true;
+-      *errno_ptr = ENOENT;
+-      return false;
+-    }
+-
+-  if (S_ISREG (st.st_mode))
+-    return true;
+-
+-  if (S_ISDIR (st.st_mode))
+-    *errno_ptr = EISDIR;
+-  else
+-    *errno_ptr = EINVAL;
+-  return false;
+-}
+-
+-/* See common/common-utils.h.  */
+-
+ ULONGEST
+ align_up (ULONGEST v, int n)
+ {
+diff --git a/gdb/common/common-utils.h b/gdb/common/common-utils.h
+index 7bc6e90f05c..a961514fd66 100644
+--- a/gdb/common/common-utils.h
++++ b/gdb/common/common-utils.h
+@@ -146,11 +146,6 @@ in_inclusive_range (T value, T low, T high)
+   return value >= low && value <= high;
+ }
+ 
+-/* Return true if the file NAME exists and is a regular file.
+-   If the result is false then *ERRNO_PTR is set to a useful value assuming
+-   we're expecting a regular file.  */
+-extern bool is_regular_file (const char *name, int *errno_ptr);
+-
+ /* Ensure that V is aligned to an N byte boundary (B's assumed to be a
+    power of 2).  Round up/down when necessary.  Examples of correct
+    use include:
+diff --git a/gdb/common/filestuff.c b/gdb/common/filestuff.c
+index f5a754ffa66..fa10165a7ca 100644
+--- a/gdb/common/filestuff.c
++++ b/gdb/common/filestuff.c
+@@ -417,3 +417,34 @@ make_cleanup_close (int fd)
+   *saved_fd = fd;
+   return make_cleanup_dtor (do_close_cleanup, saved_fd, xfree);
+ }
++
++/* See common/filestuff.h.  */
++
++bool
++is_regular_file (const char *name, int *errno_ptr)
++{
++  struct stat st;
++  const int status = stat (name, &st);
++
++  /* Stat should never fail except when the file does not exist.
++     If stat fails, analyze the source of error and return true
++     unless the file does not exist, to avoid returning false results
++     on obscure systems where stat does not work as expected.  */
++
++  if (status != 0)
++    {
++      if (errno != ENOENT)
++	return true;
++      *errno_ptr = ENOENT;
++      return false;
++    }
++
++  if (S_ISREG (st.st_mode))
++    return true;
++
++  if (S_ISDIR (st.st_mode))
++    *errno_ptr = EISDIR;
++  else
++    *errno_ptr = EINVAL;
++  return false;
++}
+diff --git a/gdb/common/filestuff.h b/gdb/common/filestuff.h
+index 0e46eb5da0b..21b4edd6bf6 100644
+--- a/gdb/common/filestuff.h
++++ b/gdb/common/filestuff.h
+@@ -98,4 +98,9 @@ struct gdb_dir_deleter
+ 
+ typedef std::unique_ptr<DIR, gdb_dir_deleter> gdb_dir_up;
+ 
++/* Return true if the file NAME exists and is a regular file.
++   If the result is false then *ERRNO_PTR is set to a useful value assuming
++   we're expecting a regular file.  */
++extern bool is_regular_file (const char *name, int *errno_ptr);
++
+ #endif /* FILESTUFF_H */
+-- 
+2.14.4
+
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index fd05898345..dce868816b 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -63,6 +63,11 @@ config BR2_GDB_VERSION_8_1
 	# Needs a C++11 compiler
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
 
+config BR2_GDB_VERSION_8_2
+	bool "gdb 8.2.x"
+	# Needs a C++11 compiler
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+
 endchoice
 
 endif
@@ -82,6 +87,7 @@ config BR2_PACKAGE_GDB_NEEDS_CXX11
 	default y if !BR2_PACKAGE_HOST_GDB
 	default y if BR2_GDB_VERSION_8_0
 	default y if BR2_GDB_VERSION_8_1
+	default y if BR2_GDB_VERSION_8_2
 	default y if BR2_arc
 
 # If cross-gdb is not enabled, the latest working version is chosen.
@@ -91,4 +97,5 @@ config BR2_GDB_VERSION
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0 || !BR2_PACKAGE_HOST_GDB
 	default "8.1.1"    if BR2_GDB_VERSION_8_1
+	default "8.2"      if BR2_GDB_VERSION_8_2
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index f1424faaf2..f7c7b80327 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,6 +2,7 @@
 sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
 sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
 sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e2fe8ae4511298a570ef150eeefdc667ef7cf527f0cf60943177ab6c9	gdb-8.1.1.tar.xz
+sha512  11cc481bebc51eb6db73249ecb62b8c07455cf3db169f4860b3a83114849fbd2b5860a2db64488ba6c5909cf07b255c04770f1e36059eae6bee16d2a3581be90	gdb-8.2.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b17e4066730491f6a75b00eab78012f67cc445fe95ecd82c06cda7c1255190e6c471ac89b92f2fcdba4790b0046756b9cecf1f827537afcb44e1e578345852ad 	gdb-arc-2018.03-gdb.tar.gz
