From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 14:39:18 +0200
Subject: [Buildroot] [git commit] clapack: don't allow on PowerPC uClibc
Message-ID: <20140507123935.27E199CB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d05c2793609187d3ce843a2e491a0f31adf3216a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On PowerPC, clapack uses the _fpu_control symbol, which isn't defined
on uClibc, so this commit disallows the selection of clapack on
PowerPC uClibc configurations. PowerPC/glibc and ARM/uClibc
configurations have been tested to build correctly.

Fixes:

  http://autobuild.buildroot.org/results/d1d/d1d721fa697956218dfc2c865dfb61911cf2600e/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/armadillo/Config.in |    2 ++
 package/clapack/Config.in   |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index b3ba2fc..898564d 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,12 +1,14 @@
 comment "armadillo needs a toolchain w/ C++, largefile"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC) # clapack
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE # clapack
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC) # clapack
 	select BR2_PACKAGE_CLAPACK
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index 68a6dde..ee538a4 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_CLAPACK
 	bool "cblas/clapack"
 	depends on BR2_LARGEFILE
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
+	# _fpu_control is used on PowerPC, but not available with
+	# uClibc
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 	help
 	  BLAS and LAPACK C implementation (f2c'ed version of).
 
@@ -22,3 +25,4 @@ config BR2_PACKAGE_CLAPACK_ARITH_H
 comment "cblas/clapack needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
