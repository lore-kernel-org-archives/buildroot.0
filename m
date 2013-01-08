From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jan 2013 00:07:56 +0100
Subject: [Buildroot] [git commit] linux: fix appended dtb handling of
	pre/post v3.8-rc1
Message-ID: <20130108231026.351D49A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1cfe20df6c6b4f148db0c104e8ff701654a2c09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The $(wildcard ) doesn't work for LINUX_APPEND_DTB, because the .dtb
doesn't exist yet at that point.

Also factor the common part out.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |   27 ++++++++++++---------------
 1 files changed, 12 insertions(+), 15 deletions(-)

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
