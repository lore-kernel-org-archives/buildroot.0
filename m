From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 19:17:42 +0200
Subject: [Buildroot] [git commit branch/next] toolchain: bump ARC tools to
 arc-2019.03-rc1
Message-ID: <20190514171615.4BC408916A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08c330c46404d66886f318aca664ec4b51e85345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit bumps ARC toolchain to arc-2019.03-rc1.  We want to test
how new toolchain-rc1 builds packages, so we can make fixes before
release of toolcain.

ARC GNU tools of version arc-2019.03-rc1 bring some quite significant
changes like:
* Binutils v2.32.51.20190308 with additional ARC patches
* GCC 8.3.1 with additional ARC patches
* glibc 2.29 with additional ARC patches

Please note that it is a release candidate and it might contain some
breakages, please don't use it for production builds.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host                                       | 2 +-
 .../0001-poison-system-directories.patch}                             | 0
 package/binutils/binutils.hash                                        | 2 +-
 package/binutils/binutils.mk                                          | 4 ++--
 package/gcc/Config.in.host                                            | 2 +-
 .../{arc-2018.09-release => arc-2019.03-rc1}/0100-uclibc-conf.patch   | 0
 package/gcc/gcc.hash                                                  | 2 +-
 package/gdb/Config.in.host                                            | 2 +-
 package/gdb/gdb.hash                                                  | 2 +-
 package/glibc/{arc-2018.09-release => arc-2019.03-rc1}/glibc.hash     | 2 +-
 package/glibc/glibc.mk                                                | 2 +-
 11 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index c3c3beb420..52b0ea22e7 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,7 +28,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2018.09-release"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2019.03-rc1"	if BR2_BINUTILS_VERSION_ARC
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
diff --git a/package/binutils/arc-2018.09-release/0005-poison-system-directories.patch b/package/binutils/arc-2019.03-rc1/0001-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2018.09-release/0005-poison-system-directories.patch
rename to package/binutils/arc-2019.03-rc1/0001-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 039e3682f6..4792208e45 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe13
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  a96dfcea6064fcd1aac1333ac0d631491bed8b0be9bdcf62f1447909c8f30d2cb8d9323ffeb7c9ad6b326ecddb72e3d28281684e73343189d0a4a37a11aef62f  binutils-gdb-arc-2018.09-release.tar.gz
+sha512  ceb0546cb73a29526f2f8916d855fbed52b2fc86b6706687cabf57b96df06932714820edec2f9038529790e7925304778ded0944babc985a39371eb08c6c7f52  binutils-gdb-arc-2019.03-rc1.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c70ba13b04..0b06f49d72 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,13 +9,13 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2018.09-release
+BINUTILS_VERSION = arc-2019.03-rc1
 else
 BINUTILS_VERSION = 2.31.1
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2018.09-release)
+ifeq ($(BINUTILS_VERSION),arc-2019.03-rc1)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8e22a4c155..effb113925 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -83,7 +83,7 @@ config BR2_GCC_VERSION
 	default "6.5.0"     if BR2_GCC_VERSION_6_X
 	default "7.4.0"     if BR2_GCC_VERSION_7_X
 	default "8.3.0"     if BR2_GCC_VERSION_8_X
-	default "arc-2018.09-release" if BR2_GCC_VERSION_ARC
+	default "arc-2019.03-rc1" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2018.09-release/0100-uclibc-conf.patch b/package/gcc/arc-2019.03-rc1/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2018.09-release/0100-uclibc-conf.patch
rename to package/gcc/arc-2019.03-rc1/0100-uclibc-conf.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 4f1e7f932f..74bbd3cfbf 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -10,6 +10,6 @@ sha512  8864d8e4b97c2e1a4f17422f6e68120172ebefeab97b1757734f7185ca68a6b9a89011c6
 sha512  1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8dfe7e10be2276b4f62c357659ce2902f239f60a8648548231b4b5802  gcc-8.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  4d12c3ac27b9de9c533be3b8964cf23d21bf6933b5073183e1affe714b0ff33f9d6169e3b55a5c505d7dae33c9bb4f8b0d110461e3a124182d8c8d51b66b8e45  gcc-arc-2018.09-release.tar.gz
+sha512  5b80cfa987f615659ccfbd4b3f0cea5a28d8464398b5f7163d9cfad2fec1b15e8e6575628f3f6094a1081be9d4f521ca33795105d1d12295c7207935f51603c0  gcc-arc-2019.03-rc1.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 969168ffa2..9fdb0548b6 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -94,7 +94,7 @@ config BR2_PACKAGE_GDB_NEEDS_CXX11
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2018.09-release-gdb" if BR2_arc
+	default "arc-2019.03-rc1-gdb" if BR2_arc
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
 	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 1104da5dc4..9b7517eabf 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e
 sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11	gdb-8.2.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  8303e399e396f5c15dc976e48503fc7d45a720dd1a470443f755c5f2458d092b4392e7ae582abc251bc4b43a778ad784f764286a2a05abfc1649cbeeeb6e7d15 	gdb-arc-2018.09-release-gdb.tar.gz
+sha512  bc6dcd92991222418795c49b8fc13df7354b34ba7a7f1e4214b108776da0dad730259aa4611086694bc9291126f5182b449bbc22409aeadc44b89e7a42fb4e00 	gdb-arc-2019.03-rc1-gdb.tar.gz
diff --git a/package/glibc/arc-2018.09-release/glibc.hash b/package/glibc/arc-2019.03-rc1/glibc.hash
similarity index 75%
rename from package/glibc/arc-2018.09-release/glibc.hash
rename to package/glibc/arc-2019.03-rc1/glibc.hash
index 8e70ce0436..1368086acc 100644
--- a/package/glibc/arc-2018.09-release/glibc.hash
+++ b/package/glibc/arc-2019.03-rc1/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  cc2aa6b16641ebcf1492bf6245897d8c263c96b6e30375d09351306a12b6d529  glibc-arc-2018.09-release.tar.gz
+sha256  8cd0fed7993c4e0b9ac8401fbe2a99bc11fe233d1e49957db5b766e973169221  glibc-arc-2019.03-rc1.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0345f1f392..9cfca73e85 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2018.09-release
+GLIBC_VERSION =  arc-2019.03-rc1
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_RISCV_32),y)
 GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
