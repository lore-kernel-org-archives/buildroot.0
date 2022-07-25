Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20D0C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44FB3419F5;
	Mon, 25 Jul 2022 15:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44FB3419F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kn-JcB5rRTP; Mon, 25 Jul 2022 15:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFF86410E4;
	Mon, 25 Jul 2022 15:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF86410E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2461BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66DC3410A7
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66DC3410A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDbFs8rjh7MZ for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:27:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E55EE41A04
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E55EE41A04
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:27:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so9636701wmb.3
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cz3c2x8uOnz6IHuvZqfxEs725pNHyvEaRiX+AcDgKRk=;
 b=gXUge/vLjr/dDAwHmtN3ejC3hgRssFxBLOcFfJgFzm7ffX+/9+grWUlqPxtRY8aso/
 Yfj8uegkg1F8Y9Cu/Ub1sc7S3YjdvyKpLLwi6J3ZXcP1vjW9PGvytxKxmAFtFJMipNZg
 hl+05Pqft7f8eRvjIjzee3lvfwRg5Yi2rCQgH5ocC/BA5LgqyznF++hjJnQaJDllUDG9
 hXkAnNJs+Bhp9QLLDKhtzfOsaAlJ5ikWL11PYeG2OwEgwOVd3YcDoUYTUpTU0nPkW+YD
 6L5R5jLntswdtopNl4uSk2pYBaFBodn3X5iOc/j2S1ydR5PKGlavW5JgHHchxxGTLvbc
 +YGQ==
X-Gm-Message-State: AJIora+AYRXJ3SKK8izZJL0HigZeUy05iqT2JrxQTf0cDT2QPV/3ih7F
 DLTzpmJ/IbsqGt4yTKY9Qzf2dQ==
X-Google-Smtp-Source: AGRyM1sYQriqvTtx5AzBJTTFOxmTrAU0CjPNwzxlw9f5mTinVJll/cq67SRoLcnaM2PCg43MzUhabw==
X-Received: by 2002:a7b:c7d1:0:b0:3a3:1890:3495 with SMTP id
 z17-20020a7bc7d1000000b003a318903495mr21484186wmk.18.1658762824935; 
 Mon, 25 Jul 2022 08:27:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a5d5256000000b0021e2fccea97sm12518886wrc.64.2022.07.25.08.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 08:27:04 -0700 (PDT)
Message-ID: <cf125f40-5b4e-6f22-876f-6f786a7ae79b@mind.be>
Date: Mon, 25 Jul 2022 17:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, Gleb Mazovetskiy <glex.spb@gmail.com>
References: <20210418183658.1675843-1-glex.spb@gmail.com>
 <20210418235913.142664da@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210418235913.142664da@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cz3c2x8uOnz6IHuvZqfxEs725pNHyvEaRiX+AcDgKRk=;
 b=XF28BI5Wj07NOiMZbtLtiJMHIGOA0bavBy5DkckRknQmJGc0+BSpgzgDP5qU0JDhLX
 KeJcmvEXb5pw4IXy1Q7Me3HoYn6YpIUCvdVFJSfxOkpeed1C8m/7Koo2XPtr4uoOQMj8
 t98MgmvLBUn8bD/RuCoYYs4tgXE3y19NLUULqf2tttuEDrnghiuTe6BjKPc5D17GY0cX
 uZvs+to98XKSikmlqoASKF0XiHOAofpHDYeINfdxagS9HZuZZUqiSUNoD3s8Ueun7afm
 YlIM9bDujh4dbCE2rLYzWstpePX0capfMf1ppGVT2MwAzimu5qOcZIXq8gxrKcT8afQs
 grCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XF28BI5W
Subject: Re: [Buildroot] [PATCH 1/1] package/valgrind: Add a setting for LTO
 build
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



On 18/04/2021 23:59, Peter Seiderer wrote:
> Hello Gleb,
> On Sun, 18 Apr 2021 19:36:58 +0100, Gleb Mazovetskiy <glex.spb@gmail.com> wrote:
> 
>> Valgrind LTO build takes over an hour on my Ryzen 3950x.
>>
> 
> Can confirm a build time increase (AMD Ryzen 7 1800X):
> 
> - without LTO:
> 
> real	0m54,741s
> user	3m29,941s
> sys	0m10,949s
> 
> - with LTO:
> 
> real	5m48,009s
> user	6m23,040s
> sys	0m13,197s
> 
>> This is not always worth it for the ~10% size reduction and a small
>> performance improvement it offers (see https://www.valgrind.org/docs/manual/dist.news.html)
>>
>> Adds a new `BR2_VALGRIND_ENABLE_LTO` setting to control LTO enablement
>> for Valgrind separately from the global BR2_GCC_ENABLE_LTO setting.

  Adding per-package options to enable debug and optimisation features is really 
not the way to go.

  Instead what I've done is to create a series [1] that turns the LTO option in 
a global option, that clearly explains in the help text that it may have a big 
impact on build time. I've removed the BR2_GCC_ENABLE_LTO option entirely 
because it was not actually doing what it advertises.

  Let me know what you think.

  I've marked this patch as Rejected.

  Regards,
  Arnout

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=311175

>>
>> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
>> ---
>>   package/valgrind/Config.in   | 10 ++++++++++
>>   package/valgrind/valgrind.mk |  2 +-
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
>> index 56e4af21fa..eff54e7949 100644
>> --- a/package/valgrind/Config.in
>> +++ b/package/valgrind/Config.in
>> @@ -84,4 +84,14 @@ config BR2_PACKAGE_VALGRIND_NULGRIND
>>   	help
>>   	  This option allows to install the Nulgrind tool
>>
>> +if BR2_GCC_ENABLE_LTO
>> +
>> +config BR2_VALGRIND_ENABLE_LTO
>> +	bool "Build Valgrind with link-time optimization"
>> +	help
>> +	  This produces a faster / smaller valgrind (up to 10%) at the cost
>> +	  of massively increased build time (can be over an hour).
> 
> Be careful with absolute times, depends strongly on the used hardware...
> (out of interest, what is your baseline compile time?)...
> 
> Would move this section up-to/before the tools selection section...
> 
> Regards,
> Peter
> 
>> +
>> +endif
>> +
>>   endif
>> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
>> index b87e1e518f..07fb1f7d42 100644
>> --- a/package/valgrind/valgrind.mk
>> +++ b/package/valgrind/valgrind.mk
>> @@ -50,7 +50,7 @@ VALGRIND_CONF_OPTS += \
>>   	--host=$(patsubst arm-%,armv7-%,$(GNU_TARGET_NAME))
>>   endif
>>
>> -ifeq ($(BR2_GCC_ENABLE_LTO),y)
>> +ifeq ($(BR2_VALGRIND_ENABLE_LTO),y)
>>   VALGRIND_CONF_OPTS += --enable-lto
>>   else
>>   VALGRIND_CONF_OPTS += --disable-lto
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
