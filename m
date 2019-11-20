From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Nov 2019 14:45:23 +0200
Subject: [Buildroot] [PATCH] cpuburn-arm: new package
Message-ID: <6ded876c79c3406bd7c6d0c89bc5c4d54c854d84.1574253923.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpuburn-arm burns CPU cycles to generate as much heat as possible.
Useful for stress testing.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/cpuburn-arm/Config.in        | 14 +++++++++++++
 package/cpuburn-arm/cpuburn-arm.hash |  3 +++
 package/cpuburn-arm/cpuburn-arm.mk   | 31 ++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/cpuburn-arm/Config.in
 create mode 100644 package/cpuburn-arm/cpuburn-arm.hash
 create mode 100644 package/cpuburn-arm/cpuburn-arm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 991be8984992..275cb686c416 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -274,6 +274,7 @@ N:	Baruch Siach <baruch@tkos.co.il>
 F:	board/solidrun/clearfog_gt_8k/
 F:	configs/solidrun_clearfog_gt_8k_defconfig
 F:	package/18xx-ti-utils/
+F:	package/cpuburn-arm/
 F:	package/daemon/
 F:	package/dropbear/
 F:	package/ebtables/
diff --git a/package/Config.in b/package/Config.in
index f72c77b416b6..aef2227ec125 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -418,6 +418,7 @@ endmenu
 	source "package/cbootimage/Config.in"
 	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
+	source "package/cpuburn-arm/Config.in"
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
diff --git a/package/cpuburn-arm/Config.in b/package/cpuburn-arm/Config.in
new file mode 100644
index 000000000000..afea5aae0b69
--- /dev/null
+++ b/package/cpuburn-arm/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CPUBURN_ARM_ARCH_SUPPORT
+	bool
+	default y
+	depends on BR2_cortex_a7 || BR2_cortex_a8 || BR2_cortex_a9 || \
+		BR2_cortex_a53
+
+config BR2_PACKAGE_CPUBURN_ARM
+	bool "cpuburn-arm"
+	depends on BR2_PACKAGE_CPUBURN_ARM_ARCH_SUPPORT
+	help
+	  Make ARM cores generate as much heat as possible. Supports
+	  Cortex A7/A8/A9/A53.
+
+	  https://github.com/ssvb/cpuburn-arm
diff --git a/package/cpuburn-arm/cpuburn-arm.hash b/package/cpuburn-arm/cpuburn-arm.hash
new file mode 100644
index 000000000000..55f34f87f8ea
--- /dev/null
+++ b/package/cpuburn-arm/cpuburn-arm.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 354381ec8c352e6c84875ac034004df44b0ed0ac097c400b8d2e47652815c3a2  cpuburn-arm-ad7e646700d14b81413297bda02fb7fe96613c3f.tar.gz
+sha256 47f10095a04d16c8d8d52598371fa01b6a6e87134083b9ec3c43d83ff8576f55  cpuburn-a7.S
diff --git a/package/cpuburn-arm/cpuburn-arm.mk b/package/cpuburn-arm/cpuburn-arm.mk
new file mode 100644
index 000000000000..649ffd224bfd
--- /dev/null
+++ b/package/cpuburn-arm/cpuburn-arm.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# cpuburn-arm
+#
+################################################################################
+
+CPUBURN_ARM_VERSION = ad7e646700d14b81413297bda02fb7fe96613c3f
+CPUBURN_ARM_SITE = $(call github,ssvb,cpuburn-arm,$(CPUBURN_ARM_VERSION))
+CPUBURN_ARM_LICENSE = MIT
+CPUBURN_ARM_LICENSE_FILES = cpuburn-a7.S
+
+ifeq ($(BR2_cortex_a7),y)
+CPUBURN_ARM_SRC = cpuburn-a7.S
+else ifeq ($(BR2_cortex_a8),y)
+CPUBURN_ARM_SRC = cpuburn-a8.S
+else ifeq ($(BR2_cortex_a9),y)
+CPUBURN_ARM_SRC = cpuburn-a9.S
+else ifeq ($(BR2_cortex_a53),y)
+CPUBURN_ARM_SRC = cpuburn-a53.S
+endif
+
+define CPUBURN_ARM_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/cpuburn \
+		$(@D)/$(CPUBURN_ARM_SRC)
+endef
+
+define CPUBURN_ARM_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/cpuburn $(TARGET_DIR)/usr/bin/cpuburn
+endef
+
+$(eval $(generic-package))
-- 
2.24.0
