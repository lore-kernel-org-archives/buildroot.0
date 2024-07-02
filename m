Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A75C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC2DB81FDA;
	Tue,  2 Jul 2024 07:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdXxBC_ixfBb; Tue,  2 Jul 2024 07:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C23EF82056
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C23EF82056;
	Tue,  2 Jul 2024 07:47:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4571B1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DCD981FBB
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5OylcVA-HOs for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:47:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E313811C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E313811C4
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E313811C4
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:47:01 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4257a390a4eso18429515e9.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906419; x=1720511219;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EGq2kca/jXNXnpMxNWnwUmLKwaT1ptt35bkM1gCo00s=;
 b=u4iTmi6WE0KkSbtZ6fGydLeBJWXqIEKMyzZgMCit1bUnoj9H83FjN1iFvMzob5DiZm
 PJs57/b2WKa97Rl3/hveAjZW/9h5L0eVWjmJq5q8P1aL+GndbrkHxgbjLDx3Tn43hi4l
 Z5Ffot6SURzHuxD8L/ilfH+WGnYrIkKnx8xHTA6bDj+rhBkJXDz486V/Uf9yHNrWw/bs
 qnEq6NJSeufywjxCIduPMydHGrFvth+Q20y7YteS61ErtzFL3luEqY4hleVHBaJNsTym
 B6hpicVnM9RLPhX8hnUFkuT4H9XEK9/hjTWGG735oYWOxm/YZJtDrPr5k0Q5JqwVG0Px
 uLMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsR3/vcUBF50I+bWhyya54FLyft+oLRfW8pjKzkGxN2uaoPaY04R6mvbLHVrRB/+SK38fhxmtb9XzBhRwD8cE6L3h19J9Tmg==
X-Gm-Message-State: AOJu0YxLQbE+7H3wG0eNnxoo6Z8UbmdEVbujWvlmClrJacJ3CFGnfZo9
 PRp8xRrC/B7vnPzQo+xW4wfHf4w+RO0q6bfNz4DD9CKyPPDptAzv1Itih3NzRcq+nWXyuRVxoN3
 +
X-Google-Smtp-Source: AGHT+IGOLgCjfWowQGaZFcVmUlErCcweMnBV1kqWObdGSS3JDm5QiZCoP1N+OWN1Xql0bSlT5TVl1g==
X-Received: by 2002:a05:600c:3b09:b0:424:a721:1d0f with SMTP id
 5b1f17b1804b1-4257a020eeemr50462665e9.29.1719906419699; 
 Tue, 02 Jul 2024 00:46:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c0f99sm189723115e9.41.2024.07.02.00.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:46:59 -0700 (PDT)
Message-ID: <7d22c16c-69cb-48d3-bb8b-8f48ea58d6c9@mind.be>
Date: Tue, 2 Jul 2024 09:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701194029.1789343-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701194029.1789343-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906419; x=1720511219; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EGq2kca/jXNXnpMxNWnwUmLKwaT1ptt35bkM1gCo00s=;
 b=OEWaTGt2S29Z8jFjfIpkHqmEpTNAi2TzwnnQ0+Mrz6yFCAZreKn0sAJz1H+HvKnBoh
 qqtMerbMurnjh8clnGCaAzZMuHF+hKhSNj5pQFa7A+bhWHdntxuiy8KU1WPTaL5cUUvF
 Q80oW4kZlWl6kdaT+1+g9ULvLHJUDjxmp82l4FR9PaSWpo0cNxKSF/fG/Qpnau7rf3et
 P/6m5h+E2bSora7fSKQAeV9DWqcSyuvZAZSxeM2ZZOWNeGKZpLEwONM80NDdZSBnq8x2
 9fJgxTx/nR884vU6E4eS/emvUze4nFK/zTx0UAnprtO0zO9T2nN7RG0Ai30czWw+Qzvv
 lxvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OEWaTGt2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to
 version 2.8.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 21:40, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pydantic/python-pydantic.hash | 4 ++--
>   package/python-pydantic/python-pydantic.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
> index 75ecb23053..caac7f8957 100644
> --- a/package/python-pydantic/python-pydantic.hash
> +++ b/package/python-pydantic/python-pydantic.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pydantic/json
> -md5  4651fb3374d2a0d74442c2cc780770d0  pydantic-2.5.3.tar.gz
> -sha256  b3ef57c62535b0941697cce638c08900d87fcb67e29cfa99e8a68f747f393f7a  pydantic-2.5.3.tar.gz
> +md5  38edaad5e8687f1b238577ee05a4c968  pydantic-2.8.0.tar.gz
> +sha256  d970ffb9d030b710795878940bd0489842c638e7252fc4a19c3ae2f7da4d6141  pydantic-2.8.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
> diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
> index 0cce5a153f..4c2becc9c9 100644
> --- a/package/python-pydantic/python-pydantic.mk
> +++ b/package/python-pydantic/python-pydantic.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDANTIC_VERSION = 2.5.3
> +PYTHON_PYDANTIC_VERSION = 2.8.0
>   PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
> -PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/aa/3f/56142232152145ecbee663d70a19a45d078180633321efb3847d2562b490
> +PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/8b/7b/23dc30fba5793d7be3307f33bebb36e08f78f8af9c03fce608833f01bebd
>   PYTHON_PYDANTIC_SETUP_TYPE = pep517
>   PYTHON_PYDANTIC_LICENSE = MIT
>   PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
