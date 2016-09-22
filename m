From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 12:32:34 +0200
Subject: [Buildroot] [git commit] linux/tools: make it a real,
	separate package
Message-ID: <20160922103317.C8C5381EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20b144666909e5173d8531b3bb0e179d2254e6d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel source tree also contains the sources for various userland
tools, of which cpupower, perf or selftests.

Currently, we have support for building those tools as part of the
kernel build procedure. This looked the correct thing to do so far,
because, well, they *are* part of the kernel source tree and some
really have to be the same version as the kernel that will run.

However, this is causing quite a non-trivial-to-break circular
dependency in some configurations. For example, this defconfig fails to
build (similar to the one reported by Paul):

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_ARM_FPU_NEON_VFPV4=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_SYSTEMD=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_GIT=y
    BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
    BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="26f3b72a9c049be10e6af196252283e1f6ab9d1f"
    BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
    BR2_PACKAGE_LINUX_TOOLS_CPUPOWER=y
    BR2_PACKAGE_CRYPTODEV=y
    BR2_PACKAGE_OPENSSL=y
    BR2_PACKAGE_LIBCURL=y

This causes a circular dependency, as explained by Thomas:

 - When libcurl is enabled, systemd depends on it

 - When OpenSSL is enabled, obviously, will use it for SSL support

 - When cryptodev-linux is enabled, OpenSSL will depend on it to use
   crypto accelerators supported in the kernel via cryptodev-linux.

 - cryptodev-linux being a kernel module, it depends on linux

 - linux by itself (the kernel) does not depend on pciutils, but the
   linux tool "cpupower" (managed in linux-tool-cpupower) depends on
   pciutils

 - pciutils depends on udev when available

 - udev is provided by systemd.

And indeed, during the build, we can see that make warns (it's only
reported as a *warning*, not as an actual error):

    [...]
    make[1]: Circular /home/ymorin/dev/buildroot/O/build/openssl-1.0.2h/.stamp_configured
    <- cryptodev-linux dependency dropped.
    >>> openssl 1.0.2h Downloading
    [...]

So the build fails later on, when openssl is actually built:

    eng_cryptodev.c:57:31: fatal error: crypto/cryptodev.h: No such file or directory
    compilation terminated.
    <builtin>: recipe for target 'eng_cryptodev.o' failed

Furthermore, graph-depends also detects the circular dependency, but
treats it as a hard-error:

    Recursion detected for  : cryptodev-linux
    which is a dependency of: openssl
    which is a dependency of: libcurl
    which is a dependency of: systemd
    which is a dependency of: udev
    which is a dependency of: pciutils
    which is a dependency of: linux
    which is a dependency of: cryptodev-linux
    Makefile:738: recipe for target 'graph-depends' failed

Of course, there is no way to break the loop without losing
functionality in either one of the involved packages *and* keep
our infrastructure and packages as-is.

The only solution is to break the loop at the linux-tools level, by
moving them away into their own package, so that the linux package will
no longer have the opportunity to depend on another package via a
dependency of one the tools.

All three linux tools are thus moved away to their own package.

The package infrastructure only knows of three types of packages: those
in package/ , in boot/ , in toolchain/ and the one in linux/ . So we
create that new linux-tools package in package/ so that we don't have to
fiddle with yet another special case in the infra. Still, we want its
configure options to appear in the kernel's sub-menu.

So, we make it a prompt-less package, with only the tools visible as
options of that package, but without the usual dependency on their
master symbol; they only depend on the Linux kernel.

Furthermore, because the kernel is such a huge pile of code, we would
not be very happy to extract it a second time just for the sake of a few
tools. We can't extract only the tools/ sub-directory from the kernel
source either, because some tools have hard-coded path to includes from
the kernel (arch and stuff).

Instead, we just use the linux source tree as our own build tree, and
ensure the linux tree is extracted and patched before linux-tools is
configured and built.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Paul Ashford <paul.ashford@zurria.co.uk>
[Thomas:
 - fix typo #(@D) -> $(@D)
 - fix the inclusion of the per-tool .mk files.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   | 24 +++++++++++
 linux/Config.in                                    |  2 +-
 linux/linux.mk                                     | 24 +----------
 .../linux-tools/Config.in                          | 14 +++++--
 .../linux-tools}/linux-tool-cpupower.mk            |  8 ++--
 {linux => package/linux-tools}/linux-tool-perf.mk  | 18 ++++----
 .../linux-tools}/linux-tool-selftests.mk           | 14 +++----
 package/linux-tools/linux-tools.mk                 | 48 ++++++++++++++++++++++
 8 files changed, 105 insertions(+), 47 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5914718..d105601 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,30 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_LINUX_KERNEL_TOOL_CPUPOWER
+	bool "linux-tool cpupower"
+	depends on BR2_LINUX_KERNEL
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
+	help
+	  Linux tool cpupower option was renamed.
+
+config BR2_LINUX_KERNEL_TOOL_PERF
+	bool "linux-tool perf"
+	depends on BR2_LINUX_KERNEL
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUX_TOOLS_PERF
+	help
+	  Linux tool perf option was renamed.
+
+config BR2_LINUX_KERNEL_TOOL_SELFTESTS
+	bool "linux-tool selftests"
+	depends on BR2_LINUX_KERNEL
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
+	help
+	  Linux tool selftests option was renamed.
+
 config BR2_GCC_VERSION_4_8_ARC
 	bool "gcc arc option renamed"
 	select BR2_LEGACY
diff --git a/linux/Config.in b/linux/Config.in
index ab4e138..45d9d5b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -400,7 +400,7 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 source "linux/Config.ext.in"
 
 # Linux tools
-source "linux/Config.tools.in"
+source "package/linux-tools/Config.in"
 
 endif # BR2_LINUX_KERNEL
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 5cbb5e5..988427c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -400,7 +400,7 @@ define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
-# Include all our extensions and tools definitions.
+# Include all our extensions.
 #
 # Note: our package infrastructure uses the full-path of the last-scanned
 # Makefile to determine what package we're currently defining, using the
@@ -411,7 +411,6 @@ endef
 # the current Makefile, we are OK. But this is a hard requirement: files
 # included here *must* be in the same directory!
 include $(sort $(wildcard linux/linux-ext-*.mk))
-include $(sort $(wildcard linux/linux-tool-*.mk))
 
 LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
@@ -420,27 +419,6 @@ LINUX_PRE_PATCH_HOOKS += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),\
 		$(call UPPERCASE,$(ext))_PREPARE_KERNEL))
 
-# Install Linux kernel tools in the staging directory since some tools
-# may install shared libraries and headers (e.g. cpupower). The kernel
-# image is NOT installed in the staging directory.
-LINUX_INSTALL_STAGING = YES
-
-LINUX_DEPENDENCIES += $(foreach tool,$(LINUX_TOOLS),\
-	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
-		$($(call UPPERCASE,$(tool))_DEPENDENCIES)))
-
-LINUX_POST_BUILD_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
-	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
-		$(call UPPERCASE,$(tool))_BUILD_CMDS))
-
-LINUX_POST_INSTALL_STAGING_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
-	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
-		$(call UPPERCASE,$(tool))_INSTALL_STAGING_CMDS))
-
-LINUX_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
-	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
-		$(call UPPERCASE,$(tool))_INSTALL_TARGET_CMDS))
-
 # Checks to give errors that the user can understand
 ifeq ($(BR_BUILDING),y)
 
diff --git a/linux/Config.tools.in b/package/linux-tools/Config.in
similarity index 83%
rename from linux/Config.tools.in
rename to package/linux-tools/Config.in
index 5ada98d..61c196f 100644
--- a/linux/Config.tools.in
+++ b/package/linux-tools/Config.in
@@ -1,9 +1,15 @@
 menu "Linux Kernel Tools"
 
-config BR2_LINUX_KERNEL_TOOL_CPUPOWER
+# No prompt, this is sourced by linux/Config.in as this
+# is no real package and really belongs to the kernel.
+config BR2_PACKAGE_LINUX_TOOLS
+	bool
+
+config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
 	bool "cpupower"
 	depends on !BR2_bfin # pciutils
 	depends on BR2_USE_WCHAR || !BR2_NEEDS_GETTEXT # gettext
+	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
@@ -14,8 +20,9 @@ comment "cpupower needs a toolchain w/ wchar"
 	depends on !BR2_bfin
 	depends on !BR2_USE_WCHAR && BR2_NEEDS_GETTEXT
 
-config BR2_LINUX_KERNEL_TOOL_PERF
+config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
+	select BR2_PACKAGE_LINUX_TOOLS
 	help
 	  perf (sometimes "Perf Events" or perf tools, originally
 	  "Performance Counters for Linux") - is a performance
@@ -32,10 +39,11 @@ config BR2_LINUX_KERNEL_TOOL_PERF
 
 	  https://perf.wiki.kernel.org/
 
-config BR2_LINUX_KERNEL_TOOL_SELFTESTS
+config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	depends on BR2_USE_MMU  # bash
+	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_BASH # runtime
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LIBCAP_NG
diff --git a/linux/linux-tool-cpupower.mk b/package/linux-tools/linux-tool-cpupower.mk
similarity index 79%
rename from linux/linux-tool-cpupower.mk
rename to package/linux-tools/linux-tool-cpupower.mk
index 095a5ef..9958cff 100644
--- a/linux/linux-tool-cpupower.mk
+++ b/package/linux-tools/linux-tool-cpupower.mk
@@ -15,26 +15,26 @@ CPUPOWER_MAKE_OPTS = CROSS=$(TARGET_CROSS) \
 	DEBUG=false
 
 define CPUPOWER_BUILD_CMDS
-	$(Q)if test ! -f $(@D)/tools/power/cpupower/Makefile ; then \
+	$(Q)if test ! -f $(LINUX_DIR)/tools/power/cpupower/Makefile ; then \
 		echo "Your kernel version is too old and does not have the cpupower tool." ; \
 		echo "At least kernel 3.4 must be used." ; \
 		exit 1 ; \
 	fi
 
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		cpupower
 endef
 
 define CPUPOWER_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		DESTDIR=$(STAGING_DIR) \
 		cpupower_install
 endef
 
 define CPUPOWER_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/tools \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
 		$(CPUPOWER_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		cpupower_install
diff --git a/linux/linux-tool-perf.mk b/package/linux-tools/linux-tool-perf.mk
similarity index 84%
rename from linux/linux-tool-perf.mk
rename to package/linux-tools/linux-tool-perf.mk
index 8143474..16f3a58 100644
--- a/linux/linux-tool-perf.mk
+++ b/package/linux-tools/linux-tool-perf.mk
@@ -95,25 +95,25 @@ endif
 # We name it 'GNUmakefile' so that GNU make will use it instead of
 # the existing 'Makefile'.
 define PERF_DISABLE_DOCUMENTATION
-	if [ -f $(@D)/tools/perf/Documentation/Makefile ]; then \
-		printf "%%:\n\t@:\n" >$(@D)/tools/perf/Documentation/GNUmakefile; \
+	if [ -f $(LINUX_DIR)/tools/perf/Documentation/Makefile ]; then \
+		printf "%%:\n\t@:\n" >$(LINUX_DIR)/tools/perf/Documentation/GNUmakefile; \
 	fi
 endef
 LINUX_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
 
 # O must be redefined here to overwrite the one used by Buildroot for
-# out of tree build. We build perf in $(@D)/tools/perf/ and not just
-# $(@D) so that it isn't built in the root directory of the kernel
+# out of tree build. We build perf in $(LINUX_DIR)/tools/perf/ and not just
+# $(LINUX_DIR) so that it isn't built in the root directory of the kernel
 # sources.
 define PERF_BUILD_CMDS
-	$(Q)if test ! -f $(@D)/tools/perf/Makefile ; then \
+	$(Q)if test ! -f $(LINUX_DIR)/tools/perf/Makefile ; then \
 		echo "Your kernel version is too old and does not have the perf tool." ; \
 		echo "At least kernel 2.6.31 must be used." ; \
 		exit 1 ; \
 	fi
 	$(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
-		if ! grep -q NO_LIBELF $(@D)/tools/perf/Makefile* ; then \
-			if ! test -r $(@D)/tools/perf/config/Makefile ; then \
+		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile* ; then \
+			if ! test -r $(LINUX_DIR)/tools/perf/config/Makefile ; then \
 				echo "The perf tool in your kernel cannot be built without libelf." ; \
 				echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
 				exit 1 ; \
@@ -121,14 +121,14 @@ define PERF_BUILD_CMDS
 		fi \
 	fi
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
-		-C $(@D)/tools/perf O=$(@D)/tools/perf/
+		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/
 endef
 
 # After installation, we remove the Perl and Python scripts from the
 # target.
 define PERF_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
-		-C $(@D)/tools/perf O=$(@D)/tools/perf/ install
+		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/ install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
 endef
diff --git a/linux/linux-tool-selftests.mk b/package/linux-tools/linux-tool-selftests.mk
similarity index 65%
rename from linux/linux-tool-selftests.mk
rename to package/linux-tools/linux-tool-selftests.mk
index 3cbfed2..c4e5bf0 100644
--- a/linux/linux-tool-selftests.mk
+++ b/package/linux-tools/linux-tool-selftests.mk
@@ -23,8 +23,8 @@ SELFTESTS_MAKE_FLAGS = \
 	ARCH=$(SELFTESTS_ARCH)
 
 # O must be redefined here to overwrite the one used by Buildroot for
-# out of tree build. We build the selftests in $(@D)/tools/selftests and
-# not just $(@D) so that it isn't built in the root directory of the kernel
+# out of tree build. We build the selftests in $(LINUX_DIR)/tools/selftests and
+# not just $(LINUX_DIR) so that it isn't built in the root directory of the kernel
 # sources.
 #
 # The headers_install step here is important as some kernel selftests use a
@@ -33,14 +33,14 @@ SELFTESTS_MAKE_FLAGS = \
 # The headers_install target will install the kernel headers locally inside
 # the Linux build dir
 define SELFTESTS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(SELFTESTS_MAKE_FLAGS) \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR) $(SELFTESTS_MAKE_FLAGS) \
 		headers_install
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/tools/testing/selftests \
-		$(SELFTESTS_MAKE_FLAGS) O=$(@D)/tools/testing/selftests
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/testing/selftests \
+		$(SELFTESTS_MAKE_FLAGS) O=$(LINUX_DIR)/tools/testing/selftests
 endef
 
 define SELFTESTS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/tools/testing/selftests \
-		$(SELFTESTS_MAKE_FLAGS) O=$(@D)/tools/testing/selftests \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/testing/selftests \
+		$(SELFTESTS_MAKE_FLAGS) O=$(LINUX_DIR)/tools/testing/selftests \
 		INSTALL_PATH=$(TARGET_DIR)/usr/lib/kselftests install
 endef
diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
new file mode 100644
index 0000000..d45f950
--- /dev/null
+++ b/package/linux-tools/linux-tools.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# linux-tools
+#
+################################################################################
+
+# Vampirising sources from the kernel tree, so no source nor site specified.
+# Instead, we directly build in the sources of the linux package. We can do
+# that, because we're not building in the same location and the same files.
+#
+# So, all tools refer to $(LINUX_DIR) instead of $(@D).
+
+# We only need the kernel to be extracted, not actually built
+LINUX_TOOLS_PATCH_DEPENDENCIES = linux
+
+# Install Linux kernel tools in the staging directory since some tools
+# may install shared libraries and headers (e.g. cpupower).
+LINUX_TOOLS_INSTALL_STAGING = YES
+
+# Include all our tools definitions.
+#
+# Note: our package infrastructure uses the full-path of the last-scanned
+# Makefile to determine what package we're currently defining, using the
+# last directory component in the path. As such, including other Makefile,
+# like below, before we call one of the *-package macro is usally not
+# working.
+# However, since the files we include here are in the same directory as
+# the current Makefile, we are OK. But this is a hard requirement: files
+# included here *must* be in the same directory!
+include $(sort $(wildcard package/linux-tools/linux-ext-*.mk))
+
+LINUX_TOOLS_DEPENDENCIES += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+		$($(call UPPERCASE,$(tool))_DEPENDENCIES)))
+
+LINUX_TOOLS_POST_BUILD_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+		$(call UPPERCASE,$(tool))_BUILD_CMDS))
+
+LINUX_TOOLS_POST_INSTALL_STAGING_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+		$(call UPPERCASE,$(tool))_INSTALL_STAGING_CMDS))
+
+LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
+	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+		$(call UPPERCASE,$(tool))_INSTALL_TARGET_CMDS))
+
+$(eval $(generic-package))
