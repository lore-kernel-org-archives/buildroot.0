Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE529C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7770461B09;
	Sun, 24 Jul 2022 10:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7770461B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jera_wDHLYmG; Sun, 24 Jul 2022 10:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860A861ABD;
	Sun, 24 Jul 2022 10:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860A861ABD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23A881BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0D5340359
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0D5340359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKtfT9d9gbJ4 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:37:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 343A240B9E
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 343A240B9E
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:37:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso4761669wms.2
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hl+8w98NvEPBIs83h5Nmpe9lWHM1qZJ3AOUQjr/D5nI=;
 b=fjn0oklBNlZWVZIdunpK6NohoX3Vya0Mvv8QVAAAdmiDp1B0KbZ/8dwDXdNC+aFBRM
 dS49BVk9zHR4c4/xXeInch7dDKoJl6/1veEckQ/GQQ40m+GVdE5vl4nMXuF/FqzguIuF
 3eXNFFfIvCGsbRj3sERDfd29zJNYkiA6jIINpvwwhHVE5BnlvLyyRiE6dfsA+bda4/hw
 2T787T5Q+ieO6RzqVZ5iRRF72MMGRiWtxTJhruIeAAaPdL+a/ifozwOFYRXU3z+zzHqv
 n2yGL+b2tA9WKWNoyJDSYL3rdaBslInBrzajZ2tawVqnZ6uNMUPVxG12pymVQXsMz0hp
 dpsA==
X-Gm-Message-State: AJIora8jJXrucka+zaWM24RMqNmKeqeqhVuDo5HHHa4de6UQijGdy1vh
 sdkcWer7jMC+DDOrp0G/aq9pyBM7xeVKbw==
X-Google-Smtp-Source: AGRyM1vv4ziz60bvjUOzdfYn730My6kl1PCw52d9+L0mpGzrsM1IWXRwtkLbmt7YcjHkRfSIwu1hxA==
X-Received: by 2002:a05:600c:209:b0:3a3:11a3:d6a8 with SMTP id
 9-20020a05600c020900b003a311a3d6a8mr5070940wmi.13.1658659056120; 
 Sun, 24 Jul 2022 03:37:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a05600c4e0c00b003a2fde6ef62sm10807306wmq.7.2022.07.24.03.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 03:37:35 -0700 (PDT)
Message-ID: <85ee4d5a-b72e-21cf-4227-a5c490018f2d@mind.be>
Date: Sun, 24 Jul 2022 12:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>
References: <48-62dd1880-1-54f5770@160071919>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <48-62dd1880-1-54f5770@160071919>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hl+8w98NvEPBIs83h5Nmpe9lWHM1qZJ3AOUQjr/D5nI=;
 b=RKtpTuuQcbn3zMF0RXXORN/I4+pH9of3bYO+7xDXC6hXin05xMw046MAlt7FY++zrY
 03CelsHY/9PPTroi896uCZtjCGxaxZBbA9ugj8asC5Wfypjh2v5xu8b1vdNCU+0iRB7u
 lHEFh00KqZaj4iOwiejFGK3av1QMnPN9XfDMUjwysiRHA7VvUfhwhIwrVpLWBB/pFerx
 W0H6DX0/UBZvgedLOPLaF95IK1T5OmElVUsjxX1VNP4W9YwuZNd0dsT8IQCxWypmikmv
 H3Qh7vWBifKFkWeNrN4SigoNA86BrqINuhyuZo/5GlI7JcI6ljYali5HJ6VLPQTo22Om
 rSfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RKtpTuuQ
Subject: Re: [Buildroot] [PATCH] package/re2: bump to version 2022-06-01
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



On 24/07/2022 12:01, Michael Nosthoff wrote:
> On Saturday, July 23, 2022 00:10 CEST, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>
>>
>> On 21/07/2022 20:34, Michael Nosthoff via buildroot wrote:
>>
>>    You're signoff is missing. You can simply reply with it, patchwork will pick
>> it up.
> 
> Oop, sorry!
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

>>
>>    Regards,
>>    Arnout
>>
>>> ---
>>>    package/re2/re2.hash | 2 +-
>>>    package/re2/re2.mk   | 2 +-
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/re2/re2.hash b/package/re2/re2.hash
>>> index 28f407cc32..380b547658 100644
>>> --- a/package/re2/re2.hash
>>> +++ b/package/re2/re2.hash
>>> @@ -1,3 +1,3 @@
>>>    # locally calculated
>>> -sha256  1ae8ccfdb1066a731bba6ee0881baad5efd2cd661acd9569b689f2586e1a50e9  re2-2022-04-01.tar.gz
>>> +sha256  f89c61410a072e5cbcf8c27e3a778da7d6fd2f2b5b1445cd4f4508bee946ab0f  re2-2022-06-01.tar.gz
>>>    sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
>>> diff --git a/package/re2/re2.mk b/package/re2/re2.mk
>>> index b6d29c3caf..39b2c8d990 100644
>>> --- a/package/re2/re2.mk
>>> +++ b/package/re2/re2.mk
>>> @@ -4,7 +4,7 @@
>>>    #
>>>    ################################################################################
>>>    
>>> -RE2_VERSION = 2022-04-01
>>> +RE2_VERSION = 2022-06-01
>>>    RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
>>>    RE2_LICENSE = BSD-3-Clause
>>>    RE2_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
