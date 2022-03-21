Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350B8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFFF060FBA;
	Mon, 21 Mar 2022 21:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ey3x07hwZYX7; Mon, 21 Mar 2022 21:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1294B60FB2;
	Mon, 21 Mar 2022 21:18:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81CAF1BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71B1184282
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjtnfLSNLK0n for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E9F184290
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:18:03 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t1so19452416edc.3
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EvDGM9BKVhxvgUhUdaGqxmeZM332FCg2tRsP50gtvw8=;
 b=iUpFc0mGnsHZqqHe8CJsi7xpXfej/MUU+2/sA7KU5EKbzAzER4i2eXxEJfC56vw7kZ
 AmI992PlDfdcb50ztD7pDCWwPyK7bzqgdZx3KKhh88Le/8EoT16wimBELDr8H1VVaJXi
 wVtQ0THQOxWIdmOa5NT/lYla+8cJZLya/auKGUQXX5+gIVk4gGPfSgaGJ3EVkiSZtLhC
 ec97m7MsCf0L1G3PXVorLR4AGofUGzGxp5QC8BNtdhFBVAQARKw/YaMzqDHQSCvM6mSB
 2AH16pxXPXUAmWAXgtziLF88glwM5FZfCvP5/YU4prd4XK1nIYCXkkPPglBAPIvbqZPd
 uV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EvDGM9BKVhxvgUhUdaGqxmeZM332FCg2tRsP50gtvw8=;
 b=zzUC+sGTmCeETcq8aYppXRvWZ/gtDBzooP64UnPcDgKMi0udt/rpm1Bl97yP/Qb8iQ
 X7reeCnNfzdOeaqUpZDwXeRJH9i2n+z8FVwtIUh1apXWgTAG7BPfPYNraLKJWwv8yUCV
 DC0yDOftLYkYNOg3PyqiytbiUz0gw3hZRt5e6mXJmdWuJ5Dne+zrKDZOdh1datJE/6vf
 Syh5kizAd0UTQHWwqsDtj+BAfeBmRM0k52DveHv1Y7maVRY2Wh4aDk/5k88GasjJNORv
 qEWNWKxg7Zg5kxtwTnLmhwNhCwNXnbf7jhdXLrux37gDzKLJCtPOo2vuBXh6eY1gDyvi
 PYRA==
X-Gm-Message-State: AOAM532DtR4qI/z2GU9+vmbLhRtvM5MZwOFImHJjhm0BpK1N1uWC6/p5
 6pgvGSntv9KqA8qmhfpy4pxUcw==
X-Google-Smtp-Source: ABdhPJx2oSlre0WWXY2hVRrlhbS2eclrTfGq39Xk6a/gU5sakn3vodCMSzQMyVU+fA1pAzoFn7Vs3w==
X-Received: by 2002:a05:6402:51c7:b0:419:2bd7:efa4 with SMTP id
 r7-20020a05640251c700b004192bd7efa4mr11041746edd.135.1647897481269; 
 Mon, 21 Mar 2022 14:18:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170906748a00b006dfaff31e88sm4895020ejl.125.2022.03.21.14.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:18:00 -0700 (PDT)
Message-ID: <50da868e-57e2-9137-52a9-a4baf2c4ed19@mind.be>
Date: Mon, 21 Mar 2022 22:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220313095206.1266409-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313095206.1266409-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 22.0.3
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2022 10:52, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied series to master, thanks.

  Regards,
  Arnout

> ---
>   package/intel-gmmlib/intel-gmmlib.hash | 2 +-
>   package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
> index 71a153e0a3..beb3cfd6ae 100644
> --- a/package/intel-gmmlib/intel-gmmlib.hash
> +++ b/package/intel-gmmlib/intel-gmmlib.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  7cc044dc0979269abe825054ba6cc1b67169dc7a7f4192898e2dd04142a633fa  intel-gmmlib-22.0.2.tar.gz
> +sha256  d70ffc76e9dd7c533f4f3cd829da3a6df00b86418f78f057051d5e7cf208bc8d  intel-gmmlib-22.0.3.tar.gz
>   sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
> diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
> index 235f71341c..06628132a2 100644
> --- a/package/intel-gmmlib/intel-gmmlib.mk
> +++ b/package/intel-gmmlib/intel-gmmlib.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -INTEL_GMMLIB_VERSION = 22.0.2
> +INTEL_GMMLIB_VERSION = 22.0.3
>   INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
>   INTEL_GMMLIB_LICENSE = MIT
>   INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
