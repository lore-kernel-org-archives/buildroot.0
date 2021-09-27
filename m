Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD34FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:37:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8545660FC2
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8545660FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DE33404B8;
	Mon, 27 Sep 2021 14:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-945oOhdxhl; Mon, 27 Sep 2021 14:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D8CE403AA;
	Mon, 27 Sep 2021 14:37:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C1741BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37E3E403AA
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BcSvgrzJ2j4x for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:37:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 084824036F
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:36:59 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id s17so51543972edd.8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZsNB4Zvwv8EhVf5VPnBpyO4OltPx1GImds1PCejwm2s=;
 b=DdJ//0Qe3yPE2DMEXae/upRDDMsQ7O2lMrZtxYDH1K8aq8goIFzE9DaWsh7g2cbUPd
 wUvgk7d3ePcwewQFf0/wOdm3KI7iYZcubVUpmX/rPf5XSzJZg/hBB2zAr4zL1nNw8M0P
 US1npE42iJuMbq5KlF9zFyLaNrHIfr85I4rTdgE4W5mAbDf9JM+Te6CFj6109hpF8kZq
 H/72kRoyN2JogcYvqFtInhpJqrg6IQaYEwMS/Yy4bUOeCliJ/qKGg0llfNPOvM2jgxZV
 C/k/uFXmoFlf0oKAkc2yfMr4pwR+3I7ZydtMgMMuzgtj2cqwyCwPBL4jI5R6HVnpfcB8
 d5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZsNB4Zvwv8EhVf5VPnBpyO4OltPx1GImds1PCejwm2s=;
 b=ZN5Dc01B9CahQ7zwKrcZ3nsTgx8hiwvUH5hhfXi4Zxf/gYOq7FYkomSHyXBCxfSW6f
 8vd5RmcbMYD/YHvvaTaK8zAis1/DYhN0TzGUxk4wTJjz4UU4HNbcr/MaUAsvbduqY6l1
 gOMZkTVdW9JkUs0CLFybXLaQ1FnDvTlSfyZYmQ1DcCUWpwZRGMVMsyBMdCDTkrcAzt7r
 toaA55M2ZyeUC+c6O5V3rjOccojJsEovIQmRIINZ1HrEzKEDlE7Ol7CyT5FmQ7PqwKqd
 iaFA6Wq/L8TVDhWgr44asnwojgW//TXu+F54RycJPin/nUB8ZIw1hUz64VoI31stb4Sr
 eQnA==
X-Gm-Message-State: AOAM532jOy2UNDq9SWZkZ/db2tQT2qAZInsx7IRBQO7SdZLtAWnhLExf
 71VS7bsBsbqz4v44+9O7r5QEJu6tNC+sI5f/
X-Google-Smtp-Source: ABdhPJwh9RbXlYLMyKHyyevuHDQ9g1sHIr0C+Th573n9FminwmrRQKu+V6omxuFaRQbOWkZ+EZWwEw==
X-Received: by 2002:a50:d945:: with SMTP id u5mr235037edj.136.1632753418157;
 Mon, 27 Sep 2021 07:36:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p21sm8857473ejm.88.2021.09.27.07.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:36:57 -0700 (PDT)
Message-ID: <2d46ff0f-2744-40db-f15e-3a88232ceb32@mind.be>
Date: Mon, 27 Sep 2021 16:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20210927063809.505480-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927063809.505480-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 0.53.0
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



On 27/09/2021 08:38, Asaf Kahlon wrote:
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  All 8 applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-dataproperty/python-dataproperty.hash | 6 +++---
>   package/python-dataproperty/python-dataproperty.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
> index 4ea9ddddbc..9a8c250125 100644
> --- a/package/python-dataproperty/python-dataproperty.hash
> +++ b/package/python-dataproperty/python-dataproperty.hash
> @@ -1,5 +1,5 @@
> -# md5, sha256 from https://pypi.org/pypi/dataproperty/json
> -md5  edd3352ecd0ec124e8227a5c4db61b98  DataProperty-0.50.1.tar.gz
> -sha256  cad9080e5d1bac85a3bd33a016743537370d524ae683b012345ed9b5b7715f6b  DataProperty-0.50.1.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/DataProperty/json
> +md5  6a6930ae266399df58707a13a5f0cfa6  DataProperty-0.53.0.tar.gz
> +sha256  9589b5c5b400a77e1aeb63d89d755043bbe00043219336963c93db5df49cbaf7  DataProperty-0.53.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
> diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
> index b89ff83f1c..5ceb7f72f5 100644
> --- a/package/python-dataproperty/python-dataproperty.mk
> +++ b/package/python-dataproperty/python-dataproperty.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_DATAPROPERTY_VERSION = 0.50.1
> +PYTHON_DATAPROPERTY_VERSION = 0.53.0
>   PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
> -PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/8f/8c/e9f2a862ff561ef32d64cc45d296e7c25479941c90d81a238a3233019a05
> +PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/df/d0/36deb707996c5ef48ab353804291f44f59bd9d46875c384d163ad106df1a
>   PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
>   PYTHON_DATAPROPERTY_LICENSE = MIT
>   PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
