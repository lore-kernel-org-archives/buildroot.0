From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 22:59:46 +0200
Subject: [Buildroot] [git commit] package/lapack: new package
Message-ID: <20160706210032.63C6C7FD0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ba26756d838736c2fe4936a3a25f4c8762133ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lapack is a fortran-based linear algebra math library.

Signed-off-by: Benjamin Kamath <bkamath@spaceflight.com>
[Samuel:
 - Update to use BR2_TOOLCHAIN_HAS_FORTRAN symbol + add comment
   when the toolchain does not meet the requirements.
 - Update powerpc/uclibc dependencies to allow build with musl.
 - Bump to 3.6.1.]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[Thomas: move comment about installed libraries from .mk file to
Config.in help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/lapack/Config.in   | 21 +++++++++++++++++++++
 package/lapack/lapack.hash |  2 ++
 package/lapack/lapack.mk   | 21 +++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b9a7567..299ca84 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1247,6 +1247,7 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/jemalloc/Config.in"
+	source "package/lapack/Config.in"
 	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libbsd/Config.in"
diff --git a/package/lapack/Config.in b/package/lapack/Config.in
new file mode 100644
index 0000000..b5eca49
--- /dev/null
+++ b/package/lapack/Config.in
@@ -0,0 +1,21 @@
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
+	  LAPACK and BLAS FORTRAN implementation. This package
+	  installs two libraries: libblas and liblapack.
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
index 0000000..e57cebc
--- /dev/null
+++ b/package/lapack/lapack.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  888a50d787a9d828074db581c80b2d22bdb91435a673b1bf6cd6eb51aa50d1de  lapack-3.6.1.tgz
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
new file mode 100644
index 0000000..56008e1
--- /dev/null
+++ b/package/lapack/lapack.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# lapack
+#
+################################################################################
+
+LAPACK_VERSION = 3.6.1
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
