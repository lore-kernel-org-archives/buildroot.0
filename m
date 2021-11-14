Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59033C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:32:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE5660F6B
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEE5660F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA1D40204;
	Sun, 14 Nov 2021 17:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jl-KQaz1erM; Sun, 14 Nov 2021 17:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD41240271;
	Sun, 14 Nov 2021 17:32:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C584B1BF2BA
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C29E380DA3
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7Ah4HKkdhrS for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 17:31:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-16.italiaonline.it [213.209.10.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C7B80D62
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 17:31:50 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([79.24.99.64])
 by smtp-16.iol.local with ESMTPA
 id mJLpm8CKm7VizmJM6mVOqB; Sun, 14 Nov 2021 18:31:50 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1636911110; bh=1OOcMSi+m9y8Stf8+OJq1s5KzMA3t96cERPVB52079o=;
 h=From;
 b=ZAwCOjdd24rOY7XaWZVkQPZCUYNTnOTgY4IVPX4eqKDZlgQzfIRHJJYQatFwI/II6
 RiPSAi41BgKt73VlT7ykKPh92075MFrAHa3DXDqfLFJMSGH0XPLUNcuWiPn8vdyLY5
 oQ1ijWQL/b1uQLbB+gkwDo9LH96duIgIS37B/azlIdS8LE9b2EGbk6tVx7L8BCw/mT
 yzBo25InJ9z/q4BiQbLywZ4RrfynGImPN0weq+W6R8T8cqumpRy1iaKL5i3RaKlOv1
 frkvhxCiN8nHOX7sWA5gk3RGh3j11hv9XclhYtU3opYHGRoEITJ/cmxUh1CgrD0hFS
 I1r0E2yGz+6bw==
X-CNFS-Analysis: v=2.4 cv=ftYZ2H0f c=1 sm=1 tr=0 ts=61914806 cx=a_exe
 a=8X6arsqDvdvtpvHbdcPR/Q==:117 a=8X6arsqDvdvtpvHbdcPR/Q==:17 a=uP1ucDPQAAAA:8
 a=ORQKomyGMWY2Aaz4Py8A:9 a=9a9ggB8z3XFZH39hjkD6:22
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 18:31:21 +0100
Message-Id: <20211114173122.16612-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211114173122.16612-1-dariobin@libero.it>
References: <20211114173122.16612-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfDqtG/6k204DaiuzuXpBI0Q4sMlBSsKQQO3RlM/fHAu0MohuHwOiP3IO3rvF9p051v8jBDvdPPl6exRK+zVpKL0SPMjotT3Lq92SsbcRRQ2gLFq+h51i
 gY5fyhjqlplPkDWXriocWRM62zddR5tJKhYh0hgAz8swzsieglAliGSYeBeJ4RXpmS1RFRIWSl/nvyMpq7eJCtLG89HOo61vgw9ChPyI6QL2j3uLyOOyTfVJ
 Xzd+XZdXb0FkV818ZsJN7vtKDx3nANo9Ccrz0HQcy1ZDDa2tJBpjzXnUWZGsVzh64cEQbYhn1P7Dgz82YiE3mmGjcY1IcL33qWh9jB5pT2zy0+9B5fGLtGco
 tmC+0gAN
Subject: [Buildroot] [v2,3/4] configs/stm32f429_disco: fix kernel bootup
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Lee Jones <lee.jones@linaro.org>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The kernel generated by the configuration for the STM32f429-discovery
board is buggy:

Fixes:
 Unhandled exception: IPSR = 00000006 LR = fffffff1
 CPU: 0 PID: 1 Comm: init Not tainted 4.11.0 #2
 Hardware name: STM32 (Device Tree Support)
 task: 9041a000 task.stack: 907c0000
 PC is at ret_fast_syscall+0x2/0x4a
 LR is at tty_ioctl+0x1ad/0x75c
 pc : [<0800d942>]    lr : [<080c2e05>]    psr: 4000000b
 sp : 907c1fa8  ip : 0000001c  fp : 905961a2
 r10: 00000000  r9 : 907c0000  r8 : 0800dae0
 r7 : 00000036  r6 : 905e7e60  r5 : 00000000  r4 : 905e7ebc
 r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
 xPSR: 4000000b
 CPU: 0 PID: 1 Comm: init Not tainted 4.11.0 #2
 Hardware name: STM32 (Device Tree Support)
 [<0800fbf9>] (unwind_backtrace) from [<0800f05b>] (show_stack+0xb/0xc)
 [<0800f05b>] (show_stack) from [<0800f553>] (__invalid_entry+0x4b/0x4c)

Inspired by commit a3e3d9c198 ("configs/stm32f469_disco_xip_defconfig:
alternative defconfig for XIP") I updated the stm32f429_disco_defconfig
configuration to use a newer kernel. Current setup kernel + rootfs fits
in 1.6MB on-chip flash memory.

The kernel has been moved to new flash bank due to growth of dtb size.

For better binary size optimization gcc LTO is turned on.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 .../stm32f429-disco/flash.sh                  |   2 +-
 .../stm32f429-disco/linux.config              | 120 ++++++++++++++++++
 ...sco-don-t-force-init-in-chosen-boota.patch |  32 -----
 configs/stm32f429_disco_defconfig             |  10 +-
 4 files changed, 127 insertions(+), 37 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32f429-disco/linux.config
 delete mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch

diff --git a/board/stmicroelectronics/stm32f429-disco/flash.sh b/board/stmicroelectronics/stm32f429-disco/flash.sh
index b19e0a6019..3e2bf121d3 100755
--- a/board/stmicroelectronics/stm32f429-disco/flash.sh
+++ b/board/stmicroelectronics/stm32f429-disco/flash.sh
@@ -21,6 +21,6 @@ ${OUTPUT_DIR}/host/bin/openocd -f board/${BOARD_NAME}.cfg \
   -c "flash info 0" \
   -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f429i-disco.bin 0x08000000" \
   -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f429-disco.dtb 0x08004000" \
-  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08008000" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x0800C000" \
   -c "reset run" \
   -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f429-disco/linux.config b/board/stmicroelectronics/stm32f429-disco/linux.config
new file mode 100644
index 0000000000..7b5c60f180
--- /dev/null
+++ b/board/stmicroelectronics/stm32f429-disco/linux.config
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
+CONFIG_POSIX_TIMERS=y
+CONFIG_BUG=y
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
+# CONFIG_MACH_STM32F469 is not set
+# CONFIG_MACH_STM32F746 is not set
+# CONFIG_MACH_STM32F769 is not set
+# CONFIG_MACH_STM32H743 is not set
+CONFIG_CPU_V7M_NUM_IRQ=240
+# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0x90000000
+CONFIG_DRAM_SIZE=0x00800000
+CONFIG_HZ_1000=y
+# CONFIG_ATAGS is not set
+CONFIG_XIP_KERNEL=y
+CONFIG_XIP_PHYS_ADDR=0x0800C000
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
diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch b/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
deleted file mode 100644
index d6d5c61aae..0000000000
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ded9afa688184b3240a92c2b8f114c545a09bc3f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 12 Mar 2016 23:14:41 +0100
-Subject: [PATCH] ARM: stm32f249-disco: don't force init= in /chosen/bootargs
-
-There is no reason to override the kernel's default init= value, as
-this breaks userspace that assumes the kernel default of /init is
-used. Since stm32 is often used with a minimal bootloader
-(afboot-stm32) that doesn't provide any mechanism to override the DTB,
-we need to adjust the kernel command line in the Device Tree source.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
-index f0b731d..2bae81c 100644
---- a/arch/arm/boot/dts/stm32f429-disco.dts
-+++ b/arch/arm/boot/dts/stm32f429-disco.dts
-@@ -53,7 +53,7 @@
- 	compatible = "st,stm32f429i-disco", "st,stm32f429";
- 
- 	chosen {
--		bootargs = "root=/dev/ram rdinit=/linuxrc";
-+		bootargs = "root=/dev/ram";
- 		stdout-path = "serial0:115200n8";
- 	};
- 
--- 
-2.6.4
-
diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
index 4007eb20a5..01b54c02cc 100644
--- a/configs/stm32f429_disco_defconfig
+++ b/configs/stm32f429_disco_defconfig
@@ -1,12 +1,14 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+BR2_KERNEL_HEADERS_5_15=y
+# BR2_UCLIBC_INSTALL_UTILS is not set
+BR2_GCC_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
-BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
