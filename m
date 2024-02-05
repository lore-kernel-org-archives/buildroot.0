Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD2DC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BC4740108;
	Mon,  5 Feb 2024 10:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BC4740108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yciUZV6L3nNG; Mon,  5 Feb 2024 10:50:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2136F40B30;
	Mon,  5 Feb 2024 10:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2136F40B30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76F681BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CEFA81F30
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CEFA81F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvWFu8Qyno3T for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:50:29 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE54B81F1A
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE54B81F1A
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40fc6578423so25567185e9.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707130227; x=1707735027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YK+zWZwqcYzYUs2ZPyjhB1bayvn4ULVi000/8ce6r2w=;
 b=EqgnrmpTojo5Oj3OnGwTQTumgsAtYKpe/7byaZFYfwzFpVqbZuRk4SS8f7mLM+B/3j
 0fnoGROvDVCt96qCgV6HK3acfcEEPRt75/c8c+8FKEsCN7Z4AmE8r8bv4OTyJER/HIia
 dwlkkUX9U81RcCa7QpnCRZ+BPK28pv2XI1E/KHrql7ZD1eeobzElxlEEim62uJe/7Ziw
 k488K7oJJ9JOEJWsL/5adFXFDlcT4sQDRBKg+gfcVCQKbgTMAsnoi27M2Axa9+P5S+jW
 2kZd4b/0jupWSx+/jTkMf9rWcb5kqYgEfGnqVd9fBE1N91Ykr7sq4dy5Djgi85WiRO1C
 z8sg==
X-Gm-Message-State: AOJu0YzQA0hIO98eLJ+1g0SvlxW1eK0EtXvjvmYls1Povw2O15rulPc+
 a+0Hn+SYv8OPzggouj8by8jawOikAF9iz9UlWrKv3+HYMv+qXHJdo9WgotB2Qzc=
X-Google-Smtp-Source: AGHT+IF/RxVX6EemFGoG2NTospJEiWzQz/V184AiZ0Qk+fiKPKaZnR0vtFrP73ApovswLiU4BCoGLQ==
X-Received: by 2002:a05:600c:3b95:b0:40e:491d:ac80 with SMTP id
 n21-20020a05600c3b9500b0040e491dac80mr4513037wms.15.1707130227110; 
 Mon, 05 Feb 2024 02:50:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUcN3WYeM7yoBKqFClV8+ejxXyqngYgdx8yYx2TuE+9Uh9sHUAGkJNxkpNH/eWVLr2jeOe/zeSetIM+/+3uLu2dlu57krTKzg==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8101947wmb.26.2024.02.05.02.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:50:26 -0800 (PST)
Message-ID: <08b99de6-e8ec-4692-a7f9-f0b4ce986cf7@mind.be>
Date: Mon, 5 Feb 2024 11:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111050053.2897660-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111050053.2897660-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707130227; x=1707735027; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YK+zWZwqcYzYUs2ZPyjhB1bayvn4ULVi000/8ce6r2w=;
 b=Ri5tix2N1dTrhcYp06XEZVihgc9c6uKf8AoO1jrwXK6lSMbTn4LlBLSYna9w3MXsqo
 CCiSeuW0jSyk7XL7RedxATIKVBfkV0AprMMkNR8oOmW5IOTjjBLi2ZAXdjEGepJgkDuy
 gmCG3lD5Zv8emAFIkIGugAbMq2omHRCP3XOQpLmf+kGR0sdqzlNvKVuQ3b5EuO7/gXin
 ow9D5IZ4N9vhIrpW9OFHLW57L1qT9FQ+1ObVhVrQAoGwK+vn/vQMqYTlFzj8arJnywzV
 rL+moMGuCGraCywUeagmoSFafDp8g8TJ9Jy90P1fGJ9JIbFjqWKL61Cfl2zRLkweqqPo
 vEVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ri5tix2N
Subject: Re: [Buildroot] [PATCH 1/1] package/python-reedsolo: bump to
 version 1.7.0
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



On 11/01/2024 06:00, James Hilliard wrote:
> License changed to Unlicense/MIT-0:
> https://github.com/tomerfiliba-org/reedsolomon/commit/7b97461684701cf19451db1fd348d831dc526dc2
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-reedsolo/python-reedsolo.hash | 6 +++---
>   package/python-reedsolo/python-reedsolo.mk   | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-reedsolo/python-reedsolo.hash b/package/python-reedsolo/python-reedsolo.hash
> index fdafc89f49..c1729f0aeb 100644
> --- a/package/python-reedsolo/python-reedsolo.hash
> +++ b/package/python-reedsolo/python-reedsolo.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/reedsolo/json
> -md5  b67a04027a1825c63a63b6793ec660a3  reedsolo-1.6.0.tar.gz
> -sha256  4e290d3b0a7207ac7aac186790766c752b5fcdf5e0b04dfd260349579052bbac  reedsolo-1.6.0.tar.gz
> +md5  5bbd7741f915ad67b6d425f93ab9d103  reedsolo-1.7.0.tar.gz
> +sha256  c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732  reedsolo-1.7.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256  0babd7b573efc3dcf5bb3c28b583150726f775d3dd8d54d6cd062834735b3d73  LICENSE
> +sha256  2da9536c23b72bac15603bb1f8dbf269dc68ecfbc35a75f8d0aa9cb209ba0934  LICENSE
> diff --git a/package/python-reedsolo/python-reedsolo.mk b/package/python-reedsolo/python-reedsolo.mk
> index 2a7fd42a05..66e85fb40a 100644
> --- a/package/python-reedsolo/python-reedsolo.mk
> +++ b/package/python-reedsolo/python-reedsolo.mk
> @@ -4,11 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_REEDSOLO_VERSION = 1.6.0
> +PYTHON_REEDSOLO_VERSION = 1.7.0
>   PYTHON_REEDSOLO_SOURCE = reedsolo-$(PYTHON_REEDSOLO_VERSION).tar.gz
> -PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/9b/10/28d1492cc82a103bc06f18cb9a9dbb3a9168ab2e4068801fa0aa0c76b231
> +PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/f7/61/a67338cbecf370d464e71b10e9a31355f909d6937c3a8d6b17dd5d5beb5e
>   PYTHON_REEDSOLO_SETUP_TYPE = setuptools
> -PYTHON_REEDSOLO_LICENSE = Public Domain
> +PYTHON_REEDSOLO_LICENSE = MIT-0, Unlicense
>   PYTHON_REEDSOLO_LICENSE_FILES = LICENSE
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
