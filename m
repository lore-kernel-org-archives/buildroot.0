From: Benjamin Kamath <kamath.ben@gmail.com>
Date: Fri, 18 Mar 2016 13:25:26 -0700
Subject: [Buildroot] [PATCH v2 3/3] package: add lapack
Message-ID: <20160318202522.GA24038@spaceflight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lapack is a fortran-based linear algebra math
library.

Signed-off-by: Benjamin Kamath <bkamath@spaceflight.com>
---
 package/Config.in                              |  1 +
 package/lapack/0001-case-sensitive-paths.patch | 22 ++++++++++++++++++++++
 package/lapack/Config.in                       | 17 +++++++++++++++++
 package/lapack/lapack.hash                     |  2 ++
 package/lapack/lapack.mk                       | 25 +++++++++++++++++++++++++
 5 files changed, 67 insertions(+)
 create mode 100644 package/lapack/0001-case-sensitive-paths.patch
 create mode 100644 package/lapack/Config.in
 create mode 100644 package/lapack/lapack.hash
 create mode 100644 package/lapack/lapack.mk

diff --git a/package/Config.in b/package/Config.in
index 2401867..b5a5e39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1198,6 +1198,7 @@ menu "Other"
 	source "package/gmp/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
+	source "package/lapack/Config.in"
 	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libbsd/Config.in"
diff --git a/package/lapack/0001-case-sensitive-paths.patch b/package/lapack/0001-case-sensitive-paths.patch
new file mode 100644
index 0000000..3722b88
--- /dev/null
+++ b/package/lapack/0001-case-sensitive-paths.patch
@@ -0,0 +1,22 @@
+Fix upper case issue in CMakeLists
+
+Fix the 3.6.0 release of lapack to work with case-sensitive file systems,
+reported as bug 145 in LAPACK's bug list. Corrected in SVN rev 1651.
+
+Signed-off-by: Benjamin Kamath <kamath.ben@gmail.com>
+
+diff -rupN lapack-3.6.0/CBLAS/CMakeLists.txt lapack-3.6.0-old/CBLAS/CMakeLists.txt
+--- lapack-3.6.0/CBLAS/CMakeLists.txt	2016-03-17 13:42:31.121248051 -0700
++++ lapack-3.6.0-old/CBLAS/CMakeLists.txt	2016-03-17 13:41:37.819316904 -0700
+@@ -65,9 +65,9 @@ if(ALL_TARGETS)
+   list(GET ALL_TARGETS 0 _cblas_config_build_guard_target)
+ endif()
+ 
+-configure_file(${CMAKE_CURRENT_SOURCE_DIR}/CMAKE/cblas-config-version.cmake.in
++configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/cblas-config-version.cmake.in
+   ${LAPACK_BINARY_DIR}/cblas-config-version.cmake @ONLY)
+-configure_file(${CMAKE_CURRENT_SOURCE_DIR}/CMAKE/cblas-config-build.cmake.in
++configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/cblas-config-build.cmake.in
+   ${LAPACK_BINARY_DIR}/cblas-config.cmake @ONLY)
+ 
+ 
diff --git a/package/lapack/Config.in b/package/lapack/Config.in
new file mode 100644
index 0000000..6cb1edf
--- /dev/null
+++ b/package/lapack/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LAPACK
+	bool "lapack/blas"
+	depends on BR2_INSTALL_LIBFORTRAN
+	# _fpu_control is used on PowerPC, but not available with
+	# uClibc
+	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  LAPACK and BLAS FORTRAN implementation.
+
+	  http://www.netlib.org/lapack/
+
+config BR2_PACKAGE_LAPACK_COMPLEX
+	bool "Complex/Complex16 support"
+	depends on BR2_PACKAGE_LAPACK
+	default y
+	help
+	  Builds support for COMPLEX and COMPLEX16 data types.
diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
new file mode 100644
index 0000000..99d25b5
--- /dev/null
+++ b/package/lapack/lapack.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a9a0082c918fe14e377bbd570057616768dca76cbdc713457d8199aaa233ffc3  lapack-3.6.0.tgz
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
new file mode 100644
index 0000000..7656291
--- /dev/null
+++ b/package/lapack/lapack.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# lapack
+#
+################################################################################
+
+# This package provides 2 libraries:
+# - libblas
+# - liblapack
+
+LAPACK_VERSION = 3.6.0
+LAPACK_SOURCE = lapack-$(LAPACK_VERSION).tgz
+LAPACK_LICENSE = BSD-3c (libblas and liblapack)
+LAPACK_LICENSE_FILES = LICENSE
+LAPACK_SITE = http://www.netlib.org/lapack
+LAPACK_INSTALL_STAGING = YES
+LAPACK_CONF_OPTS = -DLAPACKE=on -DCBLAS=on
+
+ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
+LAPACK_CONF_OPTS += -DBUILD_COMPLEX=on -DBUILD_COMPLEX16=on
+else
+LAPACK_CONF_OPTS += -DBUILD_COMPLEX=off -DBUILD_COMPLEX16=off
+endif
+
+$(eval $(cmake-package))
-- 
2.5.0
