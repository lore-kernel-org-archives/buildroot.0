Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35232C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:58:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED90660E77
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED90660E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD92A60657;
	Sat, 28 Aug 2021 14:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0KNN_uyfPHGa; Sat, 28 Aug 2021 14:58:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E0BA6065A;
	Sat, 28 Aug 2021 14:58:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B714D1BF37B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A52E840101
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rX_AxX9XRpRJ for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 14:58:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23A7A40019
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 14:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7E19784380; Sat, 28 Aug 2021 14:57:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 16:58:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f910229ef0c6a94b97db73f3fd22e878a64dcdd
X-Git-Newrev: a3e3d9c198294e1848b692bfac4fa06d10706c1e
X-Patchwork-Hint: ignore
Message-Id: <20210828145742.7E19784380@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/stm32f469_disco_xip_defconfig: alternative defconfig for XIP
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a3e3d9c198294e1848b692bfac4fa06d10706c1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update STM32F469-disco configuration files to operate with new kernel.

Result of make tinyconfig was taken as a starting point to fit kernel
into flash memory.
Current setup kernel + rootfs fits in 1.6MB on-chip flash memory

Fixes:
    - Move kernel to new flash bank due to growth of dtb size
    - Fix kernel start address in bootloader
    - Remove outdated path which doesn't affect normal operation mode

For better binary size optimization gcc LTO is turned on.

Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
[Arnout:
 - squash 3 patches into 1;
 - remove unused dts file;
 - move linux/linux.config to linux-xip.config;
 - add a sentence to readme to say SD card is not needed.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../stm32f469-disco/flash_xip.sh                   |  20 ++++
 .../stm32f469-disco/linux-xip.config               | 120 +++++++++++++++++++++
 ...1-stm32f469-i-Update-kernel-start-address.patch |  56 ++++++++++
 ...se-default-dram-address-without-remapping.patch |  38 +++++++
 .../stm32f469-disco/readme_xip.txt                 |  24 +++++
 configs/stm32f469_disco_xip_defconfig              |  18 ++++
 6 files changed, 276 insertions(+)

diff --git a/board/stmicroelectronics/stm32f469-disco/flash_xip.sh b/board/stmicroelectronics/stm32f469-disco/flash_xip.sh
new file mode 100644
index 0000000000..b5a067cee5
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/flash_xip.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+
+OUTPUT_DIR=$1
+
+if ! test -d "${OUTPUT_DIR}"; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    exit 1
+fi
+
+${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08010000" \
+  -c "reset run" \
+  -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f469-disco/linux-xip.config b/board/stmicroelectronics/stm32f469-disco/linux-xip.config
new file mode 100644
index 0000000000..2d0ce59b31
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/linux-xip.config
@@ -0,0 +1,120 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_XZ=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_LOG_BUF_SHIFT=12
+CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=10
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
+# CONFIG_RD_GZIP is not set
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+# CONFIG_RD_ZSTD is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_MULTIUSER is not set
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_FHANDLE is not set
+# CONFIG_POSIX_TIMERS is not set
+# CONFIG_BUG is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_AIO is not set
+# CONFIG_IO_URING is not set
+# CONFIG_ADVISE_SYSCALLS is not set
+# CONFIG_MEMBARRIER is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_KCMP=y
+# CONFIG_RSEQ is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLOB=y
+# CONFIG_SLAB_MERGE_DEFAULT is not set
+# CONFIG_MMU is not set
+CONFIG_ARCH_STM32=y
+# CONFIG_MACH_STM32F429 is not set
+# CONFIG_MACH_STM32F746 is not set
+# CONFIG_MACH_STM32F769 is not set
+# CONFIG_MACH_STM32H743 is not set
+CONFIG_CPU_V7M_NUM_IRQ=240
+# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0xc0000000
+CONFIG_DRAM_SIZE=0x01000000
+CONFIG_HZ_1000=y
+# CONFIG_ATAGS is not set
+CONFIG_XIP_KERNEL=y
+CONFIG_XIP_PHYS_ADDR=0x08010000
+CONFIG_XIP_DEFLATED_DATA=y
+# CONFIG_SUSPEND is not set
+# CONFIG_STACKPROTECTOR is not set
+# CONFIG_COMPAT_32BIT_TIME is not set
+# CONFIG_GCC_PLUGINS is not set
+# CONFIG_BLOCK is not set
+CONFIG_BINFMT_FLAT=y
+CONFIG_BINFMT_SHARED_FLAT=y
+# CONFIG_COREDUMP is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_EEPROM_93CX6=y
+# CONFIG_INPUT is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_LDISC_AUTOLOAD is not set
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+# CONFIG_DEVMEM is not set
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_MFD_STM32_TIMERS=y
+# CONFIG_USB_SUPPORT is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_STM32=y
+CONFIG_DMADEVICES=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+CONFIG_SYNC_FILE=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_IIO=y
+CONFIG_IIO_BUFFER=y
+CONFIG_IIO_TRIGGERED_BUFFER=y
+CONFIG_IIO_STM32_TIMER_TRIGGER=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_PROC_SYSCTL is not set
+CONFIG_CONFIGFS_FS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NLS=y
+CONFIG_PRINTK_TIME=y
+CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
+CONFIG_CONSOLE_LOGLEVEL_QUIET=15
+CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
+# CONFIG_SYMBOLIC_ERRNAME is not set
+CONFIG_DEBUG_INFO=y
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_DEBUG_MISC is not set
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
new file mode 100644
index 0000000000..d5d1e5a8ad
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
@@ -0,0 +1,56 @@
+From fe5f3a86d07e378baeeddc1dfecd0686d83aa42f Mon Sep 17 00:00:00 2001
+From: Yauheni Saldatsenka <eugentoo@gmail.com>
+Date: Sat, 14 Aug 2021 18:54:51 +0300
+Subject: [PATCH] stm32f469-i: Update kernel start address
+
+As of GNU/Linux v5.12 kernel device tree binary grows above 0x08008000
+and overwrites kernel binary
+Therefore this commit moves kernel to the next flash bank
+
+Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
+---
+ stm32f469i-disco.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
+index 2da1f4b..46fc06a 100644
+--- a/stm32f469i-disco.c
++++ b/stm32f469i-disco.c
+@@ -6,6 +6,7 @@
+ #include "gpio.h"
+ #include "mpu.h"
+ 
++#define KERNEL_ADDR     0x08010000
+ #define CONFIG_HSE_HZ	8000000
+ #define CONFIG_PLL_M	8
+ #define CONFIG_PLL_N	360
+@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)
+ 
+ void start_kernel(void)
+ {
+-	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
++	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);
+ 
+ 	kernel(0, ~0UL, 0x08004000);
+ }
+@@ -102,7 +103,7 @@ int main(void)
+ 	volatile uint32_t *SYSCFG_MEMRMP = (void *)(SYSCFG_BASE + 0x00);
+ 	int i;
+ 
+-	mpu_config(0x0);
++	mpu_config(0xc0000000);
+ 
+ 	if (*FLASH_CR & FLASH_CR_LOCK) {
+ 		*FLASH_KEYR = 0x45670123;
+@@ -195,8 +196,6 @@ int main(void)
+ 	usart_setup(usart_base, 45000000);
+ 	usart_putch(usart_base, '.');
+ 
+-	*SYSCFG_MEMRMP = 0x4;
+-
+ 	start_kernel();
+ 
+ 	return 0;
+-- 
+2.32.0
+
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch
new file mode 100644
index 0000000000..68fe8380a2
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch
@@ -0,0 +1,38 @@
+From 8ccf9f625d00138d86fb7d70f3efd58a8fb4d7ff Mon Sep 17 00:00:00 2001
+From: Yauheni Saldatsenka <eugentoo@gmail.com>
+Date: Mon, 23 Aug 2021 02:54:22 +0300
+Subject: [PATCH] Use default dram address without remapping
+
+Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
+---
+ arch/arm/boot/dts/stm32f469-disco.dts | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
+index 2e1b3bbbe4b5..06845614a19a 100644
+--- a/arch/arm/boot/dts/stm32f469-disco.dts
++++ b/arch/arm/boot/dts/stm32f469-disco.dts
+@@ -60,9 +60,9 @@ chosen {
+ 		stdout-path = "serial0:115200n8";
+ 	};
+ 
+-	memory@00000000 {
++	memory@c0000000 {
+ 		device_type = "memory";
+-		reg = <0x00000000 0x1000000>;
++		reg = <0xc0000000 0x1000000>;
+ 	};
+ 
+ 	aliases {
+@@ -84,7 +84,7 @@ vdd_dsi: vdd-dsi {
+ 	};
+ 
+ 	soc {
+-		dma-ranges = <0xc0000000 0x0 0x10000000>;
++		dma-ranges = <0xc0000000 0xc0000000 0x10000000>;
+ 	};
+ 
+ 	leds {
+-- 
+2.32.0
+
diff --git a/board/stmicroelectronics/stm32f469-disco/readme_xip.txt b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
new file mode 100644
index 0000000000..632d221ba1
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
@@ -0,0 +1,24 @@
+STM32F469 Discovery
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32F469 Discovery evaluation platform.
+
+Internal flash memory stores simple afboot-stm32 bootloader, device tree and
+in place (XIP) kernel with built-in initramfs. No external flash or SD card
+is needed.
+
+Kernel is based on tinyconfig.
+
+Building
+--------
+
+  make stm32f469_disco_xip_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
+
+It will flash binary to internal flash memory.
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
new file mode 100644
index 0000000000..1ceffe4026
--- /dev/null
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -0,0 +1,18 @@
+BR2_arm=y
+BR2_cortex_m4=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
+# BR2_UCLIBC_INSTALL_UTILS is not set
+BR2_GCC_ENABLE_LTO=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_XZ=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_AFBOOT_STM32=y
+BR2_PACKAGE_HOST_OPENOCD=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
