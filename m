From: Aalx <alexandre.payen@smile.fr>
Date: Fri, 12 Jul 2019 17:11:28 +0200
Subject: [Buildroot] [PATCH] [PATCH] add package/liblapack: add liblapack as
 a virtual package.
Message-ID: <20190712151128.25378-1-alexandre.payen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandre PAYEN <alexandre.payen@smile.fr>

lapack and clapack are both generating the same liblapack.so but does not have
the same symbols. So the run-time is broke. They have to exclude each other.
The armadillo packet require clapack to build, but lapack with complex support
works as well.

So :
- add package/liblapack directory and do the virtual configuration
- add BR2_LAPACK_COMPLEX in armadillo configuration when
BR2_LAPACK = y

Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
---
 package/Config.in              |  3 +-
 package/armadillo/Config.in    |  3 +-
 package/armadillo/armadillo.mk |  4 ++
 package/clapack/clapack.mk     |  1 +
 package/lapack/lapack.mk       |  1 +
 package/liblapack/Config.in    | 95 ++++++++++++++++++++++++++++++++++
 package/liblapack/liblapack.mk |  7 +++
 7 files changed, 111 insertions(+), 3 deletions(-)
 create mode 100644 package/liblapack/Config.in
 create mode 100644 package/liblapack/liblapack.mk

diff --git a/package/Config.in b/package/Config.in
index 657f28d9d0..700d497724 100644
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
 
diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index b2b61a3233..62c15fbdbe 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -12,7 +12,8 @@ config BR2_PACKAGE_ARMADILLO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
 	depends on !BR2_m68k_cf # clapack
-	select BR2_PACKAGE_CLAPACK
+	select BR2_PACKAGE_LIBLAPACK
+	select BR2_PACKAGE_LAPACK_COMPLEX if BR2_PACKAGE_LAPACK
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index b5fe403a7a..484fa47443 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -7,7 +7,11 @@
 ARMADILLO_VERSION = 7.900.1
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
+ifeq ($(BR2_PACKAGE_CLAPACK), y)
 ARMADILLO_DEPENDENCIES = clapack
+else ifeq ($(BR2_PACKAGE_LAPACK), y)
+ARMADILLO_DEPENDENCIES = lapack
+endif
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = MPL-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
diff --git a/package/clapack/clapack.mk b/package/clapack/clapack.mk
index 9a083f3223..90b1e84aa4 100644
--- a/package/clapack/clapack.mk
+++ b/package/clapack/clapack.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+CLAPACK = clapack
 CLAPACK_VERSION = 3.2.1
 CLAPACK_SOURCE = clapack-$(CLAPACK_VERSION)-CMAKE.tgz
 # This package provides 3 libraries:
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 3b59214e4b..c96c50d71a 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+LAPACK = lapack
 LAPACK_VERSION = 3.8.0
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
diff --git a/package/liblapack/Config.in b/package/liblapack/Config.in
new file mode 100644
index 0000000000..bea3df75bf
--- /dev/null
+++ b/package/liblapack/Config.in
@@ -0,0 +1,95 @@
+config BR2_PACKAGE_LIBLAPACK
+	bool "lapack support"
+	select BR2_PACKAGE_HAS_LIBLAPACK
+	help
+	  Select lapack library provider.
+
+if BR2_PACKAGE_LIBLAPACK
+
+choice
+	prompt "lapack implementation"
+	default BR2_PACKAGE_LAPACK
+	help
+	  Select lapack or clapack implementation.
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
+	select BR2_PACKAGE_HAS_LIBLAPACK
+	help
+	  LAPACK and BLAS C implementation (f2c'ed version of).'
+
+	  http://www.netlib.org/clapack/
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
+	select BR2_PACKAGE_HAS_LIBLAPACK
+	help
+	  LAPACK and BLAS FORTRAN implementation. This package
+	  installs two libraries: libblas and liblapack.
+
+	  http://www.netlib.org/lapack/
+
+endchoice
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
+config BR2_PACKAGE_HAS_LIBLAPACK
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBLAPACK
+	string
+	depends on BR2_PACKAGE_HAS_LIBLAPACK
+
+if BR2_PACKAGE_LAPACK
+config BR2_PACKAGE_PROVIDES_LIBLAPACK
+	default "lapack"
+endif
+
+if BR2_PACKAGE_CLAPACK
+config BR2_PACKAGE_PROVIDES_LIBLAPACK
+	default "clapack"
+endif
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
-- 
2.21.0
