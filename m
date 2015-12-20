From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:47:09 +0100
Subject: [Buildroot] [git commit] toolchain-external: CodeSourcery SH:
	support only one version
Message-ID: <20151220125132.55DAB7FC6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e1ae89a9906c90906b4ba4aa8cddcb5b7c656f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the conclusion about external toolchains during the Buildroot
meeting [1]:
"In the future, we stick to a single external toolchain version. The
Kconfig symbol should not encode the version (avoid legacy handling)"

[1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liquid-dsp/Config.in                       |  4 +-
 package/qt/Config.in                               |  2 +-
 toolchain/toolchain-external/Config.in             | 55 +---------------------
 .../toolchain-external/toolchain-external.hash     |  2 -
 toolchain/toolchain-external/toolchain-external.mk |  8 +---
 5 files changed, 5 insertions(+), 66 deletions(-)

diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
index 95233da..a2cd21c 100644
--- a/package/liquid-dsp/Config.in
+++ b/package/liquid-dsp/Config.in
@@ -18,9 +18,7 @@ if BR2_PACKAGE_LIQUID_DSP
 
 config BR2_PACKAGE_LIQUID_DSP_FAST
 	bool "optimize for speed over accuracy"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209 && \
-		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203 && \
-		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	help
 	  Optimize for speed over accuracy.
 
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 418248a..bf14724 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -416,7 +416,7 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	# The CodeSourcery SuperH toolchain fails to build Webkit,
 	# with an assertion failure in binutils.
 	default y if (BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb) && \
-		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2f60fe0..120fa9a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -303,7 +303,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	  support for the following variants:
 	    - e500v2 glibc, SPE, 32 bits
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	bool "Sourcery CodeBench SH 2012.09"
 	depends on BR2_sh4a || BR2_sh4aeb
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -328,55 +328,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
 	    - SH4A, uClibc, big endian
 	      Not usable in Buildroot yet.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
-	bool "Sourcery CodeBench SH 2012.03"
-	depends on BR2_sh4a || BR2_sh4aeb
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
-	help
-	  Sourcery CodeBench toolchain for the SuperH architecture,
-	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
-	  glibc 2.15, uClibc 0.9.30, gdb 7.2.50 and kernel headers
-	  3.2.10. It has support for the following variants:
-	    - SH4A, glibc, little endian
-	      Default.
-	    - SH4A, glibc, big endian
-	      Add -mb to BR2_TARGET_OPTIMIZATION
-	    - SH4A, uClibc, little endian
-	      Not usable in Buildroot yet.
-	    - SH4A, uClibc, big endian
-	      Not usable in Buildroot yet.
-
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
-	bool "Sourcery CodeBench SH 2011.03"
-	depends on BR2_sh4a || BR2_sh4aeb
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	# kernel headers: 2.6.38
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-	help
-	  Sourcery CodeBench toolchain for the SuperH architecture,
-	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
-	  glibc 2.13, uClibc 0.9.30, gdb 7.2.50 and kernel headers
-	  2.6.38. It has support for the following variants:
-	    - SH4A, glibc, little endian
-	      Default.
-	    - SH4A, glibc, big endian
-	      Add -mb to BR2_TARGET_OPTIMIZATION
-	    - SH4A, uClibc, little endian
-	      Not usable in Buildroot yet.
-	    - SH4A, uClibc, big endian
-	      Not usable in Buildroot yet.
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	bool "Sourcery CodeBench AMD64 2015.11"
 	depends on BR2_x86_64
@@ -673,9 +624,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
-	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
-	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
-	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
+	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 7a073f1..d5f6957 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -21,8 +21,6 @@ sha256 cc47745dc1264fcb8fb98fb1315ab772ab98691396021c455229b58abaf887f5  sourcer
 # PowerPC
 sha256 d6c94587d546197836e7e1a6909f6aabfa5879e91f501ab03088a6887cc242fc  mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # SuperH
-sha256 ce8115844619a8b02f85e801999fe4cc2e603788be784ae860a070f92ab8053d  renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 a545a9d412c47d85edcad09a86fe1d12a48e2b6e19d0ccf86b63d2cf0bffa687  renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # x86
 sha256 5f308a3fe0752f181fd0d33a70a17efb8300d0e34a94ed18a1a0304dc18e150e  ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index e78865e..3856e7c 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -320,13 +320,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2015.11-27-nios2-linux-gnu-i686-pc-linux
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-mentor-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109),y)
