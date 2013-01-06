From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 16:47:05 +0100
Subject: [Buildroot] [git commit] linux: handle new dtb location since
	3.8-rc1 for appended dtbs
Message-ID: <20130106164433.607A49A5E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b33e0b6a139ce3a622817b45a8882a448312fc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we've done it for seperate dtbs (ef34705087b).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e852f62..7ec9cd2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -203,14 +203,21 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 define LINUX_APPEND_DTB
-	cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb >> $(KERNEL_ARCH_PATH)/boot/zImage
+define LINUX_APPEND_DTB
+	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
+	cat $(wildcard $(addprefix $(KERNEL_ARCH_PATH)/boot/,\
+		$(KERNEL_DTS_NAME).dtb dts/$(KERNEL_DTS_NAME).dtb)) \
+		>> $(KERNEL_ARCH_PATH)/boot/zImage
 	# We need to generate the uImage here after that so that the uImage is
 	# generated with the right image size.
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) uImage
 endef
 else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
 define LINUX_APPEND_DTB
-	cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb >> $(KERNEL_ARCH_PATH)/boot/zImage
+	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
+	cat $(wildcard $(addprefix $(KERNEL_ARCH_PATH)/boot/,\
+		$(KERNEL_DTS_NAME).dtb dts/$(KERNEL_DTS_NAME).dtb)) \
+		>> $(KERNEL_ARCH_PATH)/boot/zImage
 endef
 endif
 
