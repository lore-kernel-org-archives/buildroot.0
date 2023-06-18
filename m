Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAD8EB64D8
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2596661247;
	Sun, 18 Jun 2023 13:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2596661247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qXwWTBX7-Nf; Sun, 18 Jun 2023 13:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D17061225;
	Sun, 18 Jun 2023 13:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D17061225
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90CD81BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A239403AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A239403AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tPE10OlSrjWR for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:15:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64F3E403AC
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64F3E403AC
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:15:24 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-982c996a193so350210866b.3
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687094122; x=1689686122;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=030v6SWPLBbjpSG8Z06KjAMkwraW0rz08Mr9dPmUpII=;
 b=VAquygfc9eskyiaSqvorMYAliMWSyUM6VVXFjlu4HB/6VFVzYl2tG3m0DnnKhS+65j
 Mz58jDXgSZ3brn5mZsshrkwCclWv6ZovEAS5vlA5csilAjbncF9/9on+gNGJpuDBRDQV
 2I3HEOFtQarGheENQzAFCL3euP8C3tWvPVfKdcOfIFyndoevDWunzOUzjfYHMnpKTxur
 7Ul6XjK0x67RtCnoWkK8yyFsNriyu/8mZ3ffI8TrsWE10yUmcD4bZcL0cyysKorGxbL4
 rpJsu6JXWwIV+ogNiRASYGE0GYla+8R6nPmpUAIAE++ux/0VR4zNGcIYFXMwYBEZnqLn
 Kgpg==
X-Gm-Message-State: AC+VfDwBeOJJz2jLj52A8FFNphpBhFqW5m/BrnfBuS7aSzzj8/5GBpWQ
 2N110xVR/Gs6eHshpupNLiWS7WGkHwJEepCvj/Y=
X-Google-Smtp-Source: ACHHUZ4V3P0Qxmhx1zSwqdymL4llsEYseGbiAWSKDhW+8Pgn2iL59+zqTSglDF5K3HCPtHHNAcN31g==
X-Received: by 2002:a17:907:2da6:b0:988:f93:32e8 with SMTP id
 gt38-20020a1709072da600b009880f9332e8mr3036967ejc.26.1687094122709; 
 Sun, 18 Jun 2023 06:15:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 op1-20020a170906bce100b009882e53a42csm1434296ejb.81.2023.06.18.06.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:15:22 -0700 (PDT)
Message-ID: <eccb6518-88fd-6b21-38de-acd023eeed58@mind.be>
Date: Sun, 18 Jun 2023 15:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605075449.1904937-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605075449.1904937-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687094122; x=1689686122;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=030v6SWPLBbjpSG8Z06KjAMkwraW0rz08Mr9dPmUpII=;
 b=I6vTxw4wvLSZpCkwCZzZ9r6LLNFujzIzVkQPuKsxffp1T8wb/1DOyyaUecXY2yyc+2
 bX/YqwAe4NSZkBsKOmluytb8sit1y13Vux1653EGP8e0waV82MJhWFb2G0vLPIK4rFOy
 WbAzddmEv4VTsCepIet64gpVaOwR61AZDXQLZ9r6nhFva010zKaPOMq5rO7W85NCjJ54
 k5nMdVOebrjf6ZZe9DH6NrxYrs+rOsShfYqBZ8RkKZ+S+tMQcUqNM7XtVnirezMgEhbT
 eQZKhrmV9p57HjB12NSY6mDTj0mtGA0na47O8L5Ew93AOp+GzZPq/YDOspv7OTUehtUR
 it/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I6vTxw4w
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.18.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2023 09:54, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
>   package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
> index eb011dddb8..954f4a8938 100644
> --- a/package/python-pycryptodomex/python-pycryptodomex.hash
> +++ b/package/python-pycryptodomex/python-pycryptodomex.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
> -md5  9d27f03c036c89afd3d66970bb49cd06  pycryptodomex-3.16.0.tar.gz
> -sha256  e9ba9d8ed638733c9e95664470b71d624a6def149e2db6cc52c1aca5a6a2df1d  pycryptodomex-3.16.0.tar.gz
> +md5  3b8d868cef13ea41cb3bfeab66a7707c  pycryptodomex-3.18.0.tar.gz
> +sha256  3e3ecb5fe979e7c1bb0027e518340acf7ee60415d79295e5251d13c68dde576e  pycryptodomex-3.18.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
>   sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
> diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
> index b566bdd066..3790aa4787 100644
> --- a/package/python-pycryptodomex/python-pycryptodomex.mk
> +++ b/package/python-pycryptodomex/python-pycryptodomex.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYCRYPTODOMEX_VERSION = 3.16.0
> +PYTHON_PYCRYPTODOMEX_VERSION = 3.18.0
>   PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
> -PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/5d/22/575c7dd7c86843e07a791cfa2143e7292d6b380f5a7cce966a49b9d6c9f4
> +PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/40/92/efd675dba957315d705f792b28d900bddc36f39252f6713961b4221ee9af
>   PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
>   PYTHON_PYCRYPTODOMEX_LICENSE = \
>   	BSD-2-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
