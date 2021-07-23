Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC7EC4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 21:37:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D2E460EB0
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 21:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D2E460EB0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA056060C;
	Fri, 23 Jul 2021 21:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGIpCgK167uO; Fri, 23 Jul 2021 21:37:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E3560715;
	Fri, 23 Jul 2021 21:37:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5B1B1BF5A1
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 21:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A43144068A
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 21:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3-oMVokflsP for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 21:37:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F30F040672
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 21:37:30 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id h8so3415894ede.4
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 14:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wed8MYexXwtce0QUHVEu+CEI/xvYth+CipLGI7HrLk0=;
 b=MKGnaxNeCisWYeGJokXOeshtVg8yfxAQvNwG0+gePNjtE0SbWwUZXz3obtTBDWGRwP
 e6ITu4n+eadyXQ6sUA7Zcl7sGrTLDFD4MhUDBTByVQAClLm6UW75QGCNnbNzZGx659On
 i7njbjAVW0oF0gAQ/d6T6IaD/Lrw388UK20MEBsJgRt0p9yHHkIWTHuGUGu0ocuuLJ8P
 hZTfLNZTrlp4zfquqc2Pipb+kEIB7OiQs0/PEA15epMVHDFvRO4zJMcHSY7o2n084/w5
 1CUAQNcz61mBPhF3frdiO0VXw9wDD/DasQWj2rWafqSloR9An63J0qk1f9wn+z27Y+jk
 MjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Wed8MYexXwtce0QUHVEu+CEI/xvYth+CipLGI7HrLk0=;
 b=kUYaeN9Qm67b4WavkLnOEcDaAU7Upas+4VXGGMxhjbx2ZzCuOOgJwQ8ruBvTGErHly
 +7lUTUUs+gB50WiDCKGx+rlqnY4FlwHJUfzEcVdi22mmOejH8zED8o6F8bD8crM5yFY/
 zB/kBZsQMhB5sRj1nPuNMxEjnWdkOUp+7pjHBx88sP3DOEPF2u/x63uU5BrXZLrK5sLv
 diIS0YSN1BBsoA/2+nVGOVr4l4aHBO1Ur2QVweNi+77Yayvxk6L2p0g1FcB85VyBAvaq
 RO7QrKSSBeJL6qnkcjx8bPfISo8lkLlpweOfEGloRkPpvjJhScm/Fy1NTL1hp9Jy+9/c
 vfQw==
X-Gm-Message-State: AOAM5332rwSocMg7h39erVqk/H/6aziYRcvFitVwg7nb9LMd/hsNVMhh
 qJ6eqIlvIHKWeZY5xY/HddQBIg==
X-Google-Smtp-Source: ABdhPJx8JoU16TivoWbh4iAWgYUtZ8/SNpEmmcu8hzl6pS1BNfxiBgujN1J52LS6a35vPghKRvLs5A==
X-Received: by 2002:aa7:c1cc:: with SMTP id d12mr7950283edp.282.1627076248762; 
 Fri, 23 Jul 2021 14:37:28 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v14sm787713edy.68.2021.07.23.14.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 14:37:28 -0700 (PDT)
To: Yauheni Saldatsenka <eugentoo@gmail.com>, buildroot@buildroot.org
References: <20210723160422.490090-1-eugentoo@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <50116d22-7c7d-81fe-4d3d-5909a3338721@mind.be>
Date: Fri, 23 Jul 2021 23:37:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210723160422.490090-1-eugentoo@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] board/stm32f469-disco: update board
 configuration
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 Hi Yauheni,

 Thank you for this patch. I have a few comments that I unfortunately can't fix
myself.

 First of all, there are a few other patches posted by Dario (in Cc] [1][2]. How
does this relate to them?

[1]
https://patchwork.ozlabs.org/project/buildroot/patch/20210704141106.1746-2-dariobin@libero.it/
[2] https://patchwork.ozlabs.org/project/buildroot/list/?series=253877



 The subject line of this patch should be:

confgis/stm32f469_disco_xip_defconfig: alternative defconfig for stm32f469_disco

On 23/07/2021 18:04, Yauheni Saldatsenka wrote:
> Update STM32F469-disco configuration files to operate with new kernel.
> 
> Result of make tinyconfig was taken as a starting point to fit kernel
> into flash memory.
> Current setup kernel + rootfs fits in 1.6MB on-chip flash memory
> 
> Fixes:
>     - Move kernel to new flash bank due to growth of dtb size
>     - Fix kernel start address in bootloader
>     - Remove outdated path which doesn't affect normal operation mode
> 
> Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
> ---
>  .../stm32f469-disco/flash.sh                  |  47 +++-
>  .../stm32f469-disco/linux/defconfig           | 120 +++++++++
>  .../stm32f469-disco/linux/stm32f469-disco.dts | 240 ++++++++++++++++++
>  .../0002-kernel-start-address.patch           |  21 ++
>  .../patches/afboot-stm32/0003-no-mpu.patch    |  22 ++
>  configs/stm32f469_disco_xip_defconfig         |  24 ++
>  6 files changed, 465 insertions(+), 9 deletions(-)
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/linux/defconfig
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
>  create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
>  create mode 100644 configs/stm32f469_disco_xip_defconfig
> 
> diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash.sh
> index 984d2b2599..176e1c9d2c 100755
> --- a/board/stmicroelectronics/stm32f469-disco/flash.sh
> +++ b/board/stmicroelectronics/stm32f469-disco/flash.sh
> @@ -1,18 +1,47 @@
>  #!/bin/bash
>  
>  OUTPUT_DIR=$1
> +BUILD_TYPE=$2

 This change in the flash script will need a corresponding change in the readme.txt.

 Also, this change seems unrelated to the rest of the patch, so it should be in
a separate patch (with a good explanation in the commit message as to why it is
needed).

>  
> -if ! test -d "${OUTPUT_DIR}" ; then
> +if ! test -d "${OUTPUT_DIR}"
> +then

 Spurious change - we normally write the if and the then on one line in shell
scripts.

>      echo "ERROR: no output directory specified."
>      echo "Usage: $0 OUTPUT_DIR"
>      exit 1
>  fi
>  
> -${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
> -  -c "init" \
> -  -c "reset init" \
> -  -c "flash probe 0" \
> -  -c "flash info 0" \
> -  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
> -  -c "reset run" \
> -  -c "shutdown"
> +if  [[ -z "${BUILD_TYPE}" ]]
> +then
> +    echo "ERROR: no build type specified, please select 'xip' or 'uboot'."
> +    echo "Usage: $0 OUTPUT_DIR $1 BUILD_TYPE"
> +    exit 1
> +fi
> +
> +case "${BUILD_TYPE}" in
> +	"xip")
> +		${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
> +					 -c "init" \
> +					 -c "reset init" \
> +					 -c "flash probe 0" \
> +					 -c "flash info 0" \
> +					 -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
> +					 -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
> +					 -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08010000" \
> +					 -c "reset run" \
> +					 -c "shutdown"
> +		;;
> +	"uboot")
> +		FLASH_COMMAND=
> +		${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
> +					 -c "init" \
> +					 -c "reset init" \
> +					 -c "flash probe 0" \
> +					 -c "flash info 0" \
> +					 -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
> +					 -c "reset run" \
> +					 -c "shutdown"
> +	    ;;
> +	*)
> +		echo "Wrong build type. Please select from: xip, uboot"
> +		;;
> +esac
> diff --git a/board/stmicroelectronics/stm32f469-disco/linux/defconfig b/board/stmicroelectronics/stm32f469-disco/linux/defconfig
> new file mode 100644
> index 0000000000..2d0ce59b31
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f469-disco/linux/defconfig

 We normally call the linux config "linux.config", not "linux/defconfig".

> @@ -0,0 +1,120 @@
[snip]
> diff --git a/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
> new file mode 100644
> index 0000000000..83fe71bbc6
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts

 Please document in the commit message where you got this dts from. How does it
differ from the in-kernel one, and why can't you just patch the in-kernel one?

[snip]
>         chosen {
>                 bootargs = "root=/dev/ram fbcon=map:0";

 Not very important, but is the root=/dev/ram really needed? When we're using
initramfs, the kernel never looks at the root= parameter so it seems redundant.

>                 stdout-path = "serial0:115200n8";
>         };[snip]
> diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch

 Where is 0001?

> new file mode 100644
> index 0000000000..614effa85b
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
> @@ -0,0 +1,21 @@
> +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c

 Patches should preferably be produced by "git format-patch -N" from a git clone
of the upstream afboot-stm32 repository. Concretely, they should have:

- a subject line
- a good commit message (describing why the patch is needed, also upstream
status if relevant)
- your Signed-off-by

Basically, just like a patch submitted to buildroot.

> +index 2da1f4b65f..96e4dff65e 100644
> +--- a/stm32f469i-disco.c
> ++++ b/stm32f469i-disco.c
> +@@ -6,6 +6,7 @@
> + #include "gpio.h"
> + #include "mpu.h"
> + 
> ++#define KERNEL_ADDR     0x08010000
> + #define CONFIG_HSE_HZ	8000000
> + #define CONFIG_PLL_M	8
> + #define CONFIG_PLL_N	360
> +@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)
> + 
> + void start_kernel(void)
> + {
> +-	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
> ++	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);
> + 
> + 	kernel(0, ~0UL, 0x08004000);
> + }
> diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
> new file mode 100644
> index 0000000000..bc66d2d0ef
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
> @@ -0,0 +1,22 @@
> +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
> +index d4d0909831..03f823f288 100644
> +--- a/stm32f469i-disco.c
> ++++ b/stm32f469i-disco.c
> +@@ -127,7 +127,7 @@ int main(void)
> + 
> + 	int i;
> + 
> +-	mpu_config(0x0);
> ++	mpu_config(0xc0000000); 
> + 
> + 	if (*FLASH_CR & FLASH_CR_LOCK) {
> + 		*FLASH_KEYR = 0x45670123;
> +@@ -229,7 +229,7 @@ int main(void)
> + 	usart_setup(usart_base, 45000000);
> + 	usart_putch(usart_base, '.');
> + 
> +-	*SYSCFG_MEMRMP = 0x4;
> ++	/* *SYSCFG_MEMRMP = 0x4; */
> + 
> + 	start_kernel();
> + 
> diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
> new file mode 100644
> index 0000000000..81bdb0d6d6
> --- /dev/null
> +++ b/configs/stm32f469_disco_xip_defconfig
 The readme.txt should be updated to describe this new defconfig and the
differences between them, so people know which one to choose for their use case.

> @@ -0,0 +1,24 @@
> +BR2_arm=y
> +BR2_cortex_m4=y
> +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
> +BR2_KERNEL_HEADERS_5_13=y

 Please keep the default SAME_AS_KERNEL, and instead set

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y

 Also, it would be nice to bump stm32f469_disco_defconfig to use the same kernel
version.

> +# BR2_UCLIBC_INSTALL_UTILS is not set
> +BR2_GCC_VERSION_11_X=y

 Is GCC11 really needed? We normally want to keep the default GCC version in the
defconfigs, so they follow updates of GCC.

 If it si really needed, please document it in the commit message.

> +BR2_GCC_ENABLE_LTO=y

 I guess this really is needed - so please explain that in the commit message.

> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
> +BR2_LINUX_KERNEL=y

 Even though 5.13 is the default now, it's not going to stay that way. So you
need to set BR2_LINUX_KERNEL_CUSTOM_VERSION instead.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux/defconfig"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_XZ=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts"
> +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +BR2_PACKAGE_ZLIB=y

 Why is zlib needed? That seems weird...

> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_AFBOOT_STM32=y
> +BR2_PACKAGE_HOST_OPENOCD=y
> +BR2_PACKAGE_HOST_UTIL_LINUX=y

 I also don't see where util-linux is used, but I may have missed it.


 I have marked the patch as Changes Requested in patchwork.

 Regards,
 Arnout
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
