From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 21:16:46 +0200
Subject: [Buildroot] [git commit] package/gdb: add version 8.1
Message-ID: <20180624193409.23EC48127E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2a39ba528370937de236fb9fe6752212bcdd36d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceware.org/ml/gdb-announce/2018/msg00001.html

gdb 8.1 has a new optional dependency on mpfr, which according to the
NEWS file:

   GDB now uses the GNU MPFR library, if available, to emulate target
   floating-point arithmetic during expression evaluation when the
   target uses different floating-point formats than the host.  At
   least version 3.1 of GNU MPFR is required.

So for the target gdb, this is unnecessary, and therefore we
forcefully disable mpfr support by passing --without-mpfr.

For the host gdb, it would potentially be useful, but since it's a new
feature that isn't essential, we for now keep it disabled as well. An
option may be added later if needed.

To avoid gnulib issues with uClibc/musl, we need to pass additional
configure/make variables, like is done in OpenEmbedded [1].

[1] http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gdb/gdb_8.1.bb?id=02664a8dcd1ebb6cd77248e1b97a78390ea06033#n9

We re-add the same patches as the ones present for gdb 8.0.1, except
0004-nat-linux-ptrace.c-add-missing-gdb_byte-cast.patch, which was
merged upstream.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas: change mpfr handling.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 +++++++++++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++++
 package/gdb/8.1/0003-use-asm-sgidefs.h.patch       | 40 ++++++++++++++
 .../8.1/0004-gdbserver-fix-build-for-m68k.patch    | 62 ++++++++++++++++++++++
 package/gdb/Config.in.host                         | 11 +++-
 package/gdb/gdb.hash                               |  1 +
 package/gdb/gdb.mk                                 | 14 ++++-
 7 files changed, 223 insertions(+), 3 deletions(-)

diff --git a/package/gdb/8.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000000..9e011c728d
--- /dev/null
+++ b/package/gdb/8.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,55 @@
+From 2acd9d3eb703b9a64ac92b3880ed546bec92af95 Mon Sep 17 00:00:00 2001
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
+index 33a9feb..1a9141f 100644
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
+ #include "nat/ppc-linux.h"
+ #include "linux-ppc-tdesc.h"
+diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
+index 5837ea1..7233929 100644
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
+2.9.4
+
diff --git a/package/gdb/8.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000000..d31e5dd11a
--- /dev/null
+++ b/package/gdb/8.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,43 @@
+From dfe4a40bc9d2fc1fd1b1a11ed733a0c0a1f59f3c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 3 Jun 2017 21:23:52 +0200
+Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on
+ !GLIBC systems
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
+index ac084c9..08e104a 100644
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
+2.9.4
+
diff --git a/package/gdb/8.1/0003-use-asm-sgidefs.h.patch b/package/gdb/8.1/0003-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..d30336904f
--- /dev/null
+++ b/package/gdb/8.1/0003-use-asm-sgidefs.h.patch
@@ -0,0 +1,40 @@
+From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
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
+index f2df1b9907..d24664cb56 100644
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
+2.13.1
+
diff --git a/package/gdb/8.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.1/0004-gdbserver-fix-build-for-m68k.patch
new file mode 100644
index 0000000000..451bed312c
--- /dev/null
+++ b/package/gdb/8.1/0004-gdbserver-fix-build-for-m68k.patch
@@ -0,0 +1,62 @@
+From 80c60ea9fb3634272a98ec526eabff25f5255bae Mon Sep 17 00:00:00 2001
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
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 8736908b6b..333da6bad2 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -64,6 +64,11 @@ config BR2_GDB_VERSION_8_0
 	# Needs a C++11 compiler
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
 
+config BR2_GDB_VERSION_8_1
+	bool "gdb 8.1.x"
+	# Needs a C++11 compiler
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+
 endchoice
 
 endif
@@ -71,14 +76,15 @@ endif
 # Tells whether the currently selected gdb version requires C++11
 # support in the toolchain. When host-gdb is not enabled, the target
 # gdb built is 7.11, which doesn't require C++11 support. So it's only
-# if host-gdb is built, with the version set to 8.0 that C++11 support
-# is needed in the toolchain to build gdb for the target.
+# if host-gdb is built, with the version set to 8.0 or 8.1 that C++11
+# support is needed in the toolchain to build gdb for the target.
 #
 # Even though this option is related to target gdb dependencies, we
 # keep it next to the BR2_GDB_VERSION so that they are kept in sync.
 config BR2_PACKAGE_GDB_NEEDS_CXX11
 	bool
 	default y if BR2_GDB_VERSION_8_0
+	default y if BR2_GDB_VERSION_8_1
 
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
@@ -88,4 +94,5 @@ config BR2_GDB_VERSION
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
+	default "8.1"      if BR2_GDB_VERSION_8_1
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index cfbaac40f6..e5c60a916b 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,6 +3,7 @@ sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe5049
 sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
 sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
 sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
+sha512  ffd82f415d7652d62dad1716c307836f594217a363429609beb7d70239e8bf06b73b393345b0e000796228e56681ed7656ac3c8be05e91d6d652ab0d5b1dc357	gdb-8.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  0c58dd3e8fff8b51a459aba78f4acd1beaa3427e00a63a7242827f22c6af157e4aea91ab754cdc021e0075a5bf2b70df903dba67dbff2415fd0f82c8aab99087 	gdb-arc-2018.03-rc2-gdb.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 5661b4a465..062f3a730c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -87,6 +87,16 @@ GDB_CONF_ENV = \
 GDB_CONF_ENV += gl_cv_func_gettimeofday_clobber=no
 GDB_MAKE_ENV += gl_cv_func_gettimeofday_clobber=no
 
+# Similarly, starting with gdb 8.1, the bundled gnulib tries to use
+# rpl_strerror. Let's tell gnulib the C library implementation works
+# well enough.
+GDB_CONF_ENV += \
+	gl_cv_func_working_strerror=yes \
+	gl_cv_func_strerror_0_works=yes
+GDB_MAKE_ENV += \
+	gl_cv_func_working_strerror=yes \
+	gl_cv_func_strerror_0_works=yes
+
 # Starting with glibc 2.25, the proc_service.h header has been copied
 # from gdb to glibc so other tools can use it. However, that makes it
 # necessary to make sure that declaration of prfpregset_t declaration
@@ -113,7 +123,8 @@ GDB_CONF_OPTS = \
 	--with-curses \
 	--without-included-gettext \
 	--disable-werror \
-	--enable-static
+	--enable-static \
+	--without-mpfr
 
 # When gdb is built as C++ application for ARC it segfaults at runtime
 # So we pass --disable-build-with-cxx config option to force gdb not to
@@ -202,6 +213,7 @@ HOST_GDB_CONF_OPTS = \
 	--disable-werror \
 	--without-included-gettext \
 	--with-curses \
+	--without-mpfr \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
