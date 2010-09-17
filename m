From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:59 -0700
Subject: [Buildroot] [PATCH 14/17] TI's MFP Linux utils
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-15-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in                               |    1 +
 package/ti/ti-linuxutils/Config.in                 |    8 +++
 .../ti-linuxutils/ti-linuxutils-irqk_kmalloc.patch |   14 +++++
 package/ti/ti-linuxutils/ti-linuxutils.mk          |   61 ++++++++++++++++++++
 4 files changed, 84 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-linuxutils/Config.in
 create mode 100644 package/ti/ti-linuxutils/ti-linuxutils-irqk_kmalloc.patch
 create mode 100644 package/ti/ti-linuxutils/ti-linuxutils.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index 8e47e57..7ede23a 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -41,6 +41,7 @@ comment "Target components"
 source "package/ti/ti-codecs-omap3/Config.in"
 source "package/ti/ti-dsplink/Config.in"
 source "package/ti/ti-gst-plugin/Config.in"
+source "package/ti/ti-linuxutils/Config.in"
 
 comment "Staging tools"
 source "package/ti/ti-biosutils/Config.in"
diff --git a/package/ti/ti-linuxutils/Config.in b/package/ti/ti-linuxutils/Config.in
new file mode 100644
index 0000000..c1872d8
--- /dev/null
+++ b/package/ti/ti-linuxutils/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TI_LINUXUTILS
+	bool "MFP Linux utils"
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3
+	help
+	  MFP Linux utils for TI ARM/DSP processors (a.k.a. ti-linuxutils). 
+	  You will need to add a startup script to load the different kernel 
+	  modules (cmemk,sdmak,etc.) manually as it is different for each platform 
+	  and usage.
diff --git a/package/ti/ti-linuxutils/ti-linuxutils-irqk_kmalloc.patch b/package/ti/ti-linuxutils/ti-linuxutils-irqk_kmalloc.patch
new file mode 100644
index 0000000..5b65104
--- /dev/null
+++ b/package/ti/ti-linuxutils/ti-linuxutils-irqk_kmalloc.patch
@@ -0,0 +1,14 @@
+diff -rupN a/packages/ti/sdo/linuxutils/irq/src/module/irqk.c b/packages/ti/sdo/linuxutils/irq/src/module/irqk.c
+--- a/packages/ti/sdo/linuxutils/irq/src/module/irqk.c	2010-07-22 15:28:20.000000000 -0700
++++ b/packages/ti/sdo/linuxutils/irq/src/module/irqk.c	2010-09-09 05:57:44.663063814 -0700
+@@ -56,6 +56,10 @@
+ #include <mach/mux.h>
+ #endif  /* defined(LSP_210) */
+ #endif
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,34)
++#include <linux/slab.h>
++#endif
++
+ 
+ #include "irqk.h"
+ 
diff --git a/package/ti/ti-linuxutils/ti-linuxutils.mk b/package/ti/ti-linuxutils/ti-linuxutils.mk
new file mode 100644
index 0000000..f520c7a
--- /dev/null
+++ b/package/ti/ti-linuxutils/ti-linuxutils.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# ti-linuxutils
+#
+################################################################################
+TI_LINUXUTILS_VERSION:=2.25.05.11
+TI_LINUXUTILS_FILE_VERSION:=2_25_05_11
+TI_LINUXUTILS_SOURCE = linuxutils_$(TI_LINUXUTILS_FILE_VERSION).tar.gz
+TI_LINUXUTILS_SITE = http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/linuxutils/$(TI_LINUXUTILS_FILE_VERSION)/exports
+TI_LINUXUTILS_DIR:=$(BUILD_DIR)/ti-linuxutils-$(TI_LINUXUTILS_VERSION)
+
+TI_LINUXUTILS_INSTALL_STAGING = YES
+
+TI_LINUXUTILS_INSTALL_STAGING_DIR=$(STAGING_DIR)/ti/linuxutils-$(TI_LINUXUTILS_VERSION)
+
+TI_LINUXUTILS_DEPENDENCIES=linux26
+
+TI_LINUXUTILS_BUILD_MAKE_ARGS = \
+	CC=$(TARGET_CC) \
+	LD=$(TARGET_LD) \
+	MVTOOL_PREFIX=$(TARGET_CROSS) \
+	UCTOOL_PREFIX=$(TARGET_CROSS)\
+	LINUXKERNEL_INSTALL_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION) \
+	EXEC_DIR=$(TARGET_DIR)/usr/lib/ti-linuxutils
+
+TI_LINUXUTILS_MODULES = cmem
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_omap3),y)
+	TI_LINUXUTILS_MODULES += sdma
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_dm365),y)
+	TI_LINUXUTILS_MODULES += edma irq
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_dm368),y)
+	#TODO: Verify this
+	TI_LINUXUTILS_MODULES += edma irq
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_dm355),y)
+	TI_LINUXUTILS_MODULES += edma irq
+endif
+
+define TI_LINUXUTILS_BUILD_CMDS
+	for i in $(TI_LINUXUTILS_MODULES) ; do \
+		$(MAKE) $(TI_LINUXUTILS_BUILD_MAKE_ARGS) -C $(@D)/packages/ti/sdo/linuxutils/$$i clean debug release; \
+	done
+endef
+
+define TI_LINUXUTILS_INSTALL_STAGING_CMDS
+	$(INSTALL) -d $(TI_LINUXUTILS_INSTALL_STAGING_DIR);
+	cp -pPrf $(TI_LINUXUTILS_DIR)/* $(TI_LINUXUTILS_INSTALL_STAGING_DIR);
+	chmod -R +w $(TI_LINUXUTILS_INSTALL_STAGING_DIR);
+endef
+
+define TI_LINUXUTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/kernel/drivers/dsp
+	for i in $(TI_LINUXUTILS_MODULES) ; do \
+		$(INSTALL) -m 0644 $(@D)/packages/ti/sdo/linuxutils/$$i/src/module/$${i}k.ko $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/kernel/drivers/dsp/$${i}k.ko ; \
+		$(MAKE) $(TI_LINUXUTILS_BUILD_MAKE_ARGS) -C $(@D)/packages/ti/sdo/linuxutils/$${i} install ; \
+	done
+endef
+
+$(eval $(call GENTARGETS,package/ti,ti-linuxutils))
-- 
1.7.0.4
