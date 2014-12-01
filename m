From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 20:05:59 +0100
Subject: [Buildroot] [git commit] package/gcc/mpfr: remove deprecated
	features
Message-ID: <20141201190932.5BEF57FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65d5ec37081c41c963c67454afae5765cdc4da47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the fortran and objective C language support since these have
been deprecated since more than a year ago.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host         |   19 -------------------
 package/gcc/gcc-final/gcc-final.mk |   10 ----------
 package/mpfr/Config.in             |    1 -
 3 files changed, 0 insertions(+), 30 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3bccf36..9d08ccb 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -118,25 +118,6 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
 comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
 	depends on BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && BR2_TOOLCHAIN_BUILDROOT_LOCALE
 
-config BR2_INSTALL_OBJC
-	bool "Enable Objective-C support"
-	depends on !BR2_avr32
-	depends on BR2_DEPRECATED_SINCE_2013_11
-	help
-	  Enable the support for the Objective-C language in the
-	  cross-compiler, and install the Objective-C runtime to the
-	  target.
-
-config BR2_INSTALL_FORTRAN
-	bool "Enable Fortran support"
-	depends on !BR2_avr32
-	depends on BR2_DEPRECATED_SINCE_2013_11
-	select BR2_PACKAGE_LIBMPFR
-	help
-	  Enable the support for the Fortran language in the
-	  cross-compiler, and install the Fortran runtime to the
-	  target.
-
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 9579b63..46ef5c6 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -44,8 +44,6 @@ endef
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_FORTRAN) += fortran
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_OBJC)    += objc
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
 HOST_GCC_FINAL_CONF_OPTS = \
@@ -131,14 +129,6 @@ ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
 HOST_GCC_FINAL_USR_LIBS += libgomp
 endif
 
-ifeq ($(BR2_INSTALL_FORTRAN),y)
-HOST_GCC_FINAL_USR_LIBS += libgfortran
-endif
-
-ifeq ($(BR2_INSTALL_OBJC),y)
-HOST_GCC_FINAL_USR_LIBS += libobjc
-endif
-
 ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 HOST_GCC_FINAL_USR_LIBS += libmudflapth
diff --git a/package/mpfr/Config.in b/package/mpfr/Config.in
index 9acb0b4..e02511f 100644
--- a/package/mpfr/Config.in
+++ b/package/mpfr/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_MPFR
 	bool "mpfr"
-	default y if BR2_INSTALL_FORTRAN
 	select BR2_PACKAGE_GMP
 	help
 	  C library for multiple-precision floating-point computations
