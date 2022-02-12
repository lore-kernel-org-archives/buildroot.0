Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C24BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C7281779;
	Sat, 12 Feb 2022 22:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWtpsmZy-8gj; Sat, 12 Feb 2022 22:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1675681407;
	Sat, 12 Feb 2022 22:19:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9531BF3AF
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AC824030D
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8WMSNotbp1zd for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:18:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C0F44030C
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:18:58 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id h22so11741307ejl.12
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PKyMzwzwCyz0O7dXTJyvFWVdsJ1TtoDUbhkVSGCuYOY=;
 b=EfGNTs5v5rq8r3BdyBWRf7dKFIWM1maEDvHJCFi2Z+sulnHH9kJMpjQXaZSwyN1eWB
 YQ0pQaEk3uhnsuQJ4e/ihIlr95UZNAiW4nrCl4g4ekjOJTfp5QZAVhEjgpLXy4QJ/dKz
 PBONnHEuz9QZ5zdTGj6GuhPASeEoh5ulMDWH1jEIGX+3XcU19V63SRgsrP0CSZ8oWjIk
 wLHvVE4FtyxkQX+I5dqtBLBp0bazVL73CDbwljKj/yuTZ+DcwGxHedml0frl6u7KLEvy
 MQ0IZsvj4LdtgJ794RSTGpFOWi/ZrElkrhbqMosm+mi2kSOdgJa5M4gJEIXciyprzty0
 pCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PKyMzwzwCyz0O7dXTJyvFWVdsJ1TtoDUbhkVSGCuYOY=;
 b=B2WEcbb8FwZA8ldOP5vmMksEc2K2hEwIk7ea+dp4jXy0jWEKeypZX7GW7KCGyvgX3+
 X1VFpifioeiTwc4XmtpR7AlvtqBtGBNdV0+jrNuDc6ORSyfiEjUN9ZGkD2YRSLALCz42
 I36/8uWWlyevIZwAd3Zw3rSO5+AXsoYo43hEABHbG8nRS3fJ/Z8MKuzWGH0QgZz5n0ss
 8bszF+/7yaUrVdK0k1zfslAc+ufLRDjav5g+N8f7dA24vntOGzHngjwB9cLKJ8DMBVXx
 4BpLS3xd1JJ+X9smKXZdO9bGijC2qHG+NaslI/4OaM785hgdQA6lWT+/dSwOEEJHoqkX
 PcPA==
X-Gm-Message-State: AOAM532CccTWpYD9MK2Tm/jBLgpjP7STugyYbfrfc897rLIu1sq203t1
 Ax6yypjRLiGtuFePJBCCNbAiKA==
X-Google-Smtp-Source: ABdhPJwMFrRv1ecJ+G4xwaL1ELwOdvVXC2dzf88gywzRHlLoSPAI4A8Q1UfWaFfWwLpYN0yuygt6Fg==
X-Received: by 2002:a17:906:2ed0:: with SMTP id
 s16mr5980822eji.327.1644704336331; 
 Sat, 12 Feb 2022 14:18:56 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r22sm12619564edt.51.2022.02.12.14.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 14:18:55 -0800 (PST)
Message-ID: <b0311f0e-9576-d082-0208-0e8f7e088e4d@mind.be>
Date: Sat, 12 Feb 2022 23:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
References: <20220209225957.1257630-1-paguilar@paguilar.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220209225957.1257630-1-paguilar@paguilar.org>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/guile: Fix build failure due
 to missing libiconv
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
Cc: giulio.benetti@benettiengineering.com, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/02/2022 23:59, Pedro Aguilar wrote:
> When building package guile with BR2_ENABLE_LOCALE=n
> we get the following error:
> 
> ```
> In file included from filesys.c:95:
> ports-internal.h:26:10: fatal error: iconv.h: No such file or directory
>     26 | #include <iconv.h>
>        |          ^~~~~~~~~
> compilation terminated.
> ```
> 
> So let's fix it by selecting BR2_PACKAGE_LIBICONV and
> adding libiconv package as dependency.
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

  Applied to master, thanks.

  Regards,
  Arnout

> 
> ---
> Changes v2 -> v3:
>    - Improve commit message (thanks to Giulio comments)
> Changes v1 -> v2:
>    - Use BR2_ENABLE_LOCALE if selected, otherwise use libiconv
>      as before (pointed out by Thomas and Giulio)
> ---
>   package/guile/Config.in | 1 +
>   package/guile/guile.mk  | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/package/guile/Config.in b/package/guile/Config.in
> index b1182a4cee..f70e674018 100644
> --- a/package/guile/Config.in
> +++ b/package/guile/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_GUILE
>   	select BR2_PACKAGE_LIBFFI
>   	select BR2_PACKAGE_GMP
>   	select BR2_PACKAGE_BDWGC
> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>   	help
>   	  Guile is an interpreter and compiler for the Scheme
>   	  programming language, a clean and elegant dialect of Lisp.
> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> index 0f245fca76..03420407f8 100644
> --- a/package/guile/guile.mk
> +++ b/package/guile/guile.mk
> @@ -18,6 +18,10 @@ GUILE_CPE_ID_VENDOR = gnu
>   GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
>   HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
>   
> +ifeq ($(BR2_ENABLE_LOCALE),)
> +GUILE_DEPENDENCIES += libiconv
> +endif
> +
>   # The HAVE_GC* CFLAGS specify that we will use internal callbacks
>   # instead of the ones provided by
>   # bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies that we won't
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
