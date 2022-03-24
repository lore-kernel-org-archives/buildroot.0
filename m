Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23EAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AC804107D;
	Thu, 24 Mar 2022 21:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1s3oZdlLkDU; Thu, 24 Mar 2022 21:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4053E401E1;
	Thu, 24 Mar 2022 21:15:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C70A1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C4BC415DC
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIN6Q6EmVCWN for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:15:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D104415D9
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:15:01 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id j15so11664846eje.9
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zezMUkDqb9mSHj2rm5zAau8do2A9xzBEYd15dUcLlEc=;
 b=CUFcVhFiX8nevT58YounO1lvyoTjDFVPsa51elJRngo4Qx2P1eYH0Te2zPINySUjP2
 nBxc56aUCXQgkN8aQsr/TsPC1/wOzXVL1u4GREv+1LahqYqWNC/sb01hqVCtdIpfi/f+
 UV76hsmQg5eqwups64tcYNlArAAF9FG5aDLn1ABJGR4lSiN4c1tEu1qfpYLxb24+csWR
 EKCBKmg7WbJafQnaIj8NS1bZo6guEnR+LBoS4j0QXpyPnedtbCs9/MeltlBjz49Rmr7R
 nQ9FbSyeBnIfpCs0jUA2oDecrMPcDl+eg/c8UIrZaglranwAcAuYq0S67It7NpAIqkNp
 bWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zezMUkDqb9mSHj2rm5zAau8do2A9xzBEYd15dUcLlEc=;
 b=MA/enGc5r32u8BCmGG73F0rqfbZWG1kl6YeQPLo5xeipVdFdrNFxDa4Kvp5vU7DZHe
 MLFvdFVwpu/udBWZLo/04nfkuhgAuARSWNXcz3kGobr914ooQMX/zqzUvReQ3LsdFqT4
 k8qfF1OPyGVyQUdWabWG9XjogqaxS9OjAsiUZE1gBGOFCkSWYiu7YLd5iz1gz2RsPVmp
 RRhjjaYBdKaTvM8dA7W3SanloV2ivGoC8jgLPgzkWaRIrUK817++zC9F21pU6mFyKriq
 fxwu40MTuMH5DUPzuF4l+bdFrczyRqi6D0kASRt4Q6n+l/JlgA0quMdyuU/zOI+sj/h/
 oCuA==
X-Gm-Message-State: AOAM532CT4JCeZLVG8PVVV6PKSXytv8jc9TTJoC2GrmMR/T3FJlBskjN
 nGc+Ezjr4qZoTbjTQjdtWE86Nw==
X-Google-Smtp-Source: ABdhPJxvF2O2sgkC0kVqk+CqXNx+sJRdZ4rzJl6qFWMn3MHMJmIYwwPh45s9ny4p/aQ35Bb6myr7dg==
X-Received: by 2002:a17:907:3e99:b0:6df:7ad3:f66b with SMTP id
 hs25-20020a1709073e9900b006df7ad3f66bmr8114979ejc.230.1648156499901; 
 Thu, 24 Mar 2022 14:14:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a17090664ca00b006df8869d58dsm1575615ejn.100.2022.03.24.14.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:14:58 -0700 (PDT)
Message-ID: <a74f26d5-609d-bdb1-1941-6b2771220012@mind.be>
Date: Thu, 24 Mar 2022 22:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220315221011.2440571-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220315221011.2440571-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: use official tarball
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2022 23:10, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dav1d/dav1d.hash | 3 ++-
>   package/dav1d/dav1d.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
> index b0f163bae7..5e838b0951 100644
> --- a/package/dav1d/dav1d.hash
> +++ b/package/dav1d/dav1d.hash
> @@ -1,3 +1,4 @@
> +# From http://download.videolan.org/pub/videolan/dav1d/0.9.2/dav1d-0.9.2.tar.xz.sha256
> +sha256  e3235ab6c43c0135b0db1d131e1923fad4c84db9d85683e30b91b33a52d61c71  dav1d-0.9.2.tar.xz
>   # Locally computed
> -sha256  0d198c4fe63fe7f0395b1b17de75b21c8c4508cd3204996229355759efa30ef8  dav1d-0.9.2.tar.bz2
>   sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
> diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
> index d7224625c8..ecc4cc55c3 100644
> --- a/package/dav1d/dav1d.mk
> +++ b/package/dav1d/dav1d.mk
> @@ -5,8 +5,8 @@
>   ################################################################################
>   
>   DAV1D_VERSION = 0.9.2
> -DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
> -DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
> +DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
> +DAV1D_SITE = http://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
>   DAV1D_LICENSE = BSD-2-Clause
>   DAV1D_LICENSE_FILES = COPYING
>   DAV1D_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
