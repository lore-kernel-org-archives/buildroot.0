Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F588C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 12:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0EAC81322;
	Sat, 12 Feb 2022 12:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkID1JqJi7yN; Sat, 12 Feb 2022 12:42:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 203F681241;
	Sat, 12 Feb 2022 12:42:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B15F51BF84C
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AF9F40278
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCkpj7u439xS for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 12:42:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA41740272
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:42:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a8so28043732ejc.8
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 04:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=27IrKFK6gGnGx+vxqKhKN46oQqO4ii/8RJHS07n/nYU=;
 b=agEPVaFtpc83rxkO2UwU3wAELYSSQsBgoUP6nfWcTw19N5GYJ/imeyl5V6tb+Tsc0j
 67BDfZRZRHLLoezfScLChIpvPhPDLjgyNMgnra3JHY2VpJxs3kgmbMY+zAIJL8Os8Nlc
 p8rlYItWztaguvWZeyDBh3AQiibO+V7jojmdHTJWhtNcRBeKnEsLg5acqGEPMc53FZtl
 gBFWfb20vToTj5eaF5gpzeuLOVW53udg438ksdB3Wn/4Y1tR/lky+UMjMFN5DoPoZsQ9
 NLqSKlL9HuKG6t1DFjHGHkjVSxoRoD4Aauovle6QRsuzJ/4Q3x+DXnlIob1v1kjEitVi
 dSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=27IrKFK6gGnGx+vxqKhKN46oQqO4ii/8RJHS07n/nYU=;
 b=4ZG5G0CKf0VjPp465GKceHyQ5Fz3DtIpXV36CaxOJQ9pwk6PJhO7iV5HrVVUmH9Wz1
 MO1clefriEpXRFjQ31f82tvXv5fANsay0n/wS+sYbaFtJPh2blv1+Do00V3r1uWoNCbA
 o21NpOW38gfdgkekGVunpZcXWzXYMrbVtDDFyGbOhNs/x7MU/zJ7o2jkeDsTYj0Y17Pj
 6iLm87GETX7r75vqTJttppFbHaWk4LhU8H3yZ/N6Fg7+fZoQHzClSVw6lH2P3U8LQdx2
 R5Pq6wVWZ9ZfQYX2/UoTdt8KReJ4btjKLStMKIEmCwk2FyyHl9MtuTPY2Fp1sUVL/7E0
 dEqA==
X-Gm-Message-State: AOAM531ILiGWTydwqjtBPz4wmO4mwOO60STczq0R4OzJCHGYrMeMj4Ad
 VIknHua2lxRuD/quPq7l5aeK5Q==
X-Google-Smtp-Source: ABdhPJy1e/Z1dqIniOKb3X9Z9WkjgLXWkpMqM4VwUqWWVf9OUScZnPhUHhD4I/9cUNOfhLsc9Fuyzg==
X-Received: by 2002:a17:906:39d5:: with SMTP id
 i21mr4842305eje.495.1644669735968; 
 Sat, 12 Feb 2022 04:42:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m7sm11273278edb.16.2022.02.12.04.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 04:42:15 -0800 (PST)
Message-ID: <b8664feb-5b6b-9261-62ab-4743a01b7721@mind.be>
Date: Sat, 12 Feb 2022 13:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <20220131145555.2819020-1-michael@amarulasolutions.com>
 <e7701dd2-5636-2891-0e47-7a518c1dc961@mind.be>
 <CAOf5uw=rqEpd5eC-tjV=bNAqwE7-VS152GByK_KZ58TCrZTbfw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAOf5uw=rqEpd5eC-tjV=bNAqwE7-VS152GByK_KZ58TCrZTbfw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH V3] board: Add support for iMX8MN BSH SMM S2
 PRO
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/02/2022 13:36, Michael Nazzareno Trimarchi wrote:
> Hi
> 
> On Sat, Feb 12, 2022 at 1:10 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 31/01/2022 15:55, Michael Trimarchi wrote:
>>> Add initial support for iMX8MN BSH SMM S2 PRO board:
>>>
>>> - Linux: v5.17-rc1
>>
>>    I'm a bit uncomfortable to add an -rc version. But I guess it can be updated
>> as soon as 5.17 is released.
> 
> Ok, I will then wait

  No, what I meant to say is: it's OK to do it with the -rc, just make sure that 
you update it to the release version when it comes around (which will still be 
another 8-ish weeks).

  If we still manage to merge this board before 2022.02, we'll just backport the 
bump to the LTS branch.

  Regards,
  Arnout

[snip]

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
