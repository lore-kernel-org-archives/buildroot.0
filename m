Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B55CC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 20:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C360241684;
	Tue,  7 Nov 2023 20:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C360241684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NR1LSvuAkXGo; Tue,  7 Nov 2023 20:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D99FD41675;
	Tue,  7 Nov 2023 20:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99FD41675
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A38B11BF291
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 20:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C57260812
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 20:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C57260812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Evjtg8R1btH for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 20:08:38 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FD0A60017
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 20:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FD0A60017
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53e751aeb3cso10153291a12.2
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 12:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699387716; x=1699992516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h2HOq0FbZvXMD2h3/mL+SBjhwttUud9Y/jNJTYkiUa4=;
 b=cR/4NpX29Qyh9SsLcY+cZvmwlwy57x8ounlFeCk03XiPjUjKjUjmp3XLa4Qg0eNPj9
 tDFi4X6CrWsuzGeIWpXtcUIiazqR0X/3V9QJN7FriLuBrx6tR3WK/JDjQNggj9jMcQE2
 APKOmFJ+nL7Lp5Cy1k+i2wsm+3y581+sQh2XVKbMVPHjDUW7teZ2IWR1BWh3Mea77tZW
 x/v0VnVbbS7MLKzoqVoFkMFTMkEHMkj3s1g4gkcAqhFjOx5gswIHbwEN7gSs2Hqe3a11
 ww9GgZRKvUlv7WNy6+bWxGm/bff3Qgbyr4HvQjNC2x0k9zg7fJSX8ffFeJd4C1xiDfEi
 ZHcg==
X-Gm-Message-State: AOJu0YzSt0FGesupsORty/Yx2MQ/cVHkVtcs0QQq236HcRlLEGjnB4WE
 VB4wXBgl4kbE8ILYXt6rPoLeWUxK6qnYlS/sG58=
X-Google-Smtp-Source: AGHT+IEhAYVoWgzTtvs//SvRUc51H5HV+WOZulLlxayFnBvsveSpT97gSoNkzg6/2ncSsH7G6t7vHQ==
X-Received: by 2002:a17:907:78b:b0:9d3:8d1e:cf0 with SMTP id
 xd11-20020a170907078b00b009d38d1e0cf0mr16813780ejb.54.1699387716004; 
 Tue, 07 Nov 2023 12:08:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 ca2-20020a170906a3c200b009ae587ce133sm1381591ejb.188.2023.11.07.12.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 12:08:35 -0800 (PST)
Message-ID: <829232c3-9456-4bf8-91dd-506cb7554649@mind.be>
Date: Tue, 7 Nov 2023 21:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20231031120713.678783-1-giulio.benetti@benettiengineering.com>
 <20231101152114.GE114892@scaer>
 <26fabf07-fc17-421b-9cbb-fb721bf63374@benettiengineering.com>
 <20231103212151.GA2875@scaer>
 <579363d0-a242-444a-aecf-83f21b4e629b@benettiengineering.com>
 <20231107161539.GD229059@scaer>
In-Reply-To: <20231107161539.GD229059@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699387716; x=1699992516; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h2HOq0FbZvXMD2h3/mL+SBjhwttUud9Y/jNJTYkiUa4=;
 b=JDwKDHmgEEOMc2bpQWc6GXNFGteoRBM6qmWGhWl6tSYBfYcaBECktI+mCpwCOg+pGa
 yT9iGwT7F/vfMFDXKDVwThZRtqXzuyCe5zqbx65Rjquwz1oyPzOCSj2A13IuQ00T8Ons
 WjC2fixzocEPmLQc4noy6PP8iR/uyyLAfXKMYNBOLCDcO95UYTO1hmqRn7bENst4BxUz
 iBQZBebeMqTVBqy2qR0lZdjLSgNy/kb9a2DbsIWysjeVzWQY2Een7zafBPzFMCl5v3Kl
 q6tgOaUDDprCMID3yOa86r0p1nBXqfA0L0Ln7pbLJ66rFf5S6bbzrUASWoU6wXLe4G3U
 rFgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JDwKDHmg
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: remove .node
 files with different architecture
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/11/2023 17:15, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2023-11-05 15:27 +0100, Giulio Benetti spake thusly:
>> On 03/11/23 22:21, Yann E. MORIN wrote:
>>> Oh, I was just walking the "npm is a mess anyway, just ignore anything
>> >from it, we don't care" road. If we take this stance, then
>>> _BIN_ARCH_EXCLUDE is a trivial way to avoid the check-bin-arch issue.
> [--SNIP--]
>> Since npm rebuilding is not that easy and fast to deal with I've just sent
>> this patch to temporary exclude the /usr/lib/node_modules folder
>> as you've suggested(forgotten to add "Suggested-by: Yann E. MORIN
>> <yann.morin.1998@free.fr>").
>>
>> Later I hope to find time to deal with npm rebuilding.
> 
> I think tht it might in fact be what we're doing already, as we use:
>      npm_config_build_from_source=true
> 
> in the environment when we call npm.

  I guess that even if the binaries for the actual target get rebuilt, the other 
irrelevant binaries that were also downloaded are still there and trigger the issue.

  Regards,
  Arnout

> 
> However, I was not able to find any reference to those options... :-/
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
