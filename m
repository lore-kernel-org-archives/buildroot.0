Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00539C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 717DC6103B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 717DC6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C86B82423;
	Sun, 26 Sep 2021 21:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHu-zwrUyIa2; Sun, 26 Sep 2021 21:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9349081AAD;
	Sun, 26 Sep 2021 21:43:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8CD61BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C455D402E0
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyuV_3XEzSNU for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:42:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CD46402D3
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:42:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y12so24662298edo.9
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C7/RPSxJ/zJ6D5ZdpipKvmpRXD7tD8Yx8tRTsOUTJjk=;
 b=MAKKOzIKnz9JiWdJBX0iBmS+JRviyMiV/wfhAwZ+WoOa6MhoGGtdkbnyjMPegN3LW1
 L8NO9zFmpnjBxtsvmN7AM+rDWGpCt1lLiuK3ah6NSVQ1yTNGRdUuebUFpL2F+J6MfCUv
 oD9/LrsC6DwPV8J3Ki1sZe9LvT/VcO5tMlDqJp36kQJHRWj6BY6VHmEZUouacK0mQL7K
 cZJogs9h8wmntWmnFuxZvCXXoEFTlNF7Fwtiu6ml8WksdrEP7aOoWY9xpfi74CYRXoN/
 bjfwHcC7YAGtIyCQGEtz5IFOckmgdbplJ+JfHdrQQuRH97qFvZzETgy/L4ONQr1Fve53
 zDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C7/RPSxJ/zJ6D5ZdpipKvmpRXD7tD8Yx8tRTsOUTJjk=;
 b=BpmXlFnV/cKLzHLXwMBa0vQiYWtKZq4Ro/R2QJytoA5EdQgSKEvmUc6L0tlmSO567N
 7gTBlGzSORbyV04Z/Bx0z3hGBwlrklccOZdXAdmmhFo0uV6xT3TYc5dUwsyUhUBjyjSe
 aEBh4QAUoykpO8fZxoGBd1oQ6UncmBzIOJVTJgJo/jWvaJqFzXeVaa7NJC2E8dflcri0
 26u+DHDOW/84L5KFOxkOZjAlCNVT4DWRm06pSYb6yEHU27VSkVbJIdEKgaK7h+n86D+Y
 Gplt6/pbBB8TQAfxg1C5C4eNgHM6wSI86jUZeGLh7XfRktfTYfVjXCm68dsdnY3rxcUr
 0kNA==
X-Gm-Message-State: AOAM5322h4IVwsU+7evl1tOUqxGzgcCpu8PbzAX5JFrcU/7sjDjWc3Q/
 WVxDJX4+v0PMqrmhUc5bjRq1ZQ==
X-Google-Smtp-Source: ABdhPJxTc2TeMsor8eLdIHboOkw5M21A/8g/8qn0ytu1OE+XsmsPLwTvNxhU6adHXW8xV37rJPgB6w==
X-Received: by 2002:a17:906:abcc:: with SMTP id
 kq12mr6253993ejb.107.1632692577619; 
 Sun, 26 Sep 2021 14:42:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id la1sm7823479ejc.48.2021.09.26.14.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 14:42:57 -0700 (PDT)
Message-ID: <332809b9-04d4-3bad-4fee-d96bff572f93@mind.be>
Date: Sun, 26 Sep 2021 23:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20210920184415.13599-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920184415.13599-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1 1/2] package/ell: bump version to 0.44
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/09/2021 20:44, Peter Seiderer wrote:
> - Changelog (since 0.43, from [1]):
> 
>    ver 0.44:
>      Fix issue with allowing zero byte input for AEAD cipher.
>      Fix issue with filling in DNS info in DHCP lease objects.
>      Add support neighbor discovery utility helpers.
> 
> [1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ell/ell.hash | 2 +-
>   package/ell/ell.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ell/ell.hash b/package/ell/ell.hash
> index 316d3fb81d..84016c0ce0 100644
> --- a/package/ell/ell.hash
> +++ b/package/ell/ell.hash
> @@ -1,5 +1,5 @@
>   # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
> -sha256  b6c75895ad64bf78f5b5c464de871048d02f9403be518084e0d64b58f508c9fc  ell-0.43.tar.xz
> +sha256  41a6f8fa4d285b52cb7a5a87bda3e7370ecaac02d94aaa7ec1a23f0480b8bc3f  ell-0.44.tar.xz
>   
>   # License files
>   sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/ell/ell.mk b/package/ell/ell.mk
> index 261dc1a6db..47137e2530 100644
> --- a/package/ell/ell.mk
> +++ b/package/ell/ell.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ELL_VERSION = 0.43
> +ELL_VERSION = 0.44
>   ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
>   ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
>   ELL_LICENSE = LGPL-2.1+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
