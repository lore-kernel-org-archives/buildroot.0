Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4795FEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8702560B35;
	Sun, 18 Jun 2023 13:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8702560B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJgusPfmXGir; Sun, 18 Jun 2023 13:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99F5B61035;
	Sun, 18 Jun 2023 13:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99F5B61035
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CEE41BF5A8
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC3740A02
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC3740A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vSO74MXu4Wic for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:02:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B93740944
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B93740944
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:02:34 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9883123260fso87955566b.0
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093352; x=1689685352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xVvOTwuQ09Jtx0NMegh5UvRD3lgR8ATNWKVo/VlQ/Bs=;
 b=X30NhGQanDlmzWtcRFSep2iE1jgCg5XQoNPxQPveFz5RYj1/1mRxeYv7qVJ9Yz6Y6D
 Srb+wgj5KE9N3dK7IEGGEwWSpGjNTzIVk7UV0WHdJ4Lbd+ns/wfI5HG42THz9Dq8atZD
 MyVbFOSEloFf9/kpHqMxNihouDbBLHStcKYnRhLHFCoM0wgPshlz6dYd88yHAZYXJe3M
 iOCY09L0UOCmyNxpSVS5GPn5zGdieqBJWkU3KLyeCy4wiH1rRp/pSSob7YOmEtumeuZi
 ORPYQ6/wrTQynEaxPebkCDITcKltpLRLzDggRZ5D5TwRnT40RKgyyC/GKNiCgGzQ4WNf
 sikQ==
X-Gm-Message-State: AC+VfDzpa0WXyzQdN+nZ1eKH1bQXxo9HivgDtFoP2N7NftGj6kYIs4Xn
 e/T/YYsk4maeOL1iYLn7vRkEVw==
X-Google-Smtp-Source: ACHHUZ4RChrY8z4LWf5TUVe1bOpcv7NgSrZfDAFKrCXjFjhr0gTXJ0klOtay3VbQf6W66CfOWYpQ+g==
X-Received: by 2002:a17:907:d1b:b0:986:5a61:52eb with SMTP id
 gn27-20020a1709070d1b00b009865a6152ebmr4919971ejc.77.1687093352435; 
 Sun, 18 Jun 2023 06:02:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a1709061cd700b0094f07545d40sm13141816ejh.220.2023.06.18.06.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:02:31 -0700 (PDT)
Message-ID: <84fcd6e1-bf7f-dddd-0593-8c5a7e9be9be@mind.be>
Date: Sun, 18 Jun 2023 15:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605070334.1873522-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605070334.1873522-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093352; x=1689685352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xVvOTwuQ09Jtx0NMegh5UvRD3lgR8ATNWKVo/VlQ/Bs=;
 b=Ab9a+1Iz4qo3DhD/CdISyyQh36YvZ5COd5/TggmbIll5TatwNVwPnIh9s8Zo4YcRmB
 hsI1z9hKxQatfGhsDjrb9Eo62kiPJgmIjeieT6dZytqxkZ8iCWrtYEcRJPn6JzwJKW/W
 Prr6IbtnvBJ5pzswF4LAknTaFW3Jf/984gBl/r1ryzJf/ISS7kmI6wryb/YAW4P+2cqo
 Ake+KIvc/45d5PL52oonD7cg8M6uId4vXlkCGrdTJzelXOK2OPmgtlMQPLw6R3O2MQ5A
 NVHXwvHMe3L2ic0G9QS7BGV0rlF8C/D/6pSYV3m3nZw2hvsxmgiA3kY1ZGOFVTfJa0Xb
 WkDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ab9a+1Iz
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.6.0
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



On 05/06/2023 09:03, James Hilliard wrote:
> Drop no longer required host-python-setuptools-scm and
> host-python-toml dependencies.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
>   package/python-setuptools-rust/python-setuptools-rust.mk   | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
> index ff1b9a127f..f8282277a1 100644
> --- a/package/python-setuptools-rust/python-setuptools-rust.hash
> +++ b/package/python-setuptools-rust/python-setuptools-rust.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
> -md5  fd3412ca77ffd6e06e2e83d0e9636084  setuptools-rust-1.5.2.tar.gz
> -sha256  d8daccb14dc0eae1b6b6eb3ecef79675bd37b4065369f79c35393dd5c55652c7  setuptools-rust-1.5.2.tar.gz
> +md5  f7a1602f3c34e9a5bb82603d4d80c9e3  setuptools-rust-1.6.0.tar.gz
> +sha256  c86e734deac330597998bfbc08da45187e6b27837e23bd91eadb320732392262  setuptools-rust-1.6.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
> diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
> index 7f19ece1a3..a3e4d7a9d3 100644
> --- a/package/python-setuptools-rust/python-setuptools-rust.mk
> +++ b/package/python-setuptools-rust/python-setuptools-rust.mk
> @@ -4,12 +4,12 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_RUST_VERSION = 1.5.2
> +PYTHON_SETUPTOOLS_RUST_VERSION = 1.6.0
>   PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/99/db/e4ecb483ffa194d632ed44bda32cb740e564789fed7e56c2be8e2a0e2aa6
> +PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/0e/c9/6f9de9f7a8404416d5d22484ccdeb138f469cc1e11bbd62a2bd26d5c1385
>   PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
>   PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
>   PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
> -HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-setuptools-scm host-python-toml host-python-semantic-version host-python-typing-extensions
> +HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-semantic-version host-python-typing-extensions
>   
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
