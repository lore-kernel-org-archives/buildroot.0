From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 May 2021 13:36:49 +0200
Subject: [Buildroot] [PATCH 2/4] core: introduce NORMALIZED_ARCH as
 non-kernel replacement for KERNEL_ARCH
In-Reply-To: <20210518113652.29609-1-patrickdepinguin@gmail.com>
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
Message-ID: <20210518113652.29609-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The variable 'KERNEL_ARCH' is actually a normalized version of
'ARCH'/'BR2_ARCH'. For example, 'arcle' and 'arceb' both become 'arc', just
as all powerpc variants become 'powerpc'.

It is presumably called 'KERNEL_ARCH' because the Linux kernel is typically
the first place where support for a new architecture is added, and thus is
the entity that defines the normalized name.

However, the term 'KERNEL_ARCH' can also be interpreted as 'the architecture
used by the kernel', which need not be exactly the same as 'the normalized
name for a certain arch'. In particular, for cases where a 64-bit
architecture is running a 64-bit kernel but 32-bit userspace. Examples
include:
    * aarch64 architecture, with aarch64 kernel and 32-bit (ARM) userspace
    * x86_64 architecture, with x86_64 kernel and 32-bit (i386) userspace

In such cases, the 'architecture used by the kernel' needs to refer to the
64-bit name (aarch64, x86_64), whereas all userspace applications need to
refer the, potentially normalized, 32-bit name.

This means that there need to be two different variables:

KERNEL_ARCH:     the architecture used by the kernel
NORMALIZED_ARCH: the normalized name for the current userspace architecture

At this moment, both will actually have the same content. But a subsequent
patch will add basic support for situations described above, in which
KERNEL_ARCH may become overwritten to the 64-bit architecture, while
NORMALIZED_ARCH needs to remain the same (32-bit) case.

This commit replaces use of KERNEL_ARCH where actually the userspace arch is
needed.  Places that use KERNEL_ARCH in combination with building of kernel
modules are not touched.
There may be cases where a package builds both a kernel module as userspace,
in which case it may need to know about both KERNEL_ARCH and
NORMALIZED_ARCH, for the case where they differ. But this is to be fixed on
a per-need basis.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Makefile                                       |  1 +
 boot/barebox/barebox.mk                        | 10 +++++-----
 boot/uboot/uboot.mk                            |  6 +++---
 package/busybox/busybox.mk                     |  2 +-
 package/environment-setup/environment-setup.mk |  2 +-
 package/kvmtool/kvmtool.mk                     |  4 ++--
 package/libselinux/libselinux.mk               |  2 +-
 package/linux-tools/linux-tool-perf.mk.in      |  4 ++--
 package/linux-tools/linux-tool-selftests.mk.in |  6 +++---
 package/olsr/olsr.mk                           |  4 ++--
 package/pciutils/pciutils.mk                   |  2 +-
 package/uboot-tools/uboot-tools.mk             | 10 +++++-----
 12 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/Makefile b/Makefile
index 7b6998fde6..c5399e9a35 100644
--- a/Makefile
+++ b/Makefile
@@ -433,6 +433,7 @@ QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
 
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
+NORMALIZED_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
 KERNEL_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
 
 ZCAT := $(call qstrip,$(BR2_ZCAT))
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 8f02f9f9e1..6506294d6d 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -59,16 +59,16 @@ ifneq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
 $(1)_INSTALL_TARGET = NO
 endif
 
-ifeq ($$(KERNEL_ARCH),i386)
+ifeq ($$(NORMALIZED_ARCH),i386)
 $(1)_ARCH = x86
-else ifeq ($$(KERNEL_ARCH),x86_64)
+else ifeq ($$(NORMALIZED_ARCH),x86_64)
 $(1)_ARCH = x86
-else ifeq ($$(KERNEL_ARCH),powerpc)
+else ifeq ($$(NORMALIZED_ARCH),powerpc)
 $(1)_ARCH = ppc
-else ifeq ($$(KERNEL_ARCH),arm64)
+else ifeq ($$(NORMALIZED_ARCH),arm64)
 $(1)_ARCH = arm
 else
-$(1)_ARCH = $$(KERNEL_ARCH)
+$(1)_ARCH = $$(NORMALIZED_ARCH)
 endif
 
 $(1)_MAKE_FLAGS = ARCH=$$($(1)_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dbe82e65b1..77df9c8bba 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -139,12 +139,12 @@ endif
 
 # The kernel calls AArch64 'arm64', but U-Boot calls it just 'arm', so
 # we have to special case it. Similar for i386/x86_64 -> x86
-ifeq ($(KERNEL_ARCH),arm64)
+ifeq ($(NORMALIZED_ARCH),arm64)
 UBOOT_ARCH = arm
-else ifneq ($(filter $(KERNEL_ARCH),i386 x86_64),)
+else ifneq ($(filter $(NORMALIZED_ARCH),i386 x86_64),)
 UBOOT_ARCH = x86
 else
-UBOOT_ARCH = $(KERNEL_ARCH)
+UBOOT_ARCH = $(NORMALIZED_ARCH)
 endif
 
 UBOOT_MAKE_OPTS += \
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e979ac4f4b..456ed04a73 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -99,7 +99,7 @@ endif
 
 BUSYBOX_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
-	ARCH=$(KERNEL_ARCH) \
+	ARCH=$(NORMALIZED_ARCH) \
 	PREFIX="$(TARGET_DIR)" \
 	EXTRA_LDFLAGS="$(BUSYBOX_LDFLAGS)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index fcad013f0d..8e0fdff208 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -11,7 +11,7 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 	for var in $(TARGET_CONFIGURE_OPTS); do \
 		printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
 	done
-	printf "export \"ARCH=$(KERNEL_ARCH)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
+	printf "export \"ARCH=$(NORMALIZED_ARCH)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 	printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 2984817c7e..df6ae7e0f1 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -25,11 +25,11 @@ KVMTOOL_MAKE_OPTS = \
 	WERROR=0
 
 define KVMTOOL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) ARCH=$(KERNEL_ARCH) $(MAKE) -C $(@D) $(KVMTOOL_MAKE_OPTS)
+	$(TARGET_MAKE_ENV) ARCH=$(NORMALIZED_ARCH) $(MAKE) -C $(@D) $(KVMTOOL_MAKE_OPTS)
 endef
 
 define KVMTOOL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) ARCH=$(KERNEL_ARCH) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) ARCH=$(NORMALIZED_ARCH) $(MAKE) -C $(@D) \
 		$(KVMTOOL_MAKE_OPTS) install DESTDIR=$(TARGET_DIR) prefix=/usr
 endef
 
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index fdd13aa942..5a62b8d829 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -18,7 +18,7 @@ LIBSELINUX_INSTALL_STAGING = YES
 # we won't have to use a relative path in 0002-revert-ln-relative.patch
 LIBSELINUX_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
-	ARCH=$(KERNEL_ARCH) \
+	ARCH=$(NORMALIZED_ARCH) \
 	SHLIBDIR=/usr/lib
 
 LIBSELINUX_MAKE_INSTALL_TARGETS = install
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index efa747cf8d..4e28129f50 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -8,10 +8,10 @@ LINUX_TOOLS += perf
 
 PERF_DEPENDENCIES = host-flex host-bison
 
-ifeq ($(KERNEL_ARCH),x86_64)
+ifeq ($(NORMALIZED_ARCH),x86_64)
 PERF_ARCH=x86
 else
-PERF_ARCH=$(KERNEL_ARCH)
+PERF_ARCH=$(NORMALIZED_ARCH)
 endif
 
 PERF_MAKE_FLAGS = \
diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index c4e5bf0fea..b824c11bd6 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -6,13 +6,13 @@
 
 LINUX_TOOLS += selftests
 
-ifeq ($(KERNEL_ARCH),x86_64)
+ifeq ($(NORMALIZED_ARCH),x86_64)
 SELFTESTS_ARCH=x86
 else
-ifeq ($(KERNEL_ARCH),i386)
+ifeq ($(NORMALIZED_ARCH),i386)
 SELFTESTS_ARCH=x86
 else
-SELFTESTS_ARCH=$(KERNEL_ARCH)
+SELFTESTS_ARCH=$(NORMALIZED_ARCH)
 endif
 endif
 
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index b2c8e7e001..4ad88991f2 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -27,10 +27,10 @@ OLSR_PLUGINS += pud
 endif
 
 define OLSR_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(NORMALIZED_ARCH) \
 		CFLAGS="$(OLSR_CFLAGS)" -C $(@D) olsrd
 	$(foreach p,$(OLSR_PLUGINS), \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(NORMALIZED_ARCH) \
 			CFLAGS="$(OLSR_CFLAGS)" -C $(@D)/lib/$(p)
 	)
 endef
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 9b83b62b55..67defcc743 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -12,7 +12,7 @@ PCIUTILS_LICENSE = GPL-2.0+
 PCIUTILS_LICENSE_FILES = COPYING
 PCIUTILS_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	HOST="$(KERNEL_ARCH)-linux" \
+	HOST="$(NORMALIZED_ARCH)-linux" \
 	OPT="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	DNS=no \
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 8963d6182e..d60aaa7668 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -206,14 +206,14 @@ $(eval $(host-generic-package))
 MKIMAGE = $(HOST_DIR)/bin/mkimage
 
 # mkimage supports arm blackfin m68k microblaze mips mips64 nios2 powerpc ppc sh sparc sparc64 x86
-# KERNEL_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
-# For arm64, arc, xtensa we'll just keep KERNEL_ARCH
+# NORMALIZED_ARCH can be arm64 arc arm blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
+# For arm64, arc, xtensa we'll just keep NORMALIZED_ARCH
 # For mips64, we'll just keep mips
 # For i386 and x86_64, we need to convert
-ifeq ($(KERNEL_ARCH),x86_64)
+ifeq ($(NORMALIZED_ARCH),x86_64)
 MKIMAGE_ARCH = x86
-else ifeq ($(KERNEL_ARCH),i386)
+else ifeq ($(NORMALIZED_ARCH),i386)
 MKIMAGE_ARCH = x86
 else
-MKIMAGE_ARCH = $(KERNEL_ARCH)
+MKIMAGE_ARCH = $(NORMALIZED_ARCH)
 endif
-- 
2.26.3
