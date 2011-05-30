From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 23:56:56 +0200
Subject: [Buildroot] [PATCH 1/8] blackfin: support external toolchains
	provided by blackfin.uclibc.org
In-Reply-To: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fbf3c4206036f798a0445c799f61a195a4e7051c.1306792524.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   17 +++++++++++++
 toolchain/toolchain-external/ext-tool.mk |   37 ++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 84e8ef8..1d8f561 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -152,6 +152,21 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
             - SH4A, uClibc, little endian
             - SH4A, uClibc, big endian
 
+config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
+	bool "Blackfin.uclinux.org 2010RC1"
+	depends on BR2_bfin
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_INET_RPC
+	select BR2_USE_WCHAR
+	select BR2_PROGRAM_INVOCATION
+	select BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Toolchain for the Blackfin architecture, from
+	  http://blackfin.uclinux.org.
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
        bool "Custom toolchain"
        help
@@ -191,6 +206,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
+	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && !BR2_BFIN_FDPIC
+	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && BR2_BFIN_FDPIC
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 9171e85..ef71ce0 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -189,6 +189,11 @@ TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-g
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009),y)
 TOOLCHAIN_EXTERNAL_SITE=http://www.codesourcery.com/sgpp/lite/superh/portal/package7783/public/sh-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1),y)
+TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8378/
+TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2010R1-RC4.i386.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease/501/8386/
+TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2010R1-RC4.i386.tar.bz2
 else
 # A value must be set (even if unused), otherwise the
 # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
@@ -196,6 +201,37 @@ else
 TOOLCHAIN_EXTERNAL_SOURCE=none
 endif
 
+# Special handling for Blackfin toolchain, because of the split in two
+# tarballs, and the organization of tarball contents. The tarballs
+# contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
+# which themselves contain the toolchain. This is why we strip more
+# components than usual.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1),y)
+$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1),$(TOOLCHAIN_EXTERNAL_SOURCE_1))
+
+$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2):
+	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2),$(TOOLCHAIN_EXTERNAL_SOURCE_2))
+
+$(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_1))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
+	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_2))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2) | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
+ifeq ($(TOOLCHAIN_EXTERNAL_PREFIX),bfin-uclinux)
+	rm -rf $(TOOLCHAIN_EXTERNAL_DIR)/bfin-linux-uclibc
+	mv $(TOOLCHAIN_EXTERNAL_DIR)/bfin-uclinux $(TOOLCHAIN_EXTERNAL_DIR)/tmp
+	mv $(TOOLCHAIN_EXTERNAL_DIR)/tmp/* $(TOOLCHAIN_EXTERNAL_DIR)/
+	rmdir $(TOOLCHAIN_EXTERNAL_DIR)/tmp
+else
+	rm -rf $(TOOLCHAIN_EXTERNAL_DIR)/bfin-uclinux
+	mv $(TOOLCHAIN_EXTERNAL_DIR)/bfin-linux-uclibc $(TOOLCHAIN_EXTERNAL_DIR)/tmp
+	mv $(TOOLCHAIN_EXTERNAL_DIR)/tmp/* $(TOOLCHAIN_EXTERNAL_DIR)/
+	rmdir $(TOOLCHAIN_EXTERNAL_DIR)/tmp
+endif
+	$(Q)touch $@
+else
 # Download and extraction of a toolchain
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
 	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE),$(TOOLCHAIN_EXTERNAL_SOURCE))
@@ -204,6 +240,7 @@ $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
 	mkdir -p $(@D)
 	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 	$(Q)touch $@
+endif
 
 # Checks for an already installed toolchain: check the toolchain
 # location, check that it supports sysroot, and then verify that it
-- 
1.7.1
