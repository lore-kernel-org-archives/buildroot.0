Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605D6C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:57:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C36466103E
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C36466103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83CE8400EE;
	Wed, 25 Aug 2021 19:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iaXhRLLQ29Qz; Wed, 25 Aug 2021 19:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED00D401F3;
	Wed, 25 Aug 2021 19:57:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBB221BF588
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB1708105C
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLb-zS3qmV89 for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 19:57:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1069A80EC2
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 19:57:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id i21so912910ejd.2
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 12:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aKKJ9D69+gYPJHhTA8U4ItcJlzx9rUZmohoaDzeE4c4=;
 b=RfS8G0kDJZjT0XrHZ55PsfxSmaD6vWv2TMJ0bj+fGn+QVptedWsLisdWlVVK3slPaH
 PMdcBJObWN/t17VA1BVKldSZZEipCJaWxj/gQbwdufODycUkwgJvNZmPBSdKGrVqUlRF
 tXNz5Jk6zQxFbSaZ5cZ6aIbCqY4PGEWhL1ZtHt7vCmuz3fIG2IjX6xZDPTDOLA4i6MXY
 wN8nKKNhIxYNLupV0LKPg5cVa1icdFxpksQhmTzNhHXvKxriItyGfvtRh9aqQHTQDIVp
 KXaEbotv/og04XCKzvCUWGpgysMHmLdk4iK4QFORdEiQtf5O9Te5qfUFMXajegKDn1rp
 ZJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aKKJ9D69+gYPJHhTA8U4ItcJlzx9rUZmohoaDzeE4c4=;
 b=HIEkUwXSyJE2xgt6YKfE7jbauEVT6uQKfWzKfaCQvdZe3Zv/kt2yhDb8DnjxHdZDzp
 3Drt+4p7ySw2aHZM6IeX0/CGUbebO8z/BX0nurNRfLaQSLS9OFHVfUOUwJzLj7Qw5/vx
 4bzhiJSJyrUJrPY26P/IhiOUg40ub2fYrX9uFBEMzYnfv7tFHTVGr9lNhUGhwuEqsvTg
 uylGb8Owi5wnVqdm+ME4jMzXYsJZxbAasgIhgKy+yqI2qwwA1v1Qepg+L4Udg00KYOm4
 cDNIZCKPsUQ640u9YFeOMog0mHgq8W3VzDuDUk+JWz4REm/r3r4X9FiAoW10sv2nlhKY
 2Nyw==
X-Gm-Message-State: AOAM5319mWZqvjREqblR+0EdctVLd0FaY2e+S3YqpYWiEMMepjY4fxKw
 jMfQ1pRDtYeexgM3T6frI9cNRfxxx+QO1w==
X-Google-Smtp-Source: ABdhPJxfEosd1Y/6M3IVaFdU/CYEKX3hhuSOz9JG97yJU20+Jw35k6Fl6UXRjXxK2cpbYEZub9AZrg==
X-Received: by 2002:a17:906:7802:: with SMTP id
 u2mr324347ejm.325.1629921435310; 
 Wed, 25 Aug 2021 12:57:15 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q5sm506300edt.50.2021.08.25.12.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 12:57:14 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210824195006.185258-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a0867ba6-a6f7-799b-cab0-2b728b901efc@mind.be>
Date: Wed, 25 Aug 2021 21:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824195006.185258-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump to
 version 3.5.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 24/08/2021 21:50, Fabrice Fontaine wrote:
> Fix CVE-2021-36976: libarchive 3.4.1 through 3.5.1 has a use-after-free
> in copy_string (called from do_uncompress_block and process_block).
> 
> https://github.com/libarchive/libarchive/releases/tag/v3.5.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libarchive/libarchive.hash | 2 +-
>  package/libarchive/libarchive.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
> index bf0d6e4fdd..d31e9f55f4 100644
> --- a/package/libarchive/libarchive.hash
> +++ b/package/libarchive/libarchive.hash
> @@ -1,4 +1,4 @@
>  # From https://www.libarchive.de/downloads/sha256sums
> -sha256  9015d109ec00bb9ae1a384b172bf2fc1dff41e2c66e5a9eeddf933af9db37f5a  libarchive-3.5.1.tar.gz
> +sha256  f0b19ff39c3c9a5898a219497ababbadab99d8178acc980155c7e1271089b5a0  libarchive-3.5.2.tar.xz
>  # Locally computed:
>  sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 9cc69fd45a..eec256ba75 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -4,7 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBARCHIVE_VERSION = 3.5.1
> +LIBARCHIVE_VERSION = 3.5.2
> +LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
>  LIBARCHIVE_SITE = https://www.libarchive.de/downloads
>  LIBARCHIVE_INSTALL_STAGING = YES
>  LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
