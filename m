From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Dec 2012 08:42:55 +0100
Subject: [Buildroot] [git commit] linux: simplify dtb variables
Message-ID: <20121221081435.3DC439A3CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=309c2f50fa12deeaf7d809e3bdef291a12486b4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only qstrip once and add a KERNEL_DTBS helper variable to simplify the dtb
rules.

No functional change.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3321d80..6586e68 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -53,7 +53,7 @@ LINUX_MAKE_FLAGS = \
 LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
 
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
-KERNEL_DTS_NAME = $(BR2_LINUX_KERNEL_INTREE_DTS_NAME)
+KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
 KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))
 endif
@@ -65,6 +65,8 @@ $(error Kernel with appended device tree needs exactly one DTS source.\
 endif
 endif
 
+KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
+
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
@@ -187,12 +189,10 @@ endef
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) \
-		$(addsuffix .dtb, $(call qstrip, $(KERNEL_DTS_NAME)))
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTBS)
 endef
 define LINUX_INSTALL_DTB
-	cp $(addprefix $(KERNEL_ARCH_PATH)/boot/, \
-		$(addsuffix .dtb, $(call qstrip, $(KERNEL_DTS_NAME)))) \
+	cp $(addprefix $(KERNEL_ARCH_PATH)/boot/,$(KERNEL_DTBS)) \
 		$(BINARIES_DIR)/
 endef
 endif
