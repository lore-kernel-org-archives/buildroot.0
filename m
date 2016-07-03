From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jul 2016 15:47:50 +0200
Subject: [Buildroot] [PATCH v3 14/14] package/lapack: new package
In-Reply-To: <20160703134750.7516-1-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
Message-ID: <20160703134750.7516-15-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Benjamin Kamath <kamath.ben@gmail.com>

lapack is a fortran-based linear algebra math library.

Signed-off-by: Benjamin Kamath <bkamath@spaceflight.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- integrate this patch in this series
- slightly tweak the commit log
- s/BR2_INSTALL_LIBFORTRAN/BR2_TOOLCHAIN_HAS_FORTRAN/

changes v2->v3:
- change the powerpc/uclibc dependency to allow build with musl (ThomasP)
- add comment when the toolchain does not have fortran support (ThomasP)
- fix license (ThomasP)
- fix case in config options (ThomasP)
---
 package/Config.in                              |  1 +
 package/lapack/0001-case-sensitive-paths.patch | 22 ++++++++++++++++++++++
 package/lapack/Config.in                       | 20 ++++++++++++++++++++
 package/lapack/lapack.hash                     |  2 ++
 package/lapack/lapack.mk                       | 25 +++++++++++++++++++++++++
 5 files changed, 70 insertions(+)
 create mode 100644 package/lapack/0001-case-sensitive-paths.patch
 create mode 100644 package/lapack/Config.in
 create mode 100644 package/lapack/lapack.hash
 create mode 100644 package/lapack/lapack.mk

diff --git a/package/Config.in b/package/Config.in
index 73bf32f..8305ffe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1259,6 +1259,7 @@ menu "Other"
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
index 0000000..73b55c5
--- /dev/null
+++ b/package/lapack/Config.in
@@ -0,0 +1,20 @@
+comment "lapack/blas needs a toolchain w/ fortran"
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+	depends on !BR2_TOOLCHAIN_HAS_FORTRAN
+
+config BR2_PACKAGE_LAPACK
+	bool "lapack/blas"
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN
+	# _fpu_control is used on PowerPC, but not available with uClibc
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
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
index 0000000..af6d627
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
+LAPACK_LICENSE = BSD-3c
+LAPACK_LICENSE_FILES = LICENSE
+LAPACK_SITE = http://www.netlib.org/lapack
+LAPACK_INSTALL_STAGING = YES
+LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
+
+ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
+LAPACK_CONF_OPTS += -DBUILD_COMPLEX=ON -DBUILD_COMPLEX16=ON
+else
+LAPACK_CONF_OPTS += -DBUILD_COMPLEX=OFF -DBUILD_COMPLEX16=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.9.0
