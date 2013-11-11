From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 17:47:36 +0100
Subject: [Buildroot] [PATCH 12/15] gnu-efi: new package
In-Reply-To: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1384188459-1332-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/gnu-efi/Config.in                          | 21 +++++++++
 .../gnu-efi/gnu-efi-01-use-override-cflags.patch   | 53 ++++++++++++++++++++++
 package/gnu-efi/gnu-efi.mk                         | 44 ++++++++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 package/gnu-efi/Config.in
 create mode 100644 package/gnu-efi/gnu-efi-01-use-override-cflags.patch
 create mode 100644 package/gnu-efi/gnu-efi.mk

diff --git a/package/Config.in b/package/Config.in
index 311cc6c..faa29f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -538,6 +538,7 @@ endmenu
 menu "Hardware handling"
 source "package/ccid/Config.in"
 source "package/dtc/Config.in"
+source "package/gnu-efi/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libatasmart/Config.in"
diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
new file mode 100644
index 0000000..a239d4b
--- /dev/null
+++ b/package/gnu-efi/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_GNU_EFI
+	bool "gnu-efi"
+	help
+	  Develop EFI applications for IA-64 (IPF), IA-32 (x86), and
+	  x86_64 platforms using the GNU toolchain and the EFI
+	  development environment.
+
+	  http://gnu-efi.sourceforge.net/
+
+if BR2_PACKAGE_GNU_EFI
+
+# Packages using gnu-efi will select whether they want ia32 or
+# x86-64. If two different packages make different choices, the build
+# will error out.
+config BR2_PACKAGE_GNU_EFI_IA32
+	bool
+
+config BR2_PACKAGE_GNU_EFI_X64
+	bool
+
+endif # BR2_PACKAGE_GNU_EFI
diff --git a/package/gnu-efi/gnu-efi-01-use-override-cflags.patch b/package/gnu-efi/gnu-efi-01-use-override-cflags.patch
new file mode 100644
index 0000000..07c3a9f
--- /dev/null
+++ b/package/gnu-efi/gnu-efi-01-use-override-cflags.patch
@@ -0,0 +1,53 @@
+Allow CFLAGS/CPPFLAGS to be completed from the environment
+
+Buildroot passes its own CPPFLAGS and CFLAGS in the environment, so
+the CFLAGS += and CPPFLAGS += statements in gnu-efi Makefile have no
+effect. Change these to override <VARIABLE> += so that they extend the
+flags passed by Buildroot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Make.defaults
+===================================================================
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -83,25 +83,25 @@
+                                && [ $(GCCMINOR) -ge "7" ] ) ) \
+                         && echo 1)
+ ifeq ($(GCCNEWENOUGH),1)
+-  CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
++  override CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
+ endif
+ 
+ # Arch-specific compilation flags
+-CPPFLAGS += -DCONFIG_$(ARCH)
++override CPPFLAGS += -DCONFIG_$(ARCH)
+ 
+ ifeq ($(ARCH),ia64)
+-  CFLAGS += -mfixed-range=f32-f127
++  override CFLAGS += -mfixed-range=f32-f127
+ endif
+ 
+ ifeq ($(ARCH),ia32)
+-  CFLAGS += -mno-mmx -mno-sse
++  override CFLAGS += -mno-mmx -mno-sse
+   ifeq ($(HOSTARCH),x86_64)
+     ARCH3264 = -m32
+   endif
+ endif
+ 
+ ifeq ($(ARCH),x86_64)
+-  CFLAGS += -mno-red-zone -mno-mmx -mno-sse
++  override CFLAGS += -mno-red-zone -mno-mmx -mno-sse
+   ifeq ($(HOSTARCH),ia32)
+     ARCH3264 = -m64
+   endif
+@@ -110,7 +110,7 @@
+ # Generic compilation flags
+ INCDIR  += -I$(SRCDIR) -I$(TOPDIR)/inc -I$(TOPDIR)/inc/$(ARCH) \
+            -I$(TOPDIR)/inc/protocol
+-CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
++override CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
+            -fno-merge-constants -ffreestanding -fno-stack-protector       \
+            -fno-stack-check
+ ASFLAGS += $(ARCH3264)
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
new file mode 100644
index 0000000..8f5c01b
--- /dev/null
+++ b/package/gnu-efi/gnu-efi.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# gnu-efi
+#
+################################################################################
+
+GNU_EFI_VERSION = 3.0u
+GNU_EFI_SOURCE = gnu-efi_$(GNU_EFI_VERSION).orig.tar.gz
+GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi/
+GNU_EFI_INSTALL_STAGING = YES
+GNU_EFI_LICENSE = GPLv2+ (gnuefi), BSD (efilib)
+GNU_EFI_LICENSE_FILES = debian/copyright
+
+ifeq ($(BR2_PACKAGE_GNU_EFI_IA32)$(BR2_PACKAGE_GNU_EFI_X64),yy)
+$(error "Building gnu-efi for both ia32 and x86-64 is not possible")
+endif
+
+ifeq ($(BR2_PACKAGE_GNU_EFI_IA32),y)
+GNU_EFI_PLATFORM=ia32
+else ifeq ($(BR2_PACKAGE_GNU_EFI_X64),y)
+GNU_EFI_PLATFORM=x86_64
+endif
+
+define GNU_EFI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		ARCH=$(GNU_EFI_PLATFORM)
+endef
+
+define GNU_EFI_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		INSTALLROOT=$(TARGET_DIR) \
+		PREFIX=/usr ARCH=$(GNU_EFI_PLATFORM) install
+endef
+
+define GNU_EFI_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		INSTALLROOT=$(STAGING_DIR) \
+		PREFIX=/usr ARCH=$(GNU_EFI_PLATFORM) install
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
