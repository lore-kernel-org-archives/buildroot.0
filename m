From: David Kessler <djkessler@me.com>
Date: Sat, 09 May 2015 12:40:54 -0500
Subject: [Buildroot] [PATCH 1/1] Add support for libgfortran
Message-ID: <1431193254-11648-1-git-send-email-DJKessler@me.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Kessler <DJKessler@me.com>
---
 package/gcc/Config.in.host         | 7 +++++++
 package/gcc/gcc-final/gcc-final.mk | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index cf96c73..6cdc8af 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -108,6 +108,13 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
 	  C++ language and you want C++ libraries to be installed on
 	  your target system.
 
+config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
+	bool "Enable Fortran support"
+	help
+	  Enable this option if you want your toolchain to support the
+	  Fortran language and you want Fortran libraries to be
+	  installed on your target system.
+
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index d873aa6..703d39a 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -44,6 +44,7 @@ endef
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
 HOST_GCC_FINAL_CONF_OPTS = \
@@ -146,6 +147,10 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 HOST_GCC_FINAL_USR_LIBS += libstdc++
 endif
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
+HOST_GCC_FINAL_USR_LIBS += libgfortran
+endif
+
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
 HOST_GCC_FINAL_USR_LIBS += libgomp
 endif
-- 
1.9.1
