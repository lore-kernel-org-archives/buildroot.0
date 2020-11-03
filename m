From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue,  3 Nov 2020 14:50:15 +0100
Subject: [Buildroot] [PATCH v3] package/armadillo: allows to select between
 clapack, lapack or openblas
Message-ID: <20201103135015.1936872-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

armadillo can use clapack, lapack or openblas as BLAS provider and clapack or
lapack as LAPACK provider.

This patch
- adds hidden variable to check dependencies/requirement for each of them
- a choice to select wich implementation to use for blas and lapack.

Choices are required since applications, potentially, needs explicitly lapack or clapack.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v2 -> v3:
- drop all default statements for choice (Thomas)
- add explicit -l since blas libary is called liblas for (c)lapack and
  libopenblas for openblas (Thomas)
- add a choice for lapack selection between lapack, clapack or none
Changes v1 -> v2:
- add openblas as blas provider
---
 package/armadillo/Config.in    | 66 ++++++++++++++++++++++++++++++++--
 package/armadillo/armadillo.mk | 29 ++++++++++++++-
 2 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index b2b61a3233..816b45be96 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,3 +1,15 @@
+config BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
+	bool
+	default y
+	depends on !BR2_m68k_cf
+	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS
+	bool
+	default y
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+
 comment "armadillo needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_powerpc
@@ -10,11 +22,59 @@ comment "armadillo needs a glibc toolchain w/ C++"
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
-	depends on !BR2_m68k_cf # clapack
-	select BR2_PACKAGE_CLAPACK
+	depends on BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS || \
+		BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS || \
+		BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
 
 	  http://arma.sourceforge.net/
+
+if BR2_PACKAGE_ARMADILLO
+
+choice
+	prompt "blas library"
+	help
+	  Selects blas library to use
+
+config BR2_PACKAGE_ARMADILLO_BLAS_LAPACK
+	bool "lapack"
+	depends on BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS
+	select BR2_PACKAGE_LAPACK
+
+config BR2_PACKAGE_ARMADILLO_BLAS_CLAPACK
+	bool "clapack"
+	depends on BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
+	select BR2_PACKAGE_CLAPACK
+
+config BR2_PACKAGE_ARMADILLO_BLAS_OPENBLAS
+	bool "openblas"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+	select BR2_PACKAGE_OPENBLAS
+
+endchoice
+
+choice
+	prompt "lapack library"
+	help
+	  Selects lapack library to use
+
+config BR2_PACKAGE_ARMADILLO_LAPACK_LAPACK
+	bool "lapack"
+	depends on BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS
+	depends on !BR2_PACKAGE_ARMADILLO_BLAS_CLAPACK
+	select BR2_PACKAGE_LAPACK
+
+config BR2_PACKAGE_ARMADILLO_LAPACK_CLAPACK
+	bool "clapack"
+	depends on BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
+	depends on !BR2_PACKAGE_ARMADILLO_BLAS_LAPACK
+	select BR2_PACKAGE_CLAPACK
+
+config BR2_PACKAGE_ARMADILLO_LAPACK_NONE
+	bool "none"
+
+endchoice
+
+endif
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 624b842ef6..bae27774d7 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -7,11 +7,38 @@
 ARMADILLO_VERSION = 9.900.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
-ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
 
 ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
 
+# blas support may be provided by lapack, clapack or openblas
+# blas library from (c)lapack is libblas.a, libopenblas.a otherwise
+ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
+ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
+ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
+ARMADILLO_DEPENDENCIES = openblas
+else
+ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lblas
+ifeq ($(BR2_PACKAGE_ARMADILLO_CLAPACK), y)
+ARMADILLO_DEPENDENCIES = clapack
+else
+ARMADILLO_DEPENDENCIES = lapack
+endif
+endif
+
+# lapack support may be provided by lapack or clapack
+# but not by openblas
+ifeq ($(BR2_PACKAGE_LAPACK_NONE),y)
+ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=OFF
+else
+ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
+ifeq ($(BR2_PACKAGE_ARMADILLO_LAPACK_LAPACK),y)
+ARMADILLO_DEPENDENCIES += lapack
+else ifeq ($(BR2_PACKAGE_ARMADILLO_LAPACK_CLAPACK), y)
+ARMADILLO_DEPENDENCIES += clapack
+endif
+endif
+
 $(eval $(cmake-package))
-- 
2.20.1
