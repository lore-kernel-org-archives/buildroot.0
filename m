Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820BFC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 08:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78CB140BA4;
	Mon,  4 Mar 2024 08:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0FqP-m0AcaEw; Mon,  4 Mar 2024 08:51:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82EFD40BA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82EFD40BA1;
	Mon,  4 Mar 2024 08:51:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1B6C1BF580
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC4FD605DE
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 08:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2RcM7r-ZnxU for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 08:51:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A0DB605DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A0DB605DB
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A0DB605DB
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 08:51:25 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a44628725e3so511825166b.0
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 00:51:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709542283; x=1710147083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SglSoZKIPmSm5c+Br/la+m+29XzH0ntHyFJS4vPwCaY=;
 b=CipuSUM9xXuG7C241NzXQ/6XlGMbB7SJjd1CMSE38KERL1bOrZ1wbruUNgMXO0Nun4
 +0MgO6d97QQzyNvjl2/ucS6fnO52ulSfdZbFx2ptw0OdbmiRIjNtUubbkmg0MZO65r84
 ZvEMu2bC6FpL43P9Ih5d2G+iTK7E9Wo6dTX3WxYtvcv3SoyEl1s4B2lUxP+1dqICUjF0
 HkxjHj/dY6nXhUll932HFRdc5MgXl2PfZUZZegw+b3T+k/YycfIRUABKctN0BF4VrZG/
 panq2vXx3sK0kZ+CJ22eRdDOzTOM6pWd12THW17dAV81dT0l7HdIvY2RyC/0cd6g+hSP
 e5sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+FMHlLNXNjZMfag7WDttezNryOJzRxHXLKQfiEkNaMBE1OG2yax/Gg95FpwuB8wW1tWEjViU0NhWPWY3R7JyczQgJDjThgw==
X-Gm-Message-State: AOJu0YyCHmp8o2VCWn3LUnI26LwWbsEi35i99SBBWm3rglSIMvqrujQ2
 VLxva96mNxO7D4GSQGeMOFCvtSOyw3A7ymq5Y2/LcQzHONLQTfzrWSSOadCPoKM=
X-Google-Smtp-Source: AGHT+IEv0ueMScKYcM5Lzqexez209pHoSzZTAr8fSxT2GH7qkwMuuChHGDIIQg1BEsOXOdzgV8Dlgw==
X-Received: by 2002:a17:906:d9d9:b0:a44:eab2:a57 with SMTP id
 qk25-20020a170906d9d900b00a44eab20a57mr3386310ejb.45.1709542283672; 
 Mon, 04 Mar 2024 00:51:23 -0800 (PST)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 mb17-20020a170906eb1100b00a4490267ecfsm3393779ejb.221.2024.03.04.00.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:51:23 -0800 (PST)
Message-ID: <0efcf707-9e29-4442-84d6-250b30262fcb@mind.be>
Date: Sun, 3 Mar 2024 21:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20240212095804.12454-1-buildroot@bubu1.eu>
In-Reply-To: <20240212095804.12454-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709542283; x=1710147083; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SglSoZKIPmSm5c+Br/la+m+29XzH0ntHyFJS4vPwCaY=;
 b=eVinkiM7QZ9DCXSWeSgWyhPqMkARZE8BICDcMydXfE3ZKqWScgJWwoi84MkeUpfFb/
 /S0kLLVyMBYhgwQ8p2Pt/9NmqrGdXy+3Am/kdbJ78eJd7gGOl7AV7yerMvytzhDQyRt4
 mN7XrsYgn3SqJAVj6n0+sJYmjfYGVHChrVrp4n7lUYgFnqTJ4w7TmN2jEhzx7CrO2iVC
 UoD6k5kCRQEXhQA+P41NQrh6qbw6TmF5jzMEE1Bia5uP2Lyu64DjfETvFle+3WKGHyIp
 Tub/jEm75RhRHnOIjGdus/QiEVGFhKNllzScPYD1/+9SCdLzp7lXdDr9kk+cCjPvM46H
 0evg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eVinkiM7
Subject: Re: [Buildroot] [PATCH] package/uvicorn: bump to 0.27.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/02/2024 10:58, Marcus Hoffmann via buildroot wrote:
> Changelog:
> https://github.com/encode/uvicorn/blob/master/CHANGELOG.md#0271---2024-02-10

  Your SoB is missing. Since you provided an SoB on the previous bump, I took 
the liberty of adding it and applied to next, thanks.

  I also changed the subject to python-uvicorn.

  Regards,
  Arnout

> ---
>   package/python-uvicorn/python-uvicorn.hash | 4 ++--
>   package/python-uvicorn/python-uvicorn.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
> index c7feaf3bfe..773995ab9d 100644
> --- a/package/python-uvicorn/python-uvicorn.hash
> +++ b/package/python-uvicorn/python-uvicorn.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/uvicorn/json
> -md5  a98f96c2578d9e6d454e271d0eae3ba3  uvicorn-0.27.0.post1.tar.gz
> -sha256  54898fcd80c13ff1cd28bf77b04ec9dbd8ff60c5259b499b4b12bb0917f22907  uvicorn-0.27.0.post1.tar.gz
> +md5  98f40515e34fb49e9d2842b6a147acec  uvicorn-0.27.1.tar.gz
> +sha256  3d9a267296243532db80c83a959a3400502165ade2c1338dea4e67915fd4745a  uvicorn-0.27.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
> diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
> index 502cc06ad8..899b9660f6 100644
> --- a/package/python-uvicorn/python-uvicorn.mk
> +++ b/package/python-uvicorn/python-uvicorn.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_UVICORN_VERSION = 0.27.0.post1
> +PYTHON_UVICORN_VERSION = 0.27.1
>   PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
> -PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/38/56/7bc5cf1d693d0c8e5d9dd66c29808691c17260b31346e4ddfbee26ba9bc2
> +PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/09/d8/8aa69c76585035ca81851d99c3b00fd6be050aefd478a5376ff9fc5feb69
>   PYTHON_UVICORN_SETUP_TYPE = pep517
>   PYTHON_UVICORN_LICENSE = BSD-3-Clause
>   PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
