Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798E5CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EAAC82096;
	Sun,  7 Apr 2024 16:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sL1u_q7_zHF; Sun,  7 Apr 2024 16:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C39482098
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C39482098;
	Sun,  7 Apr 2024 16:11:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85B7A1BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72EAF40C1C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ev07BYVeRj8p for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:11:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38730404A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38730404A3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38730404A3
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:11:18 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4165d03308fso4236725e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 09:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712506276; x=1713111076;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PmrmXhEYgDnGG5MtAz76/mU7z0Oho9+dB7uX1T47IYg=;
 b=btFcBdqLnsS1gJKRfdwpqSGDQsY6+8dpIcGX26RMcpnlc+mNnCMui02J91Yd2cameS
 WithdkD4g5BnBkttqKBYwtXQdGqeg1SwBzpx4ODyY1/VX+VZEWMAuo1a5xEOwI5v3a9D
 I2hGW0uUQb5Eqct1qkj7Fn6OvU9kNv7BLqoKQ7WLVGwpt/VYuv+WGsl2q1dCp61EoizO
 ykt9C+y+kT9p4V4GKou1/LIFhUUEXvpM3bXG9Ctz551EQpeH582PPaiYw7+mPAtxg+mH
 X+OXnHGovDwwgLyKLH+NJzl1MGxHYd7P18GAlJyWBeH85RM9XLMq3axzSXVemkxd9fQs
 FT6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOmDPSC+TmbXtjcT7O7M5T/Vaz0XHjZBVpT4pzd1WGvtP4sTGq/qpRF26+N0XCj+Ypav5K4h/+NQSN+kJLVOkxU6BHil8zTw==
X-Gm-Message-State: AOJu0YzY494pYwDc4lxpsV0lrhe70oj0Xfmc/gzmggI/ifIxOdVNhiBk
 k6EhzICIe6pdmiuwci+a8i/0NN7ajJoNV5J89efYB2msm/DlVUGAgwXZyJsGJG4=
X-Google-Smtp-Source: AGHT+IHN/lcqv2K/g+XkPRCiXtyNzMmIVLP1NEGCBHemz7gfBg8xrEv1oaTMYddRslK0beVSZpNLhQ==
X-Received: by 2002:a7b:ce99:0:b0:414:8c06:5c32 with SMTP id
 q25-20020a7bce99000000b004148c065c32mr6571263wmj.14.1712506276149; 
 Sun, 07 Apr 2024 09:11:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b0041562a58b75sm10243007wmq.13.2024.04.07.09.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 09:11:15 -0700 (PDT)
Message-ID: <834828e5-042f-4588-9ed6-10fa5a5e2502@mind.be>
Date: Sun, 7 Apr 2024 18:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Naumann <anaumann@ultratronik.de>, buildroot@buildroot.org
References: <20240306111212.1331451-1-anaumann@ultratronik.de>
Content-Language: en-GB
In-Reply-To: <20240306111212.1331451-1-anaumann@ultratronik.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712506276; x=1713111076; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PmrmXhEYgDnGG5MtAz76/mU7z0Oho9+dB7uX1T47IYg=;
 b=Bxs73AVe2goSN3KezP1FIGKjkq+L+NVv7I5834usxr0TaPQUUF1lN7+3bwaFYUGWVg
 SGCtv++9Pw4Zk+CMcTLKQPTsg9VSgFgFuBwht81pm3D6T1hita3p0LA4tiUP4okZhTkB
 wth9dw0xdEFp78mwrXgimZ9HbDoMoUVq3EAXqwtUj1jhe9UQcK/MmCWM/KyGYg5TCxDe
 2buJI48GvFeGtCQBqq6YTJlOx8cg42eQM2Vk5MkRWATLyUWZLHoomlnq3+oMf8s9YZIA
 pwLkMjTysVoMMRX0D90nX4S+bzzW3wk3w0/DhBQdeEFumv/NWKcaVOknEHUbRIazqjEk
 Lo4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bxs73AVe
Subject: Re: [Buildroot] [PATCH 1/1] package/imx-gpu-viv: fix masking fb
 option
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Andreas,

On 06/03/2024 12:12, Andreas Naumann wrote:
> Only the 32bit ARM blob provides the framebuffer backend. This is
> apparently independent of which imx8 derivate is used, so changed
> the condition for the config option accordingly.

  You should have included some references here so other people can double-check 
this information.

> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>   package/freescale-imx/imx-gpu-viv/Config.in | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
> index 3e095b730cf..b8dff8f9ab6 100644
> --- a/package/freescale-imx/imx-gpu-viv/Config.in
> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
> @@ -45,8 +45,8 @@ choice
>   
>   config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
>   	bool "Framebuffer"
> -	# The i.MX8 blob doesn't support FB output
> -	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> +	# The i.MX8 aarch64 blob doesn't support FB output

  Or you can still add that later in a comment here.

  Applied to master, thanks.

  Regards,
  Arnout

> +	depends on BR2_arm
>   
>   config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
>   	bool "Wayland"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
