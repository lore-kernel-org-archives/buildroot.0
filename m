Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8033EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72CBA813DD;
	Sun, 25 Jun 2023 13:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72CBA813DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBe1l36vEJIo; Sun, 25 Jun 2023 13:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98821812FE;
	Sun, 25 Jun 2023 13:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98821812FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3E531BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB532813BC
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB532813BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I4lcm0IXU4jp for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:43:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689E181324
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 689E181324
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:43:56 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9786fc23505so184460866b.2
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687700634; x=1690292634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zkTt5X3gtMhPxbkl8WihJNP+4V73Uw8RRuO6mL0JEGo=;
 b=jbwV3ykPmlPmjTcwJCgehF/wrojuENlaM0nmxGPsbP19a3kKeWvcB6fE4IHh1uoeyH
 Ihq90eauo+0RTVTTn1U3OQJ7aJ+r9LWb64Ybg8o/g267Qjm9113Y+M5yrPJ0KKt45anw
 3TI494W1VCVBm8n2HrRoAMFIx/4PaY4bElKq4FiVJx4LyViZsGaCNCS85gLIa5MXKbyX
 LTq7SX7Gdnn/EC2YYOkB76QUfw6euyjzpAewBSeOqw3UgE+qn2L2aokmkf80XSU2PCIq
 IZsmd6GPOho04uBaO53aM93A1c9YIslgrCqZCM0Na0LQIe7fLvrn62zgjO5PU7ggwpuN
 SgGQ==
X-Gm-Message-State: AC+VfDxNt52CXDe38EDfW7pRuXB3zZAmArlrQoi6u0BdqXHVx5wt+Y8l
 MQ54tSCoFmTN6Yj8jZTjOuK66j8QuQ9NPWch6GU=
X-Google-Smtp-Source: ACHHUZ4fhzIAjuUPxvv/kMF8l5slfTJZotyR7WhFt6x1fOFXkLa6UAm7gCmUWg9MzhCeTZza/akEzg==
X-Received: by 2002:a17:907:3688:b0:96a:2acf:61e1 with SMTP id
 bi8-20020a170907368800b0096a2acf61e1mr22411572ejc.64.1687700634387; 
 Sun, 25 Jun 2023 06:43:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bm4-20020a170906c04400b0094f07545d40sm2071930ejb.220.2023.06.25.06.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:43:53 -0700 (PDT)
Message-ID: <525a5146-85ab-cf4b-1dec-9dc50e5bafe7@mind.be>
Date: Sun, 25 Jun 2023 15:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20230622052703.3215005-1-m.niestroj@grinn-global.com>
In-Reply-To: <20230622052703.3215005-1-m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687700634; x=1690292634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zkTt5X3gtMhPxbkl8WihJNP+4V73Uw8RRuO6mL0JEGo=;
 b=GosD7luJdEuFO7RTCvs0/4WoiCo3JloI9npcD+IxnhKQOWCDnF5jvMkptuAjKRXfx5
 O+x3XQPAdgk6VD85C9AopsrMq9ji2kJK84gTt5IsNzXgHV7iEu4+64oVNuivYEdoDWMa
 4eIzI9dkxqIHmyWact34Rn4USSgeX/BLudSAgFFiA1nmneuWFoNf4rm32Z9S12uVzKeH
 MXFJyG49peEMQVGsaG3jX/VY008NYV+iX3320EDPGE8xyeou26i3+XDx9bSD/RZaZNoV
 y/qjJ6qQiE5tXN0vSO4hgq0Q/DQCOGKwvH12P23R1glGFc6zXVFIFfweJT5GjH8/bM1e
 /gYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GosD7luJ
Subject: Re: [Buildroot] [PATCH] package/python-typing-extensions: bump to
 version 4.6.3
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



On 22/06/2023 07:27, Marcin Niestroj wrote:
> License file was synced with CPython project (see [1]).
> 
> [1] https://github.com/python/typing_extensions/commit/bb75d261196aa6f520d1b80b373891c860ebb71b
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../python-typing-extensions/python-typing-extensions.hash  | 6 +++---
>   .../python-typing-extensions/python-typing-extensions.mk    | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
> index 249bb63a42..f9d1de5e28 100644
> --- a/package/python-typing-extensions/python-typing-extensions.hash
> +++ b/package/python-typing-extensions/python-typing-extensions.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/typing_extensions/json
> -md5  5cfcb56ea6fc4972c3600c0030f4d136  typing_extensions-4.4.0.tar.gz
> -sha256  1511434bb92bf8dd198c12b1cc812e800d4181cfcb867674e0f8279cc93087aa  typing_extensions-4.4.0.tar.gz
> +md5  111a7d37292a241811502bd1b64032be  typing_extensions-4.6.3.tar.gz
> +sha256  d91d5919357fe7f681a9f2b5b4cb2a5f1ef0a1e9f59c4d8ff0d3491e05c0ffd5  typing_extensions-4.6.3.tar.gz
>   # Locally computed sha256 checksums
> -sha256  c7afb65e755707b9fb90487389a176d3ed3d0031d5131afde45c23715ff5e891  LICENSE
> +sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
> diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
> index fd7d0bd93a..2c07846154 100644
> --- a/package/python-typing-extensions/python-typing-extensions.mk
> +++ b/package/python-typing-extensions/python-typing-extensions.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TYPING_EXTENSIONS_VERSION = 4.4.0
> +PYTHON_TYPING_EXTENSIONS_VERSION = 4.6.3
>   PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
> -PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/e3/a7/8f4e456ef0adac43f452efc2d0e4b242ab831297f1bac60ac815d37eb9cf
> +PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/42/56/cfaa7a5281734dadc842f3a22e50447c675a1c5a5b9f6ad8a07b467bffe7
>   PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
>   PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
>   PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
