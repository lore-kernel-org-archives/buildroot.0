From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Feb 2013 20:42:45 +0100
Subject: [Buildroot] [git commit] libffi: fix powerpc build breakage
Message-ID: <20130222194420.A0AAB9AC54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00a11f5640616931a920f27da4ea59671c8d3aaf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Happens with the latest release when there are no FP registers.
Fixes:
http://autobuild.buildroot.net/results/bc43261d3ddc9d4c320522563249f4a0695a35a4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libffi/libffi-002-fix-ppc-nofpr.patch |   29 +++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/libffi/libffi-002-fix-ppc-nofpr.patch b/package/libffi/libffi-002-fix-ppc-nofpr.patch
new file mode 100644
index 0000000..729bae8
--- /dev/null
+++ b/package/libffi/libffi-002-fix-ppc-nofpr.patch
@@ -0,0 +1,29 @@
+From: Gilles Talis <gilles.talis@gmail.com>
+
+On PPC, if __NO_FPRS__ is defined, fparg_count and NUM_FPR_ARG_REGISTERS
+are not defined, thus must not be used.
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ src/powerpc/ffi.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/powerpc/ffi.c b/src/powerpc/ffi.c
+index f3a96a1..9c69584 100644
+--- a/src/powerpc/ffi.c
++++ b/src/powerpc/ffi.c
+@@ -376,9 +376,10 @@ ffi_prep_args_SYSV (extended_cif *ecif, unsigned *const stack)
+      with the number found in ffi_prep_cif_machdep().  However, intarg_count
+      is incremeneted whenever we place an FP arg on the stack, so account for
+      that before our assert test.  */
++#ifndef __NO_FPRS__
+   if (fparg_count > NUM_FPR_ARG_REGISTERS)
+     intarg_count -= fparg_count - NUM_FPR_ARG_REGISTERS;
+-#ifndef __NO_FPRS__
++
+   FFI_ASSERT (fpr_base.u
+ 	      <= stacktop.u - ASM_NEEDS_REGISTERS - NUM_GPR_ARG_REGISTERS);
+ #endif
+-- 
+1.7.10.4
+
