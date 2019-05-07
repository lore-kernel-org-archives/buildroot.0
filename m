From: guoren at kernel.org <guoren@kernel.org>
Date: Tue,  7 May 2019 17:47:21 +0800
Subject: [Buildroot] [PATCH 2/3] arch: Add support for C-SKY toolchain build
In-Reply-To: <1557222442-8484-1-git-send-email-guoren@kernel.org>
References: <1557222442-8484-1-git-send-email-guoren@kernel.org>
Message-ID: <1557222442-8484-2-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

This enables csky to be built with generated toolchain:
 - gcc 6.3
 - binutils 2.27
 - gdb 7.12
 - glibc 2.28

All of them has been tested with csky gitlab-ci based on buildroot:
 - https://gitlab.com/c-sky/buildroot/pipelines

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/Config.in                          | 1 -
 package/Makefile.in                     | 9 +++++++++
 package/binutils/binutils.hash          | 2 ++
 package/binutils/binutils.mk            | 8 ++++++++
 package/gcc/Config.in.host              | 7 +++++++
 package/gcc/gcc.hash                    | 2 ++
 package/gcc/gcc.mk                      | 4 ++++
 package/gdb/Config.in.host              | 1 +
 package/gdb/gdb.hash                    | 2 ++
 package/gdb/gdb.mk                      | 7 +++++++
 package/glibc/glibc.hash                | 2 ++
 package/glibc/glibc.mk                  | 3 +++
 support/gnuconfig/config.sub            | 2 ++
 toolchain/toolchain-buildroot/Config.in | 2 +-
 14 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index d82803c..db1199c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -77,7 +77,6 @@ config BR2_aarch64_be
 
 config BR2_csky
 	bool "csky"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  csky is processor IP from china.
diff --git a/package/Makefile.in b/package/Makefile.in
index dc818a2..f05b9cc 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -70,6 +70,15 @@ ABI := $(ABI)hf
 endif
 endif
 
+# For C-SKY abiv1 & abiv2
+ifeq ($(BR2_csky),y)
+ifeq ($(BR2_ck610),y)
+ABI = abiv1
+else
+ABI = abiv2
+endif
+endif
+
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_powerpc_SPE),y)
 ABI = spe
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 039e368..9f8b419 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,3 +5,5 @@ sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724a
 
 # Locally calculated (fetched from Github)
 sha512  a96dfcea6064fcd1aac1333ac0d631491bed8b0be9bdcf62f1447909c8f30d2cb8d9323ffeb7c9ad6b326ecddb72e3d28281684e73343189d0a4a37a11aef62f  binutils-gdb-arc-2018.09-release.tar.gz
+# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
+sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c70ba13..cebfd06 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -20,6 +20,14 @@ BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
+
+ifeq ($(BR2_csky),y)
+BINUTILS_VERSION = c66d8bbcebfddf713b2b436e1b135e6b125a55a5
+BINUTILS_SITE = $(call github,c-sky,binutils-gdb,$(BINUTILS_VERSION))
+BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
+BINUTILS_FROM_GIT = y
+endif
+
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8e22a4c..3f82696 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,6 +3,7 @@ comment "GCC Options"
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
+	default BR2_GCC_VERSION_CSKY if BR2_csky
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
 	default BR2_GCC_VERSION_7_X
 	help
@@ -14,6 +15,12 @@ config BR2_GCC_VERSION_ARC
 	depends on BR2_arc
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
+config BR2_GCC_VERSION_CSKY
+	bool "gcc csky"
+	# Only supported architecture
+	depends on BR2_csky
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+
 config BR2_GCC_VERSION_OR1K
 	bool "gcc or1k (5.x)"
 	# Only supported architecture
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 4f1e7f9..780484d 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -13,3 +13,5 @@ sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8
 sha512  4d12c3ac27b9de9c533be3b8964cf23d21bf6933b5073183e1affe714b0ff33f9d6169e3b55a5c505d7dae33c9bb4f8b0d110461e3a124182d8c8d51b66b8e45  gcc-arc-2018.09-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
+# Locally calculated (fetched from https://github.com/c-sky/gcc)
+sha512  1c3564fd6573dce13451a73015e7d88fecbb214dc1df96607976255b1d8b9e60318405333f4f218eea8d07e3675a802b66eff6df3921d505c4036481512792c2  gcc-48152afb96c59733d5bc79e3399bb7b3d4b44266.tar.gz
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5901624..fd77adc 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -16,6 +16,10 @@ GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else ifeq ($(BR2_or1k),y)
 GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
+else ifeq ($(BR2_csky),y)
+GCC_VERSION = 48152afb96c59733d5bc79e3399bb7b3d4b44266
+GCC_SITE = $(call github,c-sky,gcc,$(GCC_VERSION))
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 # From version 5.5.0, 6.4.0, 7.2.0 and 8.1.0 a bz2 release tarball is not
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 969168f..0aa7d0a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -48,6 +48,7 @@ choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_8_1
 	depends on !BR2_arc
+	depends on !BR2_csky
 	help
 	  Select the version of gdb you wish to use.
 
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 1104da5..90a60b0 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -6,3 +6,5 @@ sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5
 
 # Locally calculated (fetched from Github)
 sha512  8303e399e396f5c15dc976e48503fc7d45a720dd1a470443f755c5f2458d092b4392e7ae582abc251bc4b43a778ad784f764286a2a05abfc1649cbeeeb6e7d15 	gdb-arc-2018.09-release-gdb.tar.gz
+# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
+sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b	gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index a926961..460d21f 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -14,6 +14,13 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
+ifeq ($(BR2_csky),y)
+GDB_VERSION = 4ecb98fbc2f94dbe01b69384afbc515107de73df
+GDB_SITE = $(call github,c-sky,binutils-gdb,$(GDB_VERSION))
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+GDB_FROM_GIT = y
+endif
+
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 5316f03..6e47559 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,2 +1,4 @@
 # This hash file is not used; instead, update the
 # hash files in the per-version sub-directories.
+# Locally calculated (fetched from https://github.com/c-sky/glibc)
+sha512 9deb2deceefe347d72de13510a5baa3de00f94c684f3b25e136ca3660f61e65a69f2115abb488c2ab0fa93cda8535853ce1e13e186efcc8434ecc4049efd82b5  glibc-7630ed2fa60caea98f500e4a7a51b88f9bf1e176.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0345f1f..c4ddf8b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,6 +10,9 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else ifeq ($(BR2_RISCV_32),y)
 GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
 GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
+else ifeq ($(BR2_csky),y)
+GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
+GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 6d86a1e..45dd0a7 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -254,6 +254,7 @@ case $basic_machine in
 	| arc | arceb \
 	| arm | arm[bl]e | arme[lb] | armv[2-8] | armv[3-8][lb] | armv7[arm] \
 	| avr | avr32 \
+	| csky \
 	| ba \
 	| be32 | be64 \
 	| bfin \
@@ -376,6 +377,7 @@ case $basic_machine in
 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* | arceb-* \
 	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
 	| avr-* | avr32-* \
+	| csky-* \
 	| ba-* \
 	| be32-* | be64-* \
 	| bfin-* | bs2000-* \
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index beb17a2..d9f16e2 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
 		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
-		   (BR2_arcle && BR2_ARC_ATOMIC_EXT)
+		   (BR2_arcle && BR2_ARC_ATOMIC_EXT) || BR2_csky
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-- 
2.7.4
