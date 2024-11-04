Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6298CD1BDF0
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1478840521;
	Mon,  4 Nov 2024 20:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0VSqzRUVxLp; Mon,  4 Nov 2024 20:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B96024052B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96024052B;
	Mon,  4 Nov 2024 20:38:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16289B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EED86078F
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiOL1Q4hjcEN for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0A4E60780
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A4E60780
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0A4E60780
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:38:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d495d217bso4181730f8f.0
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 12:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730752685; x=1731357485;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=37eSUkXRxoteTar4X9oNDDQfZqitk36Z/KwWHgNJ2Ic=;
 b=VsqTxaCgheAiKgIvWtixw2tNpA5M9nfy4b4dsWExMboPnNOLMfSDHnC95rHkvfsy4I
 Sq1nfKjWG25wHUUhZRyc/cO930cQc4mvIKORuLXZpy0v761fLCuEvLCR2iBemoBluFGJ
 a0gm4lGuwQcJqtUgDvUcVPxo6Yoggut9gBXN9CbfiNy/tK9ITyVI9iyg3+JvyeCH+h4p
 m8xK1wO4QPo/o+BX+gbMSzW0eTV2HioIA2GYVrAyryrsUzs6go08CznV6YQebi4ttF4i
 phgn8lrLskibdUTKMux8AS2/CKevwiBf2v6EHsG4R5RDjCuKx5TS0P69WAnZZcp6Tqkj
 YOZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVou9Z7Y0L4Qm/T+LhHr8yLYfFMv1qiU5pq9af/J/4/3OYdhDtbcYJ1cP7KCL4pI7jUWwCfNG/VFDs=@buildroot.org
X-Gm-Message-State: AOJu0YzMGyMJ/myw0wINUDkKvjP+pSZdDMWf7ffWCUwyPvuHqsakwMY7
 AX5mMBbmat8Y05ecA4O1t4JajOh8YUt/10L3fFZgMhgc/Nof3ZipSkEZDpgYXof00EmPqshABlf
 2
X-Google-Smtp-Source: AGHT+IFScSchRTwRqtLwkdg1XgpoqgAzkMn6wHCuxO0jX0R/mWhkslNZ32EmBcJ3DQhIcAKsqYm4zw==
X-Received: by 2002:a5d:5847:0:b0:37d:4619:f975 with SMTP id
 ffacd0b85a97d-381c7a5d351mr16145369f8f.19.1730752685321; 
 Mon, 04 Nov 2024 12:38:05 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e7365sm13950025f8f.54.2024.11.04.12.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 12:38:04 -0800 (PST)
Message-ID: <f1249232-8c04-48b4-99e0-394ba020f1d9@mind.be>
Date: Mon, 4 Nov 2024 21:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>, Asaf Kahlon <asafka7@gmail.com>
References: <20241101150441.3761397-1-buildroot@bubu1.eu>
Content-Language: en-GB
In-Reply-To: <20241101150441.3761397-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1730752685; x=1731357485; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=37eSUkXRxoteTar4X9oNDDQfZqitk36Z/KwWHgNJ2Ic=;
 b=bMNbfPT6sEuTlaM/xXbeC52fDtucYy+6UX4QWcHKYQSYhBV2Z/2EKsKKHZb6GfQt8c
 OtTqbSmWM0z9K9udx3q62+hSmMgx66OoVN8bb/agBmSsA7N2Wbi/blQvckAduqHDDpkC
 neKDSYgElerkI/EBIZ4btLajnwNZ/YY9nzBqF5rxmCaWgXcnk9SVbDUXLwIJqGrIUDH4
 T24wodoErd+BsuoXpjDmhaycMb7cBWIR+eh6xmLag+Kq86zrPL/Fqzp/7pRdx+q+uJQl
 HZzbLgmhfCP1SahInnjXme1HLwngTP3VeuIxV70JZ4VUDLihFcoCQNeCekX6528hWqTU
 kdjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bMNbfPT6
Subject: Re: [Buildroot] [PATCH v2] package/python-flit-core: bump to 3.10.0
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



On 01/11/2024 16:04, Marcus Hoffmann via buildroot wrote:
> From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> 
> Changelog: https://flit.pypa.io/en/stable/history.html#version-3-10
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-flit-core/python-flit-core.hash | 4 ++--
>   package/python-flit-core/python-flit-core.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
> index 4d4907f5dc..2cc8032194 100644
> --- a/package/python-flit-core/python-flit-core.hash
> +++ b/package/python-flit-core/python-flit-core.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/flit_core/json
> -md5  3bc52f1952b9a78361114147da63c35b  flit_core-3.9.0.tar.gz
> -sha256  72ad266176c4a3fcfab5f2930d76896059851240570ce9a98733b658cb786eba  flit_core-3.9.0.tar.gz
> +md5  38fd365dc980d99107dfccadc96d0c4f  flit_core-3.10.0.tar.gz
> +sha256  6d904233178b3c924f665947ac7d286f2ac799fb69087e39e56ceb4084724a97  flit_core-3.10.0.tar.gz
>   # Locally computed
>   sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
> diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
> index 34e58d03ca..855bb99a93 100644
> --- a/package/python-flit-core/python-flit-core.mk
> +++ b/package/python-flit-core/python-flit-core.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FLIT_CORE_VERSION = 3.9.0
> +PYTHON_FLIT_CORE_VERSION = 3.10.0
>   PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
> -PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/c4/e6/c1ac50fe3eebb38a155155711e6e864e254ce4b6e17fe2429b4c4d5b9e80
> +PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/52/92/89cceb9c49f3e6c72091304636c5ebc2fc48c546742bbf8a6a474e48e666
>   PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
>   PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
>   PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
