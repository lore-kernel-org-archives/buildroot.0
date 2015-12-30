From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 22:25:50 +0100
Subject: [Buildroot] [git commit] toolchain-external: CodeSourcery PowerPC:
	Revert the removal of CS PowerPC 2011.03
Message-ID: <20151230213537.3D59282708@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9f293523265af016571e0dd3c6243b44e1ea9d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Yann E. MORIN [1], the latest CS PowerPC toolchain (2012.03)
requires a PPC CPU with SPE, which is basically two variants, 8540 (e500v1) and
8548 (e500v2) in Buildroot. All other PPC CPU can't use that toolchain.

Keep CS PowerPC 2011.03 as latest available version and add a second Kconfig
symbol for the CS PowerPC 2012.03 since it's verry specific to one CPU type
(e500v2).

Previously it was possible to select the CS 2012.03 with a powerpc 8540 (e500v1)
CPU but the sysroot provided by the toolchain only support the 8548 (e500v2)
variant. Allow to select CS 2012.03 only with BR2_powerpc_8548.

Also re-add the previous CS toolchain handling for pixman and liquid-dsp.

[1] http://lists.busybox.net/pipermail/buildroot/2015-December/148308.html

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liquid-dsp/Config.in                       |  3 ++
 package/pixman/pixman.mk                           |  5 +++
 toolchain/toolchain-external/Config.in             | 42 +++++++++++++++++++---
 .../toolchain-external/toolchain-external.hash     |  1 +
 toolchain/toolchain-external/toolchain-external.mk |  5 ++-
 5 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
index a2cd21c..ad887cb 100644
--- a/package/liquid-dsp/Config.in
+++ b/package/liquid-dsp/Config.in
@@ -1,10 +1,13 @@
 comment "liquid-dsp requires a (e)glibc/musl toolchain w/ dynamic library"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIQUID_DSP
 	bool "liquid-dsp"
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_STATIC_LIBS
+	# These result in internal compiler error
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	help
 	  Liquid-DSP is a free and open-source signal processing
 	  library for software-defined radios written in C.  Its
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 29b01ee..a130af9 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -32,5 +32,10 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 PIXMAN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DPIXMAN_NO_TLS"
 endif
 
+# Altivec detection isn't reliable for CS toolchains
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC),y)
+PIXMAN_CONF_OPTS += --disable-vmx
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 1418fc1..e3b5ad5 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -284,10 +284,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	  from Mentor Graphics. It uses gcc 5.2, binutils 2.25.51,
 	  glibc 2.22, gdb 7.10.50 and kernel headers 4.2.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
-	bool "Sourcery CodeBench PowerPC 2012.03"
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2
+	bool "Sourcery CodeBench PowerPC 2012.03 (e500v2 only)"
 	depends on BR2_powerpc
-	depends on BR2_powerpc_SPE
+	depends on BR2_powerpc_8548 # e500v2 support only
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -303,6 +303,39 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	  support for the following variants:
 	    - e500v2 glibc, SPE, 32 bits
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
+	bool "Sourcery CodeBench PowerPC 2011.03"
+	depends on BR2_powerpc
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	# kernel headers: 2.6.38
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	help
+	  Sourcery CodeBench toolchain for the PowerPC architecture,
+	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51,
+	  glibc 2.13, gdb 7.2.50 and kernel headers 2.6.38. It has
+	  support for the following variants:
+	    - 603 glibc, 32 bits
+	      Select a generic PowerPC core
+	      Disable BR2_SOFT_FLOAT
+	    - 603 soft float glibc, 32 bits
+	      Select a generic PowerPC core
+	      Enable BR2_SOFT_FLOAT
+	    - e600 altivec glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te600
+	    - e500v1 glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te500v1
+	    - e500v2 glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te500v2
+	    - e500mc glibc, 32 bits
+	      Set BR2_TARGET_OPTIMIZATION to -te500mc
+	    - 970 glibc hard-float, 64 bits
+	      Set BR2_TARGET_OPTIMIZATION to -m64
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	bool "Sourcery CodeBench SH 2012.09"
 	depends on BR2_sh4a || BR2_sh4aeb
@@ -552,7 +585,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
+	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
+	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 35ee85c..64dcdb4 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -15,6 +15,7 @@ sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-201
 # NiosII
 sha256 cc47745dc1264fcb8fb98fb1315ab772ab98691396021c455229b58abaf887f5  sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # PowerPC
+sha256 525e1f53abbf65c2974ae9af762c45bb38520fe5fc50e968a23fe6a18e9eec04  freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 d6c94587d546197836e7e1a6909f6aabfa5879e91f501ab03088a6887cc242fc  mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # SuperH
 sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 8a9ea88..8fdc7c6 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -317,9 +317,12 @@ TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.11-32-mips-linux-gnu-i686-pc-linux-gnu.tar
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-mentor-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC),y)
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu
+TOOLCHAIN_EXTERNAL_SOURCE = freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
