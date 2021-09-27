Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F41C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:37:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93C3660FC2
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93C3660FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47B8E6080C;
	Mon, 27 Sep 2021 14:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZ3BOLWSjvoi; Mon, 27 Sep 2021 14:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93280607EB;
	Mon, 27 Sep 2021 14:37:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 267411BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15E7B404B1
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFKiCi__sUL4 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:37:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A9BF404B6
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:37:16 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id ba1so12224814edb.4
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/fCRYrXUZuVSOa2gSsqsaFzoPHMlltsjzdMiH9kNBPg=;
 b=H2npnJBjh07AH521nNdUBgx+Hg2Ygu3jsXv5bXnWwuHq6u6gU+GgSgBimwR1+2MdkL
 /jjRFiXYy6o6h67wZ2wBMg/x/lh+CDiSdLmKuUoOZv4cmDQGhdJuBaFgu9SD9Yb0l6aA
 laL5kxdRrHAtScF8ojKVP2dWEu7jvHCtsedloCy4avOMhfmZI55TSCgj75PuL1Jb5wPy
 pJJ3MYAvDPXbfMwTq4Bbf0M/VZtkqfA2AoRPYjTDAkGQhIziMRj9mBMJ/vxjh7//hYHy
 IUBrCq172bFF3RKKdwXaJX7oHDagdeSoPDrJUwuuwNRsISdjLn4HQNz/q3lZfDIWkcbw
 t4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/fCRYrXUZuVSOa2gSsqsaFzoPHMlltsjzdMiH9kNBPg=;
 b=T4/jxIT4+qQkcdkhf1h30DI7gC8hqXBovbcxDfqmen2qysZ5awUivEVXYnK5wpv7Ew
 8J8iYC2pZpgsjeTzyzA7jkJTRM4y3DiRFbBX8d5V/2dR/pdGmA/lZ14wEK42hPtfRObH
 qLo8n8lfNB/EhQ4DpUC3dBC3kuL7/u8EGuo3iBoLj145NvbYKoRe61nVcgdhU0oqJ9SN
 jUpn//jUnehkcLnJHzPKL7Oi+h6cto65rJgp9QIwRcFIOlG0zUkI+Wd9Ww6yOCrMz1z7
 N91CT4Jyaqz+Ji7FEtBZKsdjRytqkAsyjY0KLMZCrA6/XncAhMb8d+zV+GBANDIRtjGM
 glxA==
X-Gm-Message-State: AOAM533IXbwN0M1xmTdS/xo9+pxGJ8DaPJPUqy8aT8PMGGK9i9iquCIo
 WLS+jK6wAIwkZmSKDmPBX5SL4atCjrc0k+VC
X-Google-Smtp-Source: ABdhPJykvlS/gtQGu3ZoqT7ci/T5+7FTdTdTFgfLWctJc1BbTUkaxndpbFHkEnsx79NYYzDjIVTe4Q==
X-Received: by 2002:a17:906:ecf4:: with SMTP id
 qt20mr361177ejb.375.1632753434503; 
 Mon, 27 Sep 2021 07:37:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q9sm8714934ejf.70.2021.09.27.07.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:37:14 -0700 (PDT)
Message-ID: <1a373d8b-0add-d9dd-f365-f1eb3999313f@mind.be>
Date: Mon, 27 Sep 2021 16:37:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Martin Elshuber <martin.elshuber@theobroma-systems.com>,
 buildroot@buildroot.org
References: <20210927090909.1248365-1-martin.elshuber@theobroma-systems.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927090909.1248365-1-martin.elshuber@theobroma-systems.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: add option to
 enable systime-fix
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/09/2021 11:09, Martin Elshuber wrote:
> When building embedded systems, which buildroot targets, the system
> often does not know the current time. However, when verifying X509
> certificates this is often required.
> 
> The system-fix plugin is a handy tool to configure the behavior when
> the current time is unknown.
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/strongswan/Config.in     | 3 +++
>   package/strongswan/strongswan.mk | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 368cd1ecc0..5b601598f5 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -73,6 +73,9 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_20
>   config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
>   	bool "Enable dynamic TNCCS protocol discovery module"
>   
> +config BR2_PACKAGE_STRONGSWAN_SYSTIME_FIX
> +	bool "Enable systime-fix plugin"
> +
>   config BR2_PACKAGE_STRONGSWAN_EAP
>   	bool "Enable EAP protocols"
>   	select BR2_PACKAGE_GMP
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 322abfbd7b..6c1f411ab5 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -37,6 +37,7 @@ STRONGSWAN_CONF_OPTS += \
>   	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
>   	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
>   	--enable-wolfssl=$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),yes,no) \
> +	--enable-systime-fix=$(if $(BR2_PACKAGE_STRONGSWAN_SYSTIME_FIX),yes,no) \
>   	--with-ipseclibdir=/usr/lib \
>   	--with-plugindir=/usr/lib/ipsec/plugins \
>   	--with-imcvdir=/usr/lib/ipsec/imcvs \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
