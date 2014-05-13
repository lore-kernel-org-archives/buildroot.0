From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 13 May 2014 11:11:40 +0200
Subject: [Buildroot] [PATCH] clapack: disable on blackfin
Message-ID: <1399972300-1485-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "_" symbol prefix added by the blackfin toolchain causes "undefined
symbol" build failures when the compiler is trying to link a binary
with libblas and/or liblapack.

This patch also disables clapack reverse dependencies: armadillo.

Fixes:
  http://autobuild.buildroot.net/results/a28df0ba10803e6e54c2f8160bbd8190cba4d690/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/armadillo/Config.in | 2 ++
 package/clapack/Config.in   | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 898564d..c7a680a 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -2,6 +2,7 @@ comment "armadillo needs a toolchain w/ C++, largefile"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC) # clapack
+	depends on !BR2_bfin # clapack
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
@@ -9,6 +10,7 @@ config BR2_PACKAGE_ARMADILLO
 	depends on BR2_LARGEFILE # clapack
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC) # clapack
+	depends on !BR2_bfin # clapack
 	select BR2_PACKAGE_CLAPACK
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index ee538a4..5e930a6 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -5,6 +5,10 @@ config BR2_PACKAGE_CLAPACK
 	# _fpu_control is used on PowerPC, but not available with
 	# uClibc
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+	# disable clapack on blackfin, it triggers "undefined symbol" failure
+	# because of the "_" symbol prefix:
+	# http://autobuild.buildroot.net/results/a28df0ba10803e6e54c2f8160bbd8190cba4d690/
+	depends on !BR2_bfin
 	help
 	  BLAS and LAPACK C implementation (f2c'ed version of).
 
@@ -24,5 +28,6 @@ config BR2_PACKAGE_CLAPACK_ARITH_H
 
 comment "cblas/clapack needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
+	depends on !BR2_bfin
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
-- 
1.9.2
