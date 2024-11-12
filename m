Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1605D41D51
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 19:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0FE60631;
	Tue, 12 Nov 2024 19:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjO5ith81Ceg; Tue, 12 Nov 2024 19:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF36607A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF36607A1;
	Tue, 12 Nov 2024 19:55:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0078D725
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2FF680E31
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 19:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTYV4468JxXm for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 19:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03AFB80E1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03AFB80E1D
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03AFB80E1D
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 19:55:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso52319545e9.0
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 11:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731441333; x=1732046133;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kEI2VG9QFy0WMnBO/6Y5tHSyPqkfN0mfXDlJm2DVKh8=;
 b=l9ZdhI+7Fg8Aqs5qHGEYTOmFeQH5Fgt58tlAfqJ+qedqT+NGI4EcAOsXSoNeJXiKqz
 ypNpwZSRxU3eFN8YRFK46zrXH/3fhiZ/YGRgFBPjKAlGKnZm2QZwTjpq12pe/v/ghjvJ
 JtPByc5GfkrYZ1xM2Au/G3os+PcVGKEzst2mXb3I/NzkRO5WLiDf04V8WENX0W2t5C7x
 ntR5iVS9T3PrvHRmqNvh6SSGgzKUr0gHqsT/phHEbs1MGQN445xzHlhg2WorMEZ6tT0l
 hNLZxEHsR74TUnNyzbUbPYKGyWIs5b4dsRXgmVFxoXEEdxx93myz8TSubUMyDZGZ0Qi2
 cP/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAfQ6QJZHVXSGT1CVtBBYaDO1x/kxY25qHj5CG2aJThFgIxKGnMrJI0ahYXuPUj5/KLC9rezOwYu8=@buildroot.org
X-Gm-Message-State: AOJu0YwEFo4gsW0uxwPbLF0aHnt7HoIXcDsRlRzJb+s4ACh7mborQDGD
 1MtZI8uNuVet1M8porLVwn0jOfDut3VPWitZijZXOy8r6GdRMIZ+75DUUKga16I=
X-Google-Smtp-Source: AGHT+IHnBa0mAmR+RbNPLavhcsbx+01rWDt08I87Rn3OimL517PuZqoSnkVttekH2om98yMp5FyECA==
X-Received: by 2002:a05:600c:4508:b0:431:50cb:2398 with SMTP id
 5b1f17b1804b1-432b74fecacmr148219235e9.2.1731441332482; 
 Tue, 12 Nov 2024 11:55:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa74abb9sm263698045e9.42.2024.11.12.11.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 11:55:32 -0800 (PST)
Message-ID: <22dd2ad9-47c9-4672-a88c-d44773693012@mind.be>
Date: Tue, 12 Nov 2024 20:55:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
References: <20241031224026.359215-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241031224026.359215-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1731441333; x=1732046133; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kEI2VG9QFy0WMnBO/6Y5tHSyPqkfN0mfXDlJm2DVKh8=;
 b=TthB1ZjMDIFF3UARyQHQxioC3/aGBmDR1M39ZcuhMKyUsxz15l3jKVUj5GijMHRKJd
 2t9HkJijaKWYu72+z/4Lph8Q/PSRCVzKv/sw9c3Bad1BZ8khLB4FQQ1SUnphdMs8vCXq
 YdNJ3jnbSZewyArHWghur0p5ngKM6eFq+pObESPbSrNmONXFgcTbs9TM9qj+LFBtzTFL
 Q6UsqpkeANNLbIXthVeAJTiWgbt8FN4AuARtTRqZnxlG4RH1atO4X9sjnqmF7kIRcq95
 a6LxhKTJuBpHiAJfblvR+95GzTDyoO9nbbF34XYg2G79wdPt7NXtnyVrT57ON3u90ggB
 IkiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TthB1ZjM
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: set new build
 options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/10/2024 23:40, James Hilliard wrote:
> Explicitly set new imagequant raqm and zlib build options.
> 

  I added a Fixes tag for this one as well.

  Applied to master, thanks.

  Regards,
  Arnout

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-pillow/python-pillow.mk | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index e87c817c68..4f4d2ec933 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -14,7 +14,10 @@ PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
>   PYTHON_PILLOW_SETUP_TYPE = setuptools
>   
>   PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
> -PYTHON_PILLOW_BUILD_OPTS = -Cplatform-guessing=disable
> +PYTHON_PILLOW_BUILD_OPTS = \
> +	-Cplatform-guessing=disable \
> +	-Cimagequant=disable \
> +	-Craqm=disable
>   
>   ifeq ($(BR2_PACKAGE_FREETYPE),y)
>   PYTHON_PILLOW_DEPENDENCIES += freetype
> @@ -70,4 +73,11 @@ else
>   PYTHON_PILLOW_BUILD_OPTS += -Cwebp=disable -Cwebpmux=disable
>   endif
>   
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +PYTHON_PILLOW_DEPENDENCIES += zlib
> +PYTHON_PILLOW_BUILD_OPTS += -Czlib=enable
> +else
> +PYTHON_PILLOW_BUILD_OPTS += -Czlib=disable
> +endif
> +
>   $(eval $(python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
