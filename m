From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 23:11:18 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/openblas: fix
 build failure due to forced FFLAGS
Message-ID: <20210316215256.4AF957FD28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a76c16a7dc5bbcbd7a4107b3fa7287da87330297
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Buildroot specifies a value for FFLAGS on the make command-line.
While the openblas makefiles allowed this principle for the most part by
using 'override FFLAGS += ....', the make.inc file generated for the shipped
'lapack' sources just used a 'FFLAGS = ...' statement, whose value is then
eclipsed by the command-line FFLAGS.

This meant that -fPIC may be passed to the link step but not to all relevant
source files, causing relocation failures.

Fixes: http://autobuild.buildroot.net/results/d530db0f37e1e0462e3af1e1787e15f94ff21884/
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2793167b57f3ca197be92e493312643d14a4300a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x-support-for-passing-FFLAGS-on-the-make-.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch b/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch
new file mode 100644
index 0000000000..72b387b93e
--- /dev/null
+++ b/package/openblas/0002-Makefile-fix-support-for-passing-FFLAGS-on-the-make-.patch
@@ -0,0 +1,47 @@
+From 4d3829fa52240c2b7e48770ab19584db33ba7863 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Fri, 5 Mar 2021 11:17:59 +0100
+Subject: [PATCH] Makefile: fix support for passing FFLAGS on the make
+ command line
+
+When openblas is built while passing FFLAGS on the make command line, the
+compilation of lapack objects will not contain the flags specified in
+Makefile but _only_ those passed in FFLAGS.
+
+This can lead to build failure, e.g. because -fPIC is not passed to the
+compilation of most lapack objects, but is given to the link command:
+
+.../buildroot/output/host/bin/x86_64-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -O2 -DMAX_STACK_ALLOC=2048 -Wall -m64 -DF_INTERFACE_GFORT -fPIC -DNO_WARMUP -DMAX_CPU_NUMBER=4 -DMAX_PARALLEL_NUMBER=1 -DVERSION=\"0.3.9\" -DASMNAME= -DASMFNAME=_ -DNAME=_ -DCNAME= -DCHAR_NAME=\"_\" -DCHAR_CNAME=\"\" -DNO_AFFINITY -I..  -shared -o ../libopenblas_nehalem-r0.3.9.so \
+-Wl,--whole-archive ../libopenblas_nehalem-r0.3.9.a -Wl,--no-whole-archive \
+-Wl,-soname,libopenblas.so.0 -lm -lgfortran -lm -lgfortran
+.../buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/9.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: ../libopenblas_nehalem-r0.3.9.a(sbdsvdx.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC
+
+In the initial support for this principle, added in commit
+d0e731e8b825e7a554f245aa8f1118dcec9e2728, the flags specified in the
+makefile were appended to the flags specified on the command-line.
+
+Fix this situation by using 'override' for 'FFLAGS' in
+lapack-netlib/make.inc. The flags passed on the command-line are already
+part of the LAPACK_FFLAGS variable, so no '+=' is needed here.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index fc5fe3f5..8ae1ff47 100644
+--- a/Makefile
++++ b/Makefile
+@@ -248,7 +248,7 @@ prof_lapack : lapack_prebuild
+ lapack_prebuild :
+ ifeq ($(NOFORTRAN), $(filter 0,$(NOFORTRAN)))
+ 	- at echo "FC          = $(FC)" > $(NETLIB_LAPACK_DIR)/make.inc
+-	- at echo "FFLAGS      = $(LAPACK_FFLAGS)" >> $(NETLIB_LAPACK_DIR)/make.inc
++	- at echo "override FFLAGS      = $(LAPACK_FFLAGS)" >> $(NETLIB_LAPACK_DIR)/make.inc
+ 	- at echo "POPTS       = $(LAPACK_FPFLAGS)" >> $(NETLIB_LAPACK_DIR)/make.inc
+ 	- at echo "FFLAGS_NOOPT       = -O0 $(LAPACK_NOOPT)" >> $(NETLIB_LAPACK_DIR)/make.inc
+ 	- at echo "PNOOPT      = $(LAPACK_FPFLAGS) -O0" >> $(NETLIB_LAPACK_DIR)/make.inc
+-- 
+2.26.2
+
