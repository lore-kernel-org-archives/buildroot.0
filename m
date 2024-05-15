Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26223C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 16:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6FD3820D0;
	Wed, 15 May 2024 16:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IF60OKivdcKL; Wed, 15 May 2024 16:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C545782100
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C545782100;
	Wed, 15 May 2024 16:37:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54DD01BF396
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 16:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F72682100
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 16:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CC3ZZCkVWaSf for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 16:37:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8F41820D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F41820D0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8F41820D0
 for <buildroot@buildroot.org>; Wed, 15 May 2024 16:37:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42011507a4eso29251095e9.0
 for <buildroot@buildroot.org>; Wed, 15 May 2024 09:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715791062; x=1716395862;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H4900Ua3nVNAbmrSJtB15EGwzCwSakDjSREOQ3o4DLk=;
 b=AQZBeWLqoJxolZAH6Bs+lX33gR0olShyv8QuQnpB72dXa8MO9si+1gmpzLkQYJUlAX
 +9qBoWPZdt24SA3gFmWClJMz8Uv8KeV/oMYN8h7E3ZnQ6Fa6o/7cDxGal1atHN0+1Vy5
 zy66J8xmmVLWb15BWBB4dPjJyKlz0UY24RBY4B5FJI1mVMcnzcJZ4QlW3tBpiv7g57r9
 2dwT1BePzmJakwU6Hr4xncu3NOIR5yu1HVWF7fGieYDsYBiCfpP0GIBgGEAp+IMEQHti
 wupKXG5T5rk1rdNhtP2LhnLzW0Egqv5mCXw99Jc80sQw+8Tt1ipnUKSl1wG+PMwnAWhI
 kqPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK752mPDAcM3uLZpX3GrlrHewIdHQ7IMECOFpOxTk8g/gaOXmW2HmlamCItyHLEbyXlZjLvSGoVM7y4wxG6jgmLBB6xnoiWg==
X-Gm-Message-State: AOJu0YwReXdtKtnx6WRliqQeXvLMvIINyQHZ/MJb1s+n+s+rd1LQFUyQ
 mAVxzb8M03BAv+UOazDtgqqOB6WtexO4+xLENTYJN9UlOHi8qG4RwHG84p0aGNT0j+/tgmI1ApG
 8d7k=
X-Google-Smtp-Source: AGHT+IHYySsKV3ZTLrRa8f9r7wM/1P/weN7JAZqWeO0n1j1GONaGV67xNuG+Rb37xh5tyuxjR+uZsA==
X-Received: by 2002:a05:600c:499a:b0:41a:fa9a:d86b with SMTP id
 5b1f17b1804b1-41feaa39369mr110420995e9.11.1715791062086; 
 Wed, 15 May 2024 09:37:42 -0700 (PDT)
Received: from [172.31.9.104] ([213.0.35.99]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe36f373fsm217400495e9.20.2024.05.15.09.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 09:37:41 -0700 (PDT)
Message-ID: <370e62b0-78e1-40fb-a363-aa0adff93993@mind.be>
Date: Wed, 15 May 2024 18:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <dc678054-0f96-4f69-a4ff-de669919ad06@grenoble.cnrs.fr>
 <ZkOGDJ-hOO51bzD7@landeda>
Content-Language: en-GB
In-Reply-To: <ZkOGDJ-hOO51bzD7@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1715791062; x=1716395862; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H4900Ua3nVNAbmrSJtB15EGwzCwSakDjSREOQ3o4DLk=;
 b=BzxLZYXYcpOuEziyuLETeT0OyVCG+5/cx15a+0Lm9yjqwPongsQSSlVu1/aDCygust
 wUsh4W5i1kH4e7Q4Qwt4AFWxj91kLjJ+chCwqgmLBTFBnU4/MkyXRpWXrhYfy9AAE+5/
 TZoVIpS5MnutWLugZOKl3UBPEMT4dSgO6PUUPTpsPe8mK6nPxPI4AneZl49dsyErMnwZ
 /8BgsCVZCv+xftayfsNRYUOinNrBl++UCcUh8XhvqqyZKtQfllqy7sFybq2lbIJ7P/yq
 FkZwj6m3XyBzNCOWiDF8Ui6k3zNfK5jAbro7fvdt7Bw0YKael/l5lgkrP3HcFkfUxOQq
 hK2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BzxLZYXY
Subject: Re: [Buildroot] [PATCH 1/1] board/acmesystems/acqua-a5: fix hash of
 at91bootstrap3
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
Cc: Biagio Montaruli <biagio.hkr@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2024 17:41, Yann E. MORIN wrote:
> Edgar, All,
> 
> On 2024-05-14 14:22 +0200, Edgar Bonet spake thusly:
>> Commit 5b847f88fef7 (board: update hashes for generated achives) updated
>> the file
>>
>>      board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
>>
>> by changing the file name suffix: -git3.tar.gz -> -git4.tar.gz. It did
>> not, however, update the hash itself. Do it now.
> 
> I knew I would miss some things here and there. I hoped I wouldd not,
> but I knew I would...

  That one was on me though: there was a merge conflict in that file and it 
seems I messed it up...

  Regards,
  Arnout

> 
>> Fixes: 5b847f88fef768c8e79422db4193533b3a7488ea
>> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> 
> Applied to master, thanks for fixing my mess!
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>   .../acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash         | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
>> index 3734f22c95..6edf3d3345 100644
>> --- a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
>> +++ b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
>> @@ -1,2 +1,2 @@
>>   # Locally calculated
>> -sha256  fef34111a07d9e5aa97b0840355a367f806a17e029583830e9deaa747ce47824  at91bootstrap3-v3.10.3-git4.tar.gz
>> +sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
>> -- 
>> 2.34.1
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
