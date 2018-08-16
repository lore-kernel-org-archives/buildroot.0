From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 22:45:23 +0200
Subject: [Buildroot] [PATCH] linux: replace shell for loop with make foreach
 loop
Message-ID: <20180816204523.7805-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit replaces the loop copying out-of-tree DTS into the kernel
tree by a make foreach loop instead of a shell for loop. This allows
to error out if one of the DTS file cannot be copied (for example if
it doesn't exist).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7527b11673..e0d437427d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -389,9 +389,9 @@ endif
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
-	@for dts in $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)); do \
-		cp -f $${dts} $(LINUX_ARCH_PATH)/boot/dts/ ; \
-	done
+	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
+		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
+	)
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
 		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ; \
-- 
2.14.4
