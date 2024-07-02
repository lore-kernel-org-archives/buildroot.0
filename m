Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC014C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B40E88100F;
	Tue,  2 Jul 2024 07:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xb9qSu4xZnpS; Tue,  2 Jul 2024 07:03:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C77D80F1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C77D80F1D;
	Tue,  2 Jul 2024 07:03:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B08D81BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EFE8607D2
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJt6glGvJKQY for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:03:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9777C60789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9777C60789
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9777C60789
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:03:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42574064b16so23523935e9.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903835; x=1720508635;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NNFzbZ2sB1zIIzzsymzxoX5MxRbYnsJnBYN3bLkYTj8=;
 b=aK/kxIA8qyppLSyzk0Vf0FLFwvOBSwGyu6Xtt4zNx/G7WXl/c6x+aUSN3OkZtj6FNc
 2epGdOfFiJrL30NcvCFs2SAJpO2sjb5u6rfM+7qB0yDST1Mk7uSLZQMyLhCmb4H3Kflj
 buuKd7cCtlK/5lwHSnOC12vKnQl1PmKr8o3CnlBEvXFeV+9Q/25FhXW2d8qFCsJzOwQr
 dEqWltjcaE1aZwXm7lkcDS9dvVif54r4PK2D3tH9ioW7AXO1TjdSbXOckk13y+RLGPWj
 C79pTDlioJ1vhPPi+egt/sypu02Tix5gnAP/hC/vcDf+eIEEvQbFR3ycfF0ZYrW9dES5
 ne3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKjRgW+0+tFZYiYXggASlZfDkRNZVWhVE+Kq9bZwsdDBVqLdMSoACFAZhjS8AP1hdbDoz3jP++GS/N1RLvWhracfXuakgnow==
X-Gm-Message-State: AOJu0YzlmzCCO8VyaxOyVvLhhn/5tiHK67hsvIxB9h0ghYkJ5hmOjqbS
 8keGlHv6RIzAww4cJkW4bSQPorljzCHlCljt6DU/etk3a0F4+fZh+n23jyRloiI0HxJy3MQWzDm
 p
X-Google-Smtp-Source: AGHT+IGQpP4SWlXEVLPrbZclhrEb74lYU5WuxuNQ4ktCX+8M11D4gHcXrFZmfJy9IVMkbYQnQsd5mQ==
X-Received: by 2002:a05:600c:4fc5:b0:425:672a:766e with SMTP id
 5b1f17b1804b1-42579ff2758mr63839275e9.0.1719903834729; 
 Tue, 02 Jul 2024 00:03:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b8e2sm183990325e9.16.2024.07.02.00.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:03:54 -0700 (PDT)
Message-ID: <827d8fab-a68f-430d-be69-5a17baad2466@mind.be>
Date: Tue, 2 Jul 2024 09:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701172340.1715937-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701172340.1715937-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903835; x=1720508635; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NNFzbZ2sB1zIIzzsymzxoX5MxRbYnsJnBYN3bLkYTj8=;
 b=XjPOKZULiCsBfXy9qAEGLD8gXkPar1N4xBpF9vXh+1y3rYcfYtqZBJ0890txT3zW1q
 3XkRtfToSLRfNmqIBml/l227sLwxBu/qJQmIllz7K570/3NAIFC/lWVP2rfR5NxShDQh
 7Ny1POOJKI9NVLlu2mcAI2ZvR1yoS2A0zV/y3Xk0l9Mm1dy3Vdy7NDljeVOV1iyVJ7lS
 fG1AstpIejY60h2AbfZZvps9WMrHxwPdc47i76tTlvIjPCVEDJU99r2O0RB6HipRG3tr
 lyI1T+8fdrKbcf+ZcWqERpk35/YlyVDu6yhstJpt/Rnaw4Zvh0lL6PDbWXARIEeMQPb1
 xncg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XjPOKZUL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.37
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 19:23, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-cython/python-cython.hash | 4 ++--
>   package/python-cython/python-cython.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
> index 08ad8f6d84..42c063014e 100644
> --- a/package/python-cython/python-cython.hash
> +++ b/package/python-cython/python-cython.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/cython/json
> -md5  a4d0f9fbc9c137f1a88937cd40e8c5ee  Cython-0.29.36.tar.gz
> -sha256  41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f  Cython-0.29.36.tar.gz
> +md5  d9a1e8416f2278857a189347858ed9d0  Cython-0.29.37.tar.gz
> +sha256  f813d4a6dd94adee5d4ff266191d1d95bf6d4164a4facc535422c021b2504cfb  Cython-0.29.37.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
>   sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
> diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
> index 47e105c065..024c8c1e50 100644
> --- a/package/python-cython/python-cython.mk
> +++ b/package/python-cython/python-cython.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_CYTHON_VERSION = 0.29.36
> +PYTHON_CYTHON_VERSION = 0.29.37
>   PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
> -PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/38/db/df0e99d6c5fe19ee5c981d22aad557be4bdeed3ecfae25d47b84b07f0f98
> +PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/2a/97/8cc3fe7c6de4796921236a64d00ca8a95565772e57f0d3caae68d880b592
>   PYTHON_CYTHON_SETUP_TYPE = setuptools
>   PYTHON_CYTHON_LICENSE = Apache-2.0
>   PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
