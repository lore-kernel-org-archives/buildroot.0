Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDB5C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 19:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 642AF812C9;
	Sun,  9 Apr 2023 19:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 642AF812C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osLs6hkbcVnK; Sun,  9 Apr 2023 19:38:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B28812CC;
	Sun,  9 Apr 2023 19:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B28812CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A73081BF291
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80699812C8
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 19:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80699812C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4yJi4qg28WmI for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 19:38:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E91CA80B14
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E91CA80B14
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 19:38:24 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id f26so2107858ejb.1
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 12:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681069103;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zFl5/SFlyLiND8f8ohRDctcDt8ZU2QpRoL6hSfWz8xo=;
 b=pg/v/W7Xc1bSZLCp8ssZ4OVZlKgXSd7ahVmPN36Ct03d6rf24wUFn8t+4DRYSERfiC
 eXGyplyCpl3wg8rdDZ1SreSSHwQv+K6n7oJSl8lYuxOUBE8i/TAbb0gicJ5YFgw7dJU1
 uIkbRuhNx0npw4FKvGLFFjEvySgZRi2SX3ahcVEBAZTLA9gFj4dzu/A6DsbOTkZajLto
 kQU4go/M9uvsDXZ5BH7pf6gGBofe4TmcRK/kz4MxEVp3lkc2WPCcahgyK0KzNEq3Ihrn
 RB2/jlgkJHmFWFRYiSPxsAOvJ4JzS9N5ilXMU4mzSTjXsL+Jz0D88c3qD4N4tBMsYisK
 /Xzg==
X-Gm-Message-State: AAQBX9d0vHh9URt2en104ewan7mFi8zUyblj9UtBUxYVSVPUqGIWI7Uz
 29znzbzKokg8t0UhHcWEdwngTw==
X-Google-Smtp-Source: AKy350YTU5Gh3iTlIBEVUoH57lkpRIAFgqS9Xy8xzfKfwwPWFO/NFurdG+gyK7o+ob+AZz1fJsMFUg==
X-Received: by 2002:a17:906:9497:b0:931:88e8:d470 with SMTP id
 t23-20020a170906949700b0093188e8d470mr4972064ejx.23.1681069102887; 
 Sun, 09 Apr 2023 12:38:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 rk18-20020a170907215200b0094a77168584sm672221ejb.125.2023.04.09.12.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 12:38:22 -0700 (PDT)
Message-ID: <14cb1bdd-82c2-d114-48df-e03f014d044d@mind.be>
Date: Sun, 9 Apr 2023 21:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220724214743.2324998-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220724214743.2324998-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681069103;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zFl5/SFlyLiND8f8ohRDctcDt8ZU2QpRoL6hSfWz8xo=;
 b=e2yw4D4q9E9L0sg7xFIWS/WuU4xnOvOYBrcECqlhu3uhUk7WsdcNqPy26ucRPoH6t1
 IsJY60c3Y8KOjPqxu4pNAwcWMSjsNoePdU1gJQjEwnMVCtyNaeTjczGmQd4VItlgs6iU
 rRBmD7SKlCvM/cSpRRjPDwOECv8Jz0voBQ1PRvrDjpmP3ArUbvh6bxePERZQzf1HFtT1
 wvYqyqez7QabNvw58JtFBaS4B7Jm4mL9SNdKm+f4GRxea3K89Ky1QSvatbuhjK7ljQz/
 2ELdTKZFrX1XDVxVfZtMFhS/6XxAZSq+RNRtAn0zGjbu0i4AHMZHRZXma2A23a8bnl05
 FMKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e2yw4D4q
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-cargo: ensure
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



On 24/07/2022 23:47, James Hilliard wrote:
> Set HOST_LDFLAGS RUSTFLAGS via the host-config feature, see:
> https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#host-config

  It's not clear to me *why* this should be changed. What issue is fixed by it?

> We have to enable this nightly feature first using:
> CARGO_UNSTABLE_HOST_CONFIG="true"
> 
> Separately set target RUSTFLAGS for the target triple specific env
> variable.

  This part is also not entirely clear to me. Isn't that the same thing when 
cross-compiling (like it's the case in autotools or meson)? Or are non-specific 
RUSTFLAGS also applied to host builds when cross-compiling?

> Move RUSTFLAGS for host builds to HOST_PKG_CARGO_ENV so that they
> are set for host cargo builds which use python infrastructure.

  This makes sense. I therefore applied just this bit, the rest of the patch 
should get a bit more clarification.

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>    - add RUSTFLAGS to HOST_PKG_CARGO_ENV
> ---
>   package/pkg-cargo.mk | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index f7e3f39503..1c105762f8 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -32,7 +32,10 @@ PKG_COMMON_CARGO_ENV = \
>   # using nighly features on stable releases, i.e features that are not
>   # yet considered stable.
>   #
> -# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" "enables the nightly
> +# CARGO_UNSTABLE_HOST_CONFIG="true" enables the host specific
> +# configuration feature

  This is also not really clear. I think it is needed for the 
CARGO_HOST_RUSTFLAGS and CARGO_TARGET_xxx_RUSTFLAGS variables to take effect, is 
that correct?

> +#
> +# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" enables the nightly
>   # configuration option target-applies-to-host value to be set
>   #
>   # CARGO_TARGET_APPLIES_TO_HOST="false" is actually setting the value
> @@ -41,9 +44,11 @@ PKG_COMMON_CARGO_ENV = \
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
> @@ -51,11 +56,13 @@ PKG_CARGO_ENV = \
>   # and should be removed when fixed upstream
>   #
>   ifeq ($(NORMALIZED_ARCH),arm)
> -	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
> +	PKG_CARGO_ENV += \
> +		CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"

  Kind of tangential to this change: would it make sense to have a $(PKG)_RUSTFLAGS?


  Regards,
  Arnout

>   endif
>   
>   HOST_PKG_CARGO_ENV = \
> -	$(PKG_COMMON_CARGO_ENV)
> +	$(PKG_COMMON_CARGO_ENV) \
> +	RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
>   
>   ################################################################################
>   # inner-cargo-package -- defines how the configuration, compilation and
> @@ -128,7 +135,6 @@ else # ifeq ($(4),target)
>   define $(2)_BUILD_CMDS
>   	cd $$($$(PKG)_SRCDIR) && \
>   	$$(HOST_MAKE_ENV) \
> -		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
>   		$$(HOST_CONFIGURE_OPTS) \
>   		$$(HOST_PKG_CARGO_ENV) \
>   		$$($(2)_CARGO_ENV) \
> @@ -169,7 +175,6 @@ ifndef $(2)_INSTALL_CMDS
>   define $(2)_INSTALL_CMDS
>   	cd $$($$(PKG)_SRCDIR) && \
>   	$$(HOST_MAKE_ENV) \
> -		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
>   		$$(HOST_CONFIGURE_OPTS) \
>   		$$(HOST_PKG_CARGO_ENV) \
>   		$$($(2)_CARGO_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
