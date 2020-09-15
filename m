From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 19:59:02 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] boot/afboot-stm32: fix
 build with gcc 10
Message-ID: <20200915175147.309608756A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04f541b88b80adfba61e529273d763d5b75db6bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

This commit adds a patch that passes -fno-builtin to fix the build
with gcc 10. The patch has been submitted upstream.

There are no autobuilder failures, since it's a bootloader package,
and therefore not tested by the autobuilders. However, a build failure
was detected when building toolchains and a minimal ARMv7-M system at
https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359529.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1c967e2c8c07534d2ccf0451eebfc653efb02b9f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Pass-fno-builtin-to-fix-build-with-gcc-10.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/boot/afboot-stm32/0001-Pass-fno-builtin-to-fix-build-with-gcc-10.patch b/boot/afboot-stm32/0001-Pass-fno-builtin-to-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..5ef47b59ff
--- /dev/null
+++ b/boot/afboot-stm32/0001-Pass-fno-builtin-to-fix-build-with-gcc-10.patch
@@ -0,0 +1,46 @@
+From 5448f328ff63a6ca4a64519c2f1dfc63a33df4b7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 10 Sep 2020 11:37:33 +0200
+Subject: [PATCH] Pass -fno-builtin to fix build with gcc 10
+
+gcc 10, if it recognizes some hand-written code that looks like
+memcpy, will generate a call to memcpy().
+
+For example:
+
+        while (dst < &_end_data) {
+                *dst++ = *src++;
+        }
+
+gets recognized as such. However, in the context of bare-metal code,
+having a call to memcpy() in the C library doesn't work. So we fix
+that by disabling builtins.
+
+Fixes:
+
+/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: stm32f429i-disco.o: in function `reset':
+stm32f429i-disco.c:(.text.reset+0x1a): undefined reference to `memcpy'
+/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: stm32f429i-disco.c:(.text.reset+0x34): undefined reference to `memset'
+make[1]: *** [Makefile:26: stm32f429i-disco] Error 1
+
+Upstream: https://github.com/mcoquelin-stm32/afboot-stm32/pull/9
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index f699176..1e8557d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -13,6 +13,7 @@ DTB_ADDR?=0x08004000
+ CFLAGS := -mthumb -mcpu=cortex-m4
+ CFLAGS += -ffunction-sections -fdata-sections
+ CFLAGS += -Os -std=gnu99 -Wall
++CFLAGS += -fno-builtin
+ LINKERFLAGS := -nostartfiles --gc-sections
+ 
+ obj-y += gpio.o mpu.o qspi.o start_kernel.o
+-- 
+2.26.2
+
