Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9227EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:00:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFDD2617E4
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFDD2617E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 714DC80E7B;
	Mon,  8 Nov 2021 22:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nE1MTd41ap_g; Mon,  8 Nov 2021 22:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D80C280E8A;
	Mon,  8 Nov 2021 22:00:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD8F11BF2FC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D95B5401CB
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kBVNyTrmhKK for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:00:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78A88401C0
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:00:35 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id v11so65995367edc.9
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 14:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=c6ZuN+5H+OSTg85iXDbp4+YyxP3U9Lu/sxne84fBvfU=;
 b=Dppnk/8SnqcKnTrvFUn4QGAZ7miDKQ3XkSE78mueyqoMxpbv7pVNsANWSyHSmahCTb
 rdRpMxwWutpo+z7BPy3yyF7n1RkD6XTaXHNeJpJo/Ks8kQyox1Xy0L+KNfl6s0TLVYPs
 uxa4x5IPnPa4dB0s74yl43JaR5Y/rIdcRx9u8Y1JjDYDG7DZL+gUpUSSxKM5jrgOTE/+
 tbf9cgoQ2o5SuRo7ClidXIe278EB27R0pLv0B/bXNGwTkvO42KTx7Q5M6CyCwjhTb9Pt
 L6y2F/u0xFUpkZnvDQ4G6jerkTTg+gAW4zZrFNDLoJaXAAxY8FZbOfUIMWr4Z6N5amTY
 mz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=c6ZuN+5H+OSTg85iXDbp4+YyxP3U9Lu/sxne84fBvfU=;
 b=4lVkcsQQR/3JUJJNBD/DqUfEpQc1G/F+VTh7Ytp18qPWFJQkUz8e05ulOvAzkFWIr7
 1zAKSi9posZSe0hMCJOBNMgm91QvaD4RIb8mtPngHgJyeBymiugz22hIz5t7uAYpcV3u
 iz1FP5T1kvQ7EpmGL092jb3df7xa910CZxVmwvFBHeIisSyfFDV/CzsBoTEKZOIN8XK6
 zgJhS5lCvOTqpxtpb8ZkJgyTZbexvLGylW410GwIIllpuwJIrkHXUIKg3T1A2BX8p4o0
 XtHrpy1hS8VqGlPuv6fmMhjbdbTV+K2m+o4RdPjl5vBPhmPh+L/92T/ewij4gSq/yybu
 aDOg==
X-Gm-Message-State: AOAM530P3f2tp3XhJdwTepKASvhSNrqwnFO4a0bRxhBMtx+68Fe1byQH
 ChcESE6z4c7SDtzAfV3c6wSpuOAmnCsRQA==
X-Google-Smtp-Source: ABdhPJw5KRZp5e3M+/Vbsnfg4LBNj5t95m0y9WJSWUgou7U0RQrf1E3W7NMfCPHJBjG34wBWVtxnHA==
X-Received: by 2002:a05:6402:2693:: with SMTP id
 w19mr3190078edd.257.1636408833446; 
 Mon, 08 Nov 2021 14:00:33 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q8sm4139316edd.26.2021.11.08.14.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 14:00:32 -0800 (PST)
Message-ID: <8ffa84de-ed47-3310-d4b2-fb1b22b49738@mind.be>
Date: Mon, 8 Nov 2021 23:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211107020519.3057454-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211107020519.3057454-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 023/102]
 board/cubietech/cubieboard2/genimage.cfg: beautify file
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



On 07/11/2021 03:05, Giulio Benetti wrote:
> Beatify this genimage .cfg file to have consistency with all genimage .cfg
> files in Buildroot.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   board/cubietech/cubieboard2/genimage.cfg | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
> index b082ab0da1..5ef10ef135 100644
> --- a/board/cubietech/cubieboard2/genimage.cfg
> +++ b/board/cubietech/cubieboard2/genimage.cfg
> @@ -9,6 +9,7 @@ image boot.vfat {
>   			"boot.scr"
>   		}
>   	}
> +
>   	size = 10M
>   }
>   
> @@ -19,8 +20,8 @@ image sdcard.img {
>   	partition u-boot {
>   		in-partition-table = "no"
>   		image = "u-boot-sunxi-with-spl.bin"
> -		offset = 8192
> -		size = 1040384 # 1MB - 8192
> +		offset = 8K
> +		size = 1016 # 1MB - 8KB

  1016K, not 1016 bytes...

  Regards,
  Arnout

>   	}
>   
>   	partition boot {
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
