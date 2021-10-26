Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E49C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:37:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D2B060F39
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D2B060F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F8F8176C;
	Tue, 26 Oct 2021 19:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OJisMT4WCb9; Tue, 26 Oct 2021 19:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C8D81764;
	Tue, 26 Oct 2021 19:37:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DCDC1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C9F84050B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNd5RI5rx0VH for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:37:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D96D6404CA
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:37:43 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g8so990668edb.2
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vI7geMfYyva5BbPbUTyE0AabUVT8c3v3EtSHh2SCSS0=;
 b=XnpCnxaAKvCmktOlR4jg7Ps5wasa7PDU47bpwg+aTFqidPTqiQHP6WSE1n51UdVwdk
 0/PxqmxOJn78AaOAXpNn0FMjplcMU/rMBy+licxs4igi2cOdOe5EEJ1q7v5iUmMUOoai
 JVGy/rjzUV3d/iGGbPtuTwehfA0UsUiUwzAKwYs7WjEUGtrDfcNSQdIlIM5nsO3ydgdF
 /T2UaLFsf0RUEUoHqcZjeMgOwNAMVYr+gDBbO2xAiiWkHX9sX+0AuSXJryBVm4HrIEdY
 fQZJj9zjKH58VAcLSyqd7rGr8uPKQ+h0xzpb2JaI/KA4xKOcSOESWU85oRLiEAjbxcJ3
 PWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vI7geMfYyva5BbPbUTyE0AabUVT8c3v3EtSHh2SCSS0=;
 b=z324TVcsk5uUKypeqgqtoVEAvsdPjYFezQdDyo9LdzMMMxhJsMqx/1ZPvVzp9q/svn
 Ny/4UzdvdhYjo5FlzuTpf6JygexhNGIVHI3+QvkIH8EUsR8HxCF0Zb0kvaSdE/GUrPtj
 ouhkpQcdun/dZm5jfmmidck9ZZVraU2Qr3Wr8+cqQypmEpe76H7rOfphCKYb4wao1d2R
 zEph7NIVWDYBgbSUmj6h/F8HDKupTagaBsb7tXusb6MYd7KAql4EjISMLKm2dlF5IBbo
 +1x+J9/CwtVPuOOAJanB5wiE2/bsSu+8eUuTb/K21BsFUed9DlMR8TM5tLXkyKhyp9wK
 4L4w==
X-Gm-Message-State: AOAM530BlvjQeA2smRJxZp4MGGjwEmF4/pQ+ThBipSGBonqPwhdmNyIM
 z9OptT/BmMyWnP3fAyQaikkafsh6S6t0Wg==
X-Google-Smtp-Source: ABdhPJzfoSZWDpj4Y9U/6t1VsVrfzvqls1+BPlJP0jVZ/urgcR4K2PMy+Dud+2XZii8608sAOPwiHw==
X-Received: by 2002:a17:907:1dcf:: with SMTP id
 og15mr32469779ejc.553.1635277062177; 
 Tue, 26 Oct 2021 12:37:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gn2sm2573104ejc.88.2021.10.26.12.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:37:41 -0700 (PDT)
Message-ID: <b70495b4-e910-9da9-3530-0eaed98cdb99@mind.be>
Date: Tue, 26 Oct 2021 21:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211025021115.2149213-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025021115.2149213-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python{3}-pycryptodomex: bump
 to version 3.11.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/10/2021 04:11, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
>   package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
>   package/python3-pycryptodomex/python3-pycryptodomex.mk | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
> index 0dd2a7c08d..544468b37e 100644
> --- a/package/python-pycryptodomex/python-pycryptodomex.hash
> +++ b/package/python-pycryptodomex/python-pycryptodomex.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
> -md5  91b86ca7fa80d41179d7735067c7347a  pycryptodomex-3.10.1.tar.gz
> -sha256  541cd3e3e252fb19a7b48f420b798b53483302b7fe4d9954c947605d0a263d62  pycryptodomex-3.10.1.tar.gz
> +md5  3d007103f68f7e902167719655d2b57a  pycryptodomex-3.11.0.tar.gz
> +sha256  0398366656bb55ebdb1d1d493a7175fc48ade449283086db254ac44c7d318d6d  pycryptodomex-3.11.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  c273fb45d120362875aafdd6189f4d7c70f6c36d4cb7ce427e0dc704753639df  LICENSE.rst
>   sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
> diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
> index fc2dca4da9..f1fda7aea2 100644
> --- a/package/python-pycryptodomex/python-pycryptodomex.mk
> +++ b/package/python-pycryptodomex/python-pycryptodomex.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   # Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
> -PYTHON_PYCRYPTODOMEX_VERSION = 3.10.1
> +PYTHON_PYCRYPTODOMEX_VERSION = 3.11.0
>   PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
> -PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d
> +PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78
>   PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
>   PYTHON_PYCRYPTODOMEX_LICENSE = \
>   	BSD-2-Clause, \
> diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
> index 76ad74b43f..ee03a08ec6 100644
> --- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
> +++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   # Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
> -PYTHON3_PYCRYPTODOMEX_VERSION = 3.10.1
> +PYTHON3_PYCRYPTODOMEX_VERSION = 3.11.0
>   PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
> -PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/82/e2/a0f9f5452a59bafaa3420585f22b58a8566c4717a88c139af2276bb5695d
> +PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78
>   PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
>   PYTHON3_PYCRYPTODOMEX_LICENSE = \
>   	BSD-2-Clause, \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
