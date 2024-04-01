Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFF2CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 18:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA2924066D;
	Mon,  1 Apr 2024 18:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osQ5ru1X0bmg; Mon,  1 Apr 2024 18:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91171406D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91171406D8;
	Mon,  1 Apr 2024 18:55:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08E931BF28E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02F25608F4
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdO93MIN0uF6 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 18:55:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB667608B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB667608B8
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB667608B8
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 18:54:59 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-415446af364so21238805e9.0
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 11:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711997698; x=1712602498;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B58501Zs4SyU4Yt6vehQ1t9yDe2tHWHq1XwF3x+KNvI=;
 b=I4FexqTI8Snubot52/aEXxoVvj1XD78vIodhqGPgU3sc77FcCwupVua0nBR9vhvT9I
 mP/9c191XE89jPoB3V0rvOTrclZ+tNJwb1D5a5tUlKR9v7KImtZnZmdyJhRgsRXOrj47
 QAPrqBjmy8dUhv+k86rg641VmjGJn8UYa+ouFT7MfICsuRuRJ/lB/fsLomKNsigEsCgN
 y/AKVD1ttEx/Xlkg7OGhUaSr8SaU2Luj08gZir1NGXxPdfcfeFX9TNK1lfJDD6t1HiBO
 pTGeGcdtJHCPVFkya47z29+o98AHy3vaZ4uLq26Xdvq7DEjB2UKRExCM866LKN2JHj0D
 5Rxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZF8wKXkXRAXX++o+5iAS+AjoTvKLzAZr4YXWnk/jUaMBr7m0/UCRODCOJkisAxpyf6Muk/Hfe8VhhNMJ+9tedOCMs5eGyYw==
X-Gm-Message-State: AOJu0YwtoKa86IbFPjhcQXRWu3Z7bIedirk/mjH/dBb7GqCk1eMoMsFn
 vWw+KuOB/P1/dIFOlSHSJpDOlyA2fH/5NuTn6mk/VYt0xBQIQ4+xvVCTddQSiSULx4AJ+kFrO1u
 R
X-Google-Smtp-Source: AGHT+IE9B7+HnmIkg+7nlmvAaP1lcKxPl7pxvj+YYaQGvHoIc2auhzZkZtOzdY5mmNL9MlW+o2m8Xg==
X-Received: by 2002:a5d:4c85:0:b0:33e:c2f6:96e1 with SMTP id
 z5-20020a5d4c85000000b0033ec2f696e1mr11561461wrs.25.1711997697518; 
 Mon, 01 Apr 2024 11:54:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bk20-20020a0560001d9400b0033fc06f2d84sm12222133wrb.109.2024.04.01.11.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 11:54:57 -0700 (PDT)
Message-ID: <eb210524-9bbe-4d85-8a11-f034b66618d4@mind.be>
Date: Mon, 1 Apr 2024 20:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
 <20240331004133.636618-7-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240331004133.636618-7-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711997698; x=1712602498; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B58501Zs4SyU4Yt6vehQ1t9yDe2tHWHq1XwF3x+KNvI=;
 b=hml5vngF/HpNZykdDShGGLQswpwJ3uj3xwSGQlU28iZEBvqLMhxFZu0HPn990TG4nC
 JI+d5RPI4baKXe4vtr8OOV7soFhvgofNOMSkIS2hxbIj0lVc59sWlQ0DGXScv765TZ3y
 n7h/oZfucU9xsiEvTjuTPVS9wC+SwM3u8KXuUWUA+H8kcfgb4RPvF/JkfsRcb0Qn7ZjT
 usmC6wR6ZkVA6QCMFpXcdPPebNeD5CjbIiH5BcRHV6IPYjZfevoANS+KaFj+LHz+7Jab
 uGb8xe44zjHVOT2+PGPbmfLxujGMnrwCGRrjs6c8YeE1UMoRyQijKGnYZkPi0bCEw3z0
 hI/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hml5vngF
Subject: Re: [Buildroot] [PATCH v9 07/18] package/python-frozenlist: migrate
 to in-tree pep517 build backend
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Christian Kellermann <christian.kellermann@solectrix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/03/2024 01:41, James Hilliard wrote:
> When building with a pep517 frontend we need to use the specified
> build backend as opposed to the fallback setuptools build which
> only works when not building with a pep517 frontend.
> 
> This package currently builds using setuptools as we do not yet
> use setuptools with a pep517 build frontend. The package contains
> a setuptools fallback which only can be used when using setuptools
> without a pep517 frontend as the pep517 frontend will only use the
> build backend specified in the package pyproject.toml which is
> hatchling and not setuptools.

  I guess this should have been "custom backend" rather than hatchling. I 
corrected it like that.

> 
> The custom in tree backend depends on setuptools and expandvars,
> additionally it depends on cython 3 unless disabled.
> 
> As we do not currently support cython 3 lets use the pure python
> build instead.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-frozenlist/python-frozenlist.mk | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
> index 9333598808..92670b3cbd 100644
> --- a/package/python-frozenlist/python-frozenlist.mk
> +++ b/package/python-frozenlist/python-frozenlist.mk
> @@ -7,8 +7,12 @@
>   PYTHON_FROZENLIST_VERSION = 1.4.1
>   PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
>   PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/cf/3d/2102257e7acad73efc4a0c306ad3953f68c504c16982bbdfee3ad75d8085
> -PYTHON_FROZENLIST_SETUP_TYPE = setuptools
> +PYTHON_FROZENLIST_SETUP_TYPE = pep517
>   PYTHON_FROZENLIST_LICENSE = Apache-2.0
>   PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
> +PYTHON_FROZENLIST_DEPENDENCIES = \
> +	host-python-expandvars \
> +	host-python-setuptools
> +PYTHON_FROZENLIST_BUILD_OPTS = -C=pure-python=true

  I added a comment here explaining that C code generation requires Cython 3.

  Regards,
  Arnout

>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
