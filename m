From: Rafal Susz <rafal.susz@gmail.com>
Date: Tue, 13 Mar 2018 15:26:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux: fix custom dts files handling
In-Reply-To: <20180313113217.27657-1-rafal.susz@gmail.com>
References: <20180313113217.27657-1-rafal.susz@gmail.com>
Message-ID: <20180313142635.27423-1-rafal.susz@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Custom dts files are still conditionally copied based on non existing
boolean. So it is currently not possible to use custom dts file(s) at all.

List of dts files is now iterated and files are copied into dedicated kernel arch dir.

Signed-off-by: Rafal Susz <rafal.susz@gmail.com>
---
 configs/s6lx9_microboard_defconfig | 1 -
 linux/linux.mk                     | 9 +++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
index f77c80ba87..97b2d3fe79 100644
--- a/configs/s6lx9_microboard_defconfig
+++ b/configs/s6lx9_microboard_defconfig
@@ -10,5 +10,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/avnet/s6lx9_microboard/lx9_mmu_defconfig"
-BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/avnet/s6lx9_microboard/lx9_mmu.dts"
diff --git a/linux/linux.mk b/linux/linux.mk
index e98b25cb72..94bfb9661a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -370,8 +370,9 @@ endif
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
-	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
-		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
+	@for dts in $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)); do \
+		cp -f $${dts} $(KERNEL_ARCH_PATH)/boot/dts/ ;   \
+	done
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then	\
 		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
@@ -482,9 +483,9 @@ $(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUST
 endif
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
+ifeq ($(strip $(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME)),y)
 $(error No kernel device tree source specified, check your \
-BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
+BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings)
 endif
 
 endif # BR_BUILDING
-- 
2.16.1
