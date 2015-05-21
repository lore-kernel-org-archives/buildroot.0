From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 21 May 2015 19:03:00 -0400
Subject: [Buildroot] [PATCH 1/1] package/cpupower: new package
Message-ID: <1432249380-5920-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/Config.in            |  1 +
 package/cpupower/Config.in   | 10 ++++++++++
 package/cpupower/cpupower.mk | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 package/cpupower/Config.in
 create mode 100644 package/cpupower/cpupower.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..0bd6eb6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1378,6 +1378,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/coreutils/Config.in"
 endif
 	source "package/cpuload/Config.in"
+	source "package/cpupower/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
diff --git a/package/cpupower/Config.in b/package/cpupower/Config.in
new file mode 100644
index 0000000..745dd2b
--- /dev/null
+++ b/package/cpupower/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_CPUPOWER
+	bool "cpupower"
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_PCIUTILS
+	help
+	  cpupower is a collection of tools to examine and tune power 
+	  saving related features of your processor.
+
+comment "cpupower needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/cpupower/cpupower.mk b/package/cpupower/cpupower.mk
new file mode 100644
index 0000000..cb1f938
--- /dev/null
+++ b/package/cpupower/cpupower.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# cpupower
+#
+################################################################################
+
+# Source taken from the Linux kernel tree
+CPUPOWER_SOURCE =
+CPUPOWER_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+
+CPUPOWER_DEPENDENCIES = linux pciutils
+
+define CPUPOWER_BUILD_CMDS
+	$(Q)if test ! -f $(LINUX_DIR)/tools/power/cpupower/Makefile ; then \
+		echo "Your kernel version is too old and does not have the cpupower tool." ; \
+		echo "At least kernel 3.4 must be used." ; \
+		exit 1 ; \
+	fi
+	
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		CROSS=$(TARGET_CROSS) \
+		CPUFREQ_BENCH=false \
+		DEBUG=false \
+		cpupower
+endef
+
+define CPUPOWER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(LINUX_DIR)/tools/power/cpupower/cpupower \
+		$(TARGET_DIR)/usr/bin/cpupower
+
+	$(INSTALL) -D -m 0755 $(LINUX_DIR)/tools/power/cpupower/libcpupower.so.0.0.0 \
+		$(TARGET_DIR)/lib/libcpupower.so.0.0.0
+	ln -snf libcpupower.so.0.0.0 $(TARGET_DIR)/lib/libcpupower.so
+	ln -snf libcpupower.so.0.0.0 $(TARGET_DIR)/lib/libcpupower.so.0
+endef
+
+$(eval $(generic-package))
-- 
1.9.5.msysgit.1
