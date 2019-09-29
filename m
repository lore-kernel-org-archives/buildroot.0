From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 18:56:01 +0200
Subject: [Buildroot] [PATCH 2/2] package/gcc: add support for D language
In-Reply-To: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
References: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929165601.20269-3-eric.le.bihan.dev@free.fr>
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
 package/gcc/Config.in.host         | 10 ++++++++++
 package/gcc/gcc-final/gcc-final.mk |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fc0333d08f..1e772dc0f2 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -121,6 +121,16 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	  Fortran language and you want Fortran libraries to be
 	  installed on your target system.
 
+config BR2_TOOLCHAIN_BUILDROOT_DLANG
+	bool "Enable D language support"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_USES_GLIBC
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
