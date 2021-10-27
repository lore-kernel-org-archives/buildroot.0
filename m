Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380C0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:30:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A898360F39
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A898360F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74F02400F5;
	Wed, 27 Oct 2021 20:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjcczYxTeHIr; Wed, 27 Oct 2021 20:30:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F192400FE;
	Wed, 27 Oct 2021 20:30:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D74271BF3EB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C696040283
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAuxmBahsiRZ for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:30:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6628340272
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:30:11 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id m17so14472710edc.12
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=l4EkBc1WngIY1EsxVgzdGnv5250PGPAwuI+YfsxI+pM=;
 b=UZxF8LP+vrTGYNwKBkBDHBILapYBvT0ZGqYsFyHrR/zOONxrDQfOYC7pzGVBXZB9hn
 PMGUbEVO2SKEzTqysySNlIgu04UzwCHaK01SzrxG+sDGl/Jjrsq8LzIDg7IY+DuOCUrb
 CWVF60xvGtWNeCdvLTmyERFlCcik2SJ9hmCMlntjQPL4VmD4sBQmI4PepgJF1J2XdESe
 yV4/olJDWFDKJ69Smfud/jHgVwNw9uVSNib8GD5WV9mLOK0FlgXJ4cvYKkA5G0ZvMeT4
 cG4XAAePHoGXj2fWMOn6MnGG7zAAyj0awQZ0RK7xJdwM52PU0uijyUXRFyYTc5PwRCBw
 zfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=l4EkBc1WngIY1EsxVgzdGnv5250PGPAwuI+YfsxI+pM=;
 b=fuLw5ZJHxstPsbP/qSvsCNkAqG+Pi+/9FbzwcHDkCvjc29RNXDk/ksqlCsSURqrbTw
 dBjcEwPFxFSIDNZthyg4aEQ5e+5pUPkXc4TM0rPkZJSFcrADBAFL/DwHCIxQoKgCwJbj
 EB8PEfpLcW5JjnstwQvI284/2SpKoxlJdC7/WBFS7j3M3z/Unc7w31UdWcj8VBVcSVLZ
 FI1Hqo7+5tjkGnihdrjaSAGE2ZWo5y0A7ruVP3gA7hZaUkMPiZQGf6NW+JjAgwV7PgAg
 gL2VOQmzO/xrYJf5KOhyR0aoHXjFwGfs1ww/DgKajvQhAlu90xwvHJpTtEG6uvHTWlaR
 d8Jw==
X-Gm-Message-State: AOAM533+6DMvSfuV+adtwmH2StC3Nmndp0JJZDgqq0x5Cez/Mk5PnYTX
 s/eD9Z/b+xD1M8gpfuTKv2bTOP9g7n/iHQ==
X-Google-Smtp-Source: ABdhPJy2iyteW+O6TMFpedria1A5IXyY43N149cXch3lH+N+acTwHnDQiEpzlOiNuB60Q13vypzyqg==
X-Received: by 2002:a05:6402:1d52:: with SMTP id
 dz18mr100022edb.398.1635366609275; 
 Wed, 27 Oct 2021 13:30:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n2sm287353ejl.92.2021.10.27.13.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 13:30:08 -0700 (PDT)
Message-ID: <2ae08246-dc3a-eae6-3b63-183679b81a68@mind.be>
Date: Wed, 27 Oct 2021 22:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
References: <20211025073458.8576-1-etienne.carriere@linaro.org>
 <20211025073458.8576-6-etienne.carriere@linaro.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025073458.8576-6-etienne.carriere@linaro.org>
Subject: Re: [Buildroot] [PATCH 6/7] package/optee-client: remove dependency
 on BR2_STATIC_LIBS
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



On 25/10/2021 09:34, Etienne Carriere wrote:
> Restore support for BR2_STATIC_LIBS in optee-client, removed by
> [1] to overcome an issue introduced in OP-TEE 3.13.0 that mandates
> support for shared libraries.
> 
> As OP-TEE expects to be functional on OSes without dynamic shared
> library support, change [2] was merged in OP-TEE tag 3.15.0 to fix the
> initial issue introducing new configuration switch CFG_TEE_SUPP_PLUGIN.
> When disabled, optee-client plugin support is not embedded and
> optee-client can built with static libraries support only.
> 
> Link: [1] commit 321a850bc734 ("package/optee-client: add dependency on !BR2_STATIC_LIBS")
> Link: [2] https://github.com/OP-TEE/optee_client/commit/f59114370f267f0b3341870b6cf1e1c88d184b3f
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>   package/optee-client/Config.in       | 12 +++++++++---
>   package/optee-client/optee-client.mk |  6 ++++++
>   2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
> index 2765f49308..2547fc0ce3 100644
> --- a/package/optee-client/Config.in
> +++ b/package/optee-client/Config.in
> @@ -1,7 +1,6 @@
>   config BR2_PACKAGE_OPTEE_CLIENT
>   	bool "optee-client"
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on !BR2_STATIC_LIBS # dlfcn.h
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # MMC_IOC_MULTI_CMD
>   	help
>   	  Enable the OP-TEE client package that brings non-secure
> @@ -25,8 +24,15 @@ config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
>   	  normal world OS providing the actual storage via
>   	  tee-supplicant.
>   
> +config BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS
> +	bool "Enable TEE supplicant plugins"
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	default y

  default comes before depends. check-package tells you this.

  Series applied ot master with that fixed, thanks.

  Regards,
  Arnout

> +	help
> +	  Enable TEE supplicant plugin support.
> +
>   endif
>   
> -comment "optee-client needs a toolchain w/ threads, dynamic library, headers >= 4.3"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +comment "optee-client needs a toolchain w/ threads, headers >= 4.3"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
> diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
> index 20147c89a8..9a73a8a761 100644
> --- a/package/optee-client/optee-client.mk
> +++ b/package/optee-client/optee-client.mk
> @@ -14,6 +14,12 @@ OPTEE_CLIENT_CONF_OPTS = \
>   	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
>   	-DCFG_WERROR=OFF
>   
> +ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS),y)
> +OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=ON
> +else
> +OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
> +endif
> +
>   define OPTEE_CLIENT_INSTALL_INIT_SYSV
>   	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
>   		$(TARGET_DIR)/etc/init.d/S30optee
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
