Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4D0C77B70
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D998B4038E;
	Sun,  9 Apr 2023 13:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D998B4038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id By9o7Pvo3Kof; Sun,  9 Apr 2023 13:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 292184014E;
	Sun,  9 Apr 2023 13:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 292184014E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20F911BF82D
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07A7F4014E
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07A7F4014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fl68SXPYo92f for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:39:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53E7540022
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53E7540022
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:39:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v29so2497836wra.13
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 06:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681047551;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1E91YpYTTl/UGzOI6e4IShYCwpKp2PvyURvePPI8jqE=;
 b=Mh1bgCS3KSRvm1TI+862jp9Pmu2JTsfIHKHgY4EwbJiGiybcD25j4KI7xYM4y99Cfg
 L+bVzTEZJsfO13uyldISra7jpbJTcPoBYegmdje2IotnK6H17DuwCzXg/5ydn53jnqq7
 jZg0mEDp0Fq14zQrFQyISKhzhVagG0l5dvpcCGwAGP94EIptxwL8fn9o5Vs09deNZX7m
 ugmcxrGkfNUeWU5XbNyJlnOeazwzyun23ThLSz9jACD+yrwiQc47ZCeiyf9JBMjD3MQT
 BVawpqmWPHUM2sdCNg4E10uj0eUwZ6qfIJqdUgOcAZOCJNWBVglkab014TjWC/85NA/0
 TN8Q==
X-Gm-Message-State: AAQBX9eOC0e+Hjza9Y+3BVTOFh6eqhB1QO6wx6t2r4pHstlPQx+4/RU5
 Jfefkq0UFDe3Cab6rz7hfk74PXbG5Ze7G2wToHw=
X-Google-Smtp-Source: AKy350ZgKB1pYyjY47bc8t8YWrPHnj9VxSAZdjD4R9feTVJWhjBARxGbyimvTRH2NQJDDveRBK1cEw==
X-Received: by 2002:a05:6000:a:b0:2c7:1dd5:7918 with SMTP id
 h10-20020a056000000a00b002c71dd57918mr5172146wrx.28.1681047551407; 
 Sun, 09 Apr 2023 06:39:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adfde05000000b002d78a96cf5fsm9292881wrm.70.2023.04.09.06.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 06:39:10 -0700 (PDT)
Message-ID: <6fe06202-9d9e-d0b9-ca5a-33658c2aff22@mind.be>
Date: Sun, 9 Apr 2023 15:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20230408134713.244958-1-dario.binacchi@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230408134713.244958-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681047551;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1E91YpYTTl/UGzOI6e4IShYCwpKp2PvyURvePPI8jqE=;
 b=g1hJ31+fGK8eP0mrpScmLyKpm6Oig1JARHoO76hmplSBWb5iRquDIJg6chdVNngbFO
 VuT35x2CNq3muazUESFJRKjxb4PPsT7OI6a/6km5fr2JSQbrRXX50B+ZlfYG4krF5niw
 6v2QxcWLvlLgoVmgzs1aP1ImG88xmpNKAvxFKHVfLkrM+RjVC1SLK4Y+zLxCahMv8WQf
 9AATlBvrprNfI6HNByy968ynl4crwPjYrMnkFU5aAXAdaXzrRUmpelrRrmVQL++MExEz
 dIDq8HXmaozZ7X5jwhA2RVBqQNMpjcnwuqfMxZNfmX8KKjjAT9YU7e0i6W1PSTAWNoNi
 oFVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g1hJ31+f
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_sd_defconfig:
 explicitly set U-Boot version
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



On 08/04/2023 15:47, Dario Binacchi wrote:
> The version of U-Boot must be explicitly set because if you keep the
> default setting, the bootloader is continuously updated in buildroot with
> the risk of building a non-working image.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/stm32f469_disco_sd_defconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
> index ea1361efc02c..dc00a47e1da2 100644
> --- a/configs/stm32f469_disco_sd_defconfig
> +++ b/configs/stm32f469_disco_sd_defconfig
> @@ -18,6 +18,9 @@ BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
