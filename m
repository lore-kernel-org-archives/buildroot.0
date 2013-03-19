From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 17:05:14 +0100
Subject: [Buildroot] [git commit] libffi: bump to version 3.0.13
Message-ID: <20130319160722.503689B191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c2b77b1f9bb05ba9247a0008b7d3e3b45e8f185
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libffi/libffi-002-fix-ppc-nofpr.patch |   29 -------------------------
 package/libffi/libffi.mk                      |    2 +-
 2 files changed, 1 insertions(+), 30 deletions(-)

diff --git a/package/libffi/libffi-002-fix-ppc-nofpr.patch b/package/libffi/libffi-002-fix-ppc-nofpr.patch
deleted file mode 100644
index 729bae8..0000000
--- a/package/libffi/libffi-002-fix-ppc-nofpr.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From: Gilles Talis <gilles.talis@gmail.com>
-
-On PPC, if __NO_FPRS__ is defined, fparg_count and NUM_FPR_ARG_REGISTERS
-are not defined, thus must not be used.
-
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
----
- src/powerpc/ffi.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/powerpc/ffi.c b/src/powerpc/ffi.c
-index f3a96a1..9c69584 100644
---- a/src/powerpc/ffi.c
-+++ b/src/powerpc/ffi.c
-@@ -376,9 +376,10 @@ ffi_prep_args_SYSV (extended_cif *ecif, unsigned *const stack)
-      with the number found in ffi_prep_cif_machdep().  However, intarg_count
-      is incremeneted whenever we place an FP arg on the stack, so account for
-      that before our assert test.  */
-+#ifndef __NO_FPRS__
-   if (fparg_count > NUM_FPR_ARG_REGISTERS)
-     intarg_count -= fparg_count - NUM_FPR_ARG_REGISTERS;
--#ifndef __NO_FPRS__
-+
-   FFI_ASSERT (fpr_base.u
- 	      <= stacktop.u - ASM_NEEDS_REGISTERS - NUM_GPR_ARG_REGISTERS);
- #endif
--- 
-1.7.10.4
-
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 28a2916..791c464 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBFFI_VERSION = 3.0.12
+LIBFFI_VERSION = 3.0.13
 LIBFFI_SITE    = ftp://sourceware.org/pub/libffi/
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
