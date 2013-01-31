From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Fri,  1 Feb 2013 03:48:36 +0800
Subject: [Buildroot] [PATCH 1/1] kernel: add support for building kernel
	companied userspace tools
Message-ID: <1359661716-18081-1-git-send-email-roylee17@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change-Id: I66bdceb3cd76bb69b069b5bd8064e59a67374521
Signed-off-by: Tzu-Jung Lee <roylee17@gmail.com>
---
 linux/Config.in       |  3 +++
 linux/Config.tools.in | 15 +++++++++++++++
 linux/linux-tools.mk  | 19 +++++++++++++++++++
 linux/linux.mk        |  1 +
 4 files changed, 38 insertions(+)
 create mode 100644 linux/Config.tools.in
 create mode 100644 linux/linux-tools.mk

diff --git a/linux/Config.in b/linux/Config.in
index 175a999..19ff356 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -288,6 +288,9 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 # Linux extensions
 source "linux/Config.ext.in"
 
+# Linux userspace tools
+source "linux/Config.tools.in"
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
diff --git a/linux/Config.tools.in b/linux/Config.tools.in
new file mode 100644
index 0000000..9fd3ac4
--- /dev/null
+++ b/linux/Config.tools.in
@@ -0,0 +1,15 @@
+#menu BR2_LINUX_KERNEL_TOOLS
+menu "Linux Kernel Userspace Tools"
+
+# Perf
+config BR2_LINUX_KERNEL_TOOLS_PERF
+	bool "Build Performance analysis tools for Linux"
+	default n
+	select BR2_PACKAGE_LIBELF
+	help
+	  Performance counters for Linux are a new kernel-based
+	  subsystem that provide a framework for all things
+	  performance analysis.  It covers hardware level (CPU/PMU,
+	  Performance Monitoring Unit) features and software features
+	  (software counters, tracepoints) as well.
+endmenu
diff --git a/linux/linux-tools.mk b/linux/linux-tools.mk
new file mode 100644
index 0000000..6499dd7
--- /dev/null
+++ b/linux/linux-tools.mk
@@ -0,0 +1,19 @@
+define LINUX_BUILD_KERNEL_TOOLS_PERF
+	@$(call MESSAGE,"Building Kernel Tools - Perf")
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)/tools/perf \
+		prefix=$(TARGET_DIR)/usr
+endef
+
+define LINUX_INSTALL_KERNEL_TOOLS_PERF
+	@$(call MESSAGE,"Installing Kernel Tools - Perf")
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)/tools/perf \
+		prefix=$(TARGET_DIR)/usr install
+endef
+
+ifeq ($(BR2_LINUX_KERNEL_TOOLS_PERF),y)
+LINUX_BUILD_KERNEL_TOOLS	+= LINUX_BUILD_KERNEL_TOOLS_PERF
+LINUX_INSTALL_KERNEL_TOOLS	+= LINUX_INSTALL_KERNEL_TOOLS_PERF
+endif
+
+LINUX_POST_BUILD_HOOKS		+= $(LINUX_BUILD_KERNEL_TOOLS)
+LINUX_POST_INSTALL_TARGET_HOOKS	+= $(LINUX_INSTALL_KERNEL_TOOLS)
diff --git a/linux/linux.mk b/linux/linux.mk
index 91a9f50..95bf4a5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -265,6 +265,7 @@ define LINUX_INSTALL_TARGET_CMDS
 endef
 
 include linux/linux-ext-*.mk
+include linux/linux-tools.mk
 
 $(eval $(generic-package))
 
-- 
1.8.1
