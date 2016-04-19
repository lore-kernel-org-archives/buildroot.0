From: naresh.kamboju at linaro.org <naresh.kamboju@linaro.org>
Date: Tue, 19 Apr 2016 17:18:21 +0100
Subject: [Buildroot] [PATCH] linux: linux.mk: _defconfig not required for
	arm64 instead use defconfig
Message-ID: <1461082701-8144-1-git-send-email-naresh.kamboju@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Naresh Kamboju <naresh.kamboju@linaro.org>

Linux arch/arm64 contains configs/defconfig not the <board>_defconfig

Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 317587f..f7fb244 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -198,7 +198,11 @@ endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
+ifeq ($(KERNEL_ARCH),arm64)
+LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))
+else
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
+endif
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 LINUX_KCONFIG_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 endif
-- 
2.8.1
