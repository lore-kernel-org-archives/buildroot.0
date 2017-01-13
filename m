From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 13 Jan 2017 17:55:00 +0000
Subject: [Buildroot] [PATCH v2 1/2] toolchain: bump Codescape IMG MIPS
	version to 2016.05-06
Message-ID: <20170113175501.38416-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also...

- Fix a typo in Config.in
- Take into account the host's architecture to download the x86 or
  x86_64 version. This makes the IA32 libs dependency in unnecessary.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Fix a typo in Config.in
 - Take into account the host's architecture to download the x86 or
   x86_64 version. Remove IA32 libs dependency.

 .../toolchain-external-codescape-img-mips/Config.in                 | 5 ++---
 .../toolchain-external-codescape-img-mips.hash                      | 5 +++--
 .../toolchain-external-codescape-img-mips.mk                        | 6 +++++-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index 1f0d4d1..58a18fd 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -5,12 +5,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
-	  Codescape IMG GNU Linux Toolchain 2015.10 for the MIPS
+	  Codescape IMG GNU Linux Toolchain 2016.05 for the MIPS
 	  architecture, from Imagination Technologies. It uses gcc
 	  4.9.2, binutils 2.24.90, glibc 2.20, gdb 7.9.1 and kernel
 	  headers 4.0. It has support for the following variants:
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
index e4ae9e1..6a12cfa 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
@@ -1,3 +1,4 @@
 # Codescape toolchains from Imagination Technologies
-# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
-sha256 e3c1f292ac6a9f12480af431c85a7ed9dfa011a52fd62a50be3363ec6b9bc872  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-06/downloads.html
+sha256 8d9cdf711dd402d7bf82883d425c221038fe8ce9d0c91a3f6b30939d9d55476c  Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+sha256 6e2784d6df962fe4db7510c8a62ce3947b73f54207b10e18b52da59d1bc487bd  Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.IMG.Linux.CentOS-5.x86_64.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
index b4decfb..49a7027 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2016.05-03
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2016.05-06
 TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION)
 TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STRIP_COMPONENTS = 2
 
+ifeq ($(HOSTARCH),x86)
 TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
+else
+TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-5.x86_64.tar.gz
+endif
 
 # Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
 # sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
-- 
2.10.2
