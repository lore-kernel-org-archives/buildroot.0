Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31C1C76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 07:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490EB40998;
	Tue, 11 Apr 2023 07:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 490EB40998
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9TxCHVmlxDz; Tue, 11 Apr 2023 07:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152EC409F1;
	Tue, 11 Apr 2023 07:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152EC409F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB3041C3BB0
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 07:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1FF382098
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 07:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1FF382098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RoAi_xbepUNR for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 07:40:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 934F281E2B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 934F281E2B
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 07:40:43 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j1-20020a05600c1c0100b003f04da00d07so306646wms.1
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 00:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681198841;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DVfEye5H4FEJMMLFgDWBjGXqyBYLzChOMsYpRorlEO0=;
 b=uYhUHvhD+HYguy5bEAG7vbm3tKa0vOCsUQNz/1Ihyffv/nkSchMIjTe+XekQybdQgx
 MAFBv/ZRUGtSNRWLLEx1vG1zKbIm2aXvpYyT1sC7xeOEmonf7dKkJravcyWi4ufk90l+
 ZV1Etplx8ObFLSq5DX+MLts2j8eOlzdwR5afgHfIKJlIK8/C4VnUkNHuqnJqulFl6pqI
 onU1bZEFqWNK/RbTx+anCXSMVKCpbzILoUvOFJJ8OPNiubNMZsiZBOZstcNFFQCE1QFu
 Gh7UlZBuhg1om6hJQ5TSolVzthNr3qNLtIcCfn6Zl8/5tpjmTgYJTg5htcwlITyX0Z9p
 7r3g==
X-Gm-Message-State: AAQBX9dpV50AHri58yG6bvpWNN2u2rUg1uXSiqVpNUj4GOxEOw/DWfaP
 nH3Ti7NBmtHTHYCKiwUOhVJAvQ==
X-Google-Smtp-Source: AKy350ZNB5CB8Q9lWTdZ179N3WGKs0YENv+gJtasIDCKZMhtrpqoh3rEpNs/HbQgKbavUFdtT0ylHA==
X-Received: by 2002:a05:600c:cc6:b0:3f0:3070:f4ea with SMTP id
 fk6-20020a05600c0cc600b003f03070f4eamr7978806wmb.11.1681198841381; 
 Tue, 11 Apr 2023 00:40:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b003f080b2f9f4sm10687715wmo.27.2023.04.11.00.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 00:40:40 -0700 (PDT)
Message-ID: <05d8d295-8b28-c95e-368c-3f43dfcc6056@mind.be>
Date: Tue, 11 Apr 2023 09:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230410083252.138426-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230410083252.138426-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681198841;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DVfEye5H4FEJMMLFgDWBjGXqyBYLzChOMsYpRorlEO0=;
 b=Fe9xq2x3hEvCK2qPM0MUu2mZ2SaNtR5PjQboixnaQvnv1zQskcBL0DHGrzbR6EHq6H
 se/7hEgc/uvpiB3U1XPuhW6Xy6bkD6i0n+GRhXUMhWVK6Wf4aCJS69CqfeUdOnXMUWQs
 m4XrKsKb1eFcPSXUg3d9ZQVl4Bsv5TboRmwm67yT3FTikf7wQZqa3ZCBgbkGfTdChgY9
 NICad1+xQGNsx7G5lLBVzdwE47WrVENdeMQcbVNatR8HjnEz/KU75W1bQ5LQB7Irq62b
 kjZj5dqlmTNzNgkXGbb1i6f7NKg296OADiBJrbWv0eBxDFZlV2zZlSb27u6S7Iimrdiy
 0MPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fe9xq2x3
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pkg-cargo: ensure
 host/target rustflags are properly split
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



On 10/04/2023 10:32, James Hilliard wrote:
> Set HOST_LDFLAGS RUSTFLAGS via the host-config feature, see:
> https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#host-config
> 
> We have to enable this nightly feature first using:
> CARGO_UNSTABLE_HOST_CONFIG="true"
> 
> Separately set target RUSTFLAGS for the target triple specific env
> variable.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master after a complete rewrite of the commit message, thanks.

  Regards,
  Arnout

> ---
> Changes v2 -> v3:
>    - rebase
> Changes v1 -> v2:
>    - add RUSTFLAGS to HOST_PKG_CARGO_ENV
> ---
>   package/pkg-cargo.mk | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index 5600c8e97e..264bf5a1ae 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -34,7 +34,10 @@ PKG_COMMON_CARGO_ENV = \
>   # using nighly features on stable releases, i.e features that are not
>   # yet considered stable.
>   #
> -# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" "enables the nightly
> +# CARGO_UNSTABLE_HOST_CONFIG="true" enables the host specific
> +# configuration feature
> +#
> +# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" enables the nightly
>   # configuration option target-applies-to-host value to be set
>   #
>   # CARGO_TARGET_APPLIES_TO_HOST="false" is actually setting the value
> @@ -43,9 +46,11 @@ PKG_COMMON_CARGO_ENV = \
>   PKG_CARGO_ENV = \
>   	$(PKG_COMMON_CARGO_ENV) \
>   	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> +	CARGO_UNSTABLE_HOST_CONFIG="true" \
>   	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
>   	CARGO_TARGET_APPLIES_TO_HOST="false" \
>   	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
> +	CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
>   	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
>   
>   #
> @@ -53,7 +58,8 @@ PKG_CARGO_ENV = \
>   # and should be removed when fixed upstream
>   #
>   ifeq ($(NORMALIZED_ARCH),arm)
> -	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
> +	PKG_CARGO_ENV += \
> +		CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
>   endif
>   
>   HOST_PKG_CARGO_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
