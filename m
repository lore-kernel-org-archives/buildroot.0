Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B70BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 11:06:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD97E61260
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 11:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD97E61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 811C160903;
	Mon, 18 Oct 2021 11:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQlkDO8Dw348; Mon, 18 Oct 2021 11:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E6E608FA;
	Mon, 18 Oct 2021 11:06:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CCE41BF3A8
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 11:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B93982A17
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 11:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=foss.st.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLhRkL4eMWVR for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 11:06:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B07CD81092
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 11:06:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I7REif017964; 
 Mon, 18 Oct 2021 13:06:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zlwDhMn/+BQLIFBov0pbZO2pv0S6kIha7xYxGJ1kbwc=;
 b=ZEyZGf8Pu/aK0e2tMi/ydDOcW+pV5Dj39eujKXZVDNNU/GXt+00AgeJwu977qqDoyhxJ
 HSUZkgrv6QxgxNK4wazua/y7lQw7anrvuiaaRkghHM+V6e4FmlP41JOJNVeQBGFkgJLG
 +j5q0ZobLXbPKgrsj8w5NmeMUUkZHrM3FKhd/FL0xyaDz35DrYySPBw5zhXP2C+6AH/P
 ln3dMag2LBfb+CjzklvEvc6Z6pfRy0KKq/xesM6h+HtHpTYWmaRTV3pCZW4BzgvhBvSh
 3Py9oGWyEawvMM6YcNZ3AQcJvrEJKpnWqbKgFENKWPl5fLcqYY/aLGh1Lr+qR3gGKa1S 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bs4j2hap2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 13:06:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7121E10002A;
 Mon, 18 Oct 2021 13:06:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2720E21B532;
 Mon, 18 Oct 2021 13:06:24 +0200 (CEST)
Received: from lmecxl0909.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 18 Oct
 2021 13:06:23 +0200
To: Dario Binacchi <dariobin@libero.it>, <buildroot@buildroot.org>
References: <20211017162839.20278-1-dariobin@libero.it>
 <20211017162839.20278-2-dariobin@libero.it>
From: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Message-ID: <ebf890a0-3a93-6134-9dc8-f6aa1d128b33@foss.st.com>
Date: Mon, 18 Oct 2021 13:06:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211017162839.20278-2-dariobin@libero.it>
Content-Language: en-GB
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_03,2021-10-14_02,2020-04-07_01
Subject: Re: [Buildroot] [PATCH 1/2] configs/stm32f469_disco: enable Linux
 DRM support
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

Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>

On 10/17/21 6:28 PM, Dario Binacchi wrote:
> The patch [1], which is required for DRM to work properly, has been
> merged into Linux version 5.14-rc3. There's a 5.14.12 now in stable, so
> I took that one.
> 
> After Linux boots, /dev/fb0 will be accessible. You can control the
> brightness of the display after enabling the framebuffer by running the
> following commands:
> 
> ~ # echo 0 0 > /sys/class/graphics/fb0/pan
> ~ # echo 255 >/sys/class/backlight/40016c00.dsi.0/brightness
> 
> The brightness ranges from 0 to 255, as you can see running the
> command:
> 
> ~ # cat /sys/class/backlight/40016c00.dsi.0/max_brightness
> 
> [1] 24b5b1978cd5 ("clk: stm32f4: fix post divisor setup for I2S/SAI PLLs")
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>   board/stmicroelectronics/stm32f469-disco/linux.fragment | 8 +++++++-
>   configs/stm32f469_disco_defconfig                       | 4 ++--
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/board/stmicroelectronics/stm32f469-disco/linux.fragment b/board/stmicroelectronics/stm32f469-disco/linux.fragment
> index 90f5e8a8ff..e5d39bf04a 100644
> --- a/board/stmicroelectronics/stm32f469-disco/linux.fragment
> +++ b/board/stmicroelectronics/stm32f469-disco/linux.fragment
> @@ -1 +1,7 @@
> -# CONFIG_XIP_KERNEL is not set
> \ No newline at end of file
> +# CONFIG_XIP_KERNEL is not set
> +CONFIG_DRM=y
> +CONFIG_DRM_STM=y
> +CONFIG_DRM_STM_DSI=y
> +CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
> +CONFIG_FB=y
> +CONFIG_BACKLIGHT_CLASS_DEVICE=y
> diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
> index e538a664e2..438d32150c 100644
> --- a/configs/stm32f469_disco_defconfig
> +++ b/configs/stm32f469_disco_defconfig
> @@ -1,12 +1,12 @@
>   BR2_arm=y
>   BR2_cortex_m4=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.11"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.12"
>   BR2_LINUX_KERNEL_DEFCONFIG="stm32"
>   BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux.fragment"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
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
