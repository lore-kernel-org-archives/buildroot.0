Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49152C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 11:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C82C813CA;
	Thu, 24 Nov 2022 11:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C82C813CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rleJwv5yJqXe; Thu, 24 Nov 2022 11:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC86081D18;
	Thu, 24 Nov 2022 11:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC86081D18
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C1961BF48C
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 11:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6680581D18
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 11:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6680581D18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDR5JJykoVQ6 for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 11:49:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A3E7813CA
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A3E7813CA
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 11:49:19 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id i10so3614042ejg.6
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 03:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b8x3WjDdgVqWPrOnvxxNi4LhoVPlpNepO4p4dfeYMbs=;
 b=bwIPV5nL2HvsXhVGE5UWe4kTBtklIy8xsUmDw4+a80Q1yDKdPxMtFPVwNTTboEbDAI
 OwS1X6mbIuM1O331sCzANgh9TfAajwI4s/Y4DJPzPuzU2Q0E2pKy2ctud8nhI24eyf9g
 3y6MLtr8Ic9AbwdlASzmlAtD6G30hy4nctSRv/OHBx0ybf6aVh64YPYSHanuC9lk6zTX
 Com0M/iRvalYrotCMYLQL0oGnLfu0PNOhT+WaowcXNutf3utF8WGz2ieP3eMv8KrG38v
 5Eb+zYqym2vofAKeys/wzhc05gaj8WnVXUvfM86J9OWRGwyeHUVM2xzit3HckjZoinz9
 y+Zw==
X-Gm-Message-State: ANoB5pkX7bLX6wMzdBaBhreZrliOzo7vMQ+IiuISWiOTGSaP8HYKK6Et
 svQMzYWHVTsON/P+X5fiN5rkEA==
X-Google-Smtp-Source: AA0mqf4e185z7Mue1B+TNF5YVV7CloBqhND5WQvE5LQ1DfAYNZgr/PqXA4cJt+QRX20E/uJkc0d9Qg==
X-Received: by 2002:a17:906:9f11:b0:7b4:7758:f1e1 with SMTP id
 fy17-20020a1709069f1100b007b47758f1e1mr19390204ejc.145.1669290557153; 
 Thu, 24 Nov 2022 03:49:17 -0800 (PST)
Received: from [10.1.0.116] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 s5-20020aa7c545000000b00458dc7e8ecasm419686edr.72.2022.11.24.03.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 03:49:16 -0800 (PST)
Message-ID: <38660b17-3747-336e-87d6-3603aa55e379@mind.be>
Date: Thu, 24 Nov 2022 12:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221115235235.74897-1-abrodkin@synopsys.com>
 <20221115235235.74897-2-abrodkin@synopsys.com>
 <20221116085427.3525bbcc@windsurf>
 <IA1PR12MB6210F02877F05C126179D5C1A1079@IA1PR12MB6210.namprd12.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <IA1PR12MB6210F02877F05C126179D5C1A1079@IA1PR12MB6210.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b8x3WjDdgVqWPrOnvxxNi4LhoVPlpNepO4p4dfeYMbs=;
 b=MxSiqR8xaGzXfDd4DzRbgpUNueCw8R6y2DRCuMzFNOao7ZB3XvvQpp7ffzFK2jAGyA
 awkRCq/3cX3d4gObkCrBQezLQEjUtSALnqRNEFYOQdwvwyQVL5qVLThI+eDZ7i06MeTY
 CqGdI1WX2gCx7zbhQ2ub2zfuExtGNFSEtFlAjG7zACwPOKePrHbROaj2NMrUhmvPxTec
 W5gPp/fADNAk+22tnoWadO5HexWxfl/QqCDclxFnhHroBfyFMYlZ3tfLqKTyEQomIk0a
 4qpL/KkOk0I1CPhHUuNyYmiQZ8qNzoWQEu5+X3GvF/BGWxIyK2YBbwwxuU9Ms2AwnjWe
 UHKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MxSiqR8x
Subject: Re: [Buildroot] [PATCH 1/2] package/glibc: add support for ARC700
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
Cc: Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/11/2022 16:33, Alexey Brodkin via buildroot wrote:
> Hi Thomas,
> 
>>> Even though ARC700 glibc port is very close to ARCv2 port, it is formally
>>> another ABI that requires appropriate maintenance. That includes running
>>> extensive glibc test-suite and fixing discovered issues and regressions.
>>> That effort was considered impractical due to ARCompact ISA reaching EOL.
>>> Besides ARC700 processors are usually found on very resource constrained
>>> devices that tend to use uClibc if they run Linux.

  This sounds very much like we should use uClibc in snps_arc700_axs101_defconfig.

>>>
>>> On the other hand adding ARC700 glibc support still can be useful for
>>> development and testing purposes. This commit adds two glibc patches

  "Development and testing purposes" is really not making a strong case... It 
sounds like the only reason to keep those glibc patches is to be able to test 
glibc, but you don't want to commit to really fully support glibc, so what is 
the point then?

>>> that enable ARC700 support.

  The cover letter says that it fixes something, then the commit message should 
contain a Fixes: line so it's clear that this patch is for master, not next.

>>
>> Hmm, this commit only adds one patch.
> 
> Correct, because that's all what's needed for ARC700 to be supported by glibc
> as good as ARC HS processors are. Seriously, there're just a couple of
> instructions which need to be changed (like use "trap0" instead of "trap_s 0")
> and dynamic loader name is different ("/lib/ld-linux-arc700.so.2"). All the
> rest is some configuration/infrastructural nonsense.
> 
>> Also, what is the upstream status of this patch?
> 
> As it is said in the patch itself, we decided to not officially maintain ARC700
> in glibc due to very strict rules in the upstream glibc community for supported
> architectures and ABI's. But given minimal differences compared to ARCv2
> (read "ARC HS") port, IMHO it's practical to have ARC700 support "downstream"
> with a bit more relaxed requirements on maintenance activities... which doesn't
> mean I'd like to throw stuff over the wall and never do anything about it.

  Yeah, what you're saying is: fully supporting it is a lot of effort because 
you have to run all the tests every time glibc is updated (and there are 
probably tests that will fail because they're somewhat fragile). While just 
carrying those patches is probably going to work for most people.

> 
>> In order to make sure we can easily update glibc, I'm not too fan to have
>> patches that are not upstream.
> 
> That's understood, but for many releases that change was equally applicable to
> newer glibc versions (as we touch code which is rarely being modified) and even
> now I re-based or refreshed this patch from 2.34 to 2.36 automatically with
> only changes of hunk offsets (for the record, even before refresh, the patch
> got applied to the current glibc in Buildroot only showing patch warnings
> related to offsets).
> 
> That said, if you're not comfortable with the current maintenance status of
> glibc for ARC700, we may drop it and limit ARC700 to only uClibc, otherwise
> let's keep that patch until it seriously get in the way on glibc upgrade etc.

  I don't see much advantage for Synopsys to spend any effort at all in 
maintaining glibc for ARC700. So I'd simply limit ARC700 to uClibc. If in the 
future you encounter a real use case for supporting glibc, then I think we can 
carry those glibc patches - as you said, they should still apply. But until 
then, I wouldn't bother.

  Regards,
  Arnout


> 
> -Alexey
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
