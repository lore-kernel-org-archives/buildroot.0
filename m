From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:10:24 +0100
Subject: [Buildroot] [git commit] toolchain: bump Codescape MTI MIPS version
	to 2016.05-06
Message-ID: <20170116124620.AB58D81E06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=238cdff39d9cc0eebb16951ca0cfc61adf577d9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also...

  - Fix a typo in Config.in
  - Take into account the host's architecture to download the x86 or
    x86_64 version. This makes the IA32 libs dependency in unnecessary.

[Peter: fix kernel headers comment as pointed out by Romain]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external-codescape-mti-mips/Config.in                | 7 +++----
 .../toolchain-external-codescape-mti-mips.hash                     | 5 +++--
 .../toolchain-external-codescape-mti-mips.mk                       | 6 +++++-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index f899467..efe6f85 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -6,15 +6,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
-	  Codescape MTI GNU Linux Toolchain 2015.10 for the MIPS
+	  Codescape MTI GNU Linux Toolchain 2016.05 for the MIPS
 	  architecture, from Imagination Technologies. It uses gcc
 	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
-	  headers 4.0. It has support for the following variants:
+	  headers 4.7. It has support for the following variants:
 	    - MIPS32r2 - Big-Endian, Hard-Float, Legacy NaN, o32 ABI
 	      Select 'MIPS (big endian)' Target Architecture
 	      Select 'mips 32r2' Target Architecture Variant
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
index 0d785f2..d31f998 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
@@ -1,3 +1,4 @@
 # Codescape toolchains from Imagination Technologies
-# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
-sha256 10b8ab6d7c492abc19ecabafedc6bc5f12ff88107a3cb76dc452b3a9522d9c56  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-06/downloads.html
+sha256 3a7aba259beb05f0e3054b5a61a368a5085447f47361949a938ac9cc7de4227b  Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+sha256 a676a8b3647c8c651fb8935a75db8f00b79d36ec55676f7c05bac12b550788f7  Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.MTI.Linux.CentOS-5.x86_64.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
index e5733ca..d63a367 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION = 2016.05-03
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION = 2016.05-06
 TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION)
 TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STRIP_COMPONENTS = 2
 
+ifeq ($(HOSTARCH),x86)
 TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-5.x86.tar.gz
+else
+TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-5.x86_64.tar.gz
+endif
 
 # Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
 # sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
