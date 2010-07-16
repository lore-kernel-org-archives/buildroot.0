From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jul 2010 23:45:43 +0200
Subject: [Buildroot] [PATCH 2/2] linux-fusion: many fixes
In-Reply-To: <cover.1279316732.git.thomas.petazzoni@free-electrons.com>
References: <cover.1279316732.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2fc19d0e194f6d0383f9cb671d0fb479d01a8aac.1279316732.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes several issues with linux-fusion so that it builds
properly with the current Buildroot:

 * Following the rework of the Linux kernel build process in
   Buildroot, a few adaptations were needed: depend on
   BR2_LINUX_KERNEL instead of !BR2_KERNEL_none, use
   $(LINUX26_VERSION_PROBED) to get the real kernel version, etc.

 * Add a LINUX_FUSION_BUILD_CMDS that actually does the build of
   linux-fusion.

 * Define SYSROOT for linux-fusion to TARGET_DIR so that at target
   installation, kernel modules are installed in $(TARGET_DIR)

 * Replace the staging installation by a simple one-liner that only
   installs the linux fusion header, needed for DirectFB to use the
   fusion kernel module

 * Fix the uninstallation macros. They have been misunderstood as
   hooks, while their are in fact normal macros.

 * Add a patch to fix a build failure in linux-fusion itself (missing
   <linux/sched.h> include in fusiondev.c)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in                         |    2 +-
 package/linux-fusion/Config.in                     |    2 +-
 .../linux-fusion-8.1.1-missing-include.patch       |   17 ++++++++
 package/linux-fusion/linux-fusion.mk               |   43 ++++++-------------
 4 files changed, 33 insertions(+), 31 deletions(-)
 create mode 100644 package/linux-fusion/linux-fusion-8.1.1-missing-include.patch

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 8a0a736..1dedb8f 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -10,7 +10,7 @@ if BR2_PACKAGE_DIRECTFB
 config BR2_PACKAGE_DIRECTFB_MULTI
 	bool "directfb multi application"
 	select BR2_PACKAGE_LINUX_FUSION
-	depends on !BR2_KERNEL_none
+	depends on BR2_LINUX_KERNEL
 	help
 	  Enable use of multiple concurrent DirectFB applications
 
diff --git a/package/linux-fusion/Config.in b/package/linux-fusion/Config.in
index ebd00b4..197e81b 100644
--- a/package/linux-fusion/Config.in
+++ b/package/linux-fusion/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_LINUX_FUSION
-	depends on !BR2_KERNEL_none
+	depends on BR2_LINUX_KERNEL
 	bool "linux-fusion communication layer for DirectFB multi"
 	help
 	  DirectFB Communication Layer allowing multiple DirectFB
diff --git a/package/linux-fusion/linux-fusion-8.1.1-missing-include.patch b/package/linux-fusion/linux-fusion-8.1.1-missing-include.patch
new file mode 100644
index 0000000..d7b6f23
--- /dev/null
+++ b/package/linux-fusion/linux-fusion-8.1.1-missing-include.patch
@@ -0,0 +1,17 @@
+fusiondev.c does not compile due to TASK_INTERRUPTIBLE and other
+related constants not being defined.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: linux-fusion-8.1.1/linux/drivers/char/fusion/fusiondev.c
+===================================================================
+--- linux-fusion-8.1.1.orig/linux/drivers/char/fusion/fusiondev.c	2010-07-16 22:49:23.000000000 +0200
++++ linux-fusion-8.1.1/linux/drivers/char/fusion/fusiondev.c	2010-07-16 22:49:39.000000000 +0200
+@@ -32,6 +32,7 @@
+ #include <linux/proc_fs.h>
+ #include <linux/poll.h>
+ #include <linux/init.h>
++#include <linux/sched.h>
+ #include <asm/io.h>
+ #include <asm/uaccess.h>
+ 
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 54f53a3..e7cd3e4 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -7,60 +7,45 @@ LINUX_FUSION_VERSION = 8.1.1
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
+LINUX_FUSION_DEPENDENCIES = linux26
 
-# BR2_LINUX26_VERSION is not really dependable
-# LINUX26_VERSION is not yet set.
-# Retrieve REAL kernel version from file.
-LINUX_FOR_FUSION=$(LINUX_VERSION)
-# `cat $(BUILD_DIR)/.linux-version`
+LINUX_FOR_FUSION=$(LINUX26_VERSION_PROBED)
 LINUX_FUSION_ETC_DIR=$(TARGET_DIR)/etc/udev/rules.d
 
-LINUX_FUSION_CAT=$(ZCAT)
-
 LINUX_FUSION_MAKE_OPTS =  KERNEL_VERSION=$(LINUX_FOR_FUSION)
-LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(BUILD_DIR)/linux-$(LINUX_FOR_FUSION)
-LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(BUILD_DIR)/linux-$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX26_DIR)
+LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX26_DIR)
 
-LINUX_FUSION_MAKE_OPTS += SYSROOT=$(STAGING_DIR)
+LINUX_FUSION_MAKE_OPTS += SYSROOT=$(TARGET_DIR)
 LINUX_FUSION_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
 LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
-LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)
-LINUX_FUSION_MAKE_OPTS += DESTDIR=$(BUILD_DIR)/root
-LINUX_FUSION_MAKE_OPTS += HEADERDIR=$(STAGING_DIR)
-#LINUX_FUSION_MAKE_OPTS +=
-
-#LINUX_FUSION_MAKE_OPTS += __KERNEL__=$(LINUX26_VERSION)
+LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)/kernel
 
+define LINUX_FUSION_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LINUX_FUSION_MAKE_OPTS) -C $(@D)
+endef
 
+# Only the header file is needed in the staging directory
 define LINUX_FUSION_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/lib/modules/$(LINUX_FOR_FUSION)/source/include/linux
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(LINUX_FUSION_MAKE_OPTS) \
-		INSTALL_MOD_PATH=$(STAGING_DIR) \
-		-C $(@D) install
+	install -m 644 $(@D)/linux/include/linux/fusion.h $(STAGING_DIR)/usr/include/linux
 endef
 
 define LINUX_FUSION_INSTALL_TARGET_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		$(LINUX_FUSION_MAKE_OPTS) \
-		INSTALL_MOD_PATH=$(TARGET_DIR) \
 		-C $(@D) install
 	mkdir -p $(LINUX_FUSION_ETC_DIR)
 	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
 endef
 
-define LINUX_FUSION_UNINSTALL_STAGING
+define LINUX_FUSION_UNINSTALL_STAGING_CMDS
 	rm -f $(STAGING_DIR)/usr/include/linux/fusion.h
 endef
 
-LINUX_FUSION_UNINSTALL_STAGING_CMDS += LINUX_FUSION_UNINSTALL_STAGING
-
-define LINUX_FUSION_UNINSTALL_TARGET
+define LINUX_FUSION_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/include/linux/fusion.h
-	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX_FOR_FUSION)/drivers/char/fusion
+	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX_FOR_FUSION)/kernel/drivers/char/fusion
 	rm -f $(LINUX_FUSION_ETC_DIR)/40-fusion.rules
 endef
 
-LINUX_FUSION_UNINSTALL_TARGET_CMDS += LINUX_FUSION_UNINSTALL_TARGET
-
 $(eval $(call GENTARGETS,package,linux-fusion))
-- 
1.7.0.4
