From: Aalx <alexandre.payen@smile.fr>
Date: Wed, 10 Jul 2019 16:19:40 +0200
Subject: [Buildroot] [PATCH] [PATCHv3] package/python-numpy: fix occasional
 build failure with lapack
Message-ID: <20190710141940.13504-1-alexandre.payen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-numpy build fails if lapack or clapack are build before python-numpy
itself, and this boesn't always happen because lapack dependency is missing in
BR2_PYTHON_NUMPY_DEPENDENCIES.
Also, clapack is a C implementation of FORTRAN lapack. At build time, they both
generate the same liblapack.so file. But because lapack is written in FORTRAN
then, it can be difficult to build. Both package are kept behind a virtual
package named vlapack. They are mutually exclusive.

Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
---
 package/Config.in                    |  3 +-
 package/liblapack/Config.in          | 86 ++++++++++++++++++++++++++++
 package/liblapack/liblapack.mk       |  7 +++
 package/python-numpy/python-numpy.mk |  5 ++
 4 files changed, 99 insertions(+), 2 deletions(-)
 create mode 100644 package/liblapack/Config.in
 create mode 100644 package/liblapack/liblapack.mk

diff --git a/package/Config.in b/package/Config.in
index d501b5a65b..04c44b86e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1663,7 +1663,6 @@ menu "Other"
 	source "package/boost/Config.in"
 	source "package/capnproto/Config.in"
 	source "package/clang/Config.in"
-	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cmocka/Config.in"
 	source "package/cppcms/Config.in"
@@ -1686,7 +1685,6 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/jemalloc/Config.in"
-	source "package/lapack/Config.in"
 	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libb64/Config.in"
@@ -1767,6 +1765,7 @@ endif
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/liblapack/Config.in"
 	source "package/xapian/Config.in"
 endmenu
 
diff --git a/package/liblapack/Config.in b/package/liblapack/Config.in
new file mode 100644
index 0000000000..fb155d7c02
--- /dev/null
+++ b/package/liblapack/Config.in
@@ -0,0 +1,86 @@
+config BR2_PACKAGE_VIRTUAL_LAPACK
+	bool "lapack support"
+	select BR2_PACKAGE_HAS_LAPACK
+	help
+	  Select lapack library provider.
+
+if BR2_PACKAGE_VIRTUAL_LAPACK
+
+choice
+        prompt "lapack implementation"
+        default BR2_PACKAGE_LAPACK
+        help
+	  Select lapack or clapack implementation.
+
+
+comment "clapack needs a glibc toolchain"
+	depends on BR2_powerpc
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_CLAPACK
+	bool "C implementation"
+	# _fpu_control is used on PowerPC, but not available with
+	# uClibc or musl
+	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
+	# assembler: Error: value out of range
+	depends on !BR2_m68k_cf
+	help
+	  LAPACK and BLAS C implementation (f2c'ed version of).'
+
+	  http://www.netlib.org/clapack/
+
+if BR2_PACKAGE_CLAPACK
+
+config BR2_PACKAGE_CLAPACK_ARITH_H
+	string "Custom BLAS arith.h"
+	depends on BR2_PACKAGE_CLAPACK
+	help
+	  To optimize BLAS library for the hardware, an 'arith.h' header
+	  should be provided.
+
+	  If empty, the library will not be optimized by the compiler.
+
+	  In any case an 'arithchk' program is built
+	  (but not installed), to be run on the target to generate this
+	  arith.h header.
+
+endif
+
+comment "lapack/blas needs a toolchain w/ fortran"
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+	depends on !BR2_TOOLCHAIN_HAS_FORTRAN
+
+config BR2_PACKAGE_LAPACK
+	bool "FORTRAN implementation"
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN
+	# _fpu_control is used on PowerPC, but not available with uClibc
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+	help
+	  LAPACK and BLAS FORTRAN implementation. This package
+	  installs two libraries: libblas and liblapack.
+
+	  http://www.netlib.org/lapack/
+
+if BR2_PACKAGE_LAPACK
+
+config BR2_PACKAGE_LAPACK_COMPLEX
+	bool "Complex/Complex16 support"
+	default y
+	depends on BR2_PACKAGE_LAPACK
+	help
+	  Builds support for COMPLEX and COMPLEX16 data types.
+
+endif
+
+endchoice
+
+config BR2_PACKAGE_HAS_VIRT_LAPACK
+	bool
+
+config BR2_PACKAGE_PROVIDES_VIRT_LAPACK
+        depends on BR2_PACKAGE_HAS_VIRT_LAPACK
+        string
+	default "lapack"  if BR2_PACKAGE_LAPACK
+	default "clapack"  if BR2_PACKAGE_CLAPACK
+
+endif
diff --git a/package/liblapack/liblapack.mk b/package/liblapack/liblapack.mk
new file mode 100644
index 0000000000..06cece60f9
--- /dev/null
+++ b/package/liblapack/liblapack.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# liblapack
+#
+################################################################################
+
+$(eval $(virtual-package))
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 5d2fbfc7ad..71de61f6e3 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -17,7 +17,12 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
 
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += clapack
+PYTHON_NUMPY_SITE_CFG_LIBS += cblas clapack
+PYTHON_NUMPY_ENV += BLAS=clapack LAPACK=clapack
+else ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
+PYTHON_NUMPY_DEPENDENCIES += lapack
 PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
+PYTHON_NUMPY_ENV += BLAS=lapack LAPACK=lapack
 else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
-- 
2.21.0
