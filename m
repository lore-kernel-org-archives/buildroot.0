Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C39C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB5344163C;
	Fri, 22 Jul 2022 21:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB5344163C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BKXcb9h5IJ7; Fri, 22 Jul 2022 21:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC0FC4159A;
	Fri, 22 Jul 2022 21:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC0FC4159A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98D491BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DC4960F45
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DC4960F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17u83EEd5fFF for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:30:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39DA360ADD
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39DA360ADD
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:30:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id b26so8140011wrc.2
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 14:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/MyigQF2W5fXI5vkVgupWLlppbXzRJ5T2liSKwNUEgg=;
 b=QQQ3AMim8yNINGW2nhRGiHi3wJon/rV6ND3K6DfCxDGewwlQ+DroDpMtrmlm36rIY0
 BiwUoJht0sGCd1PDWsJdCHibohRmnIL1LnKTt4dWHzOVYRmXyzQCFdrWFThpMVGUO1Fn
 JcUayXfdtEggB1XGLh6C69RASqDccqaFq8vzEt9tE1LxYepoUQYDUZNEgj+DZx2RGkOF
 BzKdOXXSOie6tURAD0CTzqoOdef7we/gmCRXMjiNjB1cFNpEYb+88+6+qx/iVf1ddy7J
 sbiqHUAHFANgA2qFw8VRYVFbjWQ1EKDvonH1GECpNnkneleeHAzHNxZHqSD0cnkQscnk
 BLBA==
X-Gm-Message-State: AJIora9OFurH17djl1d/71jp4ZXVmzN6xWdKB1++RSFuZDoLsqinmaIp
 ObA6yKTrFkhnFXL8y1QFUHE+gw==
X-Google-Smtp-Source: AGRyM1ucypirDHPYwkSd0QSmGpaMyhFzQEI7GF4bJ8zs4Hz5khG2aadkLJz6eUIK54eDG7Pt2I2RYA==
X-Received: by 2002:adf:f345:0:b0:21e:4d32:18b1 with SMTP id
 e5-20020adff345000000b0021e4d3218b1mr1108549wrp.197.1658525399320; 
 Fri, 22 Jul 2022 14:29:59 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a5d654c000000b0021e463e4017sm5203136wrv.55.2022.07.22.14.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 14:29:58 -0700 (PDT)
Message-ID: <bdd21bf7-754c-2fb1-995e-f2d13cfddbb7@mind.be>
Date: Fri, 22 Jul 2022 23:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
References: <20220719131605.337057-1-nolange79@gmail.com>
 <20220719131605.337057-2-nolange79@gmail.com>
 <20220719154504.GJ2249625@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220719154504.GJ2249625@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/MyigQF2W5fXI5vkVgupWLlppbXzRJ5T2liSKwNUEgg=;
 b=CiCopjlRj8k/CHrEiRk0ynQc1Dnz5Km2VQZlwRWVGpFJ9y7ckQbpTjoRAwRgWv0/en
 /UTcTFf+uhpodtRchRdlVlWYsI36deiIVwPOSSapVhIW4ktvvpe0MNi0Rl72X+oOhvHZ
 P9dXTnLwTyy0tCt2Jrf6f4q8BNwBOmM2xlusEV9fNCC2kXWgR4C6rIa1XqtCWKVcop3W
 TSNIHdY5R8t0oK/sFB/QKFhCvTximeygTneKBtgef4VJl7PRNFbS3OJDxlTcOJW6wY06
 sv2cNXyiFkzYbQufTaxBLWyn0I1PVZ1GWZa8qp1cCy0FjOZ6UAma7D9TeD94L/8rs6ON
 Tyig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CiCopjlR
Subject: Re: [Buildroot] [PATCH 2/2] package/systemd: allow package to be
 used without init system
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/07/2022 17:45, Yann E. MORIN wrote:
> Norbert, All,
> 
> On 2022-07-19 15:16 +0200, Norbert Lange spake thusly:
>> Allow systemd to be built as normal package, this for example
>> allows building systemd-boot without any init system.
> 
> How has the situation with upstream evolved since last time the topic
> was raised here:
>      https://lore.kernel.org/buildroot/cover.1545814334.git.yann.morin.1998@free.fr/#t
> and especially the sub-thread:
>      https://lore.kernel.org/buildroot/d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr/
> 
> As far as I know (and understand), upstream has decided to tie the build
> of systemd-boot (formerly the standalone gummiboot) to the build of the
> rest of the systemd suite; they did not accept to make it possible to
> only build systemd-boot to use it outside the systemd ecosystem.
> 
>  From Buildroot's perspective, allowing to build systemd without it being
> an init system, and without the possibility to just build systemd-boot,
> is asking for troubles down the line.

  However, it does make sense if you're not actually building a full system. 
That's not a use case that is really well supported by buildroot, but we 
shouldn't go out of our way to actively block that use case.

  I've been thinking for a while to make an explicit option for this, which 
would basically override/disable all the system/Config.in stuff. There's just 
one thing though: in such a use case, ou probably do still want to install the 
appropriate init scripts, so setting BR2_INIT_NONE is not exactly the correct 
either...

  Regards,
  Arnout

> 
> The triviality of your patch does not make it possible to only just
> build systemd-boot; instead, it still builds the whole systemd suite,
> which hints that upstream did not make it possible to do separate
> builds.
> 
> So, unless things have evolved substantially, I am not very fond of
> alowing this, and stand by the decision that was made back then (i.e.
> abide by upstream decision and tie systemd-boot to the systemd
> ecosystem).
> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>> ---
>>   package/systemd/Config.in | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
>> index 9f1a778e59..e0f5dbce0d 100644
>> --- a/package/systemd/Config.in
>> +++ b/package/systemd/Config.in
>> @@ -16,7 +16,6 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>>   
>>   menuconfig BR2_PACKAGE_SYSTEMD
>>   	bool "systemd"
>> -	depends on BR2_INIT_SYSTEMD
>>   	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>>   	depends on BR2_USE_MMU
>>   	depends on !BR2_STATIC_LIBS # kmod
>> -- 
>> 2.35.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
