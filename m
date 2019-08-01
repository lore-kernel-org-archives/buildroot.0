From: Romain Naour <romain.naour@smile.fr>
Date: Thu,  1 Aug 2019 23:09:17 +0200
Subject: [Buildroot] [PATCH 2/5] package/liblapack: add liblapack as virtual
 package with lapack and clapack as providers.
In-Reply-To: <20190801210920.31338-1-romain.naour@smile.fr>
References: <20190801210920.31338-1-romain.naour@smile.fr>
Message-ID: <20190801210920.31338-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexandre PAYEN <alexandre.payen@smile.fr>

lapack and clapack are both generating the same liblapack.so but does not have
the same symbols. So the run-time is broke. They have to exclude each other.
A liblapack virtual package havev been created. It include lapack and clapack
as providers.
The armadillo packet require clapack to build, but lapack with complex support
works as well.

The upcomming python-scipy package require lapack as liblapack provider, we
add the ability to force the lapack implementation.

So :
- add package/liblapack directory and do the virtual configuration
- add BR2_LAPACK_COMPLEX in armadillo configuration when BR2_PACKAGE_LAPACK = y
- Add

Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v6: remove Config.in from clapack and lapack
    Rework liblapack virtual package (Config.in)
---
 package/Config.in              |  3 +-
 package/armadillo/Config.in    |  3 +-
 package/armadillo/armadillo.mk |  2 +-
 package/clapack/Config.in      | 28 -----------
 package/clapack/clapack.mk     |  1 +
 package/lapack/Config.in       | 21 --------
 package/lapack/lapack.mk       |  1 +
 package/liblapack/Config.in    | 91 ++++++++++++++++++++++++++++++++++
 package/liblapack/liblapack.mk |  7 +++
 9 files changed, 104 insertions(+), 53 deletions(-)
 delete mode 100644 package/clapack/Config.in
 delete mode 100644 package/lapack/Config.in
 create mode 100644 package/liblapack/Config.in
 create mode 100644 package/liblapack/liblapack.mk

diff --git a/package/Config.in b/package/Config.in
index b7472b9bea..5f408f4de9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1666,7 +1666,6 @@ menu "Other"
 	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
 	source "package/clang/Config.in"
-	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cmocka/Config.in"
 	source "package/cppcms/Config.in"
@@ -1689,7 +1688,6 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/jemalloc/Config.in"
-	source "package/lapack/Config.in"
 	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libb64/Config.in"
@@ -1715,6 +1713,7 @@ menu "Other"
 	source "package/libglob/Config.in"
 	source "package/libical/Config.in"
 	source "package/libite/Config.in"
+	source "package/liblapack/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libloki/Config.in"
 	source "package/libnpth/Config.in"
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
index b5fe403a7a..75c402a9ca 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -7,7 +7,7 @@
 ARMADILLO_VERSION = 7.900.1
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
-ARMADILLO_DEPENDENCIES = clapack
+ARMADILLO_DEPENDENCIES = liblapack
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = MPL-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
deleted file mode 100644
index a912eb6c91..0000000000
--- a/package/clapack/Config.in
+++ /dev/null
@@ -1,28 +0,0 @@
-comment "clapack needs a glibc toolchain"
-	depends on BR2_powerpc
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
-config BR2_PACKAGE_CLAPACK
-	bool "cblas/clapack"
-	# _fpu_control is used on PowerPC, but not available with
-	# uClibc or musl
-	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
-	# assembler: Error: value out of range
-	depends on !BR2_m68k_cf
-	help
-	  BLAS and LAPACK C implementation (f2c'ed version of).
-
-	  http://www.netlib.org/clapack/
-
-config BR2_PACKAGE_CLAPACK_ARITH_H
-	string "Custom BLAS arith.h"
-	depends on BR2_PACKAGE_CLAPACK
-	help
-	  To optimize BLAS library for the hardware, an 'arith.h' header
-	  should be provided.
-
-	  If empty, the library will not be optimized by the compiler.
-
-	  In any case an 'arithchk' program is built
-	  (but not installed), to be run on the target to generate this
-	  arith.h header.
diff --git a/package/clapack/clapack.mk b/package/clapack/clapack.mk
index 9a083f3223..280ea20e0f 100644
--- a/package/clapack/clapack.mk
+++ b/package/clapack/clapack.mk
@@ -14,6 +14,7 @@ CLAPACK_LICENSE = HPND (libf2c), BSD-3-Clause (libblas and liblapack)
 CLAPACK_LICENSE_FILES = F2CLIBS/libf2c/Notice COPYING
 CLAPACK_SITE = http://www.netlib.org/clapack
 CLAPACK_INSTALL_STAGING = YES
+CLAPACK_PROVIDES = liblapack
 
 ifneq ($(BR2_PACKAGE_CLAPACK_ARITH_H),)
 CLAPACK_CONF_OPTS += -DARITH_H=$(BR2_PACKAGE_CLAPACK_ARITH_H)
diff --git a/package/lapack/Config.in b/package/lapack/Config.in
deleted file mode 100644
index 9687ace82d..0000000000
--- a/package/lapack/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-comment "lapack/blas needs a toolchain w/ fortran"
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
-	depends on !BR2_TOOLCHAIN_HAS_FORTRAN
-
-config BR2_PACKAGE_LAPACK
-	bool "lapack/blas"
-	depends on BR2_TOOLCHAIN_HAS_FORTRAN
-	# _fpu_control is used on PowerPC, but not available with uClibc
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
-	help
-	  LAPACK and BLAS FORTRAN implementation. This package
-	  installs two libraries: libblas and liblapack.
-
-	  http://www.netlib.org/lapack/
-
-config BR2_PACKAGE_LAPACK_COMPLEX
-	bool "Complex/Complex16 support"
-	default y
-	depends on BR2_PACKAGE_LAPACK
-	help
-	  Builds support for COMPLEX and COMPLEX16 data types.
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 3b59214e4b..8d3fdc6bcf 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -11,6 +11,7 @@ LAPACK_SITE = http://www.netlib.org/lapack
 LAPACK_INSTALL_STAGING = YES
 LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
+LAPACK_PROVIDES = liblapack
 
 ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
 LAPACK_CONF_OPTS += -DBUILD_COMPLEX=ON -DBUILD_COMPLEX16=ON
diff --git a/package/liblapack/Config.in b/package/liblapack/Config.in
new file mode 100644
index 0000000000..0bf1d1d266
--- /dev/null
+++ b/package/liblapack/Config.in
@@ -0,0 +1,91 @@
+config BR2_PACKAGE_LIBLAPACK_FORCE_LAPACK
+	bool
+
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
+	default BR2_PACKAGE_LAPACK if BR2_TOOLCHAIN_HAS_FORTRAN
+	default BR2_PACKAGE_CLAPACK if !BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Select lapack or clapack implementation.
+
+comment "clapack needs a glibc toolchain"
+	depends on BR2_powerpc
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_CLAPACK
+	bool "clapack - C implementation"
+	depends on !BR2_PACKAGE_LIBLAPACK_FORCE_LAPACK
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
+	bool "lapack - FORTRAN implementation"
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
+config BR2_PACKAGE_HAS_LIBLAPACK
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBLAPACK
+	string
+	default "clapack" if BR2_PACKAGE_CLAPACK
+	default "lapack" if BR2_PACKAGE_LAPACK
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
2.20.1
