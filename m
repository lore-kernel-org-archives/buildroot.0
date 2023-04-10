Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1A5C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 854726FF13;
	Mon, 10 Apr 2023 19:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 854726FF13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HpwFehhbcJ08; Mon, 10 Apr 2023 19:44:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1CA3613F9;
	Mon, 10 Apr 2023 19:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1CA3613F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DFA51BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 741DB40930
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 741DB40930
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o52hfx6U7gl1 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:44:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A62D408C0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A62D408C0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:44:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5047160a0beso2394072a12.0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 12:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681155893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4FfNktZ/dNhfFOwpUtVV4RKO2TtDtbFpoe84VbUMEvA=;
 b=1iaBLJ1s4mmWEWfWWosZXD0u5S1ECptUndegTVl5FgBTu9uqDsbK3tWrINoH9xUJ/c
 CcvZedeP4bw/geHhAzgBKaSdvV06zGHBgbL1+OcOUh3+XMwVU7IhOWPvyg1pGDXZGtpD
 BMQ8RH1M6vdC4LciU19NiDJlA8kJJIvJIQ6wu8UrzzPsRfrWJ3HwKRCwvO2RvM8Xle4L
 POiOY83drfI00AUfjNIi0Nk7omc5ZAhWHFL5+EgQKa1KrQRxnRBIyT2UV8dHvf9psN8g
 EXQOkewKq3K5vUaugi0DNJFmSSGb0/IoLGatVaw16l/IHex2XekCD3WZoDWk+Z/vCs7z
 VutQ==
X-Gm-Message-State: AAQBX9f3xU9g6/Wl0aX+0YR1IpxxheCu3osZeF3Mh5fHXqksQ5QznwCx
 RfrC47w3/zgdGRIRZ9PWxtF+pA==
X-Google-Smtp-Source: AKy350YX2OnAVE6ZcLQxzCR3dguc8udQNyvQgf5y32lqYgsqZ6sALk9rOxKWaZNYw6gqLt/SGShmNw==
X-Received: by 2002:a05:6402:393:b0:4fa:4a27:adba with SMTP id
 o19-20020a056402039300b004fa4a27adbamr10068556edv.22.1681155893226; 
 Mon, 10 Apr 2023 12:44:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a50b410000000b004c5d1a15bd5sm5098781edh.69.2023.04.10.12.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 12:44:52 -0700 (PDT)
Message-ID: <e9e35f27-998e-52d4-4487-c09a5f0c84a3@mind.be>
Date: Mon, 10 Apr 2023 21:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221014230905.3091021-1-james.hilliard1@gmail.com>
 <20221030212629.51bf650e@windsurf>
 <CADvTj4qQ=esO-=RYZqzk3nGEYhw_1dGuOss3eN8xn-wu9WYogw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CADvTj4qQ=esO-=RYZqzk3nGEYhw_1dGuOss3eN8xn-wu9WYogw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681155893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4FfNktZ/dNhfFOwpUtVV4RKO2TtDtbFpoe84VbUMEvA=;
 b=OnhAZClI4kcQWAv1tIYVYB8uNUtLcSyDoJQ8xGodKMITvpJAIGl9B1PXzODjeSnVXh
 puNJleNPOWJfUnZinSf89KbHneWHjG9eZ5VZfnoXNF6tOcHDzA+iPWymLBZCLIAbLboD
 GyE3pot3HIb021B2g2/6N0qdP4pWHSGfKxVXmIUMrAoKwm+DdSoW2S4dNIOsoD6cLtno
 t7sQmG6D/kh7vQA+TDtm4O8LX4p+CQ+NYBhp5wONNjUJdPtpEm3L1Y+C2ZvMLvKeobW1
 9gjF+0iuRcUbVH1mRbKAoagBtzuwXuEqJTY7tEjzgT98Zxl83yLICZCkVVxeVKp9KTck
 27DQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OnhAZClI
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: identify silent make via
 firstword findstring
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



On 30/10/2022 21:35, James Hilliard wrote:
> On Sun, Oct 30, 2022 at 4:26 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello James,
>>
>> On Fri, 14 Oct 2022 17:09:05 -0600
>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>>> +QUIET := $(if $(findstring s,$(firstword -$(MAKEFLAGS))),-q)
>>
>> I must be missing something, but why is -$(MAKEFLAGS) used and not just
>> $(MAKEFLAGS) ?
>>
>> Indeed, with "make -s --debug -k", $(MAKEFLAGS) is "ks --debug=all",
>> and therefore $(firstword $(MAKEFLAGS)) is ks, which is good enough for
>> the findstring s, no? Why is adding a - in front needed?
> 
> I think so that if $(MAKEFLAGS) doesn't have any short options that it won't
> accidentally match on a long option.
> 
> For example if $(MAKEFLAGS) is " --shuffle=none" the - in front ensures that
> we don't match the s in a long option like shuffle.

  Exactly right.

  However, the firstword approach doesn't work with GNU make 3.81. For example, 
the following invocation:

make --no-print-directory -s

will set MAKEFLAGS to " --no-print-directory -s", so the firstword approach 
*doesn't* find the -s, but the filter-out approach does.

  Therefore, I marked this patch as Rejected.

  Regards,
  Arnout

> 
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
