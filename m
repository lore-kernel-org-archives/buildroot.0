From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Dec 2012 09:22:23 +0100
Subject: [Buildroot] [git commit] toolchain-external: add support for
	'Sourcery CodeBench MIPS 2012.09'
Message-ID: <20121221082523.6E7919A2F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8de1f57e66c65a8c511cc61c47afa54ca181dcdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   69 ++++++++++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +
 2 files changed, 72 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4e94526..4104041 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -102,6 +102,74 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	      Select BR2_SOFT_FLOAT
 	      Set BR2_TARGET_OPTIMIZATION to -mthumb
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
+	bool "Sourcery CodeBench MIPS 2012.09"
+	depends on BR2_mips || BR2_mipsel
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Sourcery CodeBench toolchain for the MIPS architecture, from
+	  Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51, glibc
+	  2.16, uClibc 0.9.30 and gdb 7.4.50, kernel headers
+	  3.5.4. It has support for the following variants:
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
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	bool "Sourcery CodeBench MIPS 2012.03"
 	depends on BR2_mips || BR2_mipsel
@@ -709,6 +777,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
+	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 2d18af0..2beac1d 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -205,6 +205,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=mips-2011.09-75-mips-linux-gnu-i686-pc-linux-gnu.tar.b
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209),y)
+TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE=mips-2012.09-99-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/power/portal/package7703/public/powerpc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
