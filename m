Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C59C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 17:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C193A817BD;
	Mon, 15 Apr 2024 17:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGJ2boQHRrBr; Mon, 15 Apr 2024 17:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E11E817F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E11E817F2;
	Mon, 15 Apr 2024 17:38:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75AB01BF2C6
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 17:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF1EF8176D
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 17:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVITrvazuvsr for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 17:38:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FC3981516
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FC3981516
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FC3981516
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 17:38:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-346b94fa7ecso3390965f8f.3
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 10:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713202682; x=1713807482;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=caxVIryTWKzkuzhK3izHbo3Z00nvwtYh+0hg0UtmXJ0=;
 b=byCjcKtJWcaU0wtBH7bqHOm8Qj9DB7aKl/Oj8Q+F2gzAwghYuxUjRUtKc7iohsNUI6
 gMCZmZwCE1OlMr9KjUPgkC3L7PYUX1lXZ/JF68t2vh3cMPr/K6EitBxMuOP18dIe53yX
 Ju1/ALgHO4nFxgOlk8/yOCPZk2HdIxk86Yylexz1fZPd4xeTPETSwky8CZl5UC6hbu04
 Fu2Id5PLJvvOCFCg2qA1v2nEUuFis9y3uibNNcS51dlhRPplvefQJLZGwsw315Fd/Vzy
 UoSvvM3ZOu/+eNvVy0ix9lACefdd18c7DxwS3hYBVTNDKgbkZjAIN2VGNdl7ZWXzU7df
 FWtA==
X-Gm-Message-State: AOJu0Ywyt/RD1ialREuWfcU+bmQONS4oL3dyP775CmuHH2EKv+XZFmDP
 NgGK+yYFbfaHpsJrf2MHOm0GXVsJ13NR3RSLxO2UxdtprznURGWxXD3qusQwYZI=
X-Google-Smtp-Source: AGHT+IFjf5ug1iO1lQMfzsJzDWxzPEOTA/XIFsX9qFahxSq4pyOjOxx46VvKyWauTx4/zEsxaMU8fA==
X-Received: by 2002:a5d:644b:0:b0:341:be17:2554 with SMTP id
 d11-20020a5d644b000000b00341be172554mr7657569wrw.36.1713202681650; 
 Mon, 15 Apr 2024 10:38:01 -0700 (PDT)
Received: from [192.168.1.124] ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a5d680d000000b003433bf6651dsm12693182wru.75.2024.04.15.10.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 10:38:01 -0700 (PDT)
Message-ID: <f2bc83c5-c77c-4360-b1da-73aa069bb08d@essensium.com>
Date: Mon, 15 Apr 2024 19:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-2-thomas.perale@mind.be> <Zh1ZciOBMxTssprd@landeda>
Content-Language: en-US
In-Reply-To: <Zh1ZciOBMxTssprd@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1713202682; x=1713807482; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=caxVIryTWKzkuzhK3izHbo3Z00nvwtYh+0hg0UtmXJ0=;
 b=Swp5/8CEnEDkaGZZt3xFlsRtZkkVqb5NRihkRcWt80YnN4zwAZPXWOJZsntvNMG3fU
 nLVUa92XiTtmNzuEAVCG9QHfRE8Kqjyr+rr7mAa9tjMQqq9gEos0t7nVMJ2By7P74R6l
 3MjbTm2jaJEnVQb2k+dtauvp6H01v3CZLxlb0hAmzKdvxfCjRU4HJCTk7CSJBnsVAuaD
 WitoFAb/16g90zCR1KgXipePqqBEJI1PqraV4d+JQLlWs2qP80ovPxo3Ze1eW1vQF9Rm
 IqcECCxO9FAKbpvYqn+DDFGo3qpB/iB0FuH/iLrqyhVwP/0VQculfJNP+HVDHW76/YhF
 XmPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=Swp5/8CE
Subject: Re: [Buildroot] [PATCH v2 1/6] DEVELOPERS: add Thomas Perale for
 'go'
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@paral.in>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann,

Please use SoB @mind.be.

I subscribed with the @essensium email to the buildroot ML and if i 
recall correctly i received an error when sending with the @mind alias 
and didn't really bothered fixing it.

Regards,
PERALE Thomas

On 4/15/24 6:44 PM, Yann E. MORIN wrote:
> Thomas, All,
>
> On 2024-04-15 18:22 +0200, Thomas Perale via buildroot spake thusly:
>> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Your From and Signed-off-by are still not the same: @essensium.com vs.
> @mind.be.
>
> Check your ~/.gitconfig for the proper user.email key. If you also set
> format.signOff, it should automatically inject the proper SoB line, but
> if you, like me, explicitly inject SoB lines [0], check your code
> snippet.
>
> [0] I use vim's snipmate plugin https://github.com/garbas/vim-snipmate
>      with my own snippets for SoB lines:
>
>      snippet sob
>          Signed-off-by:
>      snippet ME
>          Yann E. MORIN <yann.morin.1998@free.fr>
>
> (so that I can reflex-type sob<TAB>ME<TAB> for my SoB lines.)
>
> For this series, no need to respin _just_ for this: just reply whether
> to use the SoB line (@mind) or the From field (@essentium), and I can
> fix it locally when applying.
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>   DEVELOPERS | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 399b2931ff..039b803d50 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -2979,6 +2979,9 @@ F:	package/frotz/
>>   F:	package/kvm-unit-tests/
>>   F:	package/xorcurses/
>>
>> +N:	Thomas Perale <thomas.perale@mind.be>
>> +F:	package/go/
>> +
>>   N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>   F:	arch/Config.in.arm
>>   F:	board/beaglev/
>> --
>> 2.44.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
