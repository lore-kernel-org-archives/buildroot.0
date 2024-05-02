Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF42C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCD8041820;
	Thu,  2 May 2024 07:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMHIUSJG9xQi; Thu,  2 May 2024 07:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D85241834
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D85241834;
	Thu,  2 May 2024 07:00:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 114E01BF865
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B0DE60C25
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ih4k1NnovMV for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1497F60C1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1497F60C1F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1497F60C1F
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:00:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41c7ac6f635so24670495e9.3
 for <buildroot@buildroot.org>; Thu, 02 May 2024 00:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714633252; x=1715238052;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=otDtAotLfv73e/6Z25XlBWbBGh/93dnjq4ATwAghXNw=;
 b=UL1w+Add8bBguCJdqqDDtCHtFUWZypl8aDuEkWKT6AtxJz1BYEF4KckIsA4WbUoV6O
 oi2de9tbpkVMxEMR+w+oyJRckmwoMnagweHLkZW1J1as31SmzAPRBq9OLbVy+2kZOSK5
 luD53ePrIraqq3flGLYF3sb70YN3Jnvc61peSG4d/nKSSCgF6RNEEOGzBa+x+Qzu6JtI
 S2/6K2z9zLd7Kq9BLnpu3uUAUzhDH5rlwvrA/atwJ/e51bq48p+C2pwhT4vgVxLG1SPL
 Vdn3gPOHp6VqzYMdFQeRRWeq8JqWoW7mVIUzsD+LiBMyPfvWuSX3qx3Fqc04SDXPMTdA
 rqVQ==
X-Gm-Message-State: AOJu0YyE2nC6MywWk7RPkwuLtVkZZgYBLxbDYmqrZfDfjrKp8f5AbEYh
 ATyHfggWDErKg5FXiPkqPz/kW8IUZmoTyWty5A/QolPEB88cwkRd38znvIZPCKE=
X-Google-Smtp-Source: AGHT+IH3g7rxVQt1qNRL9VVPjlOoO+xf3A4zC0SObdogfpIjnPMbFK5V+y5ZniXR/K1TMk45FZrM/A==
X-Received: by 2002:a05:600c:3541:b0:41a:c82c:1999 with SMTP id
 i1-20020a05600c354100b0041ac82c1999mr1083517wmq.9.1714633252243; 
 Thu, 02 May 2024 00:00:52 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 v7-20020a056000144700b0034c66bddea3sm480593wrx.37.2024.05.02.00.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 00:00:51 -0700 (PDT)
Message-ID: <d56f0cb8-579a-455d-93dd-ea772466e124@mind.be>
Date: Thu, 2 May 2024 09:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
 <fac4dda319388b1d32d2f105ba29d47e68c41f4f.1714243078.git.yann.morin.1998@free.fr>
 <c346128b-2e45-4e71-8adc-6754e1629a5a@mind.be> <ZjKy35uEme6yqi0z@landeda>
Content-Language: en-GB
In-Reply-To: <ZjKy35uEme6yqi0z@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714633252; x=1715238052; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=otDtAotLfv73e/6Z25XlBWbBGh/93dnjq4ATwAghXNw=;
 b=L1ypVsT20/WjXcvu3yXjb9I/fTUC1omyxFPQWGvqspg9v3atmcqMQpEfuOxOavwoZo
 7mxoVNvdP8aeiqtg8ik//QXjCjNN0+c5tsOTK6QZrf/62ehcZdXki5ZCrd4esOtIJ/dL
 FNJ4ntHVBVY/WJPbcrDnEEnZFw3BZ7axCvT9G39gNQmkCSkouHuD++T4UxiY720jSxED
 71u2krajziTfMqdEBTAU2xhP1JwJ6VtIlv5ak68QhG4TkOpcwkTJLwIKF6LVyZ+VC39s
 5hCEJ6wAKpYa0FA4TFR9oBSMsy6QsCUKrrk8qmdPOiRFmAPuCQh2fV2mgP2zDcBzMg2v
 F2dA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L1ypVsT2
Subject: Re: [Buildroot] [PATCH 07/15 v2] support/testing: add test for
 export-subst support in git-download
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



On 01/05/2024 23:23, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2024-05-01 23:13 +0200, Arnout Vandecappelle spake thusly:
>> On 27/04/2024 20:37, Yann E. MORIN wrote:
>>> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>>> ---
>>>    .../package/export-subst/export-subst.hash        |   1 +
>>>    .../git-hash/package/export-subst/export-subst.mk |  10 ++++++++++
>>>    .../05/482df734b3715b849ef4a3147a9b1b1f8cca38     | Bin 0 -> 35 bytes
>>>    .../0f/db95cf4f3c5ed4003287649cabb33c5f843e26     | Bin 0 -> 197 bytes
>>>    .../68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8     | Bin 0 -> 28 bytes
>>>    .../6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0     | Bin 0 -> 112 bytes
>>
>>   Since the git repo is included as binary, we can't see what is in there.
> 
> Yes, I did that way before the xz fiasco... :-/
> See below.
> 
> [--SNIP--]
>>   I think it would be worth to change is in order to test that no recursive
>> expansion takes place. I.e., use this as the commit message:
>>
>> Subject: [PATCH] file2: test export-subst
>>
>> Test that strings like $Format:%H$ are expanded when the export-subst
>> attribute is set on a file.
>>
>> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>>
>>
>> And in the file, put this:
>>
>> $Format:%B$
>>
>>   I haven't made this change though.
> 
> Worth a try. Can we do that in a follow-up patch?

  Of course, that was the idea. I had hoped that by the time you would reply I 
would already have pushed the series :-)


>>   (BTW, another nice change would be to generate the git repository on the
>> fly from the test infrastructure, based on a series of patches that are
>> git-am'ed and with GIT_COMMITTER_NAME, GIT_COMMITER_EMAIL and
>> GIT_COMMITTER_DATE values set to fixed values.)
> 
> Yes, this is on my todo-list,

  I know, this was more for the benefit of the list :-)

> and I have alsready testedt that indeed
> that generates a reproducible git tree.

  Note that for the runtime tests, it isn't actually necessary that the git 
repository is exactly the same. We only need the commit hashes to be the same, 
so we do need the GIT_COMMITTER_NAME etc. to be set.

  I think it would be very hard to make sure the repository is bit-for-bit 
identical, because git decides pretty much autonomously when to e.g. create a pack.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
