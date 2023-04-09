Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35F5C77B70
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 14:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58CD560B38;
	Sun,  9 Apr 2023 14:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58CD560B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbWqwLbKUpoB; Sun,  9 Apr 2023 14:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D2A360B2B;
	Sun,  9 Apr 2023 14:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D2A360B2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB9B61C2E2E
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE8B3415FF
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE8B3415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vE1Un1H2Tb8o for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 14:21:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5B274155F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5B274155F
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 14:21:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id gw13so1633934wmb.3
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 07:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681050072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tj1e26ZFymCZWdfqG1cq0BiCqMhY9NYKL9yRttqQJhI=;
 b=k+IBugyUndPVjo/nZoWCr84GqXYSa7ZBzPflifWzigZc4M97yF3CpyLADhbtsUdoEj
 lTptc+UnvTooi4wUVERX2wVmk/WbFtr/2nxfB0tQU73r0UXNOkzzC0lW/imXc1fN/tga
 WnJsia7taeMQXXtIdUsPGeOollKqixOJgBzvObrS2Zty+lcl7G6qC3TqA5wVHc0mM7eb
 0StdQ+DzrMGfVOjjBLJZbJuexkoBmVgsgbkZxKaBA3q4+uf2xom++9CJxOS1wNnKeLMG
 7w8tB94zNIYV7bWKZY7wgrEMimMe0oZpVSzcJF6BGhhxXB0f0+buOXbfki/zU3A/vTVR
 kj0w==
X-Gm-Message-State: AAQBX9eCcXI86sAr9F2x/aHWdlLGksNNgppDz16szC/Dp8EjFBY2NuMS
 FYFNtEdf8xMUgBX+vkpWa1P931ISAdmtGesGVfo=
X-Google-Smtp-Source: AKy350aDIOxy8ypGQiNMoKXzRokYIQ9ugS2XbcauY88VbKbkhdy6IIAMRIr0jae6aZFRtqyFF1askw==
X-Received: by 2002:a05:600c:198e:b0:3ed:ad05:5841 with SMTP id
 t14-20020a05600c198e00b003edad055841mr4305446wmq.17.1681050071879; 
 Sun, 09 Apr 2023 07:21:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c511600b003ef5bb63f13sm14635991wms.10.2023.04.09.07.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 07:21:11 -0700 (PDT)
Message-ID: <0c350dba-6016-3c12-c07c-732a05722cbf@mind.be>
Date: Sun, 9 Apr 2023 16:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20230405093317.13045-1-dario.binacchi@amarulasolutions.com>
 <20230405093317.13045-2-dario.binacchi@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230405093317.13045-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681050072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tj1e26ZFymCZWdfqG1cq0BiCqMhY9NYKL9yRttqQJhI=;
 b=D21MKujh9/QGjaUBWsuNxsjxFY5kvjyUB5O8VCn7hobMaFLLAwBasEgX308vW59IBp
 QHkzHwB82ZQpdIqFMXtMOsFfK2vVlJ1mqBwVK039AMIyOAl8QgPcBMLWuqnIo47EOE/z
 pqjZpfJJA7c33mQwCew9F/pFVEIivCoEnP+8NUByc0YVZitEhMx3UcPqvy8zfkz7w67x
 a9cUlRqqQ3mlnVmPp1jU/HMrptkL5eyEjlub1wenUwWzSqeAJKUldreULyZIVNongTDE
 4Z8IfDAeRrFteVHeC/AcrNeucGtSNNlu3LgNbjje9oj4ETGgtWp8Ge2kXc2QyQP3I8FU
 +/Fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D21MKujh
Subject: Re: [Buildroot] [PATCH 2/2]
 configs/imx8mn_bsh_smm_s2_pro_defconfig: bump U-Boot version to 2023.04
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2023 11:33, Dario Binacchi wrote:
> Bump U-Boot to version 2023.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   configs/imx8mn_bsh_smm_s2_pro_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
> index ebef4e5932c1..e9ff244a3555 100644
> --- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
> +++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
> @@ -28,7 +28,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
