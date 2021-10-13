Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7779BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:00:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5D961222
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E5D961222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B8F60AE1;
	Wed, 13 Oct 2021 20:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9BHOVdn95NJ; Wed, 13 Oct 2021 20:00:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C8C6076A;
	Wed, 13 Oct 2021 20:00:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02EDC1BF290
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F237340219
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9kSsG7GASwN for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:59:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A37F040155
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:59:57 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g10so15045186edj.1
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=muCRcug+2oBkJ3aQ3U5wpplckmAqo1Oy9rcGup0Oagw=;
 b=QiPpQjMY9vL+m3/1Xr3EqaxWF1B3CwVg9g0Mfqi92gPMWUdgzeZ+qSLtRUwada7Qz0
 +2s26vj3Wrw/IB46lvo6GYioS799I0E50GUpV8vX936PY2OMXyJc63JwlRc3jdURWFDS
 dWynTrcFwsc6JPd0IRNiQ0b3Wpo9uYGxgS/ZpY8SOgO2mTLVeiknewXkUYfEW6McSiZ+
 99fcj62uqoOI9hRASGXIJZacycgnkeN4oenQsKAVduys8wJ5DIyg744JGHQaehgCQwcY
 znv5/2cTpN2uVatUZggmUcplOqsnxCD5BMQyXW++pKvGcf9+kY+StfORtbdFHAkXnOTn
 hr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=muCRcug+2oBkJ3aQ3U5wpplckmAqo1Oy9rcGup0Oagw=;
 b=1O5WsEYQGDIajDbf3WGbUfe4uNQY+X9aAfd7m7JIopIHglU+U+5zj0iq300EdnPMV0
 r6B5acCUtbiXc1CBFq/W497Wkyx/UypNIF5RsmSW8k+Rxu6SdMU5CIqbtPfS6xalewX1
 WuzZj5YdHUFo0jgLGvDAXmBhu+MMF+O003PWFUIS2ndyduy6+5meZmKNHkqbT1cztQcy
 XaFslOvHtkq6gSJsa215MMO0HVrbuSxC/3qYdewESb2h0nomOGVTMzipNuUo9pLYagNE
 /YNJA4sFmOCdn4GbySE3nLcxp79vwfYBZXf/Gc8Ift4RXt0TGuGYj/osQgvvi0tHMVGo
 Ux0w==
X-Gm-Message-State: AOAM533uxfS7L9OfeOiAwMrDbWOLktmPgVDWO9jZT+eaAOTssHIXEiG+
 RRlZawctGRkT94/dAXphW3g14g==
X-Google-Smtp-Source: ABdhPJz9KrX6xFSHwi0gLVcmDCr/BFh1QZETR0IEBqstRB6nZWi7wA+Eei0q2t5Moblgv+/ir2Jruw==
X-Received: by 2002:a05:6402:2787:: with SMTP id
 b7mr2089477ede.238.1634155195792; 
 Wed, 13 Oct 2021 12:59:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ep4sm367606ejc.18.2021.10.13.12.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:59:55 -0700 (PDT)
Message-ID: <256f2128-4b99-1b94-f826-0553dcf41d4d@mind.be>
Date: Wed, 13 Oct 2021 21:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20211007185517.108626-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007185517.108626-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-arrow: bump to version
 1.2.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/10/2021 20:55, Asaf Kahlon wrote:
> * The package doesn't support python2 anymore.
> * Indent with two spaces in the hash file.
> * License file was updated to fully fit the Apache license format
>    (see: https://github.com/arrow-py/arrow/pull/679)
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-arrow/Config.in         | 3 +--
>   package/python-arrow/python-arrow.hash | 6 +++---
>   package/python-arrow/python-arrow.mk   | 4 ++--
>   3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-arrow/Config.in b/package/python-arrow/Config.in
> index 1458556830..aed9a682ff 100644
> --- a/package/python-arrow/Config.in
> +++ b/package/python-arrow/Config.in
> @@ -1,8 +1,7 @@
>   config BR2_PACKAGE_PYTHON_ARROW
>   	bool "python-arrow"
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
> -	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
> -	       if BR2_PACKAGE_PYTHON # runtime
>   	help
>   	  Better dates and times for Python.
>   
> diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
> index 90e0533232..9216e1c26c 100644
> --- a/package/python-arrow/python-arrow.hash
> +++ b/package/python-arrow/python-arrow.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/arrow/json
> -md5	554f18b0e23182ee0e8cb2a882d2f607  arrow-0.15.2.tar.gz
> -sha256	10257c5daba1a88db34afa284823382f4963feca7733b9107956bed041aff24f  arrow-0.15.2.tar.gz
> +md5  608682052926c7e5636285af0618ef38  arrow-1.2.0.tar.gz
> +sha256  16fc29bbd9e425e3eb0fef3018297910a0f4568f21116fc31771e2760a50e074  arrow-1.2.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256	a4b7601be50569c2c96a9818fc809b0149410c84c99714d60c9d4fb0ae861fa2  LICENSE
> +sha256  40d6e1255d7151f5f041a514725d3c94ffa8c1881e5a0c29b6bea93f03e2e3bb  LICENSE
> diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
> index f8326288b2..a20ac8dbc7 100644
> --- a/package/python-arrow/python-arrow.mk
> +++ b/package/python-arrow/python-arrow.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ARROW_VERSION = 0.15.2
> +PYTHON_ARROW_VERSION = 1.2.0
>   PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
> -PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/43/0e/47416c54ad7742981bf77fdfc405987551ab14b181a6140c8cd2a5823872
> +PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/dc/bd/2565b8533bb8cf66e10a9e68a1d489ad839799b2050f0635039e614e3b1a
>   PYTHON_ARROW_SETUP_TYPE = setuptools
>   PYTHON_ARROW_LICENSE = Apache-2.0
>   PYTHON_ARROW_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
