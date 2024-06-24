Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38C4C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C157560A83;
	Mon, 24 Jun 2024 20:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BysCOw4RYdUk; Mon, 24 Jun 2024 20:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C909608F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C909608F4;
	Mon, 24 Jun 2024 20:01:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 501891BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AEB740025
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKCeasT0kqJc for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:01:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3567400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3567400C1
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3567400C1
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:01:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4217926991fso41986685e9.3
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 13:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719259261; x=1719864061;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8pf5kBiu7tBRfrM36Zv0ZHnXNM6ZxWMrm/AG1tv2R4Q=;
 b=ATqNBwB+JicPcFf/p5VCxtybxj3Z1ZknB0BLFGBBJOw10rM1L9RVr22dPhP82gOctx
 al/2gk0xmx01EOSGA5YLfSDMzMT5ME9kyEo2KuLjj7czHh8sAmn0vrBqZ/Gsxz6mjVku
 H0k8TizCd7IHHDpHC0WVJpYWCz6CkJ4sBQxHAQiomUaVVMNkiQARw6VHI74eqasC1CBt
 ceA3pO2tWMNVezdj/Swkabn09JJT6F1f4gRQ2CrEbj0KmVyMETvJhrYUQjLB3vVqoSNj
 y1uMui2ng3eIFeqHL//hJuHKspUpTIUk6Rg8BH3HxFXkDOjv2owWSvKgMBC5ys6e3inO
 TW3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUkzOxEutfsOYQNf1BjIoeCWAqfpJZpgzuqtfSBe5gZHZo/IL/nAMop49hAxe7fd+Xiotz5Z/+dHhI5lEs33BJt0iRJs2gzg==
X-Gm-Message-State: AOJu0Yz1bMUlOHTuKs/Z6XwrQ3A0bD/EKGRf94krdIF6PSZ++0Jj7MGD
 QS2C0Zin7BMTOuSnfuk90PcavA3owGmbjQoX8mmADGrOtYsx/KC2sMUaeC0bpWA=
X-Google-Smtp-Source: AGHT+IHOIHImwijkd63fz/RCmFCvINlZPMKgPtrZHiw8kGGTvd/GlAqvK7bv4MQc4fAtmEIPlzC/2g==
X-Received: by 2002:adf:e412:0:b0:35f:2366:12c5 with SMTP id
 ffacd0b85a97d-366e79fe9f5mr3803049f8f.23.1719259261394; 
 Mon, 24 Jun 2024 13:01:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638f86566sm11004110f8f.64.2024.06.24.13.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 13:01:00 -0700 (PDT)
Message-ID: <f0fe493b-a6f2-41db-bec7-0340b0aab2b9@mind.be>
Date: Mon, 24 Jun 2024 22:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
 <20240522070238.3282121-12-dario.binacchi@amarulasolutions.com>
 <87bk4yntxd.fsf@tarshish>
Content-Language: en-GB
In-Reply-To: <87bk4yntxd.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719259261; x=1719864061; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8pf5kBiu7tBRfrM36Zv0ZHnXNM6ZxWMrm/AG1tv2R4Q=;
 b=MH872UmSnuNbuatpUHSu7L8Mp+lxBwNMcd4YwMUYO+COC6PFBYnLLG6hSgjD+s0O0o
 ODD8LSN0isg3L/pOA4ERdBrneLUQMkcbCGepLs9y8Il2UDqVDslcPcR1S735GyaaRs0N
 SlWx5+YTXxWDHNq23IV5EsY/hIdQwp+nLT87/kii4dksEaEPkPS82xgfoV6H1R9Tzq1f
 BQaadzNWgNiL4NwvpQX7YUnZ5duGYFGV9kQHhc2wAgt5LgB8bqA3wGNk2i1SxqyyX64D
 Zk8CVses+X/ubIHHhdfp9tVtROFvn1NwBFRW4pD4M9+fMsVh1pHBv9ToMEuDnQ+bbhXW
 qX/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MH872UmS
Subject: Re: [Buildroot] [PATCH v2 11/18] package/libnl: update the patch to
 be applied with fuzz 0
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/05/2024 10:15, Baruch Siach via buildroot wrote:
> Hi Dario,
> 
> On Wed, May 22 2024, Dario Binacchi wrote:
>> This commit allows the package patch to be applied with fuzz factor 0.
>> The fuzz factor specifies how many lines of the patch can be inexactly
>> matched, so the value 0 requires all lines to be exactly matched.
>>
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> ---
>>   ...l-workaround-to-the-libc-compat.h-copy.patch | 17 ++++++++---------
>>   1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch b/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
>> index 57d1c8747dea..4c833cfb22bc 100644
>> --- a/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
>> +++ b/package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch
>> @@ -1,4 +1,4 @@
>> -From be07fdbc9658de19304defa7538f219cd3f21ec0 Mon Sep 17 00:00:00 2001
>> +From 5c984c942e2f9dca4a8380ed782519d9cb0f554d Mon Sep 17 00:00:00 2001
>>   From: Baruch Siach <baruch@tkos.co.il>
>>   Date: Sun, 12 Mar 2017 08:52:20 +0200
>>   Subject: [PATCH] Add musl workaround to the libc-compat.h copy
>> @@ -12,26 +12,25 @@ definitions will be needed. See the Buildroot iproute2 patch
>>   package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch.
>>   
>>   Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ----
>> -Upstream status: libc-compat.h is a local copy of a kernel headers. A proper
>> -musl fix must go to the kernel first.

  This shouldn't have been removed. Instead, I converted it to a proper 
Upstream: tag (and updated .checkpackageignore accordingly).

>> +[Dario: make the patch to be applied with fuzz factor 0]
>> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> I think this patch is not needed anymore since libnl version 3.5.0.
> 
> I have not tested though.

  Since it's not sure, I've kept the patch.

  Regards,
  Arnout

> 
> baruch
> 
>>   ---
>>    include/linux-private/linux/libc-compat.h | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>   
>>   diff --git a/include/linux-private/linux/libc-compat.h b/include/linux-private/linux/libc-compat.h
>> -index 9bed5b6ae4d9..e2562a819464 100644
>> +index a1599911e7a9..f6df7193b8b4 100644
>>   --- a/include/linux-private/linux/libc-compat.h
>>   +++ b/include/linux-private/linux/libc-compat.h
>> -@@ -49,7 +49,7 @@
>> +@@ -50,7 +50,7 @@
>>    #define _LIBC_COMPAT_H
>>    
>>    /* We have included glibc headers... */
>>   -#if defined(__GLIBC__)
>>   +#if 1
>>    
>> - /* Coordinate with glibc netinet/in.h header. */
>> - #if defined(_NETINET_IN_H)
>> + /* Coordinate with glibc net/if.h header. */
>> + #if defined(_NET_IF_H) && defined(__USE_MISC)
>>   --
>> -2.11.0
>> +2.43.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
