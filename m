From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Fri, 17 Apr 2020 22:03:41 +0300
Subject: [Buildroot] [PATCH] toolchain: bump ARC tools to arc-2020.03-rc1
Message-ID: <20200417190341.22404-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps ARC toolchain to arc-2020.03-rc1.  We want to test
how new toolchain-rc1 builds packages, so we can make fixes before
release of toolcain.

ARC GNU tools of version arc-2020.03-rc1 bring some quite significant
changes like:
* Binutils 2.34 with additional ARC patches
* GCC 9.3 with additional ARC patches
* glibc 2.30 with additional ARC patches
* GDB 10-prerelease with additional ARC patches

Please note that it is a release candidate and it might contain some
breakages, please don't use it for production builds.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
This commit is a replacement of previous patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20200406140719.41518-1-Evgeniy.Didin at synopsys.com/

 package/binutils/Config.in.host                                    | 2 +-
 .../0001-poison-system-directories.patch                           | 7 ++++---
 package/binutils/binutils.hash                                     | 2 +-
 package/binutils/binutils.mk                                       | 4 ++--
 package/gcc/Config.in.host                                         | 2 +-
 .../0100-uclibc-conf.patch                                         | 0
 package/gcc/gcc.hash                                               | 2 +-
 package/gdb/Config.in.host                                         | 2 +-
 package/gdb/gdb.hash                                               | 2 +-
 package/glibc/{arc-2019.09-release => arc-2020.03-rc1}/glibc.hash  | 2 +-
 package/glibc/glibc.mk                                             | 2 +-
 11 files changed, 14 insertions(+), 13 deletions(-)
 rename package/binutils/{arc-2019.09-release => arc-2020.03-rc1}/0001-poison-system-directories.patch (98%)
 rename package/gcc/{arc-2019.09-release => arc-2020.03-rc1}/0100-uclibc-conf.patch (100%)
 rename package/glibc/{arc-2019.09-release => arc-2020.03-rc1}/glibc.hash (75%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 9beabe357c..02d5d99b2d 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -40,7 +40,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2019.09-release"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2020.03-rc1"	if BR2_BINUTILS_VERSION_ARC
 	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
diff --git a/package/binutils/arc-2019.09-release/0001-poison-system-directories.patch b/package/binutils/arc-2020.03-rc1/0001-poison-system-directories.patch
similarity index 98%
rename from package/binutils/arc-2019.09-release/0001-poison-system-directories.patch
rename to package/binutils/arc-2020.03-rc1/0001-poison-system-directories.patch
index f6a78c7cdd..7a76ef2963 100644
--- a/package/binutils/arc-2019.09-release/0001-poison-system-directories.patch
+++ b/package/binutils/arc-2020.03-rc1/0001-poison-system-directories.patch
@@ -229,13 +229,14 @@ diff --git a/ld/ldlex.h b/ld/ldlex.h
 index 32a7a6409e8..c02b64bf92f 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -150,6 +150,8 @@ enum option_values
-   OPTION_FORCE_GROUP_ALLOCATION,
-   OPTION_PRINT_MAP_DISCARDED,
+@@ -152,6 +152,8 @@ enum option_values
    OPTION_NO_PRINT_MAP_DISCARDED,
+   OPTION_NON_CONTIGUOUS_REGIONS,
+   OPTION_NON_CONTIGUOUS_REGIONS_WARNINGS,
 +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
 +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
  };
+
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 797dd5b923..c17ff12bf5 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,7 +4,7 @@ sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724a
 sha512  b7a6767c6c7ca6b5cafa7080e6820b7bb3a53b7148348c438d99905defbdf0d30c9744a484ee01c9441a8153901808513366b15ba9533e20c9673c262ade36ac  binutils-2.33.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  33ac5ad662db551870193f5c76c35a18de465adfa1c7f4bf5c1bb4145805a47507bf11ec21eb446b52f91f70cfe392252dd2b02724dc9dad3505258e3f6f4d45  binutils-gdb-arc-2019.09-release.tar.gz
+sha512  66928e610799835dbbfbc475006ab1b771992ef735ab2b184f11329f04561a6488458032ea131f9352d94972a7f1c11411cdf170bef3d2bc46e8074d3b6d73d4  binutils-gdb-arc-2020.03-rc1.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 876c9c59f8..4d157442f1 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,13 +9,13 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2019.09-release
+BINUTILS_VERSION = arc-2020.03-rc1
 else
 BINUTILS_VERSION = 2.32
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2019.09-release)
+ifeq ($(BINUTILS_VERSION),arc-2020.03-rc1)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 034dfb5463..8859532fa6 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -75,7 +75,7 @@ config BR2_GCC_VERSION
 	default "7.5.0"     if BR2_GCC_VERSION_7_X
 	default "8.4.0"     if BR2_GCC_VERSION_8_X
 	default "9.3.0"     if BR2_GCC_VERSION_9_X
-	default "arc-2019.09-release" if BR2_GCC_VERSION_ARC
+	default "arc-2020.03-rc1" if BR2_GCC_VERSION_ARC
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2019.09-release/0100-uclibc-conf.patch b/package/gcc/arc-2020.03-rc1/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2019.09-release/0100-uclibc-conf.patch
rename to package/gcc/arc-2020.03-rc1/0100-uclibc-conf.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 321b3767ab..6240eea56c 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,7 +6,7 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  4b9e3639eef6e623747a22c37a904b4750c93b6da77cf3958d5047e9b5ebddb7eebe091cc16ca0a227c0ecbd2bf3b984b221130f269a97ee4cc18f9cf6c444de  gcc-9.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  84648d13f174102733e06ccdf7b351150babe06af0f2b99b8dfb2b2d3c3f13e424547349939806fe19932ad347977cad79cd8b37be9cbb03e6a4d03cdf95a72e  gcc-arc-2019.09-release.tar.gz
+sha512  8ae6aaad6c9c20f547a53640cacfdf5070477b0211cb3fadad6b8aa499059803cd5438a45ef194d3e9388c51770dafa9253bcb9a5ab87406adca5bc1669e9706  gcc-arc-2020.03-rc1.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
 # Locally calculated (fetched from https://github.com/c-sky/gcc)
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 2db73b10d6..836184f5a2 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -67,7 +67,7 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2019.09-release-gdb" if BR2_arc
+	default "arc-2020.03-rc1-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "8.1.1"    if BR2_GDB_VERSION_8_1
 	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 60b0954ff9..547d2f3e40 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -4,7 +4,7 @@ sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5
 sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b127fff000b65c334826ff8304a54ff6098428365a8e997cca886c39e9a  gdb-8.3.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  c33818f8679d99d5315220578864b04b87f69c46ebe62472809ee6e1d260e5ec84d598f38d80c127a2045d6624f28803c2720d89434204acbd94e988a45870f1  gdb-arc-2019.09-release-gdb.tar.gz
+sha512  eff3cd4b7f54de822d7e9018ab770ee4a6f7c51c5f144c53afe1da5830ca716a4b55e8b599a8bf74f15747f9c359dc04ddbfecf5a0afa94fd7d107d59213a526  gdb-arc-2020.03-rc1-gdb.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b  gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
diff --git a/package/glibc/arc-2019.09-release/glibc.hash b/package/glibc/arc-2020.03-rc1/glibc.hash
similarity index 75%
rename from package/glibc/arc-2019.09-release/glibc.hash
rename to package/glibc/arc-2020.03-rc1/glibc.hash
index 296035c495..7813313940 100644
--- a/package/glibc/arc-2019.09-release/glibc.hash
+++ b/package/glibc/arc-2020.03-rc1/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  0e0fd7603938fd8ebd793385a3d72c6e1fba22e16a600a16cc953a93f0e85943  glibc-arc-2019.09-release.tar.gz
+sha256  a57a62d6e41e5416cc2c0538fc732598f5eba9e395d99ea699b83947867f2e38  glibc-arc-2020.03-rc1.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 2ca73343b3..dcf36c5d93 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2019.09-release
+GLIBC_VERSION =  arc-2020.03-rc1
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_RISCV_32),y)
 GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
-- 
2.16.2
