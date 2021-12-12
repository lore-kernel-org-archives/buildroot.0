Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61073C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 244A94204B;
	Sun, 12 Dec 2021 12:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgdkbBUob0np; Sun, 12 Dec 2021 12:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EEA941D0E;
	Sun, 12 Dec 2021 12:21:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B430B1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2FC784D1D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ps8WD5k2sOAh for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:21:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A77A181839
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:21:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z5so44435766edd.3
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=rN7d2xQ0ZgKGjArWl54SgWoSC5AOY+Pg/N6x1Rh0LKE=;
 b=KPawi6+FgXgVX9vfjZE64kaUe9rzF0PJNcEJl0X0BHoQfN7GFK2xa6G5ADx1i0cHKK
 ZQkN3+oJDXsGNpLe9+xy1nPV4rT8BVXF21qtWa0F+uzk1DYet/RjjvgECWmGoVNoIYpu
 pZrjTXS+wwyo1qXHdKq51qTxcwDq/yHpAipefhCl2eAIDRdh9N0QW3xgD1KP40dQN7rv
 zhHW8d8iuEFqPa/C/1NGs+/jnF/1AqS7sOe3kvlFz9+pu7bwPuCFcx56fAoR9NkoCmow
 J+wwvMCcGn19yv+ZROPkBjAcVksxOXTp2yjXMZO5qxMI0n0HiYKfVnTktMCQWfYFrFuT
 gD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rN7d2xQ0ZgKGjArWl54SgWoSC5AOY+Pg/N6x1Rh0LKE=;
 b=G22fZ+PLAlcn8C/R4lJC/8y57LGzfG2znwRJh1f5Y030vk9/+EWqq0X/9l0MfaDu25
 /doCIxe38mp02/XQvSHz3vwOOQQTCKv9vK3f0jKBQkPzxGQEmHlQ/QcUkiz0uuZGOHqH
 tRRj8Ro1qFjrHZiVvuzVk6bC0UQZRVuL1Vwj0INJknK+HNjPbySESpUynQSSosRH9QmT
 NcuhlMTCprUnuxpkWwe3YKgCziktyoLHBgJZqV8GaT94Dr1R517V2fQyA7xb+dRGdHVf
 WgNANYn6iFGZFVL7CAyb72/Re7RTt5eYW5KgyTuwulCsr7yynEBSz0c3tlC24y92xRMY
 xXbA==
X-Gm-Message-State: AOAM533S3e/amDO0D3tO4WWBrGRmAZ64BG08/tHnZBkhha+az2P/uo3S
 x4De/BR9DHyFI0lqshCF1/J//A==
X-Google-Smtp-Source: ABdhPJx1bweFef9oln1ZgRyawwbAFnGncosfw8oryDxIyBrKDCR6fKjT8DisYuHtj754dVl8gHpRRg==
X-Received: by 2002:a17:907:7f8c:: with SMTP id
 qk12mr37521722ejc.169.1639311691894; 
 Sun, 12 Dec 2021 04:21:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e1sm4208270ejy.82.2021.12.12.04.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:21:31 -0800 (PST)
Message-ID: <4846712b-0b26-6d07-9a45-d7f2b3fea374@mind.be>
Date: Sun, 12 Dec 2021 13:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20211208154641.58478-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211208154641.58478-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH 1/2] linux: bump CIP kernel to version
 5.10.83-cip1
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



On 08/12/2021 16:46, Angelo Compagnucci wrote:
> This patch bumps Linux CIP to version 5.10.83-cip1.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   linux/Config.in  | 6 +++---
>   linux/linux.hash | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index db0c58129f..e21d1681f7 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
>   	bool "Latest version (5.15)"
>   
>   config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> -	bool "Latest CIP SLTS version (4.19.198-cip54)"
> +	bool "Latest CIP SLTS version (5.10.83-cip1)"
>   	help
>   	  CIP launched in the spring of 2016 to address the needs of
>   	  organizations in industries such as power generation and
> @@ -44,7 +44,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	  implementation of software building blocks that meet
>   	  these requirements.
>   
> -	  The CIP community plans to maintain 4.19 for security and
> +	  The CIP community plans to maintain 5.10 for security and
>   	  bug fixes for more than 10 years.
>   
>   	  https://www.cip-project.org
> @@ -126,7 +126,7 @@ endif
>   config BR2_LINUX_KERNEL_VERSION
>   	string
>   	default "5.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
> -	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
> +	default "5.10.83-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
>   		if BR2_LINUX_KERNEL_CUSTOM_VERSION
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 9062b72a0e..6d3b31c5a4 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -9,7 +9,7 @@ sha256  b55d77774ed631f57f736bcdab021f68167455c9daede7e9e4161b4d564d8b53  linux-
>   sha256  9784204f95cfc7de1c933088e6f9364e99a29988ae4e6b9353677637eb171aa0  linux-4.14.256.tar.xz
>   sha256  8f4ecd71fbcdd733c2849e2e5afe59d351c463c9a699bdbf428d88fa911009db  linux-4.19.219.tar.xz
>   # Locally computed
> -sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
> +sha256  5738dcf020ff75fb6e43d6d1a8b572d2f1fe58c08b31f822eb42fb91d6bdc98f  linux-cip-5.10.83-cip1.tar.gz
>   sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
>   
>   # Licenses hashes
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
