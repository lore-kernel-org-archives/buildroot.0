Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEE9C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE21D605F7;
	Sat, 22 Aug 2026 12:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eaqGSQoFJ6zd; Sat, 22 Aug 2026 12:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787400733;
	bh=HSCkeSFMTz6IxvHPoEDZR0p6BWBnrEbnVsd14oMFHXU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oXjqh5a4H9YVkgJVsTDlhhp6COvWQBx8aM0hpXIQ3ozAPwxQmZ3qYP4DzueW//utD
	 8bO3lmfKZLQIxBsaPgQq2lldUe/tTfoDw6Wulv2vmi7FlezNkIR+HN0eGtL9nUqq6i
	 s2Jguztq6Hfwn8SFaPPqQy5MmJ7vDNR4XSsn3ssBwROXdrRd5xTKFubPDGwlnemARU
	 Oa7bZgQ3tqiTYpccMObJDhiQaAv8TSiVnXzJz+UDScXC4bpdsduMns349yaS7zeBqw
	 toXWjfedRZifXYvJgNN6FH86OMVMReeNLDaYze30PR+xGVW6lAvKwgwbAT+EsyJaJw
	 24UmB7zpdoQlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A069605D9;
	Sat, 22 Aug 2026 12:12:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78A3629B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E9B980DB4
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eHeXD8wc7W0 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97F8580C09
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:12:09 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6a3efa2b38aso3590381a12.2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787400727; x=1788005527;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UuG3sFCnu+jpBdujtJiN0U6CzEzUlBNZcSjUiFJORW8=;
 b=DK7TwXo+VFfq1GPwIjzq+Ak1h3sFmwCi8WosOCvxctgAhW9mHSAnECC00eBKv5idaw
 RpaUJ+o2XotNgcQXAuCLmaIL1xwIcyAKlLKkd1ztTTeR7yrAfvdG36rtlgIHpH0K+WD2
 RNbWo8pSSmPRaIcFIQiHObH65gmd3Z6CgIHTLYPVxP9gVJA/tF7ibQx4c7QQ/ntgzxEg
 JCYXwA1fpGOdZQrC5Mh8Yxq54AQlP2MUq/g9YVeP/rB3N12UsYTxKXNRv9PvU6uEQHGd
 bR9MaSKpR+mRTTtzv2BJUs6pa3DAySRi1MvARRkICkQs0Su9tIA5I26h3EM7jUg83Obz
 5AcQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRdb9VSYkJMylryZCDaCQDb/sVco7/96Tsifd6M4dST/vrLymnu/Bt3m0GkKLvp1NH5gL9uapfgOY=@buildroot.org
X-Gm-Message-State: AFuF++mv1FHJQfOYjgJOXDt1JkrQustWOyvopBm9PCkGmuJifwIYnlOm
 xLUSVQim+9tZfjBTWyFKNxmMeVBWMOGJCCRljwvjT3AbdPHjGV4jneJjIqmAs2CDXbs=
X-Gm-Gg: AR+sD13KdTsgxuFMuvyyYs3xFts/lQlUJeCmS72hbjXrwGdVEIo4nvOmLZZ4fCPnIJG
 E6B0bcklXyEraygdwYLiIH6dJE1WoXP8bqWNOKBJa38B1xFVYTBfiPOmeASy7illkwglfCTCKs4
 tFvvRLoHtGW7ychrvGnpilIy0wiB2ZVIvkxAaAXJAqQzhGp6c+lUcc8rVCGnVutl3KH08AIjrJ4
 A8fbutXcIcXaFpKAADyIk88OSTTXGdygmb2bmgLIc0zru+JZxg+9ZoHwHps1bV/2KYTMZo2lAIp
 +d2nqYmWTw2qduefrXEg+MQ37AlCrPMWLDk3pVro/dxRWDOz2x/CmWQa/qS0GCpS9vh4Xj0OFVv
 kG0izSmq4Hek7VKrTO/JajRv3Xi6XAM54AcLKiaDdjTYzOscmBY1fJ2bgI9dHxhtBb6KlIrhEXn
 JkC7e3b0ONqVnxE1r/IaXDTpBZzygPUw6+ohrqQHljjOBj9OTs9lOPVIKUtj7YYJ8pS+F2Lgeq0
 7++jr/aEmoOGL4/Vt/SAIfq0gAZe07LOw/dN2m7jkAvgFMS06/IN3JH8Ts=
X-Received: by 2002:a05:6402:27c6:b0:6a3:f34d:8f67 with SMTP id
 4fb4d7f45d1cf-6a42f19fca6mr13874650a12.5.1787400727049; 
 Sat, 22 Aug 2026 05:12:07 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff1780c9sm10968523a12.28.2026.08.22.05.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:12:06 -0700 (PDT)
Message-ID: <e3d918ad-70a3-4620-8e23-1d0dd322e49c@mind.be>
Date: Sat, 22 Aug 2026 14:12:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20260812191243.3735751-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260812191243.3735751-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.9
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

On 12/08/26 21:12, Bernd Kuhls wrote:
> https://github.com/libarchive/libarchive/releases/tag/v3.8.9
> "Libarchive 3.8.9 is a security, bugfix and minor feature release."
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
