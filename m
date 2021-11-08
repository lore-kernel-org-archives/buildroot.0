Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BA5C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:17:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A65B60184
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A65B60184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F37D840184;
	Mon,  8 Nov 2021 18:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-t3fDASa6Wc; Mon,  8 Nov 2021 18:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E8940196;
	Mon,  8 Nov 2021 18:17:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD5E1BF3F3
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7665B401C1
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHc9dEmR7xRW for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 18:17:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43E44400B5
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 18:17:39 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g14so65488500edz.2
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 10:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Mpy6WHnF7uVWig4csZleT+VbzTqF7Lc/oKRlXKpVcdU=;
 b=Mrvb7zX5e4MCQAKwzGc7jMM1klgDT0ji8lxkYqj7zy3Ea7a4xoYuHF2rJcaNLdQrWQ
 k7pcW/5egM/QP3oKO9yya40HPlXJO9NgLXLQpaOB0Ddqe1yyBBgQd7StyjIfBiJFgtq9
 8NJkhMYh1/SYD2X00xpJI1QhwRGYOfBU4E6EOM/a2iSkDaWZuD01FMk72Z6p9411VjHJ
 KkQafWgOH5koMAV3Y9KJR51uayA1dS23TCt6BV+vmotLBNnwZP1y2qGM/ZHcyt+HEvva
 aR9Mk/2JygtdEhYmps7zI4OJkxdh4Z07AeDMA8SROe22jANXLLiPurL7dnVGsmIteodR
 bc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Mpy6WHnF7uVWig4csZleT+VbzTqF7Lc/oKRlXKpVcdU=;
 b=js/HQXqv+REEYIeKT+kcNyo2xUSuBVkwDAZQY5GJZA5rXmChum00vT54iT+a9b4tZA
 hNoQpodhtVRRcbCu9OimitkFcd1Qz6NxoPF1YzGaO86FQDexa/9l48nHu0jd2I31jcQx
 072ny6R19UwFbzFsZBLsr1g5R8hGj7mxERBvxSJvU8ojSQ8YULQwKyw3lwiyttfXgpFN
 5i3eeKxNqKWFbFzqFIrdjhYQUtbMP3VVwB6plY/Vvmgl1K2RN3S5OcM9zJr6/Hput4Wy
 Zq7pNhydWT3afupaR2ai+EnAAeij/hP19cr37Kz1LaEH0Rpirz0zsN7EsNsMUlgXXpj3
 jK1w==
X-Gm-Message-State: AOAM5313ERql43o+DlV+KYTJuzWw/VxPzj1Xy6SfgAF5xfvwQ6XDowH+
 7CweqTsBeYgUC5NeQZ8sJzM+VQ==
X-Google-Smtp-Source: ABdhPJwDr0zUHO+aSF6q8UAZg+i+YNFwnC8zc4grrVFeZu+n9SCF8ksUy2TnOcSVnWkrxiITetUOTg==
X-Received: by 2002:a17:907:1629:: with SMTP id
 hb41mr1599754ejc.328.1636395456999; 
 Mon, 08 Nov 2021 10:17:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qb21sm8999164ejc.78.2021.11.08.10.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 10:17:36 -0800 (PST)
Message-ID: <bb20a275-8828-d776-335f-be8d9725ca79@mind.be>
Date: Mon, 8 Nov 2021 19:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211006204133.465875-1-arnout@mind.be>
 <20211006204133.465875-2-arnout@mind.be> <20211104204636.GB2400@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211104204636.GB2400@scaer>
Subject: Re: [Buildroot] [RFC 2/2] Config.in: move toolchain menu before
 build options
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
Cc: Raul Cabello <raul.cabello@suse.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/11/2021 21:46, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2021-10-06 22:41 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> Many of the build options depend on the toolchain configuration. In
>> addition, it's pretty logical that you select first target architecture,
>> then the toolchain, and only then things like debug and pic/pie.
>> Therefore, move the "Toolchain" menu before the "Build options" menu
>> instead of after.
> 
> I think a much better solution would be to move the toolchain-related
> build options to the "Toolchain" menu, and keep in the "Build options"
> menu focused on the actual generic build "infra" (arg, I can't find a
> proper word...). Parallel jobs, download tools, patch directories et al.
> really are related to the build infrastructure, while static, -Os et al.
> are more about the toolchain "configuration".

  Although I agree that static etc. is distinct from wget etc. options, I 
wouldn't say that they are toolchain options either...

  That said: we do say that you need to do a clean rebuild when you change 
toolchain options, and static etc. definitely require a clean rebuild.

  Regards,
  Arnout


> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>   Config.in | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Config.in b/Config.in
>> index 8ed11c994d..efdf397c01 100644
>> --- a/Config.in
>> +++ b/Config.in
>> @@ -87,6 +87,8 @@ config BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
>>   
>>   source "arch/Config.in"
>>   
>> +source "toolchain/Config.in"
>> +
>>   menu "Build options"
>>   
>>   menu "Commands"
>> @@ -908,8 +910,6 @@ comment "Fortify Source needs a glibc toolchain and optimization"
>>   	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
>>   endmenu
>>   
>> -source "toolchain/Config.in"
>> -
>>   source "system/Config.in"
>>   
>>   source "linux/Config.in"
>> -- 
>> 2.31.1
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
