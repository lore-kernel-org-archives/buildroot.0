From: sinseman44 <sinseman44@gmail.com>
Date: Thu, 22 Sep 2011 11:36:11 +0200
Subject: [Buildroot] [PATCH] use same kernel in buildroot and in crosstool-ng
Message-ID: <1316684171-24580-1-git-send-email-sinseman44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 Makefile                                           |    4 +-
 ...-ng-001-makefile-buildroot-kernel-version.patch |   41 ++++++++++++++++++++
 ...ol-ng-002-config-buildroot-kernel-version.patch |   24 +++++++++++
 package/crosstool-ng/crosstool-ng.mk               |    6 ++-
 toolchain/toolchain-crosstool-ng/Config.in         |    5 ++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    5 ++
 6 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 package/crosstool-ng/crosstool-ng-001-makefile-buildroot-kernel-version.patch
 create mode 100644 package/crosstool-ng/crosstool-ng-002-config-buildroot-kernel-version.patch

diff --git a/Makefile b/Makefile
index a20d3e2..59eb941 100644
--- a/Makefile
+++ b/Makefile
@@ -301,6 +301,8 @@ all: world
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
+include linux/linux.mk
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 include toolchain/toolchain-buildroot.mk
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
@@ -313,7 +315,7 @@ include package/*/*.mk
 
 include boot/common.mk
 include target/Makefile.in
-include linux/linux.mk
+
 
 TARGETS+=target-finalize
 
diff --git a/package/crosstool-ng/crosstool-ng-001-makefile-buildroot-kernel-version.patch b/package/crosstool-ng/crosstool-ng-001-makefile-buildroot-kernel-version.patch
new file mode 100644
index 0000000..2a2c8ac
--- /dev/null
+++ b/package/crosstool-ng/crosstool-ng-001-makefile-buildroot-kernel-version.patch
@@ -0,0 +1,41 @@
+--- crosstool-ng-1.12.1/scripts/build/kernel/linux.sh	2011-09-21 10:50:31.403186872 +0200
++++ host-crosstool-ng-1.12.1/scripts/build/kernel/linux.sh	2011-09-21 10:50:56.932014313 +0200
+@@ -61,21 +61,24 @@
+                 return 0
+             fi
+ 
+-            CT_TestAndAbort "Custom kernel tree partially extracted. Remove before resuming" -f "${CT_SRC_DIR}/.linux-custom.extracting"
+-            CT_DoExecLog DEBUG touch "${CT_SRC_DIR}/.linux-custom.extracting"
+-            CT_DoExecLog DEBUG mkdir "${CT_SRC_DIR}/linux-custom"
+-
+-            case "${CT_KERNEL_LINUX_CUSTOM_TARBALL}" in
+-                *.tar.bz2)      tar_opt=-j;;
+-                *.tar.gz|*.tgz) tar_opt=-z;;
+-                *.tar)          ;;
+-                *)              CT_Abort "Don't know how to handle '${CT_KERNEL_LINUX_CUSTOM_TARBALL}': unknown extension";;
+-            esac
+-            CT_DoLog EXTRA "Extracting custom linux kernel"
+-            CT_DoExecLog ALL tar x -C "${CT_SRC_DIR}/linux-custom"      \
+-                                 --strip-components 1 -v ${tar_opt}     \
+-                                 -f "${CT_KERNEL_LINUX_CUSTOM_TARBALL}"
++			CT_TestAndAbort "Custom kernel tree partially extracted. Remove before resuming" -f "${CT_SRC_DIR}/.linux-custom.extracting"
++			CT_DoExecLog DEBUG touch "${CT_SRC_DIR}/.linux-custom.extracting"
+ 
++			if [ ! -d "${CT_KERNEL_LINUX_CUSTOM_TARBALL}" ]; then
++				CT_DoExecLog DEBUG mkdir "${CT_SRC_DIR}/linux-custom"
++				case "${CT_KERNEL_LINUX_CUSTOM_TARBALL}" in
++					*.tar.bz2)      tar_opt=-j;;
++					*.tar.gz|*.tgz) tar_opt=-z;;
++					*.tar)          ;;
++					*)              CT_Abort "Don't know how to handle '${CT_KERNEL_LINUX_CUSTOM_TARBALL}': unknown extension";;
++				esac
++				CT_DoLog EXTRA "Extracting custom linux kernel"
++				CT_DoExecLog ALL tar x -C "${CT_SRC_DIR}/linux-custom"      \
++									--strip-components 1 -v ${tar_opt}     \
++									-f "${CT_KERNEL_LINUX_CUSTOM_TARBALL}"
++			else
++				CT_DoExecLog ALL ln -s "${CT_KERNEL_LINUX_CUSTOM_TARBALL}" "${CT_SRC_DIR}/linux-custom"
++			fi
+             CT_DoExecLog ALL mv -v "${CT_SRC_DIR}/.linux-custom.extracting" "${CT_SRC_DIR}/.linux-custom.extracted"
+         else
+             CT_Extract "linux-${CT_KERNEL_VERSION}"
diff --git a/package/crosstool-ng/crosstool-ng-002-config-buildroot-kernel-version.patch b/package/crosstool-ng/crosstool-ng-002-config-buildroot-kernel-version.patch
new file mode 100644
index 0000000..0d98ced
--- /dev/null
+++ b/package/crosstool-ng/crosstool-ng-002-config-buildroot-kernel-version.patch
@@ -0,0 +1,24 @@
+--- crosstool-ng-1.12.1/config/kernel/linux.in	2011-09-21 11:00:49.759188996 +0200
++++ host-crosstool-ng-1.12.1/config/kernel/linux.in	2011-09-21 11:02:45.390254678 +0200
+@@ -144,16 +144,18 @@
+ 
+ config KERNEL_LINUX_CUSTOM
+     bool
+-    prompt "custom tarball"
++    prompt "custom tarball or directory"
+     help
+-      Use a local tarball of a complete kernel source tree.
++      Use a local tarball of a complete kernel source tree or
++      a local kernel tree (not pre-installed)
+ 
+ config KERNEL_LINUX_CUSTOM_TARBALL
+     string
+     prompt "Path to custom tarball"
+     depends on KERNEL_LINUX_CUSTOM
+     help
+-      Enter here the path to the tarball of your full kernel tree.
++      Enter here the path to the tarball of your full kernel tree or
++      the path or the local kernel tree
+ 
+ endchoice
+ 
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 076be28..99bbde7 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -4,6 +4,10 @@ CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_STAGING   = NO
 CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
-HOST_CROSSTOOL_NG_DEPENDENCIES = host-gawk host-automake $(if $(BR2_CCACHE),host-ccache)
+HOST_CROSSTOOL_NG_DEPENDENCIES = $(if $(BR2_TOOLCHAIN_CTNG_BUILDROOT_KERNEL), \
+								   $(LINUX_TARGET_SOURCE) $(LINUX_TARGET_EXTRACT) $(LINUX_TARGET_PATCH) $(LINUX_TARGET_CONFIGURE)) \
+								 host-gawk \
+								 host-automake \
+								 $(if $(BR2_CCACHE),host-ccache) 
 
 $(eval $(call AUTOTARGETS,package,crosstool-ng,host))
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 2d1e801..9ac9f4c 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -46,6 +46,11 @@ config BR2_TOOLCHAIN_CTNG_CONFIG
 
 	  If unsure, keep the default value.
 
+config BR2_TOOLCHAIN_CTNG_BUILDROOT_KERNEL
+	bool "Buildroot kernel version"
+	help
+		Use buildroot kernel version in crosstool-Ng
+
 if BR2_TOOLCHAIN_CTNG_uClibc
 
 comment "Toolchain Options"
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 3a205dd..29fb022 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -218,6 +218,11 @@ else
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_LANG_CXX)=.*:\# \1 is not set:;
 endif
 
+ifeq ($(BR2_TOOLCHAIN_CTNG_BUILDROOT_KERNEL),y)
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_KERNEL_LINUX_CUSTOM) is not set:\1=y:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_KERNEL_LINUX_CUSTOM_TARBALL)=.*:\1="$(BUILD_DIR)/linux-$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))":;
+endif
+
 # Shoe-horn CPU variant now
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_ARCH)=.*:\1=$(BR2_GCC_TARGET_ARCH):;
-- 
1.7.0.4
