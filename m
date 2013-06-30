From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 21:28:58 +0200
Subject: [Buildroot] [PATCH 08/23] kernel-headers: migrate to the package
	infrastructure
In-Reply-To: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372620553-11416-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tall-fix-__packed-in-exported-kernel-head.patch |  0
 .../linux-headers/3.3.8/linux-fix-umode_t.patch    |  0
 .../linux-headers/Config.in.host                   |  5 +-
 package/linux-headers/linux-headers.mk             | 31 ++++++++
 toolchain/kernel-headers/kernel-headers.mk         | 87 ----------------------
 toolchain/toolchain-buildroot.mk                   |  1 -
 toolchain/toolchain-buildroot/Config.in            |  2 +-
 toolchain/toolchain-external.mk                    |  1 -
 toolchain/uClibc/uclibc.mk                         | 13 +---
 9 files changed, 38 insertions(+), 102 deletions(-)
 rename toolchain/kernel-headers/linux-3.0.84-headers_install-fix-__packed-in-exported-kernel-head.patch => package/linux-headers/3.0.84/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch (100%)
 rename toolchain/kernel-headers/linux-3.3.8-fix-umode_t.patch => package/linux-headers/3.3.8/linux-fix-umode_t.patch (100%)
 rename toolchain/kernel-headers/Config.in => package/linux-headers/Config.in.host (94%)
 create mode 100644 package/linux-headers/linux-headers.mk
 delete mode 100644 toolchain/kernel-headers/kernel-headers.mk

diff --git a/toolchain/kernel-headers/linux-3.0.84-headers_install-fix-__packed-in-exported-kernel-head.patch b/package/linux-headers/3.0.84/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.84-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to package/linux-headers/3.0.84/linux-headers-headers_install-fix-__packed-in-exported-kernel-head.patch
diff --git a/toolchain/kernel-headers/linux-3.3.8-fix-umode_t.patch b/package/linux-headers/3.3.8/linux-fix-umode_t.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.3.8-fix-umode_t.patch
rename to package/linux-headers/3.3.8/linux-fix-umode_t.patch
diff --git a/toolchain/kernel-headers/Config.in b/package/linux-headers/Config.in.host
similarity index 94%
rename from toolchain/kernel-headers/Config.in
rename to package/linux-headers/Config.in.host
index ce812af..2d14ffb 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/package/linux-headers/Config.in.host
@@ -1,6 +1,5 @@
-# Choose the kernel headers to use for kernel-headers target. This is
-# ignored if you are building your own kernel or using the system kernel.
-#
+config BR2_PACKAGE_HOST_LINUX_HEADERS
+	bool
 
 comment "Kernel Header Options"
 
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
new file mode 100644
index 0000000..a2c861b
--- /dev/null
+++ b/package/linux-headers/linux-headers.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# linux-headers
+#
+#############################################################
+
+# This package is used to provide Linux kernel headers for the
+# internal toolchain backend.
+
+LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
+ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+else
+LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
+endif
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.bz2
+
+LINUX_HEADERS_INSTALL_STAGING = YES
+
+define LINUX_HEADERS_INSTALL_STAGING_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) $(MAKE) \
+			ARCH=$(KERNEL_ARCH) \
+			HOSTCC="$(HOSTCC)" \
+			HOSTCFLAGS="$(HOSTCFLAGS)" \
+			HOSTCXX="$(HOSTCXX)" \
+			INSTALL_HDR_PATH=$(STAGING_DIR)/usr \
+			headers_install)
+endef
+
+$(eval $(generic-package))
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
deleted file mode 100644
index a04395b..0000000
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ /dev/null
@@ -1,87 +0,0 @@
-################################################################################
-#
-# Setup the kernel headers. I include a generic package of
-# kernel headers here, so you shouldn't need to include your
-# own. Be aware these kernel headers _will_ get blown away
-# by a 'make clean' so don't put anything sacred in here...
-#
-################################################################################
-
-DEFAULT_KERNEL_HEADERS:=$(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
-
-LINUX_HEADERS_SITE:=127.0.0.1
-LINUX_HEADERS_SOURCE:=unspecified-kernel-headers
-LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-libc-headers-null
-
-# parse linux version string
-LNXVER:=$(subst ., , $(strip $(DEFAULT_KERNEL_HEADERS)))
-VERSION:=$(word 1, $(LNXVER))
-PATCHLEVEL:=$(word 2, $(LNXVER))
-SUBLEVEL:=$(word 3, $(LNXVER))
-EXTRAVERSION:=$(word 4, $(LNXVER))
-LOCALVERSION:=
-
-# should contain prepended dot
-SUBLEVEL:=$(if $(SUBLEVEL),.$(SUBLEVEL),)
-EXTRAVERSION:=$(if $(EXTRAVERSION),.$(EXTRAVERSION),)
-
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL)$(SUBLEVEL)$(EXTRAVERSION)
-ifeq ($(findstring x2.6.,x$(DEFAULT_KERNEL_HEADERS)),x2.6.)
-LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR:/=)/linux/kernel/v2.6/
-else
-LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR:/=)/linux/kernel/v3.x/
-endif
-LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.xz
-LINUX_HEADERS_CAT:=$(XZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
-LINUX_HEADERS_DIR:=$(TOOLCHAIN_DIR)/linux
-
-LINUX_HEADERS_DEPENDS:=
-
-$(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
-	$(Q)$(call MESSAGE,"Extracting kernel headers")
-	rm -rf $(LINUX_HEADERS_DIR)
-	$(INSTALL) -d $(@D)
-	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | \
-	tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
-	touch $@
-
-$(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
-	$(Q)$(call MESSAGE,"Patching kernel headers")
-	support/scripts/apply-patches.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
-		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
-ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
-	support/scripts/apply-patches.sh $(LINUX_HEADERS_UNPACK_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
-		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
-endif
-	touch $@
-
-$(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
-	$(Q)$(call MESSAGE,"Installing kernel headers")
-	(cd $(LINUX_HEADERS_UNPACK_DIR); \
-	 $(MAKE) ARCH=$(KERNEL_ARCH) \
-		HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
-		HOSTCXX="$(HOSTCXX)" \
-		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install; \
-	)
-	touch $@
-
-$(DL_DIR)/$(LINUX_HEADERS_SOURCE):
-ifeq ($(BR2_KERNEL_HEADERS_SNAP),y)
-	$(error No local $@ found, cannot continue. Are you sure you wanted to enable BR2_KERNEL_HEADERS_SNAP?)
-endif
-	$(Q)$(call MESSAGE,"Downloading kernel headers")
-	$(call DOWNLOAD,$(LINUX_HEADERS_SITE:/=)/$(LINUX_HEADERS_SOURCE))
-
-kernel-headers: $(LINUX_HEADERS_DIR)/.configured
-
-kernel-headers-source: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
-
-kernel-headers-clean: clean
-	rm -rf $(LINUX_HEADERS_DIR)
-
-kernel-headers-dirclean:
-	rm -rf $(LINUX_HEADERS_DIR)
-	rm -rf $(LINUX_HEADERS_UNPACK_DIR)
-
-.PHONY: kernel-headers
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index 5b89d56..a8dd58b 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -1,5 +1,4 @@
 # Include files required for the internal toolchain backend
 
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 3894890..3d70fa1 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -1,7 +1,7 @@
 # Config entries for internal toolchain backend
 
 if BR2_TOOLCHAIN_BUILDROOT
-source "toolchain/kernel-headers/Config.in"
+source "package/linux-headers/Config.in.host"
 source "toolchain/uClibc/Config.in"
 source "package/binutils/Config.in.host"
 source "toolchain/gcc/Config.in"
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index 2aa0141..40fc633 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -2,6 +2,5 @@
 
 include toolchain/helpers.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/toolchain-external/ext-tool.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index f042c63..e06fafc 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -98,7 +98,7 @@ $(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.patched $(UCLIBC_CONFIG_FILE)
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
 		-e 's,^TARGET_ARCH=".*",TARGET_ARCH=\"$(UCLIBC_TARGET_ARCH)\",g' \
-		-e 's,^KERNEL_HEADERS=.*,KERNEL_HEADERS=\"$(LINUX_HEADERS_DIR)/include\",g' \
+		-e 's,^KERNEL_HEADERS=.*,KERNEL_HEADERS=\"$(STAGING_DIR)/usr/include\",g' \
 		-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
 		-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
 		-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
@@ -426,7 +426,7 @@ ifeq ($(BR2_arc),y)
 REALLY_NOSTDLIB=-really-nostdlib
 endif
 
-$(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.config
+$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.config
 	$(Q)$(call MESSAGE,"Installing uClibc headers")
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
@@ -441,7 +441,7 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
 	# Install the kernel headers to the first stage gcc include dir
 	# if necessary
 	if [ ! -f $(TOOLCHAIN_DIR)/uClibc_dev/usr/include/linux/version.h ]; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/* \
+		cp -pLR $(STAGING_DIR)/usr/include/* \
 			$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
 	fi
 	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) -nostartfiles -shared -x c /dev/null -o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/libc.so
@@ -485,11 +485,6 @@ $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 		CROSS_COMPILE="$(TARGET_CROSS)" \
 		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		install_runtime install_dev
-	# Install the kernel headers to the staging dir if necessary
-	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/* \
-			$(STAGING_DIR)/usr/include/; \
-	fi
 	# Build the host utils. Need to add an install target...
 	$(MAKE1) -C $(UCLIBC_DIR)/utils \
 		PREFIX=$(HOST_DIR) \
@@ -548,7 +543,7 @@ uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
 uclibc-update-config: uclibc-config
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
-uclibc-configured: gcc_initial kernel-headers $(UCLIBC_DIR)/.configured
+uclibc-configured: gcc_initial linux-headers $(UCLIBC_DIR)/.configured
 
 uclibc-configured-source: uclibc-source
 
-- 
1.8.1.2
