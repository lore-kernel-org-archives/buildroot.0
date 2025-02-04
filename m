Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293CEC02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F5C813C3;
	Tue,  4 Feb 2025 17:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UODPi2__dpCK; Tue,  4 Feb 2025 17:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC9F082149
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC9F082149;
	Tue,  4 Feb 2025 17:07:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB196185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFA5D60D91
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sqcxZI8jL1e for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:07:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C107560D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C107560D72
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C107560D72
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:07:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso58580185e9.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 09:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738688860; x=1739293660;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qRmu/8SNbJSaZlmYpVMSRO8ynTCF4Tg4TYnkqADYsxQ=;
 b=Pfvo5h4L/hXWzLaAECt3s1TTt2aokIl/4krcOF9vMCT22Ox1yBOUjSTDi9sNEO51mQ
 YghJ/9YJtMeY1lPaerYX6dVAxh24H7bD40vCk8svXD5+wzE0lshkyRrHlrJIL6Jtv46b
 UiN17grg1JOkEMV6Q1h0rBbMFxR5TUymAbYXUqseFyt27xFKSs8GrYGQdamUPsZG0fkb
 98SFGRRAnFU5z9i4YVJFgjxGwUifl4cbE493jSXkjxrYAAqiyaoFaWHyif7FGRKJ91y+
 pun25kmnMgGbeQ3ei4FaBrN7blkw3Q/C15eFqtlvjYXJmGs/O5MbFghab/7YawA9ZgOe
 n7jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbAJkKO8Va/3LXF08n1k6ngS2B495/7EcWKpULs+1bgLXiTVeq/x1s3pZAR0ICChYF+36mzesYJ6Q=@buildroot.org
X-Gm-Message-State: AOJu0YzyPRXIFHIQQ4bJuLK8FWpYjbP1vE2yY6BqQzLhOpJSnX8hXE1T
 KNI15wBWZHHGkhxqYjT0mhHMiITSNdTjGorYWajHThYZIy77Q/O7iUjfb7KpoBo=
X-Gm-Gg: ASbGncu0EZHp8lFhO1wMG6onILlt8T14cLtiStJ+R/PFD1nS3HxpqxMhulpX0TeQPrS
 57+DKQ5ijxGurrpcPpLpGLgvVtCRI9KR4t6YNUubUnu+lT5vknqGz3ub5Rjc6ORqY9ypqbFZP+R
 jkT0oKFVKNbcxXLcHyTCuI9DALVN+NY9jLHTdNLMhKVp7JpcbeMlwAJNyC21gy8qEYEZxLDF4CK
 xkvFPbXMltoOaA61JLAbNURGUq44+2+fOPLIBzSZMRjyne9Z2KRFYm3u2Fog9RAgaGw4DoxQMG+
 YXyO+cZMSn6uPsdzCd/xCcfiKvixfv8s15iGkSIln3FO1ng=
X-Google-Smtp-Source: AGHT+IE4JRS9c8Xu93C2M/Pzo5JjYk6haEqhHHlX3FVGhIP6jDjDGzBolARJtIs41l+HJ6d58oL0+g==
X-Received: by 2002:a05:600c:46cb:b0:438:a20b:6a2a with SMTP id
 5b1f17b1804b1-438dc3c8676mr254936515e9.14.1738688859720; 
 Tue, 04 Feb 2025 09:07:39 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c125f77sm16531325f8f.56.2025.02.04.09.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 09:07:39 -0800 (PST)
Message-ID: <a7f695c3-118a-4648-995a-36bfbb78dd97@mind.be>
Date: Tue, 4 Feb 2025 18:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250204163132.1575544-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20250204163132.1575544-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738688860; x=1739293660; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qRmu/8SNbJSaZlmYpVMSRO8ynTCF4Tg4TYnkqADYsxQ=;
 b=BTeubU0fDMjWOjJcKx6CpkAfN948BdCPygOfar5GOO7cp0Xa9bYKoN005eMMBqLgAF
 CUB3/KrsQ7QPLAkhuGe6qM1nMtAoDeSG6rVoQnNkLrNQpsO70ws1aFGdNng030csSLaz
 BlrnkKkUXScd4JLjiVOZV94r7rYC/ZSF68Yb2SuP5kUPb12qt93uwgXkq+xpTdJN7VIn
 lHb8SBqfbRvd9RBNZpZK5wreU+xaEPLqTUiiGkEsHvk2cN1oDAFvlwx7lL7R//ZVa5Ae
 ySgDo60QcUp+AZiwGaGCmNA8IwkDogc2ToCs+cVMxFooc4MPzc3x1yMSIvR6AF4w7paV
 Zayg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BTeubU0f
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v55.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/02/2025 17:31, Julien Olivain wrote:
> For change log since v54.0, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v55.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/9039225967
> ---
>   package/rdma-core/rdma-core.hash | 2 +-
>   package/rdma-core/rdma-core.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
> index 82d0ee784c..9e6844e1df 100644
> --- a/package/rdma-core/rdma-core.hash
> +++ b/package/rdma-core/rdma-core.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  2c842d80964e6c24994cef33508f26bcb06042b70643115a9d28619dc2b96f42  rdma-core-54.0.tar.gz
> +sha256  a02d128974055ffa92577e4d3889213ac180a79f05b077aeb884bafb6b46e957  rdma-core-55.0.tar.gz
>   sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
>   sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
> diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
> index 20b89abedf..4d427103b9 100644
> --- a/package/rdma-core/rdma-core.mk
> +++ b/package/rdma-core/rdma-core.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RDMA_CORE_VERSION = 54.0
> +RDMA_CORE_VERSION = 55.0
>   RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
>   RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
>   RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
