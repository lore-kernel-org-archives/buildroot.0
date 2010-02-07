From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Mon,  8 Feb 2010 00:52:37 +0100
Subject: [Buildroot] [PATCH] linux-fusion: bump to 8.1.1
In-Reply-To: <20100207184636.GE5229@mx.loc>
References: <20100207184636.GE5229@mx.loc>
Message-ID: <1265586757-20437-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 .../linux-fusion-8.0.2-cross-compile.patch         |  100 --------------------
 package/linux-fusion/linux-fusion.mk               |   70 +++++---------
 2 files changed, 24 insertions(+), 146 deletions(-)
 delete mode 100644 package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch

diff --git a/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch b/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch
deleted file mode 100644
index 443ddf3..0000000
--- a/package/linux-fusion/linux-fusion-8.0.2-cross-compile.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-diff -urN linux-fusion-8.0.2-0rig//linux/drivers/char/fusion/shmpool.c linux-fusion-8.0.2/linux/drivers/char/fusion/shmpool.c
---- linux-fusion-8.0.2-0rig//linux/drivers/char/fusion/shmpool.c	2008-09-29 12:20:44.000000000 +0200
-+++ linux-fusion-8.0.2/linux/drivers/char/fusion/shmpool.c	2009-01-11 17:00:19.000000000 +0100
-@@ -20,6 +20,8 @@
- #include <linux/slab.h>
- #include <linux/smp_lock.h>
- #include <linux/sched.h>
-+#include <asm/page.h>
-+#include <linux/mm.h>
- 
- #include <linux/fusion.h>
- 
-@@ -28,8 +30,6 @@
- #include "list.h"
- #include "shmpool.h"
- 
--
--
- typedef struct {
-      FusionLink         link;
-      unsigned long      next_base;
-diff -urN linux-fusion-8.0.2-0rig//Makefile linux-fusion-8.0.2/Makefile
---- linux-fusion-8.0.2-0rig//Makefile	2008-09-29 12:20:44.000000000 +0200
-+++ linux-fusion-8.0.2/Makefile	2009-01-11 18:07:54.000000000 +0100
-@@ -17,13 +17,15 @@
- 
- 
- DESTDIR ?= $(SYSROOT)
--
-+HEADERDIR ?= $(SYSROOT)
-+# This location is valid for at least 2.6.27.10
-+KERNEL_FUSION_LIB=$(KERNEL_MODLIB)/kernel/drivers/char/fusion
- 
- SUB = linux/drivers/char/fusion
- 
- export CONFIG_FUSION_DEVICE=m
- 
--
-+ARCH=$(ARCH)
- ifeq ($(DEBUG),yes)
-   CPPFLAGS += -DFUSION_DEBUG_SKIRMISH_DEADLOCK
- endif
-@@ -45,25 +47,41 @@
- 	ln -s Makefile-2.$(K_PATCHLEVEL) $(SUB)/Makefile
- ifeq ($(call check-version,2,6,24),1)
- 	$(MAKE) -C $(KERNEL_BUILD) \
--		KCPPFLAGS="$(CPPFLAGS) -I`pwd`/linux/include" \
-+		ARCH=$(ARCH) \
-+		CC=$(CROSS_COMPILE)gcc \
-+		AS=$(CROSS_COMPILE)as \
-+		KCPPFLAGS="$(CPPFLAGS) \
-+			-I`pwd`/linux/include \
-+			-I$(KERNEL_SOURCE)/include \
-+			-I$(KERNEL_SOURCE)/arch/$(ARCH)/include" \
- 		SUBDIRS=`pwd`/$(SUB) modules
- else
- 	$(MAKE) -C $(KERNEL_BUILD) \
--		CPPFLAGS="$(CPPFLAGS) -D__KERNEL__ -I`pwd`/linux/include -I$(KERNEL_BUILD)/include -I$(KERNEL_SOURCE)/include $(AUTOCONF_H)" \
-+		ARCH=$(ARCH) \
-+		CC=$(CROSS_COMPILE)gcc \
-+		AS=$(CROSS_COMPILE)as \
-+		CPPFLAGS="$(CPPFLAGS) \
-+			-I`pwd`/linux/include \
-+			-I$(KERNEL_BUILD)/include \
-+			-I$(KERNEL_SOURCE)/include \
-+			-I$(KERNEL_SOURCE)/arch/$(ARCH)/include \
-+			 $(AUTOCONF_H)" \
- 		SUBDIRS=`pwd`/$(SUB) modules
- endif
- 
--install: all
-+#-D__KERNEL__ 
-+#-DHAVE_LINUX_CONFIG_H \
-+
-+install: all install-header
- 	install -d $(DESTDIR)/usr/include/linux
- 	install -m 644 linux/include/linux/fusion.h $(DESTDIR)/usr/include/linux
--
--	install -d $(DESTDIR)$(KERNEL_MODLIB)/drivers/char/fusion
-+	install -d $(DESTDIR)$(KERNEL_FUSION_LIB)
- 
- ifeq ($(K_PATCHLEVEL),4)
--	install -m 644 $(SUB)/fusion.o $(DESTDIR)$(KERNEL_MODLIB)/drivers/char/fusion
-+	install -m 644 $(SUB)/fusion.o $(DESTDIR)$(KERNEL_FUSION_LIB)
- 	rm -f $(DESTDIR)$(KERNEL_MODLIB)/fusion.o
- else
--	install -m 644 $(SUB)/fusion.ko $(DESTDIR)$(KERNEL_MODLIB)/drivers/char/fusion
-+	install -m 644 $(SUB)/fusion.ko $(DESTDIR)$(KERNEL_FUSION_LIB)
- 	rm -f $(DESTDIR)$(KERNEL_MODLIB)/fusion.ko
- endif
- ifneq ($(strip $(DESTDIR)),)
-@@ -72,6 +90,8 @@
- 	/sbin/depmod -ae $(KERNEL_VERSION)
- endif
- 
-+install-header:
-+	install -m 644 linux/include/linux/fusion.h $(HEADERDIR)/usr/include/linux
- 
- 
- clean:
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 058e965..abce465 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -3,77 +3,55 @@
 # linux-fusion
 #
 #############################################################
-LINUX_FUSION_VERSION = 8.0.2
+LINUX_FUSION_VERSION = 8.1.1
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
-LINUX_FUSION_SITE = http://www.directfb.org/downloads/Core/
-LINUX_FUSION_AUTORECONF = NO
+LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
 LINUX_FUSION_INSTALL_TARGET = YES
 
 # BR2_LINUX26_VERSION is not really dependable
 # LINUX26_VERSION is not yet set.
 # Retrieve REAL kernel version from file.
-LINUX_FOR_FUSION=`cat $(BUILD_DIR)/.linux-version`
+LINUX_FOR_FUSION=$(LINUX_VERSION)
+# `cat $(BUILD_DIR)/.linux-version`
+LINUX_FUSION_ETC_DIR=$(TARGET_DIR)/etc/udev/rules.d
 
-LINUX_FUSION_DIR:=$(BUILD_DIR)/linux-fusion-$(LINUX_FUSION_VERSION)
-LINUX_FUSION_ETC_DIR:=$(TARGET_DIR)/etc/udev/rules.d
+LINUX_FUSION_CAT=$(ZCAT)
 
-LINUX_FUSION_CAT:=$(ZCAT)
-
-LINUX_FUSION_MAKE_OPTS:=  KERNEL_VERSION=$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPTS =  KERNEL_VERSION=$(LINUX_FOR_FUSION)
 LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(BUILD_DIR)/linux-$(LINUX_FOR_FUSION)
 LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(BUILD_DIR)/linux-$(LINUX_FOR_FUSION)
 
 LINUX_FUSION_MAKE_OPTS += SYSROOT=$(STAGING_DIR)
-LINUX_FUSION_MAKE_OPTS += ARCH=$(BR2_ARCH)
+LINUX_FUSION_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
 LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
 LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)
 LINUX_FUSION_MAKE_OPTS += DESTDIR=$(BUILD_DIR)/root
 LINUX_FUSION_MAKE_OPTS += HEADERDIR=$(STAGING_DIR)
-#LINUX_FUSION_MAKE_OPTS += 
+#LINUX_FUSION_MAKE_OPTS +=
 
 #LINUX_FUSION_MAKE_OPTS += __KERNEL__=$(LINUX26_VERSION)
 
-$(DL_DIR)/$(LINUX_FUSION_SOURCE):
-	$(call DOWNLOAD,$(LINUX_FUSION_SITE),$(LINUX_FUSION_SOURCE))
-
-$(LINUX_FUSION_DIR)/.unpacked: $(DL_DIR)/$(LINUX_FUSION_SOURCE)
-	$(LINUX_FUSION_CAT) $(DL_DIR)/$(LINUX_FUSION_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LINUX_FUSION_DIR) package/linux-fusion/ linux-fusion\*.patch
-	touch $@
 
-$(LINUX_FUSION_DIR)/.install: $(LINUX_FUSION_DIR)/.unpacked
+define LINUX_FUSION_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/lib/modules/$(LINUX_FOR_FUSION)/source/include/linux
-	echo "LINUX=$(LINUX26_VERSION)"
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		$(LINUX_FUSION_MAKE_OPTS) \
-		-C $(LINUX_FUSION_DIR) install
-	rm -f $(TARGET_DIR)/usr/include/linux/fusion.h
+		INSTALL_MOD_PATH=$(STAGING_DIR) \
+		-C $(@D) headers_install
+endef
+
+define LINUX_FUSION_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(LINUX_FUSION_MAKE_OPTS) \
+		INSTALL_MOD_PATH=$(TARGET_DIR) \
+		-C $(@D) install
 	mkdir -p $(LINUX_FUSION_ETC_DIR)
 	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
-	touch $@
-
-
-linux-fusion-source: $(DL_DIR)/$(LINUX_FUSION_SOURCE)
+endef
 
-linux-fusion-unpacked: $(LINUX_FUSION_DIR)/.unpacked
-
-linux-fusion: linux26 $(LINUX_FUSION_DIR)/.install
-
-linux-fusion-clean:
-	-$(MAKE) -C $(LINUX_FUSION_DIR) clean
-	rm -f $(STAGING_DIR)/usr/include/linux/fusion.h
-	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX_FOR_FUSION)/drivers/char/fusion
-	rm -f $(LINUX_FUSION_DIR)/.install
-
-linux-fusion-dirclean:
-	rm -rf $(LINUX_FUSION_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LINUX_FUSION),y)
-TARGETS+=linux-fusion
-endif
+define LINUX_FUSION_UNINSTALL_TARGET_UDEV
+	rm -f $(LINUX_FUSION_ETC_DIR)/40-fusion.rules
+endef
 
+$(eval $(call GENTARGETS,package,linux-fusion))
-- 
1.6.6.1
