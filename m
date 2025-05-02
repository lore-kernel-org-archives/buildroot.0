Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1031C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 912AA83DE2;
	Fri,  2 May 2025 10:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8cIex531R4G; Fri,  2 May 2025 10:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3FC883D1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3FC883D1B;
	Fri,  2 May 2025 10:39:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9AA3229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B8FA40BF7
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay69ZVp6oKd5 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF50E420F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF50E420F6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF50E420F6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:39:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E02541C1113; Fri,  2 May 2025 12:39:32 +0200 (CEST)
Message-ID: <5caf93a6-db67-429a-9a90-d957ccf03c60@rnout.be>
Date: Fri, 2 May 2025 12:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com
References: <20250410161623.1940341-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250410161623.1940341-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sDDhiv7cawFA7L1IHE0hqVNZQLhPNhhIHnzOHO3C6ps=;
 b=bKBubEuv0EJXGq0cjo57tFIhDUMMrR9c5Z8bOziRKWXu9llDm1ruh0sdVCfva8CWPhHiTD
 WNg2zcRnuXR3mhyfVuiYa/88OmcqTAamsp0/tYxLicCz7Itxp0MHK4WZsBRr8BtNt07XSd
 4RsLGnm80r2Av05UjkDsaS7lqSe90bPO9LjRF50xdnnlySY68ercsAYK6Buc9DvRjXIHni
 zMVT63E1Y/JvcObNW+SjKhoLdOjrrl00cwJOr0rXiTTIWhv06nHWY59mrVXeTRbhDMeF4c
 zP8LSL9ANH0ZiueAiJluPYpdWhLRrz6IahyBnRnjbF1F3IKcHfAQ2kESfn0g0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bKBubEuv
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux
 to 6.1.133
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2025 18:16, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.1.133. The size of xipImage
> has increased by only 22 bytes (1671804 bytes compared to 1671782 in
> version 6.1.126).
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
>   configs/stm32f429_disco_xip_defconfig                           | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
> index 9330b9749e76..7855de012d5c 100644
> --- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
> +++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  c91920b34aec412fa6deb6ae3f22ffb41879bf07115a5e224edf4f2778be1790  linux-6.1.126.tar.xz
> +sha256  97b59faf3f1925f296442a73a64439a447366f1d434be579803877097c5abe70  linux-6.1.133.tar.xz
> diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
> index 7ba5d4ee3f12..69266f567ea9 100644
> --- a/configs/stm32f429_disco_xip_defconfig
> +++ b/configs/stm32f429_disco_xip_defconfig
> @@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.126"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.133"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
>   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
