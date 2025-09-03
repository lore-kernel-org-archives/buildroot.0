Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59953CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 17:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02DF542184;
	Wed,  3 Sep 2025 17:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIUewzmbj94b; Wed,  3 Sep 2025 17:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E8B418B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E8B418B3;
	Wed,  3 Sep 2025 17:24:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B83BD10E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E0AB418D9
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBcdUI_JRs49 for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 17:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BA4741898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA4741898
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BA4741898
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:24:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3cf48ec9fa4so125094f8f.0
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 10:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756920263; x=1757525063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cPRaOed7s9puT06+2HqqcHWDRPwoLvUi4/FWjE+U03w=;
 b=wgr4UGX8mxmWT/3lKG8gVy4m46u2g4JvQ0vrY9b/iZPpUbcLIJQqGGS78Hbcq23Z7c
 HS1iaZayqUq2spbfg2pa9eQQbTMSYmXYVZTVq58SOZkCEqCFMwTwTmFQqyunCNoeCzTp
 4Iu4ov1+g2GaxVhL7SUClrM9T7XyS2RwH65GVuZuFtknnG5QEmtFQjxpgPsPl+bROdij
 ZqH68WKec3rALSeZoMTCglL4VxPle80hU09ZK69bABqx/ZF5hh8l8VpcCFxb9DH/nvNu
 mRtvhiRQM/ejW2qpcuS/kuILkoNCLla6Pb/VjKStrb/Lcy9zUdk0LJUnsm8PLsoHDAWc
 xWrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6OiloC7Kvp/EJkWBm9nJmPYbKxv0GjU98rcy1eJ6WCIjAnDfEyBlEra9viCDQ7W+ZaecDxBX+n8o=@buildroot.org
X-Gm-Message-State: AOJu0YzKngAS66sJmdXRE2SalYTH4uxUjCMICdmcmndoNcHdEQ5ex2ni
 AgU8HFEQw5Va429a1M5VMRL1HMCjv9KdNIpjOPHEJ+pFu54q4iKtPj5SySAnl27SYheOXroA/fN
 Q9Ln6rq0=
X-Gm-Gg: ASbGncu9vVgha0da8LLg2ijYwi0YcR34wamT4Vv0iCmOSivkwTe4oSbLzRIcH9Q6YBk
 5gZ2PS3OAG3ah7L99nONW3qoxOF24sMwzP5/H9DuQiB8wJ6XqDrHeq+EgUZSriaraCHpjbo8O9q
 6oMiG11GHIbwNu/e4uR4RsyhjGjInUwlVyq462Mb+9CqnhZ+VUsFnm1C/WimQ9oXGMAu+OujczJ
 kdywy4PpK1WviLiawNNDgv5Rn3CdBqaNayALvD3q11w4omhxaWV0ldF/UUf3JgK6UGrT06oiIpb
 2kB48w2vebGYa9GsvI5AqZ17wGSxZWmGAayY1trJYeaLEhdbxG/VYHl4xOONlAB5zs4jFKvS+xk
 WhMOgduZk+hY2SOA48TJlgZckT06ys+N9kPfc
X-Google-Smtp-Source: AGHT+IEz7dMlyz3ce5eRxXo4N3KJ4Til+fl6u3C3dm+9dTxgAzSCzYN6VrhDMBQJB6tR3HtgEYkz0w==
X-Received: by 2002:a05:6000:1a89:b0:3cd:fd51:f6d1 with SMTP id
 ffacd0b85a97d-3d1d99cae05mr11786937f8f.0.1756920262609; 
 Wed, 03 Sep 2025 10:24:22 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf34494776sm24146475f8f.61.2025.09.03.10.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 10:24:22 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Wed,  3 Sep 2025 19:24:21 +0200
Message-ID: <20250903172421.321317-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903124306.6936-1-titouan.christophe@mind.be>
References: <20250903124306.6936-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756920263; x=1757525063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cPRaOed7s9puT06+2HqqcHWDRPwoLvUi4/FWjE+U03w=;
 b=AixZWajzKKK0k/X3cq7OvKo62y8PfsgFWdMCtXnOxinh5Q/C/aeehFe2s0UWAkHs5+
 1nCRYFc5MjUd1utun7C7niJfVt8vv5T/7B3ifEXAC0UvrNXQBz5T5DOIdMkgIw7nvK0L
 i9SrbmAMRTlmjNCx+Udyft9S6BDfMvAxhinGBXPoJeLCPw1UROXkvHOHhAXkRseLiN64
 PtdTRo6Pa179JmA0H3RaXM0yagIUMb0Kh9dZjETn0s36/RMGy7noxnRsGEqLFjSmum52
 v7L6J3dWHALYIeclxQi/GzL1TvvN4AHsMg1Ie8RQcnKcZaPZ6u0nK7DNhr4qXfIpQC0D
 mE9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AixZWajz
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

In reply of:
> This fixes the following vulnerabilities:
> - CVE-2023-5341:
>     A heap use-after-free flaw was found in coders/bmp.c in ImageMagick.
>     https://www.cve.org/CVERecord?id=CVE-2023-5341
 
Seems like the CVE-2023-5341 was a false positive. The fix [1] was already part
of 7.1.1-43.

[1] https://github.com/ImageMagick/ImageMagick/commit/aa673b2e4defc7cad5bec16c4fc8324f71e531f1

> - CVE-2025-55004:
>     ImageMagick is free and open-source software used for editing and
>     manipulating digital images. Prior to version 7.1.2-1, ImageMagick is
>     vulnerable to heap-buffer overflow read around the handling of images
>     with separate alpha channels when performing image magnification in
>     ReadOneMNGIMage. This can likely be used to leak subsequent memory
>     contents into the output image. This issue has been patched in version
>     7.1.2-1.
>     https://www.cve.org/CVERecord?id=CVE-2025-55004
> 
> - CVE-2025-55005:
>     ImageMagick is free and open-source software used for editing and
>     manipulating digital images. Prior to version 7.1.2-1, when preparing
>     to transform from Log to sRGB colorspaces, the logmap construction
>     fails to handle cases where the reference-black or reference-white
>     value is larger than 1024. This leads to corrupting memory beyond the
>     end of the allocated logmap buffer. This issue has been patched in
>     version 7.1.2-1.
>     https://www.cve.org/CVERecord?id=CVE-2025-55005
> 
> - CVE-2025-55160:
>     ImageMagick is free and open-source software used for editing and
>     manipulating digital images. Prior to versions 6.9.13-27 and 7.1.2-1,
>     there is undefined behavior (function-type-mismatch) in splay tree
>     cloning callback. This results in a deterministic abort under UBSan
>     (DoS in sanitizer builds), with no crash in a non-sanitized build.
>     This issue has been patched in versions 6.9.13-27 and 7.1.2-1.
>     https://www.cve.org/CVERecord?id=CVE-2025-55160
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>


Regards,
Thomas

> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index 2983b511cc..f260a0e0fb 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  ceb972266b23dc7c1cfce0da5a7f0c9acfb4dc81f40eb542a49476fedbc2618f  imagemagick-7.1.1-43.tar.gz
> +sha256  b16415e8694a2e15e5282d64fc7b358f309ff3a514a90eb5da268676c772de3d  imagemagick-7.1.2-3.tar.gz
>  sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 6bbda40396..30cacc7f1a 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 7.1.1-43
> +IMAGEMAGICK_VERSION = 7.1.2-3
>  IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
>  IMAGEMAGICK_LICENSE = Apache-2.0
>  IMAGEMAGICK_LICENSE_FILES = LICENSE
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
