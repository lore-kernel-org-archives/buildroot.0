Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E543FCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 16:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5255940543;
	Wed, 18 Oct 2023 16:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5255940543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 041usD4jtDzV; Wed, 18 Oct 2023 16:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EB0540990;
	Wed, 18 Oct 2023 16:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EB0540990
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D27AB1BF5A6
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 16:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB1134211F
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 16:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB1134211F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sI8n1I4BqkIU for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 16:07:56 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23CDD41E3D
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 16:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23CDD41E3D
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53e84912038so6887902a12.1
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 09:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645274; x=1698250074;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ccEozTeQEERKJQBFfnMLElATK93ueprszDlCDNkbeWo=;
 b=XTiz3mFIs2zrRP3lefOu+qW3EqUBE5jjcMORjtSJocuBPKXKD3cdxvAIA3hhqYx4vM
 ZjjZ3NXEqMYV/gtifJHN7D84+/1mTNiKWjihNWGZd6DzSAUDCYb7VB437WHdaPZE7SoI
 2nPKN+XAfvd7bnOd6dk8kK2it0AxvsOWad5y78BSKLiayffJ4dRMLYZgO2Jvtw7sKMhH
 HCp+bJ7bqVRtJMaGyn6XI/qzo3D1E109zrB6v0na9pd92gp5zts3vXt5ie2YWbdCEtld
 3GLDjaW1ODjqK0iFW9BP1YHYVkc3Cc7CGYU2qZNg0nHtSOZheA4eD4AybMx6SJnfisIo
 PACA==
X-Gm-Message-State: AOJu0YyzZdJ7Rd0FNvOYwKWYKX3V7yacXd1k3WxRX81jxDNICWRzIm5+
 qBTe3E8rPaRFC0q/5gX1omR9DA==
X-Google-Smtp-Source: AGHT+IE2NodHQf3wmmR/Gilbpw8MljoGBOaiyF37A20WawAcT6OLkiCa4HnK/EQTLiQtGpRfmJ/Eiw==
X-Received: by 2002:a50:d709:0:b0:53d:d913:d3cb with SMTP id
 t9-20020a50d709000000b0053dd913d3cbmr4049344edi.28.1697645274055; 
 Wed, 18 Oct 2023 09:07:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 cy23-20020a0564021c9700b00522828d438csm3006829edb.7.2023.10.18.09.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 09:07:53 -0700 (PDT)
Message-ID: <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
Date: Wed, 18 Oct 2023 18:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>,
 Andreas Naumann <anaumann@ultratronik.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20231017143424.430007-1-anaumann@ultratronik.de>
 <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697645274; x=1698250074; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ccEozTeQEERKJQBFfnMLElATK93ueprszDlCDNkbeWo=;
 b=EKoFxV1l51vGvXr3vTgel2/107TzyAllw5Zd0PXcJ5ANhoNzert6NmP+AtKF8Lo+NG
 Qhztcc0vunicJD/ES0zSY7VpPsgo7q5mh4oo9SlVd9cyeoA15dP6YeQwzYFG86TrBC3I
 hRIpC0LIttfbDnZOX8U8FivLAmgqhQouByDxWmw99Kk8znqBUnp3CgLqY1/I6/3nIdUa
 +fT9VIEkIQ4cRykSUuOVcs493sBlsY1WbfdLGSKvuCnshDu4HE9/S5Yoz2pI/JWPiLn2
 TdJjgoICkWkyhJMrHedMFL/aQ5wZTyvt7iBw1T2pzfXcIkcloNbb7RfgvqKDI7l4AtjO
 NrFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EKoFxV1l
Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
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
Cc: "bstruempfl@ultratronik.de" <bstruempfl@ultratronik.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/10/2023 17:13, Vincent Fazio wrote:
> Andreas, All
> 
>> -----Original Message-----
>> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Andreas
>> Naumann
>> Sent: Tuesday, October 17, 2023 9:34 AM
>> To: buildroot@buildroot.org
>> Cc: bstruempfl@ultratronik.de; Andreas Naumann
>> <anaumann@ultratronik.de>
>> Subject: [External] - [Buildroot] [PATCH 0/1] libgpiod v2
>>
>> Hi everyone,
>> we would like to bump libgpiod to v2 and did so in attached patch.
>> However, this breaks API to v1 which some packages depend on, e.g.
>> swupdate. Is it preferred to create a new package libgpiod2 instead?

  The proper approach depends on how hard API is broken.

  If it's like "mostly it will still work, but there are a few functions that 
you need to replace with a new variant", then the proper approach is indeed to 
fix the packages that fail to build. And example of this is the openssl 1->3 
update we recently had.

  For bigger API changes, however, we can't really do that. Even if all internal 
packages are fixed, it's quite likely that there are proprietary applications 
that use libgpiod and need a specific version. In that case, we indeed need a 
new package libgpiod2. This has been the case for gtk, qt, gnupg, gstreamer, 
just to name a few. It's typical for bigger libraries, as you can see. In fact, 
it initially looked like openssl would go that way as well, but it turned out 
not to be that bad.


> I've held off on doing this series myself due to this specific challenge.
> 
> In my opinion, we should patch the packages which depend on libgpiod to
> support building with either version of the library and submit that patches
> upstream. Then include that patch in BR with the Upstream: trailer.

altera-stapl, openfpgaloader, openocd, in addition to swupdate...

  Regards,
  Arnout

> 
>>
>> regards,
>> Andreas
>>
>>
>>
>> Boerge Struempfel (1):
>>    package/libgpiod: Bumped to Version 2.0.2
>>
>>   ...nfigure-switch-for-building-examples.patch | 91 -------------------
>>   package/libgpiod/libgpiod.hash                |  4 +-
>>   package/libgpiod/libgpiod.mk                  |  2 +-
>>   3 files changed, 3 insertions(+), 94 deletions(-)  delete mode 100644
>> package/libgpiod/0001-build-add-a-configure-switch-for-building-
>> examples.patch
>>
>> --
>> 2.34.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> CAUTION: This email originated from outside of the organization. Do not click
>> links or open attachments unless you recognize the sender and know the
>> content is safe.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
