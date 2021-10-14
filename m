Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50A0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:59:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BFA661151
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BFA661151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F298C40477;
	Thu, 14 Oct 2021 20:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Td_1duRRf3bk; Thu, 14 Oct 2021 20:59:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 588D0404B3;
	Thu, 14 Oct 2021 20:59:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC73D1BF292
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAFE74014E
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHlJSQd8P7wY for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:59:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB4434012A
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:59:45 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ec8so29434167edb.6
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 13:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Ks0n7Lqq3ZTL4AWOQrWNkqFeiQZXh0fQlawRVeSC6qY=;
 b=ICrXWS6ws0oBAoHvSR2lMOWVQL+GxPwKv+gM2tJp/N8y68wTfqmGjsG34uJL6EPuYY
 MVH9yQgPT0HYKuB/JNvvLsq+zgwxlyodUJe9VOKjsAkKLIruJrbaWvyON0yMm8xWPL/8
 8vtD/8h9cwyAnX+XLyPigyh3p6gjAGDEK9/dBsGin4YGh00zCQWF1/tSBLYGx+TqZ8hE
 3zC0AyaRTbQmwyuRbaHW1/rxtdIuSMSCa29qzOtlYNgpAg1h6sV6u/LtmS0KQ+z8S2Q0
 HXZ+g+zBcXqrvIM+Z6J5huvIebYW0OXv1LM0IovcPawBawZNBve3fCeDs97NqzOHZUV6
 lnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ks0n7Lqq3ZTL4AWOQrWNkqFeiQZXh0fQlawRVeSC6qY=;
 b=v2QrdiYs+NSman3mj/6DP9vzwa+rDQp3nKBlY8qsi6bacCoKboiTyuIHNlRXAHo0w1
 ebzEGeXEU++hpWQBGSCoKSsucdU/bd42763/46h2JUgXpBYtzMM/NCe5uxzP2h+WeYPB
 QZrBFJejoUBpXMeXdgeqfGX+Bx6WW5XEUbI8L47mZ6chuWW7Y+cxcj2pJdEmSmK4/hxH
 aaXNLxrhMzeeYqF7m3KVkmoYSVnWvjFn3lJWEh2S5GqQ9oGchmx8P7S5hiDeibRR/aFa
 SyX+bWb+jOvbpXE/QiXqaB7Dr/77tjYDBfwKduPOgLX69qWQWts2Y5Xo/KWoRlOOaVR2
 ZB/Q==
X-Gm-Message-State: AOAM530Eyv6J0xiTQsQ/mGiw1eCtuWabEX1Z3uvvauups7+wwUUwSbCa
 WzygfK+8xjMMmvblK0WCSTnYsQ==
X-Google-Smtp-Source: ABdhPJwrXft8ilmV97bm7xAQl8ELMhJHQ3bxG6ral0PXY5TZP5uahmyMOHtu6MbrffDxjSlB/Kz6RQ==
X-Received: by 2002:a17:906:712:: with SMTP id
 y18mr1633327ejb.408.1634245183894; 
 Thu, 14 Oct 2021 13:59:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ck9sm2757107ejb.56.2021.10.14.13.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 13:59:43 -0700 (PDT)
Message-ID: <80876d81-5abb-48df-4d45-a993a18809c0@mind.be>
Date: Thu, 14 Oct 2021 22:59:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211007212416.3927738-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007212416.3927738-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libgphoto2: bump to version
 2.5.27
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



On 07/10/2021 23:24, Fabrice Fontaine wrote:
> https://github.com/gphoto/libgphoto2/releases/tag/v2.5.27
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgphoto2/libgphoto2.hash | 5 +----
>   package/libgphoto2/libgphoto2.mk   | 8 +++-----
>   2 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
> index e405735c8b..af52b47dc8 100644
> --- a/package/libgphoto2/libgphoto2.hash
> +++ b/package/libgphoto2/libgphoto2.hash
> @@ -1,6 +1,3 @@
> -# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.26/
> -sha1  38373ef7f76e90492ffca309094487fb1474f3fe  libgphoto2-2.5.26.tar.bz2
> -
>   # Locally calculated hash
> -sha256  7740fea3cbb78489071cdfec06c07fab528e69e27ac82734eae6a73eaeeabcd4  libgphoto2-2.5.26.tar.bz2
> +sha256  a7253bd18c6ef65352150ac36a668f883a5ad2634eb6455b3ca9aa6ac98d0073  libgphoto2-2.5.27.tar.xz
>   sha256  ebc385a0b1d477be5177ed6d9129557aa59a3ad0f26ebe7dd97ee942a0fb68ee  COPYING
> diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
> index 1d42ba862f..c1d5352c00 100644
> --- a/package/libgphoto2/libgphoto2.mk
> +++ b/package/libgphoto2/libgphoto2.mk
> @@ -4,11 +4,9 @@
>   #
>   ################################################################################
>   
> -LIBGPHOTO2_VERSION = 2.5.26
> -LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.bz2
> -# Project is maintained on github but github tarball doesn't have
> -# configure, so use tarballs from SourceForge
> -LIBGPHOTO2_SITE = https://downloads.sourceforge.net/project/gphoto/libgphoto/$(LIBGPHOTO2_VERSION)
> +LIBGPHOTO2_VERSION = 2.5.27
> +LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
> +LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
>   LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
>   	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
>   # There is a single license file for the LGPL-2.1, no license files
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
