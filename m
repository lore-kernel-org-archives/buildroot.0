Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185C5CEFC42
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 19:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D777580DE0;
	Tue,  8 Oct 2024 19:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dt8a2Y4h8Jaq; Tue,  8 Oct 2024 19:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE12B81133
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE12B81133;
	Tue,  8 Oct 2024 19:52:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 662911BF42C
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 19:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61CD2400E0
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qmi-7t68LjS5 for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 19:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28DA540065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28DA540065
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28DA540065
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 19:52:31 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d32dfbd78so748244f8f.0
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 12:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728417150; x=1729021950;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W0UmL45Lr6Prn4U7LF+VHdtU6wr77YJeSEbDa/MDm9Y=;
 b=Ng5oQKJriQ5H6PyO0iXrNCV4xD0kZcXhvvJtrUculZRo2sD250HvkBeW3B2sYDphIv
 rLOZaS16ewJsmPSohgYgLcWP6G5SOEVbrEbkDE3nXjOwBnOckt2hWxxsa9wgrtW64Vr9
 FbAoA6ATO1yS2vPORvRZn67L8ssaSwXtBmzGneCNabwSFoNyFrj0LeAbjZwH3As/Er3o
 PVimDvMlWDkIuiBa6aQ/yMALj6WfBkWmUXrU+ohDWs5CcUiN1P9P/12SdTMojkskrfkv
 934ptR9iFyKCLIoycK3R6OPKtKWiW++kS5Yfy2A34mkL0RfYy1Y+3qWqvR28RiXZUuLa
 sOzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNUUtKyGOu3hhR1Xht4zn52cF2Gqw22wnZfW6IS1LRC5EWT6u8ALStkrVfYLPu8yF4Ol0d3NFDTuI=@buildroot.org
X-Gm-Message-State: AOJu0YzmfDJh+ycrI08hTbzNoilwQSnskDPNrw9Z2aiH+cVLuYh0sAVu
 pHdEhORGGD+lVwJ8V1sZF1geZ2Iygr/f2EGO6KHlvg56L93AqWYCsLavNBi2IL8=
X-Google-Smtp-Source: AGHT+IHOVApBrgPLA0rthrsr/bXwQPq+5+hOVBhjRBQMG3bdREk/tH+bSnPVkxGiN1G3nna0px25Lw==
X-Received: by 2002:a5d:6a0f:0:b0:37c:cf0b:e9e6 with SMTP id
 ffacd0b85a97d-37d3aa83d5cmr7566f8f.42.1728417149995; 
 Tue, 08 Oct 2024 12:52:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d2ea3b50fsm2031194f8f.105.2024.10.08.12.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 12:52:29 -0700 (PDT)
Message-ID: <ed71303c-2b49-45e9-a580-f04a8f1535d0@mind.be>
Date: Tue, 8 Oct 2024 21:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20241008-check-package-requirements-v1-0-a137acc133e6@collins.com>
 <20241008-check-package-requirements-v1-1-a137acc133e6@collins.com>
Content-Language: en-GB
In-Reply-To: <20241008-check-package-requirements-v1-1-a137acc133e6@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728417150; x=1729021950; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W0UmL45Lr6Prn4U7LF+VHdtU6wr77YJeSEbDa/MDm9Y=;
 b=Aff8zVXY5BprmXsxwvPxDEfKeoTpsAvXMh9K32RYTFoh6PxslAdGwC+eszHmJwGbLN
 FY2d+S12EJEeiU2uqpHp/tdAoB00cPKBbsjC5Tz9d7YTfyHBGk3THch4fs3QskM0Y23p
 UFOnptSCopWNN/8LdlSQfGez49LN7aa4vJ4S38dK3MMflGmcDoZkrnEudPDAnA5OkH6y
 2Jh23To7G7UVdcukPA5NRcUOxuhhvcMvSDgjRlGE/IYkzZK1lCfF8GBY30LJ0ptzJZf0
 e8RfOgx99JFrNeCb/x+C8GdnqK8Qe7z7a/BJdkg9gceoiuB61VpeXOHnwVQRCZYxYZ/h
 eg+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Aff8zVXY
Subject: Re: [Buildroot] [PATCH 1/3] docs/manual/adding-packages-tips:
 mention check-package requirements
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/10/2024 17:57, Brandon Maier via buildroot wrote:
> Call out the requirements to run check-package and mention that Docker
> can be used to run check-package without installing dependencies.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>   docs/manual/adding-packages-tips.adoc | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-tips.adoc b/docs/manual/adding-packages-tips.adoc
> index b04b42b51f92aaa2ba4dc759a3fe9db8b6ec5cfc..182204101413d879eb6aa4777d43abac5f48e8d5 100644
> --- a/docs/manual/adding-packages-tips.adoc
> +++ b/docs/manual/adding-packages-tips.adoc
> @@ -64,6 +64,16 @@ The tool can also be used for packages in a br2-external:
>   $ check-package -b /path/to/br2-ext-tree/package/my-package/*
>   ----
>   
> +The +check-package+ script requires you install +shellcheck+ v0.7.1 and the
> +Python PyPi packages +flake8+ and +python-magic+. You can use a different
> +version of ShellCheck, but you may see warnings from unrelated files.

  "warnings from unrelated files" is wildly inaccurate. With a different version 
you can see warnings that Buildroot CI doesn't check, that's all.

  Regards,
  Arnout

> +
> +If you have Docker or Podman you can run check-package without installing dependencies:
> +
> +----
> +$ ./utils/docker-run ./utils/check-package
> +----
> +
>   [[testing-package]]
>   ==== How to test your package
>   
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
