Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F05C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 21:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1860409E5;
	Sun, 24 Jul 2022 21:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1860409E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7lGBlDMMEk7; Sun, 24 Jul 2022 21:23:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36CE8409F6;
	Sun, 24 Jul 2022 21:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36CE8409F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 418D31BF33C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2971A40B85
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2971A40B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fcKISMIX43qW for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 21:23:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5CF04040D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5CF04040D
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 21:23:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so5317017wmm.4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HCJCzZN0wMY6hEnwyl3aOnl/5G0n6olf+/I5z8jrI4k=;
 b=ufkKOetJthIDnEZ9wr/MoSAGCU3lTlObUVOfyKq0JjRVRLXnax786iPxyzg/vhVZVR
 GeCqI3itoJibR5IebgNmMF78Oq9mROTZAbrJkfDOyYpntQpJ1vMVvIR8s/h8PCWsl8c7
 UTMOqFnrL6n3dW6+srVAkkim5pwr1xYLUgpkEVpnT9zxdOg3ybIg+mCJwRYNGEp/PGnJ
 61aDNr9/98oTDo6dhmPpvx37GVUA5gXUWT8MfUfsJ9S0cbKEa8QSWe09/Ievro1jyPZj
 NOit+0e54rQ9kGwmrOI5bWjW5pKxOOPUWCEykMoVZA/nPw73OR3LtuYSFeO431cY62j9
 2hpg==
X-Gm-Message-State: AJIora/7SHqNSnmTRu4WP4sGqxVjfKreQasFNsAa2UmiAzD+WHYA4VXF
 lrAAzSaIKXSojW4NOyiWEkHALA==
X-Google-Smtp-Source: AGRyM1tjeYk8oqQRK1dpYmvXM7QcEixis0LVBdIbuHHZ9b1kcAfJq1Qg7hNniotQZodhdhHv4ZEQoQ==
X-Received: by 2002:a1c:21c3:0:b0:3a2:fdba:3f39 with SMTP id
 h186-20020a1c21c3000000b003a2fdba3f39mr6668384wmh.194.1658697811758; 
 Sun, 24 Jul 2022 14:23:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c4e4600b003a3188bef63sm12681856wmq.11.2022.07.24.14.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 14:23:31 -0700 (PDT)
Message-ID: <ba2294c2-bfc6-fcab-d03d-4709e4758a3d@mind.be>
Date: Sun, 24 Jul 2022 23:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220724020144.1012252-1-james.hilliard1@gmail.com>
 <ebe61366-15fc-6e69-b187-f884312206e2@mind.be>
 <CADvTj4rLQx5-t6iQEKTcc0U4n=T_-7LSWWBkV1wdKCaraT+_Fw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4rLQx5-t6iQEKTcc0U4n=T_-7LSWWBkV1wdKCaraT+_Fw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HCJCzZN0wMY6hEnwyl3aOnl/5G0n6olf+/I5z8jrI4k=;
 b=QXsrODYxRSspa/4XdAT2lHQZZNiPGybkso9BDVEFpkUgdkzZDK/oYWuRG/BSydyDny
 bUZT4Fw1uGfvgRcsc6abmrCrz6lEF49t27VQ3Bup7aXlPa1Kg/MBwUNObIIiilZ14zgg
 +19i7K0PBLygJFUfJx4aUD6qY3+GcBuHe2loRSZ2bD+Lzvu8M/hAbUnInyf2Rhx1mROx
 rLy9hA5mGgNgQkXDk2OubWQXEBPtoVtixaekA4zkEmNRgknSmghmTXVSEflXRl8mHshq
 KM6koT0xumjO4DDOOjkXUXKHpMdLRx47w3Ax5eagnxMNpWtq0E/iMmIByLOYh/7PFajQ
 MSWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QXsrODYx
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 23:06, James Hilliard wrote:
> On Sun, Jul 24, 2022 at 2:59 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 24/07/2022 04:01, James Hilliard wrote:
>>> Set HOST_LDFLAGS RUSTFLAGS via the host-config feature, see:
>>> https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#host-config
>>>
>>> We have to enable this nightly feature first using:
>>> CARGO_UNSTABLE_HOST_CONFIG="true"
>>>
>>> Separately set target RUSTFLAGS for the target triple specific env
>>> variable.
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>    package/pkg-cargo.mk | 11 ++++++++---
>>>    1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
>>> index f7e3f39503..439d443b0d 100644
>>> --- a/package/pkg-cargo.mk
>>> +++ b/package/pkg-cargo.mk
>>> @@ -32,7 +32,10 @@ PKG_COMMON_CARGO_ENV = \
>>>    # using nighly features on stable releases, i.e features that are not
>>>    # yet considered stable.
>>>    #
>>> -# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" "enables the nightly
>>> +# CARGO_UNSTABLE_HOST_CONFIG="true" enables the host specific
>>> +# configuration feature
>>> +#
>>> +# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" enables the nightly
>>>    # configuration option target-applies-to-host value to be set
>>>    #
>>>    # CARGO_TARGET_APPLIES_TO_HOST="false" is actually setting the value
>>> @@ -41,9 +44,11 @@ PKG_COMMON_CARGO_ENV = \
>>>    PKG_CARGO_ENV = \
>>>        $(PKG_COMMON_CARGO_ENV) \
>>>        __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
>>> +     CARGO_UNSTABLE_HOST_CONFIG="true" \
>>>        CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
>>>        CARGO_TARGET_APPLIES_TO_HOST="false" \
>>>        CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
>>> +     CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
>>>        CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
>>>
>>>    #
>>> @@ -51,7 +56,8 @@ PKG_CARGO_ENV = \
>>>    # and should be removed when fixed upstream
>>>    #
>>>    ifeq ($(NORMALIZED_ARCH),arm)
>>> -     PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
>>> +     PKG_CARGO_ENV += \
>>> +             CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
>>
>>    I don't understand why this is needed. We don't set RUSTFLAGS anywhere else,
>> so it should be fine? Or is it because RUSTFLAGS is also used for native build
>> even if CARGO_HOST_RUSTFLAGS is set?
> 
> So cargo target builds tend to actually build artifacts for both the
> host and the
> target architecture, since cargo build-scripts are themselves written
> in rust, thus
> passing plain RUSTFLAGS has inconsistent behavior it seems in regards to
> which artifact builds the RUSTFLAGS get applied to(seems to have changed
> across cargo versions as well). Splitting them explicitly should be
> more correct.

  Ah, yes, that makes sense. However, this splitting wouldn't work at all if 
host target name == target target name (e.g. x86_64-unknown-linux-gnu) - in 
particular, we DO NOT want to pass HOST_LDFLAGS for linking stuff for the 
target. HOST_LDFLAGS contains the rpath pointing into HOST_DIR/lib.

> 
>>
>>    (Anyway, this hunk can probably be removed, the bug that triggered it is fixed.)
>>
>>>    endif
>>>
>>>    HOST_PKG_CARGO_ENV = \
>>> @@ -128,7 +134,6 @@ else # ifeq ($(4),target)
>>>    define $(2)_BUILD_CMDS
>>>        cd $$($$(PKG)_SRCDIR) && \
>>>        $$(HOST_MAKE_ENV) \
>>> -             RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
>>
>>    Why can this be removed? You added CARGO_HOST_RUSTFLAGS to the target build,
>> but we still want HOST_LDFLAGS in the host package build, no?
> 
> I think this works ok since it's not a cross build like the target
> build. Target builds
> generate both native/and target artifacts unlike host builds.

  I don't think it will work (when linking against C code), because I don't see 
where else the rpath into HOST_DIR will be passed. At the moment we have only 
one package in that situation I think: host-sentry-cli.


  Regards,
  Arnout


> 
>>
>>    Regards,
>>    Arnout
>>
>>>                $$(HOST_CONFIGURE_OPTS) \
>>>                $$(HOST_PKG_CARGO_ENV) \
>>>                $$($(2)_CARGO_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
