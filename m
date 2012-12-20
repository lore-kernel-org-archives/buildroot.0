From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Dec 2012 00:23:20 +0100
Subject: [Buildroot] [PATCH 1/9] toolchain-external: add support for
	'Sourcery CodeBench MIPS 2012.03'
In-Reply-To: <cover.1356045729.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356045729.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cef6a6a5e17b7cb1472c163540efef2a8d7ab120.1356045729.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   69 ++++++++++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 ++
 2 files changed, 72 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 456407e..4e94526 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -102,6 +102,74 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
+	bool "Sourcery CodeBench MIPS 2012.03"
+	depends on BR2_mips || BR2_mipsel
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Sourcery CodeBench toolchain for the MIPS architecture, from
+	  Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53, glibc
+	  2.15, uClibc 0.9.30 and gdb 7.2.50, kernel headers
+	  3.2.10. It has support for the following variants:
+	    - MIPS32 O32 big endian glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS64 big endian glibc
+	      Select a MIPS generic core
+	      Select the n64 ABI
+	      Disable BR2_SOFT_FLOAT
+	    - MIPS32 O32 little endian glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL
+	    - MIPS64 little endian glibc
+	      Select a MIPS generic core
+	      Select the n64 ABI
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL
+	    - MIPS32 big endian soft float glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	    - MIPS64 big endian soft float glibc
+	      Select a MIPS generic core
+	      Select the n64 ABI
+	      Select BR2_SOFT_FLOAT
+	    - MIPS32 little endian soft float glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL
+	    - MIPS64 little endian soft float glibc
+	      Select a MIPS generic core
+	      Select the n64 ABI
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL
+	    - MIPS32 big endian microMIPS glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32 little endian microMIPS glibc
+	      Select a MIPS generic core
+	      Disable BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	    - MIPS32 big endian soft float microMIPS glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -mips16
+	    - MIPS32 little endian soft float microMIPS glibc
+	      Select a MIPS generic core
+	      Select BR2_SOFT_FLOAT
+	      Set BR2_TARGET_OPTIMIZATION to -EL -mips16
+	    - MIPS32 big endian uclibc
+	      Not usable in Buildroot yet.
+	    - MIPS32 little endian uclibc
+	      Not usable in Buildroot yet.
+	    - MIPS32 big endian soft float uclibc
+	      Not usable in Buildroot yet.
+	    - MIPS32 little endian soft float uclibc
+	      Not usable in Buildroot yet.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	bool "Sourcery CodeBench ARM 2011.03"
 	depends on BR2_arm
@@ -640,6 +708,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 6236235..2d18af0 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -202,6 +202,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.03-110-mips-linux-gnu-i686-pc-linux-gnu.tar.
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109),y)
 TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/GNUToolchain/package9761/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.09-75-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/power/portal/package7703/public/powerpc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
-- 
1.7.9.5
