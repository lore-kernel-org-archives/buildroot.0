Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAC3C83F09
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 07:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE1D381A29;
	Wed,  9 Jul 2025 07:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOyDCGIy2Zfh; Wed,  9 Jul 2025 07:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C16481259
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C16481259;
	Wed,  9 Jul 2025 07:25:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C70E615F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 07:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B473340329
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 07:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fet6ujq_-4nA for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 07:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D58B40167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D58B40167
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D58B40167
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 07:25:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2921370f8f.1
 for <buildroot@buildroot.org>; Wed, 09 Jul 2025 00:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752045937; x=1752650737;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LSYzKim/nxz/yTIzzdUOycsrvFohKHlXCT0QdH/wh8w=;
 b=o3BiBgSGP6s13X48PCT6OE4TeAduZIB+eQyAUK2T3bWnkGm4A8B2bwfY2ZSoDCwizH
 YDXbGr4nICV9/8ldLPdsmuubTNKpfrQ+VV3CzdmTv/XLNtcidOOVgA67AzrbkOd9GHgr
 Isn23mspYowkHUNozUSlnIXY+0E9wh55LqKV/8Grq4+Y2TdqhLAs8L3nBalsmHKxURjT
 MHV4jMUDjHpBnv8uWUwMQc//ce6ryHoF+2jF0EdnTduRtTvEGeXTl/SedXfNTCBeCBjB
 D5EGXaxvL5yKYoyPhS99c3Qxm4R5ksenR0YM3Ztw53Zup8k1lGAIU1Vi/R0zxZB3sezh
 konQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEbupsB/zM9nVeLsgN65f8nKUPyI29UgOWd8VBlVYRfybtLEjgfuRa/JEbp0T7NFhw8zw8mK/aC14=@buildroot.org
X-Gm-Message-State: AOJu0YxjmcvVm1L/QDXd/bKL012HlHRq1yyXjRr6eZASA6Vr8oUrzGkD
 mf8SkTWuGn7kWNo/+W/ZmsyRR93pC73WEc5NkmifMfybcu5Dxm9LyKJpv+L3amra9Wg=
X-Gm-Gg: ASbGncsclNXwo/nLUVTgF9gcff+2MqEYj2HutS9+ZH01IN8Zu+SKLCiNm/n8CqJi5QJ
 qosze0kVrCCn/PeQtoY0bLYUtL8j2ffmyXFUX1eB3kq3LAb4grSD6R6fcdE8bYO25u2wGsFyr2+
 fnH9N29fajZ5qzuskz02si1CTjOKGGD8bJ5sbh8tPPdWw/EfDkoJrIAYMreHMwxSqSs0bcrvktJ
 VAft9IVMJ71udNS0Zz7jNHJp4eGLDEnXMuMjeK+Q5i88XCtw0KFtSt8hxEb5xe7keWOjph/BSyb
 rm6LGca3Ul3I5TfcYlQ2zR7giJcg7sZvivlxOBVaKyDsFY4VKDJ6VvDr+O5ehxG0jo6UiwU/XIw
 qddsLnkg8aHJ6W/RU8VngXNDr9Nob9ATqb13hGPVZMUC2dw==
X-Google-Smtp-Source: AGHT+IEPllfJUEAFCfLIbWpQHKUA0xKu3NE27Xhi+yO3839BLbG1OlJrY4CvkhNagDCB1dmwquN6mg==
X-Received: by 2002:a05:6000:985:b0:3a4:ec32:e4da with SMTP id
 ffacd0b85a97d-3b5e449cd59mr746864f8f.15.1752045937497; 
 Wed, 09 Jul 2025 00:25:37 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0b9bsm15151121f8f.30.2025.07.09.00.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 00:25:37 -0700 (PDT)
Message-ID: <7de5715b-5084-4bd0-b82c-e30f1e09d20a@mind.be>
Date: Wed, 9 Jul 2025 09:25:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250516120748.478a63a3@windsurf>
Content-Language: en-US
In-Reply-To: <20250516120748.478a63a3@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752045937; x=1752650737; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LSYzKim/nxz/yTIzzdUOycsrvFohKHlXCT0QdH/wh8w=;
 b=BoH4vA71u16o4vKhrePe5dHpIrOcCmQVHbfrPf/heojgu3WzwDQeJW3vleXRH7pl7d
 U0fhEMm9n7TIb0w9F2nDNqHjdIakLPVCsOl1LWlJ+VE/JODmkNzZvc67aaNB0GgBdBsJ
 1tsqfEWsm7vOsrIpPVgiMj9Vw6DPEHsHeTDZQ0Ji3EmcuH3cYY2rFYDxxkG1xOf/Gz69
 ZMkak6NAN9/9Q+qhyIPKZ6bS7WVXMIkQyFNE/kHRC2ro1F4lGLhzJaG2MdTz0WmBk7Wo
 o8ZAZWPs9Zi4WKn9Q6g+f4D784NmizbCtgQcAA1q6AN0TbTF6QvD/pp5NLiepVW96MCU
 nKag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BoH4vA71
Subject: Re: [Buildroot] Buildroot Meeting after Open Source Summit Europe,
 Aug 28/29, Amsterdam
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

Hello fellow Buildroot users and contributors,

This is a kind reminder that the Buildroot Developers Meeting will take 
place next month (28-29 August 2025), just after the European Open 
Source Summit in Amsterdam. If you plan to attend, please make sure to 
add your name on the event page 
(https://elinux.org/Buildroot:DeveloperDaysELCE2025) so that a nice 
place can be arranged for the meeting.

If for some reason you can't edit that page, please respond to this 
email or myself directly and I'll be glad to add it for you.

Have a nice day,

Titouan


On 16/05/25 12:07, Thomas Petazzoni via buildroot wrote:
> Hello!
>
> The next Open Source Summit Europe will take place on Aug 25-27 in
> Amsterdam, and will as usual include the "Embedded Linux Conference
> Europe". We definitely recommend anyone working on Embedded Linux to
> consider attending this event!
>
> Not only because ELC has great talks, but also because we are
> organizing right after ELC a Buildroot Developers Meeting, on August
> 28-29.
>
> If you're using Buildroot, working on Buildroot, contributing to
> Buildroot, or interested in contributing, you should also consider
> joining our meeting.
>
> See:
>
>    https://elinux.org/Buildroot:DeveloperDaysELCE2025
>
> for some initial details.
>
> Note that we are looking for a location in Amsterdam to host the
> meeting. If you know a company, hackerspace, organization that would
> have a space for those 2 days for ~10 developers that would be amazing!
>
> Thanks!
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
