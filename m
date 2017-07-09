From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 15:41:51 +0200
Subject: [Buildroot] [git commit] arch/xtensa: allow specifying path to
	tarball file
Message-ID: <20170709151526.6ED7981D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3b60706221d75f3a0fce2441ce7a968981e7363
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

currently, specifying a custom Xtrensa core is done with two variables:
  - the core name
  - the directory containing the overlay tarball

However, the core name only serves to construct the tarball name, and is
not used whatsoever to configure any of the toolchain components
(binutils, gcc or gdb), except through the files that are overlayed in
their respective source trees.

This has two main drawbacks:
  - the overlay file must be named after the core,
  - the tarball can not be compressed.

Furthermore, it also makes it extremely complex to implement a download
of that tarball.

So, those two variables can be squeezed into a single variable, that is
the complete path of the overlay tarball.

Update the qemu-xtensa defconfig accordingly.

Note: we do not add a legacy entry for BR2_XTENSA_CORE_NAME, since it
was previously a blind option in the last release, and there's been no
release since we removed BR2_XTENSA_CUSTOM_NAME. So, we just update the
legacy comments for BR2_XTENSA_CUSTOM_NAME, since that's all the user
could have seen in any of our releases so far.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                         | 18 +++++++++++++++---
 arch/Config.in.xtensa                    | 19 ++++++++-----------
 arch/arch.mk.xtensa                      | 17 +++++++----------
 configs/qemu_xtensa_lx60_defconfig       |  3 +--
 configs/qemu_xtensa_lx60_nommu_defconfig |  3 +--
 package/binutils/binutils.mk             |  2 +-
 package/gcc/gcc-final/gcc-final.mk       |  2 +-
 package/gcc/gcc-initial/gcc-initial.mk   |  2 +-
 package/gdb/gdb.mk                       |  2 +-
 9 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3a283d9..d801573 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,11 +145,23 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.08"
 
+config BR2_XTENSA_OVERLAY_DIR
+	string "The BR2_XTENSA_OVERLAY_DIR option has been removed"
+	help
+	  The BR2_XTENSA_OVERLAY_DIR has been removed in favour of
+	  BR2_XTENSA_OVERLAY_FILE. You must now pass the complete
+	  path to the overlay file, not to the directory containing
+	  it.
+
+config BR2_XTENSA_OVERLAY_DIR_WRAP
+	bool
+	default y if BR2_XTENSA_OVERLAY_DIR != ""
+	select BR2_LEGACY
+
 config BR2_XTENSA_CUSTOM_NAME
-	string "The BR2_XTENSA_CUSTOM_NAME option has been renamed"
+	string "The BR2_XTENSA_CUSTOM_NAME option has been removed"
 	help
-	  The BR2_XTENSA_CUSTOM_NAME option has been renamed
-	  to BR2_XTENSA_CORE_NAME.
+	  The BR2_XTENSA_CUSTOM_NAME option has been removed.
 
 config BR2_XTENSA_CUSTOM_NAME_WRAP
 	bool
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 00b1f68..5d5bcb4 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -13,24 +13,21 @@ config BR2_xtensa_fsf
 
 endchoice
 
-config BR2_XTENSA_CORE_NAME
-	string "Custom Xtensa processor configuration name" if BR2_XTENSA_CUSTOM
-	default BR2_XTENSA_CUSTOM_NAME if BR2_XTENSA_CUSTOM_NAME != "" # legacy
-	help
-	  Name given to a custom Xtensa processor configuration.
-
-config BR2_XTENSA_OVERLAY_DIR
-	string "Overlay directory for custom configuration"
+config BR2_XTENSA_OVERLAY_FILE
+	string "Overlay file for custom configuration"
 	depends on BR2_XTENSA_CUSTOM
 	help
-	  Provide the directory path that contains the overlay file
-	  for a custom processor configuration. The path is relative
-	  to the top directory of buildroot.
+	  Enter the path to the overlay tarball for a custom processor
+	  configuration.
+
 	  These overlay files are tar packages with updated configuration
 	  files for various toolchain packages and Xtensa processor
 	  configurations. They are provided by the processor vendor or
 	  directly from Tensilica.
 
+	  The path can be either absolute, or relative to the top directory
+	  of buildroot.
+
 choice
 	prompt "Target Architecture Endianness"
 	depends on BR2_XTENSA_CUSTOM
diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
index 2843333..6d9fd63 100644
--- a/arch/arch.mk.xtensa
+++ b/arch/arch.mk.xtensa
@@ -1,18 +1,15 @@
 ################################################################################
-# Those two variables can be used by packages that need to extract the overlay.
+# This variable can be used by packages that need to extract the overlay.
 #
-# ARCH_XTENSA_CORE_NAME   is the name of the Xtensa core; empty if none or the
-#                         standard 'fsf' core.
-# ARCH_XTENSA_OVERLAY_TAR is the path to the overlay tarball; only valid when
-#                         ARCH_XTENSA_CORE_NAME is not empty.
+# ARCH_XTENSA_OVERLAY_FILE is the path to the overlay tarball; empty if not
+#                          using any overlay
 #
 # Example:
-#   ifneq ($(ARCH_XTENSA_CORE_NAME),)
-#       tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
+#   ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
+#       tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(@D) --strip-components=1 gcc
 #   endif
 ################################################################################
-ARCH_XTENSA_CORE_NAME = $(call qstrip,$(BR2_XTENSA_CORE_NAME))
-ARCH_XTENSA_OVERLAY_TAR = $(call qstrip,$(BR2_XTENSA_OVERLAY_DIR))/xtensa_$(ARCH_XTENSA_CORE_NAME).tar
+ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
 
 ################################################################################
 # arch-xtensa-overlay-extract -- extract an extensa overlay
@@ -24,5 +21,5 @@ ARCH_XTENSA_OVERLAY_TAR = $(call qstrip,$(BR2_XTENSA_OVERLAY_DIR))/xtensa_$(ARCH
 #   $(call arch-xtensa-overlay-extract,/path/to/overlay.tar,$(@D),gcc)
 ################################################################################
 define arch-xtensa-overlay-extract
-	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(1) --strip-components=1 $(2)
+	tar xf $(ARCH_XTENSA_OVERLAY_FILE) -C $(1) --strip-components=1 $(2)
 endef
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index ec0c1ba..778c31a 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -1,8 +1,7 @@
 # Architecture
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_CORE_NAME="dc233c"
-BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
+BR2_XTENSA_OVERLAY_FILE="board/qemu/xtensa-lx60/xtensa_dc233c.tar"
 
 # System
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index d19bc54..63e0194 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -1,8 +1,7 @@
 # Architecture
 BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_CORE_NAME="dc233c"
-BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
+BR2_XTENSA_OVERLAY_FILE="board/qemu/xtensa-lx60/xtensa_dc233c.tar"
 
 # Toolchain
 BR2_PACKAGE_HOST_ELF2FLT=y
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c64ec47..8e26394 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -122,7 +122,7 @@ define BINUTILS_INSTALL_TARGET_CMDS
 endef
 endif
 
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
+ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 define BINUTILS_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),binutils)
 endef
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 78466fa..f3bc72e 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -15,7 +15,7 @@ HOST_GCC_FINAL_DEPENDENCIES = \
 HOST_GCC_FINAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
 HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
+ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
 
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index e1a2241..dc7dff9 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -13,7 +13,7 @@ HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
+ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
 
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9b4d50e..8ef01d6 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -44,7 +44,7 @@ HOST_GDB_MAKE_OPTS += MAKEINFO=true
 HOST_GDB_INSTALL_OPTS += MAKEINFO=true install
 
 # Apply the Xtensa specific patches
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
+ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 define GDB_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),gdb)
 endef
