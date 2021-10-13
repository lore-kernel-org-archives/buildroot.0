Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FBFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:58:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 239CC611CA
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 239CC611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22F360B04;
	Wed, 13 Oct 2021 19:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nq3FEszAuEWf; Wed, 13 Oct 2021 19:58:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CAD760AE1;
	Wed, 13 Oct 2021 19:58:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DCC51BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A7F7401DA
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSucUy-kwQHc for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:58:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72475401C9
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:58:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id p13so15218280edw.0
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bHpXvWzLCHcF5STKlANEznuxK/8z333p0GE51Xzxq+c=;
 b=QBXEaPI8rMZKd1PQhFi7etiCP239panfiqwbA5PG2GBKi9f3z2yVICL00mBpUSAarg
 +r/s+h/cfNlEdO/dVO/mikjv86thmz79HYzcKRCxHabsQSHyh2+GOLbOz3NnY6iAJZIc
 qclhJ+ZBFepTuBmIg+nnM7R4UrDcw5cj8fMipj+02RmS9TtKoA3PGWcu3cPzqAvU+ur8
 979/Sp4UHJ7sX7d8KcUcp3qdkskN2IYXSUuTWc+JMnr/Y80ahHW58j/NNI+zw3RLMHdJ
 L2dbgl0ykzsIe4PMCFifeVnTX/cZ08LczsHimiCd9PKv4UB/z7T0XfHMJ547WCNWrQSz
 F20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bHpXvWzLCHcF5STKlANEznuxK/8z333p0GE51Xzxq+c=;
 b=k2B1VURwdsO7RFlOVQXl/DgdHSssNXeyyOpIub7k5dWjqFc0jd1YaRSycNx6FLiYsJ
 33KRmzJe2IuatcuqD0RdDetuth7v8q+GgJpozCdrEX4vpIUMo0MVG4HvAdShd7mLtKRf
 bEEv9aV23xYLkRpIs29v0DXEE6mZMcIUPVsavBJvlsMUz11ReDV32ncaraK/l6Ke0NgU
 9UF5BYZxSSoWn9KXlBeeVtOBAYwXZc2aPGVa9+H082KZKcrQ0g4swkOZbpLY3TAFe/xJ
 X6g1Hm2N2QhXThFNG9nP8H2lugQCr5eSUaoaPgKpxDY8ht3vjlwcoHfjjxQpTzaPWqG2
 ytpQ==
X-Gm-Message-State: AOAM5324cdMJPQDagvHmI8AUBfzRL9FTBtESbW7dIv5oQx8IWSW6Sb71
 ioRJslP1kugxmBf+1sba76MV2Gww6KJ/Aw16
X-Google-Smtp-Source: ABdhPJxTPlLYshypV9mFAexPFc6hLc2zE7cAh2ZjjikM8t7gKI/dCqpVyovWSEdty2a5CseRE/IjpA==
X-Received: by 2002:a05:6402:50d4:: with SMTP id
 h20mr2101531edb.112.1634155112547; 
 Wed, 13 Oct 2021 12:58:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b2sm340885ejj.124.2021.10.13.12.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:58:32 -0700 (PDT)
Message-ID: <6accf9fc-0058-0ee1-70d9-4423a4dd5586@mind.be>
Date: Wed, 13 Oct 2021 21:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211007181148.3238157-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007181148.3238157-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-u-msgpack: bump to
 version 2.7.1
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



On 07/10/2021 20:11, James Hilliard wrote:
> License hash change due to date update:
> https://github.com/vsergeev/u-msgpack-python/commit/8599cae6bc970effe069e3ed955af1c64dab9106
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-u-msgpack/python-u-msgpack.hash | 8 ++++----
>   package/python-u-msgpack/python-u-msgpack.mk   | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-u-msgpack/python-u-msgpack.hash b/package/python-u-msgpack/python-u-msgpack.hash
> index 70c67c7283..0891783985 100644
> --- a/package/python-u-msgpack/python-u-msgpack.hash
> +++ b/package/python-u-msgpack/python-u-msgpack.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/u-msgpack-python/json
> -md5	bbeedd924f3d8c8ee90611914b3594e6  u-msgpack-python-2.5.2.tar.gz
> -sha256	09c85a8af77376034396681e76bf30c249a4fd8e5ebb239f8a468d3655f210d0  u-msgpack-python-2.5.2.tar.gz
> -# Locally computed sha256
> -sha256	0603a3e697a80b13640e3023bb534727f683ada5c4b0b0149d001ec5272d64f4  LICENSE
> +md5  8691cea6bc7b44bce6e2115260a54323  u-msgpack-python-2.7.1.tar.gz
> +sha256  b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551  u-msgpack-python-2.7.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  268ae7b7efbf67cd7bc0a9efea844fcf448d03f9cc6b8c79e8fe311815985030  LICENSE
> diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
> index 6d98e55221..e0a3b3f297 100644
> --- a/package/python-u-msgpack/python-u-msgpack.mk
> +++ b/package/python-u-msgpack/python-u-msgpack.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_U_MSGPACK_VERSION = 2.5.2
> +PYTHON_U_MSGPACK_VERSION = 2.7.1
>   PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
> -PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/75/c4/d9404382d0f7d9be27b5d13498d033a4faa83f325b3893e1c29a0faa83b9
> +PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/62/94/a4f485b628310534d377b3e7cb6f85b8066dc823dbff0e4421fb4227fb7e
>   PYTHON_U_MSGPACK_SETUP_TYPE = setuptools
>   PYTHON_U_MSGPACK_LICENSE = MIT
>   PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
