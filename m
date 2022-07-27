Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1BFC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EE8D404D8;
	Wed, 27 Jul 2022 11:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EE8D404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZzZosEgwkri; Wed, 27 Jul 2022 11:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38E6340484;
	Wed, 27 Jul 2022 11:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38E6340484
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91D131BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6820481256
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6820481256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ldbSDvIC6bS for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7383680B5F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7383680B5F
 for <buildroot@uclibc.org>; Wed, 27 Jul 2022 11:08:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i8so728488wro.11
 for <buildroot@uclibc.org>; Wed, 27 Jul 2022 04:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BELKOVSdXEGxy0umjjAfpes2OF5gvw7TwZip1BfYMLE=;
 b=vIAPsuiyQZ2xpfZL+1RVnCIUMUImdzlKxLvMz9JOu+ivFU90YR5Dns9tnS75QNv1wF
 olVjsD9/BVRcfHLuXdhYBCFk1CgjxbFDaqgSzDMclZ8y5z8oB+f6lqkeid9wjswNMDHU
 9tb/hsHGq0t05qQWXjRNPezKbNbDbF3L0QY5uOyja6XI5nqr3rC5657QtvRAEhjahtjQ
 otta4jvbCBeiwM7TiAUgisPTUw+x9T4jsxefisYgKncuh6d34h13+Zdu7xIsTYDcKLLT
 MbiayL1I+30obLMJevIqWb5gQj2mzbiJIaygb7Gv5xtzJPAg87VkFEzTdNbf16iMlZsR
 jouQ==
X-Gm-Message-State: AJIora9yF/Uak/5vshpTj/u6ZqmwJWDffJ/rDpxtQRat5rdNAc1J10WC
 DTfq1XAUULRlTksQU6/D+p0Urg==
X-Google-Smtp-Source: AGRyM1sQIaTiSwgBqPd46E60TantGpTNmfRMyHidvUvSVSmrqNoM96ANeo0QHzpJUpzdwpVkK0jENw==
X-Received: by 2002:adf:fa49:0:b0:21e:b015:c09 with SMTP id
 y9-20020adffa49000000b0021eb0150c09mr4463813wrr.452.1658920118570; 
 Wed, 27 Jul 2022 04:08:38 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c4f9000b003a2f2bb72d5sm2254722wmq.45.2022.07.27.04.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:38 -0700 (PDT)
Message-ID: <c3833aee-090a-8247-5d6f-98781ae9e887@mind.be>
Date: Wed, 27 Jul 2022 12:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@uclibc.org
References: <20220213130306.3002130-1-bernd.kuhls@t-online.de>
 <20220727115113.0d06fb96__9944.83321426145$1658915496$gmane$org@windsurf>
 <pan$74f48$42282b93$fd100b6e$bd156916@ID-313208.user.individual.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <pan$74f48$42282b93$fd100b6e$bd156916@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=BELKOVSdXEGxy0umjjAfpes2OF5gvw7TwZip1BfYMLE=;
 b=K4Re7j9HeOe1MPssSUBgVjY/5MzxpD/V2AVxkFIgwigpxIGYGQ+raWeO9Lc9pt4cJD
 BXZEr3jfuJ7YrgE+hvIGwvq+LFsMvBBQBEVP1O0xcqCOlglWnHz5C09mFXxL1laVnC4P
 4VuATmOJciaPj5JoNhB31RLFniuj6wekGEV6UbwLK31G4qyG39L5e9ANKE1hYXKOG2nL
 J3HGQuLP+ss0d+EQBKQ4X0Oe5eEa3ZnK3XopA+4+vE44wN/8SgR0JmOHcTKT30gCvxBh
 0/zfoG400yw8e0Sw+Zozog3P5aGT/Ys8gEIhhxXZxfijpo/wdGgpDh8L6/Tx3IYTD8FM
 SM5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K4Re7j9H
Subject: Re: [Buildroot] [PATCH 1/1] package/e3: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/07/2022 12:16, Bernd Kuhls wrote:
> Am Wed, 27 Jul 2022 11:51:13 +0200 schrieb Thomas Petazzoni via buildroot:
> 
>> This doesn't seem like a very useful addition to Buildroot to be honest.
>> Do you have some convincing arguments? :-)

  The main concern really is that it requires lots of patches, some of which are 
very old. This suggests that it will have serious maintenance overhead.

> 
> Hi Thomas,
> 
> the filesize should be unbeatable small:
> 
> # ls -la /usr/bin/e3
> -r-xr-xr-x    1 root     root         16880 Jul 17 20:02 /usr/bin/e3
> 
> Hm, regarding platforms I found https://docs.huihoo.com/embedded-linux/
> embedded-Linux-system-development-training-slides/text113.html which
> states it should also work on arm, so I will have a look at it.
> 
> Gentoo also provides it for riscv: https://packages.gentoo.org/packages/
> app-editors/e3
> 
> Gentoo's description might also be convincing for you:
> "It's heavily optimized for size and independent of libc or any other

  Exactly. This means that there is really no need to build it, you can just use 
the gentoo binary directly.

> libraries, making it useful for mini-Linux distributions and rescue
> disks."

  You're still going to need busybox to have a working system, and busybox vi 
implementation adds way less than 16K to the size. So this argument doesn't 
really fly.

  Regards,
  Arnout


> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
