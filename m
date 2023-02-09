Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC55C636D3
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C723D408BC;
	Thu,  9 Feb 2023 20:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C723D408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uw_r5Dwre5fX; Thu,  9 Feb 2023 20:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08561408DC;
	Thu,  9 Feb 2023 20:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08561408DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2324B1BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED6E9408E3
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED6E9408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9HQP_GNn8F3 for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:33:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C08F408E1
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C08F408E1
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:33:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id hx15so10041042ejc.11
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kc+AWYpycjYqIK7xuHEi8t3GD5EHBm6eM9GKe+z03qU=;
 b=nX4aVLVhdE+Xx/AAtQJMjOk699lucP858iAzePjb1MWZvWlq/xbqmN9Sw7RdTp1Tet
 hM15EUu5kn5CcYdh+a1MV8H4E2or8yFmmXneRQStmVaT3iHfZs3Uljo5GEaR4HOWAsTX
 ++24hiob6jutIKn8vFjHrLy6vtxyrkdRc46BA/oxpWqTPzXxb8daqrcsa00jcndOkhF/
 /MAgOwXEWhek3/J5RRQSWjTCMQfNnDTWWPv7fjFM18ou/O/M/jmjvR3SPjnV8l8zxiYv
 jaim2nTpZGpGCwkfz5RA20aqU4Hvi03sHCWOmaMQL1mAmt773uRv8JURfY9ANbv5T1w5
 xprg==
X-Gm-Message-State: AO0yUKX0g1yajsEPNZx/Rx68Wf216VlZInli4UpsVnEuSVgS58ZD3sb7
 72VI/qPNo9AvIEsuZW9WQIRDwQ==
X-Google-Smtp-Source: AK7set/8ExVlxHYsQ+pDMEbT+wBKrbakG9ZqUKIIxvxF+oZ/sk7JOToNrGtaoejTs1hzATW0nZh4YA==
X-Received: by 2002:a17:906:a14e:b0:884:9217:4536 with SMTP id
 bu14-20020a170906a14e00b0088492174536mr13363704ejb.64.1675974824876; 
 Thu, 09 Feb 2023 12:33:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170906d10500b008784bc1dd05sm1303966ejz.76.2023.02.09.12.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 12:33:43 -0800 (PST)
Message-ID: <5e0e6c1d-7eed-4fe8-8a33-c59e04d84254@mind.be>
Date: Thu, 9 Feb 2023 21:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230209185203.262016-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230209185203.262016-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kc+AWYpycjYqIK7xuHEi8t3GD5EHBm6eM9GKe+z03qU=;
 b=akR99N/mqJKblkoZAuVhdh63DhNdaUFIv0jhQL3SuZZ9E4YSZG8o9meZejjh08NKEO
 ilK0YQWbCCz3e9nxNq36ARKSrSashYQMzhJND1cNDGw8ClOIG3S0RadhxPN6NWQ6CS3v
 NmZzHEkadP7mkrXSszkD6c/gHUVzdSmrtoWG3+qk6OR7nidiHYg521vNP+nWCqi/p700
 QPuy9xameiU+HXkWjunle3t1Au+cqy9MDgEvy9svuIHII0RO9ROGy/VpupRoax9Rk+z9
 nt54e94U7ryU1dN8mpCTGmwLK6Uu1yLKV27t6Prg7yAhde8vLgeG8XddE7GLR1hIFWnp
 qz6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=akR99N/m
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire-media-session: bump to
 version 0.4.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/02/2023 19:52, James Hilliard wrote:
> Explicitly set installed_tests to disabled.
> 
> Drop patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...remove-session-managers-option-check.patch | 36 -------------------
>   .../pipewire-media-session.hash               |  2 +-
>   .../pipewire-media-session.mk                 |  7 ++--
>   3 files changed, 6 insertions(+), 39 deletions(-)
>   delete mode 100644 package/pipewire-media-session/0001-meson-remove-session-managers-option-check.patch
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
