Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F147C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 18:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1893560BF4;
	Fri, 29 Jul 2022 18:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1893560BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zX5MycwP-LOz; Fri, 29 Jul 2022 18:52:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 254DD60B4A;
	Fri, 29 Jul 2022 18:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 254DD60B4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 373061BF575
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FC6A40126
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FC6A40126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FfIuAN6twUML for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 18:52:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7EBC40BF5
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7EBC40BF5
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 18:52:15 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ss3so10004537ejc.11
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 11:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=s8you4KXlr5aOFlUEDAx7c4MiXvKqEbs2+NkthG4tIc=;
 b=eoroy5xX4DDq3yf8YOIMKH66kOgnhU30rF+yvNXLT9zF4t28xzVfmEdZGe/5Q0JxXi
 JgbiKB8ZlYUWtf+ZR8bh74jV9LuC5OJZIjwMtMRediAK4NC4mo5Va3DqDGkQ/IMbpzLD
 MoU/wnLUOu9pWE9bVjV083Ky4/T9YGLMABhql/1iZ2k6H42AgbJR0yxRgV/lkpeSZOFK
 Em+jeWbexB6M+OTfLBN/9LUaqUu87vIRocnBxIOhscwhlcL/Cf18Akr5hkjEGsPQJyKQ
 DFLF9Bi9xpzXWWUUWDnGabPmhvcHPdCkThFd86kdwgr0kzQHxaIYxZKa30wPuBeMRN0t
 m7Yw==
X-Gm-Message-State: AJIora83hEB6Rl1Xv+LLgT54ywc/gT0lHsD1cooRHYQnWRhqCd6UWTqx
 Kcf1qoGSBGolv9//5Eh3UEOGgUSRAuHELw==
X-Google-Smtp-Source: AGRyM1tRkmoX9gnJj1x/3EcVpbDND+DCiL6OFzaiyFHvqUbXntV5ZAdN6gO2OE53iBO2IjUh1/fmWg==
X-Received: by 2002:a17:906:2bc7:b0:72f:dc70:a3c6 with SMTP id
 n7-20020a1709062bc700b0072fdc70a3c6mr3908969ejg.645.1659120733836; 
 Fri, 29 Jul 2022 11:52:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 mr42-20020a17090782aa00b00722fc0779e3sm1972791ejc.85.2022.07.29.11.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 11:52:13 -0700 (PDT)
Message-ID: <fb9c0859-2b4e-8c70-0ad8-7c9d1723769a@mind.be>
Date: Fri, 29 Jul 2022 20:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Adam Di Carlo <a.p.dicarlo@gmail.com>
References: <20220728185030.31A1E864E7@busybox.osuosl.org>
 <87y1wc7tel.fsf@gw-ny.onshored.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87y1wc7tel.fsf@gw-ny.onshored.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=s8you4KXlr5aOFlUEDAx7c4MiXvKqEbs2+NkthG4tIc=;
 b=Bh+ZCZX7wCaVoeYN01EU0Pk2B82NZzGZSyVx6bK3Pu5zM2ttG+4Y0Vfgx0hG0UBGQy
 4WFqgy4J3ftDoG2ewejEongzW3xI2iNOd9ljbxnL60ZZE4h3xz90MrxlvW8QgJ2I6uOq
 YrqAif7fHqnXEeUuDxX4gCr9D2QshwUueJCMZo0s/fyrhbMvJxLUK/hWsQfjFjPmZYQy
 NV+pSdJatZ1m976dg06ptNfDOaoi+zlc0p4638akJdbSKNIdkZ+cU2MYAAq0HK+QbLk9
 1z824F47a4gPiBBej7JKGxnfj3OkLndxEHdBgYPyXEW4s3ocAMRs/GtSm8Cvx5/TSZ9O
 sBWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bh+ZCZX7
Subject: Re: [Buildroot] [git commit] package/pkg-autotools: use /run as
 runtime path
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/07/2022 00:40, Adam Di Carlo wrote:
> Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>> Note that the configure script bundled with a package may be generated
>> with an older version of Autotools, that may not yet support the
>> --runstatedir option. This will give an "Unsupported arguments" warning
>> and the option will be ignored.
> 
> Or, in some cases, will terminate the build:

  I tested it with a few packages and only one didn't support it and just gave a 
warning. I didn't test readline, obviously...

> 
>> make readline-build
>>>> readline 8.1.2 Configuring
> [...]
> configure: error: unrecognized option: `--runstatedir=/run'
> Try `./configure --help' for more information
> make: *** [package/pkg-generic.mk:283:
> 
> Obviously, this can be cleared up by running 'autoconf' before running
> ./configure but is that something that should be done universally?

  Absolutely not, autoreconf is annoying.

  I'll send a patch to pass it as a variable instead of an option, like Norbert 
originally did. Goes to show that I shouldn't be trying to be smarter than him :-/

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
