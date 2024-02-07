Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68223C4829C
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CD3281A6D;
	Wed,  7 Feb 2024 16:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ui7n6g52QGWf; Wed,  7 Feb 2024 16:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B89781A92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B89781A92;
	Wed,  7 Feb 2024 16:39:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6C561BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFC56404D2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sbG207NNPHI5 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:39:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D960F404C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D960F404C8
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D960F404C8
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:39:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33b535c5d0fso176525f8f.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707323992; x=1707928792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ajvx/Oh4RV5ZdyDGR7l1/DDeiDad+mxVaVMX+oQcOw4=;
 b=UZdpI5nRHK9+QsZaE1udRBCXyzs0yjtvo/9Svygt6qmRcyazlZ1b6Cvd07wV0/3TJ8
 7E6gusr5MR2gf/NoHO2IQgb8O/sat3qsIE026t4sBye0q10ZWlO6Q2ixdp4Jl3kvFL0m
 0vKf5qP9qdrRcYRvyYG7wX8tPZ2h34zLqxdyyZwUvvDsE73mabMdR4XomFdCcSK6FM2R
 P+W9pjQ3FUSZLma6ndORxKnN4HuelKaumx3UbwUNst6V+BBczMLRgVrQ6Hr46an5gNj5
 Q/vX7IlDveY3SvrMfh7uU5yGb3x/PvTIHK0ydEDQfjj5MhKHdZW65W+3fIhDgM2L3SGA
 ih/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDviFA2Lm/h/xM/y8N7SnY5yx6j1TxKzk7CpfJ6HuINLV59B+Gjrj1AZrGV10HZPRSG9N/Qq5YEspBi9TB6SyjzRr0xKpNFQ==
X-Gm-Message-State: AOJu0YxkugrJEJKIIDH6iEAIqZSjvEeIs/dmAoIR5RYYL7+FbWLVvYuf
 nGdys3ZNuGXEENoYyNIavruWcDy/DqTYj/T+Jiv3TVUK0k7VrLiT2RdP5YnSUeE=
X-Google-Smtp-Source: AGHT+IFhZZN7tbF4pPuHB+CL7Q7yS3C2qaRXWgFo7gYzdpqjoDzzP0S1W4XiOL+U6SKIyE8zE+KN9Q==
X-Received: by 2002:adf:e80a:0:b0:33b:10f6:151c with SMTP id
 o10-20020adfe80a000000b0033b10f6151cmr4255677wrm.53.1707323991910; 
 Wed, 07 Feb 2024 08:39:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU0t/iVLpC8GwrCQwRykqimMfIg0EAbo1vaX3Rss+Q/cB0LwuFC743k53Qnr7FFXYVWxE1g7UJqmxC9w3Aj/GmmJfJ5QxWHpA==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 n15-20020adff08f000000b0033b1c321070sm1855608wro.31.2024.02.07.08.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:39:51 -0800 (PST)
Message-ID: <c55edb1a-cce6-4c4a-98b6-fb97c4b11ce0@mind.be>
Date: Wed, 7 Feb 2024 17:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111064511.3053913-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111064511.3053913-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707323992; x=1707928792; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ajvx/Oh4RV5ZdyDGR7l1/DDeiDad+mxVaVMX+oQcOw4=;
 b=RNHeSubq+3JYxn47ruAAWPoe+Ls/BOwMZwevjzSayC4+hsLFM+ql71cBkqMSe8RX7X
 70zaWJn5Eb4ydgrO+8lDz8vapfkiEgRKL2CgH5EsJ4q3j6f49r8ryWbxzdaDvUUm4Zv/
 arsxBf9qWxlCZrV1lgNLTAlgp23F8BUvx+w3qGBrwH129arfcq5OxkPQ/FKQCSBF3prO
 6/u1A3+Ld6wqURNgjvCBqBG8x80OasekZU3qupnkZLrTp0NmbiXwVWakF3p6EAWnDREG
 5+ghVSouvwQycB5lPyRVJ+axJQG8PyZfaUfVRqP6uCvkYXXqB/nfz+E3+pcmSqj8ZH0I
 dH6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RNHeSubq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sh: bump to version 2.0.6
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



On 11/01/2024 07:45, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-sh/python-sh.hash | 4 ++--
>   package/python-sh/python-sh.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
> index a31aacdee1..c0d3f62f12 100644
> --- a/package/python-sh/python-sh.hash
> +++ b/package/python-sh/python-sh.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/sh/json
> -md5  d60498172876f35aef6303a9cbb8eb11  sh-1.14.3.tar.gz
> -sha256  e4045b6c732d9ce75d571c79f5ac2234edd9ae4f5fa9d59b09705082bdca18c7  sh-1.14.3.tar.gz
> +md5  aadf37759a9cb4862257cef3cf44a27b  sh-2.0.6.tar.gz
> +sha256  9b2998f313f201c777e2c0061f0b1367497097ef13388595be147e2a00bf7ba1  sh-2.0.6.tar.gz
>   # Locally computed sha256 checksums
>   sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
> diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
> index 781de88ab1..af4da3f6c9 100644
> --- a/package/python-sh/python-sh.mk
> +++ b/package/python-sh/python-sh.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SH_VERSION = 1.14.3
> +PYTHON_SH_VERSION = 2.0.6
>   PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
> -PYTHON_SH_SITE = https://files.pythonhosted.org/packages/b7/09/89c28aaf2a49f226fef8587c90c6386bd2cc03a0295bc4ff7fc6ee43c01d
> +PYTHON_SH_SITE = https://files.pythonhosted.org/packages/cd/51/7355831d8e1cee8348157d769ccda8a31ca9fa0548e7f93d87837d83866d
>   PYTHON_SH_SETUP_TYPE = setuptools
>   PYTHON_SH_LICENSE = MIT
>   PYTHON_SH_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
