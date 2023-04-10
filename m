Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524BEC77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B05260B03;
	Mon, 10 Apr 2023 19:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B05260B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSrq1XiaI13S; Mon, 10 Apr 2023 19:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7EC160E92;
	Mon, 10 Apr 2023 19:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7EC160E92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26BC01C3AE9
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3FE560B03
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3FE560B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUWKgKACSuAj for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:02:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDCE760E92
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDCE760E92
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:02:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d9so5399763wrb.11
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 12:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681153325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dcdCu2RzfV8KUJT7z7royHex21OFiR405Mszy+65ZDc=;
 b=DDo9nEO8gsceW1yonu13XG41tRh/gGayU+zxy12NcWSbGTpWLI4w07onQIxEgYS/U1
 +NsM8BY7Am3M+SurnfNchVE/9LVXZAHU9GkoMwFsT4IeX+9vwYEskelNPXoOJTsFq6qQ
 5uoG7z6G3Gd5N0LqB5Y1BraxJitY1YlD1+posfGDbX5R1pXIqZIlvmPAgHbVlNKFhlm+
 UcjuaEDVTqC40VPHPnnm8eB3G7kAYu1JH6XJ5buFb5uoOmqnRwOpZNkY6AQF5k8isruT
 z2W4v2Y73lFo1OLnoY4wjXQMtO+w/xAIa8v2AGFuMHhp90qclr83BetwH4wYZYKRYDwT
 tJ8g==
X-Gm-Message-State: AAQBX9fe20WpsDYFe48RgHbtHsG0KHU/NNtDt8aQqo41GZQY/NpJVEAp
 41jIxA3aGkGaxgyeV+ogZvsEyA==
X-Google-Smtp-Source: AKy350ZwiYdLgpNQxpA5jIzU8WWAe3zpVTD79S19zC36k+sZSogntV8H/9PLV2BLn04AMeDSkZt5gg==
X-Received: by 2002:a05:6000:1c1:b0:2f2:a6e0:b2c with SMTP id
 t1-20020a05600001c100b002f2a6e00b2cmr742653wrx.7.1681153324860; 
 Mon, 10 Apr 2023 12:02:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4c90000000b002cf1c435afcsm12446851wrs.11.2023.04.10.12.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 12:02:04 -0700 (PDT)
Message-ID: <298af741-f854-b70b-6e75-cde10a49c835@mind.be>
Date: Mon, 10 Apr 2023 21:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20230410083252.138426-1-james.hilliard1@gmail.com>
 <20230410164031.GC2819@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230410164031.GC2819@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681153325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dcdCu2RzfV8KUJT7z7royHex21OFiR405Mszy+65ZDc=;
 b=XbxgkCsc1ZuzGlrHhaRAoOZWl55/waGFaq72g4DevELhLyMFkBn4ih7sP1rGyFxhzn
 Yoy7OFS/njGoKW0yP3dL4DWUZe2E2ZVlU1pFr/7ZBJ7GuAO8n8rdJIMUtxpYziu6QGI6
 NRVbWYGnxgzRD5M2MuraamQouZBbNjBB89EcAupdKc+oHE1zkJLZvxBzRYzADjxspQDT
 IiQposNuI55FRiib8uXO2MLldefGdBAcqrzFCh4LBol5KQ2O4iJU2Z/S98S5ZtnkEyTo
 UGV26jC93nc+t1JQmtgAU2/Xj2H7OieTCoswbncfEfc5aDTZC4pqzm/KPqjpvhC7uhng
 4iHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XbxgkCsc
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2023 18:40, Yann E. MORIN wrote:
> James, all,
> 
> On 2023-04-10 02:32 -0600, James Hilliard spake thusly:
>> Set HOST_LDFLAGS RUSTFLAGS via the host-config feature, see:
>> https://doc.rust-lang.org/nightly/cargo/reference/unstable.html#host-config
>>
>> We have to enable this nightly feature first using:
>> CARGO_UNSTABLE_HOST_CONFIG="true"
>>
>> Separately set target RUSTFLAGS for the target triple specific env
>> variable.
>>
>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> 
> FTR, Arnout did a review of a previous iteration, and proposed a commt
> log with a lot more details and explanations on the actual reasons why
> we have to do this change:
> 
>      https://lore.kernel.org/buildroot/0a2e0dd8-b579-644a-9d83-af88e40d40de@mind.be/

  Actually, that was supposed to be a reply to this v3, my bad...

  @james just confirmation that my proposed commit log is enough, I already have 
it lined up for pushing.

  Regards,
  Arnout

> 
> Could you please reveview what he wrote, and incorporate that in your
> commit log (and amend/extend further if needed), and then respin,
> please?
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>> Changes v2 -> v3:
>>    - rebase
>> Changes v1 -> v2:
>>    - add RUSTFLAGS to HOST_PKG_CARGO_ENV
>> ---
>>   package/pkg-cargo.mk | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
>> index 5600c8e97e..264bf5a1ae 100644
>> --- a/package/pkg-cargo.mk
>> +++ b/package/pkg-cargo.mk
>> @@ -34,7 +34,10 @@ PKG_COMMON_CARGO_ENV = \
>>   # using nighly features on stable releases, i.e features that are not
>>   # yet considered stable.
>>   #
>> -# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" "enables the nightly
>> +# CARGO_UNSTABLE_HOST_CONFIG="true" enables the host specific
>> +# configuration feature
>> +#
>> +# CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" enables the nightly
>>   # configuration option target-applies-to-host value to be set
>>   #
>>   # CARGO_TARGET_APPLIES_TO_HOST="false" is actually setting the value
>> @@ -43,9 +46,11 @@ PKG_COMMON_CARGO_ENV = \
>>   PKG_CARGO_ENV = \
>>   	$(PKG_COMMON_CARGO_ENV) \
>>   	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
>> +	CARGO_UNSTABLE_HOST_CONFIG="true" \
>>   	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
>>   	CARGO_TARGET_APPLIES_TO_HOST="false" \
>>   	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
>> +	CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
>>   	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
>>   
>>   #
>> @@ -53,7 +58,8 @@ PKG_CARGO_ENV = \
>>   # and should be removed when fixed upstream
>>   #
>>   ifeq ($(NORMALIZED_ARCH),arm)
>> -	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
>> +	PKG_CARGO_ENV += \
>> +		CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
>>   endif
>>   
>>   HOST_PKG_CARGO_ENV = \
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
