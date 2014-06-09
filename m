From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:41:18 +0200
Subject: [Buildroot] [git commit] toolchain-external: add ADI Blackfin
	2014R1 toolchain, remove 2012R1
Message-ID: <20140609134342.2236B9CF7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a65b8e185fab38824da5e9b7b5b9e781e31d368
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds support for two ADI Blackfin toolchains: the 'stable'
2014R1 based on gcc 4.3, and the 'experimental' 2014R1 based on gcc
4.5.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/Config.in             |   40 +++++++++++++++-----
 toolchain/toolchain-external/toolchain-external.mk |   14 ++++--
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 07973aa..23099aa 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -671,8 +671,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	  Other architecture variants (beyond Pentium-4/Xeon) are
 	  supported as well, but glibc is not optimised for it.
 
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
-	bool "Blackfin.uclinux.org 2013R1"
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC45
+	bool "Blackfin.uclinux.org 2014R1 (gcc 4.5.x stable)"
 	depends on BR2_bfin
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -689,8 +689,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
-	bool "Blackfin.uclinux.org 2012R2-RC2"
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC43
+	bool "Blackfin.uclinux.org 2014R1 (gcc 4.3.x stable)"
 	depends on BR2_bfin
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -702,13 +702,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
-	bool "Blackfin.uclinux.org 2012R1-RC2"
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
+	bool "Blackfin.uclinux.org 2013R1"
 	depends on BR2_bfin
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -720,7 +720,25 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	help
+	  Toolchain for the Blackfin architecture, from
+	  http://blackfin.uclinux.org.
+
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
+	bool "Blackfin.uclinux.org 2012R2-RC2"
+	depends on BR2_bfin
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -891,12 +909,14 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BINFMT_FLAT
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FDPIC
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC43 && BR2_BINFMT_FLAT
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC43 && BR2_BINFMT_FDPIC
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC45 && BR2_BINFMT_FLAT
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC45 && BR2_BINFMT_FDPIC
 	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm
 	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
 	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_i386
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 7f1f128..d331fbd 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -326,10 +326,6 @@ TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1),y)
-TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/projects/adi-toolchain/files/2012R1-BF60X/2012R1-RC2-BF60X/i386/
-TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R1-RC2.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2012R1-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
 TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
@@ -338,6 +334,14 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
 TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC43),y)
+TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386/
+TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC45),y)
+TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1_45-RC2/i386/
+TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1_45-RC2.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1_45-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
@@ -399,7 +403,7 @@ TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC43)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1_GCC45),y)
 # Special handling for Blackfin toolchain, because of the split in two
 # tarballs, and the organization of tarball contents. The tarballs
 # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
