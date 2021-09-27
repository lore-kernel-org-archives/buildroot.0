Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13D8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 17:00:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC5860F58
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 17:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FC5860F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F4694011D;
	Mon, 27 Sep 2021 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wdygv1-daGKR; Mon, 27 Sep 2021 17:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A0D54017C;
	Mon, 27 Sep 2021 17:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B653F1BF955
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 17:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4FD64017C
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 17:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1kW55Vr2wmKx for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 17:00:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DDB44011D
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 17:00:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y35so20828141ede.3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r0s5AXvfF5X0oqb1oh+Z623kTCvV51kJSet/ElSHySo=;
 b=MWcS0JiPC0f1w6ORdINOXG0QZkrSyKEiEBzuISDweiJ7IMi13lXSwRXbg91l5N5nnh
 B3yuIetruwdm+fDJ7qVe73QrP8FnKoYJVEYrTkPCCGzOugZSlIP5OBpsFIINh5vM+tOC
 xJMVj594vp32mysjrM5inJjZV5FPf6Zlw6ZCiBX45zU2FzudqEnEp5IZ6Jy0DJUJMlb2
 +CQAgCdbUFvbIb3IJ2QgnF02XDmj1ERhC5qSDDxHMN2l3qW+SZtP/d1EyzWMIq3pqOTb
 ZmS52ApKwszRQEjWEp+ascN8XbrYqlBeihBS+NVQSpNnLRKm+hLpiBV6D9+T2B6Kaen9
 SFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r0s5AXvfF5X0oqb1oh+Z623kTCvV51kJSet/ElSHySo=;
 b=Wq/PKEoBPSS9KZsBVrMNnXKQHkfom6p44YhhSk64H+6gIIIsH/UaeXqJZL4wfE1W+M
 cyN0f0zEXOH+V45tvE3kmMl134C7blqrbI6xUIQfMB4t8tq81GlvnvAu8EqV3L3xkeKh
 f76gf7oEeRfDqT3mRX6whoarAvTS+M/3mreZ1QeIMGPpPEWmlYgitbC+YAFlS9HoWqYZ
 h6+W5bCukG6B8bXssVM28v8uutLUTPrEuk4Ldam81kVWQfX2yE/MG/XRq/qLvDda1ToH
 wpDPpCzz1cvr7avm6oSWfMC5AHWdwvUKVw009QIjicAA/S+Pzue8a7iJACZCtZ5J3ZKh
 fCmQ==
X-Gm-Message-State: AOAM5330ibOjthdA29//UENjzR7PkOfu5xJGZJE5symZ4ORlMw6xBmep
 UfKf2Dpz8uGUPVDaVjoYWRxoEg==
X-Google-Smtp-Source: ABdhPJyZAXvaQ79YTP+GRCWmJpHTrkzjx8hs4UkAijst18Dw7r/V0cAR2JqLFGg9dHJpPMWSWwVyzw==
X-Received: by 2002:a17:906:b05a:: with SMTP id
 bj26mr1201253ejb.226.1632762014089; 
 Mon, 27 Sep 2021 10:00:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id fx4sm8956627ejb.113.2021.09.27.10.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 10:00:13 -0700 (PDT)
Message-ID: <a806ecfe-917d-573f-f78c-a4b08562edc2@mind.be>
Date: Mon, 27 Sep 2021 19:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Martin Elshuber <martin.elshuber@theobroma-systems.com>,
 buildroot@buildroot.org
References: <20210913142652.942533-2-martin.elshuber@theobroma-systems.com>
 <20210920152831.2489077-2-martin.elshuber@theobroma-systems.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920152831.2489077-2-martin.elshuber@theobroma-systems.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/strongswan: add md4 hash
 algorithm option
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/09/2021 17:28, Martin Elshuber wrote:
> Add the option to enable the md4 hash algorithm and default it to 'no'
> since this is a new option.
> 
> Since md4 is required by EAP-MSCHAPv2 it is selected by
> BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2. See
> https://wiki.strongswan.org/projects/strongswan/wiki/Autoconf for
> further details.
> 
> ---
> Changes v1 -> v2:
> - change git title
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> ---
>   package/strongswan/Config.in     | 4 ++++
>   package/strongswan/strongswan.mk | 1 +
>   2 files changed, 5 insertions(+)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 8eae568b6a..21f84ebb71 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -73,6 +73,9 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_20
>   config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
>   	bool "Enable dynamic TNCCS protocol discovery module"
>   
> +config BR2_PACKAGE_STRONGSWAN_MD4
> +	bool "Enable MD4 hash algorithm"
> +
>   config BR2_PACKAGE_STRONGSWAN_EAP
>   	bool "Enable EAP protocols"
>   
> @@ -127,6 +130,7 @@ config BR2_PACKAGE_STRONGSWAN_EAP_GTC
>   config BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2
>   	bool "Enable EAP-MSCHAPv2"
>   	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +	select BR2_PACKAGE_STRONGSWAN_MD4

  This md4 option makes me realize: do we really want to add options for broken 
security in a security package? OpenSSL has just deprecated MD4 in 3.0.0.

  Regards,
  Arnout

>   
>   config BR2_PACKAGE_STRONGSWAN_EAP_PEAP
>   	bool "Enable EAP-PEAP"
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 5fb4e6821a..c308d3a4f3 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -37,6 +37,7 @@ STRONGSWAN_CONF_OPTS += \
>   	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
>   	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
>   	--enable-wolfssl=$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),yes,no) \
> +	--enable-md4=$(if $(BR2_PACKAGE_STRONGSWAN_MD4),yes,no) \
>   	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
>   	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
>   	--enable-eap-aka=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA),yes,no) \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
