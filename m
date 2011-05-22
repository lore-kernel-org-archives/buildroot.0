From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 22 May 2011 16:58:32 +0200
Subject: [Buildroot] [git commit] toolchain/crosstool-NG: update to 1.11.3
Message-ID: <20110522145941.047B0835BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4943afcc912bcdd0f5ba869fa5fc57ffae8e96f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1.11.3 is the latest stable version, and it has a few improvements
we'll find usefull. For example, it hasa a boolean option for
disabling the {,e}glibc fortified build (instead of requiring us
to shoehorn it in extra cflags.

Update the config files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../002-no-sysroot-prompt-in-backend.patch         |   12 --
 .../crosstool-ng.config-eglibc                     |  127 +++++++++++++-------
 .../crosstool-ng.config-glibc                      |  126 +++++++++++++-------
 .../crosstool-ng.config-uClibc                     |  122 ++++++++++++-------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    2 +-
 5 files changed, 242 insertions(+), 147 deletions(-)
 delete mode 100644 toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch

diff --git a/toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch b/toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch
deleted file mode 100644
index 4c3426a..0000000
--- a/toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff --git a/config/toolchain.in b/config/toolchain.in
---- a/config/toolchain.in
-+++ b/config/toolchain.in
-@@ -20,7 +20,7 @@
- 
- config SYSROOT_NAME
-     string
--    prompt "sysroot directory name"
-+    prompt "sysroot directory name" if ! BACKEND
-     depends on USE_SYSROOT
-     default "sysroot"
-     help
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
index 83af9e7..5902d40 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG version: 1.10.1
-# Sun Apr 24 23:38:08 2011
+# crosstool-NG version: 1.11.3
+# Sat May 21 22:35:30 2011
 #
 CT_BACKEND=y
 CT_MODULES=y
@@ -112,10 +112,6 @@ CT_ARCH_FLOAT_HW=y
 # CT_ARCH_FLOAT_SW is not set
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
-
-#
-# General target options
-#
 # CT_ARCH_alpha is not set
 CT_ARCH_arm=y
 # CT_ARCH_avr32 is not set
@@ -125,6 +121,7 @@ CT_ARCH_arm=y
 # CT_ARCH_powerpc is not set
 # CT_ARCH_s390 is not set
 # CT_ARCH_sh is not set
+# CT_ARCH_sparc is not set
 # CT_ARCH_x86 is not set
 CT_ARCH_alpha_AVAILABLE=y
 CT_ARCH_arm_AVAILABLE=y
@@ -135,10 +132,19 @@ CT_ARCH_mips_AVAILABLE=y
 CT_ARCH_powerpc_AVAILABLE=y
 CT_ARCH_s390_AVAILABLE=y
 CT_ARCH_sh_AVAILABLE=y
+CT_ARCH_sparc_AVAILABLE=y
 CT_ARCH_x86_AVAILABLE=y
+
+#
+# Generic target options
+#
 CT_ARCH_USE_MMU=y
 
 #
+# Target optimisations
+#
+
+#
 # arm other options
 #
 CT_ARCH_ARM_MODE="arm"
@@ -147,10 +153,6 @@ CT_ARCH_ARM_MODE_ARM=y
 CT_ARCH_ARM_EABI=y
 
 #
-# Target optimisations
-#
-
-#
 # Toolchain options
 #
 
@@ -192,37 +194,43 @@ CT_BUILD_SUFFIX=""
 # CT_MINGW32 is not set
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="2.6.37"
+CT_KERNEL_VERSION="2.6.38.4"
 # CT_KERNEL_bare_metal is not set
 CT_KERNEL_linux=y
 # CT_KERNEL_mingw32 is not set
-CT_KERNEL_bare_metal_AVAILABLE=y
+# CT_KERNEL_bare_metal_AVAILABLE is not set
 CT_KERNEL_linux_AVAILABLE=y
+# CT_KERNEL_mingw32_AVAILABLE is not set
+
+#
+# Common kernel options
+#
+CT_SHARED_LIBS=y
+
+#
+# linux other options
+#
 CT_KERNEL_LINUX_INSTALL=y
-CT_KERNEL_V_2_6_37=y
-# CT_KERNEL_V_2_6_36_3 is not set
-# CT_KERNEL_V_2_6_36_2 is not set
-# CT_KERNEL_V_2_6_36_1 is not set
-# CT_KERNEL_V_2_6_36 is not set
-# CT_KERNEL_V_2_6_35_10 is not set
-# CT_KERNEL_V_2_6_34_8 is not set
-# CT_KERNEL_V_2_6_33_7 is not set
-# CT_KERNEL_V_2_6_32_28 is not set
+# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
+CT_KERNEL_V_2_6_38_4=y
+# CT_KERNEL_V_2_6_38_3 is not set
+# CT_KERNEL_V_2_6_38_2 is not set
+# CT_KERNEL_V_2_6_38_1 is not set
+# CT_KERNEL_V_2_6_38 is not set
+# CT_KERNEL_V_2_6_37_6 is not set
+# CT_KERNEL_V_2_6_36_4 is not set
+# CT_KERNEL_V_2_6_35_13 is not set
+# CT_KERNEL_V_2_6_34_9 is not set
+# CT_KERNEL_V_2_6_33_12 is not set
+# CT_KERNEL_V_2_6_32_39 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
-# CT_KERNEL_V_2_6_27_57 is not set
+# CT_KERNEL_V_2_6_27_58 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
 CT_KERNEL_LINUX_VERBOSITY_0=y
 # CT_KERNEL_LINUX_VERBOSITY_1 is not set
 # CT_KERNEL_LINUX_VERBOSITY_2 is not set
 CT_KERNEL_LINUX_VERBOSE_LEVEL=0
 CT_KERNEL_LINUX_INSTALL_CHECK=y
-# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
-CT_KERNEL_mingw32_AVAILABLE=y
-
-#
-# Common kernel options
-#
-CT_SHARED_LIBS=y
 
 #
 # Binary utilities
@@ -244,6 +252,13 @@ CT_BINUTILS_V_2_20=y
 # CT_BINUTILS_V_2_16_1 is not set
 CT_BINUTILS_VERSION="2.20"
 CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
+CT_BINUTILS_FORCE_LD_BFD=y
+CT_BINUTILS_LINKER_LD=y
+# CT_BINUTILS_LINKER_GOLD is not set
+# CT_BINUTILS_LINKER_LD_GOLD is not set
+# CT_BINUTILS_LINKER_GOLD_LD is not set
+CT_BINUTILS_LINKERS_LIST="ld"
+CT_BINUTILS_LINKER_DEFAULT="bfd"
 CT_BINUTILS_EXTRA_CONFIG=""
 
 #
@@ -252,9 +267,14 @@ CT_BINUTILS_EXTRA_CONFIG=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.3"
 CT_CC_gcc=y
+# CT_CC_V_linaro_4_6_2011_04_0 is not set
+# CT_CC_V_4_6_0 is not set
+# CT_CC_V_linaro_4_5_2011_04_0 is not set
 # CT_CC_V_4_5_2 is not set
 # CT_CC_V_4_5_1 is not set
 # CT_CC_V_4_5_0 is not set
+# CT_CC_V_linaro_4_4_2011_02_0 is not set
+# CT_CC_V_4_4_6 is not set
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
 CT_CC_V_4_4_3=y
@@ -274,21 +294,22 @@ CT_CC_V_4_4_3=y
 # CT_CC_V_4_1_2 is not set
 # CT_CC_V_4_0_4 is not set
 # CT_CC_V_3_4_6 is not set
+# CT_CC_GCC_4_2 is not set
 CT_CC_GCC_4_2_or_later=y
+# CT_CC_GCC_4_3 is not set
 CT_CC_GCC_4_3_or_later=y
+CT_CC_GCC_4_4=y
 CT_CC_GCC_4_4_or_later=y
+# CT_CC_GCC_4_5 is not set
 # CT_CC_GCC_4_5_or_later is not set
+# CT_CC_GCC_4_6 is not set
+# CT_CC_GCC_4_6_or_later is not set
 CT_CC_GCC_HAS_GRAPHITE=y
 # CT_CC_GCC_HAS_LTO is not set
 CT_CC_GCC_USE_GMP_MPFR=y
 CT_CC_GCC_USE_PPL_CLOOG=y
 # CT_CC_GCC_USE_MPC is not set
 # CT_CC_GCC_USE_LIBELF is not set
-CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
-CT_CC_BUGURL=""
-CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG=""
-CT_CC_EXTRA_CONFIG=""
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
 CT_CC_SUPPORT_JAVA=y
@@ -306,9 +327,22 @@ CT_CC_SUPPORT_OBJCXX=y
 #
 # gcc other options
 #
-CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
-CT_CC_GCC_USE_GRAPHITE=y
+CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
+CT_CC_BUGURL=""
+CT_CC_ENABLE_CXX_FLAGS=""
+CT_CC_CORE_EXTRA_CONFIG=""
+CT_CC_EXTRA_CONFIG=""
 CT_CC_STATIC_LIBSTDCXX=y
+
+#
+# Optimisation features
+#
+CT_CC_GCC_USE_GRAPHITE=y
+
+#
+# Settings for libraries running on target
+#
+CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
 # CT_CC_GCC_LIBMUDFLAP is not set
 # CT_CC_GCC_LIBGOMP is not set
 # CT_CC_GCC_LIBSSP is not set
@@ -333,6 +367,7 @@ CT_LIBC_eglibc=y
 # CT_LIBC_none is not set
 # CT_LIBC_uClibc is not set
 CT_LIBC_eglibc_AVAILABLE=y
+# CT_LIBC_EGLIBC_V_2_13 is not set
 # CT_LIBC_EGLIBC_V_2_12 is not set
 # CT_LIBC_EGLIBC_V_2_11 is not set
 CT_LIBC_EGLIBC_V_2_10=y
@@ -346,11 +381,12 @@ CT_EGLIBC_REVISION="HEAD"
 # CT_EGLIBC_CHECKOUT is not set
 # CT_EGLIBC_OPT_SIZE is not set
 # CT_EGLIBC_CUSTOM_CONFIG is not set
-CT_LIBC_glibc_AVAILABLE=y
-CT_LIBC_mingw_AVAILABLE=y
-CT_LIBC_newlib_AVAILABLE=y
-CT_LIBC_none_AVAILABLE=y
-CT_LIBC_uClibc_AVAILABLE=y
+# CT_LIBC_glibc_AVAILABLE is not set
+# CT_LIBC_mingw_AVAILABLE is not set
+# CT_LIBC_newlib_AVAILABLE is not set
+# CT_LIBC_none_AVAILABLE is not set
+# CT_LIBC_uClibc_AVAILABLE is not set
+CT_LIBC_glibc_familly=y
 
 #
 # glibc/eglibc common options
@@ -387,7 +423,7 @@ CT_LIBC_ADDONS_LIST=""
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="2.6.37"
+CT_LIBC_GLIBC_MIN_KERNEL="2.6.38.4"
 CT_LIBC_SUPPORT_THREADS_ANY=y
 CT_LIBC_SUPPORT_NPTL=y
 CT_LIBC_SUPPORT_LINUXTHREADS=y
@@ -420,7 +456,6 @@ CT_CLOOG_NEEDED=y
 # CT_MPC_NEEDED is not set
 # CT_LIBELF_NEEDED is not set
 CT_COMPLIBS=y
-# CT_WRAPPER_NEEDED is not set
 CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
@@ -439,9 +474,13 @@ CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_3_2 is not set
 # CT_MPFR_V_2_3_1 is not set
 CT_MPFR_VERSION="2.4.2"
+# CT_PPL_V_0_11_2 is not set
+# CT_PPL_V_0_11_1 is not set
 # CT_PPL_V_0_11 is not set
 CT_PPL_V_0_10_2=y
 CT_PPL_VERSION="0.10.2"
+# CT_PPL_0_11 is not set
+# CT_PPL_NEEDS_LIBPWL is not set
 # CT_CLOOG_V_0_15_10 is not set
 CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_8 is not set
@@ -452,6 +491,4 @@ CT_CLOOG_VERSION="0.15.9"
 #
 # Companion libraries common options
 #
-CT_COMPLIBS_BACKUP=y
 # CT_COMPLIBS_CHECK is not set
-# CT_COMPLIBS_SHARED is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
index 737429d..f7c0de7 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG version: 1.10.1
-# Sun Apr 24 23:37:30 2011
+# crosstool-NG version: 1.11.3
+# Sat May 21 22:36:05 2011
 #
 CT_BACKEND=y
 CT_MODULES=y
@@ -112,10 +112,6 @@ CT_ARCH_FLOAT_HW=y
 # CT_ARCH_FLOAT_SW is not set
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
-
-#
-# General target options
-#
 # CT_ARCH_alpha is not set
 CT_ARCH_arm=y
 # CT_ARCH_avr32 is not set
@@ -125,6 +121,7 @@ CT_ARCH_arm=y
 # CT_ARCH_powerpc is not set
 # CT_ARCH_s390 is not set
 # CT_ARCH_sh is not set
+# CT_ARCH_sparc is not set
 # CT_ARCH_x86 is not set
 CT_ARCH_alpha_AVAILABLE=y
 CT_ARCH_arm_AVAILABLE=y
@@ -135,10 +132,19 @@ CT_ARCH_mips_AVAILABLE=y
 CT_ARCH_powerpc_AVAILABLE=y
 CT_ARCH_s390_AVAILABLE=y
 CT_ARCH_sh_AVAILABLE=y
+CT_ARCH_sparc_AVAILABLE=y
 CT_ARCH_x86_AVAILABLE=y
+
+#
+# Generic target options
+#
 CT_ARCH_USE_MMU=y
 
 #
+# Target optimisations
+#
+
+#
 # arm other options
 #
 CT_ARCH_ARM_MODE="arm"
@@ -147,10 +153,6 @@ CT_ARCH_ARM_MODE_ARM=y
 CT_ARCH_ARM_EABI=y
 
 #
-# Target optimisations
-#
-
-#
 # Toolchain options
 #
 
@@ -192,37 +194,43 @@ CT_BUILD_SUFFIX=""
 # CT_MINGW32 is not set
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="2.6.37"
+CT_KERNEL_VERSION="2.6.38.4"
 # CT_KERNEL_bare_metal is not set
 CT_KERNEL_linux=y
 # CT_KERNEL_mingw32 is not set
-CT_KERNEL_bare_metal_AVAILABLE=y
+# CT_KERNEL_bare_metal_AVAILABLE is not set
 CT_KERNEL_linux_AVAILABLE=y
+# CT_KERNEL_mingw32_AVAILABLE is not set
+
+#
+# Common kernel options
+#
+CT_SHARED_LIBS=y
+
+#
+# linux other options
+#
 CT_KERNEL_LINUX_INSTALL=y
-CT_KERNEL_V_2_6_37=y
-# CT_KERNEL_V_2_6_36_3 is not set
-# CT_KERNEL_V_2_6_36_2 is not set
-# CT_KERNEL_V_2_6_36_1 is not set
-# CT_KERNEL_V_2_6_36 is not set
-# CT_KERNEL_V_2_6_35_10 is not set
-# CT_KERNEL_V_2_6_34_8 is not set
-# CT_KERNEL_V_2_6_33_7 is not set
-# CT_KERNEL_V_2_6_32_28 is not set
+# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
+CT_KERNEL_V_2_6_38_4=y
+# CT_KERNEL_V_2_6_38_3 is not set
+# CT_KERNEL_V_2_6_38_2 is not set
+# CT_KERNEL_V_2_6_38_1 is not set
+# CT_KERNEL_V_2_6_38 is not set
+# CT_KERNEL_V_2_6_37_6 is not set
+# CT_KERNEL_V_2_6_36_4 is not set
+# CT_KERNEL_V_2_6_35_13 is not set
+# CT_KERNEL_V_2_6_34_9 is not set
+# CT_KERNEL_V_2_6_33_12 is not set
+# CT_KERNEL_V_2_6_32_39 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
-# CT_KERNEL_V_2_6_27_57 is not set
+# CT_KERNEL_V_2_6_27_58 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
 CT_KERNEL_LINUX_VERBOSITY_0=y
 # CT_KERNEL_LINUX_VERBOSITY_1 is not set
 # CT_KERNEL_LINUX_VERBOSITY_2 is not set
 CT_KERNEL_LINUX_VERBOSE_LEVEL=0
 CT_KERNEL_LINUX_INSTALL_CHECK=y
-# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
-CT_KERNEL_mingw32_AVAILABLE=y
-
-#
-# Common kernel options
-#
-CT_SHARED_LIBS=y
 
 #
 # Binary utilities
@@ -244,6 +252,13 @@ CT_BINUTILS_V_2_20=y
 # CT_BINUTILS_V_2_16_1 is not set
 CT_BINUTILS_VERSION="2.20"
 CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
+CT_BINUTILS_FORCE_LD_BFD=y
+CT_BINUTILS_LINKER_LD=y
+# CT_BINUTILS_LINKER_GOLD is not set
+# CT_BINUTILS_LINKER_LD_GOLD is not set
+# CT_BINUTILS_LINKER_GOLD_LD is not set
+CT_BINUTILS_LINKERS_LIST="ld"
+CT_BINUTILS_LINKER_DEFAULT="bfd"
 CT_BINUTILS_EXTRA_CONFIG=""
 
 #
@@ -252,9 +267,14 @@ CT_BINUTILS_EXTRA_CONFIG=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.3"
 CT_CC_gcc=y
+# CT_CC_V_linaro_4_6_2011_04_0 is not set
+# CT_CC_V_4_6_0 is not set
+# CT_CC_V_linaro_4_5_2011_04_0 is not set
 # CT_CC_V_4_5_2 is not set
 # CT_CC_V_4_5_1 is not set
 # CT_CC_V_4_5_0 is not set
+# CT_CC_V_linaro_4_4_2011_02_0 is not set
+# CT_CC_V_4_4_6 is not set
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
 CT_CC_V_4_4_3=y
@@ -274,21 +294,22 @@ CT_CC_V_4_4_3=y
 # CT_CC_V_4_1_2 is not set
 # CT_CC_V_4_0_4 is not set
 # CT_CC_V_3_4_6 is not set
+# CT_CC_GCC_4_2 is not set
 CT_CC_GCC_4_2_or_later=y
+# CT_CC_GCC_4_3 is not set
 CT_CC_GCC_4_3_or_later=y
+CT_CC_GCC_4_4=y
 CT_CC_GCC_4_4_or_later=y
+# CT_CC_GCC_4_5 is not set
 # CT_CC_GCC_4_5_or_later is not set
+# CT_CC_GCC_4_6 is not set
+# CT_CC_GCC_4_6_or_later is not set
 CT_CC_GCC_HAS_GRAPHITE=y
 # CT_CC_GCC_HAS_LTO is not set
 CT_CC_GCC_USE_GMP_MPFR=y
 CT_CC_GCC_USE_PPL_CLOOG=y
 # CT_CC_GCC_USE_MPC is not set
 # CT_CC_GCC_USE_LIBELF is not set
-CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
-CT_CC_BUGURL=""
-CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG=""
-CT_CC_EXTRA_CONFIG=""
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
 CT_CC_SUPPORT_JAVA=y
@@ -306,9 +327,22 @@ CT_CC_SUPPORT_OBJCXX=y
 #
 # gcc other options
 #
-CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
-CT_CC_GCC_USE_GRAPHITE=y
+CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
+CT_CC_BUGURL=""
+CT_CC_ENABLE_CXX_FLAGS=""
+CT_CC_CORE_EXTRA_CONFIG=""
+CT_CC_EXTRA_CONFIG=""
 CT_CC_STATIC_LIBSTDCXX=y
+
+#
+# Optimisation features
+#
+CT_CC_GCC_USE_GRAPHITE=y
+
+#
+# Settings for libraries running on target
+#
+CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
 # CT_CC_GCC_LIBMUDFLAP is not set
 # CT_CC_GCC_LIBGOMP is not set
 # CT_CC_GCC_LIBSSP is not set
@@ -332,7 +366,7 @@ CT_LIBC_glibc=y
 # CT_LIBC_newlib is not set
 # CT_LIBC_none is not set
 # CT_LIBC_uClibc is not set
-CT_LIBC_eglibc_AVAILABLE=y
+# CT_LIBC_eglibc_AVAILABLE is not set
 CT_LIBC_glibc_AVAILABLE=y
 CT_LIBC_GLIBC_TARBALL=y
 # CT_LIBC_GLIBC_V_2_12_2 is not set
@@ -347,10 +381,11 @@ CT_LIBC_GLIBC_V_2_9=y
 # CT_LIBC_GLIBC_V_2_6 is not set
 # CT_LIBC_GLIBC_V_2_5_1 is not set
 # CT_LIBC_GLIBC_V_2_5 is not set
-CT_LIBC_mingw_AVAILABLE=y
-CT_LIBC_newlib_AVAILABLE=y
-CT_LIBC_none_AVAILABLE=y
-CT_LIBC_uClibc_AVAILABLE=y
+# CT_LIBC_mingw_AVAILABLE is not set
+# CT_LIBC_newlib_AVAILABLE is not set
+# CT_LIBC_none_AVAILABLE is not set
+# CT_LIBC_uClibc_AVAILABLE is not set
+CT_LIBC_glibc_familly=y
 
 #
 # glibc/eglibc common options
@@ -387,7 +422,7 @@ CT_LIBC_ADDONS_LIST=""
 # CT_LIBC_GLIBC_KERNEL_VERSION_NONE is not set
 CT_LIBC_GLIBC_KERNEL_VERSION_AS_HEADERS=y
 # CT_LIBC_GLIBC_KERNEL_VERSION_CHOSEN is not set
-CT_LIBC_GLIBC_MIN_KERNEL="2.6.37"
+CT_LIBC_GLIBC_MIN_KERNEL="2.6.38.4"
 CT_LIBC_SUPPORT_THREADS_ANY=y
 CT_LIBC_SUPPORT_NPTL=y
 # CT_LIBC_SUPPORT_LINUXTHREADS is not set
@@ -420,7 +455,6 @@ CT_CLOOG_NEEDED=y
 # CT_MPC_NEEDED is not set
 # CT_LIBELF_NEEDED is not set
 CT_COMPLIBS=y
-# CT_WRAPPER_NEEDED is not set
 CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
@@ -439,9 +473,13 @@ CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_3_2 is not set
 # CT_MPFR_V_2_3_1 is not set
 CT_MPFR_VERSION="2.4.2"
+# CT_PPL_V_0_11_2 is not set
+# CT_PPL_V_0_11_1 is not set
 # CT_PPL_V_0_11 is not set
 CT_PPL_V_0_10_2=y
 CT_PPL_VERSION="0.10.2"
+# CT_PPL_0_11 is not set
+# CT_PPL_NEEDS_LIBPWL is not set
 # CT_CLOOG_V_0_15_10 is not set
 CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_8 is not set
@@ -452,6 +490,4 @@ CT_CLOOG_VERSION="0.15.9"
 #
 # Companion libraries common options
 #
-CT_COMPLIBS_BACKUP=y
 # CT_COMPLIBS_CHECK is not set
-# CT_COMPLIBS_SHARED is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
index f251726..5728e08 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# crosstool-NG version: 1.10.1
-# Sun Apr 24 23:37:50 2011
+# crosstool-NG version: 1.11.3
+# Sat May 21 22:36:24 2011
 #
 CT_BACKEND=y
 CT_MODULES=y
@@ -112,10 +112,6 @@ CT_ARCH_FLOAT_HW=y
 # CT_ARCH_FLOAT_SW is not set
 CT_TARGET_CFLAGS=""
 CT_TARGET_LDFLAGS=""
-
-#
-# General target options
-#
 # CT_ARCH_alpha is not set
 CT_ARCH_arm=y
 # CT_ARCH_avr32 is not set
@@ -125,6 +121,7 @@ CT_ARCH_arm=y
 # CT_ARCH_powerpc is not set
 # CT_ARCH_s390 is not set
 # CT_ARCH_sh is not set
+# CT_ARCH_sparc is not set
 # CT_ARCH_x86 is not set
 CT_ARCH_alpha_AVAILABLE=y
 CT_ARCH_arm_AVAILABLE=y
@@ -135,10 +132,19 @@ CT_ARCH_mips_AVAILABLE=y
 CT_ARCH_powerpc_AVAILABLE=y
 CT_ARCH_s390_AVAILABLE=y
 CT_ARCH_sh_AVAILABLE=y
+CT_ARCH_sparc_AVAILABLE=y
 CT_ARCH_x86_AVAILABLE=y
+
+#
+# Generic target options
+#
 CT_ARCH_USE_MMU=y
 
 #
+# Target optimisations
+#
+
+#
 # arm other options
 #
 CT_ARCH_ARM_MODE="arm"
@@ -147,10 +153,6 @@ CT_ARCH_ARM_MODE_ARM=y
 CT_ARCH_ARM_EABI=y
 
 #
-# Target optimisations
-#
-
-#
 # Toolchain options
 #
 
@@ -192,37 +194,43 @@ CT_BUILD_SUFFIX=""
 # CT_MINGW32 is not set
 CT_KERNEL_SUPPORTS_SHARED_LIBS=y
 CT_KERNEL="linux"
-CT_KERNEL_VERSION="2.6.37"
+CT_KERNEL_VERSION="2.6.38.4"
 # CT_KERNEL_bare_metal is not set
 CT_KERNEL_linux=y
 # CT_KERNEL_mingw32 is not set
-CT_KERNEL_bare_metal_AVAILABLE=y
+# CT_KERNEL_bare_metal_AVAILABLE is not set
 CT_KERNEL_linux_AVAILABLE=y
+# CT_KERNEL_mingw32_AVAILABLE is not set
+
+#
+# Common kernel options
+#
+CT_SHARED_LIBS=y
+
+#
+# linux other options
+#
 CT_KERNEL_LINUX_INSTALL=y
-CT_KERNEL_V_2_6_37=y
-# CT_KERNEL_V_2_6_36_3 is not set
-# CT_KERNEL_V_2_6_36_2 is not set
-# CT_KERNEL_V_2_6_36_1 is not set
-# CT_KERNEL_V_2_6_36 is not set
-# CT_KERNEL_V_2_6_35_10 is not set
-# CT_KERNEL_V_2_6_34_8 is not set
-# CT_KERNEL_V_2_6_33_7 is not set
-# CT_KERNEL_V_2_6_32_28 is not set
+# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
+CT_KERNEL_V_2_6_38_4=y
+# CT_KERNEL_V_2_6_38_3 is not set
+# CT_KERNEL_V_2_6_38_2 is not set
+# CT_KERNEL_V_2_6_38_1 is not set
+# CT_KERNEL_V_2_6_38 is not set
+# CT_KERNEL_V_2_6_37_6 is not set
+# CT_KERNEL_V_2_6_36_4 is not set
+# CT_KERNEL_V_2_6_35_13 is not set
+# CT_KERNEL_V_2_6_34_9 is not set
+# CT_KERNEL_V_2_6_33_12 is not set
+# CT_KERNEL_V_2_6_32_39 is not set
 # CT_KERNEL_V_2_6_31_14 is not set
-# CT_KERNEL_V_2_6_27_57 is not set
+# CT_KERNEL_V_2_6_27_58 is not set
 # CT_KERNEL_LINUX_CUSTOM is not set
 CT_KERNEL_LINUX_VERBOSITY_0=y
 # CT_KERNEL_LINUX_VERBOSITY_1 is not set
 # CT_KERNEL_LINUX_VERBOSITY_2 is not set
 CT_KERNEL_LINUX_VERBOSE_LEVEL=0
 CT_KERNEL_LINUX_INSTALL_CHECK=y
-# CT_KERNEL_LINUX_USE_CUSTOM_HEADERS is not set
-CT_KERNEL_mingw32_AVAILABLE=y
-
-#
-# Common kernel options
-#
-CT_SHARED_LIBS=y
 
 #
 # Binary utilities
@@ -244,6 +252,12 @@ CT_BINUTILS_V_2_20=y
 # CT_BINUTILS_V_2_16_1 is not set
 CT_BINUTILS_VERSION="2.20"
 CT_BINUTILS_GOLD_SUPPORTS_ARCH=y
+CT_BINUTILS_LINKER_LD=y
+# CT_BINUTILS_LINKER_GOLD is not set
+# CT_BINUTILS_LINKER_LD_GOLD is not set
+# CT_BINUTILS_LINKER_GOLD_LD is not set
+CT_BINUTILS_LINKERS_LIST="ld"
+CT_BINUTILS_LINKER_DEFAULT="bfd"
 CT_BINUTILS_EXTRA_CONFIG=""
 
 #
@@ -252,9 +266,14 @@ CT_BINUTILS_EXTRA_CONFIG=""
 CT_CC="gcc"
 CT_CC_VERSION="4.4.3"
 CT_CC_gcc=y
+# CT_CC_V_linaro_4_6_2011_04_0 is not set
+# CT_CC_V_4_6_0 is not set
+# CT_CC_V_linaro_4_5_2011_04_0 is not set
 # CT_CC_V_4_5_2 is not set
 # CT_CC_V_4_5_1 is not set
 # CT_CC_V_4_5_0 is not set
+# CT_CC_V_linaro_4_4_2011_02_0 is not set
+# CT_CC_V_4_4_6 is not set
 # CT_CC_V_4_4_5 is not set
 # CT_CC_V_4_4_4 is not set
 CT_CC_V_4_4_3=y
@@ -274,21 +293,22 @@ CT_CC_V_4_4_3=y
 # CT_CC_V_4_1_2 is not set
 # CT_CC_V_4_0_4 is not set
 # CT_CC_V_3_4_6 is not set
+# CT_CC_GCC_4_2 is not set
 CT_CC_GCC_4_2_or_later=y
+# CT_CC_GCC_4_3 is not set
 CT_CC_GCC_4_3_or_later=y
+CT_CC_GCC_4_4=y
 CT_CC_GCC_4_4_or_later=y
+# CT_CC_GCC_4_5 is not set
 # CT_CC_GCC_4_5_or_later is not set
+# CT_CC_GCC_4_6 is not set
+# CT_CC_GCC_4_6_or_later is not set
 CT_CC_GCC_HAS_GRAPHITE=y
 # CT_CC_GCC_HAS_LTO is not set
 CT_CC_GCC_USE_GMP_MPFR=y
 CT_CC_GCC_USE_PPL_CLOOG=y
 # CT_CC_GCC_USE_MPC is not set
 # CT_CC_GCC_USE_LIBELF is not set
-CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
-CT_CC_BUGURL=""
-CT_CC_ENABLE_CXX_FLAGS=""
-CT_CC_CORE_EXTRA_CONFIG=""
-CT_CC_EXTRA_CONFIG=""
 CT_CC_SUPPORT_CXX=y
 CT_CC_SUPPORT_FORTRAN=y
 CT_CC_SUPPORT_JAVA=y
@@ -306,9 +326,22 @@ CT_CC_SUPPORT_OBJCXX=y
 #
 # gcc other options
 #
-CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
-CT_CC_GCC_USE_GRAPHITE=y
+CT_CC_PKGVERSION="crosstool-NG-${CT_VERSION}"
+CT_CC_BUGURL=""
+CT_CC_ENABLE_CXX_FLAGS=""
+CT_CC_CORE_EXTRA_CONFIG=""
+CT_CC_EXTRA_CONFIG=""
 CT_CC_STATIC_LIBSTDCXX=y
+
+#
+# Optimisation features
+#
+CT_CC_GCC_USE_GRAPHITE=y
+
+#
+# Settings for libraries running on target
+#
+CT_CC_GCC_ENABLE_TARGET_OPTSPACE=y
 # CT_CC_GCC_LIBMUDFLAP is not set
 # CT_CC_GCC_LIBGOMP is not set
 # CT_CC_GCC_LIBSSP is not set
@@ -332,11 +365,11 @@ CT_LIBC_VERSION="0.9.30.3"
 # CT_LIBC_newlib is not set
 # CT_LIBC_none is not set
 CT_LIBC_uClibc=y
-CT_LIBC_eglibc_AVAILABLE=y
-CT_LIBC_glibc_AVAILABLE=y
-CT_LIBC_mingw_AVAILABLE=y
-CT_LIBC_newlib_AVAILABLE=y
-CT_LIBC_none_AVAILABLE=y
+# CT_LIBC_eglibc_AVAILABLE is not set
+# CT_LIBC_glibc_AVAILABLE is not set
+# CT_LIBC_mingw_AVAILABLE is not set
+# CT_LIBC_newlib_AVAILABLE is not set
+# CT_LIBC_none_AVAILABLE is not set
 CT_LIBC_uClibc_AVAILABLE=y
 # CT_LIBC_UCLIBC_V_0_9_31 is not set
 CT_LIBC_UCLIBC_V_0_9_30_3=y
@@ -399,7 +432,6 @@ CT_CLOOG_NEEDED=y
 # CT_MPC_NEEDED is not set
 # CT_LIBELF_NEEDED is not set
 CT_COMPLIBS=y
-# CT_WRAPPER_NEEDED is not set
 CT_GMP=y
 CT_MPFR=y
 CT_PPL=y
@@ -418,9 +450,13 @@ CT_MPFR_V_2_4_2=y
 # CT_MPFR_V_2_3_2 is not set
 # CT_MPFR_V_2_3_1 is not set
 CT_MPFR_VERSION="2.4.2"
+# CT_PPL_V_0_11_2 is not set
+# CT_PPL_V_0_11_1 is not set
 # CT_PPL_V_0_11 is not set
 CT_PPL_V_0_10_2=y
 CT_PPL_VERSION="0.10.2"
+# CT_PPL_0_11 is not set
+# CT_PPL_NEEDS_LIBPWL is not set
 # CT_CLOOG_V_0_15_10 is not set
 CT_CLOOG_V_0_15_9=y
 # CT_CLOOG_V_0_15_8 is not set
@@ -431,6 +467,4 @@ CT_CLOOG_VERSION="0.15.9"
 #
 # Companion libraries common options
 #
-CT_COMPLIBS_BACKUP=y
 # CT_COMPLIBS_CHECK is not set
-# CT_COMPLIBS_SHARED is not set
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index ed7f7c6..b506651 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -14,7 +14,7 @@ uclibc: dependencies $(STAMP_DIR)/ct-ng-toolchain-installed
 # Internal variables
 
 # Crostool-NG hard-coded configuration options
-CTNG_VERSION:=1.10.1
+CTNG_VERSION:=1.11.3
 CTNG_SITE:=http://crosstool-ng.org/download/crosstool-ng/
 CTNG_SOURCE:=crosstool-ng-$(CTNG_VERSION).tar.bz2
 CTNG_DIR:=$(BUILD_DIR)/crosstool-ng-$(CTNG_VERSION)
-- 
1.7.3.4
