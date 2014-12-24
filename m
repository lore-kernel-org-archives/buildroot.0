From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Dec 2014 10:54:55 -0300
Subject: [Buildroot] [PATCH] linux: fix breakage from
	d4b2b032a00c9922c9efa144b014dc086a7e48f1
Message-ID: <1419429295-16322-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unbreak qemu_xtensa_lx60_defconfig where LINUX_IMAGE_NAME !=
LINUX_TARGET_NAME.
It incorrectly overwrites LINUX_IMAGE_NAME even if it was set before,
defeating the purpose of IMAGE being different than TARGET.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index be66fb5..680521c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -82,7 +82,9 @@ KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
 LINUX_TARGET_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
+ifeq ($(LINUX_IMAGE_NAME),)
 LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
+endif
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 LINUX_IMAGE_NAME = uImage
-- 
2.0.5
