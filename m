From: Chris Lesiak <chris.lesiak@licor.com>
Date: Fri, 9 May 2014 08:51:55 -0500
Subject: [Buildroot] [PATCH] Reduce need for BR2_HOSTARCH_NEEDS_IA32_COMPILER
Message-ID: <536cdd7b.ATs+iKVatjmU5yNL%chris.lesiak@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reduce need for BR2_HOSTARCH_NEEDS_IA32_COMPILER

When building grub and syslinux, the 32-bit host compiler is only
needed when building for 64-bit target.  For 32-bit targets, the
target compiler will work.

This change makes it less likely that a mulilib host is needed.

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
---
 boot/grub/Config.in       |  2 +-
 boot/grub/grub.mk         |  6 ++++++
 boot/syslinux/Config.in   |  2 +-
 boot/syslinux/syslinux.mk | 18 ++++++++++++++----
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/boot/grub/Config.in b/boot/grub/Config.in
index 4db8642..86e1753 100644
--- a/boot/grub/Config.in
+++ b/boot/grub/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_GRUB
 	bool "grub"
 	depends on BR2_i386 || BR2_x86_64
-	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_ARCH_IS_64
 	help
 	  The GRand Unified Bootloader for x86 systems.
 
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index dc11307..8c02fe3 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -71,9 +71,15 @@ endef
 
 GRUB_POST_PATCH_HOOKS += GRUB_DEBIAN_PATCHES
 
+ifeq ($(BR2_HOSTARCH_NEEDS_IA32_COMPILER),y)
 GRUB_CONF_ENV = \
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS) $(GRUB_CFLAGS) -m32"
+else
+GRUB_CONF_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS) $(GRUB_CFLAGS)"
+endif
 
 GRUB_CONF_OPT = \
 	--disable-auto-linux-mem-opt \
diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index f4b9870..8d32214 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_SYSLINUX
 	bool "syslinux"
 	depends on BR2_i386 || BR2_x86_64
-	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_ARCH_IS_64
 	help
 	  The syslinux bootloader for x86 systems.
 	  This includes: syslinux, pxelinux, extlinux.
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 51b6417..c20a817 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -39,12 +39,22 @@ define SYSLINUX_CLEANUP
 endef
 SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 
+ifeq ($(BR2_HOSTARCH_NEEDS_IA32_COMPILER),y)
+	SYSLINUX_CC = $(HOSTCC)
+	SYSLINUX_LDFLAGS = $(HOST_LDFLAGS)
+	SYSLINUX_AR = $(HOSTAR)
+else
+	SYSLINUX_CC = $(TARGET_CC)
+	SYSLINUX_LDFLAGS = $(TARGET_LDFLAGS)
+	SYSLINUX_AR = $(TARGET_AR)
+endif
+
 # syslinux build system has no convenient way to pass CFLAGS,
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
 define SYSLINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-	    AR="$(HOSTAR)" SYSROOT=$(STAGING_DIR) -C $(@D) $(SYSLINUX_TARGET)
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(SYSLINUX_CC) -idirafter $(HOST_DIR)/usr/include $(SYSLINUX_LDFLAGS)" \
+	    AR="$(SYSLINUX_AR)" SYSROOT=$(STAGING_DIR) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
 # While the actual bootloader is compiled for the target, several
@@ -53,8 +63,8 @@ endef
 # Repeat CC and AR, since syslinux really wants to check them at
 # install time
 define SYSLINUX_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-	    AR="$(HOSTAR)" SYSROOT=$(STAGING_DIR) INSTALLROOT=$(HOST_DIR) \
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(SYSLINUX_CC) -idirafter $(HOST_DIR)/usr/include $(SYSLINUX_LDFLAGS)" \
+	    AR="$(SYSLINUX_AR)" SYSROOT=$(STAGING_DIR) INSTALLROOT=$(HOST_DIR) \
 	    -C $(@D) $(SYSLINUX_TARGET) install
 endef
 
-- 
1.9.0
