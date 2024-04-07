Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F480CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37CA460788;
	Sun,  7 Apr 2024 14:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoEOP3O4Xhb4; Sun,  7 Apr 2024 14:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 405CE608A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 405CE608A5;
	Sun,  7 Apr 2024 14:56:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E95C1BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A55A406FE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soGbwxN-yl8J for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AA84406ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AA84406ED
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AA84406ED
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:56:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4162b5ba2bbso23933955e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712501769; x=1713106569;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J9nWg90Thar3Wd5rrH5meYgfmBK6orDxIOYuAFHwf4I=;
 b=ftsgNshljvnUG6O7L65BQ1hzMsDvYDemnwSleVAl8yLD6oIQoHsQgJkne14k2fg86v
 Uq+bH9k/ULAcVPCt5nlJMjrD+2R0m0Qtgk+F3QI5uo5TGYudkE0r6ZTubpcoWWPEO6d7
 no/26fER9O3n1e/re9oZOPPJ1QSp9eQz9foihyAtcJeWNtIHyitazlKEoCy26TbL6t6D
 nYdtanPF7sBzIuIGScfn2PhrfmBmkxYN7EGIrzS3SnrLXg9tF2e5TLPiWldOcWFc8WKZ
 67D03ehWcjd4Zepf+AwX1VHn6Gm13mcMllPumJshdPHSTUOBLiINF3ynZ0Ed3+aNo2eY
 zl9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbeZwaSygtCIDfRphOp5uhczdHwkfU0nqdLu1WnnfkbuYebYQ/PG+jRxL2UXVoXmKhQiIwbITnXDaFAIYH5j9ZoOW0sBgE+w==
X-Gm-Message-State: AOJu0Yw7hfet39PB5yIe7Zi7tOMrcusj2wMdxFuAZSMuN1XBoLXHUp44
 9Xw37DOb2US1UpS7MiqBzbfPF5pE66/ya+8KyF5B5GgVMCN/2ulLB90FuaoHm/Q=
X-Google-Smtp-Source: AGHT+IHMwinbgZlY4TkGv88AKIU4UiVN8zhluHUYzpZ2PhGHGkwW2JlvcLWjVWmUaujUIQpJvVhVaQ==
X-Received: by 2002:a05:600c:314b:b0:414:8d8e:1fcb with SMTP id
 h11-20020a05600c314b00b004148d8e1fcbmr4790301wmo.22.1712501768939; 
 Sun, 07 Apr 2024 07:56:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b00416509d7d95sm3246663wmo.37.2024.04.07.07.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 07:56:08 -0700 (PDT)
Message-ID: <c8f38916-2b8b-4db8-9f3d-bae19a02e2fb@mind.be>
Date: Sun, 7 Apr 2024 16:56:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20240226094122.22631-1-buildroot@bubu1.eu>
Content-Language: en-GB
In-Reply-To: <20240226094122.22631-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712501769; x=1713106569; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J9nWg90Thar3Wd5rrH5meYgfmBK6orDxIOYuAFHwf4I=;
 b=T9dtsUmHTMv3Oytpb1eEuAbwa4hLHHCVK2q7rXjmYHTOW4eyvtUAdykCTmKjNEHBXo
 IINJ7igmgVLqX066hsaswOgTU8KIXR6nXBbbrA3lL+cjBquHOmakw7yDcXNrBqNmYGWm
 oNXIM7PtqIbBer0Jt6LGicdSxQ8misyDwNi78K38zm2Zn9np99rSwKVAXKwRkPR4p/YB
 5Wxgk5XPsGOH2WRrboxYwLqj5naAvH77diUV8vbnx76fICDWH33RHHrsUloS/6DtmFZM
 fPtXKSbDKohiJ+icC338FI4HbTotZqt7P+1WA+6HWo3lnBiVV/o2l4xiOpCI7Jdx7AoX
 dzeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T9dtsUmH
Subject: Re: [Buildroot] [PATCH] package/fastapi: bump to 0.110.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  It's python-fastapi, not fastapi :-)

On 26/02/2024 10:41, Marcus Hoffmann via buildroot wrote:
> Changelog:
> https://github.com/tiangolo/fastapi/releases/tag/0.110.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-fastapi/python-fastapi.hash | 4 ++--
>   package/python-fastapi/python-fastapi.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
> index c16b7d22de..224eccbccd 100644
> --- a/package/python-fastapi/python-fastapi.hash
> +++ b/package/python-fastapi/python-fastapi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/fastapi/json
> -md5  b48191c0322fb5479773925af005b2c1  fastapi-0.109.2.tar.gz
> -sha256  f3817eac96fe4f65a2ebb4baa000f394e55f5fccdaf7f75250804bc58f354f73  fastapi-0.109.2.tar.gz
> +md5  5e9226e70e1553a630599cf584ed53de  fastapi-0.110.0.tar.gz
> +sha256  266775f0dcc95af9d3ef39bad55cff525329a931d5fd51930aadd4f428bf7ff3  fastapi-0.110.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
> diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
> index a2191c73b7..c1844960b9 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_FASTAPI_VERSION = 0.109.2
> +PYTHON_FASTAPI_VERSION = 0.110.0
>   PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
> -PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/01/d5/33a8992fe0e811211cd1cbc219cefa4732f9fb0555921346a59d1fec0040
> +PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/61/53/326977db62bf34bbdfc64acb9414e1881af7ea14e8a062fd1c11a8697616
>   PYTHON_FASTAPI_SETUP_TYPE = pep517
>   PYTHON_FASTAPI_LICENSE = MIT
>   PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
