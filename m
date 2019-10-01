From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Tue, 1 Oct 2019 15:42:20 +0300
Subject: [Buildroot] [PATCH 1/1] package/xilinx_axidma: new package
Message-ID: <20191001124220.24763-1-viktar.palstsiuk@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
---
 package/Config.in                        |  1 +
 package/xilinx_axidma/Config.in          |  8 +++++
 package/xilinx_axidma/xilinx_axidma.hash |  2 ++
 package/xilinx_axidma/xilinx_axidma.mk   | 38 ++++++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/xilinx_axidma/Config.in
 create mode 100644 package/xilinx_axidma/xilinx_axidma.hash
 create mode 100644 package/xilinx_axidma/xilinx_axidma.mk

diff --git a/package/Config.in b/package/Config.in
index 4d8fce21c0..ca3367252a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -554,6 +554,7 @@ endmenu
 	source "package/w_scan/Config.in"
 	source "package/wf111/Config.in"
 	source "package/wipe/Config.in"
+	source "package/xilinx_axidma/Config.in"
 	source "package/xorriso/Config.in"
 	source "package/xr819-xradio/Config.in"
 endmenu
diff --git a/package/xilinx_axidma/Config.in b/package/xilinx_axidma/Config.in
new file mode 100644
index 0000000000..9eff093d05
--- /dev/null
+++ b/package/xilinx_axidma/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XILINX_AXIDMA
+	bool "xilinx_axidma"
+	depends on BR2_LINUX_KERNEL
+	help
+	  xilinx_axidma driver.
+
+comment "xilinx_axidma needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/xilinx_axidma/xilinx_axidma.hash b/package/xilinx_axidma/xilinx_axidma.hash
new file mode 100644
index 0000000000..37c26a7486
--- /dev/null
+++ b/package/xilinx_axidma/xilinx_axidma.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 961ad2eab6f078f441e8855697dcd6c364f0781b1dffcb9f95c4686c9825c585  xilinx_axidma-42ed91e83bc4da1e29149b2be0c6a6b8f4549222.tar.gz
diff --git a/package/xilinx_axidma/xilinx_axidma.mk b/package/xilinx_axidma/xilinx_axidma.mk
new file mode 100644
index 0000000000..7c790d6256
--- /dev/null
+++ b/package/xilinx_axidma/xilinx_axidma.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# xilinx_axidma
+#
+################################################################################
+
+XILINX_AXIDMA_VERSION = 42ed91e83bc4da1e29149b2be0c6a6b8f4549222
+XILINX_AXIDMA_SITE = $(call github,bperez77,xilinx_axidma,$(XILINX_AXIDMA_VERSION))
+XILINX_AXIDMA_INSTALL_STAGING = YES
+XILINX_AXIDMA_LICENSE = GPL-2.0
+
+XILINX_AXIDMA_MODULE_MAKE_OPTS = \
+	AXIDMA_MODULE_NAME=axidma \
+	AXIDMA_FILES="axi_dma.c axidma_chrdev.c axidma_dma.c axidma_of.c" \
+	AXIDMA_INC_DIRS=$(@D)/include
+
+XILINX_AXIDMA_MODULE_SUBDIRS = driver
+
+define XILINX_AXIDMA_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) library examples
+endef
+
+define XILINX_AXIDMA_INSTALL_SHARED_LIB
+	$(INSTALL) -D -m 0644 $(@D)/library/libaxidma.so $(1)/usr/lib/libaxidma.so
+endef
+
+define XILINX_AXIDMA_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/include/{libaxidma,axidma_ioctl}.h $(STAGING_DIR)/usr/include/
+	$(call XILINX_AXIDMA_INSTALL_SHARED_LIB,$(STAGING_DIR))
+endef
+
+define XILINX_AXIDMA_INSTALL_TARGET_CMDS
+	$(call XILINX_AXIDMA_INSTALL_SHARED_LIB,$(TARGET_DIR))
+	$(INSTALL) -D -m 0755 $(@D)/examples/axidma_{benchmark,display_image,transfer} $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.17.1
