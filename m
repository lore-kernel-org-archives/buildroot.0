Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8CCECE585
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 18:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AF0F80B5F;
	Mon,  9 Sep 2024 18:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KCx9546lduY; Mon,  9 Sep 2024 18:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A83A80B98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A83A80B98;
	Mon,  9 Sep 2024 18:56:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89CA41BF33E
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 18:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7722E40398
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 18:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPtFiJDX72fj for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 18:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D60BD4027F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D60BD4027F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D60BD4027F
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 18:56:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42ca4e0299eso23743685e9.2
 for <buildroot@buildroot.org>; Mon, 09 Sep 2024 11:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725908186; x=1726512986;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2VFECb+KlhF9zsIRUaaI75hAR6T9AMIcd081Rjdeelg=;
 b=oHg16cJ7AQUPPI8cCXpojH+RZ0bGeeDSVEsUhMvP/i2KwoUuKuhOIaitMyxru0Mr/T
 QGpCUlsF6lHdKWMbbnuWJhTFNJRSg5bevUpp4CwBCpDj/XINFF4/heeUhCN0lvTRfafk
 E9SX8ttSZ8ncH0FfjJnfnyJ+W5KyIkxhZTNNiIuXWdwBBJYhgwiPZLT70ssx4cQcCbCs
 au3Fjr4rDrLcLqU56wq3FwXyMyvL9gwhiV5tca1ZhN4bVAc77juVPUfXhAZli8YxktIf
 Lr0uWxew6qboY1wfEXlzXyOnFE2x89P9gUlZGkoEUAmqeq+jkHConNJErT0FBSeN+Q61
 OUOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk45YUAnLP62Yy47bAEc33OeZhoj39DWdhjFRVkChuXwpJIOJcBbJ91GsgjFL0pDLDP2Jo7B6efJs=@buildroot.org
X-Gm-Message-State: AOJu0YzPWBqd/fNeHE+RHFZSZjWxDJYZikHoZkYK3XwcUqndOENcXT4a
 +Jmch21MRWMmWY09386POY2wBirQnTe2/Dz6cD9mKqZJQjqtcHH8D3jlr+Ico8o=
X-Google-Smtp-Source: AGHT+IHZ/yUk3IZRU/Qk9wzI5vLPx9uXimtLN9dzUXT5dCDupjGsNSi3zNm7Bmxc5YTJ3MGUxY+bmQ==
X-Received: by 2002:a05:600c:1d90:b0:427:ff3b:7a20 with SMTP id
 5b1f17b1804b1-42cad87ef64mr55321625e9.27.1725908186343; 
 Mon, 09 Sep 2024 11:56:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb33489sm84267385e9.19.2024.09.09.11.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 11:56:25 -0700 (PDT)
Message-ID: <9394d69d-d1af-40d7-8623-6e038d1bc3bf@mind.be>
Date: Mon, 9 Sep 2024 20:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240906184756.1166732-1-james.hilliard1@gmail.com>
 <20240906184756.1166732-2-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240906184756.1166732-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1725908186; x=1726512986; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2VFECb+KlhF9zsIRUaaI75hAR6T9AMIcd081Rjdeelg=;
 b=MJ10qq/j0N3dMQ/sAULPsZJW1ew9ksmALwToX9BDCC0SQD6113dfZmSp7aMIOrPawZ
 p5qfWzdBBqIL+J+mwI82Zbuez3Wen+TBD3aqVeEWxm3A+8Sz2TP53NugVXmaXNnkWPnL
 DZY9Y9vJS0QQpSzj8l8FGl5JF192MZ5gZGoOpL6rE8DOBfTiPQ0MLQlaCjC+6NqHZs+V
 3U3szQ72eFlKVVWcDgGGCms63n1fuPS414zmZhKL82v+ev9m9911cc7uGRlfZ1EHFgdd
 am2hoWOB5TyfDvnrbZ4kfHyn7vs2jhStK6Fprl+q9AQsB7U17tITeLvH+Eh+5DwzhaWn
 e8gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MJ10qq/j
Subject: Re: [Buildroot] [PATCH 2/2] package/python-pydantic: bump to
 version 2.9.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/09/2024 20:47, James Hilliard wrote:
> Add new python-tzdata runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-pydantic/Config.in            | 1 +
>   package/python-pydantic/python-pydantic.hash | 4 ++--
>   package/python-pydantic/python-pydantic.mk   | 4 ++--
>   3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
> index e9cd2e6780..029f86450e 100644
> --- a/package/python-pydantic/Config.in
> +++ b/package/python-pydantic/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC
>   	select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # runtime
>   	select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # runtime
>   	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
> +	select BR2_PACKAGE_PYTHON_TZDATA # runtime

  Applied to master after removing this line and adding an explanation in the 
commit message, thanks.

  Regards,
  Arnout

>   	help
>   	  Data validation and settings management using python 3.6
>   	  type hinting.
> diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
> index 6127dcaf37..fd8d16dbb1 100644
> --- a/package/python-pydantic/python-pydantic.hash
> +++ b/package/python-pydantic/python-pydantic.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pydantic/json
> -md5  940d760de174d3567d4f5be28fd215f5  pydantic-2.8.2.tar.gz
> -sha256  6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a  pydantic-2.8.2.tar.gz
> +md5  f328e2d6c3d511a81e358aac6a8636b6  pydantic-2.9.0.tar.gz
> +sha256  c7a8a9fdf7d100afa49647eae340e2d23efa382466a8d177efcd1381e9be5598  pydantic-2.9.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
> diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
> index c549970db9..828658af19 100644
> --- a/package/python-pydantic/python-pydantic.mk
> +++ b/package/python-pydantic/python-pydantic.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDANTIC_VERSION = 2.8.2
> +PYTHON_PYDANTIC_VERSION = 2.9.0
>   PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
> -PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/8c/99/d0a5dca411e0a017762258013ba9905cd6e7baa9a3fd1fe8b6529472902e
> +PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/f6/8f/3b9f7a38caa3fa0bcb3cea7ee9958e89a9a6efc0e6f51fd6096f24cac140
>   PYTHON_PYDANTIC_SETUP_TYPE = pep517
>   PYTHON_PYDANTIC_LICENSE = MIT
>   PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
