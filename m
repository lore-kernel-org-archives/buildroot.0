From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Apr 2018 18:01:27 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/linux: fix custom
 dts files handling
Message-ID: <20180409190017.9C139881DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=014dbd4855fa0d52a32d2e2d15b425c64b2e7c95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Custom dts files are still conditionally copied based on non existing
boolean. So it is currently not possible to use custom dts file(s) at all.

List of dts files is now iterated and files are copied into dedicated kernel arch dir.

Signed-off-by: Rafal Susz <rafal.susz@gmail.com>
Tested-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 54157c6c2d9fba5ad230294ae1c7dfc0032b1ede)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8ef2b03445..8d14f41c6b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -367,8 +367,9 @@ endif
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
@@ -479,9 +480,9 @@ $(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUST
 endif
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
+ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT):$(strip $(KERNEL_DTS_NAME)),y:)
 $(error No kernel device tree source specified, check your \
-BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
+BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings)
 endif
 
 endif # BR_BUILDING
