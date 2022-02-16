Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1244EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 19:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 878D7416CD;
	Wed, 16 Feb 2022 19:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_MJKvJmCmaS; Wed, 16 Feb 2022 19:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF52A416CE;
	Wed, 16 Feb 2022 19:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4F31BF592
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AC9E400D6
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 19:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1a6mX6xQXKGv for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 19:39:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36B84400A6
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 19:39:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id hw13so1591079ejc.9
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 11:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=CxvZ23xtw0j8GjX4plOltaojx4ifxvk228GpLWfSKUI=;
 b=Ttn7iPyOHNDVUZVmWUpf84S/5RmyLJLrlhiuSH1U1O2pgkv7EMd1y6JDqiUT8B71fq
 3yw6uOI04esloQ8j8U5byPdFTXbS3imH2dlsUHSV8qQKImwyivcjtIUiwMT7HgEgxTxZ
 nT0Yidmx4lZCRRspzEWP2N7OjH/K4cI2f8AcHcqgLb/7sZbAUcjsSKb/g3NQwXYdkV8T
 v10yR/k1YsJ/JbZKiyzThQy1KM36jlepb+Q9a+KlgW7Fcv07y5dr5B1yecfaiQ6TB3WT
 KNILnmMOjD+a67AkKSuH6gHc9QpRb1oQGF7hXxvWaMJqZ//9eQhHHeYXr7D483jsm3ON
 GJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CxvZ23xtw0j8GjX4plOltaojx4ifxvk228GpLWfSKUI=;
 b=7536+MvzzvaF0qBjilffPFvBSGGSy/PRSmbtC/9WZI2zIqY6uHnEyu6kT4Vw2l0S1j
 ebuDy0Spo68pKwiEFfiQFptVcvK6056oDyJ/ZU9ye96p/voCgEZQNtoiYIlAc9W5Q6Kn
 FCUYusDIJt9eJYCOZp4tBd7xvszzL3i7otGYZEFy/m+Y/JVBjbmPXE6mu7309ryHbkXs
 tnGp0kj9En2cm0DWryx5Wb4Wb99Xi9jQyWq6kIiu2Z8TjgmbsqFHt2MzOIqohjjXpS5B
 wYUHFoDa2c/94TFHPYJdydNRROTMr8uRYbshQ07cutgtTaW29ljun555KO6/5f9aUzBY
 iIlQ==
X-Gm-Message-State: AOAM532t6FSmh//PxF8O+0Xu8iekjedF6hRupnPOBSNohH0RXpQkNv2L
 kiY/YxJcXfCkXkPD8Ntx9EBWSg==
X-Google-Smtp-Source: ABdhPJwnlqZa0F2GGbr8KANtcI7j0rc7ZelnIyBJ+vF/MOyeGUV9Gv5YHUmzXldkpeOHKOtT1Azhzw==
X-Received: by 2002:a17:906:68ca:b0:6ce:e03e:4d15 with SMTP id
 y10-20020a17090668ca00b006cee03e4d15mr3496062ejr.19.1645040353334; 
 Wed, 16 Feb 2022 11:39:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f7sm2237782edd.35.2022.02.16.11.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:39:12 -0800 (PST)
Message-ID: <606bd490-3941-c9ff-e591-ae4f6abe61ef@mind.be>
Date: Wed, 16 Feb 2022 20:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20220202073338.106855-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220202073338.106855-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.43.0, 2.11.0_libuv_v1.43
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



On 02/02/2022 08:33, Asaf Kahlon wrote:
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  Applied to next, thanks.

  Regards,
  Arnout

> ---
>   package/libuv/libuv.hash | 2 +-
>   package/libuv/libuv.mk   | 2 +-
>   package/uvw/uvw.hash     | 2 +-
>   package/uvw/uvw.mk       | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
> index 172ef1f168..1874aa344c 100644
> --- a/package/libuv/libuv.hash
> +++ b/package/libuv/libuv.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  371e5419708f6aaeb8656671f89400b92a9bba6443369af1bb70bcd6e4b3c764  libuv-1.42.0.tar.gz
> +sha256  9e27825a55279de69a7c43e42d509fd1337c9bece2547c761e91a1592e91cc4d  libuv-1.43.0.tar.gz
>   sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
> diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
> index 9fe775951d..ed51fc92f9 100644
> --- a/package/libuv/libuv.mk
> +++ b/package/libuv/libuv.mk
> @@ -6,7 +6,7 @@
>   
>   # When bumping libuv, check if a new version of uvw is available
>   # and bump it too.
> -LIBUV_VERSION = 1.42.0
> +LIBUV_VERSION = 1.43.0
>   LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
>   LIBUV_DEPENDENCIES = host-pkgconf
>   LIBUV_INSTALL_STAGING = YES
> diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
> index 5f7521c8b3..564c0980f3 100644
> --- a/package/uvw/uvw.hash
> +++ b/package/uvw/uvw.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  30b0ba97a94d5e652490c6b1b32c95e608263f21cf3bc606308d09b3e3a114bf  uvw-2.10.0_libuv_v1.42.tar.gz
> +sha256  3af4efa2842299490ec764f2148f85f4426dfb4f8d8aa436cc2d049db2b7b514  uvw-2.11.0_libuv_v1.43.tar.gz
>   sha256  5de32af2469480cf3261c9781962e0887366666ba8ee1f4a32c386c77fc50c88  LICENSE
> diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
> index 9c15d536cb..161c40849d 100644
> --- a/package/uvw/uvw.mk
> +++ b/package/uvw/uvw.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UVW_VERSION = 2.10.0_libuv_v1.42
> +UVW_VERSION = 2.11.0_libuv_v1.43
>   UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
>   UVW_INSTALL_STAGING = YES
>   UVW_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
