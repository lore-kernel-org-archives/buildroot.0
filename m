From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jun 2012 16:04:39 +0200
Subject: [Buildroot] [PATCH 05/10] toolchain-external: add Blackfin
	toolchain 2012R1-BETA1
In-Reply-To: <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338732273.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bb220181fdc60a5454ec08551e17c84979dfce58.1338732273.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   17 +++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    8 +++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ce84c7d..fcac7da 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -490,6 +490,21 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
 	  Other architecture variants (beyond Pentium-4/Xeon) are
 	  supported as well, but glibc is not optimised for it.
 
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
+	bool "Blackfin.uclinux.org 2012R1-BETA1"
+	depends on BR2_bfin
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_INET_RPC
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	help
+	  Toolchain for the Blackfin architecture, from
+	  http://blackfin.uclinux.org.
+
 config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1
 	bool "Blackfin.uclinux.org 2011R1-RC4"
 	depends on BR2_bfin
@@ -603,6 +618,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && BR2_BFIN_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && !BR2_BFIN_FDPIC
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && BR2_BFIN_FDPIC
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && !BR2_BFIN_FDPIC
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BFIN_FDPIC
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 91555e1..88e0619 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -254,6 +254,12 @@ TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2011R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/531/9517/
 TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2011R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1),y)
+TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/544/9749/
+TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2012R1-BETA1.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/544/9773/
+TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2012R1-BETA1.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2),y)
 TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;h=d7b493c5dbcc24ba9cc3be2e4c14d6d9701e6805;hb=00163583b771bb4e937632765dd0c5516b3e31c4;f=
 TOOLCHAIN_EXTERNAL_SOURCE=microblazeel-unknown-linux-gnu.tgz
@@ -272,7 +278,7 @@ endif
 # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
 # which themselves contain the toolchain. This is why we strip more
 # components than usual.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1),y)
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
 	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
 
-- 
1.7.9.5
