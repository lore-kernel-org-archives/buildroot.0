Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5207EC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29FB04064B;
	Thu,  7 Aug 2025 18:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jY7dbcKcvQQE; Thu,  7 Aug 2025 18:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A93FE40650
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A93FE40650;
	Thu,  7 Aug 2025 18:25:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A3A64C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C4D76064A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYFNTxfN-gfC for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:25:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3647860647
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3647860647
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3647860647
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:09 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso8575665e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591107; x=1755195907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUEisZhcXaEZ/1sMJzEelHq/9xrPz8CYcwZIRAJB0Jw=;
 b=pzt+pJDoqjAeR961/yfxoQJibWTeqyhPgIjAjbbAs8AUF5SupZqUqFRofc/VJA+Kz5
 o58V9ejzd3TAvpey+WvMIRv54DIL6PozYQGr3bvwK5c/pDiWGsNTM7Bw30zA8stz4+0G
 H6c8kaEQqMOy9dNF1ZaV6iRVDLlvW7dBPLl1MEoEryDn7bYTQiOBZt+mxn+ccJwH78Ue
 9/TrOjAZ+I3EyXaSYzeI3cM9KSsMi0yiy3SZRRGJUjkj2YfugzkCXYXH40iPmy+ckxMN
 k6rRAbAmtonGPZ+fte7VbH5DUtHkm0jREMpDXJN1ojMn1cCKVxVKMZZGzJMMmPTRMt8a
 Dtyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGeOqSg2/j4noo/L4Qv9Vcx2Z9m8OoJRdPXb53lIsLhIi3lrKC5XTfA+59OE+qwk9Rz7IqMk9/XIU=@buildroot.org
X-Gm-Message-State: AOJu0YxjRfr5cFF4JY7GytVDJ+qHO+2f5UQLqic7PLYgx49kXoTIJKFc
 5pdFZUxvMzzGFth8MpUOctSGMTC16m5yeSq6uoDWtxo5MaB+ClcvgLPDYllHLIjIGZE=
X-Gm-Gg: ASbGncuqUmSYmxacHjorVo7OQmXKyJ/rgpZSbThFXtQEsqX/TocPy9r4ky0ixcNH/hR
 lfJ+I2N1hzwDcp4UP7L6Ymu7EODPeGbFXcm3hUpNscxhoaR7q91dPNZ0q/4wgr9cULimOpeWW5K
 1AeAtIcC+4DTnhZkfvJRaJOUzUTFmBuJc1x+fINpfczguNFEFCuBAUNLjLQA+ovrOJoWY9wFrcx
 O7HE9Z07aEVOIPgAJN1l2UujnNi8A/Q0IEtMc8Q6dvoogSVPn1HfOJg8wedR+AsDKvHTKECd86H
 Hi2bh1xBnsux6OVNRrhtG2oFXB/F5Hb8lo3kKQdrqyORzK3c8SFmgqzoNXBUsANy/iwnTzKxe4r
 USFlBCIMG/Oa8AqabVNNPbw6k
X-Google-Smtp-Source: AGHT+IEG/wUWvKdvKEtAU9r9UX1rCpnyn7HA1M45HAICRDkdruG+oon6c82LmHbnd4zg9m+XO9zOtA==
X-Received: by 2002:a05:600c:4f4e:b0:458:a7fa:211d with SMTP id
 5b1f17b1804b1-459e74b4fb1mr66168725e9.29.1754591107254; 
 Thu, 07 Aug 2025 11:25:07 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e585586esm112434995e9.13.2025.08.07.11.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:25:07 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:25:06 +0200
Message-ID: <20250807182506.726664-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250707081050.1996244-1-titouan.christophe@mind.be>
References: <20250707081050.1996244-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591107; x=1755195907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUEisZhcXaEZ/1sMJzEelHq/9xrPz8CYcwZIRAJB0Jw=;
 b=AtCf3LfrcthNywJMtP2QKODnbX1LTiRerryrka790CCUFVLj7GMGPZgOwv4BwTXMdu
 JZlTWl+2zKM0/7LSwv/EbJiIUrLxwnItUE3xJ6URdLE+WQuO4r1BIPodvUAc8xfJ9m15
 TNTDrpCIUAjZkhyexOv3VED0tdLbFE0xyxuUB02ml8ZHuggm0fI/7yB2TXE3NCbr01kB
 eqvpD1h8qcHT2zs9v9rZKifhWfjcECfbmEQ11SILwL+c6DrMshS9EfAVGmH70JiysyXn
 SuzShwnRRGGq2QvQhuFhuqc5sUdpU/3sdX5Tu+pUBi5RigaQhqtO9Nx6A/UzfTORJNVf
 0+CQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AtCf3Lfr
Subject: Re: [Buildroot] [PATCH] package/redis: security bump to v8.0.3
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

In reply of:
> This fixes the following vulnerabilities:
> 
> - CVE-2025-32023:
>     An authenticated user may use a specially crafted string to trigger a
>     stack/heap out of bounds write on hyperloglog operations, potentially
>     leading to remote code execution.
>     https://github.com/redis/redis/security/advisories/GHSA-rp2m-q4j6-gr43
> 
> - CVE-2025-48367:
>     An unauthenticated connection can cause repeated IP protocol errors,
>     leading to client starvation and, ultimately, a denial of service.
>     https://github.com/redis/redis/security/advisories/GHSA-4q32-c38c-pwgq
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.05.x. Thanks

> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index 4dfe1543d4..c66223f2da 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  e9296b67b54c91befbcca046d67071c780a1f7c9f9e1ae5ed94773c3bb9b542f  redis-8.0.2.tar.gz
> +sha256  33f37290b00b14e9a884dd4dcba335febd63ea16c51609d34fa41e031ad587df  redis-8.0.3.tar.gz
>  
>  # Locally calculated
>  sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index a4b6b4d652..5ffb2a929f 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -REDIS_VERSION = 8.0.2
> +REDIS_VERSION = 8.0.3
>  REDIS_SITE = http://download.redis.io/releases
>  REDIS_LICENSE = \
>  	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
