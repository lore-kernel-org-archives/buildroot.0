Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E54C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:41:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7629960F92
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7629960F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DFBB400F2;
	Tue,  3 Aug 2021 14:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ARCVq9VD18xR; Tue,  3 Aug 2021 14:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42D5B4018B;
	Tue,  3 Aug 2021 14:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABACF1BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 995394018B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQuH7rtX-ZuI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:41:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57D8C400F2
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:41:23 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id hs10so28068034ejc.0
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MIKzH4gh0+J8sbB/NCbnrnBPZax0cD3xpZXuhHjSsz0=;
 b=KPCf41iyKhSdb4mifh1sjCdNTYIqA2vp37BjzhV8YWkgM7XiMIR75RkcJynzw2ibA+
 Frfbuwo/i7bb+OoA1+ybOwz8nPtSVQgo/wlelIfXB5eDKOl0ydHlGWSyo7Y36YHB9bpC
 H+2t/x5mopmJkNnaKwI+N8nP4SnRN370UTIINUb2EkQnGKQym41xoLeUYTnIyjQv+wcC
 aTaFqxTBEbRnVY6D/p2V/rvukehIyClQLw4iZiX7YF1JZniLn//t/zGs6fpzXiY3JPQ0
 4dEvL7GI9HPuC/rUaUjciI8NLXRv9L241O5WNOb/RnUo+l1jfwZU9eZqNJLSkzirFSG2
 CPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MIKzH4gh0+J8sbB/NCbnrnBPZax0cD3xpZXuhHjSsz0=;
 b=lkHDAMP+Bhze9dzyDvZF9SXJi6vlLeeapY0BO400zzK0dRIfo5ElmGRHPEMQAfiYdj
 apzk/RlA7Ojx8vQ98c/ceK09j8uAmrsKYM/WI6G6JtjdhmLi8NID2EGXH6j9oJijMaez
 BzTjuf9B0Jwe6gQzxFFlqM2zCQcHMd4XNfFMwEYaDfCS3NAq1JxrW9Np9sbpxl0pwccs
 XmOQC3dI5MB33AehW+ymirqcy5wRvbYPkIxn5c5Z5oX5VKqGX5mH2YDVPKoHk7IGqbaD
 qnrap8o4f0nkq9/PHkHrAWhmcs2WJOA3Lpv+xvvYRSMuNzNvDI3ZhO4FEIOTpjQjSOi5
 xZYA==
X-Gm-Message-State: AOAM533EzWxnDYSAFjfDcQ4+z0owt2rQrCgv6kq5XoU0AFqFDHdYWRMC
 6vKQ0HS8yoQ53xvVUchrKpQvgjX8iMSjC5WOd7M=
X-Google-Smtp-Source: ABdhPJw3Lvvsg0n2apXZWNjrMB6KG5zW03kvpPEus/xToU9Rq4XUcgkT2+Or0UJUc9oA3lXGVHI3lA==
X-Received: by 2002:a17:906:af77:: with SMTP id
 os23mr20391790ejb.427.1628001681292; 
 Tue, 03 Aug 2021 07:41:21 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id s18sm6274360ejc.52.2021.08.03.07.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 07:41:20 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210802060946.C27006062D@smtp3.osuosl.org>
 <20210802234647.6f3df99d@windsurf>
 <0c80668e-d1c0-3516-4a9e-54e6eb32cfd8@benettiengineering.com>
 <20210803092835.0e4d2663@windsurf>
 <3430ac54-09ee-c25f-1dd3-82035c3d87a0@mind.be>
 <20210803121157.54af210b@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <0de2a418-5098-6332-d71e-0df6e879f97f@mind.be>
Date: Tue, 3 Aug 2021 16:41:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803121157.54af210b@windsurf>
Content-Language: en-GB
Subject: Re: [Buildroot] Some analysis of the major build failure reasons
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 12:11, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 3 Aug 2021 12:04:13 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>  A simpler solution is to use 'make -Orecurse' or 'make -Otarget'. That keeps
>> the recursive output together.
> 
> True, but as you say below, it doesn't guarantee that the actual issue
> appears in the last part of the build log.
> 
>>  It may not fully help due to the "Waiting for unfinished jobs" bit - the line
>> with the failed package may appear just before that. But that can be solved by
>> first searching the "Waiting for unfinished jobs" line and cutting off
>> everything after it.
> 
> True. Needs some logic in extract_end_log() in autobuild-run.
> 
> So what should we do ? Build with -Otarget, and keep the last ~500
> lines before the "Waiting for unfinished jobs" ?

 Yeah, I think that's the way to go. Not sure if -Orecurse or -Otarget is the
way to go though, I'm still a bit fuzzy on their respective effects...

 Regards,
 Arnout

> 
>>  Additional autobuilders do help because they offer a different build
>> environment. If there's some autobuild failure that *doesn't* happen on James's
>> machines, you can be sure that it's due to the build environment.
> 
> Absolutely true, that's a very good point that you have here.
> 
> Thomas
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
