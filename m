Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7D0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 19:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C3441604;
	Wed,  4 May 2022 19:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wcQ-bMmTk3E; Wed,  4 May 2022 19:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE2440094;
	Wed,  4 May 2022 19:46:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00E8D1BF3BE
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E38E060AFA
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BaPc9ET7SFj0 for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 19:46:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AFD360A81
 for <buildroot@buildroot.org>; Wed,  4 May 2022 19:46:48 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t5so2860946edw.11
 for <buildroot@buildroot.org>; Wed, 04 May 2022 12:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JIuXaMdO1OWxjOlyPBxnglW5Hfg9/s6iRRdTlbAi3Xo=;
 b=UDONuJzvu+2JJqWM2rObe2F1XRghadyZfwQikeiamVG/wVYiaM37/b0Tde8WRAd8hx
 mwD8Ggbe/t8nQv3jdePch/nwUdmu42KNBHudeZDVpeQVFtcZtXl317V4CZcJxplJgosN
 8j01mwFeVQLRVcaFCnlcSQ/SKcUJ8BEju+7JxnFsXJr8DPALk8+foEetl5whk2bFwnY/
 M0DyneensEkhdgWsBXu/fujUFQCRiD/FY/EOCQC6FvCEJS5pHVM/DofvvL16lUAfSt0K
 5d/j0wS+j7yUVoSuYbgniL8YMcPmCDY+xgcwXpO4E+9CceoJcCEnJlomaAWTUVYBreU2
 Yn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JIuXaMdO1OWxjOlyPBxnglW5Hfg9/s6iRRdTlbAi3Xo=;
 b=Jm/fU3n7BX+jOI83TL/yBu0jzMs4HAGm4drFWjqcUy5brCvqKabexS11XXIXhT9sau
 d4jTiv+1GCCtEydWJJHAdmXReDCF62N7FI7L86uIZhXmhckk8KmtyAgJR/ur0+KFFf7c
 ZIy3S+JPX5V+rzIbXZ4O5PxS7w9K/YDksKyh3Ocoh0Hw60TYhXV7XTC+NwcKFVHSvTzq
 +wnAxFaMHkAC4UcGNWCfz8+sQsEMUqJv8UQKQKIuej4bL4iGhtm7xMnM8P33EaXYRu/4
 tAIF2iXuwjtznrywSEnePDAvHCGn6QinBdU9HdnRzffBLoa1vBCigNRZXkRz/Zpj6hn7
 4ADg==
X-Gm-Message-State: AOAM532QmSSDCl4zMp1YgHYldpbR3t55R7uUYsgSX79xKzwvJeYKtFMJ
 3TKBNhkp8/kd1g8k1aaIpHmQoQ==
X-Google-Smtp-Source: ABdhPJzJnFJZmUkOQVeFE53MdvPUOQhe3q2hOi92soAKmOZUYxMknw+TfPH24+MtJnz9mElA9EP0WA==
X-Received: by 2002:a05:6402:4313:b0:427:ca44:5d5e with SMTP id
 m19-20020a056402431300b00427ca445d5emr16940125edc.67.1651693606418; 
 Wed, 04 May 2022 12:46:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hg8-20020a1709072cc800b006f3ef214db1sm5975534ejc.23.2022.05.04.12.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 12:46:46 -0700 (PDT)
Message-ID: <fc602d4f-8be3-7667-62a8-aa18164e1213@mind.be>
Date: Wed, 4 May 2022 21:46:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20220504133408.22754-1-yegorslists@googlemail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220504133408.22754-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/python-can: add missing dependencies
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/05/2022 15:34, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Since version 4.0.0 python-can requires the following additional
> packages:
> 
> - packaging
> - typing_extensions
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-can/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-can/Config.in b/package/python-can/Config.in
> index dc9eb0ae4e..e92d9668e0 100644
> --- a/package/python-can/Config.in
> +++ b/package/python-can/Config.in
> @@ -3,6 +3,8 @@ config BR2_PACKAGE_PYTHON_CAN
>   	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
>   	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
>   	select BR2_PACKAGE_PYTHON_AENUM # runtime
> +	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
> +	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
>   	select BR2_PACKAGE_PYTHON_WRAPT # runtime
>   	select BR2_PACKAGE_PYTHON3_ZLIB
>   	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
