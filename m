From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Feb 2013 13:55:33 -0300
Subject: [Buildroot] [PATCH] libffi: fix powerpc build breakage
Message-ID: <1361552133-16421-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Happens with the latest release when there are no FP registers.
Fixes:
http://autobuild.buildroot.net/results/bc43261d3ddc9d4c320522563249f4a0695a35a4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ppc-build-breakage-when-there-are-no-FPRs.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/libffi/libffi-002-Fix-ppc-build-breakage-when-there-are-no-FPRs.patch

diff --git a/package/libffi/libffi-002-Fix-ppc-build-breakage-when-there-are-no-FPRs.patch b/package/libffi/libffi-002-Fix-ppc-build-breakage-when-there-are-no-FPRs.patch
new file mode 100644
index 0000000..5f0e576
--- /dev/null
+++ b/package/libffi/libffi-002-Fix-ppc-build-breakage-when-there-are-no-FPRs.patch
@@ -0,0 +1,46 @@
+From f800706fa2f4adb5192e859cc5d283c8ab766adf Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Fri, 22 Feb 2013 13:32:32 -0300
+Subject: [PATCH] Fix ppc build breakage when there are no FPRs
+
+Introduced by 8bd15d139a58a6e46dc90a1cb2d89f59f32f06c7
+If there are no FP registers there's build breakage:
+
+../src/powerpc/ffi.c: In function 'ffi_prep_args_SYSV':
+../src/powerpc/ffi.c:379:7: error: 'fparg_count' undeclared (first use
+in this function)
+../src/powerpc/ffi.c:379:7: note: each undeclared identifier is reported
+only once for each function it appears in
+../src/powerpc/ffi.c:379:21: error: 'NUM_FPR_ARG_REGISTERS' undeclared
+(first use in this function)
+
+Hit it when building for a SPE PPC target (e500v1/v2 cores) that uses GP
+registers for FP math.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ src/powerpc/ffi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/powerpc/ffi.c b/src/powerpc/ffi.c
+index f3a96a1..6220f0d 100644
+--- a/src/powerpc/ffi.c
++++ b/src/powerpc/ffi.c
+@@ -372,13 +372,13 @@ ffi_prep_args_SYSV (extended_cif *ecif, unsigned *const stack)
+   /* Check that we didn't overrun the stack...  */
+   FFI_ASSERT (copy_space.c >= next_arg.c);
+   FFI_ASSERT (gpr_base.u <= stacktop.u - ASM_NEEDS_REGISTERS);
++#ifndef __NO_FPRS__
+   /* The assert below is testing that the number of integer arguments agrees
+      with the number found in ffi_prep_cif_machdep().  However, intarg_count
+      is incremeneted whenever we place an FP arg on the stack, so account for
+      that before our assert test.  */
+   if (fparg_count > NUM_FPR_ARG_REGISTERS)
+     intarg_count -= fparg_count - NUM_FPR_ARG_REGISTERS;
+-#ifndef __NO_FPRS__
+   FFI_ASSERT (fpr_base.u
+ 	      <= stacktop.u - ASM_NEEDS_REGISTERS - NUM_GPR_ARG_REGISTERS);
+ #endif
+-- 
+1.7.12.4
+
-- 
1.7.12.4
