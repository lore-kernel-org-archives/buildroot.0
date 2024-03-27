Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D3FC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 734A4811AA;
	Wed, 27 Mar 2024 22:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwiSR4ZmIlxL; Wed, 27 Mar 2024 22:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7094C820A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7094C820A1;
	Wed, 27 Mar 2024 22:00:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18CA21BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05D18415B1
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNNqnNSbfpwP for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 272E540199
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 272E540199
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 272E540199
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:00:21 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4153939db9fso2062665e9.0
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711576820; x=1712181620;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1EzVdLyU5jzziErKUA9jyGfv+A7dCT5hd1pq4FBfD2c=;
 b=vzWS8OfOVdSOjdpHoiPaBaBxu15gxnbTXPhAxI2+hO19TbYbwnHzbV1clLh7o4aiY7
 bcXpIiu4o8zqBKYYb9lkQdpBmiGX61MPXL+FJMQRkJapKvnEocq/QFpiSf+9TD4F2gRa
 yS7Gmj8kjtJdGvnTUKua+InN8IEfTlS38jo3+Y5fCAJRK3SD46tZXO3O22ZgJMGi3wJu
 jzyg/c3F7ZhYLCxQIkupjzYdc2UHEWHZPTJ3xKDwjs+2j9FDYnPrYsRdR/aFqW7wGrU8
 1nia2M99umV2MLxlwj9BRPFgpoUmqSo0G0QWMc0BNBauASYF8O9Y8DdgTYLrG9alpIg0
 XxGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUaa0XaKzHAaN789hvuapGyqBa7rbpQylP4V9ezF1hn3X95qSPaF2hpIfBzgJqrwwZA41oC95Ca3Sq6klrc+Mjuhuxs4w7EA==
X-Gm-Message-State: AOJu0YyOoNzYKalpFzCAnfQfsPklq5/mnFaBbcfOR+i85pZ6zxnF9IQ3
 Qew9WW4U3bx7jnbci1mejcr8ck2/RxHxBapeZXiDFetKR+jDsEuDrrnE0/3fDxhmhkcrKoRt2k0
 K
X-Google-Smtp-Source: AGHT+IFEcVknUyHQZjbe1t/s0Q5n2OI/Ze5Bju22QA8QzcAqKavolYlZExYQWxRjG17R1aLP/TXYNw==
X-Received: by 2002:a05:600c:19c6:b0:414:854a:8167 with SMTP id
 u6-20020a05600c19c600b00414854a8167mr1304236wmq.18.1711576820088; 
 Wed, 27 Mar 2024 15:00:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a05600c4e0f00b0041494665db1sm3182440wmq.15.2024.03.27.15.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 15:00:19 -0700 (PDT)
Message-ID: <654a4d07-ec34-442d-8c59-fac07411a328@mind.be>
Date: Wed, 27 Mar 2024 23:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-5-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240213211512.3918044-5-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711576820; x=1712181620; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1EzVdLyU5jzziErKUA9jyGfv+A7dCT5hd1pq4FBfD2c=;
 b=aJUGQMWyhobv7GJ/wSsGcdFcZpd5cmv7A/tLwiUBe+6qQgvbB7vXPgSEkf9vdVYKli
 UTijS9/qvVmCp0/Q14966oxtyxipkv6O7P1xby1MfFtbCjyJ3V0dr7ImG5WMSU6AoNDA
 pHoxSxKM8EHjEeJfebaISnNpLuX2F5QrEOAvM+T8NRaQkO6mBJdBqGqtcMcIo7pPCdNE
 8o0fB05t+cnlVV5jeROKgUeNPVlyWykOHaW5CIYHOxiZtTdEYE77Vt9smy0mcaAN0X0X
 ha+5zbY5pQnIeff9w3Jg3RnkHtt/IEJm590BrDAFsqE4VrAgeMlyooCwUsk1wPFYb9mI
 Y+hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aJUGQMWy
Subject: Re: [Buildroot] [PATCH v8 05/26] package/python-pyyaml: add cython
 for host-python-pyyaml
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
> When migrating to setuptools with pep517 support we need to add
> host-python-cython which is a pep517 build dependency for pyyaml.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-pyyaml/python-pyyaml.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
> index 846c57df4f..4ab91ca5f6 100644
> --- a/package/python-pyyaml/python-pyyaml.mk
> +++ b/package/python-pyyaml/python-pyyaml.mk
> @@ -14,7 +14,8 @@ PYTHON_PYYAML_CPE_ID_VENDOR = pyyaml
>   PYTHON_PYYAML_CPE_ID_PRODUCT = pyyaml
>   PYTHON_PYYAML_DEPENDENCIES = host-python-cython libyaml
>   PYTHON_PYYAML_ENV = PYYAML_FORCE_CYTHON=1
> -HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
> +HOST_PYTHON_PYYAML_DEPENDENCIES = host-python-cython host-libyaml

  Again, I ordered the dependencies alphabetically.

  Applied to master, thanks.

  Regards,
  Arnout

> +HOST_PYTHON_PYYAML_ENV = PYYAML_FORCE_CYTHON=1
>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
