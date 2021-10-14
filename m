Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF109C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:38:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4115560524
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4115560524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13E43402FE;
	Thu, 14 Oct 2021 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4BtSmqQuD2o; Thu, 14 Oct 2021 21:38:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8295240212;
	Thu, 14 Oct 2021 21:38:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C80F11BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B714C82FF9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUzb9QyTtn6i for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:38:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AA5882F80
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:38:39 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id d9so29482901edh.5
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ksrpYl9Y1bqY7oIf9RANibLoJjza5YndO0tBuix4MnY=;
 b=YRW+4hSZmqNYm9naI4+PHyXS0BtCpl2jUbFnIgJUOra3WIJt3LGKawB+6uwcDj+epH
 6KcLGx5WEKmjgtq58VUIxI8jJUkJeiYfAlT01lB4WsLK1nLWLNNI0SGuaTVg7BSyAmR3
 V6LNMea/AZgrwAI5V25XnQQhNn2bDfcaETpQHVXAVF0lLBVc4wtt7jj4SPveVuhTH+3x
 aXHgBi2JN/3dX3GNFwbG2qcp2v7p3QGx3T2/Cuvo3HRvlwoa3tgTgnz1HWc36ZIyrQir
 8+1RBV8iWGV1xLn1OHCjNoemzDcyYQ/w9zfx8+2idbiIbxksIKvRYKOghaIbpr0ceZXJ
 mfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ksrpYl9Y1bqY7oIf9RANibLoJjza5YndO0tBuix4MnY=;
 b=fTk/ap/KdE2GNFV2VjrZbU4TLFdfGrjZSiGCKu/7wOPP6+VLfGnyVjokYc2LlPaphH
 CoYBluCOsnL4yAxoItDfZp0R77/XksAswbRdnlewPWkhdbzfmLXvxmFjTJkQXSRxna/F
 /3NzNs299sbnLSW+zlnZMIynYZZoFuu0J+Hf0O/0NVfXjDKEH6J5WGOZIoFeUMELHe8t
 HTjqbwWHr2Z6gyUQ4z+QBB6ryOxpahrxVloZOZlTBBWnVJrgO7+N5O7AAQU0U2H3esCY
 A82Lms6rWO7TBLFZdQjfBKXkj2yp4/OTah2e/unBrExCNnb973miNAeOYc8FGXIENehL
 agJg==
X-Gm-Message-State: AOAM5302JNUnhY3+OKVt1jEYYJorTxQD9G2D7HOmmo1YgyXYEutE6w5s
 hjLF4zofAtwRtOK4kg1+V0qLCQ==
X-Google-Smtp-Source: ABdhPJy09BO0aCHjlSyW99J2ybDJsbRPolnXQYEtabUCdTHhGTLhU0GZXSSVaz7/WYfZyeMIFfKlPg==
X-Received: by 2002:a50:d984:: with SMTP id w4mr12151480edj.375.1634247517772; 
 Thu, 14 Oct 2021 14:38:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m1sm383730ejn.121.2021.10.14.14.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:38:37 -0700 (PDT)
Message-ID: <3bbca03e-e16a-d49f-eff6-47b3d25f893e@mind.be>
Date: Thu, 14 Oct 2021 23:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211009213742.698489-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211009213742.698489-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.14
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



On 09/10/2021 23:37, Fabrice Fontaine wrote:
> https://github.com/nhorman/rng-tools/releases/tag/v6.14
> https://github.com/nhorman/rng-tools/releases/tag/v6.13
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rng-tools/rng-tools.hash | 2 +-
>   package/rng-tools/rng-tools.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
> index 0ba2dc8329..6806a99fc6 100644
> --- a/package/rng-tools/rng-tools.hash
> +++ b/package/rng-tools/rng-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  6fd5b52a700edec85eb1043970e22e8e2ad06a4b43851f35d33d90e09570e9d3  rng-tools-6.12.tar.gz
> +sha256  4dd86f6ae37d917a8489f44070d39d7feddcc622429b95efd7aa85a1f3cfdf81  rng-tools-6.14.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
> index e7fb998df6..8db97569d4 100644
> --- a/package/rng-tools/rng-tools.mk
> +++ b/package/rng-tools/rng-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RNG_TOOLS_VERSION = 6.12
> +RNG_TOOLS_VERSION = 6.14
>   RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
>   RNG_TOOLS_LICENSE = GPL-2.0
>   RNG_TOOLS_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
