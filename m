Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9F7C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5467D400BD;
	Sat,  4 Nov 2023 17:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5467D400BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zg7abP2wMK5X; Sat,  4 Nov 2023 17:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38D7D40128;
	Sat,  4 Nov 2023 17:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38D7D40128
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA1FE1BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92961821B6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92961821B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwmsCXQb6hAq for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:56:21 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80C06821B5
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80C06821B5
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9c773ac9b15so460417966b.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 10:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699120579; x=1699725379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tLHZ4rumNf9x68Ulk8WhXSvNX7L2vKZ24ivMslV+0NM=;
 b=kCKH8z+harsC54q4+0cV7PP2X7ZIJLbiQXLBvMuQB2p6fnxBNvNaYMsYFACrETrLYV
 ngQ8I+t4TW04nFsOv7I31FM9D/37/pa+J10V4HyTWvRHLWVkM26/YTFXTy1P6euY44hX
 igeSCMO8qW74/BrOO16akmh3Ob7ckZL3B0PIeNwYz+V/fBNZbWwxxbccAtpZ0kI347KG
 cW63TazW7bPRaetc2/n7gK56yJlNPWfxIO7sgXvtBsgVGPOUTrDFmG0DrsuWzl15RH23
 hGWngU206MWFVpkoN4Zd/7G4urJG541qhy1wrCKqCPp8XeBbiVCxpwpLVNaxLaTVhNSl
 fsvg==
X-Gm-Message-State: AOJu0Yypm1GfHdxMRdd6BA8iReOlp7tDdIRP8KXM9f5972Dak6T/Tw0a
 n43UNLcfw146SXuh1AXKOb/Svw==
X-Google-Smtp-Source: AGHT+IG6tUj0Y7hQP9q0PuejjAsza+YWc+AfEUXk+cp8bIEQjnC/qCyfzX/C2vIVKJf8MgM0KaK/cA==
X-Received: by 2002:a17:907:2d91:b0:9ae:5765:c134 with SMTP id
 gt17-20020a1709072d9100b009ae5765c134mr12250438ejc.15.1699120579038; 
 Sat, 04 Nov 2023 10:56:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170906368100b0099bd453357esm2167290ejc.41.2023.11.04.10.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 10:56:18 -0700 (PDT)
Message-ID: <7cb331a5-d1ce-49fc-8ef4-7c6bed031717@mind.be>
Date: Sat, 4 Nov 2023 18:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-17-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-17-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699120579; x=1699725379; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tLHZ4rumNf9x68Ulk8WhXSvNX7L2vKZ24ivMslV+0NM=;
 b=KPGDZMdP/uYaqhlLgmQ12EBReBpDyPmSdqRVmEfBrSrSldGiHjZNLPA+TRaVtQWhY2
 3VS1U6+Os0cvPuRTYeIOGIKkY+pyHOYDsIN+1Aj3wvz+TwM+QoL+d/ITwughj8czo3u9
 GDqPf1ZKfr+PqV4m3+6aygEVp9Izw93EXkf8Q0bFTiKDDzaV4ZJ7mrUwt0D3iJ7oA3JC
 g4au0siQBwFywkLiCZkSu99SPVjFS8QjV7XTd7yI6UzJyHTT6bZzszvl7eocTq5htMgR
 TiGXrfuftG2GYgeiC8Om/ACoIhAFlwqRRZULNHRgJAHWESYOFd9t2QBhlOfwqGRbXBKo
 0kbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KPGDZMdP
Subject: Re: [Buildroot] [PATCH 16/30] package/python-wsaccel: bump version
 to 0.6.6
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2023 11:26, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-wsaccel/python-wsaccel.hash | 4 ++--
>   package/python-wsaccel/python-wsaccel.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
> index b388c3cc7c..9991f8f454 100644
> --- a/package/python-wsaccel/python-wsaccel.hash
> +++ b/package/python-wsaccel/python-wsaccel.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/wsaccel/json
> -md5  73bdc70035813ded14f9a4b81e82622a  wsaccel-0.6.4.tar.gz
> -sha256  cbf66a88bcaf6c6ad16d50ea29215891526b6e993c4bc7ed44b044ee6fe3ad3d  wsaccel-0.6.4.tar.gz
> +md5  b05eecfac9cb19326bfc3b538de495ac  wsaccel-0.6.6.tar.gz
> +sha256  18efec0a7182587ba97102b4cd8df7b4f665f45d7ca36f19783f5f081ea114ea  wsaccel-0.6.6.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b6982974cb838b985b54b663d1780d280735086249c2e28015f25dd455df25da  LICENSE
> diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
> index ce41d431ff..1f63aa5c40 100644
> --- a/package/python-wsaccel/python-wsaccel.mk
> +++ b/package/python-wsaccel/python-wsaccel.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_WSACCEL_VERSION = 0.6.4
> +PYTHON_WSACCEL_VERSION = 0.6.6
>   PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
> -PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/77/0b/a44df15382a76b6768184630d483b8363d65b9f70d1aacf76153d496bbb9
> +PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/94/28/41c0e711b538f6031a247ab4ec5352267f12ed416e3a638b8d55fc33f609
>   PYTHON_WSACCEL_LICENSE = Apache-2.0
>   PYTHON_WSACCEL_LICENSE_FILES = LICENSE
>   PYTHON_WSACCEL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
