From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] linux: Import minimal
	defconfigs as defconfigs
Message-ID: <20101217160205.269768E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fb358f7b38866b7e48ecc58b1a1f59c1aa95ce44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that minimal kernel defconfigs are used in Buildroot, the problem
is that copying those minimal configuration files to .config in the
kernel source tree does not work, as kconfig will ask interactively
what should be the value for all unspecified options.

On suggestion on Sam Ravnborg, the easiest way to solve this is to
import the minimal defconfig file as a defconfig inside the kernel
tree (in arch/$(ARCH)/configs) and configure the kernel with it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e9c37eb..639e4ce 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -86,7 +86,9 @@ $(LINUX26_DIR)/.stamp_configured: $(LINUX26_DIR)/.stamp_patched
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
1.7.2.2
