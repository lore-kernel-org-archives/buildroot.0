From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 17:29:37 +0200
Subject: [Buildroot] [git commit] toolchain-external: add Sourcery CodeBench
	MIPS 2011.09
Message-ID: <20120722153346.D8EB196D08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cc492482589a78f46b1945b176821775fca86c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   68 ++++++++++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +
 2 files changed, 71 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f53ec88..5c29ecd 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -161,6 +161,73 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	       Select BR2_SOFT_FLOAT
 	       Set BR2_TARGET_OPTIMIZATION to -mthumb
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
+	bool "Sourcery CodeBench MIPS 2011.09"
+	depends on BR2_mips || BR2_mipsel
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Sourcery CodeBench toolchain for the MIPS architecture, from
+	  Mentor Graphics. It uses gcc 4.5.2, binutils 2.21.53, glibc
+	  2.13, uClibc 0.9.30 and gdb 7.2.50, kernel headers
+	  3.0.1. It has support for the following variants:
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
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	bool "Sourcery CodeBench MIPS 2011.03"
 	depends on BR2_mips || BR2_mipsel
@@ -555,6 +622,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 388eccc..53b898f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -208,6 +208,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=mips-4.4-303-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package9469/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.03-110-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109),y)
+TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/GNUToolchain/package9761/public/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.09-75-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/power/portal/package7703/public/powerpc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
