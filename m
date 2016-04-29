From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Apr 2016 10:18:56 -0300
Subject: [Buildroot] [PATCH] toolchain-external: remove sourcery powerpc
	toolchains
Message-ID: <1461935936-9390-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are running long on the teeth - the bundled (e)glibc versions are
very old with several security bugs, they don't work reliably with -Os
and have several build failures related to internal compiler errors such
as:

http://autobuild.buildroot.net/results/fe7/fe7bdba5faf199275aedea2918705b5d19d228bf/
http://autobuild.buildroot.net/results/935/935ac42c30ed893939c06c077534f060aed80e9a/
http://autobuild.buildroot.net/results/a47/a476af82c8fe4a279117314b278b08af9a08fe54/
http://autobuild.buildroot.net/results/cae/cae720b5096be2672b4dc1311ae3fc4ed06a3b53/

The situation will not provide, and will in fact get worse with older kernel
headers precluding modern package versions and the old gcc version doing as
well so remove them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liquid-dsp/Config.in                       |  2 -
 package/pixman/pixman.mk                           |  5 --
 toolchain/toolchain-external/Config.in             | 54 ----------------------
 .../toolchain-external/toolchain-external.hash     |  5 --
 toolchain/toolchain-external/toolchain-external.mk |  6 ---
 5 files changed, 72 deletions(-)

diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
index ad887cb..ebdc46e 100644
--- a/package/liquid-dsp/Config.in
+++ b/package/liquid-dsp/Config.in
@@ -1,5 +1,4 @@
 comment "liquid-dsp requires a (e)glibc/musl toolchain w/ dynamic library"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIQUID_DSP
@@ -7,7 +6,6 @@ config BR2_PACKAGE_LIQUID_DSP
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_STATIC_LIBS
 	# These result in internal compiler error
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	help
 	  Liquid-DSP is a free and open-source signal processing
 	  library for software-defined radios written in C.  Its
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 06070f0..ae8d62c 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -32,10 +32,5 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 PIXMAN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DPIXMAN_NO_TLS"
 endif
 
-# Altivec detection isn't reliable for CS toolchains
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC),y)
-PIXMAN_CONF_OPTS += --disable-vmx
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index cd86176..7ca841e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -419,58 +419,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	  from Mentor Graphics. It uses gcc 5.2, binutils 2.25.51,
 	  glibc 2.22, gdb 7.10.50 and kernel headers 4.2.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2
-	bool "Sourcery CodeBench PowerPC 2012.03 (e500v2 only)"
-	depends on BR2_powerpc
-	depends on BR2_powerpc_8548 # e500v2 support only
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
-	help
-	  Sourcery CodeBench toolchain for the PowerPC architecture,
-	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
-	  glibc 2.15, gdb 7.2.50 and kernel headers 3.2.10. It has
-	  support for the following variants:
-	    - e500v2 glibc, SPE, 32 bits
-
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
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
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	bool "Sourcery CodeBench SH 2012.09"
 	depends on BR2_sh4a || BR2_sh4aeb
@@ -722,8 +670,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
-	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 0ed253d..811aef7 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -16,11 +16,6 @@ sha256 e16a5b1e41d7ff1e74161f9405182001bc8d1360d89564e73911032e6966cc0d  arm-201
 # NiosII
 sha256 cc47745dc1264fcb8fb98fb1315ab772ab98691396021c455229b58abaf887f5  sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 8b5710e41685a316d577b503c068c69ba1eaf228fe0a056cac36945323a0dd23  sourceryg++-2015.11-27-nios2-linux-gnu.src.tar.bz2
-# PowerPC
-sha256 525e1f53abbf65c2974ae9af762c45bb38520fe5fc50e968a23fe6a18e9eec04  freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 fe45a1d2725e1b9f0ec7b8041c923e01f461da01b298caad537854ec1c61e211  freescale-2011.03-38-powerpc-linux-gnu.src.tar.bz2
-sha256 d6c94587d546197836e7e1a6909f6aabfa5879e91f501ab03088a6887cc242fc  mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 4964938da0108a9a5bcc295b0f504a3804021e6e6e596509ee085d9143711b50  mentor-2012.03-71-powerpc-mentor-linux-gnu.src.tar.bz2
 # SuperH
 sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 e2e58c10e52395d5d35157e35f85233f713c6f9223a652dfc56194cfd2eed004  renesas-2012.09-61-sh-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2422b6d..36cf4e0 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -339,12 +339,6 @@ TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.11-32-mips-linux-gnu-i686-pc-linux-gnu.tar
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-mentor-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.7.3
