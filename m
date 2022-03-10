Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9C2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D936127C;
	Thu, 10 Mar 2022 21:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Zz_JeFsDVxk; Thu, 10 Mar 2022 21:26:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C13D060B43;
	Thu, 10 Mar 2022 21:26:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C16571BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFB4884776
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wg1kvDo0G8SI for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:26:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE13484390
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:26:48 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id s10so8711415edd.0
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=06xgkInDk1aS7M2H490MGKgCx+V/o0yinT3y9EUtv1k=;
 b=hWwoPZMbCyyOWXBtBpvewn0/iVo8inYI9ZFzxNTmw2lUDBU7TfaLQKMGI6Any+5bRe
 qEslZTNvHmAAkRChwGx3Zpb1sWGHRYfCEp+21YFrBGDcfgsIbwKuHKV6UtYU/TONl9DG
 DOQmlO6Snoi06ifUCLS1N7N5v92iDO45skRezgjM6PG8nvf2YmwmB2rS2eDmEYZ6Xc9L
 o0upzticG7VEoHzQFnakiQr3ltnF1wv0H3fCWfkorU5ZTyT7n1PM/a/scigyeRCpL7ZV
 GN063rbJJXSGVacxWZgcXGve4u8ZNsXd8Umvr6QjWewvs6MB472wE5DEyrhPXNQXZtJ+
 96Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=06xgkInDk1aS7M2H490MGKgCx+V/o0yinT3y9EUtv1k=;
 b=QEPwCK2DkqlkHHLKrMAQAZji3m/QXVmNWeV9YCGe+fPCZwyVnX0s9D9H3g6hFBJCov
 hmVejymkXTDBxxpb9WfmEBfJGe4CvEzoGnVMBRINdCpEStPM/0KNll5YFrieXBpN/H90
 GUfWdYAVhvcRQyu0BM5nllRH9WYUkAf3/e1A1StduLzn7GifSKhULQm/dQ7VQb3VUXdg
 wozxsHyTYmguBACbwzN1M2qkqeyppH5hB54NsOrldwXMseosgeX0YrDCe1u0vMNHkNHW
 0tJ1JAVoGL9Rw/JBgNBchzVksfZFtkevcy68U30JKCa5xLTzT0YCbgr9pzkk/wmcaFvj
 4V8g==
X-Gm-Message-State: AOAM530wLM9EI4dOCPJJsE0EQRqSkAue5CGQGp29vCj5nT3nVlx2G1k3
 7oEQf+dW+Zv8vE8247WRaHDRqw==
X-Google-Smtp-Source: ABdhPJzu+1aOAEpNn0hhPtEwurvddtCiQ5PoP8iirXELEumXcgyhzGWw1WyE3+hypVVT2Low+V0FQw==
X-Received: by 2002:a05:6402:2549:b0:415:c31c:f9c2 with SMTP id
 l9-20020a056402254900b00415c31cf9c2mr6331472edb.335.1646947606930; 
 Thu, 10 Mar 2022 13:26:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ky5-20020a170907778500b006d1b2dd8d4csm2154297ejc.99.2022.03.10.13.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:26:46 -0800 (PST)
Message-ID: <17e6ed80-9fe7-3b84-8d8b-2c7f68a2185d@mind.be>
Date: Thu, 10 Mar 2022 22:26:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220216180128.49268-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220216180128.49268-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to
 2.4.110
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



On 16/02/2022 19:01, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/dri-devel/2022-February/342405.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libdrm/libdrm.hash | 6 +++---
>   package/libdrm/libdrm.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
> index ca7332dd76..e0fac3a4d1 100644
> --- a/package/libdrm/libdrm.hash
> +++ b/package/libdrm/libdrm.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/dri-devel/2021-November/332386.html
> -sha256  629352e08c1fe84862ca046598d8a08ce14d26ab25ee1f4704f993d074cb7f26  libdrm-2.4.109.tar.xz
> -sha512  45194bb28207421afcff3e247930d2eeab77a5fea58e6be22f67525f2e0aab2f410a9ae0ab315b55ef56b80c481bba40b1660468b7cda539758b2bbb8e814fd8  libdrm-2.4.109.tar.xz
> +# From https://lists.freedesktop.org/archives/dri-devel/2022-February/342405.html
> +sha256  eecee4c4b47ed6d6ce1a9be3d6d92102548ea35e442282216d47d05293cf9737  libdrm-2.4.110.tar.xz
> +sha512  52f92ef1fe4c218a1d7dba53ef43334dbfca80e3209afe59f3a32c4bf67473126534e990df07a931a12d46a3b997c21ef17c1c4d8a0c88d44d5c6c040e3b6be3  libdrm-2.4.110.tar.xz
>   
>   # Hash for license file
>   sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 9b614bf421..b64db06931 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBDRM_VERSION = 2.4.109
> +LIBDRM_VERSION = 2.4.110
>   LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
>   LIBDRM_SITE = https://dri.freedesktop.org/libdrm
>   LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
