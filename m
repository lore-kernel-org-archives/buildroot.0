From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 10:47:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070729174728.EC106A4508@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 10:47:27 -0700 (Sun, 29 Jul 2007)
New Revision: 19333

Log:
Add AVR32 support to uClibc

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-29 17:43:50 UTC (rev 19332)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-29 17:47:27 UTC (rev 19333)
@@ -31,12 +31,17 @@
 ifeq ($(BR2_UCLIBC_VERSION_0_9_28),y)
 UCLIBC_VER:=0.9.28
 endif
+UCLIBC_SITE:=http://www.uclibc.org/downloads
 
-UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_VER)
-UCLIBC_SOURCE:=uClibc-$(UCLIBC_VER).tar.bz2
-UCLIBC_SITE:=http://www.uclibc.org/downloads
+ifeq	($(BR2_avr32),y)
+VENDOR_SUFFIX:=-avr32
+UCLIBC_SITE:=$(BR2_ATMEL_MIRROR)/Source
 endif
 
+UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_VER)$(VENDOR_SUFFIX)
+UCLIBC_SOURCE:=uClibc-$(UCLIBC_VER)$(VENDOR_SUFFIX).tar.bz2
+endif
+
 UCLIBC_CAT:=$(BZCAT)
 
 UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed -e s'/-.*//' \
@@ -92,7 +97,7 @@
 	rm -rf $(UCLIBC_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
-	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)-\*.patch
+	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)$(VENDOR_SUFFIX)-\*.patch
 else
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc.\*.patch
 endif
@@ -147,6 +152,12 @@
 else
 	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' $(UCLIBC_DIR)/.config
 endif
+ifeq ($(BR2_USE_WCHAR),y)
+	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
+else
+	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.config
+endif
+
 ifeq ($(BR2_INET_RPC),y)
 	$(SED) 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=y,g' \
 		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=y,g' \
@@ -241,15 +252,19 @@
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
+	
+	touch $@
+
+$(UCLIBC_DIR)/.oldconfig:	$(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" \
 		oldconfig
-	touch -c $@
+	touch $@
 
-$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.config
+$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.oldconfig
 	set -x && $(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
@@ -359,9 +374,13 @@
 UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
 endif
 
-uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
+uclibc-configured: dependencies kernel-headers $(UCLIBC_DIR)/.configured
 
+uclibc-config:	$(UCLIBC_DIR)/.config
 
+uclibc-oldconfig:	$(UCLIBC_DIR)/.oldconfig
+
+
 uclibc: $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
 
 uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
