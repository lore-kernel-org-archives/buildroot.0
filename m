From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  5 Aug 2020 16:03:37 +0200
Subject: [Buildroot] [PATCHv2] package/gdb: bump to version 9.2
Message-ID: <20200805140337.427704-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxim Kochetkov <fido_max@inbox.ru>

The in-tree build restriction has been added after the move of gnulib to top level [1] [2].
This restriction has been added as a workaround a build issue with gdbserver that still use
it's own copy of gnulib.

gnulib is configured a second time if we build in-tree gdb and gdbserver:
    configure: error: source directory already configured; run "make distclean" there first
    configure: error: .././../../gnulib/configure failed for build-gnulib-gdbserver
    configure: error: ./configure failed for gdbserver

Use the same pre-configure-hook as gcc package.

Older gdb version support building out of tree even if it's not required.

There is no in-tree build restriction of we only build gdbserver for the target.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=73cc72729a184f00bf6fc4d74684a8516ba6b683
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=043a0010933a6b55081535ecaf7fde9cc1491be0

See:
https://sourceware.org/pipermail/gdb-announce/2020/000122.html
https://sourceware.org/pipermail/gdb-announce/2020/000123.html

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Romain:
    - add in-tree build support
    - improve commit log]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 ++++++++++++++++
 ...-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++
 package/gdb/9.2/0003-use-asm-sgidefs.h.patch  | 40 ++++++++++++
 .../0004-gdbserver-fix-build-for-m68k.patch   | 62 +++++++++++++++++++
 ...fork-inferior-include-linux-ptrace.h.patch | 53 ++++++++++++++++
 package/gdb/Config.in.host                    |  4 ++
 package/gdb/gdb.hash                          |  1 +
 package/gdb/gdb.mk                            | 23 ++++++-
 8 files changed, 280 insertions(+), 1 deletion(-)
 create mode 100644 package/gdb/9.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
 create mode 100644 package/gdb/9.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
 create mode 100644 package/gdb/9.2/0003-use-asm-sgidefs.h.patch
 create mode 100644 package/gdb/9.2/0004-gdbserver-fix-build-for-m68k.patch
 create mode 100644 package/gdb/9.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch

diff --git a/package/gdb/9.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/9.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000000..ab8dc626f0
--- /dev/null
+++ b/package/gdb/9.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
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
diff --git a/package/gdb/9.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/9.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000000..9d508fbf1e
--- /dev/null
+++ b/package/gdb/9.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
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
diff --git a/package/gdb/9.2/0003-use-asm-sgidefs.h.patch b/package/gdb/9.2/0003-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..2909f62c68
--- /dev/null
+++ b/package/gdb/9.2/0003-use-asm-sgidefs.h.patch
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
diff --git a/package/gdb/9.2/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/9.2/0004-gdbserver-fix-build-for-m68k.patch
new file mode 100644
index 0000000000..d718293899
--- /dev/null
+++ b/package/gdb/9.2/0004-gdbserver-fix-build-for-m68k.patch
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
+[...]usr/include/sys/reg.h:26:3: error: expected ??}?? before numeric constant
+[...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
+In file included from linux-m68k-low.c:27:0:
+[...]usr/include/sys/reg.h:99:1: error: expected declaration before ??}?? token
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
diff --git a/package/gdb/9.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/9.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
new file mode 100644
index 0000000000..1df5452682
--- /dev/null
+++ b/package/gdb/9.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
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
+ #include "gdbsupport/pathstuff.h"
+ #include "gdbsupport/signals-state-save-restore.h"
+ #include "gdbsupport/gdb_tilde_expand.h"
++#include "linux-ptrace.h"
+ #include <vector>
+ 
+ extern char **environ;
+-- 
+2.21.0
+
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index c5776c20e6..ab054b1596 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -78,6 +78,9 @@ config BR2_GDB_VERSION_8_2
 config BR2_GDB_VERSION_8_3
 	bool "gdb 8.3.x"
 
+config BR2_GDB_VERSION_9_2
+	bool "gdb 9.2.x"
+
 endchoice
 
 endif
@@ -90,4 +93,5 @@ config BR2_GDB_VERSION
 	default "8.1.1"    if BR2_GDB_VERSION_8_1
 	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
 	default "8.3.1"    if BR2_GDB_VERSION_8_3
+	default "9.2"      if BR2_GDB_VERSION_9_2
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 291c224b0f..54fe0ff2a4 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,6 +2,7 @@
 sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e2fe8ae4511298a570ef150eeefdc667ef7cf527f0cf60943177ab6c9  gdb-8.1.1.tar.xz
 sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11  gdb-8.2.1.tar.xz
 sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b127fff000b65c334826ff8304a54ff6098428365a8e997cca886c39e9a  gdb-8.3.1.tar.xz
+sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  74346a2a2b2082d35377711946b12c824222005c66813d5648350b101697eac67d3d01617e1daea03e41c196c2b7b4a4b225d1ee58af91dc69731bffed0e5d51  gdb-arc-2020.03-release-gdb.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 8c74a0e2f6..300e89671b 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -26,10 +26,20 @@ GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 # We only want gdbserver and not the entire debugger.
 ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
 GDB_SUBDIR = gdb/gdbserver
-HOST_GDB_SUBDIR = .
 else
 GDB_DEPENDENCIES = ncurses \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+GDB_SUBDIR = build
+
+# Since gdb 9, in-tree builds for GDB are not allowed anymore,
+# so we create a 'build' subdirectory in the gcc sources, and
+# build from there.
+define GDB_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/$(GDB_SUBDIR)
+	ln -sf ../configure $(@D)/$(GDB_SUBDIR)/configure
+endef
+GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
+
 endif
 
 # For the host variant, we really want to build with XML support,
@@ -251,6 +261,17 @@ else
 HOST_GDB_CONF_OPTS += --disable-sim
 endif
 
+# Since gdb 9, in-tree builds for GDB are not allowed anymore,
+# so we create a 'build' subdirectory in the gcc sources, and
+# build from there.
+HOST_GDB_SUBDIR = build
+
+define HOST_GDB_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/build
+	ln -sf ../configure $(@D)/build/configure
+endef
+HOST_GDB_PRE_CONFIGURE_HOOKS += HOST_GDB_CONFIGURE_SYMLINK
+
 # legacy $arch-linux-gdb symlink
 define HOST_GDB_ADD_SYMLINK
 	cd $(HOST_DIR)/bin && \
-- 
2.25.4
