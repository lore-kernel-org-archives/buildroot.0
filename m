Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9264CC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 442E540919;
	Mon, 15 Jul 2024 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1lnMXKvkQiH; Mon, 15 Jul 2024 14:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44C794051A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44C794051A;
	Mon, 15 Jul 2024 14:49:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E09CF1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA3564035F
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5Pz_kaMgZyL for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:49:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE6604035C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE6604035C
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE6604035C
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:49:44 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52ea33671ffso4452593e87.3
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721054982; x=1721659782;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VuSJUQDh/7wmc4YqHtYv1PS/X2X84wcgocp5aWYGdAQ=;
 b=ePSvdaIHZg9J6ZgXsNx7OE0cy6C9T6J9HelZIw6azl0luHizy/BEWWIKqaLkq2ddbI
 C+14xs7zXOT+F5LG24r+PZNXlkTodZrrJ4Fn25WKRxnOhhjhzHRE7aqs5CmDOtYIY20A
 pPtGb/V3l58/s5+Ea7vJeRsUpzWLQ6rJGBWOox2yd684o6XHsnayyaee2cnHRWhJd+wT
 Ptqz4Hp+OlMSCx+0lI9N7SsVatXrzIia0yBHGVIRHAI4ZRSX+91j8gz18fTjzUQshDoB
 PeczGa+qGNqhQE1zWvlZzs5NyS7oKsDlAlO52no/vLGlwOeuYeSuFSFRbWo4Q+RdrCuR
 Gx4Q==
X-Gm-Message-State: AOJu0YyNhSzGrVx6pfAeMdLrczDEHLHnaFvxCDRXJ4Yk/0jzVKz1Ic1V
 F+HaRnsAUMDLaBzbKhepHY9dDRSezSahr+KOg9WkZkvQv/8iOJ9z/gkhRf/1lyQ=
X-Google-Smtp-Source: AGHT+IH5sRwdI42iHBYOihTndxFMLy/nDSywas0za1wr4VJXiK9VdQs4LUIJuP2CWlczZffG0fLozQ==
X-Received: by 2002:a05:6512:4011:b0:52e:934f:bda5 with SMTP id
 2adb3069b0e04-52eb999a25dmr14958316e87.21.1721054981947; 
 Mon, 15 Jul 2024 07:49:41 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e9a809sm90289515e9.28.2024.07.15.07.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:49:41 -0700 (PDT)
Message-ID: <74d09502-f6aa-40c2-9f06-de5b25331a73@mind.be>
Date: Mon, 15 Jul 2024 16:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com>
 <bb557f20-2d9c-4b1b-9b33-4072d41fe129@mind.be>
 <20240715155144.227dab3e@booty>
Content-Language: en-GB
In-Reply-To: <20240715155144.227dab3e@booty>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721054982; x=1721659782; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VuSJUQDh/7wmc4YqHtYv1PS/X2X84wcgocp5aWYGdAQ=;
 b=ZtBAAdhO+conxlpod5yNgUore7eTmtJ9Z4Mqc5dke9aAQs6z635/wm6sHpmZjea9aL
 jc/vl8zoGZUJYMYcKLBzAsl03VWO4otHQ2H9PkLtB57ubesJ++TjWsTl2XpI90fkV9Ag
 PPH1wVVnggcp8prmofonAM2qyezjuREtJwYshq2li8kR2wBHZMgTwPoJ05lUFeOGQgmc
 TNuzuVzMQCTfSm4X4RUnaNsJsgxvcKJhfYr3o6l86gAvqN3ojQMV3veWF4p2Nt9x+e2c
 HB9k3d0YJccd+tdjmma08jzGRrdFt7utXJBb7yPDqE/bj6+BjWPS1eymNmVoduugxnKj
 dtQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZtBAAdhO
Subject: Re: [Buildroot] [PATCH] uboot: allow taking the entire default
 environment from a text file
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
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/07/2024 15:51, Luca Ceresoli wrote:
> Hi Arnout,
> 
> On Fri, 12 Jul 2024 11:23:12 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:

[snip]
>>    I think we mostly use `` rather than $(shell ...) - with the backticks, it's
>> much easier to understand when it's going to be evaluated.
> 
> I did some quick tests with the backticks and wasn't able to make it
> work, but if you have a suggestion to make it work I'll be glad to try
> that.

  KCONFIG_SET_OPT adds double quotes around its argument, so backticks will 
indeed not work!

  Regards,
  Arnout

> 
> So I'm sending v2 still using $(shell ...) for the time being.
> 
> About which is the "common habit", I found very few cases with both, so
> no obvious winner apparently. However in this same file
> (boot/uboot/uboot.mk) there are two readlink usages already, both using
> the $(shell ...) pattern. Disclaimer: both have been added by me :)
> 
> Luca
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
