From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 17:17:03 +0200
Subject: [Buildroot] [git commit branch/next] toolchain-external: add
	Blackfin toolchain 2012R1-BETA1
Message-ID: <20120802195258.97D2D8E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adf586ecb9f3e0cce0da19ddc736bf7ddc27f1d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   17 +++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    8 +++++++-
 2 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3b1d792..f53ec88 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -427,6 +427,21 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
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
@@ -552,6 +567,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && BR2_BFIN_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && !BR2_BFIN_FDPIC
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && BR2_BFIN_FDPIC
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && !BR2_BFIN_FDPIC
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1 && BR2_BFIN_FDPIC
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 14804d6..388eccc 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -244,6 +244,12 @@ TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2011R1-RC4.i386.tar.bz2
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
@@ -268,7 +274,7 @@ endif
 # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
 # which themselves contain the toolchain. This is why we strip more
 # components than usual.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1),y)
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
 	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
 
