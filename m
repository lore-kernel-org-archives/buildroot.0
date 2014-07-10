From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 11:30:25 +0200
Subject: [Buildroot] [git commit] toolchain-external: remove experimental
	Blackfin toolchain
Message-ID: <20140710093733.016A59D1A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cfeed1a4da52e2d34b5beab27a6e6dff4f76aa8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 2014R1 toolchain is provided in two flavours by Analog Devices:
one based on gcc 4.3.x, which is considered stable, and one based on
gcc 4.5.x, considered experimental. In commit
5a65b8e185fab38824da5e9b7b5b9e781e31d368 ("toolchain-external: add ADI
Blackfin 2014R1 toolchain, remove 2012R1") both variants were added.

However, after some testing in the autobuilders, and discussion with
the Analog Devices folks, it turns out that the experimental version
of the toolchain is too experimental. It causes numerous build
failures, and the Analog Devices folks clearly say that it's an early
release and that they expect quite a few problems to show up.

Therefore, this commit removes the experimental flavor and keeps only
the stable variant. Note that the removal/renaming of the Config.in
options is not a problem, since those options were added after the
2014.05 release.

Fixes:

  http://autobuild.buildroot.org/results/2a9/2a9d9c332a206fdb46bc8ba022c74d23082a6312/
  http://autobuild.buildroot.org/results/e1c/e1ce0c1cdd0139208dddaa8f2441ab0e3ab2385e/
  http://autobuild.buildroot.org/results/993/993aca3f4719afaa4b37524f9136fb8cdc53a066/
  and more.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in             |   28 +++-----------------
 toolchain/toolchain-external/toolchain-external.mk |    8 +----
 2 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d369f9c..b524ac7 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -689,26 +689,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	  Other architecture variants (beyond Pentium-4/Xeon) are
 	  supported as well, but glibc is not optimised for it.
 
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC45
-	bool "Blackfin.uclinux.org 2014R1 (gcc 4.5.x stable)"
-	depends on BR2_bfin
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_LARGEFILE
-	select BR2_INET_IPV6
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-	help
-	  Toolchain for the Blackfin architecture, from
-	  http://blackfin.uclinux.org.
-
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC43
-	bool "Blackfin.uclinux.org 2014R1 (gcc 4.3.x stable)"
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
+	bool "Blackfin.uclinux.org 2014R1"
 	depends on BR2_bfin
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -932,10 +914,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FDPIC
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC43 && BR2_BINFMT_FLAT
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC43 && BR2_BINFMT_FDPIC
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC45 && BR2_BINFMT_FLAT
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC45 && BR2_BINFMT_FDPIC
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 && BR2_BINFMT_FLAT
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 && BR2_BINFMT_FDPIC
 	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm
 	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
 	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_i386
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 10ae089..0955686 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -337,14 +337,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
 TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC43),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
 TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC45),y)
-TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1_45-RC2/i386/
-TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1_45-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1_45-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
@@ -407,7 +403,7 @@ TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC43)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC45),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
 # Special handling for Blackfin toolchain, because of the split in two
 # tarballs, and the organization of tarball contents. The tarballs
 # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
