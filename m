Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BB3C36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 20:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C2F606F6;
	Tue, 25 Mar 2025 20:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EU44lEVXLQd9; Tue, 25 Mar 2025 20:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 612AD60780
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 612AD60780;
	Tue, 25 Mar 2025 20:19:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F0E11B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3A2083388
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cLJWFQ_kZMb for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 20:19:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 62FA383365
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62FA383365
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62FA383365
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:19:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so42426775e9.1
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 13:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742933951; x=1743538751;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=64UZlO64q8zNG182M+YWGDPN2BRCXXT+2QhjsxIta2U=;
 b=qackreBZlkQp9Vne545dZg9DqKtVnecz3VzJSMkG4OXkN70BY0u0k9F/E8thPfGEfK
 +mB4IDi9NDXaAgopDY+7IJqP1f7JnRKKB8Fgb0P5fnwOQ+w/lrDNGuoVafm8fomgNGi3
 MpoCIUN/24ePs7LaxIr7pnhIKGGHRe4XVR8nlae7E6GHyeBa7BYTViBgyTZuFti49y2V
 WzpCQdajNYRv7gC7nzlQi+7KFHzJQ3vPFJ+JAtfj4keiWKGKgdzctaeZRHyGzxp4yhR6
 38TnrR/oJF9DQt4wGXbQHFibDYRmWnpW/HnTZyn6lFT73xJpMypayvH4WqOMd4Mv9WKe
 Ot2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDpB+hCo9Gb7lTrWKFH5ILVatDo3Oi+N0wwOBiHcSoJxGyJ+hG/x61t+9t6vkOEH9T49iO0bJF4KM=@buildroot.org
X-Gm-Message-State: AOJu0YygfyQXaQNa7iFQQMMl6aZC0sAsMQjJVH6AfIk/W0mFuPN1bgaA
 JZofOcIIgiquKw/mMm+aTdip+ghQSLp9k5hgr2t4oEHazePSv9GvflHSA6yrMGHaJ3tcVrOGeuK
 X
X-Gm-Gg: ASbGncu0m695P30sJanndvoS6hmpGvRAo3zOunyRk4vF1flYSbFiIYfS0lFhDhN07Zy
 aoLDRwV1wP+RB2ucxGKBvuw3LDMc2FwkUtqH1hpvKxQatgZrqQZKme+nkY7nn1lyV+x1X9/GbLY
 q2ZoEtE0lCBcDda8BJ769F6hffi1CO7RDCdjgEi/0qzR4e9oKnoovkTBF+6TB3gLYOSeLKTcr5z
 qbbXYKqBIxI3pxC0JQe/c0Asq2t15one7g3y3sM/ZMHAx1mUxeGF4uwrYDmhP/uGHV+lfJbEfQa
 rKPPfhnlNLDBDLq7l91C9EbEQwWhH80Eacne51TC7nCnx0OJNgrnrPHYDLqQCkIAsPmPVcfkdpt
 su/3QaatiFmvTuZGdwF311Rk9BL/J+z3KSWok8R9EJ11wrB4Rf35FSQ+1RM3nu6Kv9NWt3VqEUH
 M=
X-Google-Smtp-Source: AGHT+IGcZokqCj5xM4RXrDolNJ9D7hmv16Z/LQki/yZNL8h79LkikGUj1RFJH2j2Ok/KSwoE/FweYQ==
X-Received: by 2002:a05:600c:1e0f:b0:43c:f050:fed3 with SMTP id
 5b1f17b1804b1-43d509eec2fmr204838395e9.11.1742933951373; 
 Tue, 25 Mar 2025 13:19:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f32fcdsm215895115e9.7.2025.03.25.13.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 13:19:09 -0700 (PDT)
Message-ID: <024aabe1-f252-47df-be78-34c1ceb59211@mind.be>
Date: Tue, 25 Mar 2025 21:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Knight <git@jdknight.me>, buildroot@buildroot.org
References: <20250319043935.7756-1-git@jdknight.me>
 <712727dd-ca6e-4646-b335-cf1aa99ac3ea@mind.be>
Content-Language: en-GB
In-Reply-To: <712727dd-ca6e-4646-b335-cf1aa99ac3ea@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1742933951; x=1743538751; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64UZlO64q8zNG182M+YWGDPN2BRCXXT+2QhjsxIta2U=;
 b=HzYscG9NxcsjMQtJCLiygR0YcfjudB8XBjEQQG+ALarhbk7zGC1HmD0a3iFncZ5afr
 qZhIhtTENcmhdjYeiaM6wlwQHOiEWectn5awvLkxR4dIhD8quHvMB2QA5EErhb24ceR5
 +KQknFlVEM+ctAXGygiPDTnpkaJ1T9SeYolOVd52nSgrinmxmC+LlYzn7sT8qK6nksVJ
 QO0ahejnRf1FgnmWoROeuS4vYQhDYPZGW4VRiAywKT200z9nQJqlO2Vr/Bk8QXnzVmzZ
 GPeq0FGzWLPGYhgvf0Q79p0LCQGKJSATPR7Eu9jQlEV5/XNQk7lP8YJlt5DQzbgXXYmW
 dsJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HzYscG9N
Subject: Re: [Buildroot] [PATCH 1/1] package: add support for <pkg>_SITE_ONLY
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDI1LzAzLzIwMjUgMjE6MTUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgSSBt
YXJrZWQgdGhpcyBwYXRjaCBhcyBDaGFuZ2VzIFJlcXVlc3RlZC4gCgoKIMKgQWN0dWFsbHksIGl0
IHdhcyBhbHJlYWR5IG1hcmtlZCBhcyBEZWZlcnJlZC4uLiBEaWQgeW91IGRvIHRoYXQ/CgoKIMKg
UmVnYXJkcywKIMKgQXJub3V0CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
