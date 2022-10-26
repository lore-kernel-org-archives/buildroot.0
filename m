Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DACC433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 21:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C50081327;
	Wed, 26 Oct 2022 21:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C50081327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aXW2PCkbBDm; Wed, 26 Oct 2022 21:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBBBA8131D;
	Wed, 26 Oct 2022 21:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBBBA8131D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 284041BF31D
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02C274023B
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02C274023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FT2-NIlnDU1D for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 21:14:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D3C840219
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D3C840219
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 21:14:12 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id j14so24133322ljh.12
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 14:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/P1TajJbGKUeLENOVgHmUZtj778O3WDgrv0kA1t/Gk8=;
 b=WXbPcJEwSrP11Kx6rnAME3KgCj6NuB0UgmcLZ7kCt26PrmdQIsQ9AElT9U1ANuYOzD
 03IYA/7TOb3gv/4YWLPcHlTZ9EGwjFn+Zff1fz1qO3wl9cVYwdCzb8rWnh02nTshdJXH
 CAw3haNbqvEZpRKp5ySMSw1oxxZoxRS9YdujKS3kF5+SdpPnn9ONryLg3Mqj9IWaQozk
 R0NJEHb5QZNcWjrYWzTbvozJ9wTZ2emzCbHzHrUjSwA6Sz1MERu79VD+EZWuLV4bVF3V
 0Xa87gyzPBhtS28/hbW66/hWIaWAIs7VtuwqH5V7YMu1G3/OqEibPwBTVWFlwKk8W0Tj
 s9OQ==
X-Gm-Message-State: ACrzQf1iWSP96nbLQuW8dFSc74c7ImI28Uv3IeJAcwe2ri02sqqgAi1l
 FIW8SR1W+ya0KBU0+e3qciAu4yOsJ/ZZ/Q==
X-Google-Smtp-Source: AMsMyM4Y0Fxesn9tttJ7noxHBO7HDSvPnO/wiT4DWuIbsfCehU3Zb1LTdOtW3C91feqYNguDczf3ng==
X-Received: by 2002:a2e:a9a9:0:b0:261:bf5a:8ff3 with SMTP id
 x41-20020a2ea9a9000000b00261bf5a8ff3mr17067049ljq.252.1666818849663; 
 Wed, 26 Oct 2022 14:14:09 -0700 (PDT)
Received: from wkz-x13 (h-98-128-229-186.NA.cust.bahnhof.se. [98.128.229.186])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a05651c10b000b0026dcac60624sm831465ljn.108.2022.10.26.14.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 14:14:08 -0700 (PDT)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20221026221528.393a1d39@windsurf>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-4-tobias@waldekranz.com>
 <20221026221528.393a1d39@windsurf>
Date: Wed, 26 Oct 2022 23:14:08 +0200
Message-ID: <875yg69tjz.fsf@waldekranz.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/P1TajJbGKUeLENOVgHmUZtj778O3WDgrv0kA1t/Gk8=;
 b=2TWpMmMQif3en1g0pBQ+lFxxZSBtqobqhZwC/5CoJvknCY155Mnaj837L4HyDd+VS3
 ejVAZAzAW5eBrKNlueKKffe0aFYjgxut+iZG1FY74kHsGplzHdIze2ytnLP4BYPB3kZI
 2yZuFAa4k0wwMw45vnQ7nm76vP6poIr0wd63+RBbSB0W8piou+iIYZls+NtuQM3/DsLq
 ZvB5mOSSUjszShyMLX3Z9ZtRaWeqwaQgPhy1UxRL8jqWsN1Y+HVf6UUkFPDhsXK50gGO
 aljrCLyu9M8VFt16+eVYcHDHu98zkrGP9c/zLmQ7bMkHrVxSNn9Xez1oC5HYjpS/aFFh
 YM4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=2TWpMmMQ
Subject: Re: [Buildroot] [PATCH 3/4] package/libbpf: extract dependencies to
 separate kconfig symbol
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On ons, okt 26, 2022 at 22:15, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> Hello Tobias,
>
> On Thu, 20 Oct 2022 16:14:11 +0200
> Tobias Waldekranz <tobias@waldekranz.com> wrote:
>
>> This makes it obvious that the comment is just the negation of the
>> dependency requirements. It also makes it easier for other packages to
>> depend on libbpf.
>> 
>> Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
>> ---
>>  package/libbpf/Config.in | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>> 
>> diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
>> index 1465366c9e..7e816c193d 100644
>> --- a/package/libbpf/Config.in
>> +++ b/package/libbpf/Config.in
>> @@ -1,11 +1,16 @@
>> -config BR2_PACKAGE_LIBBPF
>> -	bool "libbpf"
>> +config BR2_PACKAGE_LIBBPF_SUPPORTED
>> +	bool
>>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>>  	depends on BR2_USE_WCHAR # elfutils
>>  	depends on !BR2_STATIC_LIBS # elfutils
>>  	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
>>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
>>  	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
>
> I'm afraid, but we don't do this in Buildroot, in none of our packages.
> I think our rationale is that by duplicating these dependencies, it is
> easier to maintain the Config.in comment in the packages that select
> BR2_PACKAGE_LIBBPF.

Fair enough, I will drop this change in v2 and copy the information to
kmemd.mk instead. Is there a convention for how to comment dependencies
that stem from grandparent packages? E.g. v2, kmemd.mk will declare:

   depends on BR2_USE_WCHAR # <comment>

as libbpf requires it, but only because of its dependency on
elfutils. So what is the proper <comment> in this case?

"elfutils" or "libbpf"? Or maybe something like "elfutils->libbpf"?

> I agree it's a very arbitrary choice, but we really strongly want
> things to be consistent between all Buildroot packages, so we cannot
> change this for just one package. If we want to change this, it needs
> to be discussed (advantages vs. drawbacks), then the documentation
> needs to be updated, and all packages changed.

Completely understand. As a Buildroot user, I really appreciate that
consistency!

> Best regards,
>
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
