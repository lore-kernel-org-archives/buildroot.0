Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ABDE7716C
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 07:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7DB28460F;
	Thu,  5 Dec 2024 07:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKOCmvKXkL53; Thu,  5 Dec 2024 07:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FDE78460A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FDE78460A;
	Thu,  5 Dec 2024 07:50:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 069311DD9
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 07:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C677A60B97
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 07:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-ndHkzKOVqw for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 07:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEAA860B95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEAA860B95
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEAA860B95
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 07:50:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-434a95095efso10223415e9.0
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 23:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733385009; x=1733989809;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3MXahRjhvVexe38LeHbsF2ljZcBP+F4xT/OR/9zuOSQ=;
 b=To9Bh+YAg5vPXSijdRrPEdBBEtQzGGxv24yjvJ3wh8Tgey6fJcd7Bxd+b594sXysIo
 gKnQPvoq6hs9fx4kMs9e8BXgomlIyPDvtGr1cUs9ijuHi2dnqB4wCAUsjIMOpLcZ735k
 RGvX3Rip40xp8pwzUgVqcIlzV5cR0sTf5EZODMy2R1kDWi3RKJk6Bz/1HYR/AqAi7t3i
 d/zAMZLkDnFFW3kAIHIgHH5/ZM5TA1swOKeJglVsmhAoQG6qEJJLL5eyIvdSqkCMlT7d
 4BXx11wfWpjpP4OQ/gLy6nmk7LONQF/mjPG3SuDsOLTDkp4KQlT78mjBBC33o3wVwu4B
 fFSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTElp87ubeszDotL3N+wF/Yts3oFI9EBqhIgx17QirHt8yAS7187uIKvaq+QFqUC3m+jlyJiILLAo=@buildroot.org
X-Gm-Message-State: AOJu0YymRtqrxsmMR2keL1A+nr2pRuRFbO3GqhBuIyCN5VtUoT5YXs9B
 ds53YDV4QnT4j9HYD/Do9rdZgfHJ8PWYDVVx7VyAjSp/zSJcJBPP3WEFg1YdmUwr54jiu+M0Z3Z
 o
X-Gm-Gg: ASbGncv7Taectq8b6v/iLtuDvtS0sUhFfwP8/LsYFB1M3uLMCt4oMqNxr4OF/FGQQ+8
 itgYQbqfjbrHL/5EyBjNfLvv0UnznLJ+757ALQAHSRxUwAvhOCieQ8gzqdyDWp958bM0F9G0zlb
 5KdCfyVKkA+lM9j53ic0aKFqVi2esRtdRSL9eT+xZWUdjCjYK5uFFoRiVVNNerZxEcHwTMKPWa+
 25D1lcfZcd94Mk0Ki4MoZVva/4qbSTjF8lGA1jSTU9z0Tg7ROd/7vDcD41P3U2W/vCgmhHSgEgy
 0KVLdWgFAQ==
X-Google-Smtp-Source: AGHT+IHUh5qWP7GeHyHVZpCHv4m4wdC0ZPe/Z+1rcwS7TDtPb5HvNgPUa4WpFZhEI+tInRzZ6XnZ2g==
X-Received: by 2002:a5d:588d:0:b0:386:586:b39d with SMTP id
 ffacd0b85a97d-3861bb4c8bdmr1591317f8f.6.1733385008937; 
 Wed, 04 Dec 2024 23:50:08 -0800 (PST)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862276153csm1184903f8f.111.2024.12.04.23.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 23:50:08 -0800 (PST)
Message-ID: <822901a9-8307-4ba5-a5a9-39d96c30b346@mind.be>
Date: Thu, 5 Dec 2024 08:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julio Merino <julio@meroh.net>, buildroot@buildroot.org
References: <52f63db5-124e-4be0-8ebf-3c177b9f9b03@app.fastmail.com>
 <ff363f21-4fc5-4ac5-a9f6-f866ad6e523b@mind.be>
 <471d7c48-a310-47c2-b0c8-775dd4b25741@app.fastmail.com>
Content-Language: en-GB
In-Reply-To: <471d7c48-a310-47c2-b0c8-775dd4b25741@app.fastmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733385009; x=1733989809; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3MXahRjhvVexe38LeHbsF2ljZcBP+F4xT/OR/9zuOSQ=;
 b=MAlvKysvtqsKVdA3zs5tYtLxChJHUuUDz2vJr05cnHmPgdZj9dMzgnGye0Ox2ZzNn9
 UDfbwNFhNqbFuxL/+WTz+n5umogjmomnazbSN09YnirbSWEMJY9f1t5cePa3y05O8K2I
 lca5vJbRDTxRFRKEQN7i2C+1FPTarcit6kuIfb48u1Fd5ucFT155J82fqWN00g86q7hT
 BkD83wrPWAxftBvv0JuW/8QW/zJnyYk1JUvxdUb4PbY2M27xj2GWGwUuv6+53TuMtSG9
 cLKmx/qx86lxBtFrSFUUvD3T9SGGQC4j/W9vD4nM3czDgs+LBABtQ/uQkTgFRfddyJC4
 9YAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MAlvKysv
Subject: Re: [Buildroot] How do I generate the vendored Cargo sources?
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



On 04/12/2024 21:07, Julio Merino wrote:
> On Wed, Dec 4, 2024, at 11:48, Arnout Vandecappelle wrote:
>> On 28/11/2024 04:11, Julio Merino wrote:
>>> Hello,
>>>
>>> I'm exploring creating a package in Buildroot that uses Rust for building. The process seems very easy, and I think I've got everything in place... but I do not know how to handle the "cargo2.tar.gz" file and I cannot find any information about this in the documentation.
>>>
>>> As I understand it, this cargo2.tar.gz file is a "vendored" copy of the upstream sources with all Cargo dependencies bundled and locked at specific versions to guarantee reproducible builds.
>>>
>>> So my question is: how do I generate such tarball given just the upstream tarball?
>>
>>    If you use the cargo package infrastructure [1], this is handled
>> automatically
>> for you.
> 
> It wasn't. I copy/pasted the existing ripgrep package, which uses the infrastructure (right?), but then... attempting to build the package resulted in errors due to the "cargo2.tar.gz" file being missing. I was expecting it to be auto-generated on the first build attempt, but that didn't happen. Should it have?

  Yes it should. Something else must be wrong in the package .mk file.

  Or perhaps something went wrong during the vendoring, and the vendoring script 
doesn't handle errors correctly. For instance, I'm not sure what will happen 
when there's no Cargo.toml file.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
