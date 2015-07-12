From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 12 Jul 2015 18:44:04 +0200
Subject: [Buildroot] [PATCH 3/3] package/perf: migrate perf to use the new
	linux-tools infrastructure
In-Reply-To: <1436719444-9722-1-git-send-email-romain.naour@openwide.fr>
References: <1436719444-9722-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1436719444-9722-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove perf package and add legacy handling.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy                                 |  7 +++++++
 linux/Config.tools.in                            | 18 ++++++++++++++++
 package/perf/perf.mk => linux/linux-tool-perf.mk | 26 ++++++++++--------------
 package/Config.in                                |  1 -
 package/perf/Config.in                           | 21 -------------------
 5 files changed, 36 insertions(+), 37 deletions(-)
 rename package/perf/perf.mk => linux/linux-tool-perf.mk (78%)
 delete mode 100644 package/perf/Config.in

diff --git a/Config.in.legacy b/Config.in.legacy
index edf9912..a5f84e8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_PERF
+	bool "perf"
+	select BR2_LEGACY
+	select BR2_LINUX_KERNEL_TOOL_PERF
+	help
+	  Perf package has been moved to linux tools package.
+
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	bool "gpu-viv-bin-mx6q"
 	select BR2_LEGACY
diff --git a/linux/Config.tools.in b/linux/Config.tools.in
index 008e68c..0c94d55 100644
--- a/linux/Config.tools.in
+++ b/linux/Config.tools.in
@@ -8,4 +8,22 @@ config BR2_LINUX_KERNEL_TOOL_CPUPOWER
 	  cpupower is a collection of tools to examine and tune power
 	  saving related features of your processor.
 
+config BR2_LINUX_KERNEL_TOOL_PERF
+	bool "perf"
+	help
+	  perf (sometimes "Perf Events" or perf tools, originally
+	  "Performance Counters for Linux") - is a performance
+	  analyzing tool in Linux, available from kernel version
+	  2.6.31. User-space controlling utility, called 'perf' has
+	  git-like interface with subcommands. It is capable of
+	  statistical profiling of entire system (both kernel and user
+	  code), single CPU or severals threads.
+
+	  This package builds and install the userspace 'perf'
+	  command. It is up to the user to ensure that the kernel
+	  configuration has all the suitable options enabled to allow a
+	  proper operation of 'perf'.
+
+	  https://perf.wiki.kernel.org/
+
 endmenu
diff --git a/package/perf/perf.mk b/linux/linux-tool-perf.mk
similarity index 78%
rename from package/perf/perf.mk
rename to linux/linux-tool-perf.mk
index 36989fc..a91a511 100644
--- a/package/perf/perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -1,16 +1,14 @@
 ################################################################################
 #
-# perf
+# Linux kernel Perf tool
 #
 ################################################################################
 
-# Source taken from the Linux kernel tree
-PERF_SOURCE =
-PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_TOOLS += perf
 
-PERF_DEPENDENCIES = linux host-flex host-bison
+LINUX_TOOL_PERF_DEPENDENCIES = host-flex host-bison
 
-PERF_MAKE_FLAGS = \
+LINUX_TOOL_PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
 	NO_LIBAUDIT=1 \
 	NO_NEWT=1 \
@@ -29,16 +27,16 @@ PERF_MAKE_FLAGS = \
 # backtrace will contain only several functions from the top of stack,
 # instead of the complete backtrace.
 ifeq ($(BR2_arc),y)
-PERF_MAKE_FLAGS += NO_BACKTRACE=1
+LINUX_TOOL_PERF_MAKE_FLAGS += NO_BACKTRACE=1
 endif
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
-PERF_DEPENDENCIES += elfutils
+LINUX_TOOL_PERF_DEPENDENCIES += elfutils
 else
-PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
+LINUX_TOOL_PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
 endif
 
-define PERF_BUILD_CMDS
+define LINUX_TOOL_PERF_BUILD_CMDS
 	$(Q)if test ! -f $(LINUX_DIR)/tools/perf/Makefile ; then \
 		echo "Your kernel version is too old and does not have the perf tool." ; \
 		echo "At least kernel 2.6.31 must be used." ; \
@@ -54,15 +52,13 @@ define PERF_BUILD_CMDS
 		fi \
 	fi
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/perf \
-		$(PERF_MAKE_FLAGS) O=$(@D)
+		$(LINUX_TOOL_PERF_MAKE_FLAGS) O=$(@D)
 endef
 
 # After installation, we remove the Perl and Python scripts from the
 # target.
-define PERF_INSTALL_TARGET_CMDS
+define LINUX_TOOL_PERF_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/perf \
-		$(PERF_MAKE_FLAGS) O=$(@D) install
+		$(LINUX_TOOL_PERF_MAKE_FLAGS) O=$(@D) install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 endef
-
-$(eval $(generic-package))
diff --git a/package/Config.in b/package/Config.in
index e1b81a9..4e2e5a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -88,7 +88,6 @@ endif
 	source "package/netperf/Config.in"
 	source "package/oprofile/Config.in"
 	source "package/pax-utils/Config.in"
-	source "package/perf/Config.in"
 	source "package/pv/Config.in"
 	source "package/racehound/Config.in"
 	source "package/ramsmp/Config.in"
diff --git a/package/perf/Config.in b/package/perf/Config.in
deleted file mode 100644
index 05c9870..0000000
--- a/package/perf/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-config BR2_PACKAGE_PERF
-	bool "perf"
-	depends on BR2_LINUX_KERNEL
-	help
-	  perf (sometimes "Perf Events" or perf tools, originally
-	  "Performance Counters for Linux") - is a performance
-	  analyzing tool in Linux, available from kernel version
-	  2.6.31. User-space controlling utility, called 'perf' has
-	  git-like interface with subcommands. It is capable of
-	  statistical profiling of entire system (both kernel and user
-	  code), single CPU or severals threads.
-
-	  This package builds and install the userspace 'perf'
-	  command. It is up to the user to ensure that the kernel
-	  configuration has all the suitable options enabled to allow a
-	  proper operation of 'perf'.
-
-	  https://perf.wiki.kernel.org/
-
-comment "perf needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-- 
2.4.3
