From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 25 Apr 2015 15:01:19 +0200
Subject: [Buildroot] [PATCH 2/3] package/openpowerlink2: add drivers packages
In-Reply-To: <1429966880-18690-1-git-send-email-romain.naour@openwide.fr>
References: <1429966880-18690-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1429966880-18690-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/openpowerlink2/Config.in                   |  1 +
 .../openpowerlink2-drivers/Config.in               |  3 ++
 .../openpowerlink2-drivers.mk                      |  2 +
 .../openpowerlink2-kernel-drivers/Config.in        | 33 +++++++++++++++
 .../openpowerlink2-kernel-drivers.mk               | 48 ++++++++++++++++++++++
 .../openpowerlink2-pcap-drivers/Config.in          | 12 ++++++
 .../openpowerlink2-pcap-drivers.mk                 | 34 +++++++++++++++
 .../openpowerlink2/openpowerlink2-stack/Config.in  |  2 +
 package/openpowerlink2/openpowerlink2.mk           |  1 +
 9 files changed, 136 insertions(+)
 create mode 100644 package/openpowerlink2/openpowerlink2-drivers/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk
 create mode 100644 package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk
 create mode 100644 package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-drivers/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-drivers/openpowerlink2-pcap-drivers.mk

diff --git a/package/openpowerlink2/Config.in b/package/openpowerlink2/Config.in
index 8e61a7d..c651031 100644
--- a/package/openpowerlink2/Config.in
+++ b/package/openpowerlink2/Config.in
@@ -35,6 +35,7 @@ choice
 
 endchoice
 
+source "package/openpowerlink2/openpowerlink2-drivers/Config.in"
 source "package/openpowerlink2/openpowerlink2-stack/Config.in"
 
 config BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL
diff --git a/package/openpowerlink2/openpowerlink2-drivers/Config.in b/package/openpowerlink2/openpowerlink2-drivers/Config.in
new file mode 100644
index 0000000..95a967f
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-drivers/Config.in
@@ -0,0 +1,3 @@
+
+source "package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/Config.in"
+source "package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-drivers/Config.in"
diff --git a/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk
new file mode 100644
index 0000000..ab5cd1c
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk
@@ -0,0 +1,2 @@
+
+include $(sort $(wildcard package/openpowerlink2/openpowerlink2-drivers/*/*.mk))
diff --git a/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/Config.in b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/Config.in
new file mode 100644
index 0000000..1446dbb
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/Config.in
@@ -0,0 +1,33 @@
+
+config BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER
+	bool "openpowerlink kernel stack"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB
+	help
+	  The openPOWERLINK stack is implemented as Linux kernel module.
+	  This solution provides the best performance, but is limited to
+	  the available openPOWERLINK network drivers.
+
+if BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER
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
+endif # BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER
diff --git a/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk
new file mode 100644
index 0000000..a4470d8
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-kernel-drivers/openpowerlink2-kernel-drivers.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# openpowerlink2-kernel-drivers
+#
+################################################################################
+
+OPENPOWERLINK2_KERNEL_DRIVERS_VERSION = $(OPENPOWERLINK2_VERSION)
+
+OPENPOWERLINK2_KERNEL_DRIVERS_LICENSE = $(OPENPOWERLINK2_LICENSE)
+OPENPOWERLINK2_KERNEL_DRIVERS_LICENSE_FILES = $(OPENPOWERLINK2_LICENSE_FILES)
+
+# We want to use the same archive for all sub-packages.
+OPENPOWERLINK2_KERNEL_DRIVERS_SOURCE =
+OPENPOWERLINK2_KERNEL_DRIVERS_DEPENDENCIES = linux openpowerlink2-stack
+
+define OPENPOWERLINK2_KERNEL_DRIVERS_SYMLINK_TO_SRC_HOOK
+	ln -s $(OPENPOWERLINK2_DIR) $(OPENPOWERLINK2_KERNEL_DRIVERS_DIR)/src
+endef
+
+OPENPOWERLINK2_KERNEL_DRIVERS_POST_EXTRACT_HOOKS += \
+	OPENPOWERLINK2_KERNEL_DRIVERS_SYMLINK_TO_SRC_HOOK
+
+OPENPOWERLINK2_KERNEL_DRIVERS_SUBDIR = src/drivers/linux/drv_kernelmod_edrv
+
+OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS = \
+	-DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL)) \
+	-DCFG_KERNEL_DIR=$(LINUX_DIR) \
+	-DCMAKE_SYSTEM_VERSION=$(LINUX_VERSION)
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_MN),y)
+OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_OPLK_MN=ON
+else
+OPENPOWERLINK2_KERNEL_DRIVERS_CONF_OPTS += -DCFG_OPLK_MN=OFF
+endif
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
diff --git a/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-drivers/Config.in b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-drivers/Config.in
new file mode 100644
index 0000000..6d8df03
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-drivers/Config.in
@@ -0,0 +1,12 @@
+
+config BR2_PACKAGE_OPENPOWERLINK2_PCAP_DRIVER
+	bool "openpowerlink userspace (PCAP) stack"
+	depends on BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  The Linux userspace implementation of the openPOWERLINK stack
+	  provides all functions for a software based POWERLINK solution
+	  running as Linux userspace application. The stack uses the
+	  libpcap library for accessing the network interface and is
+	  therefore totally independant of the used network card and
+	  driver.
diff --git a/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-drivers/openpowerlink2-pcap-drivers.mk b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-drivers/openpowerlink2-pcap-drivers.mk
new file mode 100644
index 0000000..f5a153f
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-pcap-drivers/openpowerlink2-pcap-drivers.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# openpowerlink2-pcap-drivers
+#
+################################################################################
+
+OPENPOWERLINK2_PCAP_DRIVERS_VERSION = $(OPENPOWERLINK2_VERSION)
+
+OPENPOWERLINK2_PCAP_DRIVERS_LICENSE = $(OPENPOWERLINK2_LICENSE)
+OPENPOWERLINK2_PCAP_DRIVERS_LICENSE_FILES = $(OPENPOWERLINK2_LICENSE_FILES)
+
+# We want to use the same archive for all sub-packages.
+OPENPOWERLINK2_PCAP_DRIVERS_SOURCE =
+OPENPOWERLINK2_PCAP_DRIVERS_DEPENDENCIES = libpcap openpowerlink2-stack
+
+define OPENPOWERLINK2_PCAP_DRIVERS_SYMLINK_TO_SRC_HOOK
+	ln -s $(OPENPOWERLINK2_DIR) $(OPENPOWERLINK2_PCAP_DRIVERS_DIR)/src
+endef
+
+OPENPOWERLINK2_PCAP_DRIVERS_POST_EXTRACT_HOOKS += \
+	OPENPOWERLINK2_PCAP_DRIVERS_SYMLINK_TO_SRC_HOOK
+
+OPENPOWERLINK2_PCAP_DRIVERS_SUBDIR = src/drivers/linux/drv_daemon_pcap
+
+OPENPOWERLINK2_PCAP_DRIVERS_CONF_OPTS = \
+	-DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL))
+
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_MN),y)
+OPENPOWERLINK2_PCAP_DRIVERS_CONF_OPTS += -DCFG_OPLK_MN=ON
+else
+OPENPOWERLINK2_PCAP_DRIVERS_CONF_OPTS += -DCFG_OPLK_MN=OFF
+endif
+
+$(eval $(cmake-package))
diff --git a/package/openpowerlink2/openpowerlink2-stack/Config.in b/package/openpowerlink2/openpowerlink2-stack/Config.in
index c3ddf47..ddbccc7 100644
--- a/package/openpowerlink2/openpowerlink2-stack/Config.in
+++ b/package/openpowerlink2/openpowerlink2-stack/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_OPENPOWERLINK2_STACK_MONOLITHIC_USER_STACK_LIB
 config BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
 	bool "build EPL stack as linux userspace pcap daemon."
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_OPENPOWERLINK2_PCAP_DRIVER
 	help
 	  Compile openPOWERLINK application library which contains the
 	  interface to a Linux user space driver, and the Linux user space
@@ -23,6 +24,7 @@ config BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
 config BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB
 	bool "build EPL stack as linux kernelspace module."
 	depends on BR2_LINUX_KERNEL # openpowerlink-kernel-driver
+	select BR2_PACKAGE_OPENPOWERLINK2_KERNEL_DRIVER
 	help
 	  Compile openPOWERLINK application library which contains the
 	  interface to a Linux kernel space driver. It is used together
diff --git a/package/openpowerlink2/openpowerlink2.mk b/package/openpowerlink2/openpowerlink2.mk
index 82c4277..144fa98 100644
--- a/package/openpowerlink2/openpowerlink2.mk
+++ b/package/openpowerlink2/openpowerlink2.mk
@@ -14,4 +14,5 @@ OPENPOWERLINK2_LICENSE_FILES = license.md
 
 $(eval $(generic-package))
 
+include package/openpowerlink2/openpowerlink2-drivers/openpowerlink2-drivers.mk
 include package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk
-- 
1.9.3
