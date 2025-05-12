Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC84C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 13:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C22BB4099F;
	Mon, 12 May 2025 13:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCHa5KT2prd0; Mon, 12 May 2025 13:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1C6740979
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C6740979;
	Mon, 12 May 2025 13:18:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C139150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 13:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D5A840983
 for <buildroot@buildroot.org>; Mon, 12 May 2025 13:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzuSGaXsszSc for <buildroot@buildroot.org>;
 Mon, 12 May 2025 13:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E99964094D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E99964094D
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E99964094D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 13:18:19 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 61390582C99
 for <buildroot@buildroot.org>; Mon, 12 May 2025 13:04:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40D9543A04
 for <buildroot@buildroot.org>; Mon, 12 May 2025 13:04:34 +0000 (UTC)
Message-ID: <44494289-1f05-4e61-a43a-1a22840415ba@bootlin.com>
Date: Mon, 12 May 2025 15:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250507114042.96291-1-olivier.benjamin@bootlin.com>
 <20250512140732.6f179e4a@windsurf>
Content-Language: en-US
In-Reply-To: <20250512140732.6f179e4a@windsurf>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddufeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvfhfhjggtgfesthejredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhjeetfeeutdeijefhhfehkedtffehgeeiiedvtdelhfetieegvddvheeguddtfeenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopeglkffrggeimedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiegnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrg
 h
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747055074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99xTGyZ/nAlNKP6RzIMyD77UswXRjFVDuYU7h7W66sU=;
 b=SBq8gFdI1NXBJsQbKA9ZVv9s6WD0zgVIqzO985tG7zSIkoqmXbAgbhYPFpacUl9JMxQI7p
 JnfPPq5pdrf8NXtChjEnUg56pGXxCBzfjGfOKTueI/BMEgRPgwTi+GdQDOmsU8hl+Bq+Ku
 eQ6AN+PmzoS0sjAMzVbq3iuEaIYvTbfG92wgvHFImGK82TYkQ3PJuYXYNTWU0TBM6qygBo
 ke5gPXTXUCnnAVUQPbFHehs4dPI8aX6QF8qQ8wzoev6IICJ3omw2o+eN1ADXL1DfuSIB1R
 UPzfcEsRuaIC8GUVzUXJgmEVigiwJ/386jdns/oe6O1RvPyHA98IUNU1A/i6Cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SBq8gFdI
Subject: Re: [Buildroot] [PATCH 1/1] package/psplash: add support for
 fullscreen config option
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
From: Olivier Benjamin via buildroot <buildroot@buildroot.org>
Reply-To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 5/12/25 14:07, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Wed,  7 May 2025 13:40:41 +0200
> Olivier Benjamin <olivier.benjamin@bootlin.com> wrote:
> 
>> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
>> index 61162fa583..ca39cd0ee3 100644
>> --- a/package/psplash/Config.in
>> +++ b/package/psplash/Config.in
>> @@ -47,6 +47,12 @@ config BR2_PACKAGE_PSPLASH_STARTUP_MSG
>>   	help
>>   	  Enable text banner output on startup.
>>   
>> +config BR2_PACKAGE_PSPLASH_FULL_SCREEN
>> +	bool "use fullscreen mode"
>> +	default n
> 
> "default n" is useless, as it's... the default.
> 
Very fair, I'll drop this
>> diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
>> index 62268e778b..bb249e7de8 100644
>> --- a/package/psplash/psplash.mk
>> +++ b/package/psplash/psplash.mk
>> @@ -31,6 +31,12 @@ else
>>   PSPLASH_CONF_OPTS += --disable-startup-msg
>>   endif
>>   
>> +ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
>> +PSPLASH_CONF_OPTS += --enable-img-fullscreen
>> +else
>> +PSPLASH_CONF_OPTS += --disable-img-fullscreen
>> +endif
> 
> The explicit --enable-<foo> is apparently causing problems, due to bugs
> in the upstream configure.ac:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/issues/112
> 
> Could you have a look?
> 
Ah, that is odd.. I'll check it out, thanks for the review!
> Thanks!
> 
> Thomas

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
