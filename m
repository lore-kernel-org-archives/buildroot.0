Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47252C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED6C940ADD;
	Mon,  5 Feb 2024 10:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED6C940ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_Nsz7WJzFnq; Mon,  5 Feb 2024 10:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BECFA40B15;
	Mon,  5 Feb 2024 10:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BECFA40B15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EACD71BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3D2181E14
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3D2181E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7EBxTLVC2Of for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:51:07 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CEE1828F8
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CEE1828F8
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fc654a718so24780425e9.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707130265; x=1707735065;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uzrl6Sr2yC1OnB7XENt9TApH2AJWSwFw6MJEUJ7uLlk=;
 b=aIZDj6NLvr/vKnQpm6dtCgsNXpbnY50wjwJBdiUthBrFJRjuUSk9amONf3RYTW77Ji
 H9QGKF+KKq1zCXDVnGlN3e5Y7FnlqQ+Peq453RZAey8ydsmnlyQqWNibvPtUUKc6JAdE
 B9a2rX2xfeCgIWkkpx3ulcNPPouFJYwt8+J5R3TClFks+x1cRfuH/cYBm6wka+UBwM2f
 c0jd/rn+CvKPe7FxeZGbkr8ovzDu44ZkanLsn5OjINGdE7R2Jl3HKxd9nGyxZLHGIuix
 J7ADKRT/V6QE1CpljEKnO+vU+Tq802pwwFs/TIWTYqmmk6jnjtJ9x6Ncid/1fzhBLrdb
 b/7g==
X-Gm-Message-State: AOJu0YxEtgsPOn0ml58Wabxs/JGlrU/jZfSj4vyKQyMiDvLF5vB8fXuz
 bBYzHsEC/3zLbqAgDfuvTkzMAKMGb9PZRCbc3yDVqnfvs3R+Uk5J/z4/VkVYdXw=
X-Google-Smtp-Source: AGHT+IHSrYm+lri10sg+aw+x873g4q8JtIDBFW6pGscpqZGoeyMPr4ZazXWoHeoPLSw6P1EFZuEBww==
X-Received: by 2002:a05:600c:4f14:b0:40f:b5d2:1af1 with SMTP id
 l20-20020a05600c4f1400b0040fb5d21af1mr4452021wmq.7.1707130264711; 
 Mon, 05 Feb 2024 02:51:04 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV7ZolGau23kHyiPabZBDRHZ3SINkOA2ApI2bRtuJezNw24BYHXsKVXU7kYUl19dAVDA+BRShOhHYZVg5SbR51MAJXRYZ9oXA==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8101947wmb.26.2024.02.05.02.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:51:04 -0800 (PST)
Message-ID: <99937e20-13a9-449c-9b57-ecaf061f5feb@mind.be>
Date: Mon, 5 Feb 2024 11:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111050439.2900236-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111050439.2900236-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707130265; x=1707735065; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uzrl6Sr2yC1OnB7XENt9TApH2AJWSwFw6MJEUJ7uLlk=;
 b=gv5DFZSi4nz1/basErwpHBCo7T9GouhlaAn8qXJgDZp0wENYR+UZOMLAVg2wkvk5xV
 dSdpj3N/y0GIJ24ulmDJPeYXlfuBFVGGyIQt9QQQ4xSz7VnKZn6OraBLCqprq+S1mu2s
 4jnT5RRh89SLdZazoyXUz33WdCZcrmxuyX56kGDxP/8Mg1M7KX2LqU8/DaMluwYTDkxm
 HtEiapUSI926Mk5dQvh4kdG9o7IwqdMyCx9K9R9OSuUBBYgHU5/yrQSxKyQXfiI4ujVO
 TLF1tslrVWE2SlVeuNqgiZzHec0Sm9R3wu5Ox607ivlbPCMXOnlvt68Uc4MWSM0tbA4P
 +ixg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gv5DFZSi
Subject: Re: [Buildroot] [PATCH 1/1] package/python-referencing: bump to
 version 0.32.1
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



On 11/01/2024 06:04, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-referencing/python-referencing.hash | 4 ++--
>   package/python-referencing/python-referencing.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
> index d4f3dce5a4..2880a47477 100644
> --- a/package/python-referencing/python-referencing.hash
> +++ b/package/python-referencing/python-referencing.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/referencing/json
> -md5  617d973b9ce86b6f74b2216c6f3af5c9  referencing-0.30.2.tar.gz
> -sha256  794ad8003c65938edcdbc027f1933215e0d0ccc0291e3ce20a4d87432b59efc0  referencing-0.30.2.tar.gz
> +md5  d1a0a4ae03ebba4b86b22bfb825f150b  referencing-0.32.1.tar.gz
> +sha256  3c57da0513e9563eb7e203ebe9bb3a1b509b042016433bd1e45a2853466c3dd3  referencing-0.32.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
> diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
> index 4d11c99deb..27d1452e91 100644
> --- a/package/python-referencing/python-referencing.mk
> +++ b/package/python-referencing/python-referencing.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_REFERENCING_VERSION = 0.30.2
> +PYTHON_REFERENCING_VERSION = 0.32.1
>   PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
> -PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/e1/43/d3f6cf3e1ec9003520c5fb31dc363ee488c517f09402abd2a1c90df63bbb
> +PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/81/ce/910573eca7b1a1c6358b0dc0774ce1eeb81f4c98d4ee371f1c85f22040a1
>   PYTHON_REFERENCING_SETUP_TYPE = pep517
>   PYTHON_REFERENCING_LICENSE = MIT
>   PYTHON_REFERENCING_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
