Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E384CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 15:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F08E8218C;
	Tue, 16 Sep 2025 15:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 376NZljY5z7E; Tue, 16 Sep 2025 15:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5045F82143
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5045F82143;
	Tue, 16 Sep 2025 15:20:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1573199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 15:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A76B740E39
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 15:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57mQMX2o8vtH for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 15:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A113C40E37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A113C40E37
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A113C40E37
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 15:20:32 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-b03fa5c5a89so921509466b.2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 08:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758036031; x=1758640831;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BpADpt4LwWZTmSks9iexkjKVQAw5d0TXwEnpY0SQhpM=;
 b=Q5OHuNBYwqtlRwgtCgAjrBq+6gXbbtM+OCgQkmqpjnBsEfiH+cnFsNEbn4nQzP4GuA
 Y4e7E1/UhN8M2WAChC04PAIJ63YUR8k8SiXF4tokPfvQC7o6NM4Ah17Rb0C+ucKbqtIW
 JhoRpMHSKqCA/0/r0g5J4QWXC3U0elT16fZODIH57nH4xaXFuYKBXwrQ0EFOITUYkAIr
 m8AnNuJFejvJCTxqweQ8SWGo1qcs+HSzdhsEMQ2f9RH3nLewLc+EXj5V5aXOZfnUrtCm
 VNcYVyhTOGW/97NloaxdSfQOVvtdOP+QNt1UWWneiOcGU91e1bwmkez2jd++T2NCF3Aj
 f6YA==
X-Gm-Message-State: AOJu0Yxv0rmMnyNcqo0yJffdu4NZLuXGvwLT6OUaucroKZnW4xRgj6W0
 QBi3ZlIRc+x80pohrmUnoMW5c76HzJQL0szL0aM3YF9I6OC9ytWNcl/FY7/moDMAi4i0ktI2G+T
 xWbpRmIzBzg==
X-Gm-Gg: ASbGncvf8iUxLH6P2K9nddr+ZvtSSYF326I+MWoI7d1O3Z1I/M8d1Rk7J27cwM/k61Z
 ftT3le77qtarJ0lHA+CCcc54eaeOYrPV+FQgvliNXz+0jcTkMmOurp0BM1hvBCT8QOZXdM4W9Xy
 e5gyLtLMrhniqBgDOTO0GV0aL64x9mbhZSigLJbUncvNATr6+qPqHUlnnpCtIbuNob9yXoZAYcL
 vpNoxvygdiQZ2n9C4rGtgkEmmmOAyUrkgdR5eSjrOMQzAF88cjuiRnmNKDzU3zKcVjABPQ4tAX5
 3kXA6JlNXye4ogDIodYaK1bhgC251vspGERHMPzTzyU3d0lSZs3a7r1j3YnoqgJnJDLp+ik14jP
 fQ3/S20bjZklSQhFH1B8dd7rcvFzRcmyaDD7zhosRhCxhXgNtRK5+aijggqKRhtJnqnQFwSgbIh
 bnk0ZSw3I=
X-Google-Smtp-Source: AGHT+IE4malD/VdRuxkqKAK35zpoZ99MMeBm32VDkjNNg6E2XVMxmjkhNlD/UpryGdmU+W4XxkbDxQ==
X-Received: by 2002:a17:907:9617:b0:b04:c7c5:499d with SMTP id
 a640c23a62f3a-b07c3833a41mr1584980066b.47.1758036030481; 
 Tue, 16 Sep 2025 08:20:30 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:73a7:c001:49b1:76d4:3e52:5347?
 ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07c28f190fsm990173066b.39.2025.09.16.08.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 08:20:30 -0700 (PDT)
Message-ID: <2ae3620a-cd9d-47f6-9f7a-0734bf867eb1@mind.be>
Date: Tue, 16 Sep 2025 17:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20250915132556.47191-1-titouan.christophe@mind.be>
 <847d2ff7f402a465c8d2fac38be47ed3@free.fr>
Content-Language: en-US
In-Reply-To: <847d2ff7f402a465c8d2fac38be47ed3@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758036031; x=1758640831; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BpADpt4LwWZTmSks9iexkjKVQAw5d0TXwEnpY0SQhpM=;
 b=QKKw8b1o2NxKiTdHLFSTgmA3rcGNf6pJVk5ZZMpvqRvly+00Lfp3MVX6wUAh3ZoG5X
 U3GGttZLwiTaaAtKGMcB4K5rAccpAloFes31BEj0iIf/RIyNsZHi3RAXs7+BeQRtW0fM
 CZ936BFFKMMvjOaJ3fKIzwMlr14wu6Rmv/ALamyGrL15zghisCUKtzy44JlKE1jIllKB
 0eby7sAplrdy1WYnwrkczfshZFQ9aKMOp+ISTIlfMmMNGCAMN3g6X2pSK+QR2HivMrcM
 wCs0a30q0IUs+gHRP8FvKfNocJNMERlOm86x8BGb3uTgJ/W3NApGMd/CjtBpGYAchzGo
 JbRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QKKw8b1o
Subject: Re: [Buildroot] [PATCH] package/python-flask-cors: fix PKG_SITE
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

Hello Julien and all,

I've looked into that issue, and it seems that the license file is no 
longer distributed into the source code archive (see 
https://github.com/corydolphin/flask-cors/pull/380)

I will therefore send a patch to remove the license hash.

Regards,
Titouan

On 15/09/25 22:27, Julien Olivain wrote:
> On 15/09/2025 15:25, Titouan Christophe via buildroot wrote:
>> python-flask-cors was security bumped in commit 04cd135b26 [1], 
>> however this
>> commit did not update the _SITE url; which changes with each new 
>> release on
>> pypi. Therefore, downloading python-flask-cors would always fail.
>>
>> [1] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/04cd135b26406dcc31cb66af1480d53fffe81e59
>>
>> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
>
> I applied this patch to master, including the comment from Yegor.
> It fixes the source archive download.
>
> While testing, I also observed that the license legal-info is also 
> failing,
> running "make python-flask-cors-legal-info". It would be great if 
> somebody
> could send a followup patch fixing this.
>
> Best regards,
>
> Julien.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
