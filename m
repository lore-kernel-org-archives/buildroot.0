From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:15:11 +0200
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
	arc-2016.09-eng015
Message-ID: <20161003211514.A0D2E81E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb6873b1d120590974bc8734f8701c3f6e2b6a87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described at:
4520524ba055706236db9f00dd79f1b2e2e87fde
this commit continues a series of updates of ARC tools.
This time we're updating tools to arc-2016.09-eng015.

This tag introduces following changes:
1. binutils: Rebase onto upstream master.
2. gcc: Fix devdf3 emulation for arcem, disable TP register when
building for bare metal.

We still keep GDB as it is of arc-2016.03 release because there're some
issues we'd like to resolve before releasing it to wider audience.

So again note this is next engineering builds of arc-2016.09 series
and it might have all kinds of breakages, please don't use it for
production builds.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                                         | 2 +-
 .../{arc-2016.09-eng013 => arc-2016.09-eng015}/0300-ld-makefile.patch   | 0
 .../0301-check-ldrunpath-length.patch                                   | 0
 .../0500-add-sysroot-fix-from-bug-3049.patch                            | 0
 .../0600-poison-system-directories.patch                                | 0
 package/binutils/binutils.hash                                          | 2 +-
 package/binutils/binutils.mk                                            | 2 +-
 package/gcc/Config.in.host                                              | 2 +-
 .../301-missing-execinfo_h.patch                                        | 0
 .../gcc/{arc-2016.09-eng013 => arc-2016.09-eng015}/860-cilk-wchar.patch | 0
 .../940-uclinux-enable-threads.patch                                    | 0
 package/gcc/gcc.hash                                                    | 2 +-
 12 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 51ee2cc..5ea5f31 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -32,7 +32,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2016.09-eng013"	if BR2_arc
+	default "arc-2016.09-eng015"	if BR2_arc
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
diff --git a/package/binutils/arc-2016.09-eng013/0300-ld-makefile.patch b/package/binutils/arc-2016.09-eng015/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng013/0300-ld-makefile.patch
rename to package/binutils/arc-2016.09-eng015/0300-ld-makefile.patch
diff --git a/package/binutils/arc-2016.09-eng013/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.09-eng015/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng013/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2016.09-eng015/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2016.09-eng013/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.09-eng015/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng013/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2016.09-eng015/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2016.09-eng013/0600-poison-system-directories.patch b/package/binutils/arc-2016.09-eng015/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng013/0600-poison-system-directories.patch
rename to package/binutils/arc-2016.09-eng015/0600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 42e7452..f41b39b 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,4 +5,4 @@ sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322
 sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb  binutils-2.27.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  acd7a5086ec386a3a5038df10daf0cbba42024bb8679e2f4b65389e7a4316709fd04d7b9729874f1bb28199a8eb22e36820558bc0f23ff6d20d7fc98e0f549fb  binutils-arc-2016.09-eng013.tar.gz
+sha512  f8cc7529fbe3cb52b666b92e1353063a8a36ea07fa8c5aa8359252f4222feaed15253b6a137033c74dabc0ae784daf8a7978e69ebdb8bf8cd6b8bb61c84bf181  binutils-arc-2016.09-eng015.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 1f9a356..3a4a661 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2016.09-eng013
+BINUTILS_VERSION = arc-2016.09-eng015
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6ecc2f0..5b847fa 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -121,7 +121,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.2.0"     if BR2_GCC_VERSION_6_X
-	default "arc-2016.09-eng013" if BR2_GCC_VERSION_ARC
+	default "arc-2016.09-eng015" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2016.09-eng013/301-missing-execinfo_h.patch b/package/gcc/arc-2016.09-eng015/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng013/301-missing-execinfo_h.patch
rename to package/gcc/arc-2016.09-eng015/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2016.09-eng013/860-cilk-wchar.patch b/package/gcc/arc-2016.09-eng015/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng013/860-cilk-wchar.patch
rename to package/gcc/arc-2016.09-eng015/860-cilk-wchar.patch
diff --git a/package/gcc/arc-2016.09-eng013/940-uclinux-enable-threads.patch b/package/gcc/arc-2016.09-eng015/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng013/940-uclinux-enable-threads.patch
rename to package/gcc/arc-2016.09-eng015/940-uclinux-enable-threads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 4856562..ce738ef 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,4 +12,4 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  1e8b826a3d44b9d5899309894e20c03abeb352bf3d273b8ad63af814c0ee2911f1a83ce1cd4cdd2d1cb0b3e3c34e9b7ae1b2ab83dfc649ee817ab05247c76198  gcc-6.2.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  9b916c2e3c595c0f085d45c09fdf1612c9dfc2a42006699c9af1c73b542ab73bfeb15ff0fbe0a87214156b3f6a146883f1e02e387b2c31701c34de221aa97327  gcc-arc-2016.09-eng013.tar.gz
+sha512  9f365452f746ae91875d935c2ec5ed16cd11a2973f69bd23193fec9fc6b557e0dd66bb169e7efb7ec63fd78af36139005abcf5a5a1d89d6f49788b2ed7b334fb  gcc-arc-2016.09-eng015.tar.gz
