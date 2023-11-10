Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39B5C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 18:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CB8F400B8;
	Fri, 10 Nov 2023 18:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CB8F400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lrt2iKMFHmvp; Fri, 10 Nov 2023 18:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7933140949;
	Fri, 10 Nov 2023 18:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7933140949
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D502E1BF955
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE0B083BED
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 18:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0B083BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNo4xsozywmv for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 18:56:49 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDD7F83AE0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 18:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDD7F83AE0
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53e751aeb3cso3798670a12.2
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 10:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699642607; x=1700247407;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pbKJdfcmhBNN8OSSe7XhBToUkp6mM4YI92zL6/yJ/Nk=;
 b=Lx4bYohniseLpEPdS4gfKpo8tv7dhDN9sgdXkuDW1lJIBFY1U6rdWC4ku1q2QPhTDl
 azXltOtCuC+1HRHsVFQVxtXah/JkLOkwbotUM/KBn0h7mUz4e9UengzWyttwhjri5O3+
 7qMRTIME11q8nuAB3iXEPpxPNjSLdDxVO77Kq2Bl+0Tqvp7E5Oj0A5FUyJOAePpnG63I
 hAEFrXyKF6Sm1MKM/mVdWum90NIXax289vqm0ArRjjD6PbQgWk6llYldEsMrKKND3i8i
 rsJlSTP801mxNaipXKzSogKmILP/23O0ChNB4DusGBNsaDvV8p1IM1Vl9rP5CKd+7fn8
 dFqA==
X-Gm-Message-State: AOJu0YxE0iKC0pCBi9py7coU2UB4yai8OZ7zlVxe4uZqAWZKkx+lQOb+
 +YSLcPI4ZLdg64n49yvKUHaun2yzY5r/XiycbGE=
X-Google-Smtp-Source: AGHT+IGnb6XZBlpQOzXhEYD7YPR3knP9l31IHhe0dairWDWCC66u+pmend45twQcg9kMDv0fjHgraw==
X-Received: by 2002:a17:906:340f:b0:9e5:d867:ac72 with SMTP id
 c15-20020a170906340f00b009e5d867ac72mr1836447ejb.77.1699642606563; 
 Fri, 10 Nov 2023 10:56:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 lt24-20020a170906fa9800b0099d798a6bb5sm4296472ejb.67.2023.11.10.10.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 10:56:45 -0800 (PST)
Message-ID: <b04d5636-191d-4102-a6cc-83997aeb3671@mind.be>
Date: Fri, 10 Nov 2023 19:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?= <buildroot@buildroot.org>
References: <20231109080919.530366-1-jonhenrik@qbee.io>
 <20231109112504.34c46c6e@windsurf>
In-Reply-To: <20231109112504.34c46c6e@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699642607; x=1700247407; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pbKJdfcmhBNN8OSSe7XhBToUkp6mM4YI92zL6/yJ/Nk=;
 b=SNalvhMC2UJhDKoX09aJ6mP9f2ktf16lY63bdqakShUNQNxbidt942+/RKjTKOMgqp
 qkib+9e21iH78MpIlIFBTRYy/QlxZGsYi2CuQxMBixRmiqzlyFZaBQUpkUf5jfeZVrLU
 +L2vDpraQ7WyWZ708vIyXALyx2gMkOfdUsZ5LiWh05z0zF/VTNjZ+lkqtH7u7nLCNtEL
 NinwMCvVmTU2FmkyZm2ZL+lidvaufJRO8WxKXR3denA3khGtLI3cc5dJTbHFs84FiDDW
 hOwGtaqsYX515eS9DwjNwosilzNb2dKTDzKGASt2EsO92kAz/k5ng8UE/u7XPyIUQElR
 ji5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SNalvhMC
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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
Cc: =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/11/2023 11:25, Thomas Petazzoni via buildroot wrote:
>> +	$(INSTALL) -d -m 0700 $(TARGET_DIR)/etc/qbee/ppkeys
> No need to do this...
> 
>> +	$(INSTALL) -m 0600 $(@D)/qbee-agent-$(QBEE_AGENT_VERSION)/share/ssl/ca.cert $(TARGET_DIR)/etc/qbee/ppkeys/ca.cert
> ... just add -D as an option here, which will create all needed
> destination directories.

  No, with -D, the mode of the directory will be 0755 instead of 0700, so you 
want to create the directory explicitly here (that is, assuming that 0700 is the 
proper mode for the directory, but for something called "ppkeys" it sounds that 
that would be the case.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
