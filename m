Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89C4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:16:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 740E861151
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 740E861151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ABBC40801;
	Fri, 15 Oct 2021 21:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LPoRmkoMF3t; Fri, 15 Oct 2021 21:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9741040471;
	Fri, 15 Oct 2021 21:16:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86D3C1BF417
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ACB84015C
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81261FmEZFgA for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 21:16:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33B784019A
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 21:16:07 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id ec8so43082906edb.6
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 14:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=PxpaIiIHAQNfzun+6+vL1QzaAgx7X6nB5ORbxDt/NGE=;
 b=DJgrQ6qGk08LqPCeZRjUslg4mz9EPcYiUF+6X/Bks+RI/+eYHvWh3aE4q5A9QxO9N9
 fMM3XGMznG0CcYirObwoA5Vc9DRW+wBs+TDHjrn3uXx2AtRPyixFvzRzeHMEd7ZpTZ7B
 DFR+bCZwfGCVE+cdSaYSqqjUmtWf5rihPG0Rr1VRwB4QuNvxp4lZ8N/WD63KQlh7LYzy
 wVBYjExFlYhI4h6k9Fw8bz8kv5i+xSmTlBJBWCExYCy6IExSeZavZr/a8jn92ENhlS9u
 GTY5GRpU3HWR2Co2ynKvsc9fOGCqTZO6UIHIYQ4M/E1/P5QwiOkfWaUHD6sxUIjYLHd+
 qnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PxpaIiIHAQNfzun+6+vL1QzaAgx7X6nB5ORbxDt/NGE=;
 b=BNeDBmo4nmbSeof9p8TuNh5LjiAV7ueUNm7wY6fJN1wVx1Hr5UJMMNpl2sp9FCbWuQ
 MxLWTXqX2xJeL3AyGleljb+YW1QObxfNMFWAbGDRZopk1EFH+5KpsllgdnnVZJLMdInY
 bHp0J985qkK1bxK3S3I08NZFNLS+tYDE5kxB/sVuk0BH1NhGp8DX0J/c+JxQXy69XnKM
 +4g+0/7RYxqx80UEvvhyiSan1+aV/O5rWdYENAFK0E3OZoYRsMfI2DaBaIkixo9yCL7C
 S14DlNd/eT1861wldMXApuiju0FFyv2smH8/LXBBznA8YKzukeh4gKSQA6Kc/4m7zcj8
 RA9Q==
X-Gm-Message-State: AOAM532fWeHmq/2ndBR76EEchFTp0+2VUT/7OcAYKQmTfNKNEbO4oRVo
 sn4uezUQDO3mc/Rf9cEtfAKZYtBr3wpKVE7c
X-Google-Smtp-Source: ABdhPJwP/YUXbJzdx15iJDmA4wNtvpQvU2ZukKFZoqFH3YO3B913YAUrQYJnRzUOpHH4+cx+bYKQWw==
X-Received: by 2002:a17:906:35cc:: with SMTP id
 p12mr9832914ejb.351.1634332565222; 
 Fri, 15 Oct 2021 14:16:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h10sm5406829edf.85.2021.10.15.14.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:16:04 -0700 (PDT)
Message-ID: <82a06b0e-9b9c-ff3f-b53b-c5ef6475846d@mind.be>
Date: Fri, 15 Oct 2021 23:16:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
References: <20211011194602.326012-1-b.bilas@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211011194602.326012-1-b.bilas@grinn-global.com>
Subject: Re: [Buildroot] [PATCH] boot/barebox: bump version to 2021.10.0
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



On 11/10/2021 21:46, Bartosz Bilas wrote:
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/barebox/Config.in    | 4 ++--
>   boot/barebox/barebox.hash | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index 71c855bb60..dd7985381f 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -12,7 +12,7 @@ choice
>   	  Select the specific Barebox version you want to use
>   
>   config BR2_TARGET_BAREBOX_LATEST_VERSION
> -	bool "2021.08.0"
> +	bool "2021.10.0"
>   
>   config BR2_TARGET_BAREBOX_CUSTOM_VERSION
>   	bool "Custom version"
> @@ -40,7 +40,7 @@ endif
>   
>   config BR2_TARGET_BAREBOX_VERSION
>   	string
> -	default "2021.08.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
> +	default "2021.10.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
>   	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
>   	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
>   	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
> diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
> index 34d34eece2..ebd81cf18d 100644
> --- a/boot/barebox/barebox.hash
> +++ b/boot/barebox/barebox.hash
> @@ -1,8 +1,8 @@
> -# From https://www.barebox.org/download/barebox-2021.08.0.tar.bz2.md5
> -md5  eddcd7bc7e9d3836f0d68e3abce210ec  barebox-2021.08.0.tar.bz2
> +# From https://www.barebox.org/download/barebox-2021.10.0.tar.bz2.md5
> +md5  7d79102fd8d45bf3756b4f3a569654a8  barebox-2021.10.0.tar.bz2
>   
>   # Locally calculated
> -sha256  6b29f2f23d1b0c279f2ee680dcf29900c3d85367fbb107038f54b577d8a616dc  barebox-2021.08.0.tar.bz2
> +sha256  4bb077b54d03743b3e8c20751d318dcc3ef03b20abe1a64a79c413ea03de3632  barebox-2021.10.0.tar.bz2
>   
>   # License files, locally computed
>   sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
