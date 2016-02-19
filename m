From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 19 Feb 2016 17:08:57 +0000
Subject: [Buildroot] [PATCH 1/9] boot: Add new bootloader afboot-stm32
In-Reply-To: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
References: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1455901745-18486-2-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a _very_ small bootloader for STM32 platforms.

At submission afboot-stm32 supports the following boards:

  stm32429i-eval
  stm32746g-eval
  stm32f429i-disco
  stm32f469i-disco

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 boot/Config.in                    |  1 +
 boot/afboot-stm32/Config.in       |  7 +++++++
 boot/afboot-stm32/afboot-stm32.mk | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 boot/afboot-stm32/Config.in
 create mode 100644 boot/afboot-stm32/afboot-stm32.mk

diff --git a/boot/Config.in b/boot/Config.in
index 54760b9..4daf079 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -1,5 +1,6 @@
 menu "Bootloaders"
 
+source "boot/afboot-stm32/Config.in"
 source "boot/at91bootstrap/Config.in"
 source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
diff --git a/boot/afboot-stm32/Config.in b/boot/afboot-stm32/Config.in
new file mode 100644
index 0000000..d6fe13c
--- /dev/null
+++ b/boot/afboot-stm32/Config.in
@@ -0,0 +1,7 @@
+config BR2_TARGET_AFBOOT_STM32
+	bool "afboot-stm32"
+	select BR2_PACKAGE_HOST_OPENOCD
+	help
+	  afboot-stm32 is a very small bootloader for STM32 platforms
+
+	  https://github.com/mcoquelin-stm32/afboot-stm32
diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
new file mode 100644
index 0000000..60ab3b7
--- /dev/null
+++ b/boot/afboot-stm32/afboot-stm32.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# afboot-stm32
+#
+################################################################################
+
+AFBOOT_STM32_VERSION = v0.1
+AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,$(AFBOOT_STM32_VERSION))
+
+define AFBOOT_STM32_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define AFBOOT_STM32_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/stm32*.bin $(BINARIES_DIR)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
