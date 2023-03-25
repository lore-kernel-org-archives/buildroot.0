Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A73C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 20:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99CB880BB3;
	Sat, 25 Mar 2023 20:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99CB880BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5S99UbSZrK8b; Sat, 25 Mar 2023 20:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2C378202B;
	Sat, 25 Mar 2023 20:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C378202B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 058961BF32D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2F4B40447
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F4B40447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axf1qCZVUJwp for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 20:27:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77D1D40141
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77D1D40141
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 20:27:09 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id h8so20924292ede.8
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 13:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679776027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UZwVINN0y+J0R5Tow02TWTxuDm9cuTR8jLzjZ5Agv8M=;
 b=tNs3PUGygPRuUxeaxVoG5Sm5YjxKtcURMMTQXnlN/poU8ULoB0d/eaTfhNf18rnG3M
 C5eomUtDoiLYA/jckrvqo5Ma6kwVqS9MfIsCD5rV8M/whwxHhDC9dUcMO5l3IM+1TeXf
 WyungvYIFch/Dx2RePc7qrElq3TqteuB8468Q+Z08xC1R5pNnUqZ+j8gmJfNu1tcrmrA
 xx+opK+ZyeLjJTOQBXS0+oOiIL+h+s0598SrFQ38VRCZaVQ+OZjw3nTdP8LpHu2K4Auv
 Wy1kHJhMNRHYXWZydW3K1uzuuZ/8iYcqaY0+kuCsqOMugfWIfTFpjK3HZZg8KVbVfEai
 oCkQ==
X-Gm-Message-State: AAQBX9fGpsZ9Ho0dWm6/9y1epqr8AWnzEPGSgjJvgOy6/yrxgF8A5zzM
 WmmDaq5BZX8zmKfLVIhFLaxxEg==
X-Google-Smtp-Source: AKy350atUnVYtiYCt5qsHYvlnGbYqI74k/61RxS/IXHoD6TZPdmNXJlNju0uW2luWIfBe1YmVsVDbw==
X-Received: by 2002:a17:907:2099:b0:8b0:ad0b:7ab8 with SMTP id
 pv25-20020a170907209900b008b0ad0b7ab8mr7531397ejb.14.1679776027457; 
 Sat, 25 Mar 2023 13:27:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18?
 (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a1709061c5000b00939ad35d521sm7427531ejg.77.2023.03.25.13.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 13:27:06 -0700 (PDT)
Message-ID: <77d9b152-8734-89fd-9548-aec406f12cc4@mind.be>
Date: Sat, 25 Mar 2023 21:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221172205.2450111-1-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1679776027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UZwVINN0y+J0R5Tow02TWTxuDm9cuTR8jLzjZ5Agv8M=;
 b=JCAgAqgZtsmFqhu60z1f4dLjZgovl+LTZFdoAQycmvwtKSKV2dYp0KZDdrfwgO/bHX
 zSfLY3rB2kL6mmHpYxtVXW1VtwR6iT4q1EVbwujHDLP85oUZcwMW2Vk6GigJhXPTKayr
 aJSsoUz7sRM+Cz2/4wVOJIxdpNprEa+v2ygOMX2ajH22zOCOpVKtRjVDlu0NAsRALAD7
 JqFDlhsxUjxvLpcCtSZlGkL1GbNOHU1i8XIUVgVRtCp5IOIjCdle1bUbVFUwBwd+9w5q
 Q8muUad+Va5qqqWB9pe2rpDelZLCcrjFqzUg9lAms5K/5SL6Ar/5xsnXLGxMid50LXgR
 25yQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JCAgAqgZ
Subject: Re: [Buildroot] [PATCH 01/15] package/pkg-autotools: drop
 FOO_GETTEXTIZE_OPTS support
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Vincent

On 21/02/2023 18:21, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> No package in the current tree is currently utilizing this option.
> 
> The long term solution is to use autopoint over gettextize in which case
> these options aren't relevant anyway.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

  Series applied to master (well, I'm still busy with it so it may get 
interrupted...). I'll make some comments on individual patches.

  I must say, for a series that touches infrastructure and consist of 15 
patches, I think it's incredible that v1 gets applied directly without need for 
a v2. Kudos!

  Regards,
  Arnout

> ---
>   package/pkg-autotools.mk | 6 +-----
>   package/pkg-generic.mk   | 9 ++++++++-
>   2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 717ff81593..55d95d204e 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -92,7 +92,7 @@ endef
>   #
>   define GETTEXTIZE_HOOK
>   	@$(call MESSAGE,"Gettextizing")
> -	$(Q)cd $($(PKG)_SRCDIR) && $(GETTEXTIZE) $($(PKG)_GETTEXTIZE_OPTS)
> +	$(Q)cd $($(PKG)_SRCDIR) && $(GETTEXTIZE)
>   endef
>   
>   #
> @@ -152,10 +152,6 @@ ifndef $(2)_GETTEXTIZE
>    endif
>   endif
>   
> -ifeq ($(4),host)
> - $(2)_GETTEXTIZE_OPTS ?= $$($(3)_GETTEXTIZE_OPTS)
> -endif
> -
>   ifeq ($(4),host)
>    $(2)_AUTORECONF_OPTS ?= $$($(3)_AUTORECONF_OPTS)
>   endif
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 82187d7db9..a6ef5efb5f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1206,9 +1206,16 @@ $(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_
>   $(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
>   $(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
>   $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
> -$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
>   $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
>   
> +# Check for deprecated variables that have no replacement
> +ifneq ($$($(2)_GETTEXTIZE_OPT),)
> +$$(error "$(2)_GETTEXTIZE_OPT is no longer supported. Please fix your .mk file.")
> +endif
> +ifneq ($$($(2)_GETTEXTIZE_OPTS),)
> +$$(error "$(2)_GETTEXTIZE_OPTS is no longer supported. Please fix your .mk file.")
> +endif
> +
>   PACKAGES += $(1)
>   
>   ifneq ($$($(2)_PERMISSIONS),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
