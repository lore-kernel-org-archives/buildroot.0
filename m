Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9AAC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F3E1811C4;
	Tue,  2 Jul 2024 07:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdTqK_CTM75h; Tue,  2 Jul 2024 07:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1613B813B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1613B813B7;
	Tue,  2 Jul 2024 07:47:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9111BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 275FF40490
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zK-PiPE29F5U for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF84F40460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF84F40460
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF84F40460
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:47:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52cdf4bc083so5828496e87.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906453; x=1720511253;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pQebdtuJ6bmXHhNn/pyFAYFBWvbsJ7/tS8fYBkoZJuM=;
 b=lapC/6JOlraEjNDcbeqqdAvBcu8y90YzIwlexujU48o/zUz2wEu1Ry4jxEn3nhz+ms
 qpAMI4/0RlPqbTduPGBzD3QghKYu6Jer/rFez9Bfkph48Xjj2p0plIMXK5oEdetAhg1H
 o6kEak6L85cdq9r3iBgmTf8oMB2R8BqtXz8WGfAF9ZKkfts+kLIOqKvbPv1TziQ4alCd
 /okVS9hb0ciPJrJJF33T3iHQDwoOknzkzhhrKQzwXdO7eyvKB1N5SrqgyTJvU0IpbC/Y
 4jGRw6tirSzGNb3EKjcV/k3xvdFUlzQcqa1dU2s+UUWk6sH7ulkaVCmftfgaZJ+kFLn6
 eAnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO4LQ6ZT930qUZvV2dE4l9wFSYPcMIHTSpZzdot7ttpH/ohQdC+J18jHOktOC+HlJ2lKTsygYD67e53h3wce1yVyS8f11DcA==
X-Gm-Message-State: AOJu0YxqPKD0M37yuujhZMjBt6hr4hMnj3UZD8VZcvCQ+0InjNHGB9Da
 +R0jNOwZtE8YOXg1/Cx2vP0l7VlkDyboTNYC+hSTtW3k3ImKTRPRmrxoPhvoMVM=
X-Google-Smtp-Source: AGHT+IHFm2ZIgU40DrkmeyhnnO+XCpXmmpqjjUytS10JFqby22ja8VXRMepnEpis+PeIaZu+pAqkMQ==
X-Received: by 2002:a05:6512:2213:b0:52c:e084:bb1e with SMTP id
 2adb3069b0e04-52e82644181mr6757146e87.13.1719906453236; 
 Tue, 02 Jul 2024 00:47:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36788e37b53sm909766f8f.45.2024.07.02.00.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:47:32 -0700 (PDT)
Message-ID: <12b7859a-22c4-4bbd-b6ee-6371f2acc16f@mind.be>
Date: Tue, 2 Jul 2024 09:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701195809.1795573-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701195809.1795573-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906453; x=1720511253; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pQebdtuJ6bmXHhNn/pyFAYFBWvbsJ7/tS8fYBkoZJuM=;
 b=ZuWJ+SA/6+R8ciYmgXjSCJXrqJiks/LHUs329wjSfwfSKwQlBHMK/jzv9ZkzN4oMkO
 ztnZ+zBH4cm9dqnPH8LjvfkpL8K0oD2cRBIraOUoH4aqpWpi3a2RrhiBqW3EBQKa95EA
 TTz7nngtUpbFa7HKFmtsC8ef3RnaL3DURIGU/CXjlu0lmNH2qYaM9CJ/VUrS/wJ0Xpca
 U/SxRiCp/YdzetDgv1MAU9BFQ/R2Ca1DZjLcn6xlgSLMTL9cXEYBQh0lFOb49Je8xBAZ
 IrYX/uScTVbKGCO+2u/XApnrjnYLslhgYq8mibbJkiCtewDFcqocmEVAsLO5csws8JAo
 dG0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZuWJ+SA/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump
 to version 4.12.2
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 21:58, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../python-typing-extensions/python-typing-extensions.hash    | 4 ++--
>   package/python-typing-extensions/python-typing-extensions.mk  | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
> index 778b2d5771..8e2c405929 100644
> --- a/package/python-typing-extensions/python-typing-extensions.hash
> +++ b/package/python-typing-extensions/python-typing-extensions.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/typing-extensions/json
> -md5  2bcafbd6817cb0d7a29ed7a7f1bb1e5d  typing_extensions-4.9.0.tar.gz
> -sha256  23478f88c37f27d76ac8aee6c905017a143b0b1b886c3c9f66bc2fd94f9f5783  typing_extensions-4.9.0.tar.gz
> +md5  cf64c2313f5fa5eb04c1deb3fc93abe9  typing_extensions-4.12.2.tar.gz
> +sha256  1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8  typing_extensions-4.12.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
> diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
> index 89ed75bda7..66f8872bf5 100644
> --- a/package/python-typing-extensions/python-typing-extensions.mk
> +++ b/package/python-typing-extensions/python-typing-extensions.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TYPING_EXTENSIONS_VERSION = 4.9.0
> +PYTHON_TYPING_EXTENSIONS_VERSION = 4.12.2
>   PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
> -PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/0c/1d/eb26f5e75100d531d7399ae800814b069bc2ed2a7410834d57374d010d96
> +PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557
>   PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
>   PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
>   PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
