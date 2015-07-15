From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 15 Jul 2015 15:51:18 +0300
Subject: [Buildroot] [PATCH] ARC: update tools to arc-2015.06 release
Message-ID: <1436964678-24352-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm happy to update GNU tools for ARC cores to the most recent
arc-2015.06 release.

This release brings following major improvements:
 * GCC: source update to v4.8.4
 * GCC: C ABI compatibility between MetaWare and GNU toolchains
 * uClibc: support for thread local storage and Native Pthread Library (NPTL)
 * GDB: updated to version 7.9.1

Also a lot of fixes and improvements has been done, please refer to
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.06
for more details.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@openwide.fr>
---

I hope this time all required pieces are in place :)

---
package/binutils/Config.in.host                                         | 2 +-
 .../binutils/{arc-2015.06-rc1 => arc-2015.06}/0001-PR-other-56780.patch | 0
 .../600-poison-system-directories.patch                                 | 0
 package/binutils/binutils.hash                                          | 2 +-
 package/binutils/binutils.mk                                            | 2 +-
 package/gcc/Config.in.host                                              | 2 +-
 .../gcc/{arc-2015.06-rc1 => arc-2015.06}/100-libstdcxx-uclibc-c99.patch | 0
 package/gcc/{arc-2015.06-rc1 => arc-2015.06}/851-PR-other-56780.patch   | 0
 .../910-gcc-poison-system-directories.patch                             | 0
 package/gcc/gcc.hash                                                    | 2 +-
 package/gdb/Config.in.host                                              | 2 +-
 package/gdb/gdb.hash                                                    | 2 +-
 package/uclibc/Config.in                                                | 2 +-
 package/uclibc/uclibc.hash                                              | 2 +-
 14 files changed, 9 insertions(+), 9 deletions(-)
 rename package/binutils/{arc-2015.06-rc1 => arc-2015.06}/0001-PR-other-56780.patch (100%)
 rename package/binutils/{arc-2015.06-rc1 => arc-2015.06}/600-poison-system-directories.patch (100%)
 rename package/gcc/{arc-2015.06-rc1 => arc-2015.06}/100-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{arc-2015.06-rc1 => arc-2015.06}/851-PR-other-56780.patch (100%)
 rename package/gcc/{arc-2015.06-rc1 => arc-2015.06}/910-gcc-poison-system-directories.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 76e7e77..70253cc 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -24,7 +24,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2015.06-rc1"	if BR2_arc
+	default "arc-2015.06"	if BR2_arc
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24
 	default "2.25"		if BR2_BINUTILS_VERSION_2_25
diff --git a/package/binutils/arc-2015.06-rc1/0001-PR-other-56780.patch b/package/binutils/arc-2015.06/0001-PR-other-56780.patch
similarity index 100%
rename from package/binutils/arc-2015.06-rc1/0001-PR-other-56780.patch
rename to package/binutils/arc-2015.06/0001-PR-other-56780.patch
diff --git a/package/binutils/arc-2015.06-rc1/600-poison-system-directories.patch b/package/binutils/arc-2015.06/600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2015.06-rc1/600-poison-system-directories.patch
rename to package/binutils/arc-2015.06/600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index f662adc..6f45a9c 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
 sha512  49438970642f379978aba988e3d2e7b63dab6fd0b46d91f4100f083e87a84d242089daca58572245fe620457a77bbbe2d78588ff3fb79314e500d1a39bf96f30  binutils-2.25.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none   xxx  binutils-arc-2015.06-rc1.tar.gz
+none   xxx  binutils-arc-2015.06.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 009a900..535c019 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2015.06-rc1
+BINUTILS_VERSION = arc-2015.06
 else
 BINUTILS_VERSION = 2.24
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4501b32..890e728 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -99,7 +99,7 @@ config BR2_GCC_VERSION
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.1.0"     if BR2_GCC_VERSION_5_1_X
-	default "arc-2015.06-rc1" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2015.06" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2015.06-rc1/100-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2015.06/100-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/arc-2015.06-rc1/100-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2015.06/100-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/arc-2015.06-rc1/851-PR-other-56780.patch b/package/gcc/arc-2015.06/851-PR-other-56780.patch
similarity index 100%
rename from package/gcc/arc-2015.06-rc1/851-PR-other-56780.patch
rename to package/gcc/arc-2015.06/851-PR-other-56780.patch
diff --git a/package/gcc/arc-2015.06-rc1/910-gcc-poison-system-directories.patch b/package/gcc/arc-2015.06/910-gcc-poison-system-directories.patch
similarity index 100%
rename from package/gcc/arc-2015.06-rc1/910-gcc-poison-system-directories.patch
rename to package/gcc/arc-2015.06/910-gcc-poison-system-directories.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 1506ad9..d3fe363 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -9,4 +9,4 @@ sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a31
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.1.0/sha512.sum
 sha512  30f6a94d3adb25bc51fcaddf32a6c41429f569eeb9ed64330445b1296f99998fbfa03277b375be4f7b2b80f519910ef88e4149db7cd9031e2c61a49f501bde94  gcc-5.1.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none  xxx  gcc-arc-2015.06-rc1.tar.gz
+none  xxx  gcc-arc-2015.06.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index d2469fc..3207794 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -49,7 +49,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2015.06-rc1-gdb" if BR2_arc
+	default "arc-2015.06-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index cf397d8..a970f0a 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,5 +3,5 @@ sha512	887b9b726dae8f6e3e5e41574460a67e4f9002b0d47bc985dcf63bdf3518397a90b6a208c
 sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e6cfdfd6cbd876ee527c813bddab8df29dc560a6c36694cdb8edc4e4	gdb-7.8.2.tar.xz
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 # No hash for the ARC & microblaze variants, comes from the github-helper:
-none	xxx	gdb-arc-2015.06-rc1-gdb.tar.gz
+none	xxx	gdb-arc-2015.06-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 14f713c..2e00f2f 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -64,7 +64,7 @@ config BR2_USE_UCLIBC_SNAPSHOT
 config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
-	default "arc-2015.06-rc1" if BR2_UCLIBC_VERSION_ARC_GIT
+	default "arc-2015.06" if BR2_UCLIBC_VERSION_ARC_GIT
 	default "1.0.3"		if BR2_UCLIBC_VERSION_NG
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 36fa86f..e04a4cc 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -5,7 +5,7 @@ sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0
 sha256  b4c73fe3e7af4eeabf7510ee66ca85f775c3ed44d20b1bcd30c6ac481dd753cd        uClibc-ng-1.0.3.tar.xz
 
 # No hash for the ARC variant, comes from the github-helper
-none	xxx	uClibc-arc-2015.06-rc1.tar.gz
+none	xxx	uClibc-arc-2015.06.tar.gz
 
 # No hash for this git snapshot
 none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
-- 
2.4.3
