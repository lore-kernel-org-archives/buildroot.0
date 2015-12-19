From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Dec 2015 19:14:41 +0100
Subject: [Buildroot] [PATCH 2/7] toolchain-external: CodeSourcery PowerPC:
	support only one version
In-Reply-To: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
References: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1450548886-21937-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See the conclusion about external toolchains during the Buildroot
meeting [1]:
"In the future, we stick to a single external toolchain version. The
Kconfig symbol should not encode the version (avoid legacy handling)"

[1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report

Remove old CS toolchain handling in pixman and liquid-dsp.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/liquid-dsp/Config.in                       |  5 --
 package/pixman/pixman.mk                           |  5 --
 toolchain/toolchain-external/Config.in             | 72 +---------------------
 .../toolchain-external/toolchain-external.hash     |  2 -
 toolchain/toolchain-external/toolchain-external.mk |  8 +--
 5 files changed, 3 insertions(+), 89 deletions(-)

diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
index 39cd342..95233da 100644
--- a/package/liquid-dsp/Config.in
+++ b/package/liquid-dsp/Config.in
@@ -1,15 +1,10 @@
 comment "liquid-dsp requires a (e)glibc/musl toolchain w/ dynamic library"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIQUID_DSP
 	bool "liquid-dsp"
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_STATIC_LIBS
-	# These result in internal compiler error
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	help
 	  Liquid-DSP is a free and open-source signal processing
 	  library for software-defined radios written in C.  Its
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index e1b7c2d..29b01ee 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -32,10 +32,5 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 PIXMAN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DPIXMAN_NO_TLS"
 endif
 
-# Altivec detection isn't reliable for CS toolchains
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103)$(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
-PIXMAN_CONF_OPTS += --disable-vmx
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a8f19aa..2f60fe0 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -284,7 +284,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	  from Mentor Graphics. It uses gcc 5.2, binutils 2.25.51,
 	  glibc 2.22, gdb 7.10.50 and kernel headers 4.2.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	bool "Sourcery CodeBench PowerPC 2012.03"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_SPE
@@ -303,72 +303,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
 	  support for the following variants:
 	    - e500v2 glibc, SPE, 32 bits
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
-	bool "Sourcery CodeBench PowerPC 2011.03"
-	depends on BR2_powerpc
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	# kernel headers: 2.6.38
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-	help
-	  Sourcery CodeBench toolchain for the PowerPC architecture,
-	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51,
-	  glibc 2.13, gdb 7.2.50 and kernel headers 2.6.38. It has
-	  support for the following variants:
-	    - 603 glibc, 32 bits
-	      Select a generic PowerPC core
-	      Disable BR2_SOFT_FLOAT
-	    - 603 soft float glibc, 32 bits
-	      Select a generic PowerPC core
-	      Enable BR2_SOFT_FLOAT
-	    - e600 altivec glibc, 32 bits
-	      Set BR2_TARGET_OPTIMIZATION to -te600
-	    - e500v1 glibc, 32 bits
-	      Set BR2_TARGET_OPTIMIZATION to -te500v1
-	    - e500v2 glibc, 32 bits
-	      Set BR2_TARGET_OPTIMIZATION to -te500v2
-	    - e500mc glibc, 32 bits
-	      Set BR2_TARGET_OPTIMIZATION to -te500mc
-	    - 970 glibc hard-float, 64 bits
-	      Set BR2_TARGET_OPTIMIZATION to -m64
-
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
-	bool "Sourcery CodeBench PowerPC 2010.09"
-	depends on BR2_powerpc
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	# kernel headers: 2.6.35
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-	help
-	  Sourcery CodeBench toolchain for the PowerPC architecture,
-	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
-	  glibc 2.11, gdb 7.2.50 and kernel headers 2.6.35.2. It has
-	  support for the following variants:
-	    - 603 glibc, 32 bits
-	      Select a generic PowerPC core
-	      Disable BR2_SOFT_FLOAT
-	    - 603 soft float glibc, 32 bits
-	      Select a generic PowerPC core
-	      Enable BR2_SOFT_FLOAT
-	    - e600 altivec glibc, 32 bits
-	      Set BR2_TARGET_OPTIMIZATION to -te600
-	    - e500v1 glibc, 32 bits
-	      Set BR2_TARGET_OPTIMIZATION to -te500v1
-	    - e500v2 glibc, 32 bits
-	      Set BR2_TARGET_OPTIMIZATION to -te500v2
-	    - e500mc glibc, 32 bits
-	      Set BR2_TARGET_OPTIMIZATION to -te500mc
-	    - 970 glibc hard-float, 64 bits
-	      Set BR2_TARGET_OPTIMIZATION to -m64
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
 	bool "Sourcery CodeBench SH 2012.09"
 	depends on BR2_sh4a || BR2_sh4aeb
@@ -738,9 +672,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
-	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
-	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
+	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 1f80497..7a073f1 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -19,8 +19,6 @@ sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-201
 # NiosII
 sha256 cc47745dc1264fcb8fb98fb1315ab772ab98691396021c455229b58abaf887f5  sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # PowerPC
-sha256 d68d1a2a055ece3824a1a11fcc0a8e813ee1d215025247cce0d877caa12c4b54  freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 525e1f53abbf65c2974ae9af762c45bb38520fe5fc50e968a23fe6a18e9eec04  freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 d6c94587d546197836e7e1a6909f6aabfa5879e91f501ab03088a6887cc242fc  mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # SuperH
 sha256 ce8115844619a8b02f85e801999fe4cc2e603788be784ae860a070f92ab8053d  renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 02de584..e78865e 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -317,13 +317,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.11-32-mips-linux-gnu-i686-pc-linux-gnu.tar
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-mentor-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103),y)
-- 
2.4.3
