From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:25:00 -0000
Subject: [Buildroot] [git commit] package/gdb: drop support for gdb 8.1
Message-ID: <20200902161634.ECD1785EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a57e123b83476d753bb6d76a169744b37676cecc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that gdb 9.2 has been introduced, and gdb 8.3 is the default gdb
version, we can drop the oldest gdb version, 8.1.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |   7 +
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  55 -------
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  43 ------
 package/gdb/8.1.1/0003-use-asm-sgidefs.h.patch     |  40 -----
 .../8.1.1/0004-gdbserver-fix-build-for-m68k.patch  |  62 --------
 ...-nat-fork-inferior-include-linux-ptrace.h.patch |  51 ------
 ...ular_file-from-common-utils.c-to-filestuf.patch | 172 ---------------------
 ...g-TRAP_HWBKPT-before-including-gdb_wait-h.patch |  54 -------
 ...ct-use-of-is-operator-for-comparison-in-p.patch |  42 -----
 package/gdb/Config.in.host                         |   4 -
 package/gdb/gdb.hash                               |   1 -
 11 files changed, 7 insertions(+), 524 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cf7aaf75a5..f002d18df6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.08"
 
+config BR2_GDB_VERSION_8_1
+	bool "gdb 8.1.x has been removed"
+	select BR2_LEGACY
+	help
+	  The 8.1.x version of gdb has been removed. Use a newer
+	  version instead.
+
 config BR2_PACKAGE_EFL_GIF
 	bool "efl evas gif loader is mandatory"
 	select BR2_LEGACY
diff --git a/package/gdb/8.1.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.1.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
deleted file mode 100644
index 9e011c728d..0000000000
--- a/package/gdb/8.1.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
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
diff --git a/package/gdb/8.1.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.1.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
deleted file mode 100644
index d31e5dd11a..0000000000
--- a/package/gdb/8.1.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
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
diff --git a/package/gdb/8.1.1/0003-use-asm-sgidefs.h.patch b/package/gdb/8.1.1/0003-use-asm-sgidefs.h.patch
deleted file mode 100644
index d30336904f..0000000000
--- a/package/gdb/8.1.1/0003-use-asm-sgidefs.h.patch
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
diff --git a/package/gdb/8.1.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.1.1/0004-gdbserver-fix-build-for-m68k.patch
deleted file mode 100644
index 451bed312c..0000000000
--- a/package/gdb/8.1.1/0004-gdbserver-fix-build-for-m68k.patch
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
diff --git a/package/gdb/8.1.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/8.1.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
deleted file mode 100644
index dea24725fc..0000000000
--- a/package/gdb/8.1.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 887c667089e5417fdc7c5bbb364b027e86a7c113 Mon Sep 17 00:00:00 2001
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
-index 8b59387fa5..05167628a6 100644
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
diff --git a/package/gdb/8.1.1/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch b/package/gdb/8.1.1/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch
deleted file mode 100644
index fa1647495f..0000000000
--- a/package/gdb/8.1.1/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From 083849deeeec2854b2657b46380273ee13f4fa1b Mon Sep 17 00:00:00 2001
-From: Sergio Durigan Junior <sergiodj@redhat.com>
-Date: Wed, 12 Sep 2018 13:16:02 -0400
-Subject: [PATCH] Move 'is_regular_file' from common-utils.c to filestuff.c
-
-There is no reason for 'is_regular_file' to be in common-utils.c; it
-belongs to 'filestuff.c'.  This commit moves the function definition
-and its prototype to the appropriate files.
-
-The motivation behind this move is a failure that happens on certain
-cross-compilation environments when compiling the IPA library, due to
-the way gnulib probes the need for a 'stat' call replacement.  Because
-configure checks when cross-compiling are more limited, gnulib decides
-that it needs to substitute the 'stat' calls its own 'rpl_stat';
-however, the IPA library doesn't link with gnulib, which leads to an
-error when compiling 'common-utils.c':
-
-  ...
-  /opt/x86-core2--musl--bleeding-edge-2018.09-1/bin/i686-buildroot-linux-musl-g++  -shared -fPIC -Wl,--soname=libinproctrace.so -Wl,--no-undefined -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os      -I. -I. -I./../common -I./../regformats -I./.. -I./../../include -I./../gnulib/import -Ibuild-gnulib-gdbserver/import -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -Wpointer-arith -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wempty-body -Wunused-but-set-parameter -Wunused-but-set-variable -Wno-sign-compare -Wno-narrowing -Wno-error=maybe-uninitialized  -DGDBSERVER \
-   -Wl,--dynamic-list=./proc-service.list -o libinproctrace.so ax-ipa.o common-utils-ipa.o errors-ipa.o format-ipa.o print-utils-ipa.o regcache-ipa.o remote-utils-ipa.o rsp-low-ipa.o tdesc-ipa.o tracepoint-ipa.o utils-ipa.o vec-ipa.o linux-i386-ipa.o linux-x86-tdesc-ipa.o arch/i386-ipa.o -ldl -pthread
-  /opt/x86-core2--musl--bleeding-edge-2018.09-1/lib/gcc/i686-buildroot-linux-musl/8.2.0/../../../../i686-buildroot-linux-musl/bin/ld: common-utils-ipa.o: in function `is_regular_file(char const*, int*)':
-  common-utils.c:(.text+0x695): undefined reference to `rpl_stat'
-  collect2: error: ld returned 1 exit status
-  Makefile:413: recipe for target 'libinproctrace.so' failed
-  make[1]: *** [libinproctrace.so] Error 1
-  ...
-
-More details can also be found at:
-
-  https://sourceware.org/ml/gdb-patches/2018-09/msg00304.html
-
-The most simple fix for this problem is to move 'is_regular_file' to
-'filestuff.c', which is not used by IPA.  This ends up making the
-files more logically organized as well, since 'is_regular_file' is a
-file operation.
-
-No regressions found.
-
-gdb/ChangeLog:
-2018-09-12  Sergio Durigan Junior  <sergiodj@redhat.com>
-
-	* common/common-utils.c: Don't include '<sys/stat.h>'.
-	(is_regular_file): Move to...
-	* common/filestuff.c (is_regular_file): ... here.
-	* common/common-utils.h (is_regular_file): Move to...
-	* common/filestuff.h (is_regular_file): ... here.
-
-(cherry picked from commit 3c025cfe5efc44eb4dfb03b53dca28e75096dd1e)
-[Romain: backport to gdb 8.1 and remove ChangeLog enty]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdb/common/common-utils.c | 30 ------------------------------
- gdb/common/common-utils.h |  5 -----
- gdb/common/filestuff.c    | 31 +++++++++++++++++++++++++++++++
- gdb/common/filestuff.h    |  5 +++++
- 4 files changed, 36 insertions(+), 35 deletions(-)
-
-diff --git a/gdb/common/common-utils.c b/gdb/common/common-utils.c
-index 80de826ba78..90a06390141 100644
---- a/gdb/common/common-utils.c
-+++ b/gdb/common/common-utils.c
-@@ -20,7 +20,6 @@
- #include "common-defs.h"
- #include "common-utils.h"
- #include "host-defs.h"
--#include <sys/stat.h>
- #include <ctype.h>
- 
- /* The xmalloc() (libiberty.h) family of memory management routines.
-@@ -411,32 +410,3 @@ stringify_argv (const std::vector<char *> &args)
- }
- 
- /* See common/common-utils.h.  */
--
--bool
--is_regular_file (const char *name, int *errno_ptr)
--{
--  struct stat st;
--  const int status = stat (name, &st);
--
--  /* Stat should never fail except when the file does not exist.
--     If stat fails, analyze the source of error and return true
--     unless the file does not exist, to avoid returning false results
--     on obscure systems where stat does not work as expected.  */
--
--  if (status != 0)
--    {
--      if (errno != ENOENT)
--	return true;
--      *errno_ptr = ENOENT;
--      return false;
--    }
--
--  if (S_ISREG (st.st_mode))
--    return true;
--
--  if (S_ISDIR (st.st_mode))
--    *errno_ptr = EISDIR;
--  else
--    *errno_ptr = EINVAL;
--  return false;
--}
-diff --git a/gdb/common/common-utils.h b/gdb/common/common-utils.h
-index 5408c354693..2320318de74 100644
---- a/gdb/common/common-utils.h
-+++ b/gdb/common/common-utils.h
-@@ -146,9 +146,4 @@ in_inclusive_range (T value, T low, T high)
-   return value >= low && value <= high;
- }
- 
--/* Return true if the file NAME exists and is a regular file.
--   If the result is false then *ERRNO_PTR is set to a useful value assuming
--   we're expecting a regular file.  */
--extern bool is_regular_file (const char *name, int *errno_ptr);
--
- #endif
-diff --git a/gdb/common/filestuff.c b/gdb/common/filestuff.c
-index f5a754ffa66..fa10165a7ca 100644
---- a/gdb/common/filestuff.c
-+++ b/gdb/common/filestuff.c
-@@ -417,3 +417,34 @@ make_cleanup_close (int fd)
-   *saved_fd = fd;
-   return make_cleanup_dtor (do_close_cleanup, saved_fd, xfree);
- }
-+
-+/* See common/filestuff.h.  */
-+
-+bool
-+is_regular_file (const char *name, int *errno_ptr)
-+{
-+  struct stat st;
-+  const int status = stat (name, &st);
-+
-+  /* Stat should never fail except when the file does not exist.
-+     If stat fails, analyze the source of error and return true
-+     unless the file does not exist, to avoid returning false results
-+     on obscure systems where stat does not work as expected.  */
-+
-+  if (status != 0)
-+    {
-+      if (errno != ENOENT)
-+	return true;
-+      *errno_ptr = ENOENT;
-+      return false;
-+    }
-+
-+  if (S_ISREG (st.st_mode))
-+    return true;
-+
-+  if (S_ISDIR (st.st_mode))
-+    *errno_ptr = EISDIR;
-+  else
-+    *errno_ptr = EINVAL;
-+  return false;
-+}
-diff --git a/gdb/common/filestuff.h b/gdb/common/filestuff.h
-index 92a2a5f4c70..cc6dd861379 100644
---- a/gdb/common/filestuff.h
-+++ b/gdb/common/filestuff.h
-@@ -84,4 +84,9 @@ extern int gdb_pipe_cloexec (int filedes[2]);
- 
- extern struct cleanup *make_cleanup_close (int fd);
- 
-+/* Return true if the file NAME exists and is a regular file.
-+   If the result is false then *ERRNO_PTR is set to a useful value assuming
-+   we're expecting a regular file.  */
-+extern bool is_regular_file (const char *name, int *errno_ptr);
-+
- #endif /* FILESTUFF_H */
--- 
-2.14.4
-
diff --git a/package/gdb/8.1.1/0007-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch b/package/gdb/8.1.1/0007-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch
deleted file mode 100644
index 1e85d9314c..0000000000
--- a/package/gdb/8.1.1/0007-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-gdb_wait-h.patch
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
diff --git a/package/gdb/8.1.1/0008-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch b/package/gdb/8.1.1/0008-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
deleted file mode 100644
index 989a5b1347..0000000000
--- a/package/gdb/8.1.1/0008-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
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
index 8044a5bf83..42021b8086 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -69,9 +69,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-config BR2_GDB_VERSION_8_1
-	bool "gdb 8.1.x"
-
 config BR2_GDB_VERSION_8_2
 	bool "gdb 8.2.x"
 
@@ -90,7 +87,6 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2020.03-release-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
-	default "8.1.1"    if BR2_GDB_VERSION_8_1
 	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
 	default "8.3.1"    if BR2_GDB_VERSION_8_3
 	default "9.2"      if BR2_GDB_VERSION_9_2
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 54fe0ff2a4..03e2afe102 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e2fe8ae4511298a570ef150eeefdc667ef7cf527f0cf60943177ab6c9  gdb-8.1.1.tar.xz
 sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11  gdb-8.2.1.tar.xz
 sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b127fff000b65c334826ff8304a54ff6098428365a8e997cca886c39e9a  gdb-8.3.1.tar.xz
 sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
