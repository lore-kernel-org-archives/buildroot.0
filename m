From: Rafal Susz <rafal.susz@gmail.com>
Date: Mon, 12 Mar 2018 22:35:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux: fix custom dts files handling
Message-ID: <20180312213523.32213-1-rafal.susz@gmail.com>
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
 linux/linux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e98b25cb72..a69cb3ee51 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -370,8 +370,8 @@ endif
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
-	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
-		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
+	$(foreach dts, $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH),
+		cp -f $(call qstrip,$(dts)) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then	\
 		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
-- 
2.16.1
