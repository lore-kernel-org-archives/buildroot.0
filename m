From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 28 Jan 2007 04:11:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070128121138.7F645485BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-28 04:11:37 -0800 (Sun, 28 Jan 2007)
New Revision: 17594

Log:
- add 0.9.28.1


Modified:
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-01-28 12:03:58 UTC (rev 17593)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-01-28 12:11:37 UTC (rev 17594)
@@ -12,6 +12,9 @@
 	config BR2_UCLIBC_VERSION_0_9_28
 		bool "uClibc 0.9.28"
 
+	config BR2_UCLIBC_VERSION_0_9_28_1
+		bool "uClibc 0.9.28.1"
+
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-28 12:03:58 UTC (rev 17593)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-28 12:11:37 UTC (rev 17594)
@@ -16,7 +16,12 @@
 UCLIBC_CONFIG_FILE=toolchain/uClibc/uClibc-0.9.29.config
 endif
 else
+ifeq ($(BR2_UCLIBC_VERSION_0_9_28_1),y)
+UCLIBC_VER:=0.9.28.1
+endif
+ifeq ($(BR2_UCLIBC_VERSION_0_9_28),y)
 UCLIBC_VER:=0.9.28
+endif
 UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_VER)
 UCLIBC_SOURCE:=uClibc-$(UCLIBC_VER).tar.bz2
 UCLIBC_SITE:=http://www.uclibc.org/downloads
@@ -24,6 +29,7 @@
 UCLIBC_CONFIG_FILE=toolchain/uClibc/uClibc-0.9.28.config
 endif
 endif
+
 UCLIBC_CAT:=$(BZCAT)
 
 UCLIBC_TARGET_ARCH:=$(shell echo $(ARCH) | sed -e s'/-.*//' \
@@ -78,7 +84,7 @@
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
 	mkdir -p $(TOOL_BUILD_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)\*.patch
+	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)-\*.patch
 ifneq ($(BR2_ENABLE_LOCALE),)
 	cp -dpf $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
 endif
@@ -120,13 +126,18 @@
 		$(UCLIBC_DIR)/.config
 endif
 ifeq ($(BR2_LARGEFILE),y)
-	$(SED) 's,^.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.config
 else
-	$(SED) 's,^.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=n,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=n,g' $(UCLIBC_DIR)/.config
 endif
 	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
 ifeq ($(BR2_SOFT_FLOAT),y)
-	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n\nHAS_FPU=n\nUCLIBC_HAS_FLOATS=y\nUCLIBC_HAS_SOFT_FLOAT=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n,g' \
+		-e 's,.*HAS_FPU.*,HAS_FPU=y,g' \
+		-e 's,.*UCLIBC_HAS_FLOATS.*,UCLIBC_HAS_FLOATS=y,g' \
+		-e 's,.*DO_C99_MATH.*,DO_C99_MATH=y,g' \
+		$(UCLIBC_DIR)/.config
+	#$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n\nHAS_FPU=n\nUCLIBC_HAS_FLOATS=y\nUCLIBC_HAS_SOFT_FLOAT=y,g' $(UCLIBC_DIR)/.config
 else
 	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=y\nHAS_FPU=y\nUCLIBC_HAS_FLOATS=y\n,g' $(UCLIBC_DIR)/.config
 endif
