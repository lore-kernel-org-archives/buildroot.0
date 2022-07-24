Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58ADC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0746A83DF5;
	Sun, 24 Jul 2022 20:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0746A83DF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxfLzJucy3fv; Sun, 24 Jul 2022 20:59:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10A8A83415;
	Sun, 24 Jul 2022 20:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A8A83415
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD781BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 20:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B5F2611DD
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 20:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B5F2611DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4-bJFxdYZ01 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 20:59:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A568A611DA
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A568A611DA
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 20:59:06 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bn9so2565510wrb.9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/ebP9c6Z8EODoB1bgYfM4KGLZHiuRP+eVCqD2vl1aSk=;
 b=qqqHRkWAQSF4PwzjbN+N7qgB6lN+uOYRRFmwgwI7sOw0KLDuTO0A3V8hz8Yq1m1m2U
 pg7/PJiv3bg0RGUOCRlCOFD2vQ3tdD5rfLsPz0UvGKqE1iJK0WgUpKRwXLO/tB5CU+SK
 sy1Z3Z1HZae6mSG2fG/O0lCTf1tsFHPCIc1vdnWdI2m+ee3k7eEwegZerPr2GYxSwUEe
 SPB1vk/fYf4lvvLWKWBDMDu0/iq/jW0e9R/L2jmSpN4rTnBQwxVnK0lpCeBcwsv+vT6B
 zwyYWIZvppc4VrLuxsTi94qEUC6yNDrj5CxaY0a4DGU8/R7pOhqnhQdiWUmpaHn5QO49
 iNDg==
X-Gm-Message-State: AJIora90LCd/tLBxj1eIqUAKThdt5dHPGsXmnLwEnJzH0FjCnKmSX+nH
 WUXz6YPfrJH0H61qlr06BEXYgw==
X-Google-Smtp-Source: AGRyM1uA1mgzzW10rTxdYY8l0HOVv7xbFBCjPVkzkanVYD3nNNSTONgfdIpd6FdpbbBFIQ5y0lw6pg==
X-Received: by 2002:adf:f452:0:b0:21e:86ac:cd74 with SMTP id
 f18-20020adff452000000b0021e86accd74mr2195399wrp.194.1658696344384; 
 Sun, 24 Jul 2022 13:59:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c1c9700b003a31b00c216sm13165922wms.0.2022.07.24.13.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 13:59:03 -0700 (PDT)
Message-ID: <ebe61366-15fc-6e69-b187-f884312206e2@mind.be>
Date: Sun, 24 Jul 2022 22:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220724020144.1012252-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724020144.1012252-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/ebP9c6Z8EODoB1bgYfM4KGLZHiuRP+eVCqD2vl1aSk=;
 b=RrtUewV4Hq9pTV5KPjggP7ZhnVNgXvO4o06V8oYOJ+8/prckcRIQANDBERRxU8dNNh
 pkovNLLJcKsAWOtH77y4tDor/mRXtZnr2DJ27mMvyH2ayOyTarfOlBG0gq1qBc7MC3Dv
 QKEfyz8wCrqEfS1qSZk5kOzrSkqumj198oweHqyQmRvUbWKqrmMKCMq3HIpIN0ZBQtxD
 c1xv58/0+GxTE3AoA4B6PhB4rZAQmAlj8wsVb8GoQEmP0VJzD7TIB41ftcZkpFI4k2dc
 Dt7LTevG3A9n0NiY8o6az0BtjSNyc1/9dCL8NUDDWMeWSsUtED9cvw74jLkJXMJ3qpra
 3QjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RrtUewV4
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo: ensure host/target
 rustflags are properly split
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



On 24/07/2022 04:01, James Hilliard wrote:
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
> ---
>   package/pkg-cargo.mk | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index f7e3f39503..439d443b0d 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -32,7 +32,10 @@ PKG_COMMON_CARGO_ENV = \
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
> @@ -51,7 +56,8 @@ PKG_CARGO_ENV = \
>   # and should be removed when fixed upstream
>   #
>   ifeq ($(NORMALIZED_ARCH),arm)
> -	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
> +	PKG_CARGO_ENV += \
> +		CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"

  I don't understand why this is needed. We don't set RUSTFLAGS anywhere else, 
so it should be fine? Or is it because RUSTFLAGS is also used for native build 
even if CARGO_HOST_RUSTFLAGS is set?

  (Anyway, this hunk can probably be removed, the bug that triggered it is fixed.)

>   endif
>   
>   HOST_PKG_CARGO_ENV = \
> @@ -128,7 +134,6 @@ else # ifeq ($(4),target)
>   define $(2)_BUILD_CMDS
>   	cd $$($$(PKG)_SRCDIR) && \
>   	$$(HOST_MAKE_ENV) \
> -		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \

  Why can this be removed? You added CARGO_HOST_RUSTFLAGS to the target build, 
but we still want HOST_LDFLAGS in the host package build, no?

  Regards,
  Arnout

>   		$$(HOST_CONFIGURE_OPTS) \
>   		$$(HOST_PKG_CARGO_ENV) \
>   		$$($(2)_CARGO_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
