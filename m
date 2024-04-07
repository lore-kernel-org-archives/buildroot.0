Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19419CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBB80404A3;
	Sun,  7 Apr 2024 19:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuvQX38VMltp; Sun,  7 Apr 2024 19:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1652404B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1652404B4;
	Sun,  7 Apr 2024 19:30:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61C901BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50C82406E7
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gZ_iljvxBMW for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:30:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF587406E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF587406E9
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF587406E9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:30:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41673509e8eso1490605e9.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712518214; x=1713123014;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n2mA8zr5mOH84OjYTrc1IhE7Kx3fGT1vbLuk29O7uj4=;
 b=NBfUOfThc+H2jmjLr9ZyWUy5W9a7zgu287KPS0Yv2j3CZlO30VnTlVl/i4A+QSImza
 28JH7Ci4ISg1MAITVs7LytsuJ4jYBMR+e9NTIkr2yboNy1a+YEAqZIfvEfOBKvNNk44W
 /K9x/zXgv2rlxuDgox0MZE/9cQECGPrtERp9L1HdSe3ShmXrB238OgYIM4D/mg+otbPm
 TJe93U258HUWsCo5AGdExNRrOjI82K2AO8j9jkljwf4CHGR1BZvQD9t9xUS8upB+42h2
 ralBzY+pL1i3GSftGrjnsQWt/SUN2BXbav6MQY+HrwwNitX21SB8G4OFDseWsNYVSj9F
 owAQ==
X-Gm-Message-State: AOJu0YyeOoiWbNWLAz8SNfHRqqogAKVAOAXVkzbSpebzxLlQnBQqFovx
 DRuoy9WIIFvJgIcnRnT9QqsHHAI0Fh4/mme6hNioztjqoCvWrqP9grjaHnxaN40=
X-Google-Smtp-Source: AGHT+IFo36hqAyY6Z5j0QSi0OERJRzYFMIPd5iq0dm4Ug7lDfxJm7N5nn/ZsbbiI+DzUyypouSF/YA==
X-Received: by 2002:a5d:6184:0:b0:343:8e85:dd7c with SMTP id
 j4-20020a5d6184000000b003438e85dd7cmr3982869wru.55.1712518213431; 
 Sun, 07 Apr 2024 12:30:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 m28-20020adfa3dc000000b003435e1c0b78sm7282060wrb.28.2024.04.07.12.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:30:13 -0700 (PDT)
Message-ID: <6e119079-bbae-49dd-b3f7-f8117e8a201e@mind.be>
Date: Sun, 7 Apr 2024 21:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chin Huat Ang <chinhuat@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240406154308.3336009-1-chinhuat@gmail.com>
 <20240406233701.036e7ca8@windsurf> <ZhLcHN3heQjqZvCD@NUC7CJYS>
Content-Language: en-GB
In-Reply-To: <ZhLcHN3heQjqZvCD@NUC7CJYS>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712518214; x=1713123014; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n2mA8zr5mOH84OjYTrc1IhE7Kx3fGT1vbLuk29O7uj4=;
 b=fbMoV5xtJy21QfvfNWuL33TI7dFa9XaN73PWUn8lEAJr8HPvVeEwRhuHYAOg7zmEGW
 iuW36DzQhjIOGfUbxVPABbv0+cSaKPDquZ4plDcuiHQiFoVYQ4CDrsquJkBkq//3nbYJ
 3/qvDyv1hchYQ3pjmQJFYLdTUQpa85v7rpjdmlkm9X0aFv5tAu1+5AvKnhJw2KolOYJq
 Jc/hx/XMVp4+aP89SvASHxL1qUwi8dHrt+gzHxgczhar2lbKzYC0ayc7+ahmq4LN20/M
 3zarpHQ4ohKNEw+3nDtnuZIefZHNEXTsnfZ78tq8QMmXCcwKStVhI9jmU71mAG1mXqjo
 MOcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fbMoV5xt
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to version 1.0.47,
 add Y2038 config option
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 19:47, Chin Huat Ang wrote:
> Hi Thomas,
> 
>> I don't think we should add a BR2_UCLIBC_USE_TIME64 option. Instead,
>> there is already a BR2_TIME_BITS_64, which enables 64-bit time_t for
>> glibc. It simply needs to be extended to also allow enabling 64-bit
>> time_t in uClibc.
> 
> I contemplated reusing BR2_TIME_BITS_64 but I noticed it has a
> widespread impact of causing many packages to be configured with
> -D_TIME_BITS=64 due to these in package/Makefile.in:
> 
>    ifeq ($(BR2_TIME_BITS_64),y)
>    TARGET_CPPFLAGS += -D_TIME_BITS=64
>    endif
>    TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
>    TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>    ...
>    TARGET_CONFIGURE_OPTS = \
>    ...
>            CPPFLAGS="$(TARGET_CPPFLAGS)" \
>            CFLAGS="$(TARGET_CFLAGS)" \
>            CXXFLAGS="$(TARGET_CXXFLAGS)" \
>    ...
> 
> I wasn't sure if this is the right thing to do but at the very least
> whenever uClib is used, my intention was to only configure itself with
> UCLIBC_USE_TIME64.
> 
> Assuming if BR2_TIME_BITS_64 applies to both glibc and uClibc, should
> -D_TIME_BITS=64 only be appended to glibc GLIBC_EXTRA_CFLAGS?

  IMHO the question is if uClibc acts like musl (i.e. unconditionally enable 
64-bit time, which breaks binaries that were compiled with 32-bit time) or like 
glibc (i.e. the compiled library supports both 32-bit and 64-bit time, and 
applications use the one or other version depending on _TIME_BITS).

  I _think_ that uClibc acts like musl. In that case, passing -D_TIME_BITS=64 
doesn't make any sense. And therefore, having the option at uClibc level makes 
more sense. However, I don't think it's very useful to have this configuration 
knob in Buildroot's config. What I would do instead is to unconditionally change 
our bundled uClibc config to enable 64-bit time, and let people provide their 
own config if for some reason they don't want 64-bit time.


  Note that we currently don't have anything like 
BR2_TOOLCHAIN_HAS_TIME_BITS_64, i.e. a symbol that says if libc supports 64-bit 
time or not. I don't actually think it's useful - I guess that if packages need 
to know this, they'll have a configure script to test for it. But _if_ we would 
have such an option, _then_ a Buildroot config option for uClibc would make 
sense (because you have to be able to know at Buildroot config level if uClibc 
config has it enabled or not).

  Regards,
  Arnout


> 
>> Also, can I suggest that you split your change into two commits? One
>> bumping uClibc to 1.0.47, and one making it possible to configure it
>> with 64-bit time_t?
> 
> That's a good idea, I guess I was too focused on trying out uClib's
> Y2038 solution. I'll split the patch up as you suggested.
> 
> --Chin Huat
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
