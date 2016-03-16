From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:43:20 +0100
Subject: [Buildroot] [PATCH 14/16] afboot-stm32: use the Buildroot toolchain
In-Reply-To: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458164602-16983-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, the afboot-stm32 Makefile uses "CROSS_COMPILE =
arm-none-eabi-". Since I had such a toolchain installed on my system
when testing afboot-stm32, I didn't realize it wasn't using the
Buildroot toolchain.

However, using the Buildroot toolchain doesn't immediately works for
FLAT toolchains, as gcc automatically wants to create a FLAT
binary. So we need to adjust the afboot-stm32 Makefile to use directly
'ld' and not 'gcc' when linking.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Use-ld-instead-of-gcc-for-linking.patch   | 61 ++++++++++++++++++++++
 boot/afboot-stm32/afboot-stm32.mk                  |  2 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 boot/afboot-stm32/0001-Use-ld-instead-of-gcc-for-linking.patch

diff --git a/boot/afboot-stm32/0001-Use-ld-instead-of-gcc-for-linking.patch b/boot/afboot-stm32/0001-Use-ld-instead-of-gcc-for-linking.patch
new file mode 100644
index 0000000..3f359dc
--- /dev/null
+++ b/boot/afboot-stm32/0001-Use-ld-instead-of-gcc-for-linking.patch
@@ -0,0 +1,61 @@
+From 0d581abe6620ac69adec321b94390e009802f36a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 13 Mar 2016 14:32:33 +0100
+Subject: [PATCH] Use ld instead of gcc for linking
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ce40314..271bb4f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,7 @@
+ CROSS_COMPILE ?= arm-none-eabi-
+ 
+ CC = $(CROSS_COMPILE)gcc
++LD = $(CROSS_COMPILE)ld
+ OBJCOPY = $(CROSS_COMPILE)objcopy
+ OBJDUMP = $(CROSS_COMPILE)objdump
+ SIZE = $(CROSS_COMPILE)size
+@@ -10,7 +11,7 @@ OPENOCD = openocd
+ CFLAGS := -mthumb -mcpu=cortex-m4
+ CFLAGS += -ffunction-sections -fdata-sections
+ CFLAGS += -Os -std=gnu99 -Wall
+-LDFLAGS := -nostartfiles -Wl,--gc-sections
++LINKERFLAGS := -nostartfiles --gc-sections
+ 
+ obj-y += gpio.o mpu.o
+ obj-f4 += $(obj-y) usart-f4.o
+@@ -22,22 +23,22 @@ all: stm32f429i-disco stm32429i-eval stm32f469i-disco stm32746g-eval
+ 	$(CC) -c $(CFLAGS) $< -o $@
+ 
+ stm32f429i-disco: stm32f429i-disco.o $(obj-f4)
+-	$(CC) -T stm32f429.lds $(LDFLAGS) -o stm32f429i-disco.elf stm32f429i-disco.o $(obj-f4)
++	$(LD) -T stm32f429.lds $(LINKERFLAGS) -o stm32f429i-disco.elf stm32f429i-disco.o $(obj-f4)
+ 	$(OBJCOPY) -Obinary stm32f429i-disco.elf stm32f429i-disco.bin
+ 	$(SIZE) stm32f429i-disco.elf
+ 
+ stm32429i-eval: stm32429i-eval.o $(obj-f4)
+-	$(CC) -T stm32f429.lds $(LDFLAGS) -o stm32429i-eval.elf stm32429i-eval.o $(obj-f4)
++	$(LD) -T stm32f429.lds $(LINKERFLAGS) -o stm32429i-eval.elf stm32429i-eval.o $(obj-f4)
+ 	$(OBJCOPY) -Obinary stm32429i-eval.elf stm32429i-eval.bin
+ 	$(SIZE) stm32429i-eval.elf
+ 
+ stm32f469i-disco: stm32f469i-disco.o $(obj-f4)
+-	$(CC) -T stm32f429.lds $(LDFLAGS) -o stm32f469i-disco.elf stm32f469i-disco.o $(obj-f4)
++	$(LD) -T stm32f429.lds $(LINKERFLAGS) -o stm32f469i-disco.elf stm32f469i-disco.o $(obj-f4)
+ 	$(OBJCOPY) -Obinary stm32f469i-disco.elf stm32f469i-disco.bin
+ 	$(SIZE) stm32f469i-disco.elf
+ 
+ stm32746g-eval: stm32746g-eval.o $(obj-f7)
+-	$(CC) -T stm32f429.lds $(LDFLAGS) -o stm32746g-eval.elf stm32746g-eval.o $(obj-f7)
++	$(LD) -T stm32f429.lds $(LINKERFLAGS) -o stm32746g-eval.elf stm32746g-eval.o $(obj-f7)
+ 	$(OBJCOPY) -Obinary stm32746g-eval.elf stm32746g-eval.bin
+ 	$(SIZE) stm32746g-eval.elf
+ 
+-- 
+2.6.4
+
diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
index ac85d58..042b21f 100644
--- a/boot/afboot-stm32/afboot-stm32.mk
+++ b/boot/afboot-stm32/afboot-stm32.mk
@@ -8,7 +8,7 @@ AFBOOT_STM32_VERSION = v0.1
 AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,$(AFBOOT_STM32_VERSION))
 
 define AFBOOT_STM32_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all
 endef
 
 define AFBOOT_STM32_INSTALL_TARGET_CMDS
-- 
2.6.4
