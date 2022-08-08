Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6579EC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 16:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF21240A91;
	Mon,  8 Aug 2022 16:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF21240A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGesed_jTFNS; Mon,  8 Aug 2022 16:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4634E40A71;
	Mon,  8 Aug 2022 16:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4634E40A71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3BDA1BF2B3
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 16:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB12360DF6
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 16:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB12360DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uj_Tkr1PhzMM for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 16:56:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 819A760D96
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 819A760D96
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 16:56:04 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r4so12079297edi.8
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 09:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0FU9V0RZDR1MGYVjsqf5Xv2riqaWQKR7na85kKkfNUI=;
 b=0Piz110JWY0YJc9zrLIDVsWRCb00jHZJbAqz0ycMCmuXltF2/9j6sIc6Yy7F6fGQHV
 1oRCAoptJpU5tYnpgx7WTNsF+mWuYetAC7PE4mM2rK9ZTJ33MjmLMz1N9qrPJkF7yNWv
 D+jo/E7KDyXFKGQuN/kwpf6CabCGfpzvS/r9mcpXvJLIVDGYD78GPLoqaeI6LsckDxND
 vSTBltZ0u+c2fF8v42WXdchMBGruOQ7XQJ9ifCDsgX9ydbg66E3T53CYHZ0SzuGOmdrk
 lLDTqOz1/z+TPaBlBTFHAEO4KbKjMOsnOoCX1QDwjNVSrh3qktpNNLYG0nBsfyWzckx3
 XaMQ==
X-Gm-Message-State: ACgBeo0/x9aOqLIITj56/uEZbI36fkCKMaAddSG8TnJddy/7mUBoJJIT
 mPd7WVf82MznyLmKMr9s/B9byw==
X-Google-Smtp-Source: AA6agR4XIKCvicfPsxyz7H+pjyTzujYpC6Xj9v2fq0pQHByLyUwYgC2chatkq3av0MWWMn6yA+woDQ==
X-Received: by 2002:a05:6402:46:b0:43a:f611:5992 with SMTP id
 f6-20020a056402004600b0043af6115992mr18930916edu.18.1659977762612; 
 Mon, 08 Aug 2022 09:56:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 q35-20020a05640224a300b00440a1888e00sm2504466eda.59.2022.08.08.09.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 09:56:02 -0700 (PDT)
Message-ID: <cc434baa-382f-7788-5e2c-5ba1a4445e50@mind.be>
Date: Mon, 8 Aug 2022 18:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220804204656.31915-1-thomas.petazzoni@bootlin.com>
 <20220805165705.GH3621445@scaer> <20220806153924.2cb54040@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220806153924.2cb54040@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0FU9V0RZDR1MGYVjsqf5Xv2riqaWQKR7na85kKkfNUI=;
 b=bKUAxCZDHUHRM3Dy9pKxyDeMXqgSaMjmYWwdy8Aab1/mqBdV65SrcU2ifiZ1te8qDz
 3J4SDGIP+i/KNGiLT1GuFtWuw9pLPtqbrRFhyOj9OZpoMIBFyAwpTN02YFbxMGso/T4V
 QCxJf/1BlE0uhQvT8u9J4/zYB9FtLpByUpLHvmnZcuuxmyLT1gS/8G6dGDvQoidegX2+
 +rav7ycLkq3xUKbWjTG9kir8KxWQdt2cg0kOfwNrYBOpXnRuxcpoYrB5wBOPQ8ENcatY
 j9nZOxCXjTISO319FFSiq+g5DqoMFi99VlVLPukopqg19Z8lrsYxksj3veJrPaW2ZoLm
 wX7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bKUAxCZD
Subject: Re: [Buildroot] [PATCH] package/weston: add option to build
 seatd-based launcher
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



On 06/08/2022 15:39, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Fri, 5 Aug 2022 18:57:05 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>> On 2022-08-04 22:46 +0200, Thomas Petazzoni via buildroot spake thusly:
>>> Since version 10, the weston-launch command has been deprecated, and
>>> can only be built with -Ddeprecated-weston-launch=true, which
>>> Buildroot does not do.
>>>
>>> So the only launcher currently available is logind, provided by
>>> systemd.
>>
>> Forgot to add in my previous reply...
>>
>> Is a launcher mandatory? Should we en sure that at least one is present?
>> I.e. if dbus+systemd is not set, then select seatd?
> 
> I am not 100% clear on this. My current understanding is indeed that a
> launcher is needed.

  My understanding is of course extremely limited, but I believe it is possible 
(and relatively easy) to write your own launcher. This is relevant if you want 
to run a single application on Wayland (which is sometimes easier to get HW 
acceleration working in libraries than using DRM/Mesa directly).

  So I think it's not really needed to force one of our "known" launchers on people.

  This might be a use case for the newfangled "imply" Kconfig feature though.

  Regards,
  Arnout


> However, it would be possible to use the logind launcher with elogind,
> which is Gentoo's extract of logind from systemd as a standalone
> project: https://wiki.gentoo.org/wiki/Elogind. Of course, we don't
> currently have elogind as a Buildroot package.
> 
> The options would be:
> 
>   - logind launcher, with systemd
>   - logind launcher, with elogind
>   - libseat launcher, with seatd
> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
