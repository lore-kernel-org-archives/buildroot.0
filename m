From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 9 Nov 2015 17:32:09 +0000
Subject: [Buildroot] [PATCH v3 2/3] toolchain/external: add MIPS Codescape
	IMG GNU Linux toolchain
In-Reply-To: <1447090330-28133-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1447090330-28133-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1447090330-28133-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
 - Remove the hook to create the sysroot link. This is automatically
   done in the helpers.mk. Due to that, the explanation in the commit
   log about reusing the hook is no longer valid, so drop it.

 toolchain/toolchain-external/Config.in             |   44 ++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |    1 +
 toolchain/toolchain-external/toolchain-external.mk |    4 ++
 3 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ee6d221..127d407 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -287,6 +287,49 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506
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
@@ -1039,6 +1082,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-mti-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506
+	default "mips-img-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS201506
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 9456174..e88e4b5 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -59,6 +59,7 @@ sha256 b9137008744d9009877f662dbac7481d673cdcb1798e727e325a37c98a0f63da  gcc-lin
 # Codescape toolchains from Imagination Technologies
 # From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05/
 sha256 f2d12dde626b750987d37ba6c73c6e11839850add94b0d4e4cf77917c1b0944f  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+sha256 545923cf40101b5de6b1e0fdf124aceba7ab27daf6c755aecf01d2c886715409  Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
 
 # Synopsys DesignWare ARC toolchains
 sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 1e22f5f..dc91911 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -345,6 +345,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS201506),y)
 TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05
 TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS201506),y)
+TOOLCHAIN_EXTERNAL_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05
+TOOLCHAIN_EXTERNAL_SOURCE = Codescape.GNU.Tools.Package.2015.06-05.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.7.1
