From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 24 Oct 2019 20:16:20 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/gcc: add support for D language
In-Reply-To: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
References: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191024181621.29349-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 9.1, GCC provides support for the D programming language [1].

So add a Kconfig entry to enable support for it.

[1] https://dlang.org/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/gcc/Config.in.host         | 22 ++++++++++++++++++++++
 package/gcc/gcc-final/gcc-final.mk |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 75be7c48cc..aeea21c0fb 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -77,6 +77,19 @@ config BR2_GCC_SUPPORTS_LIBCILKRTS
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
+config BR2_GCC_SUPPORTS_DLANG
+	bool
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_mips || BR2_mipsel
+	default y if BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_x86_64
+	default y if BR2_riscv && !BR2_RISCV_64
+
 config BR2_GCC_VERSION
 	string
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
@@ -118,6 +131,15 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	  Fortran language and you want Fortran libraries to be
 	  installed on your target system.
 
+config BR2_TOOLCHAIN_BUILDROOT_DLANG
+	bool "Enable D language support"
+	depends on BR2_GCC_SUPPORTS_DLANG
+	select BR2_TOOLCHAIN_HAS_DLANG
+	help
+	  Enable this option if you want your toolchain to support the
+	  D language and you want D libraries to be installed on your
+	  target system.
+
 config BR2_GCC_ENABLE_LTO
 	bool "Enable compiler link-time-optimization support"
 	select BR2_BINUTILS_ENABLE_LTO
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index f478fde0d7..79c88a5d60 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -55,6 +55,7 @@ endef
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
+GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_DLANG) += d
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
@@ -172,6 +173,10 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 HOST_GCC_FINAL_USR_LIBS += libstdc++
 endif
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_DLANG),y)
+HOST_GCC_FINAL_USR_LIBS += libgdruntime libgphobos
+endif
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
 HOST_GCC_FINAL_USR_LIBS += libgfortran
 # fortran needs quadmath on x86 and x86_64
-- 
2.21.0
