Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EF6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:34:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9861760E09
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9861760E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 762CC406E8;
	Tue, 12 Oct 2021 20:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DmlUgXRXKA4; Tue, 12 Oct 2021 20:34:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D313F40703;
	Tue, 12 Oct 2021 20:34:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9374A1BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8148A4011D
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yb24cz9DMq7W for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:34:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DC50400CE
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:34:07 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d9so1079520edh.5
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KXyEk97wWRYlUcJvJxYs5BIdCLujqnyUjE3niiVFp3w=;
 b=cZ37xBK+Rm5T4hvIwzm5TZOHPZLIqsW3ALlZHQ8YM0LrAd30Mqubd9cyvwItk2KH5p
 GYoNbYwnT784X6EfpPM1AQ09rknEGNch3LPTA+oQzaWeXraeFhHZEMfIWCsf1lkEl1Ee
 CKNyOkYAIxdxBgPzmT/IKgHbcHCNFXYzPb5Y7bxYhQtYTwOrAIJ8d5XeCS36ef/g1pdi
 7v3VuxZdbW9piWDMuoPQ9/49GVyPaln4lEVlnoSGK6Z9IpEVqu5b/rdrAL/tYpl+IBRc
 6Yempg05CZUryCecUQ3Kg5Ipld1AsFOriL4EeIkpgx8hbhZH4UsXYO4ZcJy81yVGbLHD
 5+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KXyEk97wWRYlUcJvJxYs5BIdCLujqnyUjE3niiVFp3w=;
 b=QnUyd29x1LRQW3meVBu3tD9Co/oijhkdLSkwDnTv7GcEWyAMFYVRjgSb/OLXfofaV9
 XqFe7rVF+TDX3A79pVjvZNKVncWGEw0Y1oTwzn14mm/061E90PBOOofE05FWHlRS7R8R
 CPV8VLCWefB+QJ6UOZowkB5WZeMY3hcEslJvXojiyuRypDyuMpx2Vi9tQ93UOADpYIJn
 LB2F4ba/DT8dHf2YieHQGUX/9/VPGGoEUcXfBXNiOjL0OnE19Ce7gQAKIJAxQLlf9hkp
 kTF0+YZiJxQI36xx7g3pp6PY1G9isxcYk1dcBLK14qyeHP38zcLALMH/P3FEM0Drl/Oy
 jOLQ==
X-Gm-Message-State: AOAM532O2l8gOu6yWVbX79e4d+Y8ylen6xKuwcQXQWek96slCWe84sPG
 XjK2/JeYyR0KP+3rGSR82yMKxw==
X-Google-Smtp-Source: ABdhPJxPk6t8T4ZPMBHKn/ZWq6DHFjyPwIW33/Gx1HSOIjl9Fx6dpBKs+TR/0RfyB3gVKsb4dKpKDg==
X-Received: by 2002:a50:d8c2:: with SMTP id y2mr2868383edj.360.1634070846318; 
 Tue, 12 Oct 2021 13:34:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 6sm5451561ejx.82.2021.10.12.13.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:34:05 -0700 (PDT)
Message-ID: <c26e8dac-4399-fa3e-1776-a0ae6c541ed0@mind.be>
Date: Tue, 12 Oct 2021 22:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20211004171341.19564-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211004171341.19564-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-filelock: bump to
 version 3.3.0
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



On 04/10/2021 19:13, Asaf Kahlon wrote:
> The package doesn't support python2 anymore.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>


  All 4 applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-filelock/Config.in            | 1 +
>   package/python-filelock/python-filelock.hash | 4 ++--
>   package/python-filelock/python-filelock.mk   | 4 ++--
>   3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-filelock/Config.in b/package/python-filelock/Config.in
> index 57ec039400..bda4582ac1 100644
> --- a/package/python-filelock/Config.in
> +++ b/package/python-filelock/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_PYTHON_FILELOCK
>   	bool "python-filelock"
> +	depends on BR2_PACKAGE_PYTHON3
>   	help
>   	  A platform independent file lock.
>   
> diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
> index d50d2d561c..d7cc864668 100644
> --- a/package/python-filelock/python-filelock.hash
> +++ b/package/python-filelock/python-filelock.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/filelock/json
> -md5  c1fe6d9a7433a7ca6ce4f36e273317d1  filelock-3.0.12.tar.gz
> -sha256  18d82244ee114f543149c66a6e0c14e9c4f8a1044b5cdaadd0f82159d6a6ff59  filelock-3.0.12.tar.gz
> +md5  f8458b5235a9e439fd512dc08947f6b2  filelock-3.3.0.tar.gz
> +sha256  8c7eab13dc442dc249e95158bcc12dec724465919bdc9831fdbf0660f03d1785  filelock-3.3.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
> diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
> index 35b3374d29..00c32b2caa 100644
> --- a/package/python-filelock/python-filelock.mk
> +++ b/package/python-filelock/python-filelock.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FILELOCK_VERSION = 3.0.12
> +PYTHON_FILELOCK_VERSION = 3.3.0
>   PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
> -PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/14/ec/6ee2168387ce0154632f856d5cc5592328e9cf93127c5c9aeca92c8c16cb
> +PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/fd/6e/665a6cb363bee26e40954ee812e4e733fd7cafd84c06e0c7c2357641abd6
>   PYTHON_FILELOCK_SETUP_TYPE = setuptools
>   PYTHON_FILELOCK_LICENSE = Public Domain
>   PYTHON_FILELOCK_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
