Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36270EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF3C481AC1;
	Sun, 25 Jun 2023 13:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF3C481AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9Uf4MIOlvXa; Sun, 25 Jun 2023 13:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D929C817FD;
	Sun, 25 Jun 2023 13:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D929C817FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2F4F1BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC92F817E4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC92F817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0H3Adou0iqq for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:44:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2CB2812FE
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2CB2812FE
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:44:19 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-98e39784a85so94286666b.1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687700658; x=1690292658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZiFKktCv35RdfgkYVlUMssfpcLyGkGD+AMgYsCbMHzs=;
 b=Txw6Ry9FAvfyRQUoa44WoezdrvFLnvynRgqCmOLyf/x4C9GNDJfRRSxNfNyR7765rY
 HuKHhD2dVdhJ9KJkMhlWLsOLGBjxXNorcnipQCMaQRvhbCowYb7jpkZGsVB3h5rCOolp
 c1/Sxw6D7i/XONuMzMy45Fcjx4K3ZuvbkK7sx9NDVzeHAVYStPsjVEmT2qMFSdER/JUz
 fDoj0b22XwAzipyCkksmT0fwTWsKnvJXCxYtVNoYNhQ32btvVsBUj9hzaVi8j5P/wt2J
 qRJ7y2+OfZ8f4GJ0fUvldgd+wGwQAt2g2CwqtTgQPdA2mFYHlZEZ9EnZ3Jl/7DRQeO33
 O+Ng==
X-Gm-Message-State: AC+VfDx78zLoFrJiggvUZPFNukx3sdwUeCN6p9KCsQ84QuoauVmHL8xw
 3+SAjWawEWL8M2Y4MyIMCY6jhA==
X-Google-Smtp-Source: ACHHUZ724fIYnRu8aBx4y5XFvBqufppsArGx7Oyp/z4BqFfrhW9JQNCvpuzz0V3sqiLiedVBIxvAVw==
X-Received: by 2002:a17:907:6e06:b0:98f:8481:24b3 with SMTP id
 sd6-20020a1709076e0600b0098f848124b3mr800974ejc.37.1687700657851; 
 Sun, 25 Jun 2023 06:44:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a1709067fd500b009828e26e519sm2063070ejs.122.2023.06.25.06.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:44:17 -0700 (PDT)
Message-ID: <5dffbbf4-aebb-d342-5965-531711e462a4@mind.be>
Date: Sun, 25 Jun 2023 15:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20230622061511.3802677-1-m.niestroj@grinn-global.com>
In-Reply-To: <20230622061511.3802677-1-m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687700658; x=1690292658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZiFKktCv35RdfgkYVlUMssfpcLyGkGD+AMgYsCbMHzs=;
 b=d5ONe239LG/c4rArANE0hFKvyl8VGP/qzcIKDwVUPpGvXBhIITT276hGZ1CD+UImvG
 d/KLi3S58RfRxmLN9rAuFO9b31sW+52pUAnSTxmvvrwvhPKuxwg8smfv47E5AZ40eo0p
 1iNCLCfWlZ5kZ8560A/QmTISUfg6BA3LG0NxKN9j0v6rEESgH87RAUCU/6yNaLF62Bqh
 jiqKhDa1nb8ofwfSDJ/Pf1mm7MVXA+PrObxo9PgIccYVzIJFAJ6EOsp8HiyCMPJZK8a1
 uTPtCbBRZ40D58RU0NnONWJicmnu+/nNGZo8c2VWGRUsFLz9bg1GBmJFYOFJA+Q9tCCM
 73Eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d5ONe239
Subject: Re: [Buildroot] [PATCH] package/python-pytest-asyncio: bump to
 version 0.21.0
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



On 22/06/2023 08:15, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
>   package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
> index 051670aa51..6198a46608 100644
> --- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
> +++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
> -md5  dce438c7b0081d7f580b5a79d7105570  pytest-asyncio-0.20.3.tar.gz
> -sha256  83cbf01169ce3e8eb71c6c278ccb0574d1a7a3bb8eaaf5e50e0ad342afb33b36  pytest-asyncio-0.20.3.tar.gz
> +md5  805da62a533c75a9bccadee485f98c27  pytest-asyncio-0.21.0.tar.gz
> +sha256  2b38a496aef56f56b0e87557ec313e11e1ab9276fc3863f6a7be0f1d0e415e1b  pytest-asyncio-0.21.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
> diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
> index c94c9ea876..6bf7e33577 100644
> --- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
> +++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYTEST_ASYNCIO_VERSION = 0.20.3
> +PYTHON_PYTEST_ASYNCIO_VERSION = 0.21.0
>   PYTHON_PYTEST_ASYNCIO_SOURCE = pytest-asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
> -PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/6e/06/38b0ca5d53582bb49697626975b5540435ea064762d852b5c66646c729e9
> +PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/85/c7/9db0c6215f12f26b590c24acc96d048e03989315f198454540dff95109cd
>   PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
>   PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
>   PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
