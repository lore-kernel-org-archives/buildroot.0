Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URI_HEX,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB52DC4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 08:27:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 487AF61220
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 08:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 487AF61220
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07C1040357;
	Tue, 24 Aug 2021 08:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_1sQvHncIUO; Tue, 24 Aug 2021 08:27:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61C37401F2;
	Tue, 24 Aug 2021 08:27:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 404351BF2B9
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 08:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CC0A80D43
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 08:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvGFD2ADsnL9 for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 08:27:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3270B80F7B
 for <buildroot@busybox.net>; Tue, 24 Aug 2021 08:27:00 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id u14so17793587ejf.13
 for <buildroot@busybox.net>; Tue, 24 Aug 2021 01:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZbcAn8HldGQTk/UPEdc7H38EJOBFpovyvifmRnEeUMI=;
 b=Us0ypNTOPsiN4t+E66K+xyruP31VBY9Dj3epONGUzhBQOiTFAgY1CIVC7cJdqL3mpX
 BN0yUrIzb7rgT5Ro6MIwCDESiFqvpMMIWB2B2nv1IQbumz7VU4BNlNWApbbZh/cHN3DT
 DhYn4yP+IFFOkKpY39LeurJiEjd+qk50wD6AHOTUAI4Cxk7ZvGF0r7HSBwArVG13Ujqe
 QgAvTTvjTuyLgpkHq2CwiSFQ7ux5WWXffkPjg/gqsOLfiHXl+kFbZGe6o1M++yrHE0JR
 efv5iwxLqTHLYR6YOG4Ng/D6sBNIjGD1wRcVKfAphtGFsQM8AErGzjU7W+CmYaYSqfFd
 2GyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZbcAn8HldGQTk/UPEdc7H38EJOBFpovyvifmRnEeUMI=;
 b=GvOzNLqx6LbebLGIMSDZNJb1Z7TQxAWkIwyqPSY9JUK9FOlO4y2J3BDrsqkMap9ZKa
 Yc8K6+qwc9lW+6GLQlrpVHmB+OFMHs8Zmn2af8dUQeazrn95Q7eM3+hxV8ogCq5t6TWe
 cZHgeVYQhgMc1mGOzLgs91STktN4fENqUwzIPJ1nHWS4ye34F96nx7N6T/pFu2M7OfgJ
 md9WkcnfBsgmIDsC4zza5iX6t2IBZkNj5P/B9gLH27uN2aK6Sc0E1eStkngtQa1DAlBu
 WcX58mk3uZg3VuHRb9hxTXmZckyZx+6TVSdws+xocmpeB3HLp+qa1ltMVD7GJOPcvLpK
 PImg==
X-Gm-Message-State: AOAM5330n/Ura1Z+f5RzmMvcjSFmSVA4GuarPtznP+5OahQx05lhNIJv
 NQmjfbedJlnSbS5x18JHxdqHyBquSLSI9A==
X-Google-Smtp-Source: ABdhPJxuQ2qdAUE8kn/5uHh7gMXIIchwl+yhSEvHKIYz82ujc+drSIxCOeKoxJIjghvLKf+PcDmVMw==
X-Received: by 2002:a17:906:b2d2:: with SMTP id
 cf18mr2034079ejb.308.1629793619302; 
 Tue, 24 Aug 2021 01:26:59 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b10sm10826656edd.33.2021.08.24.01.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 01:26:58 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>, bryce.schober@gmail.com
References: <54f5-61242d00-3-3eaf8580@172892221>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <6254d9c8-21c4-259e-9358-b24dd187e1c1@mind.be>
Date: Tue, 24 Aug 2021 10:26:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <54f5-61242d00-3-3eaf8580@172892221>
Content-Language: en-GB
Subject: Re: [Buildroot] Buildroot mailing list archives search
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
Cc: buildroot <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 24/08/2021 01:19, Michael Nosthoff via buildroot wrote:
> Hi,
> 
> On Monday, August 23, 2021 23:55 CEST, bryce.schober@gmail.com wrote: 
>  
>> I've found that the "Search the List Archives" tool at
>> https://buildroot.org/support.html seems to be broken. It seems that
>> there's a DNS problem with buildroot-busybox.2317881.n4.nabble.com.
>>
> 
> This search dialog should better point to lore I guess. 

 The website resides in docs/website/support.html in the main buildroot repo -
feel free to send a patch!

 Regards,
 Arnout

> 
>> And the mailman archives search is pretty rudimentary and not as effective
>> a tool...
>>
> 
> Have a look at the archive on https://lore.kernel.org/buildroot/
> 
> This should have a much better search functionality. 
> 
> Regards,
> Michael
> 
>> I'm trying to do the work to find out what is available all by myself...
>>
>> <><  <><  <><
>> Bryce Schober
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
