From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Oct 2015 14:49:00 +0200
Subject: [Buildroot] [PATCH 8/9 v2] toolchain/external: add MIPS Codescape
	IMG GNU Linux toolchain
In-Reply-To: <cover.1445690712.git.yann.morin.1998@free.fr>
References: <cover.1445690712.git.yann.morin.1998@free.fr>
Message-ID: <401483722c25245e28a895922bd88f07c3a202a1.1445690712.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Re-use SYSROOT_DIR vs. ARCH_SYSROOT_DIR handling just introduced for the
Codescape MTI toolchain (in the previous patch).

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[yann.morin.1998 at free.fr: tweak commit log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/Config.in             | 44 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  1 +
 toolchain/toolchain-external/toolchain-external.mk |  5 +++
 3 files changed, 50 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 481b77c..fadd4a0 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -241,6 +241,49 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506
 	      Select 'mips 64r2' Target Architecture Variant
 	      Select 'n64' Target ABI
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS201506
+	bool "Codescape IMG GNU Linux Toolchain 2015.06"
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on BR2_mips_32r6 || BR2_mips_64r6
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	help
+	  Codescape IMG GNU Linux Toolchain 2015.06 for the MIPS
+	  architecture, from Imagination Technologies. It uses gcc
+	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
+	  headers 4.0. It has support for the following variants:
+	    - MIPS32r6 - Big-Endian, o32
+	      Select 'MIPS (big endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	    - MIPS32r6 - Little-Endian, o32
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	    - MIPS32r6 - Little-Endian, o32, microMIPS
+	      Select 'MIPS (little endian)' Target Architecture
+	      Select 'mips 32r6' Target Architecture Variant
+	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
+	    - MIPS64r6 - Big-Endian, n32
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r6' Target Architecture Variant
+	      Select 'n32' Target ABI
+	    - MIPS64r6 - Little-Endian, n32
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r6' Target Architecture Variant
+	      Select 'n32' Target ABI
+	    - MIPS64r6 - Big-Endian, n64
+	      Select 'MIPS64 (big endian)' Target Architecture
+	      Select 'mips 64r6' Target Architecture Variant
+	      Select 'n64' Target ABI
+	    - MIPS64r6 - Little-Endian, n64
+	      Select 'MIPS64 (little endian)' Target Architecture
+	      Select 'mips 64r6' Target Architecture Variant
+	      Select 'n64' Target ABI
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
 	bool "Sourcery CodeBench MIPS 2015.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -986,6 +1029,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-mti-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506
+	default "mips-img-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS201506
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 40bc1e1..19f57c3 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -56,6 +56,7 @@ sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-lin
 # Codescape toolchains from Imagination Technologies
 # From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05/
 sha256 f2d12dde626b750987d37ba6c73c6e11839850add94b0d4e4cf77917c1b0944f  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+sha256 545923cf40101b5de6b1e0fdf124aceba7ab27daf6c755aecf01d2c886715409  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
 
 # Synopsys DesignWare ARC toolchains
 sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 4ad726d..44a5b34 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -346,6 +346,11 @@ TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolch
 TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS201506),y)
+TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESCAPE_MIPS_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.9.1
