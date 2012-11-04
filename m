From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Nov 2012 13:04:13 +0100
Subject: [Buildroot] [PATCH 12/20] toolchain-external: add Sourcery
	CodeBench x86 2012.03
In-Reply-To: <cover.1352030430.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352030430.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f5732d375df9b187e90340ef003a073efcf4c291.1352030430.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   24 +++++++++++++++++++++++-
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f73273c..e7c9995 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -431,7 +431,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
 	  glibc 2.15, uClibc 0.9.30, gdb 7.2.50 and kernel headers
-	  2.6.38. It has support for the following variants:
+	  3.2.10. It has support for the following variants:
             - SH4A, glibc, little endian
               Default.
             - SH4A, glibc, big endian
@@ -515,6 +515,27 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	  has support for the following variants:
 	    - SH2A, uClibc, big endian
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
+	bool "Sourcery CodeBench x86/x86_64 2012.03"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Sourcery CodeBench toolchain for the x86/x86_64
+	  architectures, from Mentor Graphics. It uses gcc 4.6.3,
+	  binutils 2.21.53, glibc 2.15, gdb 7.2.50 and kernel headers
+	  3.2.10. It has support for the following variants:
+	    - Intel Pentium 4, glibc, 32 bits
+	      Default for x86, nothing special to do.
+	    - Intel Atom, glibc, 32 bits
+	      Select an Atom core
+	    - Intel Xeon, glibc, 64 bits
+	      Default for x86_64, nothing special to do.
+	    - Intel Core 2, glibc, 64 bits
+	      Select a Core 2 core
+	  Other architecture variants (beyond Pentium-4/Xeon) are
+	  supported as well, but glibc is not optimised for it.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	bool "Sourcery CodeBench x86/x86_64 2011.09"
 	depends on BR2_i386 || BR2_x86_64
@@ -706,6 +727,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
+	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && !BR2_BFIN_FDPIC
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && BR2_BFIN_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && !BR2_BFIN_FDPIC
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 4f6ca4a..726f76f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -241,6 +241,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=ia32-2010.09-44-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109),y)
 TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203),y)
+TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/GNUToolchain/package10163/public/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1),y)
 TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8378/
 TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2010R1-RC4.i386.tar.bz2
-- 
1.7.9.5
