Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B010CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:40:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA1060E97
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DA1060E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD2281AEF;
	Thu, 14 Oct 2021 21:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIxMfC_WghXo; Thu, 14 Oct 2021 21:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8990380A4B;
	Thu, 14 Oct 2021 21:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92AC61BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8229E6070F
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQIujW9sT0Zj for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:40:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87681605DA
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:40:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g8so29896132edt.7
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Y5atohTIyga9R+YF4qCJDnJEAjKJw1xVwtod7z9A57Q=;
 b=ar4W1jh0GDn1kh7+eVpsJOrW5akd7ihS5mke3UWtLPe1JOhstH33oxPS2ZtRZkym8m
 JmZ2Pw+cs4XHsvKZ5gksByu1iL2WdBQz0ztIwAJI1Iczc70FoVc86aQTsmQpHCWFAC7n
 oChRih4tn8IdRaPYS57wX436OljngdQOps8v8fr4Z8+tkHv4I31+wsvVL1gS57C37A0s
 c6reVmnPrCceH7CIyibZIliE5KNzORiCYaupHgDXsx9YzLeaQhF9uB28ZYdSfeV+kJa2
 ypkw/Tf7q/OL4ihrYT09KOId39COYKEcqRaRKAAeEU01btUz+gyxsPMQ2dL6v3r8VLBu
 mqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y5atohTIyga9R+YF4qCJDnJEAjKJw1xVwtod7z9A57Q=;
 b=7zCx1Odu33A65FBtehkqPbwNadWQy8MGJbLQ6H+hWdMwu6VaDqbGQ/Gw2/5FoQVW+j
 x/PoBZnxytEFebTlZPW4xRY12Fbi/Z1dOPfSw92I2CNiWLzEFnuZfUBB/c19yvRhwbj8
 HmqaSCBad8rjIjh2zX+J5jViPjOn/lis/1W4UbovaDA6vpLXwtgczZWu9qyKy7dbq3dA
 wPy2ER8+3S3IpVx6+PRLhxRgXmGLM6sfzNKTF1U7aJE4lwmTZ8WMnYsWMH/Uee/pnlrC
 cgtji0OGoPkPCQA3A6jn2ZyB1/DTiqipuImuUMY1EQTcxTPzy4UfBYGYhf2V1s45V8u5
 THEw==
X-Gm-Message-State: AOAM533BjvResIzAmuJkQy5gk+woUVMzgAiTUx7wvGyeYKENDEpo1Oi5
 PinaQYtnEnFIKj/uv1jV7yC7xmCri9x9Xc9h
X-Google-Smtp-Source: ABdhPJzPEXtOyVVLMsVZNPie0BX3S62mCxBgnIBveX6WgT2gbtSuVbApyHXYpN3v71Dnf6kx9A02sQ==
X-Received: by 2002:a17:906:48ce:: with SMTP id
 d14mr2014959ejt.336.1634247644751; 
 Thu, 14 Oct 2021 14:40:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u8sm3211028edo.50.2021.10.14.14.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:40:44 -0700 (PDT)
Message-ID: <5d9ee6e8-cf79-9ac6-7a1e-38e48b4aade8@mind.be>
Date: Thu, 14 Oct 2021 23:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
References: <20211010094110.109025-1-gilles.talis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211010094110.109025-1-gilles.talis@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/leptonica: bump to version 1.82.0
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



On 10/10/2021 11:41, Gilles Talis wrote:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/leptonica/leptonica.hash | 2 +-
>   package/leptonica/leptonica.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
> index 6ef1a09122..1220fbbd6e 100644
> --- a/package/leptonica/leptonica.hash
> +++ b/package/leptonica/leptonica.hash
> @@ -1,3 +1,3 @@
>   # locally computed hash
> -sha256  ec9c46c2aefbb960fb6a6b7f800fe39de48343437b6ce08e30a8d9688ed14ba4  leptonica-1.80.0.tar.gz
> +sha256  155302ee914668c27b6fe3ca9ff2da63b245f6d62f3061c8f27563774b8ae2d6  leptonica-1.82.0.tar.gz
>   sha256  87829abb5bbb00b55a107365da89e9a33f86c4250169e5a1e5588505be7d5806  leptonica-license.txt
> diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
> index 93d1e47c28..368078bf10 100644
> --- a/package/leptonica/leptonica.mk
> +++ b/package/leptonica/leptonica.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LEPTONICA_VERSION = 1.80.0
> +LEPTONICA_VERSION = 1.82.0
>   LEPTONICA_SITE = http://www.leptonica.org/source
>   LEPTONICA_LICENSE = BSD-2-Clause
>   LEPTONICA_LICENSE_FILES = leptonica-license.txt
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
