Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F320C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A951540135;
	Sun,  3 Mar 2024 16:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgGAL-nq9ql4; Sun,  3 Mar 2024 16:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59C8F40469
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59C8F40469;
	Sun,  3 Mar 2024 16:01:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4117C1BF293
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BD1781EB1
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jyRN2ynfTU_y for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:01:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30F7181656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F7181656
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30F7181656
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:01:39 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6e4e4808761so24734a34.2
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709481698; x=1710086498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6LFCX3x/AvZFsYxUAG254KCtk+fSi4WxL8XE1IHzRsE=;
 b=e7t3mAT8BkbCfQTxNqSkXr0rmmD+TAq5iJSbvBiSuN2duzkbHYG15fm/EGyfeD/tP7
 fG09nCYyYukiLOYJRFbySxgRomcVmsdxAB+wH+3KoaCGtR950bblla6ujfTnqbphX7st
 QOyWENWQUW3cgJ02Yk9TAL4njrMXj/63bVmf4UHN7bstHjKymBSmxsoPpNSq02D1OTGL
 3IpLxm/XDPhH2suYDblH7iPaziDQPZ4nlouV5RookZv5gTNXvVZIX6CItrJMso8BI+sk
 eDsAnZn+qBEKswN4Fo9MohCHD2MBkLNnHzB4MXlvgLAXzISyCP2JQREgJJsdOnZj0qnd
 v73w==
X-Gm-Message-State: AOJu0YzlOcytMg+zxAS6uvCIO/cMaNsrAHWbMa1oIqPnP/1nkC4w9cXQ
 8LoNiY2tWHfeQCURjJISjEEpoUCMkQoA+dL/Cjyndg3jqcnWQv9ibp+Qezz8fy8=
X-Google-Smtp-Source: AGHT+IGSZbN82+6v3QPiu1xfI0OxZ898344wQO6sKAb38Dvbqx3cK9uCLYjXZ3vhC5Bag78gKBru+g==
X-Received: by 2002:a9d:6318:0:b0:6e4:767d:a085 with SMTP id
 q24-20020a9d6318000000b006e4767da085mr6272506otk.24.1709481698170; 
 Sun, 03 Mar 2024 08:01:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 k34-20020a81ac22000000b00604198c3cafsm1409249ywh.61.2024.03.03.08.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:01:37 -0800 (PST)
Message-ID: <78c7696e-411b-4311-9af5-0f4862dc85cd@mind.be>
Date: Sun, 3 Mar 2024 17:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Julien Olivain <ju.o@free.fr>
References: <20240226203532.12112-1-ju.o@free.fr> <87y1b2bbqu.fsf@48ers.dk>
 <6d71ebe7eaf04f68ec07509930728eeb@free.fr> <ZeM5rb57dMFPvyIL@landeda>
In-Reply-To: <ZeM5rb57dMFPvyIL@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709481698; x=1710086498; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6LFCX3x/AvZFsYxUAG254KCtk+fSi4WxL8XE1IHzRsE=;
 b=ZyqiQm/5CS/1oHF4FNmCwMvPiCO192nLyX9uqTqy8AiTkXna9r8Pwmw0U++2Wb2j5w
 LkALjJXabrWvvJMJHn03m3HkmkJrljh5B5fdB2VwVrRypcm98dB+6Jnlwyf/kT5ZZmmn
 AFtlpQzFJIowUuB4M8nuYTVGY66h3rYUnLY92XNMaBdJI9RrauiAHu0z2142raCu4iP7
 2VSmLaqh0Uq4rJBnsErUREzjR+2ynIG33KaBXsL2hLnMgvZsRK0QhSiTyiSEmKHosUwV
 Kye7ulJ43xaUn9IZv+XsjPLj7I7h+EWOynm0tdruIO2r7U6270wBNjhzJ6V6ZaJhLPSB
 6gSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZyqiQm/5
Subject: Re: [Buildroot] [PATCH 1/1] package/mysql: change default
 implementation to mariadb
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/03/2024 15:37, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2024-03-01 22:45 +0100, Julien Olivain spake thusly:
>> On 01/03/2024 09:24, Peter Korsgaard wrote:
>>>>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:
>>>   > The mysql package is a virtual package with two implementations:
>>>   > oracle-mysql (the initial project), and mariadb (the fork of mysql).
>>>   > This virtual package was introduced in commit [1] (2016).
>>>   > The last version bump of oracle-mysql was in commit [2] (2014). This
>>>   > mysql version 5.1.73 dates from 2013 [3].

  There's one reason to prefer oracle-mysql: mariadb (server) is almost twice as 
big.

> [--SNIP--]
>>> Thanks. Maybe we should instead get rid of the oracle-mysql package (and
>>> the virtual package) if nobody cares about keeping it updated anyway?
>> I was initially thinking about proposing a big bump to mysql-8.0.x some
>> time later. Upstream has still specific features that could be interesting
>> to somebody...

  Unfortunately, mysql 8.x is also much larger than the old 5.1. So for this 
particular concern, that's not really a factor.

>>
>> I personally don't need those for the moment, so I am also OK to drop
>> it with the virtual package.
> 
> Let's face it: noone cared about that package for most than ten years,
> not even for those features you mention, so it means noone is interested
> in using that package.
> 
> So if you do not use it, don't bother expanding the time to update it.
> 
>> My initial intent was to raise the attention on this decade old package,
>> with quite a few CVEs associated to it ;)
> 
> "Quite a few" is probably the best understatement of the year (and it's
> only March!). ;-)
> 
> So I'd side with Peter here: drop it, and then drop the virtual package.

  Agreed to that.

  Anyway, I think mysql and mariadb are less and less drop-in replacements, so 
the virtual package is

  If really needed, I think mariadb has a few large subparts that can 
(optionally) be dropped, so it should be possible to reduce the footprint. If 
someone bothers to work on that, of course :-)

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
