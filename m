Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1269AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:48:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89CA060F91
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89CA060F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B8C819F3;
	Sun, 26 Sep 2021 19:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWNMAUh_7JLH; Sun, 26 Sep 2021 19:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13CA381A64;
	Sun, 26 Sep 2021 19:48:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8748A1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7658B60712
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iiI5XjKqe7mi for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:48:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7827E605A2
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:48:19 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id l8so12330811edw.2
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wDT6PEC+GOfrnF5xaWAthRXyN9uS7d7Zf6XYqJuYduc=;
 b=YDNyysTYwUodtD7nE+lbflu4soM+/uDPb7D7NHgmguBhKlPiJFTA6k3Dq1Khl4jz2Q
 8QyAeidJ5LHie8ELb9fFYiKrRCRa/8bjfVO+ZMJvSz5/YtbTMFZMmy83rWl4GS1JsDx8
 rKqdE5/6iKFBQbrKhu7BvAYqPPm+k2/oOG8iFB1sxm77AN3NPradYfC6C0RxUFhb4mfn
 FzMqcTi9IjLU1A8ymeOiUmi4ffqpJvDqnT0x7X6Np+ehjxYl+br/d6tumO2mUyMTYVhT
 ZHIU+PYxqSofT6TN7c4eY6dK1Lpqm+wZZvo/v0U4CWkYqkm8R8c2YE43PLLps19uahBw
 eFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wDT6PEC+GOfrnF5xaWAthRXyN9uS7d7Zf6XYqJuYduc=;
 b=iRPFiZZDJIOnUahaDSHgT5MlL8g2NaRrgt0BVbo6Qy7fToBoaB3qyNqOfY4rJIRzVu
 jLe5FHO26usXSkyYAphvCdzctnbiozPt0zaMRNRnHePxFfxosGU4GX2I2OLq181MCKCe
 ewtZbCMd1AsEXh1VKx/+jepJvDtDqZ7WILo4xJVtlrZ09FrO7TcbAM6LMTpDYH8th4F5
 CcHMhYRPlCuCO7w97/3JEHO96ikm9aJHHWuWvCp9cmO9Y5j3zT9pjaYwprhdYm8H+52G
 x7VGedpue4Tg7CtEFVkF7nYocE0Ia7XIvPE/QE0fO0R6GphW69AZx+TClsdiSlYo9Z8S
 gyBQ==
X-Gm-Message-State: AOAM530vXyz502QVtn9xj7yoXMVIYWqywjrIjBzOrBX9hNzon5s7ro2N
 4DkvPOqfejcwjPl/DQYYzKdQYcuFPIQ67g==
X-Google-Smtp-Source: ABdhPJzLTyJlRGbWxFLXJH7UMjO/r7XwmvGnd14BP0dXOmcVGUOVSwMOCrI9lAbHmkgh1Jy+lPTpOw==
X-Received: by 2002:aa7:cdc8:: with SMTP id h8mr19616800edw.272.1632685697617; 
 Sun, 26 Sep 2021 12:48:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i6sm7516438ejd.57.2021.09.26.12.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:48:17 -0700 (PDT)
Message-ID: <c6919f47-71e2-60bf-b782-2614120f971d@mind.be>
Date: Sun, 26 Sep 2021 21:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20210925094626.365400-1-asafka7@gmail.com>
 <20210925094626.365400-3-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210925094626.365400-3-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ipy: bump to version 1.01
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



On 25/09/2021 11:46, Asaf Kahlon wrote:
> * The package supports both python versions.
> * Indent with two spaces in hash file.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-ipy/Config.in       | 1 -
>   package/python-ipy/python-ipy.hash | 6 +++---
>   package/python-ipy/python-ipy.mk   | 4 ++--
>   3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-ipy/Config.in b/package/python-ipy/Config.in
> index bead932da8..b4f0c8cb5e 100644
> --- a/package/python-ipy/Config.in
> +++ b/package/python-ipy/Config.in
> @@ -1,6 +1,5 @@
>   config BR2_PACKAGE_PYTHON_IPY
>   	bool "python-ipy"
> -	depends on BR2_PACKAGE_PYTHON
>   	help
>   	  IPy - class and tools for handling of IPv4 and
>   	  IPv6 addresses and networks.
> diff --git a/package/python-ipy/python-ipy.hash b/package/python-ipy/python-ipy.hash
> index 641a2eb21f..3d8e1e8c71 100644
> --- a/package/python-ipy/python-ipy.hash
> +++ b/package/python-ipy/python-ipy.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/ipy/json
> -md5	1a90c68174234672241a7e60c7ea0fb9  IPy-1.00.tar.gz
> -sha256	2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621  IPy-1.00.tar.gz
> +md5  d6cf83e7f418ebbd23324ba1c658b907  IPy-1.01.tar.gz
> +sha256  edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a  IPy-1.01.tar.gz
>   # Locally computed sha256 checksums
> -sha256	078bb46799e46e51e7239c24ff130d345db911c11efafef5e3c45dfb7adb0a61  COPYING
> +sha256  078bb46799e46e51e7239c24ff130d345db911c11efafef5e3c45dfb7adb0a61  COPYING
> diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
> index 817b531e0b..2a01daf4ca 100644
> --- a/package/python-ipy/python-ipy.mk
> +++ b/package/python-ipy/python-ipy.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_IPY_VERSION = 1.00
> +PYTHON_IPY_VERSION = 1.01
>   PYTHON_IPY_SOURCE = IPy-$(PYTHON_IPY_VERSION).tar.gz
> -PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/e1/66/b6dd22472bb027556849876beae2dd4dca3a4eaf2dd3039277b4edb8c6af
> +PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/64/a4/9c0d88d95666ff1571d7baec6c5e26abc08051801feb6e6ddf40f6027e22
>   PYTHON_IPY_LICENSE = BSD-3-Clause
>   PYTHON_IPY_LICENSE_FILES = COPYING
>   PYTHON_IPY_SETUP_TYPE = distutils
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
