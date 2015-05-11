From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 11 May 2015 18:14:12 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/openpowerlink2-kernel-drivers:
	new package
In-Reply-To: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
References: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1431360854-18305-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openpowerlink2/Config.in                   |  3 ++
 .../openpowerlink2-kernel-drivers/Config.in        | 33 ++++++++++++++
 .../openpowerlink2-kernel-drivers.mk               | 52 ++++++++++++++++++++++
 package/openpowerlink2/openpowerlink2.mk           |  1 +
 4 files changed, 89 insertions(+)
 create mode 100644 package/openpowerlink2/openpowerlink2-kernel-drivers/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk

diff --git a/package/openpowerlink2/Config.in b/package/openpowerlink2/Config.in
index 757615f..f6d39d7 100644
--- a/package/openpowerlink2/Config.in
+++ b/package/openpowerlink2/Config.in
@@ -60,6 +60,7 @@ config BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
 config BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB
 	bool "build EPL stack as linux kernelspace module."
 	depends on BR2_LINUX_KERNEL # openpowerlink-kernel-driver
+	select BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS
 	help
 	  Compile openPOWERLINK application library which contains the
 	  interface to a Linux kernel space driver. This will also build
@@ -70,6 +71,8 @@ comment "openpowerlink kernel stack needs a Linux kernel to be built"
 
 endchoice
 
+source "package/openpowerlink2/openpowerlink2-kernel-drivers/Config.in"
+
 config BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL
 	string "debug level for openpowerlink stack"
 	default "0xEC000000L"
diff --git a/package/openpowerlink2/openpowerlink2-kernel-drivers/Config.in b/package/openpowerlink2/openpowerlink2-kernel-drivers/Config.in
new file mode 100644
index 0000000..137a023
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-kernel-drivers/Config.in
@@ -0,0 +1,33 @@
+
+config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS
+	bool "openpowerlink2 kernel drivers"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB
+	help
+	  The openPOWERLINK stack is implemented as Linux kernel module.
+	  This solution provides the best performance, but is limited to
+	  the available openPOWERLINK network drivers.
+
+if BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS
+
+choice
+	prompt "select Ethernet Powerlink Driver"
+
+config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER_82573
+	bool "Intel 82573"
+
+config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER_8255x
+	bool "Intel 8255x"
+
+config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER_I210
+	bool "Intel I210"
+
+config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER_RTL8111
+	bool "Realtek RTL-8111/8168"
+
+config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER_RTL8139
+	bool "Realtek RTL-8139"
+
+endchoice
+
+endif # BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS
diff --git a/package/openpowerlink2/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk b/package/openpowerlink2/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk
new file mode 100644
index 0000000..7b7f58b
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# openpowerlink2-kernel-drivers
+#
+################################################################################
+
+OPENPOWERLINK2_KERNEL_DRIVERS_VERSION = $(OPENPOWERLINK2_VERSION)
+OPENPOWERLINK2_KERNEL_DRIVERS_SITE = $(OPENPOWERLINK2_SITE)
+OPENPOWERLINK2_KERNEL_DRIVERS_SOURCE = $(OPENPOWERLINK2_SOURCE)
+OPENPOWERLINK2_KERNEL_DRIVERS_LICENSE = $(OPENPOWERLINK2_LICENSE)
+OPENPOWERLINK2_KERNEL_DRIVERS_LICENSE_FILES = $(OPENPOWERLINK2_LICENSE_FILES)
+
+OPENPOWERLINK2_KERNEL_DRIVERS_DEPENDENCIES = linux openpowerlink2
+
+define OPENPOWERLINK2_KERNEL_DRIVERS_EXTRACT_CMDS
+	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
+endef
+
+define OPENPOWERLINK2_KERNEL_DRIVERS_APPLY_PATCHES
+	$(APPLY_PATCHES) $(@D) package/openpowerlink2 \*.patch
+endef
+
+OPENPOWERLINK2_KERNEL_DRIVERS_POST_PATCH_HOOKS += \
+	OPENPOWERLINK2_KERNEL_DRIVERS_APPLY_PATCHES
+
+OPENPOWERLINK2_KERNEL_DRIVERS_SUBDIR = drivers/linux/drv_kernelmod_edrv
+
+# CFG_DEBUG_LVL is taken into account only in Debug
+ifeq ($(BR2_ENABLE_DEBUG),y)
+OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS = \
+	-DCFG_DEBUG_LVL="$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL))"
+endif
+
+OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += \
+	-DCFG_KERNEL_DIR=$(LINUX_DIR) \
+	-DCMAKE_SYSTEM_VERSION=$(LINUX_VERSION) \
+	-DCFG_OPLK_MN=$(OPENPOWERLINK2_MN_ONOFF)
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS_82573),y)
+OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=82573
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS_8255x),y)
+OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=8255x
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS_I210),y)
+OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=I210
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS_RTL8139),y)
+OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=8139
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVERS_RTL8111),y)
+OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_POWERLINK_EDRV=8111
+endif
+
+$(eval $(cmake-package))
diff --git a/package/openpowerlink2/openpowerlink2.mk b/package/openpowerlink2/openpowerlink2.mk
index ea3afa7..7092ba5 100644
--- a/package/openpowerlink2/openpowerlink2.mk
+++ b/package/openpowerlink2/openpowerlink2.mk
@@ -69,3 +69,4 @@ OPENPOWERLINK2_CONF_OPTS += \
 
 $(eval $(cmake-package))
 
+include $(wildcard package/openpowerlink2/*/*.mk)
-- 
1.9.3
