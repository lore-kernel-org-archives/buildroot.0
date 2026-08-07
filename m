Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A7AC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E60D5811A1;
	Fri,  7 Aug 2026 11:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROAe_DR5MS1Q; Fri,  7 Aug 2026 11:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F1B88115A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103366;
	bh=q0fyeiDMZQaTvj4XbaNu4UXmpS/ZVspgdKt0TGfPUTU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hrjWBQZtbgh6nmG2cRlDxvW3F0g0zgIuLemqVNziFq8or0YGsyyL2NutzO72vvXws
	 RI1ErfKNnEhP0wsGcMc2mOsmSWUZFpPJcNCRaeMtrvy5t9EmuooVil9/tEqIsyS9Ha
	 IQc5Kuma+sBw2kN48grZ3YyrbqktYiO9AlDd113qT1O8zJarBqtgbP5/xRq3Hf12rI
	 0dCGOpmn/aZemwIqbUJdyiQNVLpbG8cUV6fEnbfLxrrCtTUd0WvPOoGEivc48LM8Ju
	 gW3sbnPZZCn0wLbyl1SPHPfLL/3GYMrYfOFAbKwWexdTj+px3HTZvRxqIU/CDZiQJ1
	 b+xfEMvlVbRwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F1B88115A;
	Fri,  7 Aug 2026 11:49:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 683DB218
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EB2C40105
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8LvesiEUsvA for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:49:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C85840092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C85840092
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C85840092
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:49:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso16784505e9.3
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103361; x=1786708161;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BlZVz1M0/15P1hDw4sWPifRbeNGnUB3FnbwmCLqes+Y=;
 b=aSm9YojmSXfmodnsX84iiw0NOS8Ri2y7GYJANLQoUqzp19UnyK+tAzldDcuJ6Zln3W
 JdgKrgw3A8uj/uGHUBLAblYgMpi8HipZAJcgjb6399nebeMomlaLdTn4Jg+ESYsNX5VU
 ADHja4TzCFmPBE9PCOHYup4c7SFqgQNdztAe/6jhVov6MjQFYVxhV9ybF9VnNTEI+3i5
 CQqW6CE2XsYrDLxO9RQ+KFC+2i2Nb+kDQHEGpsS5RHBxLpQq2h4GjpKzWjZaGUjWnIz1
 E8Atwg1LGmo0o9dLxvKYUxjAtLKcEeN2Vp4jbYa6iUR9aCunNLXYo7u3ynwG0ZXs6tr1
 6wwg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqNec9BWSOHTfDvugjny93FrWqR3g8+r3b6gAaGENh4ENs3lOZWEy62EfXRACaUuK1ZeiPVJLHC4mA=@buildroot.org
X-Gm-Message-State: AOJu0Yw6G6LU6A2YykI6m5tUYXY71N3pLU32Dx9nm+JFAVxQYcZiUpg1
 pNZ6V+I52wo/L2r1pCF9IkHJ+sTOjK/NWMigvlF+/bC2KVW5DsOpUffwqkOB6JF//aU=
X-Gm-Gg: AR+sD12FMNOg6qidWyzOTZkn79CKeOiHqz7bsnibSBrYKGtBVU/y6GBy+XwZZBrQ6tP
 SPh8VFXGudOxZGRo+ZgI3R1leCC3jCmwiYg/oOxCY2a1ojHJ7vtnEkEPWSFqWtGbWZecY1k+6Rp
 sQ08jmd1ulEhUFmumGy+ThlVFZ7XGfaqUxLcEVV+O1RonJoUoHvNFKPLPt4Tg2Zko9QJ/OWqz1/
 hGS80Ealb5NPRjxjZkNrJ2VUhKLodjflu+Om/cYKWFD2ik5Q+COufwjM2jVzMgLEHN8AAhsMeKX
 smYteVYRfghSwacK1yu69hwK5U8j+7z/V8QRWXgsbfHzZvEhnUhfWea4T9qfoq/PHhX46mM6HiR
 6vnj8CU3zfjP1FFb6ZIiS+OhDjWmBdHxxUoxr5lE0OVaeac2VqEK82Xgim13Qy8jmSaABbLtEKG
 iDYoGyLbLVPZYIE7hipb2UcB22XcjutzLRLGsgiF91KHgbE8odnSL/ksz2MqWj0jpSGcPdQP1r2
 OGl30zv6ihKEypOD8AIFNTge3WafPYPBLm6O/wZ9DBj8DSN
X-Received: by 2002:a05:6000:43d6:20b0:47f:b452:49f1 with SMTP id
 ffacd0b85a97d-47fec502d3emr31866322f8f.2.1786103361259; 
 Fri, 07 Aug 2026 04:49:21 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4800220ab11sm5423072f8f.35.2026.08.07.04.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:49:21 -0700 (PDT)
Message-ID: <c8d0ffd2-cee7-4458-a4bf-71954984bb11@mind.be>
Date: Fri, 7 Aug 2026 13:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, linux-amarula@amarulasolutions.com
References: <20260730200118.3547779-1-dario.binacchi@amarulasolutions.com>
 <20260730200118.3547779-3-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20260730200118.3547779-3-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103361; x=1786708161; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BlZVz1M0/15P1hDw4sWPifRbeNGnUB3FnbwmCLqes+Y=;
 b=MA2hUNnHNV2553BLArfHQKV4hr6zuxwLVFpLDnyBXlEQGXrsItOkUeVEAOR1zyPpJg
 pEVsmRZpaCwm+5GViuqPG4Z0znsaLr4YoBM4BoOMAPK5lAqMMRTqwzdQ8YyxzOwC5AYk
 IgXI9KYqXLMfH9Hjr6ZVrgKoWk9+eG8P3P04brG06KtJCeVESoiSuhRMXSDWBhogS2rc
 NWN9lIMnjw0VTrqz1QOwMFfJJn50Q0oKxisFxTQPBXrcGXNEDUr0FHc7PMpcQbYt6iI9
 EjLQaVsTAGjFdC9wpljEG5YICXilZpSvIzlQxRSN4qT1+FKoor/NzNnGu8SxWN2S1rgj
 qbyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MA2hUNnH
Subject: Re: [Buildroot] [PATCH 2/3] package/armadillo: needs gcc >= 8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/07/26 22:01, Dario Binacchi wrote:
> Upstream bumped the minimum required gcc version from 6.1 to 8.1 in
> commit 84ec3ddf9fd3 ("bump minimum gcc version to 8.1"), so the build
> now fails with "Compiler too old; need at least gcc 8.1" on older
> toolchains.
>
> There is no gcc 8.0.x release (the 8.x series starts at 8.1.0), so
> BR2_TOOLCHAIN_GCC_AT_LEAST_8 is enough to express this dependency.
>
> While at it, add the gcc version to the openblas-arch comment, which
> only checked for C++ support and would therefore stay hidden on
> toolchains that are too old.
>
> Fixes: 597d5d10ec77 ("package/armadillo: bump to version 15.0.1")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
