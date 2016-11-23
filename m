From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 13:58:45 +0100
Subject: [Buildroot] [PATCH v4 06/18] reproducibility/linux: inhibit build-id
In-Reply-To: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479905937-17241-7-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux kernel include build path in debug sections. These sections are stripped
and do not impact build reproducibility directly. However, 'build-id'
depends on content of all sections, including debug sections. So, it
add random bytes in section .notes of kernel image[1]:

  $ readelf -Wn .../vmlinux
  Displaying notes found at file offset 0x00008000 with length 0x00000024:
    Owner                 Data size       Description
    GNU                  0x00000014       NT_GNU_BUILD_ID (unique build ID bitstring)
      Build ID: ca689e2ed3944f49474715908e2ac1bb04907fb2

In order to not depend on build path, patch kernel Makefile to disable
'build-id'.

[1] https://kernelnewbies.org/BuildId

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---

Notes:
    v3:
       - Better explain why disabling build-id is necessary (in fact, it not
         necessary if build paths are preserved between builds)

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
