Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A58C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:42:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3919A60FDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3919A60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 129CF40613;
	Thu, 14 Oct 2021 21:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yABH1Yd7zZ39; Thu, 14 Oct 2021 21:42:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72DED40581;
	Thu, 14 Oct 2021 21:42:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF2CC1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F18F81AEF
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ne_u-MO_eTD1 for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:42:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCE6D80EA0
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:42:12 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id ec8so29822596edb.6
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2bm6EavIeOI3u4c+CvjjNKp6seTykuY7MifnTAOcRWU=;
 b=ZzlBfwVWfDHVHw+h628EY0BUo8GtuZDu9JltGGGpjgUji5L1mRhz1QRcg6JDZChfF9
 Q0/lswVcnNUejLwoYrpzj38OQfbj5Qa69ico0IA8qtZnfpbh6fuCHfG5EEE0KSZZIdsV
 nqmfjzYfE+3EwmlpTWMxVScv8YGTEQiWUBdUe6EDpXLjaxHcM3jHh076kT4FSBZ3vh6Y
 8RBHwS4dvzOpoMaKEEfUOrtflNERVXKl5x6O2FZWiZO9Pxo686bYzyME8FhJPpN8F3zZ
 J4zaS0R4gYsHCYh5kSwP3H/kCqzMz3W8gXid5XhsZxJoGXm/nU3l2YaWxhoPKJJTPN6z
 t6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2bm6EavIeOI3u4c+CvjjNKp6seTykuY7MifnTAOcRWU=;
 b=zH+a7dNsucwwIkt4W2BRZ+ccQp/n+JwBRzwFSxIPJmpMYbrYxMg6WwtCrmaJkWx06O
 hhglmODGyJtAGso5UNh7DJ5jegr3YxfY1mKv2BbhEEGImfRiwzEEuD5eO1HbSc3JWqgP
 g6GrsrU1c1zVD/WK48DEaJm14dMPL0P6AjBioNJ1W895syOgKyImUc46QwoNS9qUlMIA
 xSfxBqopkCYcoKbHy5TxFkGrsG3/zEMJARDpQIvjLjvSdX0+8sGTYriZ5grBdumLLZCr
 +K94vdYHObER0kO6WNHgg/PRiPEli7CzLbNEac2BYlVD9Gl4IQO62K5p6HrindR/f8Po
 vGrQ==
X-Gm-Message-State: AOAM533l2OOowbM7Wuk+eqQv/H7l753szdkenNvOoGh/p1e3cP0DQNcG
 ocoLJcDcskArmpmVMn+2SAmmzvdcVCh1mQ==
X-Google-Smtp-Source: ABdhPJwW+EWWNUC5T+NyuCh4ehXoONEMqvsv8ECeej8FU4GgEeEWG9El+wRZZbdZmLB8rzMDPIqxiA==
X-Received: by 2002:a17:906:f85b:: with SMTP id
 ks27mr2044690ejb.430.1634247731046; 
 Thu, 14 Oct 2021 14:42:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v8sm3312185edj.7.2021.10.14.14.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:42:10 -0700 (PDT)
Message-ID: <cf4b3ce9-644f-7c5d-9815-b6f1f696f82c@mind.be>
Date: Thu, 14 Oct 2021 23:42:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211013161152.74649-1-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211013161152.74649-1-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: depend on
 host-python3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/10/2021 18:11, Adam Duskett wrote:
> wpewebkit builds without issue using host-python3.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wpewebkit/wpewebkit.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 5d5b5f744d..0242f7a288 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -14,7 +14,7 @@ WPEWEBKIT_LICENSE_FILES = \
>   	Source/WebCore/LICENSE-LGPL-2.1
>   WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
>   WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
> -WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
> +WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby \
>   	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
>   	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
