Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801EFC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23BA641E40;
	Tue,  6 Feb 2024 14:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23BA641E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djGSo2Qgrcf1; Tue,  6 Feb 2024 14:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39E5D41E52;
	Tue,  6 Feb 2024 14:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39E5D41E52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7066E1BF423
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A4C881E9C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXSFPlwjSSic for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4B1C81E6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4B1C81E6D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4B1C81E6D
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:35:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33b0e5d1e89so4517510f8f.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 06:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707230103; x=1707834903;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0FdTcaQDNG8DGwCkILV1QOWhS4x0vWtOCtXLd/BeFXM=;
 b=LWVCBumm5wxaG+8I8Xv7jdWNtR4d7/FzI0Rk8kftDBvjLaZfeqFMfd2NxBlX0Y7Y1X
 1UNpINGC3uUT2ZxuFA6e1YrqzdS+G0Z9chLiEpLQrk45Slzsw2Kkx/MbU6ojKHAcp/U8
 di11d30mQXiSxk8J+s/ltQo3NaMMSWQC1oxoDNEAv+ThAhdxdVehoZE7yO9ZBSBGDEBw
 pl1Os1RXzg22CZCQElCMs4Rt+6KItRtYh6RKCyqQuozKLclcrATtFlyWEehZvDfNC/E1
 8noRGuK0nIRwZD//coFZYgcgdvQraAa54cNQ73QWEBbzf3tBG1U9wgFpgUnmhCIIMgew
 Behg==
X-Gm-Message-State: AOJu0YwTfI02+CFr2lircolAFEj4fjW+qRSLxDMejTFKj3JW8EAIxIYI
 Sn9D5D1udqdMoaXyPT/HrJEOMptipJvBc0KfE/qd8IkzlcgMCWTD6BDyb8qT1yw=
X-Google-Smtp-Source: AGHT+IHe/UVec4RQ6NhGlmo/HQiPVVEMmYSnbB9h5CtzmFwZOBwJXbmrPwcbt2Y0gzSQe+Y7m4eExQ==
X-Received: by 2002:a5d:47a2:0:b0:33b:3aa6:a28e with SMTP id
 2-20020a5d47a2000000b0033b3aa6a28emr1532796wrb.55.1707230102787; 
 Tue, 06 Feb 2024 06:35:02 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWHYDqR7hFavaMTTru1B6TM6FFSSOLL43Cg8TQ43QKqOCqarrVENCPysGrzTRTnRThKiZNhMJ6uVRZq4pX3Z+0/lF8weOfzj2BHs6fO6kXfQaydHxGLeXhKGi5xoJ3SIUhiyKQO8xZS50JA
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 o28-20020adfa11c000000b0033b3ceda5dbsm2274166wro.44.2024.02.06.06.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 06:35:02 -0800 (PST)
Message-ID: <f9996ee4-ffd5-4e5b-a603-5e889f2ef0be@mind.be>
Date: Tue, 6 Feb 2024 15:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20221021224448.3502942-1-james.hilliard1@gmail.com>
In-Reply-To: <20221021224448.3502942-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707230103; x=1707834903; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0FdTcaQDNG8DGwCkILV1QOWhS4x0vWtOCtXLd/BeFXM=;
 b=NMm5keMWfqradPjDguOmEK3xbezhrzDLruQ+AhnS3edcMP683d6wo32KPi2WnNq6jo
 FCp68UQI05cXTG55Yd74e5a45Lj3cGkusoS5wHYgNRQ6JJKGJrFKowdxOAqth/nCoGQ3
 Mvf88PVX6a3QTkBXvpqD2O45xQiORpNt3XnAu7+kPhG1hLwcBwff0jxgYlJ/E899DCYK
 5nndc5KnvVrJfLnC0myxDVS427W0kh4Wb54Tomgtv2xggjwoOS3XOu7N1qx9aTHfzAMl
 fXPtyUGAe+Wvh04sAQw6QPlHi1+4AiGctz85+qcc5zrKTpEddcxYRCgvnK941tn4u+e4
 4ypg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NMm5keMW
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo: configure cargo
 profiles
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Moritz Bitsch <moritz@h6t.eu>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

  There's really no reason why this should have taken more than a year, but 
finally I applied to master.

On 22/10/2022 00:44, James Hilliard wrote:
> The cargo profile flags currently only select a cargo build flag which
> does not accurately reflect the configured build settings, setting the
> cargo build flag also only works for packages using the cargo
> infrastructure directly and not with other packages using the cargo
> environment such as pyo3 based python packages(which indirectly invoke
> cargo build via the setuptools-rust and maturn python build backends).

  I slightly rewrote the commit message to hopefully make it even clearer.


> To ensure that cargo uses the correct profile settings for the build
> we need to set env variables for the two root profiles(dev/release)
> based on the buildroot build settings.
> 
> For reference the default cargo root profile settings are:
> https://doc.rust-lang.org/cargo/reference/profiles.html#default-profiles

  I checked this page, and there are three configs we are not setting at the 
moment: strip, panic and rpath. They default to the same value for dev and 
release, and those values look appropriate for Buildroot:

- strip = "none" - OK because we strip in post-build.
- panic = "unwind" - sounds OK to me
- rpath = "false" - OK because all libs should be installed in /usr/lib.

  Ideally this should have been mentioned in the commit message as well. I 
didn't do that because I wasn't 100% sure of the above - so can the people in Cc 
of this mail check if it looks correct?

  Regards,
  Arnout

> 
> As applications not using cargo infrastructure do not have a standard
> way of configuring a specific build profile due to the selected
> profile being determined by the cargo command line flags, the only
> reliable way to configure profile settings is to set both root
> profiles in the environment as this will ensure that they are used
> regardless of which cargo build flag(such as --debug or --release) is
> used.
> 
> Cc: Moritz Bitsch <moritz@h6t.eu>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/pkg-cargo.mk | 100 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 100 insertions(+)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index f7e3f39503..4945770079 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -46,6 +46,106 @@ PKG_CARGO_ENV = \
>   	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
>   	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
>   
> +# We always set both CARGO_PROFILE_DEV and CARGO_PROFILE_RELEASE
> +# as we are unable to select a build profile using the environment.
> +#
> +# Other cargo profiles generally derive from these two profiles.
> +
> +# Disable incremental compilation to match release default.
> +#
> +# Set codegen-units to release default.
> +#
> +# Set split-debuginfo to default off for ELF platforms.
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_INCREMENTAL="false" \
> +	CARGO_PROFILE_RELEASE_INCREMENTAL="false" \
> +	CARGO_PROFILE_DEV_CODEGEN_UNITS="16" \
> +	CARGO_PROFILE_RELEASE_CODEGEN_UNITS="16" \
> +	CARGO_PROFILE_DEV_SPLIT_DEBUGINFO="off" \
> +	CARGO_PROFILE_RELEASE_SPLIT_DEBUGINFO="off"
> +
> +# Set the optimization level with the release default as fallback.
> +ifeq ($(BR2_OPTIMIZE_0),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="0" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="0"
> +else ifeq ($(BR2_OPTIMIZE_1),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="1" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="1"
> +else ifeq ($(BR2_OPTIMIZE_2),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="2" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="2"
> +else ifeq ($(BR2_OPTIMIZE_3),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="3" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="3"
> +else ifeq ($(BR2_OPTIMIZE_G),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="0" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="0"
> +else ifeq ($(BR2_OPTIMIZE_S),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="s" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="s"
> +else ifeq ($(BR2_OPTIMIZE_FAST),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="3" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="3"
> +else
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_OPT_LEVEL="3" \
> +	CARGO_PROFILE_RELEASE_OPT_LEVEL="3"
> +endif
> +
> +ifeq ($(BR2_ENABLE_LTO),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_LTO="true" \
> +	CARGO_PROFILE_RELEASE_LTO="true"
> +else
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_LTO="false" \
> +	CARGO_PROFILE_RELEASE_LTO="false"
> +endif
> +
> +
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +ifeq ($(BR2_DEBUG_3),y)
> +# full debug info
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_DEBUG="2" \
> +	CARGO_PROFILE_RELEASE_DEBUG="2"
> +else
> +# line tables only
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_DEBUG="1" \
> +	CARGO_PROFILE_RELEASE_DEBUG="1"
> +endif
> +else
> +# no debug info
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_DEBUG="0" \
> +	CARGO_PROFILE_RELEASE_DEBUG="0"
> +endif
> +
> +# Enabling debug-assertions enables the runtime debug_assert! macro.
> +#
> +# Enabling overflow-checks enables runtime panic on integer overflow.
> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_DEBUG_ASSERTIONS="true" \
> +	CARGO_PROFILE_RELEASE_DEBUG_ASSERTIONS="true" \
> +	CARGO_PROFILE_DEV_OVERFLOW_CHECKS="true" \
> +	CARGO_PROFILE_RELEASE_OVERFLOW_CHECKS="true"
> +else
> +PKG_CARGO_ENV += \
> +	CARGO_PROFILE_DEV_DEBUG_ASSERTIONS="false" \
> +	CARGO_PROFILE_RELEASE_DEBUG_ASSERTIONS="false" \
> +	CARGO_PROFILE_DEV_OVERFLOW_CHECKS="false" \
> +	CARGO_PROFILE_RELEASE_OVERFLOW_CHECKS="false"
> +endif
> +
>   #
>   # This is a workaround for https://github.com/rust-lang/compiler-builtins/issues/420
>   # and should be removed when fixed upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
