Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6B3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 12:25:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0992561284
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 12:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0992561284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A05044024D;
	Mon,  8 Nov 2021 12:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SH31ThmBMTaQ; Mon,  8 Nov 2021 12:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAD7F40252;
	Mon,  8 Nov 2021 12:25:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2B41BF337
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 12:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AF2180DC3
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 12:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=foss.st.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwVp-KAsgV32 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 12:25:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D5EA80DBF
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 12:25:24 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8BN6gJ024630;
 Mon, 8 Nov 2021 13:25:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Y9eVRCkINq+Cpx3aY3rdphmiao38MbICmY3TkLWepSw=;
 b=g3C7LInEUfSiID9SS0L4eK7eYi+UMAZ24+Lg3VOZJZNWl9vVed/pFo6qGu25ZYp19wrq
 tr0tdiQXaO4g9NQ/1iBkE9bW+cNQIGE7lat7UrxAPmvoGovz+O56Seh65aNtU4QQ/SN6
 jOHcH9vUBEGkGytLtztx2jo2qKj1qLqAAwoIWb7VltPaJCFbIFD/Zbq/bemSaZuJ3w2J
 TLGwHAuJHkDGxTaY7msj9mS2pNslu6lyHgpcxEDBWHTcXe6I2uyBRIrGQOkrpxkW7eaE
 mwkaoo9/etH5JAdXSoQAJ+9/Eqcau5UXkJiHUulD2+pUPHLK01OyUEbH21kMV/iRD7ki 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c6u5vbvfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:25:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8D0D10002A;
 Mon,  8 Nov 2021 13:25:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 494E5222C92;
 Mon,  8 Nov 2021 13:25:20 +0100 (CET)
Received: from lmecxl0909.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov
 2021 13:25:19 +0100
To: Dario Binacchi <dariobin@libero.it>, <buildroot@buildroot.org>
References: <20211101182429.11450-1-dariobin@libero.it>
From: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Message-ID: <a7216568-efd2-1db5-451b-aae4d70f72a3@foss.st.com>
Date: Mon, 8 Nov 2021 13:25:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101182429.11450-1-dariobin@libero.it>
Content-Language: en-GB
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_04,2021-11-08_01,2020-04-07_01
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f429_disco: fix kernel
 bootup
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/1/21 7:24 PM, Dario Binacchi wrote:
> The kernel generated by the configuration for the STM32f429-discovery
> board is buggy:
> 
>   Unhandled exception: IPSR = 00000006 LR = fffffff1
>   CPU: 0 PID: 1 Comm: init Not tainted 4.11.0 #2
>   Hardware name: STM32 (Device Tree Support)
>   task: 9041a000 task.stack: 907c0000
>   PC is at ret_fast_syscall+0x2/0x4a
>   LR is at tty_ioctl+0x1ad/0x75c
>   pc : [<0800d942>]    lr : [<080c2e05>]    psr: 4000000b
>   sp : 907c1fa8  ip : 0000001c  fp : 905961a2
>   r10: 00000000  r9 : 907c0000  r8 : 0800dae0
>   r7 : 00000036  r6 : 905e7e60  r5 : 00000000  r4 : 905e7ebc
>   r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
>   xPSR: 4000000b
>   CPU: 0 PID: 1 Comm: init Not tainted 4.11.0 #2
>   Hardware name: STM32 (Device Tree Support)
>   [<0800fbf9>] (unwind_backtrace) from [<0800f05b>] (show_stack+0xb/0xc)
>   [<0800f05b>] (show_stack) from [<0800f553>] (__invalid_entry+0x4b/0x4c)
> 
> Inspired by commit a3e3d9c198 ("configs/stm32f469_disco_xip_defconfig:
> alternative defconfig for XIP") I updated the stm32f429_disco_defconfig
> configuration to use a newer kernel. Current setup kernel + rootfs fits
> in 1.6MB on-chip flash memory.
> 
> Fixes:
>   - Move kernel to new flash bank due to growth of dtb size.
>   - Fix kernel start address in afboot-stm32 bootloader.
> 
> For better binary size optimization gcc LTO is turned on.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
> ---
>   .../stm32f429-disco/flash.sh                  |   2 +-
>   .../stm32f429-disco/linux.config              | 120 ++++++++++++++++++
>   ...9i-disco-update-kernel-start-address.patch |  30 +++++
>   ...sco-don-t-force-init-in-chosen-boota.patch |  32 -----
>   configs/stm32f429_disco_defconfig             |   9 +-
>   5 files changed, 156 insertions(+), 37 deletions(-)
>   create mode 100644 board/stmicroelectronics/stm32f429-disco/linux.config
>   create mode 100644 board/stmicroelectronics/stm32f429-disco/patches/afboot-stm32/0001-stm32f429i-disco-update-kernel-start-address.patch
>   delete mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
> 
> diff --git a/board/stmicroelectronics/stm32f429-disco/flash.sh b/board/stmicroelectronics/stm32f429-disco/flash.sh
> index b19e0a6019..3e2bf121d3 100755
> --- a/board/stmicroelectronics/stm32f429-disco/flash.sh
> +++ b/board/stmicroelectronics/stm32f429-disco/flash.sh
> @@ -21,6 +21,6 @@ ${OUTPUT_DIR}/host/bin/openocd -f board/${BOARD_NAME}.cfg \
>     -c "flash info 0" \
>     -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f429i-disco.bin 0x08000000" \
>     -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f429-disco.dtb 0x08004000" \
> -  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08008000" \
> +  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x0800C000" \
>     -c "reset run" \
>     -c "shutdown"
> diff --git a/board/stmicroelectronics/stm32f429-disco/linux.config b/board/stmicroelectronics/stm32f429-disco/linux.config
> new file mode 100644
> index 0000000000..7b5c60f180
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f429-disco/linux.config
> @@ -0,0 +1,120 @@
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_KERNEL_XZ=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_PREEMPT=y
> +CONFIG_LOG_BUF_SHIFT=12
> +CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=10
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
> +# CONFIG_RD_GZIP is not set
> +# CONFIG_RD_BZIP2 is not set
> +# CONFIG_RD_LZMA is not set
> +# CONFIG_RD_XZ is not set
> +# CONFIG_RD_LZO is not set
> +# CONFIG_RD_LZ4 is not set
> +# CONFIG_RD_ZSTD is not set
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +# CONFIG_MULTIUSER is not set
> +# CONFIG_SYSFS_SYSCALL is not set
> +# CONFIG_FHANDLE is not set
> +CONFIG_POSIX_TIMERS=y
> +CONFIG_BUG=y
> +# CONFIG_BASE_FULL is not set
> +# CONFIG_FUTEX is not set
> +# CONFIG_EPOLL is not set
> +# CONFIG_SIGNALFD is not set
> +# CONFIG_TIMERFD is not set
> +# CONFIG_EVENTFD is not set
> +# CONFIG_AIO is not set
> +# CONFIG_IO_URING is not set
> +# CONFIG_ADVISE_SYSCALLS is not set
> +# CONFIG_MEMBARRIER is not set
> +# CONFIG_KALLSYMS is not set
> +CONFIG_KCMP=y
> +# CONFIG_RSEQ is not set
> +CONFIG_EMBEDDED=y
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLOB=y
> +# CONFIG_SLAB_MERGE_DEFAULT is not set
> +# CONFIG_MMU is not set
> +CONFIG_ARCH_STM32=y
> +# CONFIG_MACH_STM32F469 is not set
> +# CONFIG_MACH_STM32F746 is not set
> +# CONFIG_MACH_STM32F769 is not set
> +# CONFIG_MACH_STM32H743 is not set
> +CONFIG_CPU_V7M_NUM_IRQ=240
> +# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
> +CONFIG_SET_MEM_PARAM=y
> +CONFIG_DRAM_BASE=0x90000000
> +CONFIG_DRAM_SIZE=0x00800000
> +CONFIG_HZ_1000=y
> +# CONFIG_ATAGS is not set
> +CONFIG_XIP_KERNEL=y
> +CONFIG_XIP_PHYS_ADDR=0x0800C000
> +CONFIG_XIP_DEFLATED_DATA=y
> +# CONFIG_SUSPEND is not set
> +# CONFIG_STACKPROTECTOR is not set
> +# CONFIG_COMPAT_32BIT_TIME is not set
> +# CONFIG_GCC_PLUGINS is not set
> +# CONFIG_BLOCK is not set
> +CONFIG_BINFMT_FLAT=y
> +CONFIG_BINFMT_SHARED_FLAT=y
> +# CONFIG_COREDUMP is not set
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +# CONFIG_STANDALONE is not set
> +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
> +# CONFIG_FW_LOADER is not set
> +# CONFIG_ALLOW_DEV_COREDUMP is not set
> +CONFIG_EEPROM_93CX6=y
> +# CONFIG_INPUT is not set
> +# CONFIG_VT is not set
> +# CONFIG_UNIX98_PTYS is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_LDISC_AUTOLOAD is not set
> +CONFIG_SERIAL_STM32=y
> +CONFIG_SERIAL_STM32_CONSOLE=y
> +# CONFIG_DEVMEM is not set
> +# CONFIG_HWMON is not set
> +CONFIG_WATCHDOG=y
> +CONFIG_MFD_STM32_TIMERS=y
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_TRIGGERS=y
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_STM32=y
> +CONFIG_DMADEVICES=y
> +CONFIG_STM32_DMA=y
> +CONFIG_STM32_DMAMUX=y
> +CONFIG_STM32_MDMA=y
> +CONFIG_SYNC_FILE=y
> +# CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
> +CONFIG_IIO=y
> +CONFIG_IIO_BUFFER=y
> +CONFIG_IIO_TRIGGERED_BUFFER=y
> +CONFIG_IIO_STM32_TIMER_TRIGGER=y
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +# CONFIG_INOTIFY_USER is not set
> +# CONFIG_PROC_SYSCTL is not set
> +CONFIG_CONFIGFS_FS=y
> +# CONFIG_MISC_FILESYSTEMS is not set
> +CONFIG_NLS=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
> +CONFIG_CONSOLE_LOGLEVEL_QUIET=15
> +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
> +# CONFIG_SYMBOLIC_ERRNAME is not set
> +CONFIG_DEBUG_INFO=y
> +# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> +CONFIG_DEBUG_FS=y
> +# CONFIG_DEBUG_MISC is not set
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_RCU_TRACE is not set
> +# CONFIG_RUNTIME_TESTING_MENU is not set
> diff --git a/board/stmicroelectronics/stm32f429-disco/patches/afboot-stm32/0001-stm32f429i-disco-update-kernel-start-address.patch b/board/stmicroelectronics/stm32f429-disco/patches/afboot-stm32/0001-stm32f429i-disco-update-kernel-start-address.patch
> new file mode 100644
> index 0000000000..715ade694d
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f429-disco/patches/afboot-stm32/0001-stm32f429i-disco-update-kernel-start-address.patch
> @@ -0,0 +1,30 @@
> +From 9cdee858b36e2de7d6717e56fd3d08ad9ad25cde Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dariobin@libero.it>
> +Date: Sun, 31 Oct 2021 08:52:52 +0100
> +Subject: [PATCH] stm32f429i-disco: update kernel start address
> +
> +As of GNU/Linux v5.14 kernel device tree binary grows above 0x08008000
> +and overwrites kernel binary.
> +Therefore this commit moves kernel to the next flash bank.
> +
> +Signed-off-by: Dario Binacchi <dariobin@libero.it>
> +---
> + stm32f429i-disco.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/stm32f429i-disco.c b/stm32f429i-disco.c
> +index 8b27641..14a6f1e 100644
> +--- a/stm32f429i-disco.c
> ++++ b/stm32f429i-disco.c
> +@@ -88,7 +88,7 @@ static void fmc_wait_busy(void)
> +
> + void start_kernel(void)
> + {
> +-	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
> ++	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x0800C000 | 1);
> +
> + 	kernel(0, ~0UL, 0x08004000);
> + }
> +--
> +2.17.1
> +
> diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch b/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
> deleted file mode 100644
> index d6d5c61aae..0000000000
> --- a/board/stmicroelectronics/stm32f429-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From ded9afa688184b3240a92c2b8f114c545a09bc3f Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Sat, 12 Mar 2016 23:14:41 +0100
> -Subject: [PATCH] ARM: stm32f249-disco: don't force init= in /chosen/bootargs
> -
> -There is no reason to override the kernel's default init= value, as
> -this breaks userspace that assumes the kernel default of /init is
> -used. Since stm32 is often used with a minimal bootloader
> -(afboot-stm32) that doesn't provide any mechanism to override the DTB,
> -we need to adjust the kernel command line in the Device Tree source.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> -index f0b731d..2bae81c 100644
> ---- a/arch/arm/boot/dts/stm32f429-disco.dts
> -+++ b/arch/arm/boot/dts/stm32f429-disco.dts
> -@@ -53,7 +53,7 @@
> - 	compatible = "st,stm32f429i-disco", "st,stm32f429";
> -
> - 	chosen {
> --		bootargs = "root=/dev/ram rdinit=/linuxrc";
> -+		bootargs = "root=/dev/ram";
> - 		stdout-path = "serial0:115200n8";
> - 	};
> -
> ---
> -2.6.4
> -
> diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
> index 2c0641a6c5..58367fca0b 100644
> --- a/configs/stm32f429_disco_defconfig
> +++ b/configs/stm32f429_disco_defconfig
> @@ -1,13 +1,14 @@
>   BR2_arm=y
>   BR2_cortex_m4=y
>   BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
> +# BR2_UCLIBC_INSTALL_UTILS is not set
> +BR2_GCC_ENABLE_LTO=y
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
>   BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
> -BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_XZ=y
>   BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
> 


-- 
Best regards / Cordialement,

Christophe Priouzeau | Tel: +33 244027320
STMicroelectronics
ST online: www.st.com<http://www.st.com/>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
