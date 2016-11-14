From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 14 Nov 2016 20:56:37 +0300
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2016.09-rc1
Message-ID: <1479146197-41383-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As described at:
4520524ba055706236db9f00dd79f1b2e2e87fde
this commit continues a series of updates of ARC tools.
This time we're updating tools to arc-2016.09-rc1.

This update contains a lot of important fixes, e.g. it fixes:
http://autobuild.buildroot.net/results/4c7/4c77f33c842b37bf28cb931edf1b290e1bf4d93c//
http://autobuild.buildroot.net/results/902/902729a0b98675ad803939e3ecdcf230065a6012//
and other failures.

Other important change is that we also update gdb. Now we are
using gdb 7.12.

This version of gdb requires C++ toolchain support so we add
corresponding dependency to gdb Config.in file.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/binutils/Config.in.host                                         | 2 +-
 .../{arc-2016.09-eng015 => arc-2016.09-rc1}/0300-ld-makefile.patch      | 0
 .../0301-check-ldrunpath-length.patch                                   | 0
 .../0500-add-sysroot-fix-from-bug-3049.patch                            | 0
 .../0600-poison-system-directories.patch                                | 0
 package/binutils/binutils.hash                                          | 2 +-
 package/binutils/binutils.mk                                            | 2 +-
 package/gcc/Config.in.host                                              | 2 +-
 .../301-missing-execinfo_h.patch                                        | 0
 .../gcc/{arc-2016.09-eng015 => arc-2016.09-rc1}/860-cilk-wchar.patch    | 0
 .../940-uclinux-enable-threads.patch                                    | 0
 package/gcc/gcc.hash                                                    | 2 +-
 package/gdb/Config.in                                                   | 2 ++
 package/gdb/Config.in.host                                              | 2 +-
 package/gdb/gdb.hash                                                    | 2 +-
 15 files changed, 9 insertions(+), 7 deletions(-)
 rename package/binutils/{arc-2016.09-eng015 => arc-2016.09-rc1}/0300-ld-makefile.patch (100%)
 rename package/binutils/{arc-2016.09-eng015 => arc-2016.09-rc1}/0301-check-ldrunpath-length.patch (100%)
 rename package/binutils/{arc-2016.09-eng015 => arc-2016.09-rc1}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{arc-2016.09-eng015 => arc-2016.09-rc1}/0600-poison-system-directories.patch (100%)
 rename package/gcc/{arc-2016.09-eng015 => arc-2016.09-rc1}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{arc-2016.09-eng015 => arc-2016.09-rc1}/860-cilk-wchar.patch (100%)
 rename package/gcc/{arc-2016.09-eng015 => arc-2016.09-rc1}/940-uclinux-enable-threads.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 3e0c357..af9339e 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -22,7 +22,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2016.09-eng015"	if BR2_arc
+	default "arc-2016.09-rc1"	if BR2_arc
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
diff --git a/package/binutils/arc-2016.09-eng015/0300-ld-makefile.patch b/package/binutils/arc-2016.09-rc1/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng015/0300-ld-makefile.patch
rename to package/binutils/arc-2016.09-rc1/0300-ld-makefile.patch
diff --git a/package/binutils/arc-2016.09-eng015/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.09-rc1/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng015/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2016.09-rc1/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2016.09-eng015/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.09-rc1/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng015/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2016.09-rc1/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2016.09-eng015/0600-poison-system-directories.patch b/package/binutils/arc-2016.09-rc1/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng015/0600-poison-system-directories.patch
rename to package/binutils/arc-2016.09-rc1/0600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index f41b39b..80ac9dd 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,4 +5,4 @@ sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322
 sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb  binutils-2.27.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  f8cc7529fbe3cb52b666b92e1353063a8a36ea07fa8c5aa8359252f4222feaed15253b6a137033c74dabc0ae784daf8a7978e69ebdb8bf8cd6b8bb61c84bf181  binutils-arc-2016.09-eng015.tar.gz
+sha512  d0befdeb0a7b76efd1ad655fc062cde2aa67be7b26210c913ab2709e069d815c4ff2863ce7add1f6434da5a2f4faf1ce5a5bc3d0e64f3e04548a7479f24edcbc  binutils-arc-2016.09-rc1.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ca481d2..61486a2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2016.09-eng015
+BINUTILS_VERSION = arc-2016.09-rc1
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0a63e6a..d10798b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -98,7 +98,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.2.0"     if BR2_GCC_VERSION_6_X
-	default "arc-2016.09-eng015" if BR2_GCC_VERSION_ARC
+	default "arc-2016.09-rc1" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2016.09-eng015/301-missing-execinfo_h.patch b/package/gcc/arc-2016.09-rc1/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng015/301-missing-execinfo_h.patch
rename to package/gcc/arc-2016.09-rc1/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2016.09-eng015/860-cilk-wchar.patch b/package/gcc/arc-2016.09-rc1/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng015/860-cilk-wchar.patch
rename to package/gcc/arc-2016.09-rc1/860-cilk-wchar.patch
diff --git a/package/gcc/arc-2016.09-eng015/940-uclinux-enable-threads.patch b/package/gcc/arc-2016.09-rc1/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng015/940-uclinux-enable-threads.patch
rename to package/gcc/arc-2016.09-rc1/940-uclinux-enable-threads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index ce738ef..e5d96f4 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,4 +12,4 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  1e8b826a3d44b9d5899309894e20c03abeb352bf3d273b8ad63af814c0ee2911f1a83ce1cd4cdd2d1cb0b3e3c34e9b7ae1b2ab83dfc649ee817ab05247c76198  gcc-6.2.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  9f365452f746ae91875d935c2ec5ed16cd11a2973f69bd23193fec9fc6b557e0dd66bb169e7efb7ec63fd78af36139005abcf5a5a1d89d6f49788b2ed7b334fb  gcc-arc-2016.09-eng015.tar.gz
+sha512  7029d7ae1316b9385880f32283aa6c4979b1257500bb21e3fb234475ecb20082f46b114d8b7022c75a8dcf0c0c7b6b02e9384b49dd3189adc3d454502b8b0c26  gcc-arc-2016.09-rc1.tar.gz
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 809e02d..e025fe0 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -11,6 +11,8 @@ config BR2_PACKAGE_GDB
 		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	depends on !BR2_nios2 && !BR2_bfin
+	# Since ARC gdb moved to 7.12 toolchain requires C++ support to build gdb.
+	depends on !BR2_arc || BR2_TOOLCHAIN_BUILDROOT_CXX
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a36dc0f..b6eb41f 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -56,7 +56,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2016.03-gdb" if BR2_arc
+	default "arc-2016.09-rc1-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.9.1"    if BR2_GDB_VERSION_7_9
 	default "7.10.1"   if BR2_GDB_VERSION_7_10 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 611a75c..8c0d51b 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-sha512  1abef1357896c2b57cfa7f7414eedc49d0de26b54321c680c2d027b1a27ec453d421e7f89a5281336047542379fd4820685802059efbd32b87c5ccffbaf2bd16	gdb-arc-2016.03-gdb.tar.gz
+sha512  e6019ac0d6b1354943d3c06c84f353ba49fef105b07c1a04ad90cc5b65f91e38fe6c671e0c34a9541ee282d0f42cf24579c011a0469d19faaa4d00d64a17afe2	gdb-arc-2016.09-rc1-gdb.tar.gz
-- 
2.6.3
