Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78455C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 08:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0860540288;
	Tue, 14 Dec 2021 08:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EUXvNrBPYiTr; Tue, 14 Dec 2021 08:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A15B40888;
	Tue, 14 Dec 2021 08:29:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0928E1BF2A6
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 08:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EABDD40165
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 08:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=foss.st.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGB4PkalwzH2 for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 08:29:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 132394025F
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 08:29:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE3Ab2I018804;
 Tue, 14 Dec 2021 09:29:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oTWAfVzTfxugE2O8SNHim+HhOtBQV3WCz08jQviDtII=;
 b=kesAjswT74tEeK0IjJDkb1PNaZd3rPccLPiAddw7cW79ZROp+/Ki2bZ/XvtIVxk7DTES
 X1lrlsN1lJADgWml3ZizJdeo1nIoeh5183TX8/bcXXadO7XWoiN8cDXPttazbCRpYcmJ
 SXBRCKBHEmrt4ubK7BMuu6J3eaT3b4bHID8gB07hLMO6TL797siUs2n0MppiqQnxdAvd
 Ye8sFrwb2HLTzixBK4v9fqKChbDRnMwuBbQoN1RahpjL7q9dUFCy3UDa8Af6EpgACSqt
 dJmjh14iG3laPE7dzlKQyvvOMrPjkUPR3lNb+xjMzNv/UCNWGJZUVmB+qbGp1KvaJvbX EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxk4hhqcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 09:29:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95D9610002A;
 Tue, 14 Dec 2021 09:29:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B66D226840;
 Tue, 14 Dec 2021 09:29:01 +0100 (CET)
Received: from lmecxl0909.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec
 2021 09:29:01 +0100
To: Dario Binacchi <dariobin@libero.it>, <buildroot@buildroot.org>
References: <20211212123753.11848-1-dariobin@libero.it>
 <20211212123753.11848-4-dariobin@libero.it>
From: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Message-ID: <ed3c795f-d22b-2840-7984-c09e8ac1dd10@foss.st.com>
Date: Tue, 14 Dec 2021 09:29:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211212123753.11848-4-dariobin@libero.it>
Content-Language: en-GB
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_03,2021-12-13_01,2021-12-02_01
Subject: Re: [Buildroot] [RESEND PATCH v2,
 3/4] configs/stm32f429_disco: fix kernel bootup
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
Cc: Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>

On 12/12/21 1:37 PM, Dario Binacchi wrote:
> The kernel generated by the configuration for the STM32f429-discovery
> board is buggy:
> 
> Fixes:
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
> The kernel has been moved to new flash bank due to growth of dtb size.
> 
> For better binary size optimization gcc LTO is turned on.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>   .../stm32f429-disco/flash.sh                  |   2 +-
>   .../stm32f429-disco/linux.config              | 120 ++++++++++++++++++
>   ...sco-don-t-force-init-in-chosen-boota.patch |  32 -----
>   configs/stm32f429_disco_defconfig             |  10 +-
>   4 files changed, 127 insertions(+), 37 deletions(-)
>   create mode 100644 board/stmicroelectronics/stm32f429-disco/linux.config
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
> index 4007eb20a5..01b54c02cc 100644
> --- a/configs/stm32f429_disco_defconfig
> +++ b/configs/stm32f429_disco_defconfig
> @@ -1,12 +1,14 @@
>   BR2_arm=y
>   BR2_cortex_m4=y
> -BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
> +BR2_KERNEL_HEADERS_5_15=y
> +# BR2_UCLIBC_INSTALL_UTILS is not set
> +BR2_GCC_ENABLE_LTO=y
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
> -BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>   BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
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
