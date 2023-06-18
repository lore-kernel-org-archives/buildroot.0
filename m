Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5B6EB64D8
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DCA605A3;
	Sun, 18 Jun 2023 13:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52DCA605A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DC7_jp8SSBa9; Sun, 18 Jun 2023 13:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A6C60FFA;
	Sun, 18 Jun 2023 13:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56A6C60FFA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BB321BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2547C402F6
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2547C402F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FiGuCXhoE_-p for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:08:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 308CC40363
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 308CC40363
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:08:28 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-988a5383fd4so14583566b.0
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093706; x=1689685706;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o3YRB6eBLsDtd82NnjOHEohhMbdDI5IOk0mt5zJSeAc=;
 b=ReD2FvSlPkrLIJpDLCCwwpIyzXTL+4gY+0dKKUKxhKr3RO3utbpZVUGAu3x97GwWjo
 9J0A3JawRmS5RgWcQC7Xqsc8VEoYffPK+/GBiENezz23S5H5/zAc2s2pxvhtWmJvngIH
 obUDORA3WKU9NNk0acIcP65NdPvBk3FNA9ebbpIsKlHPaba1cP6fIrML8u4EzCqIET6V
 UGjaFNsk+dSWb6fUxJfOQYSJzqqLobn+BdjlVl6icFXnMzjhxE+4eKYulbwe0fL7tSr2
 ddnQiHvpPJYzzb6bCEFsqDJIYYJv7hkAU1zEpuhHSii29pjTPXIKzRYaHAe3JvQWz2eX
 HEpg==
X-Gm-Message-State: AC+VfDx+kE+DlVI44Kh8OVDoFAeTAepst0YX13+ORkw0HMh7rkfFFzId
 zUdqI9Fso6rokBlvpukWVu1WOWKsoicrXjjypy0=
X-Google-Smtp-Source: ACHHUZ7/EkZD61MjSsr+Go01pMUBbiPirJbUBp3jZ7rJJge67QwC96gRB05zth9JCdcGlju7gramOQ==
X-Received: by 2002:a17:907:868d:b0:982:8bd5:4229 with SMTP id
 qa13-20020a170907868d00b009828bd54229mr10882114ejc.25.1687093706484; 
 Sun, 18 Jun 2023 06:08:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a17090646cc00b00982a256f879sm4739709ejs.35.2023.06.18.06.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:08:26 -0700 (PDT)
Message-ID: <8e21eada-dc1f-32e5-0f1b-70dc4e967da6@mind.be>
Date: Sun, 18 Jun 2023 15:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605071351.1879583-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605071351.1879583-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093706; x=1689685706;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o3YRB6eBLsDtd82NnjOHEohhMbdDI5IOk0mt5zJSeAc=;
 b=ShnFF4s3xi40N9eeOkPwXXmL7FpylaveSZ4DdZC7cBza+clB7iMkDWOx7isdN6iWYn
 HPbdLxvyz9PW2SVCCsKIDKlH9kJaSGCBM5/LGmkcNCGSeJP5UNMk5Mu9SW2MHFLWPQkp
 dxMVH16Ynk8v3mm3CJZCAHpZ/VWNnNzFXxfEcAOIx2w+iwWOmL2oVIvRv2OrOmIClHdD
 VRI7jI8MOf3rB3a8v5HFC9zAJcpW9eCcWYTmHZ7XAnySPaEYTeA2yLjVJs8tUnhOi8eU
 yOAZnWGvISlgJggi9MHawpDZqDZ2rJYgT9t8RJhYf8dFpDc93EsD2IJAz23T4yOqCQuB
 B80Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ShnFF4s3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-txaio: bump to version
 23.1.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2023 09:13, James Hilliard wrote:
> License has changed due to company name update:
> https://github.com/crossbario/txaio/commit/91dace6ad1ddef3741d8c4db70d0e8728db046f0
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-txaio/python-txaio.hash | 6 +++---
>   package/python-txaio/python-txaio.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
> index f06c14b21f..d561cec635 100644
> --- a/package/python-txaio/python-txaio.hash
> +++ b/package/python-txaio/python-txaio.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/txaio/json
> -md5  9b692af4c4fce73cadd36374c138936b  txaio-22.2.1.tar.gz
> -sha256  2e4582b70f04b2345908254684a984206c0d9b50e3074a24a4c55aba21d24d01  txaio-22.2.1.tar.gz
> +md5  297409f2dff8e71bad24467374aa8775  txaio-23.1.1.tar.gz
> +sha256  f9a9216e976e5e3246dfd112ad7ad55ca915606b60b84a757ac769bd404ff704  txaio-23.1.1.tar.gz
>   # Locally computed sha256 checksums
> -sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
> +sha256  ab1dd7a42dbdae302346c5a4571f2149691cc1ec06836232bf4923527e3fe41c  LICENSE
> diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
> index 1a8a888963..585b3a5f57 100644
> --- a/package/python-txaio/python-txaio.mk
> +++ b/package/python-txaio/python-txaio.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TXAIO_VERSION = 22.2.1
> +PYTHON_TXAIO_VERSION = 23.1.1
>   PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
> -PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/6d/4b/28313388dfb2bdedb71b35b900459c56ba08ccb7ad2885487df037808c06
> +PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/51/91/bc9fd5aa84703f874dea27313b11fde505d343f3ef3ad702bddbe20bfd6e
>   PYTHON_TXAIO_LICENSE = MIT
>   PYTHON_TXAIO_LICENSE_FILES = LICENSE
>   PYTHON_TXAIO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
