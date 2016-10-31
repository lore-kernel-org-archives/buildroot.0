From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Oct 2016 15:57:13 +0100
Subject: [Buildroot] [PATCH v3 24/24] toolchain-external: introduce and use
	external toolchain infra
In-Reply-To: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477925833-27204-25-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fairly large commit is needed to switch in one atomic change from
the old single package based external toolchain handling, to a
mechanism based on a common external toolchain package infrastructure
and separate packages for each toolchain family. The purpose is to
clearly separate the common external toolchain logic from the
toolchain-specific details and generally make the external toolchain
code hopefully easier to maintain.

To achieve this, this commit:

 - Introduce in pkg-toolchain-external.mk the
     'toolchain-external-package' macro, which is the core of the
     external toolchain package infrastructure. Like any other package
     infrastructure, it defines a number of variables and provides a
     behavior for the configure, build and install steps.

   - Turn the toolchain-external.mk file in a simple virtual package,
     which automatically depends on the selected external
     toolchain. Like any other virtual package, the Kconfig variable
     BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL indicates which package is
     providing the currently selected toolchain.

   - Removes all the toolchain-specific definitions from
     toolchain/toolchain-external/Config.in as well as the hash file,
     and instead use the per-toolchain packages in the subdirectories
     toolchain/toolchain-external/*/.

   - Wine: Use $(TOOLCHAIN_EXTERNAL_PREFIX) instead of
     $(BR2_TOOLCHAIN_EXTERNAL_PREFIX) which was removed.

   - Keep the current default choice for external toolchains:
      BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
      BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
      BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
      BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
      BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
      BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
      BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
      BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
      BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
      BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
      BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
      BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
      BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
      BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
      BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
      BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
      BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
      BR2_TOOLCHAIN_EXTERNAL_CUSTOM

    For Aarch64, use Linaro as default over Codesourcery toolchains
    For ARM, use Linaro as default over Codesourcery and Arago toolchains
    For MIPS, use Codesourcery over Codescape toolchains

Notes:
   - The hack for setting TOOLCHAIN_EXTERNAL_BIN for the ADI bfin
     toolchain is no longer needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: Keep current default choice for toolchains (i.e do not sort toolchains by
    alphabetical order)
v2: - merge all pkg-toolchain-external* into pkg-toolchain-external.mk (Arnout)
    - rebase on master

    fix two big issue:
    1) TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS were not included in the
       toolchain wrapper.
    2) TOOLCHAIN_EXTERNAL_CFLAGS wasn't included in $(2)_CFLAGS, same
       for TOOLCHAIN_EXTERNAL_LIBS and $(2)_LIBS. So no libraries were
       intalled in target.
---
 package/Makefile.in                                |    2 +-
 package/wine/wine.mk                               |    2 +-
 toolchain/toolchain-external/Config.in             | 1001 ++------------------
 ...chain-external.mk => pkg-toolchain-external.mk} |  826 +++++++---------
 .../toolchain-external/toolchain-external.hash     |   67 --
 toolchain/toolchain-external/toolchain-external.mk |  833 +---------------
 6 files changed, 424 insertions(+), 2307 deletions(-)
 copy toolchain/toolchain-external/{toolchain-external.mk => pkg-toolchain-external.mk} (54%)
 delete mode 100644 toolchain/toolchain-external/toolchain-external.hash

diff --git a/package/Makefile.in b/package/Makefile.in
index 5d591e9..bd73219 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -184,7 +184,7 @@ endif
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CROSS = $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
 else
-TARGET_CROSS = $(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
+TARGET_CROSS = $(HOST_DIR)/usr/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 endif
 
 # Define TARGET_xx variables for all common binutils/gcc
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index d9a0ecf..47ba90a 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -34,7 +34,7 @@ WINE_CONF_OPTS = \
 # wrapper believes what the real gcc is named, and force the tuple of
 # the external toolchain, not the one we compute in GNU_TARGET_NAME.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-WINE_CONF_OPTS += TARGETFLAGS="-b $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))"
+WINE_CONF_OPTS += TARGETFLAGS="-b $(TOOLCHAIN_EXTERNAL_PREFIX)"
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_SEQ)$(BR2_PACKAGE_ALSA_LIB_RAWMIDI),yyy)
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5324599..5b9081c 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	string
+
 if BR2_TOOLCHAIN_EXTERNAL
 
 comment "Toolchain External Options"
@@ -8,574 +11,48 @@ choice
 comment "glibc toolchains only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
-comment "Linaro toolchains available for Cortex-A + EABIhf"
-	depends on BR2_arm || BR2_armeb
-	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
-
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2016.05"
-	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2016.05 (based on gcc 5.3.1), Linaro GDB 2016.05 (based on
-	  GDB 7.11.1), glibc 2.21, Binutils 2016.05 (based on 2.25). It
-	  generates code that runs on all Cortex-A profile devices,
-	  but tuned for the Cortex-A9. The code generated is Thumb 2,
-	  with the hard floating point calling convention, and uses
-	  the VFPv3-D16 FPU instructions.
-
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2016.05"
-	depends on BR2_armeb
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	help
-	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2016.05 (based on gcc 5.3.1), Linaro GDB
-	  2016.05 (based on GDB 7.11.1), glibc 2.21, Binutils 2016.05
-	  (based on 2.25). It generates code that runs on all Cortex-A
-	  profile devices, but tuned for the Cortex-A9. The code
-	  generated is Thumb 2, with the hard floating point calling
-	  convention, and uses the VFPv3-D16 FPU instructions.
-
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
-	bool "Sourcery CodeBench ARM 2014.05"
-	depends on BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABI
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	help
-	  Sourcery CodeBench toolchain for the ARM architecture, from
-	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
-	  2.18 and gdb 7.7.50, kernel headers 3.13. It has support
-	  for the following variants:
-	    - ARMv5TE, little endian, soft-float, glibc
-	      Select ARM926T, ARM10T, XScale or another ARMv5 core
-	      Select BR2_SOFT_FLOAT
-	    - ARMv4T, little endian, soft-float, glibc
-	      Select ARM720T, ARM920T, ARM922T or another ARMv4 core
-	      Select BR2_SOFT_FLOAT
-	    - ARMv7-A, Thumb 2, little endian, soft-float, glibc
-	      Select Cortex-A8, Cortex-A9 or another ARMv7-A core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mthumb
-
-comment "Sourcery CodeBench toolchains available for the EABI ABI"
-	depends on BR2_arm
-	depends on !BR2_ARM_EABI
-	depends on !BR2_STATIC_LIBS
-
-config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
-	bool "Arago ARMv7 2011.09"
-	depends on BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABI
-	depends on BR2_ARM_CPU_HAS_VFPV3
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-	# kernel headers: 2.6.31
-	help
-	  Texas Instruments Arago 2011.09 toolchain, with gcc 4.5.3,
-	  binutils 2.20.1, glibc 2.12, gdb 7.2.
-
-	  This toolchain uses -mfloat-abi=softfp (i.e can use FPU
-	  instructions, but passes floating point function arguments
-	  in integer registers), and requires a VFPv3 floating point
-	  unit to work properly. This unit is available on most
-	  Cortex-A ARM processors, but not all.
-
-config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-	bool "Arago ARMv5 2011.09"
-	depends on BR2_arm
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_ARM_CPU_ARMV4
-	depends on BR2_ARM_EABI
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-	# kernel headers: 2.6.31
-	help
-	  Texas Instruments Arago ARMv5 2011.09 toolchain, with gcc
-	  4.5.3, binutils 2.20.1, glibc 2.12, gdb 7.2.
-
-	  This toolchain uses software-floating point.
-
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
-	bool "Sourcery CodeBench MIPS 2016.05"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64R2
-	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_MIPS_NABI32
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	help
-	  Sourcery CodeBench toolchain for the MIPS architecture, from
-	  Mentor Graphics. It uses gcc 5.3, binutils 2.25.51, glibc
-	  2.23, uClibc 0.9.30 and gdb 7.10.50, kernel headers 4.4.1. It
-	  has support for the following variants:
-	    - MIPS32r2 - Big-Endian, 2008 NaN, O32
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Big-Endian, O32
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32r2 - Big-Endian, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32r2 - Big-Endian, Soft-Float, O32, MIPS16
-	      Select MIPS (big endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, 2008 NaN, O32
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mnan=2008
-	    - MIPS32r2 - Little-Endian, O32
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS32r2 - Little-Endian, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Disable BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32, MIPS16
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mips16
-	    - MIPS32r2 - Little-Endian, Soft-Float, O32, microMIPS
-	      Select MIPS (little endian) core
-	      Select BR2_SOFT_FLOAT
-	      Set BR2_TARGET_OPTIMIZATION to -mmicromips
-	    - MIPS32r2 - uClibc, Big-Endian, 2008 NaN, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Big-Endian, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Big-Endian, Soft-Float, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, 2008 NaN, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, O32
-	      Not usable in Buildroot yet.
-	    - MIPS32r2 - uClibc, Little-Endian, Soft-Float, O32
-	      Not usable in Buildroot yet.
-	    - MIPS64r2 - Big-Endian, N64
-	      Select MIPS64 (big endian) core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64r2 - Big-Endian, Soft-Float, N64
-	      Select MIPS64 (big endian) core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-	    - MIPS64r2 - Little-Endian, N64
-	      Select MIPS64 (little endian) core
-	      Select the n64 ABI
-	      Disable BR2_SOFT_FLOAT
-	    - MIPS64r2 - Little-Endian, Soft-Float, N64
-	      Select MIPS64 (little endian) core
-	      Select the n64 ABI
-	      Select BR2_SOFT_FLOAT
-
-comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
-	depends on BR2_MIPS_NABI32
-	depends on !BR2_STATIC_LIBS
+# Kept toolchains sorted by architecture in order to use some toolchain
+# as default choice
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
-	bool "Codescape IMG GNU Linux Toolchain 2016.05"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Codescape IMG GNU Linux Toolchain 2015.10 for the MIPS
-	  architecture, from Imagination Technologies. It uses gcc
-	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
-	  headers 4.0. It has support for the following variants:
-	    - MIPS32r6 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Disable 'Use soft-float'
-	    - MIPS32r6 - Big-Endian, Soft-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Enable 'Use soft-float'
-	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Disable 'Use soft-float'
-	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Enable 'Use soft-float'
-	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI, microMIPS
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Disable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI, microMIPS
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r6' Target Architecture Variant
-	      Enable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n32 ABI
-	      Select 'MIPS64 (big endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n32' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n32 ABI
-	      Select 'MIPS64 (little endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n32' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n64 ABI
-	      Select 'MIPS64 (big endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n64' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n64 ABI
-	      Select 'MIPS64 (little endian)' Target Architecture
-	      Select 'mips 64r6' Target Architecture Variant
-	      Select 'n64' Target ABI
-	      Disable 'Use soft-float'
+# Bfin
+source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in"
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	bool "Codescape MTI GNU Linux Toolchain 2016.05"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT) || \
-		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Codescape MTI GNU Linux Toolchain 2015.10 for the MIPS
-	  architecture, from Imagination Technologies. It uses gcc
-	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
-	  headers 4.0. It has support for the following variants:
-	    - MIPS32r2 - Big-Endian, Hard-Float, Legacy NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Disable 'Use soft-float'
-	    - MIPS32r2 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Disable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
-	    - MIPS32r2 - Big-Endian, Soft-Float, Legacy NaN, o32 ABI
-	      Select 'MIPS (big endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Enable 'Use soft-float'
-	    - MIPS32r2 - Little-Endian, Hard-Float, Legacy NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Disable 'Use soft-float'
-	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Disable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
-	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Enable 'Use soft-float'
-	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI, microMIPS
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Enable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI, microMIPS
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	      Disable 'Use soft-float'
-	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS64r2 - Big-Endian, Hard-Float, Legacy NaN, n32 ABI
-	      Select 'MIPS64 (big endian)' Target Architecture
-	      Select 'mips 64r2' Target Architecture Variant
-	      Select 'n32' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r2 - Little-Endian, Hard-Float, Legacy NaN, n32 ABI
-	      Select 'MIPS64 (little endian)' Target Architecture
-	      Select 'mips 64r2' Target Architecture Variant
-	      Select 'n32' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r2 - Big-Endian, Hard-Float, Legacy NaN, n64 ABI
-	      Select 'MIPS64 (big endian)' Target Architecture
-	      Select 'mips 64r2' Target Architecture Variant
-	      Select 'n64' Target ABI
-	      Disable 'Use soft-float'
-	    - MIPS64r2 - Little-Endian, Hard-Float, Legacy NaN, n64 ABI
-	      Select 'MIPS64 (little endian)' Target Architecture
-	      Select 'mips 64r2' Target Architecture Variant
-	      Select 'n64' Target ABI
-	      Disable 'Use soft-float'
+# Aarch64 (use Linaro toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
+source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	bool "Sourcery CodeBench Nios-II 2016.05"
-	depends on BR2_nios2
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.25.1
-	help
-	  Sourcery CodeBench toolchain for the Nios-II architecture,
-	  from Mentor Graphics. It uses gcc 5.3, binutils 2.25.51,
-	  glibc 2.23, gdb 7.10.50 and kernel headers 4.4.
+# ARC
+source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
-	bool "Sourcery CodeBench SH 2012.09"
-	depends on BR2_sh4a || BR2_sh4aeb
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-	help
-	  Sourcery CodeBench toolchain for the SuperH architecture,
-	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
-	  glibc 2.16, uClibc 0.9.30, gdb 7.4.50 and kernel headers
-	  3.5.4. It has support for the following variants:
-	    - SH4A, glibc, little endian
-	      Default.
-	    - SH4A, glibc, big endian
-	      Add -mb to BR2_TARGET_OPTIMIZATION
-	    - SH4A, uClibc, little endian
-	      Not usable in Buildroot yet.
-	    - SH4A, uClibc, big endian
-	      Not usable in Buildroot yet.
+# ARM (use Linaro toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
+source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
+source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in"
+source "toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in"
+source "toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in"
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
-	bool "Sourcery CodeBench AMD64 2015.11"
-	depends on BR2_x86_64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_x86_jaguar || BR2_x86_steamroller
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	help
-	  Sourcery CodeBench toolchain for the amd64 (x86_64)
-	  architectures, from Mentor Graphics. It uses gcc 5.2,
-	  binutils 2.25.51, glibc 2.22, gdb 7.10.50 and kernel headers
-	  4.2. It has support for the following variants:
-	    - AMD Puma/Jaguar (family 16h), glibc
-	    Default for x86_64, nothing special to do.
-	    - AMD Steamroller (family 15h), glibc
-	    Select a steamroller core.
-	  No other architecture variants are supported since glibc
-	  is optimized for one of these two baselines.
+# MIPS (use codesourcery toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
+source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in"
+source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in"
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
-	bool "Sourcery CodeBench x86/x86_64 2012.09"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_x86_jaguar
-	depends on !BR2_x86_steamroller
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-	help
-	  Sourcery CodeBench toolchain for the x86/x86_64
-	  architectures, from Mentor Graphics. It uses gcc 4.7.2,
-	  binutils 2.23.51, glibc 2.16, gdb 7.4.50 and kernel headers
-	  3.5.4. It has support for the following variants:
-	    - Intel Pentium 4, glibc, 32 bits
-	      Default for x86, nothing special to do.
-	    - Intel Atom, glibc, 32 bits
-	      Select an Atom core
-	    - Intel Xeon, glibc, 64 bits
-	      Default for x86_64, nothing special to do.
-	    - Intel Core 2, glibc, 64 bits
-	      Select a Core 2 core
-	  Other architecture variants (beyond Pentium-4/Xeon) are
-	  supported as well, but glibc is not optimised for it.
+# NIOSII
+source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
 
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
-	bool "Blackfin.uclinux.org 2014R1"
-	depends on BR2_bfin
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Toolchain for the Blackfin architecture, from
-	  http://blackfin.uclinux.org.
+# SH4
+source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in"
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 2016.05"
-	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Toolchain for the AArch64 architecture, from
-	  http://www.linaro.org/engineering/armv8/
-
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-	bool "CodeSourcery AArch64 2014.11"
-	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	help
-	  Sourcery CodeBench toolchain for the AArch64 architecture,
-	  from Mentor Graphics. It uses gcc 4.9.1, binutils
-	  2.24.51.20140217, glibc 2.20, gdb 7.7.50 and kernel headers
-	  3.16.2.
-
-config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
-	bool "Musl 1.1.12 toolchain"
-	depends on (BR2_arm && BR2_ARM_EABI && BR2_USE_MMU) || \
-		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4 && BR2_USE_MMU) || \
-		(BR2_armeb && BR2_ARM_EABI && !BR2_ARM_CPU_ARMV7A && BR2_USE_MMU) || \
-		BR2_i386 || (BR2_mips && !BR2_SOFT_FLOAT) || \
-		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \
-		BR2_sh4 || BR2_sh4eb || \
-		BR2_x86_64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv && !BR2_mips_m5100 && !BR2_mips_m5101
-	# Unsupported for MIPS R6
-	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
-	select BR2_TOOLCHAIN_EXTERNAL_MUSL
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	help
-	  Toolchain based on the Musl C library, provided by the
-	  musl-cross project. It uses gcc 5.3, binutils 2.25.1 and
-	  musl 1.1.12. It does not have a cross debugger included.
-
-	  The ARM soft-float toolchain is built for ARMv4t, while the
-	  ARM hard-float toolchain is built for ARMv5t.
-	  The x86 toolchain is built for i486.
+# x86/x86_64
+source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in"
+source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in"
 
-	  http://musl.codu.org/
-
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-	bool "Synopsys ARC 2014.12 toolchain"
-	depends on BR2_arc
-	depends on BR2_HOSTARCH = "x86_64"
-	# does not provide IPv6, and lacks many uClibc features
-	# expected by Buildroot. The next Synopsys toolchain version
-	# should fix those problems.
-	depends on BROKEN
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_ENABLE_LOCALE
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	help
-	  Toolchain for the ARC cores, from
-	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
+# Musl based toolchains
+source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in"
 
-config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
-	bool "Custom toolchain"
-	help
-	  Use this option to use a custom toolchain pre-installed on
-	  your system.
+# Kept last, so it remains the non-default choice, unless there isn't
+# any available toolchain profile for the currently selected
+# architecture.
+source "toolchain/toolchain-external/toolchain-external-custom/Config.in"
 
 endchoice
 
@@ -608,50 +85,48 @@ config BR2_TOOLCHAIN_EXTERNAL_PATH
 	help
 	  Path to where the external toolchain is installed.
 
-config BR2_TOOLCHAIN_EXTERNAL_URL
-	string "Toolchain URL"
-	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM && BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
-	help
-	  URL of the custom toolchain tarball to download and install.
+# Kept toolchains sorted by architecture in order to use some toolchain
+# as default choice
 
-config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
-	string "Toolchain prefix"
-	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
-	default "$(ARCH)-linux"
+# Bfin
+source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in.options"
 
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	string
-	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arcle
-	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
-	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
-	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
-	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	default "aarch64-amd-linux-gnu"  if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
-	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
-	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
-	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX && BR2_BINFMT_FLAT
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX && BR2_BINFMT_FDPIC
-	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABI
-	default "arm-linux-musleabihf"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABIHF
-	default "mips-img-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
-	default "mips-mti-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
-	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_i386
-	default "mips-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mips && !BR2_SOFT_FLOAT)
-	default "mipsel-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mipsel && !BR2_SOFT_FLOAT)
-	default "mipsel-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mipsel && BR2_SOFT_FLOAT)
-	default "powerpc-linux-musl"     if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_powerpc
-	default "sh4-linux-musl"         if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_sh4
-	default "sh4eb-linux-musl"       if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_sh4eb
-	default "x86_64-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_x86_64
-	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX \
-					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+# Aarch64 (use Linaro toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
+source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options"
+
+# ARC
+source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
+
+# ARM (use Linaro toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
+source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
+source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options"
+source "toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in.options"
+source "toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in.options"
+
+# MIPS (use codesourcery toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
+source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options"
+source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options"
+
+# NIOSII
+source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options"
+
+# SH4
+source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options"
+
+# x86/x86_64
+source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options"
+source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options"
+
+# Musl based toolchains
+source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options"
+
+# Kept last, so it remains the non-default choice, unless there isn't
+# any available toolchain profile for the currently selected
+# architecture.
+source "toolchain/toolchain-external/toolchain-external-custom/Config.in.options"
 
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool
@@ -667,332 +142,6 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL
 	# Compatibility headers: cdefs.h, queue.h
 	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
 
-if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
-
-choice
-	bool "External toolchain gcc version"
-	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
-	help
-	  Set to the gcc version that is used by your external
-	  toolchain.
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_6
-	bool "6.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_5
-	bool "5.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
-	bool "4.9.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
-	bool "4.8.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
-	bool "4.7.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
-	bool "4.6.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
-	bool "4.5.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
-	bool "4.4.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
-
-config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
-	bool "4.3.x"
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
-
-endchoice
-
-choice
-	bool "External toolchain kernel headers series"
-	default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
-	help
-	  Set to the kernel headers version that were used to build
-	  this external toolchain.
-
-	  This is used to hide/show some packages that have strict
-	  requirements on the version of kernel headers.
-
-	  If unsure what version your toolchain is using, you can look
-	  at the value of LINUX_VERSION_CODE in linux/version.h in your
-	  toolchain. The Linux version is M.m.p, with:
-	    M = ( LINUX_VERSION_CODE >> 16 ) & 0xFF
-	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
-	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_8
-	bool "4.8.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_7
-	bool "4.7.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_6
-	bool "4.6.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_5
-	bool "4.5.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4
-	bool "4.4.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3
-	bool "4.3.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_2
-	bool "4.2.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1
-	bool "4.1.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0
-	bool "4.0.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_19
-	bool "3.19.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18
-	bool "3.18.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17
-	bool "3.17.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16
-	bool "3.16.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_15
-	bool "3.15.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14
-	bool "3.14.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13
-	bool "3.13.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12
-	bool "3.12.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_11
-	bool "3.11.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10
-	bool "3.10.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9
-	bool "3.9.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_8
-	bool "3.8.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_7
-	bool "3.7.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_6
-	bool "3.6.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_5
-	bool "3.5.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_4
-	bool "3.4.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_3
-	bool "3.3.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2
-	bool "3.2.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_1
-	bool "3.1.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_0
-	bool "3.0.x"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-
-config BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
-	bool "2.6.x"
-
-endchoice
-
-choice
-	prompt "External toolchain C library"
-	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-
-config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-	bool "uClibc/uClibc-ng"
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	# For the time being, we assume that all custom external
-	# toolchains have shadow password support.
-	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-	help
-	  Select this option if your external toolchain uses the
-	  uClibc (available from http://www.uclibc.org/)
-	  or uClibc-ng (available from http://www.uclibc-ng.org)
-	  C library.
-
-config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
-	bool "glibc/eglibc"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	help
-	  Select this option if your external toolchain uses the GNU C
-	  library (available from https://www.gnu.org/software/libc/)
-	  or its variant the eglibc library (http://www.eglibc.org/).
-
-	  Note: eglibc is a variant of glibc that (among other things)
-	  can be configured to exclude some of its features. Using a
-	  toolchain with eglibc configured to exclude key features may
-	  cause build failures to some packages.
-
-comment "glibc only available with shared lib support"
-	depends on BR2_STATIC_LIBS
-
-config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
-	bool "musl"
-	select BR2_TOOLCHAIN_EXTERNAL_MUSL
-	help
-	  Select this option if your external toolchain uses the
-	  'musl' C library, available from http://www.musl-libc.org/.
-
-endchoice
-
-if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-
-config BR2_TOOLCHAIN_EXTERNAL_WCHAR
-	bool "Toolchain has WCHAR support?"
-	select BR2_USE_WCHAR
-	help
-	  Select this option if your external toolchain supports
-	  WCHAR. If you don't know, leave the default value, Buildroot
-	  will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_LOCALE
-	bool "Toolchain has locale support?"
-	select BR2_TOOLCHAIN_EXTERNAL_WCHAR
-	select BR2_ENABLE_LOCALE
-	help
-	  Select this option if your external toolchain has locale
-	  support. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
-	bool "Toolchain has threads support?"
-	select BR2_TOOLCHAIN_HAS_THREADS
-	default y
-	help
-	  Select this option if your external toolchain has thread
-	  support. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
-if BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
-
-config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
-	bool "Toolchain has threads debugging support?"
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	default y
-	help
-	  Select this option if your external toolchain has thread
-	  debugging support. If you don't know, leave the default
-	  value, Buildroot will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL
-	bool "Toolchain has NPTL threads support?"
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	default y
-	help
-	  Select this option if your external toolchain uses the NPTL
-	  (Native Posix Thread Library) implementation of Posix
-	  threads. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
-endif # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
-
-endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-
-config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
-	bool "Toolchain has SSP support?"
-	select BR2_TOOLCHAIN_HAS_SSP
-	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	default y if BR2_TOOLCHAIN_EXTERNAL_MUSL
-	help
-	  Selection this option if your external toolchain has Stack
-	  Smashing Protection support enabled. If you don't know,
-	  leave the default value, Buildroot will tell you if it's
-	  correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
-	bool "Toolchain has RPC support?"
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on !BR2_TOOLCHAIN_EXTERNAL_MUSL
-	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	help
-	  Select this option if your external toolchain supports
-	  RPC. If you don't know, leave the default value, Buildroot
-	  will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_CXX
-	bool "Toolchain has C++ support?"
-	select BR2_INSTALL_LIBSTDCPP
-	help
-	  Select this option if your external toolchain has C++
-	  support. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
-	bool "Toolchain has Fortran support?"
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Select this option if your external toolchain has Fortran
-	  support. If you don't know, leave the default value,
-	  Buildroot will tell you if it's correct or not.
-
-config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
-	string "Extra toolchain libraries to be copied to target"
-	help
-	  If your external toolchain provides extra libraries that
-	  need to be copied to the target filesystem, enter them
-	  here, separated by spaces.
-
-endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
-
 config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	bool "Copy gdb server to the Target"
 	depends on BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
similarity index 54%
copy from toolchain/toolchain-external/toolchain-external.mk
copy to toolchain/toolchain-external/pkg-toolchain-external.mk
index 16d0094..e12f00d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -1,16 +1,10 @@
-################################################################################
 #
-# toolchain-external
-#
-################################################################################
-
-#
-# This package implements the support for external toolchains, i.e
-# toolchains that are available pre-built, ready to use. Such toolchain
-# may either be readily available on the Web (Linaro, Sourcery
-# CodeBench, from processor vendors) or may be built with tools like
-# Crosstool-NG or Buildroot itself. So far, we have tested this
-# with:
+# This package infrastructure implements the support for external
+# toolchains, i.e toolchains that are available pre-built, ready to
+# use. Such toolchain may either be readily available on the Web
+# (Linaro, Sourcery CodeBench, from processor vendors) or may be built
+# with tools like Crosstool-NG or Buildroot itself. So far, we have
+# tested this with:
 #
 #  * Toolchains generated by Crosstool-NG
 #  * Toolchains generated by Buildroot
@@ -27,16 +21,15 @@
 # The basic principle is the following
 #
 #  1. If the toolchain is not pre-installed, download and extract it
-#  in $(TOOLCHAIN_EXTERNAL_INSTALL_DIR). Otherwise,
-#  $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) points to were the toolchain has
-#  already been installed by the user.
+#  in $(HOST_DIR)/opt/ext-toolchain. Otherwise, we use the toolchain
+#  from the location where it has been installed by the user.
 #
 #  2. For all external toolchains, perform some checks on the
 #  conformity between the toolchain configuration described in the
 #  Buildroot menuconfig system, and the real configuration of the
 #  external toolchain. This is for example important to make sure that
 #  the Buildroot configuration system knows whether the toolchain
-#  supports RPC, IPv6, locales, large files, etc. Unfortunately, these
+#  supports RPC, locales, large files, etc. Unfortunately, these
 #  things cannot be detected automatically, since the value of these
 #  options (such as BR2_TOOLCHAIN_HAS_NATIVE_RPC) are needed at
 #  configuration time because these options are used as dependencies
@@ -63,6 +56,15 @@
 #  $(HOST_DIR)/usr/bin like for the internal toolchains, and the rest
 #  of Buildroot is handled identical for the 2 toolchain types.
 
+#  - Definitions of the list of libraries that should be copied to the
+#    target.
+#  - Definition of the CFLAGS to use with the external toolchain, as
+#    well as the common toolchain wrapper build arguments
+#
+
+#
+# Define the list of libraries to copy
+#
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
@@ -100,94 +102,16 @@ endif
 
 TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
-# Details about sysroot directory selection.
-#
-# To find the sysroot directory, we use the trick of looking for the
-# 'libc.a' file with the -print-file-name gcc option, and then
-# mangling the path to find the base directory of the sysroot.
-#
-# Note that we do not use the -print-sysroot option, because it is
-# only available since gcc 4.4.x, and we only recently dropped support
-# for 4.2.x and 4.3.x.
-#
-# When doing this, we don't pass any option to gcc that could select a
-# multilib variant (such as -march) as we want the "main" sysroot,
-# which contains all variants of the C library in the case of multilib
-# toolchains. We use the TARGET_CC_NO_SYSROOT variable, which is the
-# path of the cross-compiler, without the --sysroot=$(STAGING_DIR),
-# since what we want to find is the location of the original toolchain
-# sysroot. This "main" sysroot directory is stored in SYSROOT_DIR.
-#
-# Then, multilib toolchains are a little bit more complicated, since
-# they in fact have multiple sysroots, one for each variant supported
-# by the toolchain. So we need to find the particular sysroot we're
-# interested in.
 #
-# To do so, we ask the compiler where its sysroot is by passing all
-# flags (including -march and al.), except the --sysroot flag since we
-# want to the compiler to tell us where its original sysroot
-# is. ARCH_SUBDIR will contain the subdirectory, in the main
-# SYSROOT_DIR, that corresponds to the selected architecture
-# variant. ARCH_SYSROOT_DIR will contain the full path to this
-# location.
+# Calculate the common CFLAGS and wrapper arguments
 #
-# One might wonder why we don't just bother with ARCH_SYSROOT_DIR. The
-# fact is that in multilib toolchains, the header files are often only
-# present in the main sysroot, and only the libraries are available in
-# each variant-specific sysroot directory.
-
-
-TOOLCHAIN_EXTERNAL_PREFIX = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
-TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
-else
-TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
-endif
-
-ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
-ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
-# if no path set, figure it out from path
-TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
-endif
-else
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
-TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
-else
-TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
-endif
-endif
-
-# If this is a buildroot toolchain, it already has a wrapper which we want to
-# bypass. Since this is only evaluated after it has been extracted, we can use
-# $(wildcard ...) here.
-TOOLCHAIN_EXTERNAL_SUFFIX = \
-	$(if $(wildcard $(TOOLCHAIN_EXTERNAL_BIN)/*.br_real),.br_real)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
-	-DBR_CROSS_PATH_SUFFIX='"$(TOOLCHAIN_EXTERNAL_SUFFIX)"'
-
-TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
-TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc$(TOOLCHAIN_EXTERNAL_SUFFIX)
-TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFFIX)
-TOOLCHAIN_EXTERNAL_FC = $(TOOLCHAIN_EXTERNAL_CROSS)gfortran$(TOOLCHAIN_EXTERNAL_SUFFIX)
-TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf$(TOOLCHAIN_EXTERNAL_SUFFIX)
-
-ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
-# TOOLCHAIN_EXTERNAL_BIN points outside HOST_DIR => absolute path
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
-	-DBR_CROSS_PATH_ABS='"$(TOOLCHAIN_EXTERNAL_BIN)"'
-else
-# TOOLCHAIN_EXTERNAL_BIN points inside HOST_DIR => relative path
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
-	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
-endif
 
 ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
 CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU))
 else
 CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
 endif
+
 CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
 CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
@@ -198,46 +122,46 @@ CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
 # to select the right multilib variant
 ifeq ($(BR2_x86_64),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -m64
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_64
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_64
 endif
 ifneq ($(CC_TARGET_ARCH_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
 endif
 ifneq ($(CC_TARGET_CPU_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
 endif
 ifneq ($(CC_TARGET_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 endif
 ifneq ($(CC_TARGET_FPU_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
 endif
 ifneq ($(CC_TARGET_FLOAT_ABI_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(CC_TARGET_FLOAT_ABI_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
 endif
 ifneq ($(CC_TARGET_MODE_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -m$(CC_TARGET_MODE_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
 endif
 ifeq ($(BR2_BINFMT_FLAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_BINFMT_FLAT
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_BINFMT_FLAT
 endif
 ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
 TOOLCHAIN_EXTERNAL_CFLAGS += -EL
 endif
 ifeq ($(BR2_mips)$(BR2_mips64),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
 TOOLCHAIN_EXTERNAL_CFLAGS += -EB
 endif
 ifeq ($(BR2_arceb),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARC_TARGET_BIG_ENDIAN
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_ARC_TARGET_BIG_ENDIAN
 TOOLCHAIN_EXTERNAL_CFLAGS += -EB
 endif
 
@@ -245,235 +169,96 @@ TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
 ifeq ($(BR2_SOFT_FLOAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
-endif
-
-# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
-# So, add the musl-compat-headers package that will install those files,
-# into the staging directory:
-#   sys/queue.h:  header from NetBSD
-#   sys/cdefs.h:  minimalist header bundled in Buildroot
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
-endif
-
-# The Codescape toolchain uses a sysroot layout that places them
-# side-by-side instead of nested like multilibs. A symlink is needed
-# much like for the nested sysroots which are handled in
-# copy_toolchain_sysroot but there is not enough information in there
-# to determine whether the sysroot layout was nested or side-by-side.
-# Add the symlink here for now.
-define TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
-	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))"; \
-	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
-	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
-endef
-
-# Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
-# sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
-# -> sbin-<abi> so that the rest of Buildroot can find the toolchain
-# tools in the appropriate location.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
-ifeq ($(BR2_MIPS_OABI32),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX = o32
-else ifeq ($(BR2_MIPS_NABI32),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX = n32
-else ifeq ($(BR2_MIPS_NABI64),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX = n64
-endif
-
-define TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
-	rmdir $(STAGING_DIR)/usr/bin $(STAGING_DIR)/usr/sbin
-	ln -sf bin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/bin
-	ln -sf sbin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/sbin
-endef
-endif
-
-# Special handling for Blackfin toolchain, because of the split in two
-# tarballs, and the organization of tarball contents. The tarballs
-# contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
-# which themselves contain the toolchain. This is why we strip more
-# components than usual.
-define TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
-	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
-		$(TAR) --strip-components=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
-endef
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
-TOOLCHAIN_EXTERNAL_SOURCE = arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A),y)
-TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
-TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
-TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
-define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
-	rm -rf $(@D)/arago-2011.09/
-endef
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE),y)
-TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
-TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
-TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
-define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
-	rm -rf $(@D)/arago-2011.09/
-endef
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/arm-linux-gnueabihf
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-i686_arm-linux-gnueabihf.tar.xz
-else
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz
-endif
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/armeb-linux-gnueabihf
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-i686_armeb-linux-gnueabihf.tar.xz
-else
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
-endif
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
-TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
-TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
-TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
-TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 3
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/aarch64-linux-gnu
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-i686_aarch64-linux-gnu.tar.xz
-else
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu.tar.xz
-endif
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-amd-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
-	ln -sf ld-2.20.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
-endef
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
-define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
-	ln -sf ld-2.20.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
-endef
-TOOLCHAIN_EXTERNAL_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
-TOOLCHAIN_EXTERNAL_VERSION = 1.1.12
-TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
-ifeq ($(BR2_arm)$(BR2_ARM_EABI),yy)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_arm)$(BR2_ARM_EABIHF),yy)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabihf-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_armeb),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_i386),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_mips),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_powerpc),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_sh4),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-sh4-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_sh4eb),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-sh4eb-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_x86_64),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-endif
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC),y)
-TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
-ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE = arc700
-else
-TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE = archs
-endif
-ifeq ($(BR2_arcle),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = le
-else
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = be
-endif
-TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE)_linux_install.tar.gz
-else
-# Custom toolchain
-TOOLCHAIN_EXTERNAL_SITE = $(patsubst %/,%,$(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL))))
-TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-# We can't check hashes for custom downloaded toolchains
-BR_NO_CHECK_HASH_FOR += $(TOOLCHAIN_EXTERNAL_SOURCE)
+TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
 endif
 
-# Some toolchain vendors have a regular file naming pattern.
-# For them, mass-define _ACTUAL_SOURCE_TARBALL based _SITE.
-ifneq ($(findstring sourcery.mentor.com/public/gnu_toolchain,$(TOOLCHAIN_EXTERNAL_SITE)),)
-TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= \
-	$(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))
-endif
-
-# In fact, we don't need to download the toolchain, since it is already
-# available on the system, so force the site and source to be empty so
-# that nothing will be downloaded/extracted.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
-TOOLCHAIN_EXTERNAL_SITE =
-TOOLCHAIN_EXTERNAL_SOURCE =
-endif
-
-TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
-
-TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
-
-# Normal handling of downloaded toolchain tarball extraction.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*
-
-# As a regular package, the toolchain gets extracted in $(@D), but
-# since it's actually a fairly special package, we need it to be moved
-# into TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR.
-define TOOLCHAIN_EXTERNAL_MOVE
-	rm -rf $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
-	mkdir -p $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
-	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/
+#
+# The following functions creates the symbolic links needed to get the
+# cross-compilation tools visible in $(HOST_DIR)/usr/bin. Some of
+# links are done directly to the corresponding tool in the external
+# toolchain installation directory, while some other links are done to
+# the toolchain wrapper (preprocessor, C, C++ and Fortran compiler)
+#
+# We skip gdb symlink when we are building our own gdb to prevent two
+# gdb's in $(HOST_DIR)/usr/bin.
+#
+# The LTO support in gcc creates wrappers for ar, ranlib and nm which load
+# the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
+# *-gcc-nm and should be used instead of the real programs when -flto is
+# used. However, we should not add the toolchain wrapper for them, and they
+# match the *cc-* pattern. Therefore, an additional case is added for *-ar,
+# *-ranlib and *-nm.
+#
+# $1 toolchain CROSS
+define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
+	$(Q)cd $(HOST_DIR)/usr/bin; \
+	TOOLCHAIN_CROSS="$(strip $1)" ; \
+	for i in $${TOOLCHAIN_CROSS}*; do \
+		base=$${i##*/}; \
+		case "$$base" in \
+		*-ar|*-ranlib|*-nm) \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			;; \
+		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
+			ln -sf toolchain-wrapper $$base; \
+			;; \
+		*gdb|*gdbtui) \
+			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
+				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			fi \
+			;; \
+		*) \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			;; \
+		esac; \
+	done
 endef
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
-	TOOLCHAIN_EXTERNAL_MOVE
-endif
 
-# Returns the location of the libc.a file for the given compiler + flags
-define toolchain_find_libc_a
-$$(readlink -f $$(LANG=C $(1) -print-file-name=libc.a))
-endef
+# Various utility functions used by the external toolchain package
+# infrastructure. Those functions are mainly responsible for:
+#
+#   - installation the toolchain libraries to $(TARGET_DIR)
+#   - copying the toolchain sysroot to $(STAGING_DIR)
+#   - installing a gdbinit file
+#
+# Details about sysroot directory selection.
+#
+# To find the sysroot directory, we use the trick of looking for the
+# 'libc.a' file with the -print-file-name gcc option, and then
+# mangling the path to find the base directory of the sysroot.
+#
+# Note that we do not use the -print-sysroot option, because it is
+# only available since gcc 4.4.x, and we only recently dropped support
+# for 4.2.x and 4.3.x.
+#
+# When doing this, we don't pass any option to gcc that could select a
+# multilib variant (such as -march) as we want the "main" sysroot,
+# which contains all variants of the C library in the case of multilib
+# toolchains. We use the TARGET_CC_NO_SYSROOT variable, which is the
+# path of the cross-compiler, without the --sysroot=$(STAGING_DIR),
+# since what we want to find is the location of the original toolchain
+# sysroot. This "main" sysroot directory is stored in SYSROOT_DIR.
+#
+# Then, multilib toolchains are a little bit more complicated, since
+# they in fact have multiple sysroots, one for each variant supported
+# by the toolchain. So we need to find the particular sysroot we're
+# interested in.
+#
+# To do so, we ask the compiler where its sysroot is by passing all
+# flags (including -march and al.), except the --sysroot flag since we
+# want to the compiler to tell us where its original sysroot
+# is. ARCH_SUBDIR will contain the subdirectory, in the main
+# SYSROOT_DIR, that corresponds to the selected architecture
+# variant. ARCH_SYSROOT_DIR will contain the full path to this
+# location.
+#
+# One might wonder why we don't just bother with ARCH_SYSROOT_DIR. The
+# fact is that in multilib toolchains, the header files are often only
+# present in the main sysroot, and only the libraries are available in
+# each variant-specific sysroot directory.
 
-# Returns the sysroot location for the given compiler + flags. We need
-# to handle cases where libc.a is in:
+# toolchain_find_sysroot returns the sysroot location for the given
+# compiler + flags. We need to handle cases where libc.a is in:
 #
 #  - lib/
 #  - usr/lib/
@@ -494,92 +279,9 @@ define toolchain_find_libdir
 $$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?([^/]*)?)/([^/]*/)?libc.a:\2:')
 endef
 
-# Checks for an already installed toolchain: check the toolchain
-# location, check that it is usable, and then verify that it
-# matches the configuration provided in Buildroot: ABI, C++ support,
-# kernel headers version, type of C library and all C library features.
-define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
-	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
-	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
-	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
-	$(call check_kernel_headers_version,\
-		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
-		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
-	$(call check_gcc_version,$(TOOLCHAIN_EXTERNAL_CC),\
-		$(call qstrip,$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
-	if test "$(BR2_arm)" = "y" ; then \
-		$(call check_arm_abi,\
-			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
-			$(TOOLCHAIN_EXTERNAL_READELF)) ; \
-	fi ; \
-	if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
-		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
-	fi ; \
-	if test "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
-		$(call check_fortran,$(TOOLCHAIN_EXTERNAL_FC)) ; \
-	fi ; \
-	if test "$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
-		$(call check_uclibc,$${SYSROOT_DIR}) ; \
-	elif test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
-		$(call check_musl,$${SYSROOT_DIR}) ; \
-	else \
-		$(call check_glibc,$${SYSROOT_DIR}) ; \
-	fi
-	$(Q)$(call check_toolchain_ssp,$(TOOLCHAIN_EXTERNAL_CC))
-endef
-
-# With the musl C library, the libc.so library directly plays the role
-# of the dynamic library loader. We just need to create a symbolic
-# link to libc.so with the appropriate name.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-ifeq ($(BR2_i386),y)
-MUSL_ARCH = i386
-else ifeq ($(BR2_ARM_EABIHF),y)
-MUSL_ARCH = armhf
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
-MUSL_ARCH = mipsel-sf
-else ifeq ($(BR2_sh),y)
-MUSL_ARCH = sh
-else
-MUSL_ARCH = $(ARCH)
-endif
-define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
-endef
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-endif
-
-# Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
-# Note: the skeleton package additionally creates lib32->lib or lib64->lib
-# (as appropriate)
-#
-# $1: destination directory (TARGET_DIR / STAGING_DIR)
-# $2: toolchain CC
-# $3: toolchain CFLAGS
-create_lib_symlinks = \
-       $(Q)DESTDIR="$(strip $1)" ; \
-       TOOLCHAIN_CC="$(strip $2)" ; \
-       TOOLCHAIN_CFLAGS="$(strip $3)" ; \
-       ARCH_LIB_DIR="$(call toolchain_find_libdir,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
-       if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
-               ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
-               ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
-       fi
-
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
-       TOOLCHAIN_CC="$(strip $1)" ; \
-       TOOLCHAIN_CFLAGS="$(strip $2)" ; \
-       $(call create_lib_symlinks,$(STAGING_DIR),$${TOOLCHAIN_CC},$${TOOLCHAIN_CFLAGS})
-endef
-
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
-       TOOLCHAIN_CC="$(strip $1)" ; \
-       TOOLCHAIN_CFLAGS="$(strip $2)" ; \
-       $(call create_lib_symlinks,$(TARGET_DIR),$${TOOLCHAIN_CC},$${TOOLCHAIN_CFLAGS})
+# Returns the location of the libc.a file for the given compiler + flags
+define toolchain_find_libc_a
+$$(readlink -f $$(LANG=C $(1) -print-file-name=libc.a))
 endef
 
 # Integration of the toolchain into Buildroot: find the main sysroot
@@ -629,10 +331,6 @@ endef
 #                       our sysroot, and the directory will also be
 #                       considered when searching libraries for copy
 #                       to the target filesystem.
-#
-# Please be very careful to check the major toolchain sources:
-# Buildroot, Crosstool-NG, CodeSourcery and Linaro
-# before doing any modification on the below logic.
 
 # $1: toolchain LIBS
 ifeq ($(BR2_STATIC_LIBS),)
@@ -701,6 +399,88 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
 
+# Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
+# Note: the skeleton package additionally creates lib32->lib or lib64->lib
+# (as appropriate)
+#
+# $1: destination directory (TARGET_DIR / STAGING_DIR)
+# $2: toolchain CC
+# $3: toolchain CFLAGS
+create_lib_symlinks = \
+       $(Q)DESTDIR="$(strip $1)" ; \
+       TOOLCHAIN_CC="$(strip $2)" ; \
+       TOOLCHAIN_CFLAGS="$(strip $3)" ; \
+       ARCH_LIB_DIR="$(call toolchain_find_libdir,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
+       if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
+               ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
+               ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
+       fi
+
+# $1: toolchain CC
+# $2: toolchain CFLAGS
+define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
+       TOOLCHAIN_CC="$(strip $1)" ; \
+       TOOLCHAIN_CFLAGS="$(strip $2)" ; \
+       $(call create_lib_symlinks,$(STAGING_DIR),$${TOOLCHAIN_CC},$${TOOLCHAIN_CFLAGS})
+endef
+
+# $1: toolchain CC
+# $2: toolchain CFLAGS
+define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
+       TOOLCHAIN_CC="$(strip $1)" ; \
+       TOOLCHAIN_CFLAGS="$(strip $2)" ; \
+       $(call create_lib_symlinks,$(TARGET_DIR),$${TOOLCHAIN_CC},$${TOOLCHAIN_CFLAGS})
+endef
+
+#
+# Generate gdbinit file for use with Buildroot
+#
+define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
+	$(Q)if test -f $(TARGET_CROSS)gdb ; then \
+		$(call MESSAGE,"Installing gdbinit"); \
+		$(call gen_gdbinit_file) ; \
+	fi
+endef
+
+# Various utility functions used by the external toolchain based on musl.
+
+# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
+# So, add the musl-compat-headers package that will install those files,
+# into the staging directory:
+#   sys/queue.h:  header from NetBSD
+#   sys/cdefs.h:  minimalist header bundled in Buildroot
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
+endif
+
+# With the musl C library, the libc.so library directly plays the role
+# of the dynamic library loader. We just need to create a symbolic
+# link to libc.so with the appropriate name.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+ifeq ($(BR2_i386),y)
+MUSL_ARCH = i386
+else ifeq ($(BR2_ARM_EABIHF),y)
+MUSL_ARCH = armhf
+else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
+MUSL_ARCH = mipsel-sf
+else ifeq ($(BR2_sh),y)
+MUSL_ARCH = sh
+else
+MUSL_ARCH = $(ARCH)
+endif
+define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
+	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
+endef
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
+endif
+
+#
+# Various functions used by the external toolchain package
+# infrastructure to handle the Blackfin specific
+# BR2_BFIN_INSTALL_FDPIC_SHARED and BR2_BFIN_INSTALL_FLAT_SHARED
+# options.
+#
+
 # Special installation target used on the Blackfin architecture when
 # FDPIC is not the primary binary format being used, but the user has
 # nonetheless requested the installation of the FDPIC libraries to the
@@ -724,6 +504,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
 	fi ; \
 	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
 endef
+
 # $1: toolchain LIBS
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...")
@@ -755,50 +536,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
 endef
 endif
 
-# Build toolchain wrapper for preprocessor, C, C++ and Fortran compilers
-# and setup symlinks for everything else. Skip gdb symlink when we are
-# building our own gdb to prevent two gdb's in output/host/usr/bin.
-# The LTO support in gcc creates wrappers for ar, ranlib and nm which load
-# the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
-# *-gcc-nm and should be used instead of the real programs when -flto is
-# used. However, we should not add the toolchain wrapper for them, and they
-# match the *cc-* pattern. Therefore, an additional case is added for *-ar,
-# *-ranlib and *-nm.
-# $1 toolchain CROSS
-define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
-	$(Q)cd $(HOST_DIR)/usr/bin; \
-	TOOLCHAIN_CROSS="$(strip $1)" ; \
-	for i in $${TOOLCHAIN_CROSS}*; do \
-		base=$${i##*/}; \
-		case "$$base" in \
-		*-ar|*-ranlib|*-nm) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
-			;; \
-		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
-			ln -sf toolchain-wrapper $$base; \
-			;; \
-		*gdb|*gdbtui) \
-			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
-				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
-			fi \
-			;; \
-		*) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
-			;; \
-		esac; \
-	done
-endef
-
-#
-# Generate gdbinit file for use with Buildroot
-#
-define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
-	$(Q)if test -f $(TARGET_CROSS)gdb ; then \
-		$(call MESSAGE,"Installing gdbinit"); \
-		$(gen_gdbinit_file); \
-	fi
-endef
-
 # uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
 # patched specifically for uClibc-ng, so it continues to generate
 # binaries that expect the dynamic loader to be named ld-uClibc.so.0,
@@ -813,28 +550,155 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
 	fi
 endef
 
-TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_WRAPPER_BUILD)
+define inner-toolchain-external-package
+
+$(2)_INSTALL_STAGING = YES
+$(2)_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
-	$(call TOOLCHAIN_WRAPPER_INSTALL)
-	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER,$(TOOLCHAIN_EXTERNAL_CROSS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
+$(2)_DOWNLOAD_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain
+
+# In fact, we don't need to download the toolchain, since it is already
+# available on the system, so force the site and source to be empty so
+# that nothing will be downloaded/extracted.
+ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
+$(2)_SITE =
+$(2)_SOURCE =
+endif
+
+ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
+$(2)_INSTALL_DIR = $$($(2)_DOWNLOAD_INSTALL_DIR)
+else
+$(2)_INSTALL_DIR = $$(call qstrip,$$(BR2_TOOLCHAIN_EXTERNAL_PATH))
+endif
+
+ifeq ($$($(2)_INSTALL_DIR),)
+ifneq ($$($(2)_PREFIX),)
+$(2)_BIN = $$(shell dirname $$(shell which $$($(2)_PREFIX)-gcc))
+endif
+else
+$(2)_BIN = $$($(2)_INSTALL_DIR)/$$($(2)_SUBDIR)/bin
+endif
+
+$(2)_TOOLCHAIN_WRAPPER_ARGS = $$(TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS)
+
+ifeq ($$(filter $$(HOST_DIR)/%,$$($(2)_BIN)),)
+# $(2)_BIN points outside HOST_DIR => absolute path
+$(2)_TOOLCHAIN_WRAPPER_ARGS += \
+	-DBR_CROSS_PATH_ABS='"$$($(2)_BIN)"'
+else
+# $(2)_BIN points inside HOST_DIR => relative path
+$(2)_TOOLCHAIN_WRAPPER_ARGS += \
+	-DBR_CROSS_PATH_REL='"$$($(2)_BIN:$$(HOST_DIR)/%=%)"'
+endif
+
+# If this is a buildroot toolchain, it already has a wrapper which we want to
+# bypass. Since this is only evaluated after it has been extracted, we can use
+# $(wildcard ...) here.
+$(2)_SUFFIX = $$(if $$(wildcard $$($(2)_BIN)/*.br_real),.br_real)
+$(2)_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='"$$($(2)_SUFFIX)"'
+
+$(2)_CROSS = $$($(2)_BIN)/$$($(2)_PREFIX)-
+$(2)_CC = $$($(2)_CROSS)gcc$$($(2)_SUFFIX)
+$(2)_CXX = $$($(2)_CROSS)g++$$($(2)_SUFFIX)
+$(2)_FC = $$($(2)_CROSS)gfortran$$($(2)_SUFFIX)
+$(2)_READELF = $$($(2)_CROSS)readelf$$($(2)_SUFFIX)
+
+$(2)_CFLAGS += $$(TOOLCHAIN_EXTERNAL_CFLAGS)
+$(2)_LIBS += $$(TOOLCHAIN_EXTERNAL_LIBS)
+
+# Normal handling of downloaded toolchain tarball extraction.
+ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
+$(2)_EXCLUDES = usr/lib/locale/*
+
+# As a regular package, the toolchain gets extracted in $(@D), but
+# since it's actually a fairly special package, we need it to be moved
+# into $(2)_DOWNLOAD_INSTALL_DIR.
+define $(2)_MOVE
+	rm -rf $$($(2)_DOWNLOAD_INSTALL_DIR)
+	mkdir -p $$($(2)_DOWNLOAD_INSTALL_DIR)
+	mv $$(@D)/* $$($(2)_DOWNLOAD_INSTALL_DIR)/
 endef
+$(2)_POST_EXTRACT_HOOKS += $(2)_MOVE
+endif
 
+ifndef $(2)_CONFIGURE_CMDS
+# Checks for an already installed toolchain: check the toolchain
+# location, check that it supports sysroot, and then verify that it
+# matches the configuration provided in Buildroot: ABI, C++ support,
+# kernel headers version, type of C library and all C library features.
+define $(2)_CONFIGURE_CMDS
+	$(Q)$$(call check_cross_compiler_exists,$$($(2)_CC))
+	$(Q)$$(call check_unusable_toolchain,$$($(2)_CC))
+	$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$($(2)_CC))" ; \
+	$$(call check_kernel_headers_version,\
+		$$(call toolchain_find_sysroot,$$($(2)_CC)),\
+		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
+	$$(call check_gcc_version,$$($(2)_CC),\
+		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
+	if test "$(BR2_arm)" = "y" ; then \
+		$$(call check_arm_abi,\
+			"$$($(2)_CC) $$($(2)_CFLAGS)",\
+			$$($(2)_READELF)) ; \
+	fi ; \
+	if test "$$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
+		$$(call check_cplusplus,$$($(2)_CXX)) ; \
+	fi ; \
+	if test "$$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
+		$$(call check_fortran,$$($(2)_FC)) ; \
+	fi ; \
+	if test "$$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
+		$$(call check_uclibc,$$$${SYSROOT_DIR}) ; \
+	elif test "$$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
+		$$(call check_musl,$$$${SYSROOT_DIR}) ; \
+	else \
+		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
+	fi
+	$(Q)$$(call check_toolchain_ssp,$$($(2)_CC))
+endef
+endif
+
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	$$(TOOLCHAIN_WRAPPER_BUILD)
+endef
+endif
+
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	$$(call TOOLCHAIN_WRAPPER_INSTALL)
+	$$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$$($(2)_CC),$$($(2)_CFLAGS))
+	$$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,$$($(2)_CC),$$($(2)_CFLAGS))
+	$$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC,$$($(2)_CC),$$($(2)_CFLAGS))
+	$$(call TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER,$$($(2)_CROSS))
+	$$(call TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
+endef
+endif
+
+ifndef $(2)_INSTALL_TARGET_CMDS
 # Even though we're installing things in both the staging, the host
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
-	$(call TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS,$(TOOLCHAIN_EXTERNAL_LIBS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS),$(TOOLCHAIN_EXTERNAL_INSTALL_DIR))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_LIBS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(call TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
+define $(2)_INSTALL_TARGET_CMDS
+	$$(call TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK,$$($(2)_CC),$$($(2)_CFLAGS))
+	$$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS,$$($(2)_LIBS))
+	$$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER,$$($(2)_CC),$$($(2)_CFLAGS),$$($(2)_INSTALL_DIR))
+	$$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC,$$($(2)_LIBS))
+	$$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT,$$($(2)_CC),$$($(2)_CFLAGS))
+	$$(call TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
 endef
 
-$(eval $(generic-package))
+toolchain-external-package = $(call inner-toolchain-external-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
 
+# Expose TOOLCHAIN_EXTERNAL_PREFIX as a global variable that can be
+# used by the rest of Buildroot.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+TOOLCHAIN_EXTERNAL_PREFIX = \
+	$($(call UPPERCASE,$(call qstrip,$(BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL)))_PREFIX)
+endif
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
deleted file mode 100644
index 41c2ab3..0000000
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ /dev/null
@@ -1,67 +0,0 @@
-######################################
-# Next hashes are all locally computed
-
-# Blackfin toolchains from Analog Devices
-sha256 e424e90d8481d942a40266d78d1488726561fed3ec38403094f98055e61889d0  blackfin-toolchain-2014R1-RC2.i386.tar.bz2
-sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
-
-# Mentor's Sourcery CodeBench Lite toolchains
-# ARM
-sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2
-# NiosII
-sha256 750639290744adda931c81fa2cd2ffc2bde972488047824dcfaa53c42562191d  sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 3dc1c2685c0472059547dd7becb5dc991541b8176af39fa7aa5f601d38b9879a  sourceryg++-2016.05-10-nios2-linux-gnu.src.tar.bz2
-# SuperH
-sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 e2e58c10e52395d5d35157e35f85233f713c6f9223a652dfc56194cfd2eed004  renesas-2012.09-61-sh-linux-gnu.src.tar.bz2
-# x86
-sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
-sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-2012.09-62-i686-pc-linux-gnu.src.tar.bz2
-# AMD64
-sha256 3c31206c8b9277f409ee00e4777ba82dfa6da2a4ca0926501cd5fb6bbd1b407e  amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 0b673f5035f97d5d03c31272cddab0f117d39ad76a5ad2a3bc98c156571527de  amd-2015.11-139-x86_64-amd-linux-gnu.src.tar.bz2
-# Aarch64
-sha256 405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 3f50dd6ee433eb5b6992a1071b988e50379a738f54f58722bc60081613764716  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu.src.tar.bz2
-# MIPS
-sha256 d354447c4c5160439dafd5464fa3a0266dd41e79f973477238e4f0215a6b5397  mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 2658e55d5b71bba25d6f77e868e18b200ea5f75c8add7ed3a9266e716d9adfff  mips-2016.05-8-mips-linux-gnu.src.tar.bz2
-
-# ARM toolchains from Texas Instrument's Arago project
-# There is one source file that covers both binary distributions.
-sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
-sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
-sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
-
-# ARM and Aarch64 toolchains from Linaro
-sha256 f1421c580ce977226f4fefc9c409b3b423260cc65a6e9dc6da88bb3478a521a0  gcc-linaro-5.3.1-2016.05-i686_arm-linux-gnueabihf.tar.xz
-sha256 987941c9fffdf56ffcbe90e8984673c16648c477b537fcf43add22fa62f161cd  gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz
-sha256 f6e9c0d3320760fe8f89e9ec3acdd7b4da7eff889c094b4a2acc286fd46f334f  gcc-linaro-5.3.1-2016.05-i686_armeb-linux-gnueabihf.tar.xz
-sha256 6cf41c8944be56279cc14992aa075174b7a4c5938502536266eaaeef048f9440  gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
-sha256 d43227248f282a652da42322fcf4abfd3021f2a2f62e0cf6e242d82f55966ba9  gcc-linaro-5.3.1-2016.05-i686_aarch64-linux-gnu.tar.xz
-sha256 1941dcf6229d6706bcb89b7976d5d43d170efdd17c27d5fe1738e7ecf22adc37  gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu.tar.xz
-
-# Codescape toolchains from Imagination Technologies
-# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
-sha256 e3c1f292ac6a9f12480af431c85a7ed9dfa011a52fd62a50be3363ec6b9bc872  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
-sha256 10b8ab6d7c492abc19ecabafedc6bc5f12ff88107a3cb76dc452b3a9522d9c56  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
-
-# Synopsys DesignWare ARC toolchains
-sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
-sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
-sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
-sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
-
-# Prebuilt musl toolchains from musl-cross
-sha256 e32c23d0b83639fc10ad06666ec086b66453b9be44415fe1a818c3c3b526dfb1  crossx86-armeb-linux-musleabi-1.1.12.tar.xz
-sha256 eb81bd5d6ada454c6e854b18bfa8dc801333782152166f6cab9fb7cd11692987  crossx86-arm-linux-musleabi-1.1.12.tar.xz
-sha256 a050da284ff22d291ae71dfc249ebdedb18334b8d626804760ce7d5963e392e6  crossx86-arm-linux-musleabihf-1.1.12.tar.xz
-sha256 18d07f5c8f4cfe373461cf21cf7b1bfefa820a37e96a69b68e0f315d528b4286  crossx86-i486-linux-musl-1.1.12.tar.xz
-sha256 1c1480c2618097e402fe804c1431fbd49b0d43520af81d4c1a695a2fa13a3922  crossx86-mipsel-linux-musl-1.1.12.tar.xz
-sha256 f0a8b3eb0566138ab3cc77bc09648be15bc325da974ec98b9e67f2fb82be3295  crossx86-mipsel-sf-linux-musl-1.1.12.tar.xz
-sha256 6a99989c3dff56776981f6760b2c54dcb9e4032be1d649968bb06c04f2e64177  crossx86-mips-linux-musl-1.1.12.tar.xz
-sha256 c082adc3e8b0750bb22ca82628524fd525fd77f534517ac5a66e7ac5a297ee6e  crossx86-powerpc-linux-musl-1.1.12.tar.xz
-sha256 8c6c9ebb54040e47947b4d3af6823d01fef2bb6ee81b18903c801030c066092b  crossx86-sh4eb-linux-musl-1.1.12.tar.xz
-sha256 ae9a0a5a60226aa086a56628cfd5c1d283c9dffdca37891d7e6adc2bd21ac2e0  crossx86-sh4-linux-musl-1.1.12.tar.xz
-sha256 27e0ea1043a58aebeadf1dacd67e47fd0b5c19fc36f42c9374e5fa3308df09c6  crossx86-x86_64-linux-musl-1.1.12.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 16d0094..5aae913 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -4,837 +4,8 @@
 #
 ################################################################################
 
-#
-# This package implements the support for external toolchains, i.e
-# toolchains that are available pre-built, ready to use. Such toolchain
-# may either be readily available on the Web (Linaro, Sourcery
-# CodeBench, from processor vendors) or may be built with tools like
-# Crosstool-NG or Buildroot itself. So far, we have tested this
-# with:
-#
-#  * Toolchains generated by Crosstool-NG
-#  * Toolchains generated by Buildroot
-#  * Toolchains provided by Linaro for the ARM and AArch64
-#    architectures
-#  * Sourcery CodeBench toolchains (from Mentor Graphics) for the ARM,
-#    MIPS, PowerPC, x86, x86_64 and NIOS 2 architectures. For the MIPS
-#    toolchain, the -muclibc variant isn't supported yet, only the
-#    default glibc-based variant is.
-#  * Analog Devices toolchains for the Blackfin architecture
-#  * Xilinx toolchains for the Microblaze architecture
-#  * Synopsys DesignWare toolchains for ARC cores
-#
-# The basic principle is the following
-#
-#  1. If the toolchain is not pre-installed, download and extract it
-#  in $(TOOLCHAIN_EXTERNAL_INSTALL_DIR). Otherwise,
-#  $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) points to were the toolchain has
-#  already been installed by the user.
-#
-#  2. For all external toolchains, perform some checks on the
-#  conformity between the toolchain configuration described in the
-#  Buildroot menuconfig system, and the real configuration of the
-#  external toolchain. This is for example important to make sure that
-#  the Buildroot configuration system knows whether the toolchain
-#  supports RPC, IPv6, locales, large files, etc. Unfortunately, these
-#  things cannot be detected automatically, since the value of these
-#  options (such as BR2_TOOLCHAIN_HAS_NATIVE_RPC) are needed at
-#  configuration time because these options are used as dependencies
-#  for other options. And at configuration time, we are not able to
-#  retrieve the external toolchain configuration.
-#
-#  3. Copy the libraries needed at runtime to the target directory,
-#  $(TARGET_DIR). Obviously, things such as the C library, the dynamic
-#  loader and a few other utility libraries are needed if dynamic
-#  applications are to be executed on the target system.
-#
-#  4. Copy the libraries and headers to the staging directory. This
-#  will allow all further calls to gcc to be made using --sysroot
-#  $(STAGING_DIR), which greatly simplifies the compilation of the
-#  packages when using external toolchains. So in the end, only the
-#  cross-compiler binaries remains external, all libraries and headers
-#  are imported into the Buildroot tree.
-#
-#  5. Build a toolchain wrapper which executes the external toolchain
-#  with a number of arguments (sysroot/march/mtune/..) hardcoded,
-#  so we're sure the correct configuration is always used and the
-#  toolchain behaves similar to an internal toolchain.
-#  This toolchain wrapper and symlinks are installed into
-#  $(HOST_DIR)/usr/bin like for the internal toolchains, and the rest
-#  of Buildroot is handled identical for the 2 toolchain types.
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
-TOOLCHAIN_EXTERNAL_LIBS += ld-linux-armhf.so.*
-else
-TOOLCHAIN_EXTERNAL_LIBS += ld*.so.*
-endif
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-TOOLCHAIN_EXTERNAL_LIBS += libpthread.so.*
-ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
-TOOLCHAIN_EXTERNAL_LIBS += libthread_db.so.*
-endif # gdbserver
-endif # ! no threads
-endif
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
-TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.* libmvec.so.*
-endif
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-TOOLCHAIN_EXTERNAL_LIBS += libc.so libgcc_s.so.*
-endif
-
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-TOOLCHAIN_EXTERNAL_LIBS += libstdc++.so.*
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
-TOOLCHAIN_EXTERNAL_LIBS += libgfortran.so.*
-# fortran needs quadmath on x86 and x86_64
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBQUADMATH),y)
-TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
-endif
-endif
-
-TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
-
-# Details about sysroot directory selection.
-#
-# To find the sysroot directory, we use the trick of looking for the
-# 'libc.a' file with the -print-file-name gcc option, and then
-# mangling the path to find the base directory of the sysroot.
-#
-# Note that we do not use the -print-sysroot option, because it is
-# only available since gcc 4.4.x, and we only recently dropped support
-# for 4.2.x and 4.3.x.
-#
-# When doing this, we don't pass any option to gcc that could select a
-# multilib variant (such as -march) as we want the "main" sysroot,
-# which contains all variants of the C library in the case of multilib
-# toolchains. We use the TARGET_CC_NO_SYSROOT variable, which is the
-# path of the cross-compiler, without the --sysroot=$(STAGING_DIR),
-# since what we want to find is the location of the original toolchain
-# sysroot. This "main" sysroot directory is stored in SYSROOT_DIR.
-#
-# Then, multilib toolchains are a little bit more complicated, since
-# they in fact have multiple sysroots, one for each variant supported
-# by the toolchain. So we need to find the particular sysroot we're
-# interested in.
-#
-# To do so, we ask the compiler where its sysroot is by passing all
-# flags (including -march and al.), except the --sysroot flag since we
-# want to the compiler to tell us where its original sysroot
-# is. ARCH_SUBDIR will contain the subdirectory, in the main
-# SYSROOT_DIR, that corresponds to the selected architecture
-# variant. ARCH_SYSROOT_DIR will contain the full path to this
-# location.
-#
-# One might wonder why we don't just bother with ARCH_SYSROOT_DIR. The
-# fact is that in multilib toolchains, the header files are often only
-# present in the main sysroot, and only the libraries are available in
-# each variant-specific sysroot directory.
-
-
-TOOLCHAIN_EXTERNAL_PREFIX = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
-TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
-else
-TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
-endif
-
-ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
-ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
-# if no path set, figure it out from path
-TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
-endif
-else
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
-TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
-else
-TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
-endif
-endif
-
-# If this is a buildroot toolchain, it already has a wrapper which we want to
-# bypass. Since this is only evaluated after it has been extracted, we can use
-# $(wildcard ...) here.
-TOOLCHAIN_EXTERNAL_SUFFIX = \
-	$(if $(wildcard $(TOOLCHAIN_EXTERNAL_BIN)/*.br_real),.br_real)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
-	-DBR_CROSS_PATH_SUFFIX='"$(TOOLCHAIN_EXTERNAL_SUFFIX)"'
-
-TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
-TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc$(TOOLCHAIN_EXTERNAL_SUFFIX)
-TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFFIX)
-TOOLCHAIN_EXTERNAL_FC = $(TOOLCHAIN_EXTERNAL_CROSS)gfortran$(TOOLCHAIN_EXTERNAL_SUFFIX)
-TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf$(TOOLCHAIN_EXTERNAL_SUFFIX)
-
-ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
-# TOOLCHAIN_EXTERNAL_BIN points outside HOST_DIR => absolute path
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
-	-DBR_CROSS_PATH_ABS='"$(TOOLCHAIN_EXTERNAL_BIN)"'
-else
-# TOOLCHAIN_EXTERNAL_BIN points inside HOST_DIR => relative path
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
-	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
-endif
-
-ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
-CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU))
-else
-CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
-endif
-CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
-CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
-CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
-CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
-CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
-
-# march/mtune/floating point mode needs to be passed to the external toolchain
-# to select the right multilib variant
-ifeq ($(BR2_x86_64),y)
-TOOLCHAIN_EXTERNAL_CFLAGS += -m64
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_64
-endif
-ifneq ($(CC_TARGET_ARCH_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -march=$(CC_TARGET_ARCH_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
-endif
-ifneq ($(CC_TARGET_CPU_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
-endif
-ifneq ($(CC_TARGET_ABI_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
-endif
-ifneq ($(CC_TARGET_FPU_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
-endif
-ifneq ($(CC_TARGET_FLOAT_ABI_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(CC_TARGET_FLOAT_ABI_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
-endif
-ifneq ($(CC_TARGET_MODE_),)
-TOOLCHAIN_EXTERNAL_CFLAGS += -m$(CC_TARGET_MODE_)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
-endif
-ifeq ($(BR2_BINFMT_FLAT),y)
-TOOLCHAIN_EXTERNAL_CFLAGS += -Wl,-elf2flt
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_BINFMT_FLAT
-endif
-ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
-TOOLCHAIN_EXTERNAL_CFLAGS += -EL
-endif
-ifeq ($(BR2_mips)$(BR2_mips64),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
-TOOLCHAIN_EXTERNAL_CFLAGS += -EB
-endif
-ifeq ($(BR2_arceb),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARC_TARGET_BIG_ENDIAN
-TOOLCHAIN_EXTERNAL_CFLAGS += -EB
-endif
-
-TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
-
-ifeq ($(BR2_SOFT_FLOAT),y)
-TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
-endif
-
-# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
-# So, add the musl-compat-headers package that will install those files,
-# into the staging directory:
-#   sys/queue.h:  header from NetBSD
-#   sys/cdefs.h:  minimalist header bundled in Buildroot
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
-endif
-
-# The Codescape toolchain uses a sysroot layout that places them
-# side-by-side instead of nested like multilibs. A symlink is needed
-# much like for the nested sysroots which are handled in
-# copy_toolchain_sysroot but there is not enough information in there
-# to determine whether the sysroot layout was nested or side-by-side.
-# Add the symlink here for now.
-define TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
-	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))"; \
-	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
-	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
-endef
-
-# Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
-# sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
-# -> sbin-<abi> so that the rest of Buildroot can find the toolchain
-# tools in the appropriate location.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
-ifeq ($(BR2_MIPS_OABI32),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX = o32
-else ifeq ($(BR2_MIPS_NABI32),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX = n32
-else ifeq ($(BR2_MIPS_NABI64),y)
-TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX = n64
-endif
-
-define TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
-	rmdir $(STAGING_DIR)/usr/bin $(STAGING_DIR)/usr/sbin
-	ln -sf bin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/bin
-	ln -sf sbin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/sbin
-endef
-endif
-
-# Special handling for Blackfin toolchain, because of the split in two
-# tarballs, and the organization of tarball contents. The tarballs
-# contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
-# which themselves contain the toolchain. This is why we strip more
-# components than usual.
-define TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
-	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
-		$(TAR) --strip-components=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
-endef
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
-TOOLCHAIN_EXTERNAL_SOURCE = arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A),y)
-TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
-TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
-TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
-define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
-	rm -rf $(@D)/arago-2011.09/
-endef
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE),y)
-TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
-TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
-TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
-define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
-	rm -rf $(@D)/arago-2011.09/
-endef
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/arm-linux-gnueabihf
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-i686_arm-linux-gnueabihf.tar.xz
-else
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz
-endif
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/armeb-linux-gnueabihf
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-i686_armeb-linux-gnueabihf.tar.xz
-else
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
-endif
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
-TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_STAGING_FIXUPS
-TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
-TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
-TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 3
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/aarch64-linux-gnu
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-i686_aarch64-linux-gnu.tar.xz
-else
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu.tar.xz
-endif
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-amd-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
-	ln -sf ld-2.20.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
-endef
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
-define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
-	ln -sf ld-2.20.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
-endef
-TOOLCHAIN_EXTERNAL_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
-TOOLCHAIN_EXTERNAL_VERSION = 1.1.12
-TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
-ifeq ($(BR2_arm)$(BR2_ARM_EABI),yy)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_arm)$(BR2_ARM_EABIHF),yy)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabihf-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_armeb),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_i386),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_mips),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_powerpc),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_sh4),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-sh4-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_sh4eb),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-sh4eb-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_x86_64),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-endif
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC),y)
-TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
-ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE = arc700
-else
-TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE = archs
-endif
-ifeq ($(BR2_arcle),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = le
-else
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = be
-endif
-TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE)_linux_install.tar.gz
-else
-# Custom toolchain
-TOOLCHAIN_EXTERNAL_SITE = $(patsubst %/,%,$(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL))))
-TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-# We can't check hashes for custom downloaded toolchains
-BR_NO_CHECK_HASH_FOR += $(TOOLCHAIN_EXTERNAL_SOURCE)
-endif
-
-# Some toolchain vendors have a regular file naming pattern.
-# For them, mass-define _ACTUAL_SOURCE_TARBALL based _SITE.
-ifneq ($(findstring sourcery.mentor.com/public/gnu_toolchain,$(TOOLCHAIN_EXTERNAL_SITE)),)
-TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= \
-	$(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))
-endif
-
-# In fact, we don't need to download the toolchain, since it is already
-# available on the system, so force the site and source to be empty so
-# that nothing will be downloaded/extracted.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
-TOOLCHAIN_EXTERNAL_SITE =
-TOOLCHAIN_EXTERNAL_SOURCE =
-endif
-
 TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
-
-# Normal handling of downloaded toolchain tarball extraction.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*
-
-# As a regular package, the toolchain gets extracted in $(@D), but
-# since it's actually a fairly special package, we need it to be moved
-# into TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR.
-define TOOLCHAIN_EXTERNAL_MOVE
-	rm -rf $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
-	mkdir -p $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
-	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/
-endef
-TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
-	TOOLCHAIN_EXTERNAL_MOVE
-endif
-
-# Returns the location of the libc.a file for the given compiler + flags
-define toolchain_find_libc_a
-$$(readlink -f $$(LANG=C $(1) -print-file-name=libc.a))
-endef
-
-# Returns the sysroot location for the given compiler + flags. We need
-# to handle cases where libc.a is in:
-#
-#  - lib/
-#  - usr/lib/
-#  - lib32/
-#  - lib64/
-#  - lib32-fp/ (Cavium toolchain)
-#  - lib64-fp/ (Cavium toolchain)
-#  - usr/lib/<tuple>/ (Linaro toolchain)
-#
-# And variations on these.
-define toolchain_find_sysroot
-$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
-endef
-
-# Returns the lib subdirectory for the given compiler + flags (i.e
-# typically lib32 or lib64 for some toolchains)
-define toolchain_find_libdir
-$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?([^/]*)?)/([^/]*/)?libc.a:\2:')
-endef
-
-# Checks for an already installed toolchain: check the toolchain
-# location, check that it is usable, and then verify that it
-# matches the configuration provided in Buildroot: ABI, C++ support,
-# kernel headers version, type of C library and all C library features.
-define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
-	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
-	$(Q)$(call check_unusable_toolchain,$(TOOLCHAIN_EXTERNAL_CC))
-	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
-	$(call check_kernel_headers_version,\
-		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
-		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
-	$(call check_gcc_version,$(TOOLCHAIN_EXTERNAL_CC),\
-		$(call qstrip,$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
-	if test "$(BR2_arm)" = "y" ; then \
-		$(call check_arm_abi,\
-			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
-			$(TOOLCHAIN_EXTERNAL_READELF)) ; \
-	fi ; \
-	if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
-		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
-	fi ; \
-	if test "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
-		$(call check_fortran,$(TOOLCHAIN_EXTERNAL_FC)) ; \
-	fi ; \
-	if test "$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
-		$(call check_uclibc,$${SYSROOT_DIR}) ; \
-	elif test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
-		$(call check_musl,$${SYSROOT_DIR}) ; \
-	else \
-		$(call check_glibc,$${SYSROOT_DIR}) ; \
-	fi
-	$(Q)$(call check_toolchain_ssp,$(TOOLCHAIN_EXTERNAL_CC))
-endef
-
-# With the musl C library, the libc.so library directly plays the role
-# of the dynamic library loader. We just need to create a symbolic
-# link to libc.so with the appropriate name.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-ifeq ($(BR2_i386),y)
-MUSL_ARCH = i386
-else ifeq ($(BR2_ARM_EABIHF),y)
-MUSL_ARCH = armhf
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
-MUSL_ARCH = mipsel-sf
-else ifeq ($(BR2_sh),y)
-MUSL_ARCH = sh
-else
-MUSL_ARCH = $(ARCH)
-endif
-define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
-endef
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-endif
-
-# Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
-# Note: the skeleton package additionally creates lib32->lib or lib64->lib
-# (as appropriate)
-#
-# $1: destination directory (TARGET_DIR / STAGING_DIR)
-# $2: toolchain CC
-# $3: toolchain CFLAGS
-create_lib_symlinks = \
-       $(Q)DESTDIR="$(strip $1)" ; \
-       TOOLCHAIN_CC="$(strip $2)" ; \
-       TOOLCHAIN_CFLAGS="$(strip $3)" ; \
-       ARCH_LIB_DIR="$(call toolchain_find_libdir,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
-       if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
-               ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
-               ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
-       fi
-
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
-       TOOLCHAIN_CC="$(strip $1)" ; \
-       TOOLCHAIN_CFLAGS="$(strip $2)" ; \
-       $(call create_lib_symlinks,$(STAGING_DIR),$${TOOLCHAIN_CC},$${TOOLCHAIN_CFLAGS})
-endef
-
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
-       TOOLCHAIN_CC="$(strip $1)" ; \
-       TOOLCHAIN_CFLAGS="$(strip $2)" ; \
-       $(call create_lib_symlinks,$(TARGET_DIR),$${TOOLCHAIN_CC},$${TOOLCHAIN_CFLAGS})
-endef
-
-# Integration of the toolchain into Buildroot: find the main sysroot
-# and the variant-specific sysroot, then copy the needed libraries to
-# the $(TARGET_DIR) and copy the whole sysroot (libraries and headers)
-# to $(STAGING_DIR).
-#
-# Variables are defined as follows:
-#
-#  LIBC_A_LOCATION:     location of the libc.a file in the default
-#                       multilib variant (allows to find the main
-#                       sysroot directory)
-#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/usr/lib/libc.a
-#
-#  SYSROOT_DIR:         the main sysroot directory, deduced from
-#                       LIBC_A_LOCATION by removing the
-#                       usr/lib[32|64]/libc.a part of the path.
-#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/
-#
-# ARCH_LIBC_A_LOCATION: location of the libc.a file in the selected
-#                       multilib variant (taking into account the
-#                       CFLAGS). Allows to find the sysroot of the
-#                       selected multilib variant.
-#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/mips16/soft-float/el/usr/lib/libc.a
-#
-# ARCH_SYSROOT_DIR:     the sysroot of the selected multilib variant,
-#                       deduced from ARCH_LIBC_A_LOCATION by removing
-#                       usr/lib[32|64]/libc.a at the end of the path.
-#                       Ex: /x-tools/mips-2011.03/mips-linux-gnu/libc/mips16/soft-float/el/
-#
-# ARCH_LIB_DIR:         'lib', 'lib32' or 'lib64' depending on where libraries
-#                       are stored. Deduced from ARCH_LIBC_A_LOCATION by
-#                       looking at usr/lib??/libc.a.
-#                       Ex: lib
-#
-# ARCH_SUBDIR:          the relative location of the sysroot of the selected
-#                       multilib variant compared to the main sysroot.
-#			Ex: mips16/soft-float/el
-#
-# SUPPORT_LIB_DIR:      some toolchains, such as recent Linaro toolchains,
-#                       store GCC support libraries (libstdc++,
-#                       libgcc_s, etc.) outside of the sysroot. In
-#                       this case, SUPPORT_LIB_DIR is set to a
-#                       non-empty value, and points to the directory
-#                       where these support libraries are
-#                       available. Those libraries will be copied to
-#                       our sysroot, and the directory will also be
-#                       considered when searching libraries for copy
-#                       to the target filesystem.
-#
-# Please be very careful to check the major toolchain sources:
-# Buildroot, Crosstool-NG, CodeSourcery and Linaro
-# before doing any modification on the below logic.
-
-# $1: toolchain LIBS
-ifeq ($(BR2_STATIC_LIBS),)
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
-	$(Q)$(call MESSAGE,"Copying external toolchain libraries to target...")
-	$(Q)TOOLCHAIN_LIBS="$(strip $1)" ; \
-	for libs in $${TOOLCHAIN_LIBS}; do \
-		$(call copy_toolchain_lib_root,$$libs); \
-	done
-endef
-endif
-
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-# $3: toolchain INSTALL_DIR
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),y)
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER
-	$(Q)$(call MESSAGE,"Copying gdbserver")
-	$(Q)TOOLCHAIN_CC="$(strip $1)" ; \
-	TOOLCHAIN_CFLAGS="$(strip $2)" ; \
-	TOOLCHAIN_INSTALL_DIR="$(strip $3)" ; \
-	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
-	ARCH_LIB_DIR="$(call toolchain_find_libdir,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
-	gdbserver_found=0 ; \
-	for d in $${ARCH_SYSROOT_DIR}/usr \
-		 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
-		 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
-		 $${TOOLCHAIN_INSTALL_DIR}; do \
-		if test -f $${d}/bin/gdbserver ; then \
-			install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
-			gdbserver_found=1 ; \
-			break ; \
-		fi ; \
-	done ; \
-	if [ $${gdbserver_found} -eq 0 ] ; then \
-		echo "Could not find gdbserver in external toolchain" ; \
-		exit 1 ; \
-	fi
-endef
-endif
-
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
-	$(Q)TOOLCHAIN_CC="$(strip $1)" ; \
-	TOOLCHAIN_CFLAGS="$(strip $2)" ; \
-	SYSROOT_DIR="$(call toolchain_find_sysroot,$${TOOLCHAIN_CC})" ; \
-	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
-	ARCH_LIB_DIR="$(call toolchain_find_libdir,$${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS})" ; \
-	SUPPORT_LIB_DIR="" ; \
-	if test `find $${ARCH_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-		LIBSTDCPP_A_LOCATION=$$(LANG=C $${TOOLCHAIN_CC} $${TOOLCHAIN_CFLAGS} -print-file-name=libstdc++.a) ; \
-		if [ -e "$${LIBSTDCPP_A_LOCATION}" ]; then \
-			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
-		fi ; \
-	fi ; \
-	if [ "$${SYSROOT_DIR}" == "$${ARCH_SYSROOT_DIR}" ] ; then \
-		ARCH_SUBDIR="" ; \
-	elif [ "`dirname $${ARCH_SYSROOT_DIR}`" = "`dirname $${SYSROOT_DIR}`" ] ; then \
-		SYSROOT_DIR_DIRNAME=`dirname $${SYSROOT_DIR}`/ ; \
-		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR_DIRNAME}(.*)/$$:\1:"` ; \
-	else \
-		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
-	fi ; \
-	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
-	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
-endef
-
-# Special installation target used on the Blackfin architecture when
-# FDPIC is not the primary binary format being used, but the user has
-# nonetheless requested the installation of the FDPIC libraries to the
-# target filesystem.
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
-define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
-	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to staging...")
-	$(Q)TOOLCHAIN_CC="$(strip $1)" ; \
-	TOOLCHAIN_CFLAGS="$(strip $2)" ; \
-	FDPIC_EXTERNAL_CC=$(dir $${TOOLCHAIN_CC})/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
-	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $${TOOLCHAIN_CFLAGS})" ; \
-	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $${TOOLCHAIN_CFLAGS})" ; \
-	FDPIC_SUPPORT_LIB_DIR="" ; \
-	if test `find $${FDPIC_SYSROOT_DIR} -name 'libstdc++.a' | wc -l` -eq 0 ; then \
-	        FDPIC_LIBSTDCPP_A_LOCATION=$$(LANG=C $${FDPIC_EXTERNAL_CC} $${TOOLCHAIN_CFLAGS} -print-file-name=libstdc++.a) ; \
-	        if [ -e "$${FDPIC_LIBSTDCPP_A_LOCATION}" ]; then \
-	                FDPIC_SUPPORT_LIB_DIR=`readlink -f $${FDPIC_LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
-	        fi ; \
-	fi ; \
-	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
-endef
-# $1: toolchain LIBS
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC
-	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...")
-	$(Q)TOOLCHAIN_LIBS="$(strip $1)" ; \
-	for libs in $${TOOLCHAIN_LIBS}; do \
-		$(call copy_toolchain_lib_root,$$libs); \
-	done
-endef
-endif
-
-# Special installation target used on the Blackfin architecture when
-# shared FLAT is not the primary format being used, but the user has
-# nonetheless requested the installation of the shared FLAT libraries
-# to the target filesystem. The flat libraries are found and linked
-# according to the index in name "libN.so". Index 1 is reserved for
-# the standard C library. Customer libraries can use 4 and above.
-# $1: toolchain CC
-# $2: toolchain CFLAGS
-ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
-	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...")
-	$(Q)TOOLCHAIN_CC="$(strip $1)" ; \
-	TOOLCHAIN_CFLAGS="$(strip $2)" ; \
-	FLAT_EXTERNAL_CC=$(dir $${TOOLCHAIN_CC})../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
-	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $${TOOLCHAIN_CFLAGS} -mid-shared-library -print-file-name=libc`; \
-	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
-	        $(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
-	fi
-endef
-endif
-
-# Build toolchain wrapper for preprocessor, C, C++ and Fortran compilers
-# and setup symlinks for everything else. Skip gdb symlink when we are
-# building our own gdb to prevent two gdb's in output/host/usr/bin.
-# The LTO support in gcc creates wrappers for ar, ranlib and nm which load
-# the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
-# *-gcc-nm and should be used instead of the real programs when -flto is
-# used. However, we should not add the toolchain wrapper for them, and they
-# match the *cc-* pattern. Therefore, an additional case is added for *-ar,
-# *-ranlib and *-nm.
-# $1 toolchain CROSS
-define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
-	$(Q)cd $(HOST_DIR)/usr/bin; \
-	TOOLCHAIN_CROSS="$(strip $1)" ; \
-	for i in $${TOOLCHAIN_CROSS}*; do \
-		base=$${i##*/}; \
-		case "$$base" in \
-		*-ar|*-ranlib|*-nm) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
-			;; \
-		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
-			ln -sf toolchain-wrapper $$base; \
-			;; \
-		*gdb|*gdbtui) \
-			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
-				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
-			fi \
-			;; \
-		*) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
-			;; \
-		esac; \
-	done
-endef
-
-#
-# Generate gdbinit file for use with Buildroot
-#
-define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
-	$(Q)if test -f $(TARGET_CROSS)gdb ; then \
-		$(call MESSAGE,"Installing gdbinit"); \
-		$(gen_gdbinit_file); \
-	fi
-endef
-
-# uClibc-ng dynamic loader is called ld-uClibc.so.1, but gcc is not
-# patched specifically for uClibc-ng, so it continues to generate
-# binaries that expect the dynamic loader to be named ld-uClibc.so.0,
-# like with the original uClibc. Therefore, we create an additional
-# symbolic link to make uClibc-ng systems work properly.
-define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
-	$(Q)if test -e $(TARGET_DIR)/lib/ld-uClibc.so.1; then \
-		ln -sf ld-uClibc.so.1 $(TARGET_DIR)/lib/ld-uClibc.so.0 ; \
-	fi
-	$(Q)if test -e $(TARGET_DIR)/lib/ld64-uClibc.so.1; then \
-		ln -sf ld64-uClibc.so.1 $(TARGET_DIR)/lib/ld64-uClibc.so.0 ; \
-	fi
-endef
-
-TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_WRAPPER_BUILD)
-
-define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
-	$(call TOOLCHAIN_WRAPPER_INSTALL)
-	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER,$(TOOLCHAIN_EXTERNAL_CROSS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
-endef
-
-# Even though we're installing things in both the staging, the host
-# and the target directory, we do everything within the
-# install-staging step, arbitrarily.
-define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
-	$(call TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS,$(TOOLCHAIN_EXTERNAL_LIBS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS),$(TOOLCHAIN_EXTERNAL_INSTALL_DIR))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_LIBS))
-	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(call TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
-endef
-
-$(eval $(generic-package))
+$(eval $(virtual-package))
 
+-include toolchain/toolchain-external/*/*.mk
-- 
2.5.5
