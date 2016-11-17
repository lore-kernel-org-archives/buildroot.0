From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 17 Nov 2016 11:00:31 +0100
Subject: [Buildroot] [PATCH 07/15] reproducibility/linux: inhibit build-id
In-Reply-To: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
References: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479376839-27795-8-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, Linux kernel enable 'build-id'. 'build-id' tends to add random
bytes in section .notes of kernel image[1]:

  $ readelf -Wn .../vmlinux
  Displaying notes found at file offset 0x00008000 with length 0x00000024:
    Owner                 Data size       Description
    GNU                  0x00000014       NT_GNU_BUILD_ID (unique build ID bitstring)
      Build ID: ca689e2ed3944f49474715908e2ac1bb04907fb2

Therefore, we patch kernel Makefile to disable 'build-id'.

[1] https://kernelnewbies.org/BuildId

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 linux/linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7e826cc..a63d1f3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -209,6 +209,13 @@ define LINUX_TRY_PATCH_TIMECONST
 endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+define LINUX_REMOVE_BUILD_ID
+	sed -i -e s/--build-id/--build-id=none/ $(@D)/Makefile
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_REMOVE_BUILD_ID
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
-- 
1.9.1
