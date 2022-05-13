Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9872C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B8D783F84;
	Fri, 13 May 2022 21:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8OPkxyBx48N; Fri, 13 May 2022 21:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F1CA83F74;
	Fri, 13 May 2022 21:58:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E98C41BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D757E401C9
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDrSnEtTuF94 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:57:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAB424015A
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:57:58 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id dk23so18598917ejb.8
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=E0mfkF9I1VvHqsbS4T3Ren2+9xkfd9CW7+IAb3oePq8=;
 b=CEOlzJB0KooZW4Bq5VTWy3zxYTBXD8JylwvqlRlXjAUKTLtklXU8RZiMpIDDnQ6CZD
 3v6LR46a8EAmRKYWYHafC8gt2k7qDOsvbrHe7xCb7ugZTwUjVGTM5m7T8VJlwihrIsLR
 /xQ/CN9sLJbG/kupcSA8CeTc7UR2jqEc43tf32G/4vT8DFgfe4wMgUnkNO2n3b67aro3
 xmFDTDfch3TrvojVlHMKJQglBzqYscyAljIYajENbpu86+wDuwH3TdaHo3ppE5hchFq9
 hVUaAe9rWaA/2Jvk1z6G2V+TEVNXlbGfkHKHA8mvUM32t2ttIDEQrdj2b2rZPxgPifda
 kAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=E0mfkF9I1VvHqsbS4T3Ren2+9xkfd9CW7+IAb3oePq8=;
 b=l9KZ5RSe4yx5Tt8Si/ajL6C4AFF9TQ5lvFbQVLTi1yhZ2bDa1EAeTKw7EuIBxLKD3A
 tlPAPztMFOV91HBz1+VMAjaP/HgRBeBsv5p7i1k9FrXrVfjfCqBLE08ZniUQw8+NKMAc
 nfvU0xBZ7sIMvFlxw4utNuFrBcSApCceORoKv2eH9AuKE64YhcDpYO+5be8PK14/u2DQ
 NHFU/cpeBJXmHtP42Fw0Gi/SPU3NHxgvUo1lgkzjA6XIv5cHDoSoZph+TnElALAAHk1y
 ebYpU3gXb60TU6zeBM2EqHv9xS12aYLY15KDLat/fLr3lkKm2yUwVIf0PHJi3qq39bem
 CLSQ==
X-Gm-Message-State: AOAM532DDWttzR7U6VE7qddulpjL0iY36Z88/LqYXMkoAqRLG4WxTAKA
 ixAYVtVFLrBfwhoTGn8bEsubBA==
X-Google-Smtp-Source: ABdhPJx4ZebjAiV6qvX12m5DiYNtPQLd1cr7ebXC+W5G8VuOZGWTeCCTA2Hse72Ep393oUP2trcKIg==
X-Received: by 2002:a17:907:8c06:b0:6f4:9935:9049 with SMTP id
 ta6-20020a1709078c0600b006f499359049mr6122957ejc.517.1652479077146; 
 Fri, 13 May 2022 14:57:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a17090672d900b006f4cb79d9a8sm1162088ejl.75.2022.05.13.14.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:57:56 -0700 (PDT)
Message-ID: <41c76fb0-0368-7710-4388-b222c354268e@mind.be>
Date: Fri, 13 May 2022 23:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220509022147.1866712-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220509022147.1866712-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to
 version 22.0.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2022 04:21, James Hilliard wrote:
> Drop no longer used BR2_PACKAGE_PYTHON_SIX runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pyopenssl/Config.in             | 1 -
>   package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
>   package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pyopenssl/Config.in b/package/python-pyopenssl/Config.in
> index 1a6fbd2147..56f38f5888 100644
> --- a/package/python-pyopenssl/Config.in
> +++ b/package/python-pyopenssl/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_PYOPENSSL
>   	bool "python-pyopenssl"
>   	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
>   	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
> -	select BR2_PACKAGE_PYTHON_SIX # runtime
>   	help
>   	  Python wrapper module around the OpenSSL library.
>   
> diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
> index 5a3bc5dde9..0dc9f921fa 100644
> --- a/package/python-pyopenssl/python-pyopenssl.hash
> +++ b/package/python-pyopenssl/python-pyopenssl.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
> -md5  2ec707d15b4e92f5ca5e46e5aab2f4ca  pyOpenSSL-21.0.0.tar.gz
> -sha256  5e2d8c5e46d0d865ae933bef5230090bdaf5506281e9eec60fa250ee80600cb3  pyOpenSSL-21.0.0.tar.gz
> +md5  182c9f258c431c731906ab7fdaf6d0a8  pyOpenSSL-22.0.0.tar.gz
> +sha256  660b1b1425aac4a1bea1d94168a85d99f0b3144c869dd4390d27629d0087f1bf  pyOpenSSL-22.0.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
> index 2ba8c2e73d..21a3f06907 100644
> --- a/package/python-pyopenssl/python-pyopenssl.mk
> +++ b/package/python-pyopenssl/python-pyopenssl.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYOPENSSL_VERSION = 21.0.0
> +PYTHON_PYOPENSSL_VERSION = 22.0.0
>   PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
> -PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/54/9a/2a43c5dbf4507f86f7c43cba4195d5e25a81c988fd7b0ea779dfc9c6973f
> +PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/35/d3/d6a9610f19d943e198df502ae660c6b5acf84cc3bc421a2aa3c0fb6b21d1
>   PYTHON_PYOPENSSL_LICENSE = Apache-2.0
>   PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
>   PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
