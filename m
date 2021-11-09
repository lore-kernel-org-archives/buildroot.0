Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BEBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:01:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3052F6103D
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3052F6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C14F5606AE;
	Tue,  9 Nov 2021 22:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOR0-Ia_epcZ; Tue,  9 Nov 2021 22:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7F1F6075D;
	Tue,  9 Nov 2021 22:00:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 917981BF5DF
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CCD7401B1
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3dcDig1tLCSt for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:00:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2524440015
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:00:54 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id c8so2099806ede.13
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yWBdbB46sv1DjT4+IrZAeEUyvw+XiolO2c2hx7ym8jU=;
 b=QU+O0/n4uLiG349FY40u2BntxM0EUDtk4LjC3p2kSwB/xjdw2PmX6B01obwqVJUPBo
 LmFfGqVORPkt64FNh8Vu86lLt825cMvUqDdq/n4HFYQotZx78+J3oIzuoP94WyGT1+j1
 i+apJsEW3GeOouyFQpkrJUW+3jh3WQYLOKZooE2dCnql3kq6CfJprgCiVaU1ONvazlwY
 2oQxm+PBGP9NPey4x95V5ntbMR70CN8aJj2dYc0UrLzYHB0nfNfoMZjEoKWglc3vt8fc
 STrdvx7fKo7D0ByI5horQBwE80yu2JQUwZ+ggN0mGw8plBOi/Nrn5CstcSeL5yOIkpk4
 YoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yWBdbB46sv1DjT4+IrZAeEUyvw+XiolO2c2hx7ym8jU=;
 b=q5hitwgBmjwrOFWHI8oaGW1VvZBq1T288fM+/DXFC2yFj6iIcb0mTAB0JRHeKO3gzd
 QBJ/wScY9qObCZcIFhkCcZ2wY0Q1DocHBEN/4vmW6VQDUIURieQ3GESyn+5YGHBc5Lel
 +WmCh1C1+ZqD69Ay5zX6kg+/AHbpX8irDvJayCQM5Sl3kALU8I6yKIX/DACXoivumfej
 xraveirmHYMaTCCBA5nZTu/NupERwozskx2oNHErCcWsYzRuaFLOYep/29X7VsnZ8FdO
 2tg+/KBhIucz4pPBXn40ZvZEdcXxWZAlZmuvrz8XUEj/YcvPMbVIdm/P6G2ZBOMaVk+M
 fgNA==
X-Gm-Message-State: AOAM533LiNITQMbJCETKU3OB+jzqhEZC3XpLnwmMh0wEEWqe0tEyzDtj
 +kknPzi9NEvs5/OdUD+Sy/yvxw==
X-Google-Smtp-Source: ABdhPJwJTBp5N6teoWjHhRivTYB6YPiAym476LUOEh4C03KwAAEJzcKlsf3FhKpBeh4+3VFBX5gQrg==
X-Received: by 2002:a05:6402:27d3:: with SMTP id
 c19mr14830474ede.2.1636495253163; 
 Tue, 09 Nov 2021 14:00:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j11sm10027492ejt.114.2021.11.09.14.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 14:00:52 -0800 (PST)
Message-ID: <60a8f99e-b1dd-02e7-9ee6-0ac569e58642@mind.be>
Date: Tue, 9 Nov 2021 23:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20211101182429.11450-1-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211101182429.11450-1-dariobin@libero.it>
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/11/2021 19:24, Dario Binacchi wrote:
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

  (nitpick) you normally put the fixes tag before the thing that gets fixed, not 
before the changes you made to fix them. So in this case, it would become before 
the Unhandled exception above.

>   - Move kernel to new flash bank due to growth of dtb size.
>   - Fix kernel start address in afboot-stm32 bootloader.
> 
> For better binary size optimization gcc LTO is turned on.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
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

  I'm a bit confused, but I think I get it now... We have 3 disco configs:

- stm32f429_disco_defconfig is XIP
- stm32f469_disco_defconfig is in spiflash
- stm32f469_disco_xip_defconfig is XIP

  So, perhaps, to make things clearer, we should rename this defconfig to 
stm32f429_disco_xip_defconfig?

[snip]
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

  Since the DTS comes from the upstream kernel AFAICS, it would seem that this 
patch should be sent upstream as well. Have you done that? If so, please add an 
Upstream: <URL>.

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

  You *must* keep this (and the linux-headers version) explicitly, relying on 
the default is not OK. Indeed, if the default kernel is update in Buildroot 
(which happens every couple of weeks), then it's possible it will grow again and 
doesn't fit any more.


> -BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_XZ=y

  Err, now I'm really confused, this is a XIP kernel right, so it shouldn't be 
compressed?

  Regards,
  Arnout

>   BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
