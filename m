Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479F2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:35:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D80D660F56
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D80D660F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A472840130;
	Tue, 26 Oct 2021 19:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kK_mrUOMsFpL; Tue, 26 Oct 2021 19:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2E8F40275;
	Tue, 26 Oct 2021 19:35:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFF671BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECD7380D52
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QD7jbQQcH1Oq for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:35:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1D4680D26
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:35:07 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y12so929593eda.4
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=59HDKxFh8nqS3oIFtufZdSo8J/jdc0+WbERF/Z0tpxU=;
 b=QEzSbpckMhVcNdHF+4jlUcXq4RaZhg5botMmy1FMjOHBJ5OBqsN9hURA45RGjGB8sh
 Bv8VP5haE2sIG9c/sRW8EBLwNb1m0UQ9rJCNFEFjNuNJ8uAazCG90NcYYCQL274Abf7t
 9q1v0JDrkZlW5BbqTnpoTBHvaFjBnawbO7LU4/LKo8u5v1fCFQZ7wKn8AtVD0xulAJ8s
 zKOMwUR4JEbX10UJkzQ/FppUvo1MOk9CsLKA3GlfsAXxV4/pnCIvOFV10KnoOZ+evTPq
 kTl2CmUg8GbgHlSqOsHV1nqlv3c61B3TINe5nf2NqOzWI6AKA51jVRDZq96svBGAZZm1
 mmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=59HDKxFh8nqS3oIFtufZdSo8J/jdc0+WbERF/Z0tpxU=;
 b=DDFt27/KG4RJNEcNDiQjjbwIUr45fXCTfXCeoQR22DLlVduIw9DtbcPvmqsmmgbA4Z
 4/oOieX7wJWhzv/+qfEEdayp/4HUI0kNU63P/JMo6EGLavkNUFJcb7Li5nA7BaK0GbsY
 K/7NYsVZwr667NMHVebogBmAxllaGFI9eCWVJHSgFmrjzdD0ZMPx6aIuDpXkVXc+2GkI
 TJSiYZN0NwbP/qyr1lU7fA9xjQzsJCV9H5An5ifStwb1A7xAWPzOYQ6ZsdfHeOalF4Ei
 g1Ce10SBLx/kE9lL+wUhtl/sqhbkjXuRiFHimWzZyo7Dyvc3sknTfWsmRHrkmIiitZ8t
 O7fA==
X-Gm-Message-State: AOAM530yUqVOdxTox0l5zT7T3KstMC50DepOv5RJSgz55PUfYZq2ay+o
 XKrtpM2HSn1PDpy/14lpS17ZzSe81nic6g==
X-Google-Smtp-Source: ABdhPJyN5Z1EuroOv6vnaGTn9DropS2oV6MmPRfp/ge3oOJ9Ojntq5vOqDO0qingUfjMjXuvfiabPQ==
X-Received: by 2002:a05:6402:5190:: with SMTP id
 q16mr37546281edd.228.1635276906185; 
 Tue, 26 Oct 2021 12:35:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bd18sm1058edb.58.2021.10.26.12.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:35:05 -0700 (PDT)
Message-ID: <aa4a6634-48fd-ea5a-0855-a3eb7140876f@mind.be>
Date: Tue, 26 Oct 2021 21:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211024165303.15342-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211024165303.15342-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: bump version to 19.3
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



On 24/10/2021 18:53, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
>   package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
>   package/kodi/kodi.hash                                   | 2 +-
>   package/kodi/kodi.mk                                     | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> index 7b4df91efe..81fc2bb9f1 100644
> --- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> +++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> @@ -6,7 +6,7 @@
>   
>   # Not possible to directly refer to kodi variables, because of
>   # first/second expansion trickery...
> -KODI_JSONSCHEMABUILDER_VERSION = 19.2-Matrix
> +KODI_JSONSCHEMABUILDER_VERSION = 19.3-Matrix
>   KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
>   KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
>   KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
> diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
> index 7d13c72cc6..2ebcd7d8de 100644
> --- a/package/kodi-texturepacker/kodi-texturepacker.mk
> +++ b/package/kodi-texturepacker/kodi-texturepacker.mk
> @@ -6,7 +6,7 @@
>   
>   # Not possible to directly refer to kodi variables, because of
>   # first/second expansion trickery...
> -KODI_TEXTUREPACKER_VERSION = 19.2-Matrix
> +KODI_TEXTUREPACKER_VERSION = 19.3-Matrix
>   KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
>   KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
>   KODI_TEXTUREPACKER_DL_SUBDIR = kodi
> diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
> index e51ebaff0a..7f96af385a 100644
> --- a/package/kodi/kodi.hash
> +++ b/package/kodi/kodi.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  e8f5e50767ddd1b8f0399016dcf5ba762315c16c0568cb06e659c493376f99d5  kodi-19.2-Matrix.tar.gz
> +sha256  440f47e475dd8a48e0a6d41349e83b74890f3fbe8275d3e401d3c50f5b9ea09b  kodi-19.3-Matrix.tar.gz
>   sha256  38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
>   sha256  071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
>   sha256  a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 49174316fc..3c314533f4 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version, please also update kodi-jsonschemabuilder
>   # and kodi-texturepacker
> -KODI_VERSION_MAJOR = 19.2
> +KODI_VERSION_MAJOR = 19.3
>   KODI_VERSION_NAME = Matrix
>   KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
>   KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
