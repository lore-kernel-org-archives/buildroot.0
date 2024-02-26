Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F35EC54E4A
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 14:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B44F04080A;
	Mon, 26 Feb 2024 14:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxctzdB_mUCR; Mon, 26 Feb 2024 14:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E9D240819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E9D240819;
	Mon, 26 Feb 2024 14:02:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8CC1BF3E8
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 14:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28DB840A80
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 14:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udRNTy49dPLk for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 14:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F81340907
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F81340907
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F81340907
 for <buildroot@uclibc.org>; Mon, 26 Feb 2024 14:02:25 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3f4464c48dso354741866b.3
 for <buildroot@uclibc.org>; Mon, 26 Feb 2024 06:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956143; x=1709560943;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AY38KtjOW991VPkV/0CRG3MTSW/rAkqj58Y/htZe13o=;
 b=pL6/9770+C84P3/gN/EW7NeIbRwhZ2/gByCjZ/6aopICEKHgaFRQAsW11sPFK3E9uh
 rnMM9SN+SlVtKPMleph9MVmWA5wHWVbJfuy5+tYbFQB4+drbalMyFi+ycRCVbqdIv4jb
 KOGMeS78Tcrl/9a//hPwTvLnVCB9beT2EfvHe6C4wt5oWUN+AhNRo+2ys0ZF8ydgByM6
 EHW5cIjfMNlcuj9pqnkrYQIUaucRxWl5CHtvK71rdRZl15bwq1/7E4+I53chJXin75WT
 lGDgorc4lzigacLbmpWH3CK6MIV2pT/C9BN8SiAvW8ckd4yKNyVQXW0jUXBicnYA63HH
 JyPg==
X-Gm-Message-State: AOJu0YzA4m12yq0C7MwREuTM57dTx4AV+kREyzhBEBLf5npNyVQ7qkL4
 ZTAvzrba+H8ljTDoOkAMzEV2QOpZSmoqAcvWXydv3MpW/rFPRA4l5zrmRfxKAio=
X-Google-Smtp-Source: AGHT+IH6kdprTLysTDpgSojFYSTC1xHDTZibTQZqScT9g/kXANi55ORA513hOQopgeIEA85utcWxIA==
X-Received: by 2002:a17:906:f9cc:b0:a3f:d2e2:4ce5 with SMTP id
 lj12-20020a170906f9cc00b00a3fd2e24ce5mr4599055ejb.29.1708956143316; 
 Mon, 26 Feb 2024 06:02:23 -0800 (PST)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 u6-20020a170906124600b00a43815bf5edsm322232eja.133.2024.02.26.06.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 06:02:22 -0800 (PST)
Message-ID: <a3b7ffc6-1421-4475-bd14-496d7e3fa07d@mind.be>
Date: Mon, 26 Feb 2024 15:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Bernd Kuhls <bernd@kuhls.net>
References: <20231218220457.1705749-1-adam.duskett@amarulasolutions.com>
 <20231218220457.1705749-3-adam.duskett@amarulasolutions.com>
 <20240206233318.593730bd@windsurf>
 <87wmqut14w.fsf__36507.8827760712$1708783134$gmane$org@48ers.dk>
 <pan$d961b$888d7a82$9cf22659$dea826e7@ID-313208.user.individual.net>
 <ZdsiyRbOWUfnRNDz@landeda>
In-Reply-To: <ZdsiyRbOWUfnRNDz@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1708956143; x=1709560943; darn=uclibc.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AY38KtjOW991VPkV/0CRG3MTSW/rAkqj58Y/htZe13o=;
 b=WJdxNfMBhZDex1/EFvk1XipejjeqpCyHE0sIjiz0BK+qo/Cqi+ZXk7Q9EQwQrYhpbH
 hbqVQNqIema2XCwVQ/1erVeYxrHlUCkCun1edKpuIa+Q0AP0kmhh9622DmHGSCWB7IaQ
 2tY7SJ3e5wjEk5nblMaOUVUM4t8wGOI6a1hTJTrD6+HVpdu6cupyjoCN2hIPi766/+vG
 9LZq0Dfhn84bFCdWDtNgwhEeuRPqg/FIcGUG+ToDbkql6gGH0jjLk8waPIhC0L1/GIO1
 vrWGANuCj8wORGNZ7xsnPpJMNRWuWPmAnjSgHqsRAOdObT15o8/FlkUwB0zAqAJlg5kk
 euvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WJdxNfMB
Subject: Re: [Buildroot] [PATCH v4 3/3] package/python3: bump version to
 3.12.1
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
Cc: Benoit Debled <benoit.debled@mind.be>, buildroot@uclibc.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/02/2024 12:21, Yann E. MORIN wrote:
> Bernd, All,
> 
> On 2024-02-24 20:01 +0100, Bernd Kuhls spake thusly:
>> Am Sat, 24 Feb 2024 14:58:23 +0100 schrieb Peter Korsgaard:
>>
>>> We unfortunately are still having a number of build failures because of
>>> this, E.G. for target == host
>>
>> Hi,
>>
>> ftr, the host == target problem is solved by using a patch from here:
>> https://github.com/python/cpython/issues/115382#issuecomment-1952936367
> 
> The issue with that, is that none of the upstream maintainers have
> chimed in to express their view on whether this is the correct approach,
> or to suggest something else.
> 
> If we go and carry that patch without upstream feedback, we risk
> carrying forever without the issue ever being fixed upstream.
> 
> What happens in other buildsystems, like OE or openWRT?

  My colleague Benoit (not on the list, but added in Cc) ran into this Python 
issue himself, so I asked him to investigate a little. Here are his conclusions.


OpenWRT uses currently python 3.11.7 on the master branch as it can be seen here:
https://github.com/openwrt/packages/blob/master/lang/python/python3-version.mk

They updated from python 3.11.6 to 3.11.7 on dec 13 2023

I see no issues, PR, nor commit regarding an update to python 3.12



Regarding OpenEmbedded, here are the latest python version that are used:
dunfell (3.1 LTS) 3.8.18
kirkstone (4.0 LTS) 3.10.13
nanbield (4.3) 3.11.5
Scarthgap (5.0 - Release date : April 2024): 3.12.1

python: update 3.11.5 -> 3.12.1:
https://git.openembedded.org/openembedded-core/commit/?h=scarthgap&id=716d82352545d3667a658b69d65d6127678dd150

 From the moment they have updated from 3.10.6 
(f10cdc155e47af5627ee999c57e1d083f9382a91), I don't see any new major patch...



  I (Arnout) think that they don't have the problem because since 2019 they're 
carrying the following patch.

 From 5b66463c10fec1440e977d5a21a0167862d6d79c Mon Sep 17 00:00:00 2001
From: Ricardo Ribalda <ricardo@ribalda.com>
Date: Tue, 18 Nov 2014 03:35:33 -0500
Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
  PYTHON_FOR_BUILD

When building x86->x86 the system will try to execute .so and related items
from the default PYTHONPATH.  This will fail if the target CPU contains
instructions that the host CPU does not have, add CROSSPYTHONPATH
into PYTHONPATH so we can prepend the list to find correct libs.

Upstream-Status: Inappropriate [OE-Core integration specific]

Credits-to: Mark Hatle <mark.hatle@windriver.com>
Credits-to: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>

(CROSSPYTHONPATH points to the equivalent of our host/lib/python3.X).

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
