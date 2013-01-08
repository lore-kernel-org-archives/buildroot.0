From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  8 Jan 2013 22:23:56 +0100
Subject: [Buildroot] [PATCH v2] linux: fix appended dtb handling of pre/post
	v3.8-rc1
Message-ID: <1357680237-21101-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Also factor the common part out.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: remove fix of duplication of 'define LINUX_APPEND_DTB' line
---
 linux/linux.mk |   27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index fe5f738..61d4267 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -201,23 +201,20 @@ endef
 endif
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
-define LINUX_APPEND_DTB
-	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
-	cat $(wildcard $(addprefix $(KERNEL_ARCH_PATH)/boot/,\
-		$(KERNEL_DTS_NAME).dtb dts/$(KERNEL_DTS_NAME).dtb)) \
-		>> $(KERNEL_ARCH_PATH)/boot/zImage
-	# We need to generate the uImage here after that so that the uImage is
-	# generated with the right image size.
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) uImage
-endef
-else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
+# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
 define LINUX_APPEND_DTB
-	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
-	cat $(wildcard $(addprefix $(KERNEL_ARCH_PATH)/boot/,\
-		$(KERNEL_DTS_NAME).dtb dts/$(KERNEL_DTS_NAME).dtb)) \
-		>> $(KERNEL_ARCH_PATH)/boot/zImage
+	if [ -e $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb ]; then \
+		cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb; \
+	else \
+		cat $(KERNEL_ARCH_PATH)/boot/dts/$(KERNEL_DTS_NAME).dtb; \
+	fi >> $(KERNEL_ARCH_PATH)/boot/zImage
 endef
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
+# We need to generate the uImage here after that so that the uImage is
+# generated with the right image size.
+LINUX_APPEND_DTB += $(sep)$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) uImage
+endif
 endif
 
 # Compilation. We make sure the kernel gets rebuilt when the
-- 
1.7.10.4
