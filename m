From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 23:13:20 +0100
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
 arc-2018.09-rc2
Message-ID: <20181202071556.D768C8843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c786ca2fcbb909a6d3d16200dec5ea96be0ecb51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps ARC toolchain to arc-2018.09-rc2,
which includes significant changes since arc-2018.09-rc1.
We want to test how new toolchain-rc2 builds packages,
so we can make fixes before release of toolcain.
This makes us closer to toolchain release which will be in a few weeks.

Please note that it is a release candidate and it might
contain some breakages, please don't use it for production builds.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                                       | 2 +-
 .../0005-poison-system-directories.patch                              | 0
 package/binutils/binutils.hash                                        | 2 +-
 package/binutils/binutils.mk                                          | 4 ++--
 package/gcc/Config.in.host                                            | 2 +-
 .../gcc/{arc-2018.09-rc1 => arc-2018.09-rc2}/0100-uclibc-conf.patch   | 0
 package/gcc/gcc.hash                                                  | 2 +-
 package/gdb/Config.in.host                                            | 2 +-
 package/gdb/gdb.hash                                                  | 2 +-
 package/glibc/{arc-2018.09-rc1 => arc-2018.09-rc2}/glibc.hash         | 2 +-
 package/glibc/glibc.mk                                                | 2 +-
 11 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index b8901210be..dd50d11659 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -37,7 +37,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2018.09-rc1"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2018.09-rc2"	if BR2_BINUTILS_VERSION_ARC
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
diff --git a/package/binutils/arc-2018.09-rc1/0005-poison-system-directories.patch b/package/binutils/arc-2018.09-rc2/0005-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2018.09-rc1/0005-poison-system-directories.patch
rename to package/binutils/arc-2018.09-rc2/0005-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 01d029abf6..d3771bdd92 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,4 +5,4 @@ sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b19
 sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe1314b1b8f8a29c0aa9d88162849ee1c1a3e70c2f7407d88339b17edb30  binutils-2.31.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  c28c84a725f1fb81ede687c62d61f6a086f389415426a63f0b7b9923f8ab581b64982c37e7e30dc5f7c4ec106eaff61988ef886a91328d8b8eaba2c76ce6d63d  binutils-arc-2018.09-rc1.tar.gz
+sha512  cd83f6673a216755919021c9b986869cd16af20b69b43897130db1dc42de417da49f481e00733d8b0aee84afb02730db597b549ed8caaccbd1f22b8ce340d385  binutils-arc-2018.09-rc2.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 8b83aa9e56..115e5308b7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,13 +9,13 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2018.09-rc1
+BINUTILS_VERSION = arc-2018.09-rc2
 else
 BINUTILS_VERSION = 2.29.1
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2018.09-rc1)
+ifeq ($(BINUTILS_VERSION),arc-2018.09-rc2)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6fcd1f1e65..4f3a322402 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -85,7 +85,7 @@ config BR2_GCC_VERSION
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
 	default "7.3.0"     if BR2_GCC_VERSION_7_X
 	default "8.2.0"     if BR2_GCC_VERSION_8_X
-	default "arc-2018.09-rc1" if BR2_GCC_VERSION_ARC
+	default "arc-2018.09-rc2" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2018.09-rc1/0100-uclibc-conf.patch b/package/gcc/arc-2018.09-rc2/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2018.09-rc1/0100-uclibc-conf.patch
rename to package/gcc/arc-2018.09-rc2/0100-uclibc-conf.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index bde5ae9f85..5dd15c5f8d 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -10,6 +10,6 @@ sha512  ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19
 sha512  64898a165f67e136d802a92e7633bf1b06c85266027e52127ea025bf5fc2291b5e858288aac0bdba246e6cdf7c6ec88bc8e0e7f3f6f1985f4297710cafde56ed  gcc-8.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  13b876c8397fd73ad8e41220f4467a9f22cd97e1d075c114a6247e81c3330830522bbe1befc4be7021aeb588416248fdd0738ba63dace39451fc4757d17befcf  gcc-arc-2018.09-rc1.tar.gz
+sha512  6602534598e317e18265622faea72a195fc428ae8d54062a2e8a713eecf12e41d0b19b55caa1abd316336e3f421f4bf49c849dda5ae65c9c4a3675b9f02278bc  gcc-arc-2018.09-rc2.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a2c2303594..a04336910e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -93,7 +93,7 @@ config BR2_PACKAGE_GDB_NEEDS_CXX11
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2018.09-rc1-gdb" if BR2_arc
+	default "arc-2018.09-rc2-gdb" if BR2_arc
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
 	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index aa6544b46c..01dcf6f0c1 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e
 sha512  11cc481bebc51eb6db73249ecb62b8c07455cf3db169f4860b3a83114849fbd2b5860a2db64488ba6c5909cf07b255c04770f1e36059eae6bee16d2a3581be90	gdb-8.2.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  c263782d64650352a5d9009883391a80a04298938aa02a8cbf90f7dbd58b5e92d81acf71df3e9f80e9f26dc125e66890486d7c2d07f78608b75de01d8e1cf2fe 	gdb-arc-2018.09-rc1-gdb.tar.gz
+sha512  ea22eabaddf779e818ead5a2d10543b58f70ca95ae491e67167f0a1b510201003422b293f828af6b72a83b0e4ab7db7807f935151cbd34b82177a99a0c2b6712 	gdb-arc-2018.09-rc2-gdb.tar.gz
diff --git a/package/glibc/arc-2018.09-rc1/glibc.hash b/package/glibc/arc-2018.09-rc2/glibc.hash
similarity index 75%
rename from package/glibc/arc-2018.09-rc1/glibc.hash
rename to package/glibc/arc-2018.09-rc2/glibc.hash
index 4fc89c2823..4a8c4eae2b 100644
--- a/package/glibc/arc-2018.09-rc1/glibc.hash
+++ b/package/glibc/arc-2018.09-rc2/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  b7a6c16f06e1296a64edf5aa4394d82d76719ea8c2af73a72616a030cb3d475d  glibc-arc-2018.09-rc1.tar.gz
+sha256  017dce426a4f4db2d77783e318c32f29b75b01e231f65052e10c7d935b8b22e3  glibc-arc-2018.09-rc2.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f68760059b..2db9d29892 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2018.09-rc1
+GLIBC_VERSION =  arc-2018.09-rc2
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
