From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Sep 2013 18:06:30 +0200
Subject: [Buildroot] [PATCHv2 04/14] gcc: fix Fortran support
In-Reply-To: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378138000-12739-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes the Fortran support in the gcc package by making
sure that the runtime Fortran library is properly installed to the
target.

It also takes this opportunity to slightly reword the Config.in option
help text, to no longer mention gcc < 4.2 since they are no longer
supported in Buildroot, and to have a more meaningful explanation.

Finally, it fixes the gcc-final.mk code to use the correct
BR2_INSTALL_FORTRAN option rather than the non-existing
BR2_GCC_CROSS_FORTRAN option, to decide whether Fortran support should
be enabled or not in the cross-compiler.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host         | 8 ++++----
 package/gcc/gcc-final/gcc-final.mk | 6 +++++-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 7e6df2d..b440ee2 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -119,13 +119,13 @@ config BR2_INSTALL_OBJC
 	  Build/install Objective-C compiler and runtime?
 
 config BR2_INSTALL_FORTRAN
-	bool "Build/install Fortran compiler and runtime?"
+	bool "Enable Fortran support"
 	depends on !BR2_avr32
 	select BR2_PACKAGE_LIBMPFR
 	help
-	  Build/install Fortran compiler and runtime?
-	  Note that it is highly recommended NOT to use gfortran
-	  from gcc older than 4.2.0
+	  Enable the support for the Fortran language in the
+	  cross-compiler, and install the Fortran runtime to the
+	  target.
 
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index b62dfe2..15adadd 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -34,7 +34,7 @@ HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_FINAL_CONFIGURE_SYMLINK
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_GCC_CROSS_FORTRAN) += fortran
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_FORTRAN) += fortran
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_GCC_CROSS_OBJC)    += objc
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
@@ -113,6 +113,10 @@ ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
 HOST_GCC_FINAL_USR_LIBS += libgomp
 endif
 
+ifeq ($(BR2_INSTALL_FORTRAN),y)
+HOST_GCC_FINAL_USR_LIBS += libgfortran
+endif
+
 ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
 define HOST_GCC_FINAL_INSTALL_USR_LIBS
 	mkdir -p $(TARGET_DIR)/usr/lib
-- 
1.8.1.2
