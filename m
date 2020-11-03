From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 20:10:08 +0100
Subject: [Buildroot] [git commit] toolchain: update ARC tools to
 arc-2020.09-release
Message-ID: <20201103193243.7CBC786F25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0791abfba0227803b19895ea22326f4e17ac93dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps ARC toolchain to arc-2020.09-release.

ARC GNU tools of version arc-2020.09-release bring some quite significant
changes like:
* Binutils 2.34.50 with additional ARC patches
* GCC 10.0.2 with additional ARC patches
* GDB 10.0.50 with additional ARC patches

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                                       | 2 +-
 .../0001-poison-system-directories.patch                              | 0
 package/binutils/binutils.hash                                        | 2 +-
 package/binutils/binutils.mk                                          | 4 ++--
 package/gcc/Config.in.host                                            | 2 +-
 .../0100-uclibc-conf.patch                                            | 0
 package/gcc/gcc.hash                                                  | 2 +-
 package/gdb/Config.in.host                                            | 2 +-
 package/gdb/gdb.hash                                                  | 2 +-
 9 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 728193ed01..b690b952dc 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -50,7 +50,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2020.03-release"	if BR2_BINUTILS_VERSION_ARC
+	default "arc-2020.09-release"	if BR2_BINUTILS_VERSION_ARC
 	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
 	default "2.33.1"	if BR2_BINUTILS_VERSION_2_33_X
diff --git a/package/binutils/arc-2020.03-release/0001-poison-system-directories.patch b/package/binutils/arc-2020.09-release/0001-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2020.03-release/0001-poison-system-directories.patch
rename to package/binutils/arc-2020.09-release/0001-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index b5b73e5c07..ce5b0cdca8 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,7 +5,7 @@ sha512  2c7976939dcf5e8c5b7374cccd39bfe803b1bec73c6abfa0eb17c24e1942574c6bdb874c
 sha512  94ff72708403413b70b247f3af4099ebaa882b6659249869f1ed9941a0f1912e313f08357d470f9fd2359e7f5e5b0eb86285e5eaf883fa8187789d6b1bd304eb  binutils-2.35.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  99c87ea97b43719dd9ce8193d60a5a6f0abc0479e8ebabbd32876f54807cd02d1280c691ef19e12cb79946280d2a4c1562bbb1a175a31ff1533720a623c3059a  binutils-gdb-arc-2020.03-release.tar.gz
+sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 6ae4605d86..d978b424be 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,13 +9,13 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2020.03-release
+BINUTILS_VERSION = arc-2020.09-release
 else
 BINUTILS_VERSION = 2.34
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2020.03-release)
+ifeq ($(BINUTILS_VERSION),arc-2020.09-release)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4aa6d3725f..10688ff568 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -75,7 +75,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_8_X
 	default "9.3.0"     if BR2_GCC_VERSION_9_X
 	default "10.2.0"    if BR2_GCC_VERSION_10_X
-	default "arc-2020.03-release" if BR2_GCC_VERSION_ARC
+	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2020.03-release/0100-uclibc-conf.patch b/package/gcc/arc-2020.09-release/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2020.03-release/0100-uclibc-conf.patch
rename to package/gcc/arc-2020.09-release/0100-uclibc-conf.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 671548deed..2208095a29 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,7 +6,7 @@ sha512  4b9e3639eef6e623747a22c37a904b4750c93b6da77cf3958d5047e9b5ebddb7eebe091c
 sha512  42ae38928bd2e8183af445da34220964eb690b675b1892bbeb7cd5bb62be499011ec9a93397dba5e2fb681afadfc6f2767d03b9035b44ba9be807187ae6dc65e  gcc-10.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  09ad77fce757d77f2db49cd049b78861abfa5c1c6c3be76228815ec2b15810c1985525c48b0300e83e88f3fa33dee0062f34790cc8b6bc2fa6b0301595acf42b  gcc-arc-2020.03-release.tar.gz
+sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
 # Locally calculated (fetched from https://github.com/c-sky/gcc)
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 42021b8086..4b868e2255 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -85,7 +85,7 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2020.03-release-gdb" if BR2_arc
+	default "arc-2020.09-release-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
 	default "8.3.1"    if BR2_GDB_VERSION_8_3
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 03e2afe102..1f14eeafaf 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -4,7 +4,7 @@ sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b12
 sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  74346a2a2b2082d35377711946b12c824222005c66813d5648350b101697eac67d3d01617e1daea03e41c196c2b7b4a4b225d1ee58af91dc69731bffed0e5d51  gdb-arc-2020.03-release-gdb.tar.gz
+sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b  gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
