From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  2 Sep 2012 17:05:41 +0200
Subject: [Buildroot] [PATCH] linux: add default defconfig
In-Reply-To: <50435801.7050406@mind.be>
Message-ID: <1346598341-20434-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot currently requires a defconfig to be supplied for the kernel:
either a custom supplied one, or one from the kernel tree.  However,
the kernel can (usually) also select a default defconfig, based on
the architecture.  So make this option available to buildroot.

We also make this the default, so the user can compile a kernel with
minimal effort.

Microblaze currently (linux-3.5) doesn't have a default defconfig.
Older versions also lack it for some architectures (e.g. mips was
introduced in 2.6.35) but that's nearly impossible to check for at
buildroot level.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 linux/Config.in |    8 +++++++-
 linux/linux.mk  |   15 ++++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9c63215..1165bc9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -101,7 +101,13 @@ config BR2_LINUX_KERNEL_PATCH
 
 choice
 	prompt "Kernel configuration"
-	default BR2_LINUX_KERNEL_USE_DEFCONFIG
+	# microblaze doesn't have an in-kernel defconfig (as of 3.5)
+	default BR2_LINUX_KERNEL_USE_DEFCONFIG if BR2_microblazeel || BR2_microblazebe
+	default BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
+
+config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
+	bool "Using the default supplied by the kernel"
+	depends on !(BR2_microblazeel || BR2_microblazebe)
 
 config BR2_LINUX_KERNEL_USE_DEFCONFIG
 	bool "Using a defconfig"
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..a248ae4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -146,6 +146,13 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
+ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
+
+define LINUX_BASE_CONFIGURE_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) defconfig
+endef
+
+else # BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
@@ -153,10 +160,16 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
-define LINUX_CONFIGURE_CMDS
+define LINUX_BASE_CONFIGURE_CMDS
 	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+endef
+
+endif # BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
+
+define LINUX_CONFIGURE_CMDS
+	$(LINUX_BASE_CONFIGURE_CMDS)
 	$(if $(BR2_ARM_EABI),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
-- 
tg: (666eb02..) t/kernel-defconfig (depends on: master)
