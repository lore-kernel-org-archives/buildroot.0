Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9373C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C6583A47;
	Wed,  5 Feb 2025 14:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ur9mjvnXTJp3; Wed,  5 Feb 2025 14:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75E6383A49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75E6383A49;
	Wed,  5 Feb 2025 14:34:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5007A12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29D00424D9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGs6k6BqFBfZ for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:34:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BEC32424C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEC32424C0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEC32424C0
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:34:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso68165595e9.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 06:34:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738766092; x=1739370892;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K0eKJtYpioTQGYp7hCAZ3XfTBveXDDfNO7IvlcG9jJs=;
 b=lmWRWsihGfkYv7pSOm7S8dyj3QjCAJAI3NttPSQVOZfmefHLiXCFGahc6WwGGk4ykJ
 xhKSSuidLAo4opd6csgQAiOn+KNtZBEC08X8E3J6JuzmOSPS8WWvPulP1Zh3Kw01CH/W
 mxkgLD708ojnI/d61b0c/CLnzX00lVFFwBbyn92+vmWFEq+bSCqKavN+uQyBcUOBf09I
 oBCQ8IaqFjJDU65Cxhk5VtrHQGEs+YU0tBqXGl7wxpo+DRp+vjAxVWgXMjXr4hm54jfS
 OsWI7CUiu4/RNUQrfyLzOMA9J3cu1PzUsd4tgAOJLHw8uZOPLWb6qoe3F3/Z+/0EK/Le
 iI+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPkZtAgGDOgYwEm1h7qAcxsXVp8NqgqDG/SJ97+Sd2xgYQsWKGH5IZlMTWErclfqQCPrUQL2+3Gak=@buildroot.org
X-Gm-Message-State: AOJu0YxYQ1k6OXFtLlE8oVbOoTFlD/LBmKKR+kJngIgNAaweFhgwTIMG
 L3Vc3OrHLzL3XEd7SyhlxX0IEeevbJsv/aRbjzHZSlWgM0kpJuHdgH1a1TmRmxA=
X-Gm-Gg: ASbGncskSXuS520m5noHFFZ4be+liFj47pUlk+5Zu8dPoe3quSMA7SmxtlETTnag2tB
 ggIJuuKoI2xhSU0W/OdDVDT1UlzoTAO0P8jyJvTsAO7v1t3uWsu2gpJDjdkO7QtzgnFlNznF0+D
 unJrd3cdoe5QSLLHB5c22drGCE08QFtlR4Sx/d/fjB/cr9rfmO8HWkV4BIHV+HyzsM0rBRp0ICU
 eVxTLWrO8AKVnSbFLL2zVHqOCPPuf2sga9E0wcSwJiuAhVAJsy1ExL1FKzmvuDhjd1IgeSmMzxY
 SDBVohIe94E8BUazCWBUgFopbeTITwnb02ebIn/WiHWoeYg=
X-Google-Smtp-Source: AGHT+IEUCghSu2vMkby7fZjQT4mUdTq+U25IFSaSUnT1fnAY5DmeT3usDlLByihZ/WTm5Iyg/0eU4A==
X-Received: by 2002:a05:600c:5687:b0:436:713b:cb31 with SMTP id
 5b1f17b1804b1-4390e17e820mr22084655e9.3.1738766092579; 
 Wed, 05 Feb 2025 06:34:52 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf40asm18800152f8f.83.2025.02.05.06.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 06:34:52 -0800 (PST)
Message-ID: <a9eabd37-b65a-41d5-a7c2-2b1ce54ad8b1@mind.be>
Date: Wed, 5 Feb 2025 15:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Julien Olivain
 <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20241107191634.378670-1-james.hilliard1@gmail.com>
 <20241107191634.378670-2-james.hilliard1@gmail.com>
 <e332ee2d-da83-4134-b57d-4079fc086253@mind.be>
 <699ab-67a35e80-5-3c0d1ac0@151826379>
Content-Language: en-GB
In-Reply-To: <699ab-67a35e80-5-3c0d1ac0@151826379>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738766092; x=1739370892; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K0eKJtYpioTQGYp7hCAZ3XfTBveXDDfNO7IvlcG9jJs=;
 b=fJvnEOBsGHDTXmVGAD+8VbABKFbyh5FPaEYs5UndOsv2ZCIh5kY5MB2uBbabsODH0a
 erClBmJJWeJbdoOx/JC6UduSfUp0RGQztFOf5Tuk/IJM18TI2pwMMTvS0sNPeiLgfm9E
 AO63mmqZHZP3zLaHHbyB7ySAzsDAxEY9w1HU6VhXAc6u6wrtPtI6iDvE9aRIZiImWHFf
 R1rCACQXoot5zBEsaff3Ale1mExTMEjp0aPkmTwO1+NZSHLQb7mOyzfTPY+XIhqOZOL/
 ynL1RTD2L5E+m0s2LY//uzBbmcy/pDWVcpMl5ZF2A3DHFn72f8kp56q5feuL0SpFmWPy
 9WAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fJvnEOBs
Subject: Re: [Buildroot] [PATCH v5 2/4] package/{python-}protobuf: bump to
 version 28.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2025 13:50, Michael Nosthoff wrote:
> Hi Arnout, James,
> 
> On Wednesday, February 05, 2025 13:02 CET, Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
>>
>>
>>    There are a bunch of other reverse dependencies of protobuf that I didn't get
>> around to testing.
>>
>>    Could you take a look? If not we'll need to revert.
>>
> 
> As I already wrote on the bug tracker [0] this is a known issue in ola and there currently
> seems no easy fix. Other distributions are also already keeping back updates of protobuf
> because of it. see [1].
> 
> So to me it seems: either revert protobuf or drop the ola package. I'm not sure how much
> usage there is of either. For me a bump of protobuf would be more important because
> (I'm using protobuf and) it's also required to be able to bump the grpc package.

  I've now pushed the rest of the series (i.e. the update of grpc). We'll just 
have to fix the fallout.

  There are two other ones that fail, both with a similar error as criu: postgis 
and riemann-c-client.

  I think I tried all other consumers of protobuf and they all built 
successfully. So criu, postgis, reimann-c-client, and ola need to be fixed.

  Regards,
  Arnout

> (grpc is currently also broken because libabseil-cpp was bumped as part of this patchset but grpc wasn't)
> 
> [0] https://gitlab.com/buildroot.org/buildroot/-/issues/83
> [1] https://github.com/OpenLightingProject/ola/issues/1879#issuecomment-2567133849
> 
> Regards,
> Michael
> 
>>    Regards,
>>    Arnout
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
