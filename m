Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB58C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C406360DA0;
	Mon,  6 Dec 2021 21:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jViZwUuHHksC; Mon,  6 Dec 2021 21:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D7B60DE5;
	Mon,  6 Dec 2021 21:23:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A720F1BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96EFC40239
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqRhQ2lFqLOT for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:23:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CB4B40200
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:23:04 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w1so48468125edc.6
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 13:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=cJMVpeCbCcNVckI22bMDaSyHdWIupEZcWgIBP7g/h8k=;
 b=Cqe7A+zIY6+ojNIfpV0j2qvmfihg2z9Bl5oM8MTshlcp64ZxUS8TGg06GTOEyWa9sZ
 KWLr5JFsLIHOuF8oIbX9z05M1bDe/HFSxxEiLOhJpjTnioI+2jGAy+C5X9ntbobBeY3G
 DBZEaePInEz8F1BhCbB4wjrkBwlE6/4t3h/hmpNrO+Kk4bv7y2Avv9Q9e4in7xAm7L5h
 6YazHBKtx1fZY0fxl4ExesAlKdZHLjkCHHrI6Ang9PjdKTkOXkCaNpK65xkZ1ig7D7CP
 AHTvnCw5dzNU1f1bj0IdJo3JAznfOxtZVEaK+kFABpA9OEfbKXNDErur41nc8cGyaMPY
 zulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cJMVpeCbCcNVckI22bMDaSyHdWIupEZcWgIBP7g/h8k=;
 b=75XaEI5flhF9eKvdmM7LIDyrnrrPRUFglybY21gbvFshcXQ6+OmF5sk2as1h2sqK67
 GH2ZoeoA0UqvPwLUpxubrc1QWGHAmpphqCEdjobW51hWEPs3Z1zqOJ8fkvRsDeFv+tCK
 VHqPl75kizAHaJUoxx0RPRoWxLbe5UVViFQUPBFtA/2RUIL/JdpNdKMc/fWCGROcafhl
 SyiDEkBWZhGrw+L9bRHzQboyu/75ScTbncVWnV4rhfCbhn1Vp3m6/GoCT06DAM34csgh
 NId5V1yGhQJz/r1JYq7/yv2pVJYxNPHn123BMP08RM8GizaTYPvGQflArw9II8Wh2pNC
 TXGA==
X-Gm-Message-State: AOAM531UDk1hcbDAV0Lx8f3u7fffrxxBtPDXsr5dW4no0DLE86UQBmkU
 geDNQDp8OosADXdb5fro7xOgwg==
X-Google-Smtp-Source: ABdhPJx1kISBINEu5gJlGTZDPAjetYiOPHd49GEjvPMzh/UJISMFRgLuwXkdjdXR/ke4oEXkW6Umtg==
X-Received: by 2002:a05:6402:5251:: with SMTP id
 t17mr2266265edd.397.1638825782492; 
 Mon, 06 Dec 2021 13:23:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t5sm8729278edd.68.2021.12.06.13.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 13:23:02 -0800 (PST)
Message-ID: <bc5ff0b0-75c9-7d53-6aee-9ca8d9a2e866@mind.be>
Date: Mon, 6 Dec 2021 22:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211128181918.54019-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211128181918.54019-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/xmrig: bump version to
 6.16.0
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



On 28/11/2021 19:19, Bernd Kuhls wrote:
> Changelog:
> https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/xmrig/xmrig.hash | 2 +-
>   package/xmrig/xmrig.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
> index 7ecbb046d6..23efe9fbd8 100644
> --- a/package/xmrig/xmrig.hash
> +++ b/package/xmrig/xmrig.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  37005e61b9ce833bef252c787a73eddce0c636b2b8737672bba59535e2c91b41  xmrig-6.15.3.tar.gz
> +sha256  fccb413927921c43d2eed5bd5abdc8f335d9960ceb3611851aff5f3b1edc79ff  xmrig-6.16.0.tar.gz
>   sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> index 7bcf44c70a..c6fec680ac 100644
> --- a/package/xmrig/xmrig.mk
> +++ b/package/xmrig/xmrig.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -XMRIG_VERSION = 6.15.3
> +XMRIG_VERSION = 6.16.0
>   XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
>   XMRIG_LICENSE = GPL-3.0+
>   XMRIG_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
