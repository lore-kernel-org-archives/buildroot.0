From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:02:16 +0100
Subject: [Buildroot] [git commit] toolchain: bump Codescape toolchains to
	version 2015.10
Message-ID: <20160308200222.E327880835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b3fa6b4b70ab20ad3efb888d57a4159a670b1f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 93 +++++++++++++++-------
 .../toolchain-external/toolchain-external.hash     |  6 +-
 toolchain/toolchain-external/toolchain-external.mk |  8 +-
 3 files changed, 73 insertions(+), 34 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0f9f7b8..0b0a1cb 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -269,99 +269,138 @@ comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 an
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
-	bool "Codescape IMG GNU Linux Toolchain 2015.06"
+	bool "Codescape IMG GNU Linux Toolchain 2015.10"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on BR2_mips_32r6 || BR2_mips_64r6
+	depends on BR2_mips_32r6 || (BR2_mips_64r6 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
-	  Codescape IMG GNU Linux Toolchain 2015.06 for the MIPS
+	  Codescape IMG GNU Linux Toolchain 2015.10 for the MIPS
 	  architecture, from Imagination Technologies. It uses gcc
 	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
 	  headers 4.0. It has support for the following variants:
-	    - MIPS32r6 - Big-Endian, o32
+	    - MIPS32r6 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
 	      Select 'MIPS (big endian)' Target Architecture
 	      Select 'mips 32r6' Target Architecture Variant
-	    - MIPS32r6 - Little-Endian, o32
+	      Disable 'Use soft-float'
+	    - MIPS32r6 - Big-Endian, Soft-Float, 2008 NaN, o32 ABI
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Enable 'Use soft-float'
+	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Disable 'Use soft-float'
+	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Enable 'Use soft-float'
+	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI, microMIPS
 	      Select 'MIPS (little endian)' Target Architecture
 	      Select 'mips 32r6' Target Architecture Variant
-	    - MIPS32r6 - Little-Endian, o32, microMIPS
+	      Disable 'Use soft-float'
+	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
+	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI, microMIPS
 	      Select 'MIPS (little endian)' Target Architecture
 	      Select 'mips 32r6' Target Architecture Variant
+	      Enable 'Use soft-float'
 	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS64r6 - Big-Endian, n32
+	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n32 ABI
 	      Select 'MIPS64 (big endian)' Target Architecture
 	      Select 'mips 64r6' Target Architecture Variant
 	      Select 'n32' Target ABI
-	    - MIPS64r6 - Little-Endian, n32
+	      Disable 'Use soft-float'
+	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n32 ABI
 	      Select 'MIPS64 (little endian)' Target Architecture
 	      Select 'mips 64r6' Target Architecture Variant
 	      Select 'n32' Target ABI
-	    - MIPS64r6 - Big-Endian, n64
+	      Disable 'Use soft-float'
+	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n64 ABI
 	      Select 'MIPS64 (big endian)' Target Architecture
 	      Select 'mips 64r6' Target Architecture Variant
 	      Select 'n64' Target ABI
-	    - MIPS64r6 - Little-Endian, n64
+	      Disable 'Use soft-float'
+	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n64 ABI
 	      Select 'MIPS64 (little endian)' Target Architecture
 	      Select 'mips 64r6' Target Architecture Variant
 	      Select 'n64' Target ABI
-
+	      Disable 'Use soft-float'
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	bool "Codescape MTI GNU Linux Toolchain 2015.06"
+	bool "Codescape MTI GNU Linux Toolchain 2015.10"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_MIPS_SOFT_FLOAT
-	depends on BR2_mips_32r2 || BR2_mips_64r2
+	depends on BR2_mips_32r2 || (BR2_mips_64r2 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
-	  Codescape MTI GNU Linux Toolchain 2015.06 for the MIPS
+	  Codescape MTI GNU Linux Toolchain 2015.10 for the MIPS
 	  architecture, from Imagination Technologies. It uses gcc
 	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
 	  headers 4.0. It has support for the following variants:
-	    - MIPS32r2 - Big-Endian, o32
+	    - MIPS32r2 - Big-Endian, Hard-Float, Legacy NaN, o32 ABI
 	      Select 'MIPS (big endian)' Target Architecture
 	      Select 'mips 32r2' Target Architecture Variant
-	    - MIPS32r2 - Little-Endian, o32
-	      Select 'MIPS (little endian)' Target Architecture
-	      Select 'mips 32r2' Target Architecture Variant
-	    - MIPS32r2 - Big-Endian, 2008 NaN, o32
+	      Disable 'Use soft-float'
+	    - MIPS32r2 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
 	      Select 'MIPS (big endian)' Target Architecture
 	      Select 'mips 32r2' Target Architecture Variant
+	      Disable 'Use soft-float'
 	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
-	    - MIPS32r2 - Little-Endian, 2008 NaN, o32
+	    - MIPS32r2 - Big-Endian, Soft-Float, Legacy NaN, o32 ABI
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Enable 'Use soft-float'
+	    - MIPS32r2 - Little-Endian, Hard-Float, Legacy NaN, o32 ABI
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Disable 'Use soft-float'
+	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
 	      Select 'MIPS (little endian)' Target Architecture
 	      Select 'mips 32r2' Target Architecture Variant
+	      Disable 'Use soft-float'
 	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
-	    - MIPS32r2 - Little-Endian, o32, microMIPS
+	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Enable 'Use soft-float'
+	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI, microMIPS
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Enable 'Use soft-float'
+	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
+	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI, microMIPS
 	      Select 'MIPS (little endian)' Target Architecture
 	      Select 'mips 32r2' Target Architecture Variant
+	      Disable 'Use soft-float'
 	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
-	    - MIPS64r2 - Big-Endian, n32
+	    - MIPS64r2 - Big-Endian, Hard-Float, Legacy NaN, n32 ABI
 	      Select 'MIPS64 (big endian)' Target Architecture
 	      Select 'mips 64r2' Target Architecture Variant
 	      Select 'n32' Target ABI
-	    - MIPS64r2 - Little-Endian, n32
+	      Disable 'Use soft-float'
+	    - MIPS64r2 - Little-Endian, Hard-Float, Legacy NaN, n32 ABI
 	      Select 'MIPS64 (little endian)' Target Architecture
 	      Select 'mips 64r2' Target Architecture Variant
 	      Select 'n32' Target ABI
-	    - MIPS64r2 - Big-Endian, n64
+	      Disable 'Use soft-float'
+	    - MIPS64r2 - Big-Endian, Hard-Float, Legacy NaN, n64 ABI
 	      Select 'MIPS64 (big endian)' Target Architecture
 	      Select 'mips 64r2' Target Architecture Variant
 	      Select 'n64' Target ABI
-	    - MIPS64r2 - Little-Endian, n64
+	      Disable 'Use soft-float'
+	    - MIPS64r2 - Little-Endian, Hard-Float, Legacy NaN, n64 ABI
 	      Select 'MIPS64 (little endian)' Target Architecture
 	      Select 'mips 64r2' Target Architecture Variant
 	      Select 'n64' Target ABI
+	      Disable 'Use soft-float'
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	bool "Sourcery CodeBench Nios-II 2015.11"
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 94c5616..ac50281 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -39,9 +39,9 @@ sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-lin
 sha256 b318a1837a54146b0120a13852386576e38355513b4e2cd5e2125f9c26913777  gcc-linaro-5.2-2015.11-2-x86_64_aarch64-linux-gnu.tar.xz
 
 # Codescape toolchains from Imagination Technologies
-# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05/
-sha256 f2d12dde626b750987d37ba6c73c6e11839850add94b0d4e4cf77917c1b0944f  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
-sha256 545923cf40101b5de6b1e0fdf124aceba7ab27daf6c755aecf01d2c886715409  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.10-04/
+sha256 9222d7b08b908ce0d5fa80a3623f8c51251be51af02629600b89693f09f566c8  Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+sha256 6eca906933424146e2059641a2ec85f1b163c1a3942a31c39472aba5a3f116be  Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
 
 # Synopsys DesignWare ARC toolchains
 sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 38bc59b..e712998 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -335,12 +335,12 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/x86_64-amd-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.10-04
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
-TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05
-TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.10-04
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.10-04.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
