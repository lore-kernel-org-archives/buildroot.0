From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:34:33 +0200
Subject: [Buildroot] [git commit] busybox: fix build on SPARC and SPARC64
Message-ID: <20170725213056.904A48215D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f3f28102dc4df0ff8882df601e8534aa4ab4d35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we introduced the support for building Busybox as individual
binaries, Busybox started failing to build on SPARC/SPARC64 with this
feature enabled:

appletlib.c:(.text.find_applet_by_name+0x14): relocation truncated to fit: R_SPARC_GOT13 against symbol `applet_nameofs' defined in .rodata.applet_nameofs section in libbb/lib.a(appletlib.o)
appletlib.c:(.text.find_applet_by_name+0x18): relocation truncated to fit: R_SPARC_GOT13 against symbol `applet_names' defined in .rodata.applet_names section in libbb/lib.a(appletlib.o)
[...]

This commit adds two patches to Busybox to fix this issue, by adding
-fPIC to CFLAGS when building on SPARC/SPARC64. The patches have been
submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/90144369ccea8c41ec7643a79a7ebfaa9b7db95c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...clude-per-arch-Makefile-before-Makefile.f.patch | 46 +++++++++++++
 ...h-sparc-sparc64-Makefile-define-ARCH_FPIC.patch | 79 ++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/package/busybox/0003-Makefile-include-per-arch-Makefile-before-Makefile.f.patch b/package/busybox/0003-Makefile-include-per-arch-Makefile-before-Makefile.f.patch
new file mode 100644
index 0000000..610ca39
--- /dev/null
+++ b/package/busybox/0003-Makefile-include-per-arch-Makefile-before-Makefile.f.patch
@@ -0,0 +1,46 @@
+From 2c240f131ae5cc981702b45397be3b311c67a9ee Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 14 Jul 2017 22:23:46 +0200
+Subject: [PATCH] Makefile: include per-arch Makefile before Makefile.flags
+
+Makefile.flags contains:
+
+ARCH_FPIC ?= -fpic
+ARCH_FPIE ?= -fpie
+
+However, arch/$(ARCH)/Makefile gets included *after* Makefile.flags,
+and therefore doesn't get the chance to provide its own value.
+
+Fix this by including arch/$(ARCH)/Makefile *before* Makefile.flags.
+
+[Submitted upstream: http://lists.busybox.net/pipermail/busybox/2017-July/085632.html]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 971e68e..fe85070 100644
+--- a/Makefile
++++ b/Makefile
+@@ -508,6 +508,8 @@ ifeq ($(dot-config),1)
+ # To avoid any implicit rule to kick in, define an empty command
+ .config .kconfig.d: ;
+ 
++-include $(srctree)/arch/$(ARCH)/Makefile
++
+ # Now we can define CFLAGS etc according to .config
+ include $(srctree)/Makefile.flags
+ 
+@@ -531,8 +533,6 @@ endif
+ # Defaults busybox but it is usually overridden in the arch makefile
+ all: busybox doc
+ 
+--include $(srctree)/arch/$(ARCH)/Makefile
+-
+ # arch Makefile may override CC so keep this after arch Makefile is included
+ #bbox# NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
+ CHECKFLAGS += $(NOSTDINC_FLAGS)
+-- 
+2.9.4
+
diff --git a/package/busybox/0004-arch-sparc-sparc64-Makefile-define-ARCH_FPIC.patch b/package/busybox/0004-arch-sparc-sparc64-Makefile-define-ARCH_FPIC.patch
new file mode 100644
index 0000000..b487035
--- /dev/null
+++ b/package/busybox/0004-arch-sparc-sparc64-Makefile-define-ARCH_FPIC.patch
@@ -0,0 +1,79 @@
+From 43593d65827f4e7f848fc410321b0b2deed986fc Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 14 Jul 2017 21:54:37 +0200
+Subject: [PATCH] arch/{sparc,sparc64}/Makefile: define ARCH_FPIC
+
+Building Busybox on SPARC or SPARC64 with CONFIG_BUILD_LIBBUSYBOX=y
+currently fails with:
+
+miscutils/lib.a(i2c_tools.o): In function `i2c_dev_open':
+i2c_tools.c:(.text.i2c_dev_open+0x14): relocation truncated to fit: R_SPARC_GOT13 against `.LC0'
+i2c_tools.c:(.text.i2c_dev_open+0x38): relocation truncated to fit: R_SPARC_GOT13 against symbol `bb_errno' defined in COMMON section in libbb/lib.a(ptr_to_globals.o)
+i2c_tools.c:(.text.i2c_dev_open+0x6c): relocation truncated to fit: R_SPARC_GOT13 against `.LC1'
+miscutils/lib.a(i2c_tools.o): In function `check_funcs_test_end':
+i2c_tools.c:(.text.check_funcs_test_end+0x24): relocation truncated to fit: R_SPARC_GOT13 against `.LC2'
+i2c_tools.c:(.text.check_funcs_test_end+0x2c): relocation truncated to fit: R_SPARC_GOT13 against `.LC3'
+miscutils/lib.a(i2c_tools.o): In function `check_read_funcs':
+i2c_tools.c:(.text.check_read_funcs+0x30): relocation truncated to fit: R_SPARC_GOT13 against `.LC10'
+i2c_tools.c:(.text.check_read_funcs+0x80): relocation truncated to fit: R_SPARC_GOT13 against `.LC4'
+i2c_tools.c:(.text.check_read_funcs+0x98): relocation truncated to fit: R_SPARC_GOT13 against `.LC5'
+i2c_tools.c:(.text.check_read_funcs+0xc0): relocation truncated to fit: R_SPARC_GOT13 against `.LC6'
+i2c_tools.c:(.text.check_read_funcs+0xe0): relocation truncated to fit: R_SPARC_GOT13 against `.LC7'
+i2c_tools.c:(.text.check_read_funcs+0xf8): additional relocation overflows omitted from the output
+
+As stated by the gcc documentation, the SPARC architecture has a
+limited GOT size, which prevents moderately large binaries to be built
+with -fpic, and -fPIC is necessary. From gcc's documentation:
+
+'-fpic'
+     Generate position-independent code (PIC) suitable for use in a
+     shared library, if supported for the target machine.  Such code
+     accesses all constant addresses through a global offset table
+     (GOT).  The dynamic loader resolves the GOT entries when the
+     program starts (the dynamic loader is not part of GCC; it is part
+     of the operating system).  If the GOT size for the linked
+     executable exceeds a machine-specific maximum size, you get an
+     error message from the linker indicating that '-fpic' does not
+     work; in that case, recompile with '-fPIC' instead.  (These
+     maximums are 8k on the SPARC, 28k on AArch64 and 32k on the m68k
+     and RS/6000.  The x86 has no such limit.)
+
+'-fPIC'
+     If supported for the target machine, emit position-independent
+     code, suitable for dynamic linking and avoiding any limit on the
+     size of the global offset table.  This option makes a difference on
+     AArch64, m68k, PowerPC and SPARC.
+
+With a limit of 8KB on SPARC, we quickly reach this limit, and we hit
+it when building Busybox on SPARC/SPARC64 with the
+CONFIG_BUILD_LIBBUSYBOX=y option enabled.
+
+Therefore, this commit redefines ARCH_FPIC as -fPIC on sparc and
+sparc64 to solve this issue.
+
+[Submitted upstream: http://lists.busybox.net/pipermail/busybox/2017-July/085633.html]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ arch/sparc/Makefile   | 1 +
+ arch/sparc64/Makefile | 1 +
+ 2 files changed, 2 insertions(+)
+ create mode 100644 arch/sparc/Makefile
+ create mode 100644 arch/sparc64/Makefile
+
+diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
+new file mode 100644
+index 0000000..4d6c5fb
+--- /dev/null
++++ b/arch/sparc/Makefile
+@@ -0,0 +1 @@
++ARCH_FPIC = -fPIC
+diff --git a/arch/sparc64/Makefile b/arch/sparc64/Makefile
+new file mode 100644
+index 0000000..4d6c5fb
+--- /dev/null
++++ b/arch/sparc64/Makefile
+@@ -0,0 +1 @@
++ARCH_FPIC = -fPIC
+-- 
+2.9.4
+
