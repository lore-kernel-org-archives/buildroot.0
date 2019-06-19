From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 13:49:46 +0200
Subject: [Buildroot] [git commit] toolchain: bump ARC tools to arc-2019.03
 release
Message-ID: <20190619114918.D2DEB8225E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be0aaaaecda56d16acf99a38319293913fd1e0b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit finally bumps ARC tools to the most recent arc-2019.03 release version.

ARC GNU tools of version arc-2019.03 bring some quite significant changes like:
 * Binutils v2.32.51.20190308 with additional ARC patches
 * GCC 8.3.1 with additional ARC patches
 * glibc 2.29 with additional ARC patches

More information on this release could be found here:
 https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2019.03-release

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host                                       | 2 +-
 .../0001-poison-system-directories.patch                              | 0
 package/binutils/binutils.hash                                        | 2 +-
 package/binutils/binutils.mk                                          | 4 ++--
 package/gcc/Config.in.host                                            | 2 +-
 .../{arc-2019.03-rc1 => arc-2019.03-release}/0100-uclibc-conf.patch   | 0
 package/gcc/gcc.hash                                                  | 2 +-
 package/gdb/Config.in.host                                            | 2 +-
 package/gdb/gdb.hash                                                  | 2 +-
 package/glibc/{arc-2019.03-rc1 => arc-2019.03-release}/glibc.hash     | 2 +-
 package/glibc/glibc.mk                                                | 2 +-
 11 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index d9b34d7a9b..c5daee7f95 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -37,7 +37,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2019.03-rc1"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2019.03-release"	if BR2_BINUTILS_VERSION_ARC
 	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
diff --git a/package/binutils/arc-2019.03-rc1/0001-poison-system-directories.patch b/package/binutils/arc-2019.03-release/0001-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2019.03-rc1/0001-poison-system-directories.patch
rename to package/binutils/arc-2019.03-release/0001-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 125372cc6f..4b747fc2b0 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,7 +4,7 @@ sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe13
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  ceb0546cb73a29526f2f8916d855fbed52b2fc86b6706687cabf57b96df06932714820edec2f9038529790e7925304778ded0944babc985a39371eb08c6c7f52  binutils-gdb-arc-2019.03-rc1.tar.gz
+sha512  e2d8c109ed006eb143bab8360c9e29287c05a0b273448d256edee7458e356d45b27c9869ca6be96206df360c24ba607b21c185190d3a4731999dad515b157c18  binutils-gdb-arc-2019.03-release.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index edb4be1869..d60c032bde 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,13 +9,13 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2019.03-rc1
+BINUTILS_VERSION = arc-2019.03-release
 else
 BINUTILS_VERSION = 2.31.1
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2019.03-rc1)
+ifeq ($(BINUTILS_VERSION),arc-2019.03-release)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bf22d1b843..e451ed9ba9 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -98,7 +98,7 @@ config BR2_GCC_VERSION
 	default "6.5.0"     if BR2_GCC_VERSION_6_X
 	default "7.4.0"     if BR2_GCC_VERSION_7_X
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
-	default "arc-2019.03-rc1" if BR2_GCC_VERSION_ARC
+	default "arc-2019.03-release" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
diff --git a/package/gcc/arc-2019.03-rc1/0100-uclibc-conf.patch b/package/gcc/arc-2019.03-release/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2019.03-rc1/0100-uclibc-conf.patch
rename to package/gcc/arc-2019.03-release/0100-uclibc-conf.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 09926f3b91..3f68e6758f 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -10,7 +10,7 @@ sha512  8864d8e4b97c2e1a4f17422f6e68120172ebefeab97b1757734f7185ca68a6b9a89011c6
 sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8dfe7e10be2276b4f62c357659ce2902f239f60a8648548231b4b5802  gcc-8.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  5b80cfa987f615659ccfbd4b3f0cea5a28d8464398b5f7163d9cfad2fec1b15e8e6575628f3f6094a1081be9d4f521ca33795105d1d12295c7207935f51603c0  gcc-arc-2019.03-rc1.tar.gz
+sha512  c3f63fb601140f92d2dbef96b2dcc025ef754d2f049bfcc3d33e746c7b218b5138f2d8768cd580134858a8d347d234cf3ead276638f6de409f8f07c986e136b6  gcc-arc-2019.03-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
 # Locally calculated (fetched from https://github.com/c-sky/gcc)
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 6c17ceb0b2..8257fd4479 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -96,7 +96,7 @@ config BR2_PACKAGE_GDB_NEEDS_CXX11
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2019.03-rc1-gdb" if BR2_arc
+	default "arc-2019.03-release-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.1.1"    if BR2_GDB_VERSION_8_1
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index e032cc8f70..c08de39962 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,7 +5,7 @@ sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5
 sha512  47ac074d20a09a3fac8f4a41dce0a0cbe6ef702f7dc21ba8b7d650d306128dcae481e9a16bf65e596b3a541dc82ae57c02bcbb786d551b4ef3e2917b9b6f0ae1	gdb-8.3.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  bc6dcd92991222418795c49b8fc13df7354b34ba7a7f1e4214b108776da0dad730259aa4611086694bc9291126f5182b449bbc22409aeadc44b89e7a42fb4e00 	gdb-arc-2019.03-rc1-gdb.tar.gz
+sha512  45b4610b92d4c9fb8c3f516c0e86867f34dfd9e47af3af582b1470f2e4bcb04070dd8d69e033dc758e5587f012b9f472572c5075b3331d9d574bdc3edb9b11f9 	gdb-arc-2019.03-release-gdb.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b	gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
diff --git a/package/glibc/arc-2019.03-rc1/glibc.hash b/package/glibc/arc-2019.03-release/glibc.hash
similarity index 75%
rename from package/glibc/arc-2019.03-rc1/glibc.hash
rename to package/glibc/arc-2019.03-release/glibc.hash
index 1368086acc..2fa706dc86 100644
--- a/package/glibc/arc-2019.03-rc1/glibc.hash
+++ b/package/glibc/arc-2019.03-release/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  8cd0fed7993c4e0b9ac8401fbe2a99bc11fe233d1e49957db5b766e973169221  glibc-arc-2019.03-rc1.tar.gz
+sha256  d8fd15462475f7e268147903cd7811705707b9bd9b29cd9dfe9a941ba48c7ea2  glibc-arc-2019.03-release.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 26873f3101..f8d8c1bd87 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2019.03-rc1
+GLIBC_VERSION =  arc-2019.03-release
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_RISCV_32),y)
 GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
