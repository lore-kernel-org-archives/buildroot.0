From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu,  6 Dec 2018 17:17:33 +0300
Subject: [Buildroot] [PATCH] toolchain: Fix URL's for ARC gcc/binutils/gdb
Message-ID: <20181206141733.4059-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In recent Update-ARC-toolchain patches URL's for GCC, Binutils and
GDB are mistakenly pointing to HEAD of the corresponding branches. 
This patch fixes mistake and for ARC toolchain switches GCC, Binutils 
and GDB to fixed "release" tags.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
 package/binutils/Config.in.host                                     | 2 +-
 .../0005-poison-system-directories.patch                            | 0
 package/binutils/binutils.hash                                      | 2 +-
 package/binutils/binutils.mk                                        | 6 +++---
 package/gcc/Config.in.host                                          | 2 +-
 .../gcc/{arc-2018.09 => arc-2018.09-release}/0100-uclibc-conf.patch | 0
 package/gcc/gcc.hash                                                | 2 +-
 package/gdb/Config.in.host                                          | 2 +-
 package/gdb/gdb.hash                                                | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename package/binutils/{arc-2018.09 => arc-2018.09-release}/0005-poison-system-directories.patch (100%)
 rename package/gcc/{arc-2018.09 => arc-2018.09-release}/0100-uclibc-conf.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index faf9ae0508..924d1749cd 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -37,7 +37,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2018.09"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2018.09-release"	if BR2_BINUTILS_VERSION_ARC
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
diff --git a/package/binutils/arc-2018.09/0005-poison-system-directories.patch b/package/binutils/arc-2018.09-release/0005-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2018.09/0005-poison-system-directories.patch
rename to package/binutils/arc-2018.09-release/0005-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 335bb751fb..ac0831ca27 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,4 +5,4 @@ sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b19
 sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe1314b1b8f8a29c0aa9d88162849ee1c1a3e70c2f7407d88339b17edb30  binutils-2.31.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  5db8f749bfaf4d688ad3429018cbf2b5448b69d8f14a99e00df309d96735eae03da49b82ed38e4b2602c2da5b1b26b7453986b108e1898aff07cdef511802cdb  binutils-arc-2018.09.tar.gz
+sha512  a96dfcea6064fcd1aac1333ac0d631491bed8b0be9bdcf62f1447909c8f30d2cb8d9323ffeb7c9ad6b326ecddb72e3d28281684e73343189d0a4a37a11aef62f  binutils-gdb-arc-2018.09-release.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 10657e562f..4531b8d9c8 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,15 +9,15 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2018.09
+BINUTILS_VERSION = arc-2018.09-release
 else
 BINUTILS_VERSION = 2.29.1
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2018.09)
+ifeq ($(BINUTILS_VERSION),arc-2018.09-release)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
-BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
+BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 58247367ec..55a9c8b69f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -85,7 +85,7 @@ config BR2_GCC_VERSION
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
 	default "7.3.0"     if BR2_GCC_VERSION_7_X
 	default "8.2.0"     if BR2_GCC_VERSION_8_X
-	default "arc-2018.09" if BR2_GCC_VERSION_ARC
+	default "arc-2018.09-release" if BR2_GCC_VERSION_ARC
 	default "or1k-musl-5.4.0-20170218" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2018.09/0100-uclibc-conf.patch b/package/gcc/arc-2018.09-release/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2018.09/0100-uclibc-conf.patch
rename to package/gcc/arc-2018.09-release/0100-uclibc-conf.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 042795261b..9f671b657a 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -10,6 +10,6 @@ sha512  ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19
 sha512  64898a165f67e136d802a92e7633bf1b06c85266027e52127ea025bf5fc2291b5e858288aac0bdba246e6cdf7c6ec88bc8e0e7f3f6f1985f4297710cafde56ed  gcc-8.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  f28a5d3606202c7f93951aaa084e3b9d55fd95fc64bbb96e910c9d90e695d40adca544bfb20296292610926b883f1e263cd0ca35e87ad4f96802842cbfcfd03b  gcc-arc-2018.09.tar.gz
+sha512  4d12c3ac27b9de9c533be3b8964cf23d21bf6933b5073183e1affe714b0ff33f9d6169e3b55a5c505d7dae33c9bb4f8b0d110461e3a124182d8c8d51b66b8e45  gcc-arc-2018.09-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 28d325be1b..4072dc8074 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -94,7 +94,7 @@ config BR2_PACKAGE_GDB_NEEDS_CXX11
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2018.09-gdb" if BR2_arc
+	default "arc-2018.09-release-gdb" if BR2_arc
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
 	default "8.1.1"    if BR2_GDB_VERSION_8_1 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 3540492ac8..50c1c2380e 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e
 sha512  11cc481bebc51eb6db73249ecb62b8c07455cf3db169f4860b3a83114849fbd2b5860a2db64488ba6c5909cf07b255c04770f1e36059eae6bee16d2a3581be90	gdb-8.2.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  e35cbf8ac80af61ce1497f46d5fe226bb6abb866e6b53ab79b83be5f052f0d2b66b6789bf4c49d45f634d9747a1f6b88585c711c0e2796353cadef85badbd895 	gdb-arc-2018.09-gdb.tar.gz
+sha512  8303e399e396f5c15dc976e48503fc7d45a720dd1a470443f755c5f2458d092b4392e7ae582abc251bc4b43a778ad784f764286a2a05abfc1649cbeeeb6e7d15 	gdb-arc-2018.09-release-gdb.tar.gz
-- 
2.16.2
