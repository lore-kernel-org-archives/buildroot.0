From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Mar 2012 21:00:04 +0100
Subject: [Buildroot] [PATCH 11/16] external-toolchain: Blackfin.uclinux.org
	2011R1-RC4
In-Reply-To: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
References: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
Message-ID: <91d4336cbc22846e5d6fa3c26d74849721163d33.1330977548.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   17 +++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    8 +++++++-
 2 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index a552cc2..6fb9ef6 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -249,6 +249,21 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
             - Intel Xeon, glibc, 64 bits
             - Intel Core 2, glibc, 64 bits
 
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1
+	bool "Blackfin.uclinux.org 2011R1-RC4"
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
 config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
 	bool "Blackfin.uclinux.org 2010RC1"
 	depends on BR2_bfin
@@ -312,6 +327,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && !BR2_BFIN_FDPIC
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && BR2_BFIN_FDPIC
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && !BR2_BFIN_FDPIC
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && BR2_BFIN_FDPIC
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a6a5028..132aacd 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -225,6 +225,12 @@ TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2010R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8386/
 TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2010R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1),y)
+TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/531/9509/
+TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2011R1-RC4.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/531/9517/
+TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2011R1-RC4.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
 else
 # A value must be set (even if unused), otherwise the
 # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
@@ -237,7 +243,7 @@ endif
 # contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
 # which themselves contain the toolchain. This is why we strip more
 # components than usual.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1),y)
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
 	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1),$(TOOLCHAIN_EXTERNAL_SOURCE_1))
 
-- 
1.7.4.1
