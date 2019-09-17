From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:02:37 +0200
Subject: [Buildroot] [git commit] boot/afboot-stm32: bump to version 0.2
Message-ID: <20190917195828.680AD8E8E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa33eb3199e2bf437cec8fcff04487f0d0f04daf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Use-ld-instead-of-gcc-for-linking.patch   | 61 ----------------------
 boot/afboot-stm32/afboot-stm32.hash                |  2 +-
 boot/afboot-stm32/afboot-stm32.mk                  |  2 +-
 3 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/boot/afboot-stm32/0001-Use-ld-instead-of-gcc-for-linking.patch b/boot/afboot-stm32/0001-Use-ld-instead-of-gcc-for-linking.patch
deleted file mode 100644
index 3f359dc316..0000000000
--- a/boot/afboot-stm32/0001-Use-ld-instead-of-gcc-for-linking.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 0d581abe6620ac69adec321b94390e009802f36a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 13 Mar 2016 14:32:33 +0100
-Subject: [PATCH] Use ld instead of gcc for linking
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index ce40314..271bb4f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,6 +1,7 @@
- CROSS_COMPILE ?= arm-none-eabi-
- 
- CC = $(CROSS_COMPILE)gcc
-+LD = $(CROSS_COMPILE)ld
- OBJCOPY = $(CROSS_COMPILE)objcopy
- OBJDUMP = $(CROSS_COMPILE)objdump
- SIZE = $(CROSS_COMPILE)size
-@@ -10,7 +11,7 @@ OPENOCD = openocd
- CFLAGS := -mthumb -mcpu=cortex-m4
- CFLAGS += -ffunction-sections -fdata-sections
- CFLAGS += -Os -std=gnu99 -Wall
--LDFLAGS := -nostartfiles -Wl,--gc-sections
-+LINKERFLAGS := -nostartfiles --gc-sections
- 
- obj-y += gpio.o mpu.o
- obj-f4 += $(obj-y) usart-f4.o
-@@ -22,22 +23,22 @@ all: stm32f429i-disco stm32429i-eval stm32f469i-disco stm32746g-eval
- 	$(CC) -c $(CFLAGS) $< -o $@
- 
- stm32f429i-disco: stm32f429i-disco.o $(obj-f4)
--	$(CC) -T stm32f429.lds $(LDFLAGS) -o stm32f429i-disco.elf stm32f429i-disco.o $(obj-f4)
-+	$(LD) -T stm32f429.lds $(LINKERFLAGS) -o stm32f429i-disco.elf stm32f429i-disco.o $(obj-f4)
- 	$(OBJCOPY) -Obinary stm32f429i-disco.elf stm32f429i-disco.bin
- 	$(SIZE) stm32f429i-disco.elf
- 
- stm32429i-eval: stm32429i-eval.o $(obj-f4)
--	$(CC) -T stm32f429.lds $(LDFLAGS) -o stm32429i-eval.elf stm32429i-eval.o $(obj-f4)
-+	$(LD) -T stm32f429.lds $(LINKERFLAGS) -o stm32429i-eval.elf stm32429i-eval.o $(obj-f4)
- 	$(OBJCOPY) -Obinary stm32429i-eval.elf stm32429i-eval.bin
- 	$(SIZE) stm32429i-eval.elf
- 
- stm32f469i-disco: stm32f469i-disco.o $(obj-f4)
--	$(CC) -T stm32f429.lds $(LDFLAGS) -o stm32f469i-disco.elf stm32f469i-disco.o $(obj-f4)
-+	$(LD) -T stm32f429.lds $(LINKERFLAGS) -o stm32f469i-disco.elf stm32f469i-disco.o $(obj-f4)
- 	$(OBJCOPY) -Obinary stm32f469i-disco.elf stm32f469i-disco.bin
- 	$(SIZE) stm32f469i-disco.elf
- 
- stm32746g-eval: stm32746g-eval.o $(obj-f7)
--	$(CC) -T stm32f429.lds $(LDFLAGS) -o stm32746g-eval.elf stm32746g-eval.o $(obj-f7)
-+	$(LD) -T stm32f429.lds $(LINKERFLAGS) -o stm32746g-eval.elf stm32746g-eval.o $(obj-f7)
- 	$(OBJCOPY) -Obinary stm32746g-eval.elf stm32746g-eval.bin
- 	$(SIZE) stm32746g-eval.elf
- 
--- 
-2.6.4
-
diff --git a/boot/afboot-stm32/afboot-stm32.hash b/boot/afboot-stm32/afboot-stm32.hash
index 431fbc3305..75f47295f6 100644
--- a/boot/afboot-stm32/afboot-stm32.hash
+++ b/boot/afboot-stm32/afboot-stm32.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 dbd715c8b99f7d266f74a04707a4dac76b75b31321f24dee5256a6348260530c  afboot-stm32-0.1.tar.gz
+sha256 9b37b661bd3091ceb5d8dc5a56a2dfc02ae9ebc0c63dad3c4289c9d6b3d3ec89  afboot-stm32-0.2.tar.gz
diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
index ee17fab5ff..0fb4735285 100644
--- a/boot/afboot-stm32/afboot-stm32.mk
+++ b/boot/afboot-stm32/afboot-stm32.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AFBOOT_STM32_VERSION = 0.1
+AFBOOT_STM32_VERSION = 0.2
 AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,v$(AFBOOT_STM32_VERSION))
 AFBOOT_STM32_INSTALL_IMAGES = YES
 AFBOOT_STM32_INSTALL_TARGET = NO
