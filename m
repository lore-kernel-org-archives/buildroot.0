Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B352CC761A6
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 12:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 424674032E;
	Thu, 30 Mar 2023 12:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 424674032E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8BB7pPxSbLrT; Thu, 30 Mar 2023 12:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A2EF41D67;
	Thu, 30 Mar 2023 12:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A2EF41D67
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65A711BF4DA
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 12:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F68B404BF
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 12:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F68B404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCHq6Yeslmnr for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 12:33:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCA8B403A7
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCA8B403A7
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 12:33:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l27so18913108wrb.2
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 05:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=duub8CQRz2z82krFXVG44yDDGJ0JoBJGa9HBDfCp/f8=;
 b=6I6k4VPxPqD/tjFxnG0m6oINYKXHq3lvOZxdfRezu4QrUAhrcanvZCYNwIc5qJGs9p
 c2pSqWa8u9lQERG6pXNCfvgJMIF0psDX0DxHAmrLTp+aUWvkRe6OEjhCCcMpshuqBQM7
 GZ7lLLBP8P3fXQGZcmArxDAwuXWAkC3ghgoO6ekHUCp0aajvEl/zls7ZZceWB03MMvV5
 hyMZI3J6bKMEO2RwD4ExPCtNeCtzmIbcEt1xIe7sFVs1PYqzbTl01jbwn5mje0aHW/hy
 jcQNdhn0SAPsPF/COlDysQ5Xk8aA1TWAc4ShJRC0Zzu+ubtcdo7zfk7bzEPQXFaNT5zV
 VpdA==
X-Gm-Message-State: AAQBX9fkvRaXJjFDMAeKZb0OSBNA+RDM5FneZNyU5luZyeKY0X4jqByT
 I7Fv3uACwwFD3OQ+gpBM8dB2Vw==
X-Google-Smtp-Source: AKy350ZyWEg4U73ZMxwNwf+3AJV8h/R26PQTLyWLiAGdzOxyqihlKR7/kMCc3WR42fEmMWHtF7UVrg==
X-Received: by 2002:adf:e406:0:b0:2cf:efd7:2f1d with SMTP id
 g6-20020adfe406000000b002cfefd72f1dmr18395467wrm.13.1680179607560; 
 Thu, 30 Mar 2023 05:33:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5832:e39a:9a75:d5d9?
 (ptr-9fplejo60ve24so2vvd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5832:e39a:9a75:d5d9])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d65cf000000b002de9a0b0a20sm13239433wrw.113.2023.03.30.05.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:33:26 -0700 (PDT)
Message-ID: <d04a0e76-d934-919e-a883-f526599b1275@mind.be>
Date: Thu, 30 Mar 2023 14:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230326130937.56650-1-f.fainelli@gmail.com>
 <20230328202533.GD3204460@scaer>
 <c7968ace-cfbb-1c54-bdde-083a37423686@mind.be>
 <20230329105022.6137bf1a@windsurf>
 <ffed7523-6dbe-6d61-03e7-57cdbc732097@mind.be>
 <20230329112855.6110cf8d@windsurf>
 <f4e1e805-4ab0-e187-8001-c5cfa9c0be00@gmail.com>
 <84821597-4e34-2e1c-99f5-4d03bdda0d45@mind.be>
 <20230330142133.002fa797@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230330142133.002fa797@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1680179607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=duub8CQRz2z82krFXVG44yDDGJ0JoBJGa9HBDfCp/f8=;
 b=Mu1p+wz4ENQ3MB8Nm/tCpDdM0tOxGAEJV4xmMN2e66CyCAzwiB2T669KOC6GvEgw3w
 mCdeuqLZkFBj/IfaEYVA7kTnHQPYVf25asJ0qa7HtXam8sjNow/AxsntO/LhofMhzrvs
 BKmwZ20qzOTzHLM3e26gyDMu0mvHKcUYub/nooeaPuS/bC23bn0+ycgMl5EXo2rUwGI6
 3DGBaDKpKwcu42GOaXF8uoLAxEDTFkFadeq1WviTnxBFoXwRJTSAwvTnRLB8iVaBYZBL
 rtqeZ3KGNTTV7kHJFvRZbgExXkT8/c3vi5n7irTRpBd+lS/oI90xge1P8tedT4gjZezY
 mDrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mu1p+wz4
Subject: Re: [Buildroot] Indicating upstream status [was: [PATCH]
 package/bluez5_utils: Fix builds with musl-libc]
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, marcin@bis.org.pl,
 d.lang@abatec.at, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/03/2023 14:21, Thomas Petazzoni wrote:
> On Thu, 30 Mar 2023 09:03:50 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>    That's where I got my inspiration :-) I just find "Upstream-status" a bit
>> long, so I abbreviated it to "Upstream". Also, "Submitted" and "Accepted" are
>> not really useful because the upstream status is going to change while we don't
>> change our patch. In addition, a simple URL there is enough information. That's
>> how I got to:
>>
>> For Submitted/Accepted:
>> Upstream: <PR/mailing list/patchwork URL>
>>
>> For Backport/Accepted:
>> Upstream: <commit hash> [submitter@email.address]
>>
>> For Denied:
>> Upstream: Denied <PR/mailing list/patchwork URL>
>>
>> For Inappropriate:
>> Upstream: N/A + explanation why
>>
>>    Only "Pending" is a little iffy - we just don't want "Pending" patches I guess.
> 
> This sounds good to me.
> 
> For the Backport/Accepted, I tend to like when it's the URL to the
> commit on Github/Gitlab/Git repo rather than just the hash because then
> I can just click on it and see the patch. Also who would be the
> [submitter@email.address] in this case? The author of the upstream
> patch? Why do we need to replicate that information in Buildroot?

  No, the person who did the backport. It's inherited from Yann's original
[yann.morin.1998@free.fr: backport and adapt from upsteam 1234CDEF]

  OTOH we have the SoB a few lines below that says exactly that, and also the 
author of the commit in buildroot that adds the patch, so it's pretty redundant 
information.

  Regards,
  Arnout

> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
