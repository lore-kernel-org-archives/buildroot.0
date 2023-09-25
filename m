Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFCDCE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 14:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 831E781AC1;
	Mon, 25 Sep 2023 14:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 831E781AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAY-jfU_lTeh; Mon, 25 Sep 2023 14:21:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C30D581BB4;
	Mon, 25 Sep 2023 14:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C30D581BB4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DDA11BF35F
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4143E81B17
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4143E81B17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMF59IWP7Efj for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 14:21:07 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EB948176F
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 14:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EB948176F
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c007d6159aso105174831fa.3
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 07:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695651664; x=1696256464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zz2NRl448rps+FuxqGiqiRhGqw3RiY2J6wQTgpR4NUw=;
 b=KF0Zv7y90pQuol+bN6bzIwPuto8ffDyYrNQjGDLWWAPnwt9C6VCdJusazUP5fs1CCX
 kmkevFsjO7UeReMX6q452RXWt5347PbSgIAskn9eZEPsfoXqkfIz4/FJQfuzWf66S557
 iXda1XD46Xv+aQYg3bWYVAChrNqO2nSyuRJqXhse1HA1Fn28E+ZokAztFHlda5DlxvXc
 3RPtzT8CTDKN/OJFwnynzGYXFqx7USeil5LBV4b/xdtXt041JtHKF0A0rIE0DR8oWF6u
 uHerV1IinNnkC7crJ1SyyZIbg+la0YMxFY6sfM69l6FX+GKsYXY07GzezhG3Jq6CQmGj
 zHWg==
X-Gm-Message-State: AOJu0Yxu1yfipnybthf6455Xp6QBZuWOaQoWk6RcDqDd2fL0QP+NNoOC
 WvaoPCZEuZ97/CWoHECIJ2UCtg==
X-Google-Smtp-Source: AGHT+IHFMnXZUrhiklqVDe4kTxE7DLZBACRCi4hG7mrJ/KUblxrabGmnW13Xv4sT+GVKGSWiocUudQ==
X-Received: by 2002:a2e:9802:0:b0:2bf:fb49:6619 with SMTP id
 a2-20020a2e9802000000b002bffb496619mr6075076ljj.23.1695651664078; 
 Mon, 25 Sep 2023 07:21:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 r21-20020aa7c155000000b005227e53cec2sm5611950edp.50.2023.09.25.07.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 07:21:03 -0700 (PDT)
Message-ID: <58fa7a78-c095-a3d7-32d4-9a39d0482988@mind.be>
Date: Mon, 25 Sep 2023 16:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20230918194519.68987-1-ju.o@free.fr>
 <337d9023-7587-ef8f-3e61-f7bd16f333ff@mind.be> <87zg1abbk5.fsf@48ers.dk>
In-Reply-To: <87zg1abbk5.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695651664; x=1696256464; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zz2NRl448rps+FuxqGiqiRhGqw3RiY2J6wQTgpR4NUw=;
 b=Q4fCD1+V94A6UCB3F44947ie0APifliTQCsaWr/aVGT7bbOfFKb4OMpr+8wnXJD9i7
 kR3hLJQM1D7uvW6eAlQWc/PIZG1qFfVwvvztjMLeGSVJFYEB0R7deuxo5a3Aw99f9hDY
 ivOq0R9i4Fhg5SVD0rE/Vlza+B5Q+MA5UvUybEhP/NPjRf8/5G7JBFQS1G/3FjnjszQX
 Vtrd10PDP7uIeAArCKt2VtrUOo4TWRImPveb4PDGqy3zuXjogHmWzOW7cy3TMTW0yAas
 vXi22WdRYHkINZ7DQpPETCWMStNadmKHWbOSryP4hQKC8KKQXQslxMbvSq/PsR0uj0uJ
 WthA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q4fCD1+V
Subject: Re: [Buildroot] [PATCH 1/1] package/tcl: fix package patch
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/09/2023 15:57, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:
> 
>   > On 18/09/2023 21:45, Julien Olivain wrote:
>   >> The commit 4e365d1768 "package/tcl: bump to version 8.6.13" did NOT
>   >> refreshed the package patch, because the patch was still applying
>   >> correctly and the package was working as expected.
>   >> It was refreshed in the previous bump, in commit 9cf314745a
>   >> "package/tcl: bump to version 8.6.12".
> 
>   >  I've added here that this commit was part of 2022.02, to make it
>   >  easier for Peter to know that it should be backported.
> 
>   >  It was my original mistake to commit that incorrect change, so I've
>   >  committed the fix as well :-)
> 
>   >  Applied to master, thanks.
> 
> So this presumably means it needs to be backported even though it
> apparently worked (or built at least) without / with the dummy patch?

  Yes, it was a runtime issue that was fixed by the patch.

  Regards,
  Arnout

> 
> Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
