From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 25 Dec 2016 05:50:38 -0800
Subject: [Buildroot] [PATCH 2/2] uboot: add xtensa overlay unpacking to
	prepatch step
In-Reply-To: <1482673838-24567-1-git-send-email-jcmvbkbc@gmail.com>
References: <1482673838-24567-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1482673838-24567-3-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xtensa core configuration must to be added to U-Boot before it can be
built for that xtensa CPU variant. Extract configuration files from the
xtensa overlay in prepatch step as is done with other packages that
need to be configured for a specific xtensa core.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 boot/uboot/uboot.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6b9d544..900aadc 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -148,6 +148,16 @@ endef
 UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
+XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
+ifneq ($(XTENSA_CORE_NAME),)
+define UBOOT_XTENSA_PRE_PATCH
+	test -d $(@D)/arch/xtensa/include/asm/arch-$(XTENSA_CORE_NAME) || \
+	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
+		-C $(@D) --strip-components=1 u-boot
+endef
+UBOOT_PRE_PATCH_HOOKS += UBOOT_XTENSA_PRE_PATCH
+endif
+
 # Analogous code exists in linux/linux.mk. Basically, the generic
 # package infrastructure handles downloading and applying remote
 # patches. Local patches are handled depending on whether they are
-- 
2.1.4
