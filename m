Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250ADC7EE22
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 13:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 760F7427EB;
	Fri,  5 May 2023 13:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 760F7427EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLkkCPUO2SgX; Fri,  5 May 2023 13:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70432427B5;
	Fri,  5 May 2023 13:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70432427B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF871BF390
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 13:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2956081F24
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 13:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2956081F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6B0T47jqjxOQ for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 13:24:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E4EF81F0C
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E4EF81F0C
 for <buildroot@buildroot.org>; Fri,  5 May 2023 13:24:24 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so3378306a12.1
 for <buildroot@buildroot.org>; Fri, 05 May 2023 06:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683293062; x=1685885062;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lcfMaYAOxN+BsUvRg+Nx+rSTweBz6fxRWAcAiIcsxpw=;
 b=Qefu1Ss5cPOBKUjvRS2JzmS8gPauRyQHOZUlNh+ZbyDZBIeLiZXV+wc4r6kwNCX+x2
 ppRr2n6hJ3ftio34zMgqvEPvvAnI2JB9yk7rot/FzVC3rX7DLYP7g+Z4CzVUJ6RiGr20
 5qZsKmjHOCmNXNjF9sQ2Vqjmo4slsRePCy2OQu3xwmDgCCku4Gdee+C7z6EDU80EQjaA
 qteGRWE0NTksmmW0WUvsqvwPqnNNA3Eyo4KUITW1oWCi4fiJHHEXQe9hf9kh+wT7qZl7
 X3aZ1PvroZRuVAGm4jx3swxyL/Eko0rXpw45t75X9L8tj41XFVh7JJK0rMU35gPltg0g
 msQw==
X-Gm-Message-State: AC+VfDyyNOOZcExno1dEiEmLz0/O49vQ/PSzn+5iv9pjNk9mryTRNNzc
 uu/V3LEPOiAep12yk2jXGo/dDg==
X-Google-Smtp-Source: ACHHUZ73+IbnyXBKuznVeWntQMHLCAQ3OMxuEJTDnqCRAxhb0ykMc5ogJe4rOIp5bQG23NVd3unzSQ==
X-Received: by 2002:a17:907:781:b0:953:5ff7:774a with SMTP id
 xd1-20020a170907078100b009535ff7774amr1094257ejb.17.1683293062391; 
 Fri, 05 May 2023 06:24:22 -0700 (PDT)
Received: from [192.168.45.18] ([185.238.219.103])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a17090652d300b0094f5179540fsm942553ejn.83.2023.05.05.06.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 06:24:21 -0700 (PDT)
Message-ID: <f821b95e-c166-cbc0-d3b6-d7afd4d017d6@mind.be>
Date: Fri, 5 May 2023 15:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>,
 Baruch Siach <baruch@tkos.co.il>, buildroot@buildroot.org
References: <87o7mz4amx.fsf@tarshish>
 <fd7fd0c9-b179-0e1b-0aa7-5039ce950d19@green-communications.fr>
Content-Language: en-GB
In-Reply-To: <fd7fd0c9-b179-0e1b-0aa7-5039ce950d19@green-communications.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1683293062; x=1685885062;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lcfMaYAOxN+BsUvRg+Nx+rSTweBz6fxRWAcAiIcsxpw=;
 b=Q3I6ONrfHBh++9lAHhCAkcavHtfTUl0KxG8SQhRSPTzwZMq+0msgsEELqAE/K/KwzZ
 Tj/8XWpfy3kSbfKkIk0BVGoN6vF7vxhlLlQ1ML33lNAal+fHsH73mMjD52WBgND498eL
 iUEJIVBxfWIFvg/D4Kt8dmmVN0UsH1uSonqNEPYhuZ/r8qCdJZa9yxuRjiAk3vTgisq0
 qF0uER1MExMRIsTdGpbPPZ8/QALmUgmHcPpR4oL2TS6n4kOyG55jwZhGL4NnER2sK9ES
 t8ciMNFhSUYtN6GAWiYy3X1VCnnwo+36v4HGW/fCEYbG5R7Q8ybSclCOb7yARhYR7//A
 MrIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q3I6ONrf
Subject: Re: [Buildroot] List of trivial old patches
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2023 13:58, Nicolas Cavallari wrote:
> On 05/05/2023 07:17, Baruch Siach via buildroot wrote:
>> package/libgit2: bump version to 1.6.3
>> http://patchwork.ozlabs.org/project/buildroot/patch/20230327121702.30959-1-nicolas.cavallari@green-communications.fr/
> 
> libgit2 1.6.4 is out and i'm wondering if i should submit a trivial 1.6.3 -> 
> 1.6.4 bump (which would depends on this patch) or a 1.6.2 -> 1.6.4 bump (which 
> would replace it).

  The latter, i.e. a v1.6.2 -> 1.6.4 bump which replaces the existing patch. 
Please also mark the original patch as superseded in patchwork.

  Regards,
  Arnout

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
