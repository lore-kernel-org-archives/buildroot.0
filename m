From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:28:06 +0200
Subject: [Buildroot] [git commit] package/perf: migrate perf to use the new
	linux-tools infrastructure
Message-ID: <20150714213615.7CE5681D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1326e7618571e1a27247e3aa4ef61dcd69f87c3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the perf package and add legacy handling.

[Thomas:
  - improve the Config.in.legacy help text
  - improve the comment explaining why we pass O= when building perf]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                 |    9 +++++++
 linux/Config.tools.in                            |   18 +++++++++++++++
 package/perf/perf.mk => linux/linux-tool-perf.mk |   26 +++++++++++-----------
 package/Config.in                                |    1 -
 package/perf/Config.in                           |   21 -----------------
 5 files changed, 40 insertions(+), 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0a8d0a6..4afeb83 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_PERF
+	bool "perf option has been renamed"
+	select BR2_LEGACY
+	select BR2_LINUX_KERNEL_TOOL_PERF
+	help
+	  The perf package has been moved as a Linux tools package,
+	  and the option to enable it is now
+	  BR2_LINUX_KERNEL_TOOL_PERF.
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
similarity index 73%
rename from package/perf/perf.mk
rename to linux/linux-tool-perf.mk
index 2bdd555..0bd0ed1 100644
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
 
 ifeq ($(KERNEL_ARCH),x86_64)
 PERF_ARCH=x86
@@ -57,31 +55,33 @@ else
 PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
 endif
 
+# O must be redefined here to overwrite the one used by Buildroot for
+# out of tree build. We build perf in $(@D)/tools/perf/ and not just
+# $(@D) so that it isn't built in the root directory of the kernel
+# sources.
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
+		-C $(@D)/tools/perf O=$(@D)/tools/perf/
 endef
 
 # After installation, we remove the Perl and Python scripts from the
 # target.
 define PERF_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/perf \
-		$(PERF_MAKE_FLAGS) O=$(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
+		-C $(@D)/tools/perf O=$(@D)/tools/perf/ install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 endef
-
-$(eval $(generic-package))
diff --git a/package/Config.in b/package/Config.in
index 5beb450..86a53c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -89,7 +89,6 @@ endif
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
