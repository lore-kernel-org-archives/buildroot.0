Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D70CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39A4940354;
	Wed, 18 May 2022 19:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AdNuf_N9rz0A; Wed, 18 May 2022 19:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CD20401B7;
	Wed, 18 May 2022 19:18:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DF8F1BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D6F784039
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dkx1WZ3vGqir for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:18:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80E9482BF4
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:18:01 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id j28so4206020eda.13
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=UoUuKLv27Qo4hKUTjrfM+5tWlnEwQ34WlNvCq3k4oQw=;
 b=GhAWdVUPHaWgB2VNeWH7pDU7iJbnHt/zUFNPZuBLJE1zMFrIbabWf33TOoe/Qw1UPs
 xdCaX1iut4c4z9RpMeP3JDxkrAKKwIXvFM0clWfRKT5kNV2cc/BDM8RuUnWWBEH75+n8
 U1fqPxRXqrcLwrRyLUw6rqzZdVGzau8ei4J90lpl01qzvB1HesRjuForqbutLh1ZEquI
 fUNy6kO3aB2m4RWaSEkV2BC2OijKjtVQyzhGpwvBL4oENC2L/ZLvECCdgg2TLyuWB+N0
 r6g7QspOkiptMNWdl4ljMEK5K97bgcGV0/fWM//d2yhd11fBgKxiqbz5jc4np1T2z/YM
 XH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UoUuKLv27Qo4hKUTjrfM+5tWlnEwQ34WlNvCq3k4oQw=;
 b=lXLq3wt2mxzupWo/bEOBklnmxDE/YFSQEo2kp8e5NNL/DGhfiWo28QhGM12/wr5y7i
 TcmVW21zGMP07XVLlx46G+Stc3n1AQaAoyenCUBM60jZ02jCz7RuMg6Hea+wgruPnWW6
 72gh3sex4h53QwVcMMQoVuiA7wbScHvRSUccHzF9rSXglhZ0NPZz+Zuf4VloPMN0AnXJ
 odaMUmZbv7KZbYk4QydiWytOgeZqYVTVod4W1ZPXAmjwmIwVcof8jwxzQ7GpQrMQ/cmu
 jD4z/DvnPsq6aY+UTU9adiOClpnhjVEujW3RLlK19ctLQfjNl9+4vEseXBQhdZbv3Bh1
 ai4A==
X-Gm-Message-State: AOAM5306zBx/tU9vCJNULImouxzyzJSewYSv/xq2jXpJC29RuFzULuwJ
 edCDIfll/N11iAHwDVfIj2lAXA==
X-Google-Smtp-Source: ABdhPJyc0+VzEF0U86fjmCVBnwZkChzsfOVKSo43GIk2Kw2vPw7m5DXskCWWrMbvbwpubzTIdHqYDw==
X-Received: by 2002:a05:6402:5253:b0:427:ed62:bb8b with SMTP id
 t19-20020a056402525300b00427ed62bb8bmr1392915edd.65.1652901479714; 
 Wed, 18 May 2022 12:17:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a17090664d300b006fe9209a9edsm417517ejn.128.2022.05.18.12.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:17:59 -0700 (PDT)
Message-ID: <5a0bb1b8-b671-e85b-1942-3b17f31f0547@mind.be>
Date: Wed, 18 May 2022 21:17:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220514222811.3925140-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220514222811.3925140-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/midori: add missing
 !BR2_PACKAGE_GNUPG dependency
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



On 15/05/2022 00:28, James Hilliard wrote:
> The !BR2_PACKAGE_GNUPG needs to be propagated from BR2_PACKAGE_GCR.
> 
> Fixes:
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_GCR
>    Depends on [n]: BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && !BR2_PACKAGE_GNUPG [=y]
>    Selected by [y]:
>    - BR2_PACKAGE_MIDORI [=y] && BR2_PACKAGE_MIDORI_ARCH_SUPPORTS [=y] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_HOST_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_USES_GLIBC [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_LIBGTK3 [=y] && (BR2_PACKAGE_LIBGTK3_X11 [=y] || BR2_PACKAGE_LIBGTK3_WAYLAND [=n])
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/midori/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/midori/Config.in b/package/midori/Config.in
> index 715295e5a6..54e19d4d34 100644
> --- a/package/midori/Config.in
> +++ b/package/midori/Config.in
> @@ -25,6 +25,7 @@ config BR2_PACKAGE_MIDORI
>   	bool "midori"
>   	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
>   	depends on !BR2_STATIC_LIBS # webkitgtk
> +	depends on !BR2_PACKAGE_GNUPG # gcr

  You forget to add a comment for this.

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

>   	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
>   	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
