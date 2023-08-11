Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136ACC0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 06:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7406540449;
	Fri, 11 Aug 2023 06:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7406540449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODDbVWbCSsh6; Fri, 11 Aug 2023 06:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7B204026E;
	Fri, 11 Aug 2023 06:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7B204026E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 316E51BF5A0
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 06:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09E4781FE2
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 06:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E4781FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1dWUSWQ8YQ5 for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 06:51:56 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6A3A81F5C
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 06:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6A3A81F5C
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5230df1ce4fso2091134a12.1
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 23:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691736714; x=1692341514;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dQBMd5EkM2915tF4osqCQUOo2Gr38Upl1gVKO/kLKus=;
 b=GAM9YNKHsWOGxhAChEuvF/r5EUKRZjadOJCwRIkGCk7EgFrqSKgsWXQQNuyMJJM/H3
 ZLc+t8CXN+1TgCzZ7JQEe2JrY7tKaLhq3IE9P2owTdR676KHRTu+rwKl+yM0ra8aJJsN
 AW+twCIrpI++QfAfxYB3YahfW5HfFMOw//n0elzf8hTZgLMrx6eYpTsqNksPecDW1Tfa
 sPndiFG7BxGQu3V+m4rZzDHR99G4waU07cYNgoPPEITc7nFtsaFITwOL1Q5wjOSKZXno
 vnLEtva9ihAGEJKqVH/ZsVuBDbqu94fXjUP0qJTPdaDZMf2+egHJwnpezdu8RpaiZaUW
 dPvg==
X-Gm-Message-State: AOJu0YzhbnvStiaG14BAgOYRm5vxD/ZmpMWcoqIyFKJXSsnll+tnpQtY
 kGJ2J++qgqlye1jpcvfIzP0M+Q==
X-Google-Smtp-Source: AGHT+IGgzJdJM05dADrs7UpTx/SQJvWT6dg3kQQOCUqx+l3eGS3rF9UPEjSVQlatBkdBUkSPK4nLzw==
X-Received: by 2002:a05:6402:2c5:b0:522:56e7:bafb with SMTP id
 b5-20020a05640202c500b0052256e7bafbmr987725edx.19.1691736713815; 
 Thu, 10 Aug 2023 23:51:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 y18-20020aa7ccd2000000b005227e53cec2sm1685880edt.50.2023.08.10.23.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 23:51:53 -0700 (PDT)
Message-ID: <b73735ba-c570-1a92-ae40-e6e0107c5a71@mind.be>
Date: Fri, 11 Aug 2023 08:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Lang <dalang@gmx.at>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
 <20230809225901.470e0270@windsurf>
 <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
 <20230810090721.1e052f35@windsurf>
 <12cfcd50-66e4-4c03-febd-b9a259bf10d7@mind.be>
 <20230810154241.3faee0fc@windsurf>
 <2dce28a5-8e0d-f240-9b11-d3ff08604e88@mind.be>
 <88f0eecd-cde8-4069-a750-ee2cbab679fb@gmx.at>
 <20230810231234.74e65cc9@windsurf>
In-Reply-To: <20230810231234.74e65cc9@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1691736714; x=1692341514;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dQBMd5EkM2915tF4osqCQUOo2Gr38Upl1gVKO/kLKus=;
 b=gBWS/hpUqS4vkyZW8UF6ULNwdUT8GuunzgCCa6EGKQS5TG1hyhFaioO0XwX8f6Vv4P
 DGVsVfqohmBfp8wQ0QADfq1uszUft9TM2vqeTlh/wKxEVP/oFnML8Zd+BMLlIsDKc8//
 JpHQ8NQovzRCLKlCnca0kYa6TOoJJd8/X/9EaUNG0xry6Pu/zzUSW6KOn89vdpC66ydI
 V8XRX9nY1SQcSF8v6sJYYQ0iU0nY88+oCUMz+SMwnPpmp38tep3S0OC/+VUXALyv/J8n
 cxxvKU9dCXHNfAlQfdsuHDucC3W+90lLxbeVbVB/BvEsiVPL3zaumghOS5a6ZC1tvyoz
 /How==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gBWS/hpU
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Cc: buildroot@buildroot.org, Matthew Weber <Matthew.Weber@collins.com>,
 clement.ramirez@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/08/2023 23:12, Thomas Petazzoni wrote:
> On Thu, 10 Aug 2023 22:12:36 +0200
> Daniel Lang <dalang@gmx.at> wrote:
> 
>> The thing that's relevant for me in the current patchset [0]:
>> Do we want to keep gen-missing-cpe or drop it?
>> I'm asking because a lot of additional data needs to be stored
>> to the database for gen-missing-cpe to work (title, reference urls...).
>> Dropping that script would also mean simplifying the database,
>> which is easier now than once transition happened.
> 
> On my side, I've never used it. In order to have all the entries in the
> CPE database kept up-to-date with the zillions of version bumps getting
> into Buildroot every day/week, there would be a massive work, I doubt
> anyone is ever going to do this. So to me, gen-missing-cpe can probably
> go away.

  Just to be sure, I'm putting Matt in Cc who originally contributed this, but I 
know that he is no longer working with Buildroot at all so I doubt he cares.

  When it is removed, its support in Makefile needs to be removed as well (cfr. 
commits fd7312940aeffe015592396a9b24e014839e0eb3 and 
1f187371d002fb321a175233afddb50b2b6c3607).

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
