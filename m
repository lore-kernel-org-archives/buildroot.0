From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 14 Jul 2015 13:31:16 +0200
Subject: [Buildroot] [PATCH v4 3/5] package/perf: migrate perf to use the
	new linux-tools infrastructure
In-Reply-To: <1436873478-13533-1-git-send-email-romain.naour@openwide.fr>
References: <1436873478-13533-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1436873478-13533-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove perf package and add legacy handling.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v4: revert the O=$(@D) removal and add a comment
    why it's needed.
    fix the legacy prompt.
v3: remove last LINUX_TOOL prefix
v2: remove LINUX_TOOL prefix
    use $(D) instead of $(LINUX_DIR)
    fix title style
    remove useless O=$(@D)
---
 Config.in.legacy                                 |  7 +++++++
 linux/Config.tools.in                            | 18 ++++++++++++++++++
 package/perf/perf.mk => linux/linux-tool-perf.mk | 24 +++++++++++-------------
 package/Config.in                                |  1 -
 package/perf/Config.in                           | 21 ---------------------
 5 files changed, 36 insertions(+), 35 deletions(-)
 rename package/perf/perf.mk => linux/linux-tool-perf.mk (72%)
 delete mode 100644 package/perf/Config.in

diff --git a/Config.in.legacy b/Config.in.legacy
index 0a8d0a6..326ba68 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_PERF
+	bool "perf option has been renamed"
+	select BR2_LEGACY
+	select BR2_LINUX_KERNEL_TOOL_PERF
+	help
+	  Perf package has been moved to linux tools package.
+
 config BR2_BINUTILS_VERSION_2_22
 	bool "binutils 2.22 removed"
 	select BR2_LEGACY
diff --git a/linux/Config.tools.in b/linux/Config.tools.in
index 008e68c..24ef8cd 100644
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
+	  This will build and install the userspace 'perf'
+	  command. It is up to the user to ensure that the kernel
+	  configuration has all the suitable options enabled to allow a
+	  proper operation of 'perf'.
+
+	  https://perf.wiki.kernel.org/
+
 endmenu
diff --git a/package/perf/perf.mk b/linux/linux-tool-perf.mk
similarity index 72%
rename from package/perf/perf.mk
rename to linux/linux-tool-perf.mk
index 36989fc..463262c 100644
--- a/package/perf/perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-# Source taken from the Linux kernel tree
-PERF_SOURCE =
-PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_TOOLS += perf
 
-PERF_DEPENDENCIES = linux host-flex host-bison
+PERF_DEPENDENCIES = host-flex host-bison
 
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
@@ -38,31 +36,31 @@ else
 PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
 endif
 
+# O must be defined here with $(@D) to overwrite the one used by Buildroot
+# for out of tree build.
 define PERF_BUILD_CMDS
-	$(Q)if test ! -f $(LINUX_DIR)/tools/perf/Makefile ; then \
+	$(Q)if test ! -f $(@D)/tools/perf/Makefile ; then \
 		echo "Your kernel version is too old and does not have the perf tool." ; \
 		echo "At least kernel 2.6.31 must be used." ; \
 		exit 1 ; \
 	fi
 	$(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
-		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile* ; then \
-			if ! test -r $(LINUX_DIR)/tools/perf/config/Makefile ; then \
+		if ! grep -q NO_LIBELF $(@D)/tools/perf/Makefile* ; then \
+			if ! test -r $(@D)/tools/perf/config/Makefile ; then \
 				echo "The perf tool in your kernel cannot be built without libelf." ; \
 				echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
 				exit 1 ; \
 			fi \
 		fi \
 	fi
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/perf \
-		$(PERF_MAKE_FLAGS) O=$(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
+		-C $(@D)/tools/perf O=$(@D)
 endef
 
 # After installation, we remove the Perl and Python scripts from the
 # target.
 define PERF_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/perf \
-		$(PERF_MAKE_FLAGS) O=$(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
+		-C $(@D)/tools/perf O=$(@D) install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 endef
-
-$(eval $(generic-package))
diff --git a/package/Config.in b/package/Config.in
index 0288cb0..1f9359d 100644
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
