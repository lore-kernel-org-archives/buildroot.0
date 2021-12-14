Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB00CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 08:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E9E3408AC;
	Tue, 14 Dec 2021 08:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4b6IVFR6m9Ti; Tue, 14 Dec 2021 08:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56496408A8;
	Tue, 14 Dec 2021 08:29:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 943421BF2A6
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 08:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84014813A8
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 08:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=foss.st.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eai2JLEmOxri for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 08:29:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7707D813A2
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 08:29:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE3AJUl018624;
 Tue, 14 Dec 2021 09:29:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jl9QpDsVAcXOa57NDb2w2CnsTMDBWel1TYjqZP0Assg=;
 b=Yw3+N1Wzpaa3s4fuKbJKCoMT+/Qftz1seN+HKNZ8RHlTGZPQD/APzMdu1nouqR5dbRR/
 Qfb2ldebe3xdq33yi0u55fPYVI/OuP7VS+Y3UaUa/XtIC4XVZUOyek8C37LgqXyBYHLO
 ykJK2so4jiRCU0pEtwqSpdj0c+ywIc5edGuYkp0x+iHne+j0neTk0XNFX4e8Ti6AJypk
 rG5fncdLIkcW1p+zthosQXj5jIeJMnL6db9KJ80bXNJrQs6w1KwAUaqa+SNzipDG6/DU
 wUkzDY4VwaPZm1cmT12QYU2VY4Z2do11bhMDvxtCufRCqs6VIEdXixKibZpknUo0D0C+ 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxk4hhqd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 09:29:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D206210002A;
 Tue, 14 Dec 2021 09:29:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C9CCD226844;
 Tue, 14 Dec 2021 09:29:11 +0100 (CET)
Received: from lmecxl0909.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec
 2021 09:29:11 +0100
To: Dario Binacchi <dariobin@libero.it>, <buildroot@buildroot.org>
References: <20211212123753.11848-1-dariobin@libero.it>
 <20211212123753.11848-5-dariobin@libero.it>
From: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Message-ID: <f3a3b43a-8b19-6330-7a4e-a1c7229140dd@foss.st.com>
Date: Tue, 14 Dec 2021 09:29:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211212123753.11848-5-dariobin@libero.it>
Content-Language: en-GB
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_03,2021-12-13_01,2021-12-02_01
Subject: Re: [Buildroot] [RESEND PATCH v2,
 4/4] configs/stm32f4{2|6}9_*_defconfig: rename configurations
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
> The name of the configurations are now more explicit. As a result, the
> readme files have also been changed.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>   .../stm32f469-disco/{flash.sh => flash_sd.sh}                 | 0
>   .../stm32f469-disco/{linux.fragment => linux-sd.fragment}     | 0
>   board/stmicroelectronics/stm32f469-disco/readme.txt           | 4 ++--
>   board/stmicroelectronics/stm32f469-disco/readme_xip.txt       | 2 +-
>   ...tm32f429_disco_defconfig => stm32f429_disco_xip_defconfig} | 0
>   ...stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig} | 2 +-
>   6 files changed, 4 insertions(+), 4 deletions(-)
>   rename board/stmicroelectronics/stm32f469-disco/{flash.sh => flash_sd.sh} (100%)
>   rename board/stmicroelectronics/stm32f469-disco/{linux.fragment => linux-sd.fragment} (100%)
>   rename configs/{stm32f429_disco_defconfig => stm32f429_disco_xip_defconfig} (100%)
>   rename configs/{stm32f469_disco_defconfig => stm32f469_disco_sd_defconfig} (97%)
> 
> diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash_sd.sh
> similarity index 100%
> rename from board/stmicroelectronics/stm32f469-disco/flash.sh
> rename to board/stmicroelectronics/stm32f469-disco/flash_sd.sh
> diff --git a/board/stmicroelectronics/stm32f469-disco/linux.fragment b/board/stmicroelectronics/stm32f469-disco/linux-sd.fragment
> similarity index 100%
> rename from board/stmicroelectronics/stm32f469-disco/linux.fragment
> rename to board/stmicroelectronics/stm32f469-disco/linux-sd.fragment
> diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
> index 4d178b40d6..99d26ccb66 100644
> --- a/board/stmicroelectronics/stm32f469-disco/readme.txt
> +++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
> @@ -7,13 +7,13 @@ configuration for the STM32F469 Discovery evaluation platform.
>   Building
>   --------
>   
> -  make stm32f469_disco_defconfig
> +  make stm32f469_disco_sd_defconfig
>     make
>   
>   Flashing
>   --------
>   
> -  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
> +  ./board/stmicroelectronics/stm32f469-disco/flash_sd.sh output/
>   
>   It will flash the U-boot bootloader.
>   
> diff --git a/board/stmicroelectronics/stm32f469-disco/readme_xip.txt b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
> index 632d221ba1..7c20c2d015 100644
> --- a/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
> +++ b/board/stmicroelectronics/stm32f469-disco/readme_xip.txt
> @@ -19,6 +19,6 @@ Building
>   Flashing
>   --------
>   
> -  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
> +  ./board/stmicroelectronics/stm32f469-disco/flash_xip.sh output/
>   
>   It will flash binary to internal flash memory.
> diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_xip_defconfig
> similarity index 100%
> rename from configs/stm32f429_disco_defconfig
> rename to configs/stm32f429_disco_xip_defconfig
> diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_sd_defconfig
> similarity index 97%
> rename from configs/stm32f469_disco_defconfig
> rename to configs/stm32f469_disco_sd_defconfig
> index 438d32150c..5ad4068e5e 100644
> --- a/configs/stm32f469_disco_defconfig
> +++ b/configs/stm32f469_disco_sd_defconfig
> @@ -8,7 +8,7 @@ BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.12"
>   BR2_LINUX_KERNEL_DEFCONFIG="stm32"
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux.fragment"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config board/stmicroelectronics/stm32f469-disco/linux-sd.fragment"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>   BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
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
