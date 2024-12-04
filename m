Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BF9E77170
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 20:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E2B8144B;
	Wed,  4 Dec 2024 20:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQxAIVArCFVP; Wed,  4 Dec 2024 20:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBC4C81450
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC4C81450;
	Wed,  4 Dec 2024 20:29:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C9A81DD1
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3235D81450
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNrpeE-vEMqT for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 20:29:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EC4A8144B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EC4A8144B
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EC4A8144B
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:29:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385e3621518so157993f8f.1
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 12:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344164; x=1733948964;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yy8VKSGJ+rIwcQYI3mrJRMY8wzL4UhgihCPCrbtU4MI=;
 b=Wo0tzfmCX8uNr0WvJJkve4I7x2pXvclbkMz2m2GbzzjDhXDevcIJUk9M9w9VUtittN
 k7Yg8/5kiUVtwef8DG7irqlwLZnddpm1X32hy9adAPjyGAmDrCV6RrI/l+v179jQL9bJ
 pjaVkxi4F8gC/2n+b7zVLyIVAkuauDnA4W6k4Y4BgDKYiEHKm0Iwq9xoXCYcdYAn1kyl
 ScT1YjHBQD6JsVUFahrIMOpwlO26toK6zh5MPE4nCtcZ9pJYufGh4m9+6VVBowPo+SXV
 C+kwoae4ppKZAO1jVzviwUn0lf5T2gkiVtjvVw3cYD9EC6IMyiLqfFi/duBhHkzySXdR
 LuWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUp9QhU06Vrk9G3JB97nz0lJAueLtdtCc3QannWLrw6qO8sHV1VxIFxrYZ7eQdLGNHQcjh7vR2I2E=@buildroot.org
X-Gm-Message-State: AOJu0YwG9DotOO3o0BTpBJRE9c2MHeZVYPNc0petveAxg+wf81QAjB5J
 AdURRY6E7+wyGkHiHySqUC/L8Arb1qciMgNeyKiKMDxtVhYXLD9Am5IUfnFHq9beVqQCgGKiTuL
 v
X-Gm-Gg: ASbGncvgMaAx904Tq5K4a78lC+3/jPF6CSyL7D3n8TEChxJb0D77kCGR9miEgoouDyv
 ICsv+2PzU/Clil3Q82TJVYM6vfzqpe0z3uypp6gDqJdh2vadyI17vyGW/L6Cv0nWHnSVXHdmTcQ
 YoOkB+6zfNpIuL7W9QWxTKnD15LxeVI2Kc2qy+ZNmPBrgzvegYIN6vDDX3qZNmoiyPOIopT23If
 ozj/boZnGJnR0PqmsCtOj+nDmO40DvigPJvSyOYF99LUERXufVok6FERRjGOIp0/7rS39q3P5rh
 otzMZBb2h5hcCY+SqsNxNzIe7XwAKMKH9B+UO0KKvmaGuWdenzv78rxFT9+O5Cncgy3VuiGTcn8
 9Vc0V
X-Google-Smtp-Source: AGHT+IHbIkt2qXw6xO0pmBdGI5tMHkx0KZljrYSWQsaBI9AknANgykfzu5N7FFiY+mevmS2h0kUA8Q==
X-Received: by 2002:a05:6000:2812:b0:385:f631:612 with SMTP id
 ffacd0b85a97d-385fd3f8f10mr4071620f8f.17.1733344163808; 
 Wed, 04 Dec 2024 12:29:23 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385df69feaasm16415177f8f.5.2024.12.04.12.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 12:29:22 -0800 (PST)
Message-ID: <4af05c49-d213-4ed1-a9de-c8ae1877fdbf@mind.be>
Date: Wed, 4 Dec 2024 21:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>, Anssi Hannula <anssi.hannula@bitwise.fi>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20241106100210.1547916-1-anssi.hannula@bitwise.fi>
 <20241114210445.GA372474@pevik>
Content-Language: en-GB
In-Reply-To: <20241114210445.GA372474@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733344164; x=1733948964; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yy8VKSGJ+rIwcQYI3mrJRMY8wzL4UhgihCPCrbtU4MI=;
 b=fbEF3kBHhy9hh06V+bwP7NEDRDqO+iCNRSRF1GODjm/Tb9j1ufmV1d9S6kg6hVwoMU
 eksAyPzE+aZzbWYUbOPAaRx92dwrjBME6B0lAmy0I2epjIxSmpVcGt6JYD2LTEk7IUFA
 p75S0RoNgUmmh1ZTkHyKO1WDrVFAxjZhSz8Ethl3pQsp0Uw6jNZwJBAQBVlqmpcSCxBg
 Iu5Z2m3d877dHGAOCuJB+7K0wewWOdzogx/3wzOx+tHsOLSUWGwxDEOyhykUAkbPkkrh
 L3Hka+poJ6kyi9bdqShrVyS97aZgVDIBsxv93fsUBDhZHB016MHaDuuiaWMbxEvAANNz
 I3Tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fbEF3kBH
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: fix unit
 dependencies without systemd on build host
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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



On 14/11/2024 22:04, Petr Vorel wrote:
> Hi Anssi, all,
> 
>> nfs-utils configure script uses "systemd-escape" to determine the
>> rpc_pipefs mount point unit name in the non-default case.
> 
>> If the host build system has no systemd this will silently result in an
>> empty name, causing rpc_pipefs.target to incorrectly depend on ".mount".
> 
>> Fix that by depending on host-systemd for build.
> 
>> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
>> ---
>>   package/nfs-utils/nfs-utils.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
>> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
>> index b757e3e51d..9ea3bae79d 100644
>> --- a/package/nfs-utils/nfs-utils.mk
>> +++ b/package/nfs-utils/nfs-utils.mk
>> @@ -79,7 +79,7 @@ NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
> 
>>   ifeq ($(BR2_INIT_SYSTEMD),y)
>>   NFS_UTILS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system
>> -NFS_UTILS_DEPENDENCIES += systemd
>> +NFS_UTILS_DEPENDENCIES += systemd host-systemd
> 
> Given that majority of the developers use Buildroot with Linux distro with
> systemd I'm not happy about all of then need to build host-systemd.

  Since systemd typically has a lot of dependencies (including host-python3), 
and a large part of them are also needed for host-systemd, and the build time of 
host-systemd is only about a minute, I don't think this is such a big deal.

  Regards,
  Arnout

> 
> Is there any better solution for this? If not let's fix the problem with
> accepting the dependency.
> 
> Acked-by: Petr Vorel <petr.vorel@gmail.com>
> 
> Kind regards,
> Petr
> 
>>   else
>>   NFS_UTILS_CONF_OPTS += --without-systemd
>>   endif
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
