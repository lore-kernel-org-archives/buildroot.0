From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 12 Jul 2015 18:44:03 +0200
Subject: [Buildroot] [PATCH 2/3] linux-tools: add cpupower
In-Reply-To: <1436719444-9722-1-git-send-email-romain.naour@openwide.fr>
References: <1436719444-9722-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1436719444-9722-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on the patch send by James Knight:
http://lists.busybox.net/pipermail/buildroot/2015-May/128754.html

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: James Knight <james.knight@rockwellcollins.com>
---
 linux/Config.in              |  3 +++
 linux/Config.tools.in        | 11 +++++++++++
 linux/linux-tool-cpupower.mk | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 linux/Config.tools.in
 create mode 100644 linux/linux-tool-cpupower.mk

diff --git a/linux/Config.in b/linux/Config.in
index 8c86a1a..097cde5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -364,6 +364,9 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 # Linux extensions
 source "linux/Config.ext.in"
 
+# Linux tools
+source "linux/Config.tools.in"
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
diff --git a/linux/Config.tools.in b/linux/Config.tools.in
new file mode 100644
index 0000000..008e68c
--- /dev/null
+++ b/linux/Config.tools.in
@@ -0,0 +1,11 @@
+menu "Linux Kernel Tools"
+
+config BR2_LINUX_KERNEL_TOOL_CPUPOWER
+	bool "cpupower"
+	depends on !BR2_bfin # pciutils
+	select BR2_PACKAGE_PCIUTILS
+	help
+	  cpupower is a collection of tools to examine and tune power
+	  saving related features of your processor.
+
+endmenu
diff --git a/linux/linux-tool-cpupower.mk b/linux/linux-tool-cpupower.mk
new file mode 100644
index 0000000..0938fac
--- /dev/null
+++ b/linux/linux-tool-cpupower.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# Linux kernel cpupower tool
+#
+################################################################################
+
+LINUX_TOOLS += cpupower
+
+LINUX_TOOL_CPUPOWER_DEPENDENCIES = pciutils
+
+define LINUX_TOOL_CPUPOWER_BUILD_CMDS
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
+define LINUX_TOOL_CPUPOWER_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		CROSS=$(TARGET_CROSS) \
+		CPUFREQ_BENCH=false \
+		DEBUG=false \
+		DESTDIR=$(STAGING_DIR) \
+		cpupower_install
+endef
+
+define LINUX_TOOL_CPUPOWER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		CROSS=$(TARGET_CROSS) \
+		CPUFREQ_BENCH=false \
+		DEBUG=false \
+		DESTDIR=$(TARGET_DIR) \
+		cpupower_install
+endef
-- 
2.4.3
