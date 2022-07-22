Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B1AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C020A60AB2;
	Fri, 22 Jul 2022 21:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C020A60AB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjZih9yhXYf3; Fri, 22 Jul 2022 21:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5BE860807;
	Fri, 22 Jul 2022 21:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5BE860807
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDCBC1BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C37BD41296
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C37BD41296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bD8X-9Xiy1oV for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:23:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D10340905
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D10340905
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:23:31 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id id17so3469513wmb.1
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 14:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ho/0uaxhOrSs+p+TH2KBChvb+cXu8MbxHGHvf89esw0=;
 b=iEAasIbvXKnR6tmC5uVq67naiyQfA0xUwyXqRyPOujDIy1pidX3Krq/T1fBiMfsPzX
 7uLqxOTLrjJDjbhNjD2Go2rvmYT0I1wbe9CCeOzdMOF1nS/ropZJPmoyJmk4nsvDKwIG
 6rx5JiPq6vZSHg+Q4qTufAIEDlQ4xQFQw2Z7RjvgIVya5NsjF3u6XoEGx0rk3NVleOUx
 xkBmtAy+sO1bY6ylhylgOCnBYBcXlu4VOwKJfn1ErTCDRFyMAyZr9pkh8S1XMY9jipIK
 0a8P0ioBMqYwELvnMir45VCC3cGx8mgJ1RHleKKWgMB0SpKj0MXQb7ZWjALMAhbAdKeq
 jSLg==
X-Gm-Message-State: AJIora/jLEI5lMKFA12zpj2fcdX0QzTsEge+YTv2gZykQw6Dl5gof1i1
 tb8gae38bfAIJFI1zz/A3x1ipA==
X-Google-Smtp-Source: AGRyM1urmuJJtwz6Kby8sZvYhOFJIBwgHKJWHv2fWISb3+kKiFLkYssphCanECAzAa1qxp4M4Qg+lw==
X-Received: by 2002:a05:600c:35d6:b0:3a3:1c4f:6f46 with SMTP id
 r22-20020a05600c35d600b003a31c4f6f46mr1031642wmq.206.1658525009366; 
 Fri, 22 Jul 2022 14:23:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d4d81000000b0021e4fd8e10bsm5558369wru.11.2022.07.22.14.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 14:23:28 -0700 (PDT)
Message-ID: <8d9d7bfa-dd7a-1d79-4cba-f22c19966a73@mind.be>
Date: Fri, 22 Jul 2022 23:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220719131605.337057-1-nolange79@gmail.com>
 <20220719131605.337057-2-nolange79@gmail.com>
 <20220719154504.GJ2249625@scaer>
 <CADYdroMqpgyCR0jyWdXR+UqiOSoNdKNN3OsGSSXDrBvR_RSyNw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroMqpgyCR0jyWdXR+UqiOSoNdKNN3OsGSSXDrBvR_RSyNw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ho/0uaxhOrSs+p+TH2KBChvb+cXu8MbxHGHvf89esw0=;
 b=DvZ6Uxci700J8vt6Pg4PXOXxzR3SzZdqqTVrUUgA359u7p+Qu9F6cT+NgOc7pbWAN4
 RdF9SE5OkRa0JkxdbYsk6X0Q95tD/2X4OJPxqW63b3OBMRz2dURPDjdo4ByX880kexyw
 teTjnPpbl8Tz3xDU7XFnR3QY1mLIroNKNtVAenz19xcM4sKi1xtepUaPFSlrpJP6IxFM
 cc1I8+J/90xDhXhQTDjtK5xzAotY5H7gtDzhd03XHe6Zio5uPP8bGRwqfJ9lQs14R0dZ
 MBLbMvmz7VY4O9KFY4Q1E90bRHonvWphf8lffJ6jjbKxpZAOZPviPKdqolVmUIvPX2tA
 pXQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DvZ6Uxci
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/07/2022 16:59, Norbert Lange wrote:
> Am Di., 19. Juli 2022 um 17:45 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
>>
>> Norbert, All,
>>
>> On 2022-07-19 15:16 +0200, Norbert Lange spake thusly:
>>> Allow systemd to be built as normal package, this for example
>>> allows building systemd-boot without any init system.
>>
>> How has the situation with upstream evolved since last time the topic
>> was raised here:
>>      https://lore.kernel.org/buildroot/cover.1545814334.git.yann.morin.1998@free.fr/#t
>> and especially the sub-thread:
>>      https://lore.kernel.org/buildroot/d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr/
>>
>> As far as I know (and understand), upstream has decided to tie the build
>> of systemd-boot (formerly the standalone gummiboot) to the build of the
>> rest of the systemd suite; they did not accept to make it possible to
>> only build systemd-boot to use it outside the systemd ecosystem.
>>
>>  From Buildroot's perspective, allowing to build systemd without it being
>> an init system, and without the possibility to just build systemd-boot,
>> is asking for troubles down the line.
>>
>> The triviality of your patch does not make it possible to only just
>> build systemd-boot; instead, it still builds the whole systemd suite,
>> which hints that upstream did not make it possible to do separate
>> builds.
> 
> This was an example, and I do just that, even you built more than just
> systemd-boot, picking "no init" speeds things up a bit.
> 
>> So, unless things have evolved substantially, I am not very fond of
>> alowing this, and stand by the decision that was made back then (i.e.
>> abide by upstream decision and tie systemd-boot to the systemd
>> ecosystem).
> 
> I want to build systemd without using it as init system. Is there any
> reason to artificially prohibit that?
> It's just a regular package for me.

  AFAIU, systemd will unconditionally install /sbin/init, which will conflict 
with the other init system you have defined. So to complete this patch you 
should make the prompt depend on BR2_INIT_NONE.

  Same reasoning for udev (possible conflict with eudev), I'm not sure how to 
fix that one.

  There may be other conflicts as well, but the autobuilders will report those 
(once we re-enable the conflict check...).


  Regards,
  Arnout

> 
> Norbert
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
