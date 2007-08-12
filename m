From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 05:37:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070812123753.E9BE5A65DE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 05:37:51 -0700 (Sun, 12 Aug 2007)
New Revision: 19460

Log:
Whitespace cleanup of uclibc, remove debug aid

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-12 12:05:55 UTC (rev 19459)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-12 12:37:51 UTC (rev 19460)
@@ -34,14 +34,14 @@
 endif
 UCLIBC_SITE:=http://www.uclibc.org/downloads
 
-ifeq	($(BR2_TOOLCHAIN_NORMAL),)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),)
 UCLIBC_SITE:=$(VENDOR_SITE)
 endif
 
 UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
 
 
-ifeq	($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
 UCLIBC_PATCH_DIR:=toolchain/uClibc/
 else
 UCLIBC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
@@ -53,7 +53,8 @@
 
 UCLIBC_CAT:=$(BZCAT)
 
-UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed -e s'/-.*//' \
+UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
+		-e 's/-.*//' \
 		-e 's/i.86/i386/' \
 		-e 's/sparc.*/sparc/' \
 		-e 's/arm.*/arm/g' \
@@ -140,7 +141,12 @@
 	/bin/echo "CONFIG_ARM_OABI=y" >> $(UCLIBC_DIR)/.config
 	/bin/echo "# CONFIG_ARM_EABI is not set" >> $(UCLIBC_DIR)/.config
 endif
+ifeq ($(BR2_generic_arm),y)
+	$(SED) 's,^.*CONFIG_GENERIC_ARM.*,CONFIG_GENERIC_ARM=y,g' $(UCLIBC_DIR)/.config
+else
+	$(SED) 's,^.*CONFIG_GENERIC_ARM.*,# CONFIG_GENERIC_ARM is not set,g' $(UCLIBC_DIR)/.config
 endif
+endif
 ifneq ($(UCLIBC_TARGET_ENDIAN),)
 	# The above doesn't work for me, so redo
 	$(SED) 's/.*\(ARCH_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
@@ -261,9 +267,6 @@
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
-	touch $@
-
-$(UCLIBC_DIR)/.oldconfig:	$(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
@@ -272,7 +275,7 @@
 		oldconfig
 	touch $@
 
-$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.oldconfig
+$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.config
 	set -x && $(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
@@ -388,8 +391,6 @@
 
 uclibc-config:	$(UCLIBC_DIR)/.config
 
-uclibc-oldconfig:	$(UCLIBC_DIR)/.oldconfig
-
 uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
 
 uclibc-configured-source: uclibc-source
