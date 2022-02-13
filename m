Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D77C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 10:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AABC581886;
	Sun, 13 Feb 2022 10:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gACxYEgLbtOy; Sun, 13 Feb 2022 10:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 028C281846;
	Sun, 13 Feb 2022 10:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABCA91BF2C9
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 10:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99EED4032E
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 10:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Unc7p7_-gJy6 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 10:47:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5A294032D
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 10:47:50 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id p9so8864813ejd.6
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 02:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=tgaVmIzXURVB/zz5/hD56qeHZNLu43szU8xzLr/hmQo=;
 b=hBcCFLiezJDynf1mokBFfQ2M+DRU7qt98aZzHR6RhOPBfz4XVggAT9VHrvP+Om0jDk
 uiDxM5OFrcsS/wQgdF3rFlR91l0Ml9rJJAAkC6ibzlORkrpxJsBXCOZCScDffA4dlqkb
 pkY7wn/GSQua7FP2zoBrZhNotFiXMzzw8TNZqWxMfKnNif8d6b42LRRZWOOxspReOibn
 TFH2AIfGS5UPxhdhS6Od+SQ7RThP8ECTqp8hy6+cfnxMUQEpmYdLdsMwOGkGzduJExSm
 Ofi9YtQE74ig6ox3+jRIgGcoaEeHssrLF900bW+Jw7lcv47LEeLcJMzzlx7biKomuRAe
 472w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tgaVmIzXURVB/zz5/hD56qeHZNLu43szU8xzLr/hmQo=;
 b=ZB2LBoBLad796o4wB3Jc1no4H0w5O5Uiwg3bPJAm37lXsiqfwFBXwDeqQIqYyGcJc3
 UTJyPrBUOP3CD0gVLYAOTefvecwE61V6QTsYQmNsKjgCvsnwgfjzeaiqv7GtohdDKXQp
 PTqAUfpC8RRZBQibnEBeOufxIQlB/yXPykbzpw+/Jo596ht6Rl+rftulZOrAY3hWqDo7
 b9hyXATc6oRj6j4iiEqRw/Q75TUxSPkKHDDp8aZjGCawBNVQI9doPjzb5tyDr95gbHF8
 D73cdCe0N8PSMHVBH2OROJKt5tX1nSR2BMRnwc1s+owr3FDQpDW+T+h0M+ImR/qtDa1k
 FRuw==
X-Gm-Message-State: AOAM531ttgTmYoNnDq+6+UlGuyR55Jl8rqWXqgCM6BySPT2wu9ycQmCx
 8q8nhBSrNqM/XkAo1EW7c/Ak4AzZN6Z+fg==
X-Google-Smtp-Source: ABdhPJxkNioqayG70N55z+tp7POwJuATB1zwX7LoOuo04Bq8BKaiQVIJfGv8epOojTuarkH0cjSSjg==
X-Received: by 2002:a17:906:77cb:: with SMTP id
 m11mr727243ejn.349.1644749269132; 
 Sun, 13 Feb 2022 02:47:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i17sm11962706edv.40.2022.02.13.02.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 02:47:48 -0800 (PST)
Message-ID: <92785a1f-9323-9d54-b7a6-8b0c40d6bd92@mind.be>
Date: Sun, 13 Feb 2022 11:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Eugen Hristev <eugen.hristev@microchip.com>, buildroot@buildroot.org
References: <20220211140855.917229-1-eugen.hristev@microchip.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220211140855.917229-1-eugen.hristev@microchip.com>
Subject: Re: [Buildroot] [PATCH]
 configs/microchip_sama7g5ek_mmc_dev_defconfig: add rng tools
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



On 11/02/2022 15:08, Eugen Hristev via buildroot wrote:
> Add rng tools. Without this, when booting, prompt will not
> appear until 'random: crng init done' appears.
> Avoid this by using rng tools without the libjitterentropy.
> Libjitterentropy is a jitter source of entropy which does
> not help for AT91 cpus as the jitter does not have
> enough variance to generate fast enough entropy.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Hi,
> 
> This should go for 2022.02 in my opinion.
> 
> Thanks,
> 
>   configs/microchip_sama7g5ek_mmc_dev_defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
> index 3253bce401..895e63edcd 100644
> --- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
> +++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
> @@ -27,6 +27,8 @@ BR2_PACKAGE_MMC_UTILS=y
>   BR2_PACKAGE_MTD=y
>   BR2_PACKAGE_WILC1000_FIRMWARE=y
>   BR2_PACKAGE_EVTEST=y
> +BR2_PACKAGE_RNG_TOOLS=y
> +# BR2_PACKAGE_RNG_TOOLS_JITTERENTROPY_LIBRARY is not set
>   BR2_PACKAGE_SETSERIAL=y
>   BR2_PACKAGE_SPI_TOOLS=y
>   BR2_PACKAGE_USBUTILS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
