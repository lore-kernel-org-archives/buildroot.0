From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 00:08:15 +0200
Subject: [Buildroot] [PATCH 05/20] toolchain: blackfin: Remove Blackfin
	toolchain 2011R1 release.
In-Reply-To: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369606110-8088-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

ADI officially supports the buildroot and related GNU toolchain for
Blackfin since ADI's 2012R1 release only. In order to avoid confusion,
it is better to remove the 2011R1 GNU toolchain for Blackfin. In
addition, the 2011R1 GNU toolchain for Blackfin doesn't support the
BF60x processors.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   19 -------------------
 toolchain/toolchain-external/ext-tool.mk |    8 +-------
 2 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a93ada3..02fb330 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -614,23 +614,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
-config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1
-	bool "Blackfin.uclinux.org 2011R1-RC4"
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
-	help
-	  Toolchain for the Blackfin architecture, from
-	  http://blackfin.uclinux.org.
-
 config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	bool "Xilinx Little Endian Microblaze GNU Tools"
 	depends on BR2_microblazeel
@@ -784,8 +767,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
-	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && BR2_BINFMT_FLAT
-	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FLAT
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a87bc3b..58e58f6 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -248,12 +248,6 @@ TOOLCHAIN_EXTERNAL_SOURCE=ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209),y)
 TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1),y)
-TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/531/9509/
-TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2011R1-RC4.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/531/9517/
-TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2011R1-RC4.i386.tar.bz2
-TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1),y)
 TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/559/9858/
 TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2012R1-RC2.i386.tar.bz2
@@ -305,7 +299,7 @@ endif
 # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
 # which themselves contain the toolchain. This is why we strip more
 # components than usual.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
 	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1:/=:/=)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
 
-- 
1.7.9.5
