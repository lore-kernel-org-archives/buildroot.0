From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 25 Dec 2016 05:50:37 -0800
Subject: [Buildroot] [PATCH 1/2] linux: add xtensa overlay unpacking to
	prepatch step
In-Reply-To: <1482673838-24567-1-git-send-email-jcmvbkbc@gmail.com>
References: <1482673838-24567-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1482673838-24567-2-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xtensa core configuration must to be added to linux before it can be
built for that xtensa CPU variant. Extract configuration files from the
xtensa overlay in prepatch step as is done with other packages that
need to be configured for a specific xtensa core.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 linux/linux.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 988427c..f874f5e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -82,6 +82,16 @@ ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 LINUX_DEPENDENCIES += host-uboot-tools
 endif
 
+XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
+ifneq ($(XTENSA_CORE_NAME),)
+define LINUX_XTENSA_PRE_PATCH
+	test -d $(@D)/arch/xtensa/variants/$(XTENSA_CORE_NAME) || \
+	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
+		-C $(@D) --strip-components=1 linux
+endef
+LINUX_PRE_PATCH_HOOKS += LINUX_XTENSA_PRE_PATCH
+endif
+
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
-- 
2.1.4
