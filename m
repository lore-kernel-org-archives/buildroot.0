From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 23:23:17 +0100
Subject: [Buildroot] [git commit branch/next] afboot-stm32: new package
Message-ID: <20160222222417.9F1B780F40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70c26b8c53c395ef4194cbed5b121a2b9243e4e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is a _very_ small bootloader for STM32 platforms.

At submission afboot-stm32 supports the following boards:

  stm32429i-eval
  stm32746g-eval
  stm32f429i-disco
  stm32f469i-disco

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: fix commit title, add dependency on BR2_arm.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/Config.in                      |  1 +
 boot/afboot-stm32/Config.in         |  7 +++++++
 boot/afboot-stm32/afboot-stm32.hash |  2 ++
 boot/afboot-stm32/afboot-stm32.mk   | 18 ++++++++++++++++++
 4 files changed, 28 insertions(+)

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
index 0000000..309b9e0
--- /dev/null
+++ b/boot/afboot-stm32/Config.in
@@ -0,0 +1,7 @@
+config BR2_TARGET_AFBOOT_STM32
+	bool "afboot-stm32"
+	depends on BR2_arm
+	help
+	  afboot-stm32 is a very small bootloader for STM32 platforms
+
+	  https://github.com/mcoquelin-stm32/afboot-stm32
diff --git a/boot/afboot-stm32/afboot-stm32.hash b/boot/afboot-stm32/afboot-stm32.hash
new file mode 100644
index 0000000..d23b74a
--- /dev/null
+++ b/boot/afboot-stm32/afboot-stm32.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 dbd715c8b99f7d266f74a04707a4dac76b75b31321f24dee5256a6348260530c  afboot-stm32-v0.1.tar.gz
diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
new file mode 100644
index 0000000..ac85d58
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
+	$(INSTALL) -m 0755 $(@D)/stm32*.bin $(BINARIES_DIR)
+endef
+
+$(eval $(generic-package))
