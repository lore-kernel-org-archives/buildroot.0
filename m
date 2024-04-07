Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895D1CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E2164148F;
	Sun,  7 Apr 2024 16:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61FEAMkYnbbB; Sun,  7 Apr 2024 16:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03953414E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03953414E5;
	Sun,  7 Apr 2024 16:05:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BFF21BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48F1F8204B
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXIBPGAew9vZ for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:05:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 531108204A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 531108204A
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 531108204A
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:05:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-416422e2acbso3961025e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 09:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712505950; x=1713110750;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PMYCk0Jvh9LwyF6FVGEp4Vwn0laTFEO4D32bHeBluvg=;
 b=SRzFwvjsZzue0Whl001JRXryWjC/bqAl0nITfR4XG56d+GKNdIeFJ0HcYYAf34aPgx
 37MM3MoP4aGBeYiAm34weF+6g8ai1vZQjO7Bet31VRTWV/Td2MvETG9R0As2rOqIXrmj
 B7/bXLZmxHiaNBprXmCo1adY/1eYhDJwNMgJEZRPo4fK9jHHHeAOXta/zT5YcvTFTgTX
 ErXqh8lxroPp2UDrkKBTG+KHJGNVmb2InNx8DJQs0GHglz3szn87dFOvl8ZbH2Dwr+Rh
 FkuSzaRtxQICOzFUTYsJscCQmlho15LwTeEF9TJhjMKth2VpX5yScGiul35k5Gxl9+hW
 sUWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwX2PkEC+1qNShTOzME0JQFEOsOn2lHDXR/U+Dgf8ROExiWlaPYfPWlXMUwSn2Zcl4CTEr/uvlozZ1GZsgJvG4AzvTdXFA6w==
X-Gm-Message-State: AOJu0Yzbn3xFSN1ffSsTgTR0RewQZXj8aH5hUEpl2mRBzm5GXqX8IqYd
 ECjA4RuD84+zcpeqzb5XHokgN9SdcQH4JsdzJyuHMQ4L/8qt9YG0pRIMhKklpMUjSmWWRg4zsCW
 M
X-Google-Smtp-Source: AGHT+IFKB797yEDsE2/MSGlWKT56z+PCXVyv6m8u8aCmEuHNBZfQafvQCOS5NxDDhwbS7cT8CTjTGg==
X-Received: by 2002:a05:600c:470d:b0:416:6adf:fe44 with SMTP id
 v13-20020a05600c470d00b004166adffe44mr721063wmo.17.1712505950267; 
 Sun, 07 Apr 2024 09:05:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b00416509d7d95sm3427973wmo.37.2024.04.07.09.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 09:05:49 -0700 (PDT)
Message-ID: <3cd3fda5-eb97-471e-abbc-e40cdf320567@mind.be>
Date: Sun, 7 Apr 2024 18:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240305111134.298279-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240305111134.298279-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712505950; x=1713110750; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PMYCk0Jvh9LwyF6FVGEp4Vwn0laTFEO4D32bHeBluvg=;
 b=YbRUNVJKhN6CPt6Llpg+8k1nn7riFdl6eWhaHJpZ6GNI2yAvZPptsdm/DI6XkWogNk
 vU/2wvXYAi7HOKOPYar5Idm+64hM12rqaLia2DmuTLDiQPPCkn1c1Xhy/G/nKDK64Zf6
 Nr25gZsYUg3QKrnlg568UP9FCQOkMx0VwDvItsVdu036K1Yyhci7vsJVu1UdD3bImfDh
 ARRWs0pWQHHpqjBrCJOK6M/UevM5yH1TDCplobPIvFJ0WAaBpxpwlxUQ52RWrqSReRnN
 XRxLULiI3nBxKa41W3oHWrpm99LZVzMzxSKaNRk5lwWOXsio7oDzrDLB0UTnBsmoM/YM
 iJkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YbRUNVJK
Subject: Re: [Buildroot] [PATCH 1/1] package/dmenu-wayland: fix uclibc build
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/03/2024 12:11, Fabrice Fontaine wrote:
> Set -std=gnu99 to fix the following uclibc build failure raised since
> the addition of the package in commit
> 2f6b1b8e6893003efcc72185cd468dcb0b088b2d:
> 
> ../draw.c:37:23: error: 'CLOCK_REALTIME' undeclared (first use in this function)
>     37 |         clock_gettime(CLOCK_REALTIME, &ts);
>        |                       ^~~~~~~~~~~~~~
> 
> Fixes: 2f6b1b8e6893003efcc72185cd468dcb0b088b2d
>   - http://autobuild.buildroot.org/results/4b9db67fb444ec35d741e5d3e74263ac0c4d4a7d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dmenu-wayland/dmenu-wayland.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/dmenu-wayland/dmenu-wayland.mk b/package/dmenu-wayland/dmenu-wayland.mk
> index 33a73c0153..fec984194c 100644
> --- a/package/dmenu-wayland/dmenu-wayland.mk
> +++ b/package/dmenu-wayland/dmenu-wayland.mk
> @@ -8,6 +8,7 @@ DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
>   DMENU_WAYLAND_SITE = $(call github,nyyManni,dmenu-wayland,$(DMENU_WAYLAND_VERSION))
>   DMENU_WAYLAND_LICENSE = MIT
>   DMENU_WAYLAND_LICENSE_FILES = LICENSE
> +DMENU_WAYLAND_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
>   
>   # host-wayland is for wayland-scanner
>   DMENU_WAYLAND_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
