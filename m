From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 15 Dec 2015 16:21:24 +0000
Subject: [Buildroot] [PATCH v4 2/3] toolchain/external: add MIPS Codescape
	MTI GNU Linux toolchain
In-Reply-To: <1450196485-19214-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1450196485-19214-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1450196485-19214-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v3 -> v4:
 - Move the changes to helpers.mk into a separate patch.

Changes v2 -> v3:
 - Drop the hook to create the link for the side by side sysroots in the
   toolchain-external.mk and create it in the helpers.mk. Also remove
   the unnecessary comment since the helpers.mk code doesn't assume a
   nested sysroot anymore.

 toolchain/toolchain-external/Config.in             | 52 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  4 ++
 toolchain/toolchain-external/toolchain-external.mk |  4 ++
 3 files changed, 60 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f2eed7f..ee6d221 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -236,6 +236,57 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 
 	  This toolchain uses software-floating point.
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506
+	bool "Codescape MTI GNU Linux Toolchain 2015.06"
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on BR2_mips_32r2 || BR2_mips_64r2
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	help
+	  Codescape MTI GNU Linux Toolchain 2015.06 for the MIPS
+	  architecture, from Imagination Technologies. It uses gcc
+	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
+	  headers 4.0. It has support for the following variants:
+	    - MIPS32r2 - Big-Endian, o32
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	    - MIPS32r2 - Little-Endian, o32
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	    - MIPS32r2 - Big-Endian, 2008 NaN, o32
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
+	    - MIPS32r2 - Little-Endian, 2008 NaN, o32
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
+	    - MIPS32r2 - Little-Endian, o32, microMIPS
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r2' Target Architecture Variant
+	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
+	    - MIPS64r2 - Big-Endian, n32
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n32' Target ABI
+	    - MIPS64r2 - Little-Endian, n32
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n32' Target ABI
+	    - MIPS64r2 - Big-Endian, n64
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n64' Target ABI
+	    - MIPS64r2 - Little-Endian, n64
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r2' Target Architecture Variant
+	      Select 'n64' Target ABI
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 	bool "Sourcery CodeBench MIPS 2015.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -987,6 +1038,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
+	default "mips-mti-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 2d41389..9456174 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -56,6 +56,10 @@ sha256 24b86799a6c64380c740bf31a700b46e854fc0a821da2341e9868f0196c864de  gcc-lin
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 sha256 b9137008744d9009877f662dbac7481d673cdcb1798e727e325a37c98a0f63da  gcc-linaro-5.1-2015.08-x86_64_aarch64-linux-gnu.tar.xz
 
+# Codescape toolchains from Imagination Technologies
+# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05/
+sha256 f2d12dde626b750987d37ba6c73c6e11839850add94b0d4e4cf77917c1b0944f  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+
 # Synopsys DesignWare ARC toolchains
 sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
 sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 613ce50..b9eb7cb 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -341,6 +341,10 @@ TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/components/toolchain/binari
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.1-2015.08-x86_64_armeb-linux-gnueabihf.tar.xz
 endif
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
+TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
2.4.10
