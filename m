From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Dec 2015 13:00:25 +0100
Subject: [Buildroot] [PATCH] toolchain-external: CodeSourcery PowerPC:
	Revert the removal of CS PowerPC 2011.03
Message-ID: <1451131225-9384-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Yann E. MORIN [1], the latest CS PowerPC toolchain (2012.03)
requires a PPC CPU with SPE, which is basically two variants, 8540 (e500v1) and
8548 (e500v2) in Buildroot. All other PPC CPU can't use that toolchain.

In order to keep at least one CS toolchain for all other PPC CPU, revert the
removal of CS PowerPC 2011.03 and add a dependency on !BR2_POWERPC_CPU_HAS_SPE.

In the same time add a dependency on BR2_POWERPC_CPU_HAS_SPE for the CS PowerPC
2012.03.

Thereby, we can use the same trick as for the Linaro toolchain and keep only
one Kconfig symbol.

Also re-add the old CS toolchain handling for pixman and liquid-dsp.

[1] http://lists.busybox.net/pipermail/buildroot/2015-December/148308.html

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---

Gustavo, in the previous patch I removed your fix [1] for the CS PowerPC 2011.03 and
2010.09 toolchains.
Since BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC can be ether CS PowerPC 2011.03
or CS PowerPC 2012.03, I reverted this change.

Do you know if the Altivec detection is still not realiable with 2012.03 ?

[1] https://git.busybox.net/buildroot/commit/?id=50b02a639558b5319e88d2c3ce66e3950352d694
---
 package/liquid-dsp/Config.in                       |  3 ++
 package/pixman/pixman.mk                           |  5 +++
 toolchain/toolchain-external/Config.in             | 42 +++++++++++++++++++++-
 .../toolchain-external/toolchain-external.hash     |  1 +
 toolchain/toolchain-external/toolchain-external.mk |  5 +++
 5 files changed, 55 insertions(+), 1 deletion(-)

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
index 8d4a835..066bde3 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -284,12 +284,16 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	  from Mentor Graphics. It uses gcc 5.2, binutils 2.25.51,
 	  glibc 2.22, gdb 7.10.50 and kernel headers 4.2.
 
+# Note: we use the same symbol for both CodeSourcery PowerPC toolchains.
+# Since they have different dependencies on SPE support, we can
+# give them different prompts and different help texts.
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	bool "Sourcery CodeBench PowerPC 2012.03"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_SPE
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_POWERPC_CPU_HAS_SPE
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -303,6 +307,41 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	  support for the following variants:
 	    - e500v2 glibc, SPE, 32 bits
 
+# See the note above.
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
+	bool "Sourcery CodeBench PowerPC 2011.03"
+	depends on BR2_powerpc
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_POWERPC_CPU_HAS_SPE
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
@@ -552,7 +591,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
+	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC && !BR2_POWERPC_CPU_HAS_SPE
+	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC && BR2_POWERPC_CPU_HAS_SPE
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
index 8a9ea88..56f9228 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -318,8 +318,13 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_SPE),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-mentor-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu
+TOOLCHAIN_EXTERNAL_SOURCE = freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
+endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.4.3
