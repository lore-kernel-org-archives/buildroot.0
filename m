From: Benjamin Kamath <kamath.ben@gmail.com>
Date: Fri, 18 Mar 2016 13:23:46 -0700
Subject: [Buildroot] [PATCH v2 2/3] gcc: consolidate fortran options
Message-ID: <20160318202342.GA23907@spaceflight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Have BR2_TOOLCHAIN_BUILDROOT_FORTRAN select BR2_INSTALL_LIBFORTAN,
allowing packages and other dependencies to generically check
for fortran support with buildroot and external toolchains.

Signed-off-by: Benjamin Kamath <bkamath@spaceflight.com>
---
 package/gcc/Config.in.host         | 1 +
 package/gcc/gcc-final/gcc-final.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4845708..038a0a4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -111,6 +111,7 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
 
 config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	bool "Enable Fortran support"
+	select BR2_INSTALL_LIBFORTRAN
 	help
 	  Enable this option if you want your toolchain to support the
 	  Fortran language and you want Fortran libraries to be
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 69fdc0c..87480c7 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -54,7 +54,7 @@ endef
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
-GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBFORTRAN) += fortran
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
 HOST_GCC_FINAL_CONF_OPTS = \
@@ -152,7 +152,7 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 HOST_GCC_FINAL_USR_LIBS += libstdc++
 endif
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
+ifeq ($(BR2_INSTALL_LIBFORTRAN),y)
 HOST_GCC_FINAL_USR_LIBS += libgfortran
 endif
 
-- 
2.5.0
