Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A304C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 21:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC31760F69;
	Tue, 14 Feb 2023 21:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC31760F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qrsx1eQ7icdq; Tue, 14 Feb 2023 21:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E62860DFF;
	Tue, 14 Feb 2023 21:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E62860DFF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4778D1BF299
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BB80403B8
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BB80403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98aQBZsTxGoA for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 21:03:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BCF940336
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BCF940336
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 21:03:30 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ml19so43414850ejb.0
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 13:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aBYwQZx8AWAdP3DozlzUYV71icoJOsEU92VwiV2i3eY=;
 b=nB/1fF1vmi5eoHDrwqCQVRXfoO3ECzwczKk9VHP5+kcB9+bcHhCNHixXqSP6e0FGD0
 avpmxeGDMIiTAfUuw2K/x9LGysF2cBX0z+M4TBwDrYwjC8lYW3cziZxge4QSzrHX0b4b
 nlwnfyoy9feh7yFQFn6BCyMvCekNy6CDoY7UBRKIc7b8/c60GbTRSZolAwzntKrKb/s+
 hkelXNZMQyeHoIP4e5xYz8QSZuV5Vkv4zPFdbarMOLks2R4hzD0/PQLcLAoCF0GlTtWW
 9sLjQhN9zGYbZtJHsGBR0WtNb2IHygEh6sG0wG9ZCsq0CQoxTcPEx8RyiTzAh6CNdKse
 T5vQ==
X-Gm-Message-State: AO0yUKXVI0DQtrYSHUnhvzG0I5xvT2wXn2A9qnJMjoBRXc99tOxTNnPN
 glKQjwTTqxhXtxHURigQtTVwmvyMBgJh/lqP
X-Google-Smtp-Source: AK7set/QD5V8ixdW3yA7QfC6OJ8n1Xt9rgL8jKwyt4zGp19b05THaw3uoHf6YIgAYLs5i86JQQfaAw==
X-Received: by 2002:a17:906:edd7:b0:88d:d304:3432 with SMTP id
 sb23-20020a170906edd700b0088dd3043432mr4247213ejb.60.1676408608396; 
 Tue, 14 Feb 2023 13:03:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5096d0000000b004aad0a9144fsm8550740eda.51.2023.02.14.13.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:03:27 -0800 (PST)
Message-ID: <87ad276e-999c-2503-4dbb-37f54d2b6e15@mind.be>
Date: Tue, 14 Feb 2023 22:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <DB7PR03MB4841CE1D746B328873113D87B5DE9@DB7PR03MB4841.eurprd03.prod.outlook.com>
 <20230210231454.4f3aedbd@windsurf>
 <d851f407-ddbd-4942-bee4-6b28b5387fe7.84fc06e6-1edc-441d-a0d1-fbc3c0d71619.a6a05d4b-f834-4abc-a293-13151789bb4f@emailsignatures365.codetwo.com>
 <DB7PR03MB4841EF79C4A0EC6DF2E96CD9B5DC9@DB7PR03MB4841.eurprd03.prod.outlook.com>
 <20230213084735.5318a511@windsurf>
 <VI1P190MB049355269BFEE0847C27546A9FDD9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <VI1P190MB049355269BFEE0847C27546A9FDD9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aBYwQZx8AWAdP3DozlzUYV71icoJOsEU92VwiV2i3eY=;
 b=BT40qIcwukxax2C9/jP/9pTcRJTTOhiRTgdIRbAuAYC7N2IjDlarfzmWdNHtc/J+hf
 y2cfvOV9ATz1xRBJCsyfXTu87vsViasHqZhLxGIVuN3nBqC/hrNTy08RkcDGphnkD4IE
 cyq9TUacPxGKvwrSjs0evKgYnN6zG0LAH0QQGFlEI9OzxrX1SAdFQ+tgZKWTmLDhMxXa
 oaf4//A12LBIQbh8dXlfScfazLRUZGZjnGEOmorUT/5RriJG1tKemy4kUy2vTeHzY5B5
 zuHmOwcERzVJ8/V5xuEdWr2HxhDzLaHrbl1RJRzn1eHfsJJhq/p01wBy3XhFENuF32Gg
 pySg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BT40qIcw
Subject: Re: [Buildroot] Dependency problem for gtkmm3
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
Cc: Dirk De Becker <Dirk.DeBecker@ebo-enterprises.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steven Boucque <steven.boucque@ebo-enterprises.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2023 15:52, Lang Daniel via buildroot wrote:
> Hi Thomas, Dirk,
> 
>> Hello Dirk,
>>
>> On Sun, 12 Feb 2023 08:51:17 +0000
>> Dirk De Becker <Dirk.DeBecker at ebo-enterprises.com> wrote:
>>
>>> Thank you for your quick reply.
>>> Will this issue be fixed in the 2023.02 release?
>>
>> It all depends on whether someone submits a fix for the issue. Do you
>> think you could have a look?
> 
> The problem comes down to an incompatibility that I tried to point out some
> time ago [0]. Current versions of cairomm, pangomm, glibmm have a different
> ABI that's not supported in gtkmm 3.x.y.
> Even the most recent version of gtkmm 3.24.x doesn't support the current
> version of of the other -mm packages and according to the mailing list of
> gtkmm [1] there are no plans to support it. The are compatible with gtk4.
> 
> As it stands gtkmm3 isn't usable and fixing it brings up the same problems
> of duplicating packages.

  So we have two options:

1. Drop gtkmm3. It has no internal users.

2. Create cairomm112 etc. packages (or whatever the latest working version was) 
and live with their unmaintained status.

  Eventually we'll end up with option 1, of course, since gtkmm3 is EOL itself 
(they're only working on gtkmm4 AFAIU).

  @Dirk in conclusion: the best you can expect for 2023.02 is for the package to 
be dropped, which isn't going to help you, of course.

  Regards,
  Arnout


> 
> [0]: https://lists.buildroot.org/pipermail/buildroot/2021-October/625850.html
> [1]: https://mail.gnome.org/archives/gtkmm-list/2021-May/msg00000.html
> 
>>
>> Best regards,
>>
>> Thomas
> 
> Regards
> Daniel
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
