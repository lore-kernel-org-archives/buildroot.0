Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060ECC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:39:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C11A461BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C11A461BC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B22740945;
	Wed, 17 Nov 2021 21:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6R0LfdMy2ca; Wed, 17 Nov 2021 21:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 729D94093F;
	Wed, 17 Nov 2021 21:39:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B28561BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E150404BD
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HI0FEH00oMMV for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:38:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92ECE40452
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:38:33 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w1so17325682edc.6
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 13:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=m1BF2Pva67dazdcR87T/ykw9TxRW5zsY8LebE325i8I=;
 b=FDIbZYXioA8uvZJ4kXlaUvIfIoTo6GlkMujmjyHE1qT9GdfnPl6VAeacBKw10LrEf0
 BCJU4bkO3UL/GnZzuoSgE+v5D5OcCBirf6QDSncaHBAqjHpWoEUZX6/vOCkDjFDkov1u
 FGo0xOedjuFYwDjSN1oEhP2lwsTnezkNBCkzYZbliSLxapkaJjueW7RPQGfo+dNgDIhP
 CzJbRTFlQk/Rfgxl9BhvDrwJWn/0AKFu0KRLbtGglKfWlMgL59pLeG6zgCilQVsF4Nz/
 sQfqA3yOPFdjnP5vtCa5KA48+9otUbVy5vanEO1COV/dxQHDf2ycOLk9NNQEpGcIzE0W
 ZpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m1BF2Pva67dazdcR87T/ykw9TxRW5zsY8LebE325i8I=;
 b=ke/A7SrlrRI/I+nnRTJJmtmk/ldMRe/TKEqUMSt3BIJFDlNwk4kZF01ApA6w2Qy9Ef
 O8E09NQp1eApDWrD0I1Iuoo7s3JPE2QHppmWDLrEhy3g2DTOMDT5cAu2Te0ksYap16Kp
 60o3nVKgFDIGMEPK+p0/yt2D7SNy83gptMQqG3Kyh1GH4nqn7GI3sB4WhbFp8PLuN9LU
 WIsXGxZLudgZzDzHZ3EoAXy8Mhusn5R0mWgsz2JvGfkt3cpFbWfwqV63yk3IHeaOUZcV
 zuI1swuwHnmwr6ujFV8snmGikqdGtuIT94BRwcwdkEO+ugHOpfYxX/kjfFNlaRweEc/m
 HhSA==
X-Gm-Message-State: AOAM533nCFhqZkU0WgZ2DOPGslnlE23ZvkEomubycEGFRW9UrNwGb/5V
 EQAwJAb0qf7IpgDHcHKErIQYWmKtZqENsw==
X-Google-Smtp-Source: ABdhPJyBys4Ob0+Qrk+K8pa6SFtmHfiM9QB5n0lzsVCuRvbJhLoxiMSSpFHwlQ0Kg8Gcf/vFg+/HNQ==
X-Received: by 2002:a17:906:7955:: with SMTP id
 l21mr27597628ejo.6.1637185111872; 
 Wed, 17 Nov 2021 13:38:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gn16sm506863ejc.67.2021.11.17.13.38.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 13:38:31 -0800 (PST)
Message-ID: <936d4427-4733-8d06-7a94-c4fcf3ce31a1@mind.be>
Date: Wed, 17 Nov 2021 22:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211028153107.334373-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211028153107.334373-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: use libgbm virtual package
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



On 28/10/2021 17:31, Bernd Kuhls wrote:
> Kodi needs gbm_bo_get_fd:
> https://github.com/xbmc/xbmc/blob/Matrix/xbmc/utils/GBMBufferObject.cpp#L54
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/kodi/Config.in | 3 ++-
>   package/kodi/kodi.mk   | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 67cb33a6b5..21ef8dfd42 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -22,7 +22,8 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
>   	bool
>   	default y
>   	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
> -	depends on BR2_PACKAGE_MESA3D_GBM
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
>   	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
>   
>   config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 3c314533f4..646c6e0ab4 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -92,7 +92,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM),y)
>   KODI_CORE_PLATFORM_NAME += gbm
> -KODI_DEPENDENCIES += libinput libxkbcommon mesa3d
> +KODI_DEPENDENCIES += libgbm libinput libxkbcommon
>   endif
>   
>   ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
