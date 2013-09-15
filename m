From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 22:57:29 +0200
Subject: [Buildroot] [git commit] gcc: fix Objective-C support
Message-ID: <20130915213314.85A059B76A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd04552e899a195fb7dc1811d66bc2fc7d4ce930
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the Objective-C support in the gcc package by making
sure that the runtime Objective-C library is properly installed to the
target.

It also takes this opportunity to slightly reword the Config.in option
help text to have a more meaningful explanation.

Finally, it fixes the gcc-final.mk code to use the correct
BR2_INSTALL_OBJC option rather than the non-existing
BR2_GCC_CROSS_OBJC option, to decide whether Objective-C support
should be enabled or not in the cross-compiler.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/Config.in.host         |    6 ++++--
 package/gcc/gcc-final/gcc-final.mk |    6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b440ee2..a7dbbb6 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -113,10 +113,12 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	  initial, gcc intermediate and gcc final passes.
 
 config BR2_INSTALL_OBJC
-	bool "Build/install Objective-C compiler and runtime?"
+	bool "Enable Objective-C support"
 	depends on !BR2_avr32
 	help
-	  Build/install Objective-C compiler and runtime?
+	  Enable the support for the Objective-C language in the
+	  cross-compiler, and install the Objective-C runtime to the
+	  target.
 
 config BR2_INSTALL_FORTRAN
 	bool "Enable Fortran support"
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 92b6f7f..2dbdfab 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -35,7 +35,7 @@ HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_FINAL_CONFIGURE_SYMLINK
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_FORTRAN) += fortran
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_GCC_CROSS_OBJC)    += objc
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_OBJC)    += objc
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
 HOST_GCC_FINAL_CONF_OPT = \
@@ -120,6 +120,10 @@ ifeq ($(BR2_INSTALL_FORTRAN),y)
 HOST_GCC_FINAL_USR_LIBS += libgfortran
 endif
 
+ifeq ($(BR2_INSTALL_OBJC),y)
+HOST_GCC_FINAL_USR_LIBS += libobjc
+endif
+
 ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
 define HOST_GCC_FINAL_INSTALL_USR_LIBS
 	mkdir -p $(TARGET_DIR)/usr/lib
