From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Dec 2015 19:14:43 +0100
Subject: [Buildroot] [PATCH 4/7] toolchain-external: CodeSourcery x86:
	support only one version
In-Reply-To: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
References: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1450548886-21937-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See the conclusion about external toolchains during the Buildroot
meeting [1]:
"In the future, we stick to a single external toolchain version. The
Kconfig symbol should not encode the version (avoid legacy handling)"

[1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/toolchain-external/Config.in             | 63 +---------------------
 .../toolchain-external/toolchain-external.hash     |  2 -
 toolchain/toolchain-external/toolchain-external.mk |  8 +--
 3 files changed, 3 insertions(+), 70 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 120fa9a..7c738cf 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -352,7 +352,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	  No other architecture variants are supported since glibc
 	  is optimized for one of these two baselines.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	bool "Sourcery CodeBench x86/x86_64 2012.09"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -381,63 +381,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	  Other architecture variants (beyond Pentium-4/Xeon) are
 	  supported as well, but glibc is not optimised for it.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
-	bool "Sourcery CodeBench x86/x86_64 2012.03"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_x86_jaguar
-	depends on !BR2_x86_steamroller
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
-	help
-	  Sourcery CodeBench toolchain for the x86/x86_64
-	  architectures, from Mentor Graphics. It uses gcc 4.6.3,
-	  binutils 2.21.53, glibc 2.15, gdb 7.2.50 and kernel headers
-	  3.2.10. It has support for the following variants:
-	    - Intel Pentium 4, glibc, 32 bits
-	      Default for x86, nothing special to do.
-	    - Intel Atom, glibc, 32 bits
-	      Select an Atom core
-	    - Intel Xeon, glibc, 64 bits
-	      Default for x86_64, nothing special to do.
-	    - Intel Core 2, glibc, 64 bits
-	      Select a Core 2 core
-	  Other architecture variants (beyond Pentium-4/Xeon) are
-	  supported as well, but glibc is not optimised for it.
-
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
-	bool "Sourcery CodeBench x86/x86_64 2011.09"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_x86_jaguar
-	depends on !BR2_x86_steamroller
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
-	help
-	  Sourcery CodeBench toolchain for the x86/x86_64
-	  architectures, from Mentor Graphics. It uses gcc 4.6.1,
-	  binutils 2.21.53, glibc 2.13, gdb 7.2.50 and kernel headers
-	  3.0.1. It has support for the following variants:
-	    - Intel Pentium 4, glibc, 32 bits
-	      Default for x86, nothing special to do.
-	    - Intel Atom, glibc, 32 bits
-	      Select an Atom core
-	    - Intel Xeon, glibc, 64 bits
-	      Default for x86_64, nothing special to do.
-	    - Intel Core 2, glibc, 64 bits
-	      Select a Core 2 core
-	  Other architecture variants (beyond Pentium-4/Xeon) are
-	  supported as well, but glibc is not optimised for it.
-
 config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
 	bool "Blackfin.uclinux.org 2014R1"
 	depends on BR2_bfin
@@ -625,9 +568,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
-	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
-	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
-	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
+	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FDPIC
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index d5f6957..91dc27c 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -23,8 +23,6 @@ sha256 d6c94587d546197836e7e1a6909f6aabfa5879e91f501ab03088a6887cc242fc  mentor-
 # SuperH
 sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # x86
-sha256 5f308a3fe0752f181fd0d33a70a17efb8300d0e34a94ed18a1a0304dc18e150e  ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
-sha256 6ac2f0d9ec56242ecbe4315533f3e00a675909850a41bdafc052fbfe27ece300  ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
 sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 # AMD64
 sha256 cb4d071db8aefb8005fe72824b96568d93a50f5acd85bacf505a34fe2f265f70  amd-2015.11-36-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3856e7c..497577f 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -323,13 +323,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-l
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109),y)
-TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64),y)
-- 
2.4.3
