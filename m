Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2493C54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 21:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A9DC80E83;
	Wed, 27 Mar 2024 21:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-BGkizNAKF4; Wed, 27 Mar 2024 21:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB0880DCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB0880DCB;
	Wed, 27 Mar 2024 21:58:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AE261BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 153C580E70
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gr4XpivCClhP for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 21:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80E6F80DCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E6F80DCB
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80E6F80DCB
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 21:58:39 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-341cf28e013so132682f8f.3
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 14:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711576717; x=1712181517;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3eZYw9Dm7zXTnN35pH96RLVjper6J+co4Szn33V+17g=;
 b=RoseBlw+wCKmYQMIw1PTs5XsSAx7iKNDs8rCoac0Yvm/wKeSYIWXHH0jRvXto7bJul
 lesvknY2MybnD43zyil00L3zIazY+rq3Rt+UK/n9yfrzyVlWSBIDlPnUNHAWCmCMZtvs
 a9weYqdUUcfYDxx96GyNNB/ueVyRUl/5f61JBwdn9PufRek0FoiJC02Gty9YO5xwENEV
 h5k1DetSyJ1hHzMOlA/z8ttFDl7XxK0bVxFoKCFxWaIwpPXbvsmsu76+d25yEQ+HA+ML
 ZyAGj9Bcuvoe4SpcyhPkNoaSKlWHqWIAiqNMUIp/VDjXlNULrcHdvQrYWGRTe2epRahk
 +0Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiI/EoZ9FXmNmzlQVgij8ZcUQVNKlb9DOlEmjiFgbEtlgfh+YzlU8l8qfaYN6mLL1H14f7Am4LhfTtWkjMo2uMk7TLoQR8eA==
X-Gm-Message-State: AOJu0Yzqfku3vztPUAj4IzyyFSh7ulrxofGfaiAPp7mjMwpj/8fs6KeA
 Ii0Kp5mrQND65iqOyWfQp8n8PY2bkaOS8KhPKRslIYYiCM9skwCOkhnDdRSqLvY=
X-Google-Smtp-Source: AGHT+IFVfEk8nVGN6ff7dBNhXtzxnkAXAQj3qk+geHKtiNBvwVvb4fqHIzYV8/0C5EsADxad+zQlrg==
X-Received: by 2002:adf:e501:0:b0:33e:b7f8:7c66 with SMTP id
 j1-20020adfe501000000b0033eb7f87c66mr998694wrm.41.1711576717528; 
 Wed, 27 Mar 2024 14:58:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 di6-20020a0560000ac600b00341c9956dc9sm71341wrb.68.2024.03.27.14.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 14:58:37 -0700 (PDT)
Message-ID: <c7724c6a-6e1a-4ff2-962e-7a03b0ab1eb6@mind.be>
Date: Wed, 27 Mar 2024 22:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711576717; x=1712181517; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3eZYw9Dm7zXTnN35pH96RLVjper6J+co4Szn33V+17g=;
 b=JqD3enl5ukxDcgMZhF2OzF4JB4WkKanW4TPNnF9PcUt5XLZfk+yq+Z5KzmT0uIGcka
 fFyBPmqNwIKf8bzk8z9WLCh+1hi8fSkjwnTatWNjQnmTTEPSzMyDc/t8BjMxqE0YzU76
 GO0laOAgkaO7I0q1r6QjOLUOVLWbNO0ZB5XsJVsD5eMI99199022P37EihBH18LP2/8n
 kcNH30J/zTs5+318/Db2SKFt4oYkkjowwgvaYGKr3jd6lStWiP0ZvqCxFQDRJ/cBXp5R
 /Yc0SCNwDH6vXxwHslOeZXMoQPzUT0RHUgRn1V4tJk2o29bsNHV97s28f2B0kVjkNfic
 PB/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JqD3enl5
Subject: Re: [Buildroot] [PATCH v8 01/26] package/python-poetry-core: new
 host package
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2024 22:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - update to 1.7.0
>    - drop patch which is now upstream
> ---
>   package/python-poetry-core/python-poetry-core.hash |  5 +++++
>   package/python-poetry-core/python-poetry-core.mk   | 14 ++++++++++++++
>   2 files changed, 19 insertions(+)
>   create mode 100644 package/python-poetry-core/python-poetry-core.hash
>   create mode 100644 package/python-poetry-core/python-poetry-core.mk
> 
> diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
> new file mode 100644
> index 0000000000..c6b180c852
> --- /dev/null
> +++ b/package/python-poetry-core/python-poetry-core.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/poetry-core/json
> +md5  7461547cac0e0e9c8cd7463aa87e7470  poetry_core-1.7.0.tar.gz
> +sha256  8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74  poetry_core-1.7.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
> diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
> new file mode 100644
> index 0000000000..4ca587b11d
> --- /dev/null
> +++ b/package/python-poetry-core/python-poetry-core.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-poetry-core
> +#
> +################################################################################
> +
> +PYTHON_POETRY_CORE_VERSION = 1.7.0
> +PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
> +PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/cb/1c/af7f886e723b2dfbaea9b8a739153f227b386dd856cf956f9fd0ed0a502b
> +PYTHON_POETRY_CORE_SETUP_TYPE = pep517
> +PYTHON_POETRY_CORE_LICENSE = MIT
> +PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
> +
> +$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
