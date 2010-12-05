From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:17 +0100
Subject: [Buildroot] [PATCH 46/55] linux: Import minimal defconfigs as
	defconfigs
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5362be689be3eaa9a4f79a03e2963080957c9496.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that minimal kernel defconfigs are used in Buildroot, the problem
is that copying those minimal configuration files to .config in the
kernel source tree does not work, as kconfig will ask interactively
what should be the value for all unspecified options.

On suggestion on Sam Ravnborg, the easiest way to solve this is to
import the minimal defconfig file as a defconfig inside the kernel
tree (in arch/$(ARCH)/configs) and configure the kernel with it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index f7b0889..746eab0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -87,7 +87,9 @@ $(LINUX26_DIR)/.stamp_configured: $(LINUX26_DIR)/.stamp_patched
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(@D)/.config
+	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(@D)/arch/$(KERNEL_ARCH)/configs/buildroot_defconfig
+	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) buildroot_defconfig
+	rm $(@D)/arch/$(KERNEL_ARCH)/configs/buildroot_defconfig
 endif
 ifeq ($(BR2_ARM_EABI),y)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config)
-- 
1.7.0.4
