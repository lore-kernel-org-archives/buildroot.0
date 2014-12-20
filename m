From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 21:49:10 +0100
Subject: [Buildroot] [git commit] package/oprofile: Bump version to 1.0.0
Message-ID: <20141220205426.4CC6580579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f7dc71cc8545dacf23f9a25f33c184d15bed65c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove opcontrol and oprofiled from the install list, they are no longer
present in the package.

Remove all patches, they have been integrated upstream.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../oprofile-001-avr32-enable-lookup_dcookie.patch |   24 ------
 ...-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch |   78 --------------------
 ...e-fix-test-for-synth-check-with-GCC-4.9.0.patch |   45 -----------
 package/oprofile/oprofile.mk                       |    5 +-
 4 files changed, 2 insertions(+), 150 deletions(-)

diff --git a/package/oprofile/oprofile-001-avr32-enable-lookup_dcookie.patch b/package/oprofile/oprofile-001-avr32-enable-lookup_dcookie.patch
deleted file mode 100644
index 7c41389..0000000
--- a/package/oprofile/oprofile-001-avr32-enable-lookup_dcookie.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Index: oprofile-0.9.4/daemon/opd_cookie.c
-===================================================================
---- oprofile-0.9.4.orig/daemon/opd_cookie.c	2008-07-25 16:00:17.000000000 +0200
-+++ oprofile-0.9.4/daemon/opd_cookie.c	2008-07-25 16:00:20.000000000 +0200
-@@ -78,6 +78,19 @@
- 		       (unsigned long)(cookie & 0xffffffff),
- 		       (unsigned long)(cookie >> 32), buf, size);
- }
-+#elif (defined(__avr32__))
-+static inline int lookup_dcookie(cookie_t cookie, char * buf, size_t size)
-+{
-+	/* On avr32, the first 64bit arg (cookie) is expected to be in
-+	 * r11(MSW)/r10(LSW) which normally hold arg 2 and arg 3. The second arg
-+	 * (buf) is then expected to be in r12 which normally holds the first
-+	 * arg. Third arg (size) is at the right position.
-+	 */
-+	return syscall(__NR_lookup_dcookie, buf,
-+			(unsigned long)(cookie >> 32),
-+			(unsigned long)(cookie & 0xffffffff),
-+			size);
-+}
- #else
- static inline int lookup_dcookie(cookie_t cookie, char * buf, size_t size)
- {
diff --git a/package/oprofile/oprofile-002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch b/package/oprofile/oprofile-002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch
deleted file mode 100644
index 1915541..0000000
--- a/package/oprofile/oprofile-002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Upstream-Status: Backport
-
-From 08241f1b2c5a4d48020c82b509dc1076f51bf0bd Mon Sep 17 00:00:00 2001
-From: Maynard Johnson <maynardj@us.ibm.com>
-Date: Wed, 14 Aug 2013 15:40:44 -0500
-Subject: [PATCH] Fix compile error on ppc/uClibc platform: 'AT_BASE_PLATFORM'
- undeclared'
-
-This issue was reported via bug #245.
-
-The method for obtaining cpu type on the ppc64 platform was recently
-modified to detect the case when we're running on a kernel that has
-not been updated to recognize the native processor type.  The cpu
-type returned in the case where the native processor type is newer
-than POWER7 will be "CPU_PPC64_ARCH_V1" (architected CPU type).
-The method used for detecting when the kernel does not recognize the
-native processor type is to inspect the aux vector and compare
-AT_PLATFORM and AT_BASE_PLATFORM. The 'AT_BASE_PLATFORM' was defined
-in glibc's elf.h around 5 years ago, but was never added to uClibc,
-so the code that implements the above-described method fails to compile
-on systems using uClibc.
-
-Since the above-described method of using the aux vector is only
-required for ppc64 systems, and ppc64-based platforms always use glibc
-(which has the AT_BASE_PLATFORM macro defined), we now wrap that code
-with '#if PPC64_ARCH' to prevent problems on other architectures.
-
-Signed-off-by: Maynard Johnson <maynardj@us.ibm.com>
----
- libop/op_cpu_type.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/libop/op_cpu_type.c b/libop/op_cpu_type.c
-index 44d6809..89d5a92 100644
---- a/libop/op_cpu_type.c
-+++ b/libop/op_cpu_type.c
-@@ -23,9 +23,16 @@
- #include <elf.h>
- #include <link.h>
- 
-+#include "config.h"
- #include "op_cpu_type.h"
- #include "op_hw_specific.h"
- 
-+/* A macro to be used for ppc64 architecture-specific code.  The '__powerpc__' macro
-+ * is defined for both ppc64 and ppc32 architectures, so we must further qualify by
-+ * including the 'HAVE_LIBPFM' macro, since that macro will be defined only for ppc64.
-+ */
-+#define PPC64_ARCH (HAVE_LIBPFM) && ((defined(__powerpc__) || defined(__powerpc64__)))
-+
- struct cpu_descr {
- 	char const * pretty;
- 	char const * name;
-@@ -176,6 +183,7 @@ static char * _get_cpuinfo_cpu_type(char * buf, int len, const char * prefix)
- 	return _get_cpuinfo_cpu_type_line(buf, len, prefix, 1);
- }
- 
-+#if PPC64_ARCH
- // The aux vector stuff below is currently only used by ppc64 arch
- static ElfW(auxv_t) * auxv_buf = NULL;
- 
-@@ -312,6 +320,13 @@ static op_cpu _get_ppc64_cpu_type(void)
- 	cpu_type = op_get_cpu_number(cpu_type_str);
- 	return cpu_type;
- }
-+#else
-+static op_cpu _get_ppc64_cpu_type(void)
-+{
-+	return CPU_NO_GOOD;
-+}
-+#endif
-+
- 
- static op_cpu _get_arm_cpu_type(void)
- {
--- 
-1.9.0
-
diff --git a/package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch b/package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch
deleted file mode 100644
index 24bed98..0000000
--- a/package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From cc08b52f8376867121f22e166636779e2a1a6e48 Mon Sep 17 00:00:00 2001
-From: Aaro Koskinen <aaro.koskinen@iki.fi>
-Date: Mon, 12 May 2014 08:28:46 -0500
-Subject: [PATCH 1/1] configure: fix test-for-synth check with GCC 4.9.0
-
-With GCC 4.9.0 oprofile 0.9.9 build fails on non-PPC platfroms because
-the "test-for-synth" configure check result is incorrect: There is a NULL
-pointer dereference in the test program, so the compiler seems to optimize
-the rest of the code away, and the test will always succeed regardless
-whether powerpc_elf64_vec/bfd_elf64_powerpc_vec are present or not.
-Fix by allocating the referred struct statically.
-
-While at it, also include stdio.h to avoid a compiler warning.
-
-[Romain: backport the patch to 0.9.9]
-
-Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-
-Conflicts:
-	m4/binutils.m4
----
- m4/binutils.m4 | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/m4/binutils.m4 b/m4/binutils.m4
-index 25fb15a..3486488 100644
---- a/m4/binutils.m4
-+++ b/m4/binutils.m4
-@@ -27,8 +27,10 @@ if test "$OS" = "Linux"; then
- 	AC_MSG_CHECKING([whether bfd_get_synthetic_symtab() exists in BFD library])
- 	rm -f test-for-synth
- 	AC_LANG_CONFTEST(
--		[AC_LANG_PROGRAM([[#include <bfd.h>]],
--			[[asymbol * synthsyms;	bfd * ibfd = 0; 
-+		[AC_LANG_PROGRAM([[#include <bfd.h>]
-+			[#include <stdio.h>]
-+			[static bfd _ibfd;]],
-+			[[asymbol * synthsyms;	bfd * ibfd = &_ibfd;
- 			long synth_count = bfd_get_synthetic_symtab(ibfd, 0, 0, 0, 0, &synthsyms);
- 			extern const bfd_target bfd_elf64_powerpc_vec;
- 			extern const bfd_target bfd_elf64_powerpcle_vec;
--- 
-1.9.3
-
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index ee2f212..d40c8be 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPROFILE_VERSION = 0.9.9
+OPROFILE_VERSION = 1.0.0
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_LICENSE = GPLv2+
 OPROFILE_LICENSE_FILES = COPYING
@@ -14,7 +14,7 @@ OPROFILE_CONF_OPTS = \
 	--with-kernel=$(STAGING_DIR)/usr
 OPROFILE_AUTORECONF = YES
 OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
-OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
+OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv
 OPROFILE_BINARIES += utils/op-check-perfevents libabi/opimport
 OPROFILE_BINARIES += pe_counting/ocount
 
@@ -60,7 +60,6 @@ define OPROFILE_INSTALL_TARGET_CMDS
 			$(TARGET_DIR)/usr/share/oprofile; \
 	fi
 	$(INSTALL) -m 644 $(@D)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
-	$(INSTALL) -m 755 $(@D)/utils/opcontrol $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 755 $(addprefix $(@D)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 755 $(@D)/libopagent/.libs/*.so* $(TARGET_DIR)/usr/lib/oprofile
 endef
