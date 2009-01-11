From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:13:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  linux-fusion
Message-ID: <20090111201307.DAA9676736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:13:07 +0000 (Sun, 11 Jan 2009)
New Revision: 24756

Log:
Add latest linux-fusion to allow DirectFB to build
Remove old fusion which only copies some files





Added:
   trunk/buildroot/package/linux-fusion/
   trunk/buildroot/package/linux-fusion/40-fusion.rules
   trunk/buildroot/package/linux-fusion/Config.in
   trunk/buildroot/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch
   trunk/buildroot/package/linux-fusion/linux-fusion.mk

Removed:
   trunk/buildroot/package/fusion/


Changeset:
Added: trunk/buildroot/package/linux-fusion/40-fusion.rules
===================================================================
--- trunk/buildroot/package/linux-fusion/40-fusion.rules	                        (rev 0)
+++ trunk/buildroot/package/linux-fusion/40-fusion.rules	2009-01-11 20:13:07 UTC (rev 24756)
@@ -0,0 +1 @@
+KERNEL=="fusion[0-9]*", NAME="fusion/%n", GROUP="video", MODE="0660"

Added: trunk/buildroot/package/linux-fusion/Config.in
===================================================================
--- trunk/buildroot/package/linux-fusion/Config.in	                        (rev 0)
+++ trunk/buildroot/package/linux-fusion/Config.in	2009-01-11 20:13:07 UTC (rev 24756)
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LINUX_FUSION
+	bool "linux-fusion communication layer for DirectFB multi"
+	help
+	  DirectFB Communication Layer allowing multiple DirectFB
+	  applications to run concurrently

Added: trunk/buildroot/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch
===================================================================
--- trunk/buildroot/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch	                        (rev 0)
+++ trunk/buildroot/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch	2009-01-11 20:13:07 UTC (rev 24756)
@@ -0,0 +1,100 @@
+diff -urN linux-fusion-8.0.2-0rig//linux/drivers/char/fusion/shmpool.c linux-fusion-8.0.2/linux/drivers/char/fusion/shmpool.c
+--- linux-fusion-8.0.2-0rig//linux/drivers/char/fusion/shmpool.c	2008-09-29 12:20:44.000000000 +0200
++++ linux-fusion-8.0.2/linux/drivers/char/fusion/shmpool.c	2009-01-11 17:00:19.000000000 +0100
+@@ -20,6 +20,8 @@
+ #include <linux/slab.h>
+ #include <linux/smp_lock.h>
+ #include <linux/sched.h>
++#include <asm/page.h>
++#include <linux/mm.h>
+ 
+ #include <linux/fusion.h>
+ 
+@@ -28,8 +30,6 @@
+ #include "list.h"
+ #include "shmpool.h"
+ 
+-
+-
+ typedef struct {
+      FusionLink         link;
+      unsigned long      next_base;
+diff -urN linux-fusion-8.0.2-0rig//Makefile linux-fusion-8.0.2/Makefile
+--- linux-fusion-8.0.2-0rig//Makefile	2008-09-29 12:20:44.000000000 +0200
++++ linux-fusion-8.0.2/Makefile	2009-01-11 18:07:54.000000000 +0100
+@@ -17,13 +17,15 @@
+ 
+ 
+ DESTDIR ?= $(SYSROOT)
+-
++HEADERDIR ?= $(SYSROOT)
++# This location is valid for at least 2.6.27.10
++KERNEL_FUSION_LIB=$(KERNEL_MODLIB)/kernel/drivers/char/fusion
+ 
+ SUB = linux/drivers/char/fusion
+ 
+ export CONFIG_FUSION_DEVICE=m
+ 
+-
++ARCH=avr32
+ ifeq ($(DEBUG),yes)
+   CPPFLAGS += -DFUSION_DEBUG_SKIRMISH_DEADLOCK
+ endif
+@@ -45,25 +47,41 @@
+ 	ln -s Makefile-2.$(K_PATCHLEVEL) $(SUB)/Makefile
+ ifeq ($(call check-version,2,6,24),1)
+ 	$(MAKE) -C $(KERNEL_BUILD) \
+-		KCPPFLAGS="$(CPPFLAGS) -I`pwd`/linux/include" \
++		ARCH=avr32 \
++		CC=$(CROSS_COMPILE)gcc \
++		AS=$(CROSS_COMPILE)as \
++		KCPPFLAGS="$(CPPFLAGS) \
++			-I`pwd`/linux/include \
++			-I$(KERNEL_SOURCE)/include \
++			-I$(KERNEL_SOURCE)/arch/$(ARCH)/include" \
+ 		SUBDIRS=`pwd`/$(SUB) modules
+ else
+ 	$(MAKE) -C $(KERNEL_BUILD) \
+-		CPPFLAGS="$(CPPFLAGS) -D__KERNEL__ -I`pwd`/linux/include -I$(KERNEL_BUILD)/include -I$(KERNEL_SOURCE)/include $(AUTOCONF_H)" \
++		ARCH=avr32 \
++		CC=$(CROSS_COMPILE)gcc \
++		AS=$(CROSS_COMPILE)as \
++		CPPFLAGS="$(CPPFLAGS) \
++			-I`pwd`/linux/include \
++			-I$(KERNEL_BUILD)/include \
++			-I$(KERNEL_SOURCE)/include \
++			-I$(KERNEL_SOURCE)/arch/$(ARCH)/include \
++			 $(AUTOCONF_H)" \
+ 		SUBDIRS=`pwd`/$(SUB) modules
+ endif
+ 
+-install: all
++#-D__KERNEL__ 
++#-DHAVE_LINUX_CONFIG_H \
++
++install: all install-header
+ 	install -d $(DESTDIR)/usr/include/linux
+ 	install -m 644 linux/include/linux/fusion.h $(DESTDIR)/usr/include/linux
+-
+-	install -d $(DESTDIR)$(KERNEL_MODLIB)/drivers/char/fusion
++	install -d $(DESTDIR)$(KERNEL_FUSION_LIB)
+ 
+ ifeq ($(K_PATCHLEVEL),4)
+-	install -m 644 $(SUB)/fusion.o $(DESTDIR)$(KERNEL_MODLIB)/drivers/char/fusion
++	install -m 644 $(SUB)/fusion.o $(DESTDIR)$(KERNEL_FUSION_LIB)
+ 	rm -f $(DESTDIR)$(KERNEL_MODLIB)/fusion.o
+ else
+-	install -m 644 $(SUB)/fusion.ko $(DESTDIR)$(KERNEL_MODLIB)/drivers/char/fusion
++	install -m 644 $(SUB)/fusion.ko $(DESTDIR)$(KERNEL_FUSION_LIB)
+ 	rm -f $(DESTDIR)$(KERNEL_MODLIB)/fusion.ko
+ endif
+ ifneq ($(strip $(DESTDIR)),)
+@@ -72,6 +90,8 @@
+ 	/sbin/depmod -ae $(KERNEL_VERSION)
+ endif
+ 
++install-header:
++	install -m 644 linux/include/linux/fusion.h $(HEADERDIR)/usr/include/linux
+ 
+ 
+ clean:

Added: trunk/buildroot/package/linux-fusion/linux-fusion.mk
===================================================================
--- trunk/buildroot/package/linux-fusion/linux-fusion.mk	                        (rev 0)
+++ trunk/buildroot/package/linux-fusion/linux-fusion.mk	2009-01-11 20:13:07 UTC (rev 24756)
@@ -0,0 +1,83 @@
+#############################################################
+#
+# linux-fusion
+#
+#############################################################
+LINUX_FUSION_VERSION = 8.0.2
+LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
+LINUX_FUSION_SITE = http://www.directfb.org/downloads/Core/
+LINUX_FUSION_AUTORECONF = NO
+LINUX_FUSION_INSTALL_STAGING = YES
+LINUX_FUSION_INSTALL_TARGET = YES
+
+LINUX_FUSION_CONF_OPT = 
+
+LINUX_FUSION_DEPENDENCIES = uclibc
+
+# BR2_LINUX26_VERSION is not really dependable
+# LINUX26_VERSION is not yet set.
+# Retrieve REAL kernel version from file.
+LINUX_FOR_FUSION=`cat $(PROJECT_BUILD_DIR)/.linux-version`
+
+LINUX_FUSION_DIR:=$(BUILD_DIR)/linux-fusion-$(LINUX_FUSION_VERSION)
+LINUX_FUSION_ETC_DIR:=$(TARGET_DIR)/etc/udev/rules.d
+
+LINUX_FUSION_CAT:=$(ZCAT)
+
+LINUX_FUSION_MAKE_OPTS:=  KERNEL_VERSION=$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(PROJECT_BUILD_DIR)/linux-$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(PROJECT_BUILD_DIR)/linux-$(LINUX_FOR_FUSION)
+
+LINUX_FUSION_MAKE_OPTS += SYSROOT=$(STAGING_DIR)
+LINUX_FUSION_MAKE_OPTS += ARCH=$(BR2_ARCH)
+LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
+LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPTS += DESTDIR=$(PROJECT_BUILD_DIR)/root
+LINUX_FUSION_MAKE_OPTS += HEADERDIR=$(STAGING_DIR)
+#LINUX_FUSION_MAKE_OPTS += 
+
+#LINUX_FUSION_MAKE_OPTS += __KERNEL__=$(LINUX26_VERSION)
+
+$(DL_DIR)/$(LINUX_FUSION_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LINUX_FUSION_SITE)/$(LINUX_FUSION_SOURCE)
+
+$(LINUX_FUSION_DIR)/.unpacked: $(DL_DIR)/$(LINUX_FUSION_SOURCE)
+	$(LINUX_FUSION_CAT) $(DL_DIR)/$(LINUX_FUSION_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LINUX_FUSION_DIR) package/linux-fusion/ linux-fusion\*.patch
+	touch $@
+
+$(LINUX_FUSION_DIR)/.install: $(LINUX_FUSION_DIR)/.unpacked
+	mkdir -p $(STAGING_DIR)/lib/modules/$(LINUX_FOR_FUSION)/source/include/linux
+	echo "LINUX=$(LINUX26_VERSION)"
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(LINUX_FUSION_MAKE_OPTS) \
+		-C $(LINUX_FUSION_DIR) install
+	rm -f $(TARGET_DIR)/usr/include/linux/fusion.h
+	mkdir -p $(LINUX_FUSION_ETC_DIR)
+	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
+	touch $@
+
+
+linux-fusion-source: $(DL_DIR)/$(LINUX_FUSION_SOURCE)
+
+linux-fusion-unpacked: $(LINUX_FUSION_DIR)/.unpacked
+
+linux-fusion: uclibc linux26 $(LINUX_FUSION_DIR)/.install
+
+linux-fusion-clean:
+	-$(MAKE) -C $(LINUX_FUSION_DIR) clean
+	rm -f $(STAGING_DIR)/usr/include/linux/fusion.h
+	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX_FOR_FUSION)/drivers/char/fusion
+	rm -f $(LINUX_FUSION_DIR)/.install
+
+linux-fusion-dirclean:
+	rm -rf $(LINUX_FUSION_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_LINUX_FUSION),y)
+TARGETS+=linux-fusion
+endif
+
