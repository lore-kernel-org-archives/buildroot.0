From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 17 Dec 2012 12:05:12 +0100
Subject: [Buildroot] [PATCH] linux: Support multiple device tree build
Message-ID: <1355742312-25258-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 linux/linux.mk |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..c7d0099 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -187,10 +187,12 @@ endef
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) \
+		$(foreach dtbfile, $(call qstrip, $(KERNEL_DTS_NAME)), $(dtbfile).dtb)
 endef
 define LINUX_INSTALL_DTB
-	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
+	$(foreach dtbfile, $(call qstrip, $(KERNEL_DTS_NAME)),
+		cp $(KERNEL_ARCH_PATH)/boot/$(dtbfile).dtb $(BINARIES_DIR)/)
 endef
 endif
 endif
-- 
1.7.9.5
