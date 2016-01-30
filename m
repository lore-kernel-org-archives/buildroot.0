From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 22:37:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/lightning: bump version to 2.1.0
Message-ID: <1454189857-31490-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed autoreconf and both patches after upstream commits:
http://git.savannah.gnu.org/cgit/lightning.git/commit/configure.ac?id=e98640e1ac160034fe65346f68c5ade90d6b2032
http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=361caf28545aa0c2b2ab8d1cbd334fbdd952f373

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-cross-compilation-configure-fixes.patch   | 40 ----------------
 .../0002-ppc-disassembler-build-fix.patch          | 53 ----------------------
 package/lightning/lightning.hash                   |  2 +-
 package/lightning/lightning.mk                     |  5 +-
 4 files changed, 2 insertions(+), 98 deletions(-)
 delete mode 100644 package/lightning/0001-cross-compilation-configure-fixes.patch
 delete mode 100644 package/lightning/0002-ppc-disassembler-build-fix.patch

diff --git a/package/lightning/0001-cross-compilation-configure-fixes.patch b/package/lightning/0001-cross-compilation-configure-fixes.patch
deleted file mode 100644
index 6ced202..0000000
--- a/package/lightning/0001-cross-compilation-configure-fixes.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Assume that the functionality is not present
-
-Patch written by Holger Hans Peter Freyther, and fetched from
-http://lists.gnu.org/archive/html/lightning/2014-11/msg00002.html.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 031279d..a36bed6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -184,7 +184,7 @@ elif test $cpu = x86; then
-                          : "0" (1));
-        return (edx & 1 << 26) ? 0 : 1;
-     }
--    ]])],[ac_cv_test_x86_x87=yes],[][])
-+    ]])],[ac_cv_test_x86_x87=yes],[],[ac_cv_test_x86_x87=no])
- elif test $cpu = arm; then
-     AC_RUN_IFELSE([AC_LANG_SOURCE([[
-     #include <stdio.h>
-@@ -207,7 +207,7 @@ elif test $cpu = arm; then
-     #endif
-        return 1;
-     }
--    ]])],[ac_cv_test_arm_arm=yes],[][])
-+    ]])],[ac_cv_test_arm_arm=yes],[],[ac_cv_test_arm_arm=no])
-     AC_RUN_IFELSE([AC_LANG_SOURCE([[
-     #include <stdio.h>
-     int main(void) {
-@@ -229,7 +229,7 @@ elif test $cpu = arm; then
-     #endif
-        return 1;
-     }
--    ]])],[ac_cv_test_arm_swf=yes],[][])
-+    ]])],[ac_cv_test_arm_swf=yes],[],[ac_cv_test_arm_swf=no])
- fi
- CFLAGS=$save_CFLAGS
diff --git a/package/lightning/0002-ppc-disassembler-build-fix.patch b/package/lightning/0002-ppc-disassembler-build-fix.patch
deleted file mode 100644
index 4c812b3..0000000
--- a/package/lightning/0002-ppc-disassembler-build-fix.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 361caf28545aa0c2b2ab8d1cbd334fbdd952f373 Mon Sep 17 00:00:00 2001
-From: Paulo Andrade <pcpa@gnu.org>
-Date: Thu, 15 Jan 2015 14:56:38 -0200
-Subject: [PATCH 4/4] PPC: Only call binutils function if it is available
-
-	* configure.ac, lib/jit_disasm.c: Rewrite workaround
-	to apparent problem to initialize powerpc disassembler.
----
-diff --git a/configure.ac b/configure.ac
-index 749659b..d26e777 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -230,6 +230,13 @@ elif test $cpu = arm; then
- 	return 1;
-     }
-     ]])],[ac_cv_test_arm_swf=yes],[],[ac_cv_test_arm_swf=no])
-+elif test $cpu = ppc; then
-+    if test "x$DISASSEMBLER" != "xno"; then
-+	save_LIBS="$LIBS"
-+	LIBS="$LIBS $SHLIB"
-+	AC_CHECK_FUNCS(disassemble_init_for_target disassemble_init_powerpc)
-+	LIBS="$save_LIBS"
-+    fi
- fi
- CFLAGS=$save_CFLAGS
- 
-diff --git a/lib/jit_disasm.c b/lib/jit_disasm.c
-index 01158de..86e5441 100644
---- a/lib/jit_disasm.c
-+++ b/lib/jit_disasm.c
-@@ -91,11 +91,19 @@ jit_init_debug(const char *progname)
- #  if defined(__powerpc__)
-     disasm_info.arch = bfd_arch_powerpc;
-     disasm_info.mach = bfd_mach_ppc64;
-+#    if HAVE_DISASSEMBLE_INIT_FOR_TARGET
-+    disassemble_init_for_target(&disasm_info);
-+#    elif HAVE_DISASSEMBLE_INIT_POWERPC
-     disassemble_init_powerpc(&disasm_info);
-+#    endif
- #    if defined(__powerpc64__)
-     disasm_info.disassembler_options = "64";
- #    endif
-+#    if HAVE_DISASSEMBLE_INIT_FOR_TARGET
-+    disassemble_init_for_target(&disasm_info);
-+#    elif HAVE_DISASSEMBLE_INIT_POWERPC
-     disassemble_init_powerpc(&disasm_info);
-+#    endif
- #  endif
- #  if defined(__sparc__)
-     disasm_info.endian = disasm_info.display_endian = BFD_ENDIAN_BIG;
--- 
-2.1.4
-
diff --git a/package/lightning/lightning.hash b/package/lightning/lightning.hash
index 7e61d61..4805686 100644
--- a/package/lightning/lightning.hash
+++ b/package/lightning/lightning.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 65b66a86aef8772e8c6813868da5174c4977c65b9e6cff3d4c3bb0de1a52a94a lightning-2.0.5.tar.gz
+sha256	1fa3a2421852598b3162d6765645bb3cd0fccb5f0c105d0800c64c8428b749a6	lightning-2.1.0.tar.gz
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 9095cba..b74147a 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-LIGHTNING_VERSION = 2.0.5
+LIGHTNING_VERSION = 2.1.0
 LIGHTNING_SITE = http://ftp.gnu.org/gnu/lightning
 LIGHTNING_LICENSE = LGPLv3+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
 LIGHTNING_INSTALL_STAGING = YES
 
-# We're patching configure.ac
-LIGHTNING_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
 LIGHTNING_DEPENDENCIES += binutils zlib
 LIGHTNING_CONF_OPTS += --enable-disassembler
-- 
2.7.0.rc3
