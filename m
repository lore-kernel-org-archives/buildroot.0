Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B2CC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E93B40AA6;
	Fri, 10 Jul 2026 13:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceqoTKh0xtRA; Fri, 10 Jul 2026 13:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 492C440D8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691546;
	bh=eCcYVDur2PmsLcUQQAPAWTH6n98AQUIf1Rh6wj68Sgs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lPjkbV8VQ0gCr0yR2uuvt1JU453O8RZwGOdPGCOFGMscTF1YU88+1RKSDBBA4mZw7
	 vNIKwAHgF3aKROq+AqHGrUEKlUROGKeYXJDusS9L0DxZ9JK1kfiPfGuxbfAvlLYNZw
	 pgW9ate2KWCS2ueET0TTiAFPKqcJTPAw+jlSmrx7V7KOeHeThTQOZwJ4er0APkUOxg
	 /0wGS2xFhWt3HnRn6QlrIRAe0Ed1BMmUThQWJRTjxLpYxpSfKyc9ptyhjBU9W7zSPq
	 OFOB4V+ft8PO9VkvDP6LlX01zwDpsNzQHnKmvR6mJSmJ51yR1JmxtIfn+JjUqju2wo
	 NJaAakVeXM/yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 492C440D8A;
	Fri, 10 Jul 2026 13:52:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 752ADA3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AC8340D74
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86uMRtYnSOyT for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B3FA40CF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3FA40CF0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B3FA40CF0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso8932025e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691532; x=1784296332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qfmmiij7m7trI1pqLa7QTvCIakDi/mrAEO6PkiYplew=;
 b=eK6viLLflzR8yOu3jDYA8NiYkptBKYnDIlBLA9vs5/stc/gfueyuPpbssc2kyhFRX1
 YSz3+H2U9EYTbDTLVLqYc8wm6zV3EKF5v9t49gUmPoe6f3YhwqLDnfyORsR7ZvFcz87y
 hpgo1f9SxaB9L4dh7Ih3HEXCyNZQqTjtO0gZFCCLUdvpT7R93sR8ewLJOnWb7f86EvLe
 dpDWh95zc0QwREq4KtPFNY7jYj1AX2hTMmI8pIwfpJsC9LI5o716zE1B7IfPN1DkYPcW
 yOOC/89zDLATs1pFYlKtqcxd+MncJREGp0al4g1TeOLadUHw8IYhPjwvU2Hdd4w4SFK2
 euXQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdjX6TTEd/BFZLhrbnutGo6etf9zTQk2KWX5aUUvJxPZrXFvgEP4TPgnpShdKiKW0RCkxjYXITV14=@buildroot.org
X-Gm-Message-State: AOJu0YybxDGjZ5iKldKGThTX0TP3YKCXiDfaFqmEY3WgVCmQJ8ekfvnH
 xpsBuv2TcPUvDh38GUapw1j9mq/7Tn/HuQ49dNwW4E6zehnBltVbTNXjna27LiWr7jAkbnfwO5C
 K17bM
X-Gm-Gg: AfdE7clMQJWfAthzKARWlxPd7WdPKjnRVSgpTdgx7nEyiAsY4eqnY/un4SNhthu6JvG
 KA98P9Od4F5Lzi8hxwfJOIh360fQl2rWB+GGBO7aVD2u5dwlOFwNXxTnyt+MpCIZsPkQHF+pb1o
 GikVTN7ZQXEgYZ7qg+0qPkRnoXfe1e16MJ1v3XVtvIkl9YHd1e13os4RO4b1UZMj74eWdrACvoq
 aT/P7XsUE3ayoHgCn5uCYu5zyjjANnu9aHi2gbI36cwUBWeP+4gCMGotCT3YPuByr2Rn15C4kpV
 jaEgej2xJIDMqmqrubgkrG0iEFKdN77v2sYst7gB5Wy5rDKI38fxMlzsSEbUkuDqVBUVXrehrcQ
 R6O2vtZzOhYKyrDA+6d7B/aG92JWKHaDR/l6lVr6CVSQ9BVuBqMlzSt/Vh24J/O3E5g2V+buAlx
 FbHt+zXQ==
X-Received: by 2002:a05:600c:4715:b0:493:e311:5f10 with SMTP id
 5b1f17b1804b1-493e68a0d36mr125546175e9.10.1783691531939; 
 Fri, 10 Jul 2026 06:52:11 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb73b161sm126499255e9.9.2026.07.10.06.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:11 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:11 +0200
Message-ID: <20260710135211.760447-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <akYVJ5F5kodcxrfK@waldemar-brodkorb.de>
References: <akYVJ5F5kodcxrfK@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691532; x=1784296332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qfmmiij7m7trI1pqLa7QTvCIakDi/mrAEO6PkiYplew=;
 b=Puvvijg5sY0qn3WyBtE4cN92sBaFeS0GOVNBMHPnnjBrpNAsaKVeyKS2YrefHd18Nf
 hUkBnM7XOuvjgLIGf6J2mF0Qt1O1GCJ3VIERyk4j9K+mFQZvePUoNaaaaPfarIkOx1o9
 /n3r1tAw6eGqlPWUHyN9e8AnxZ+CE2ie6xNFAwxO0mV76FURI3KfY8NX7FXn0pg0/jdi
 NL14AYJBOxN8KEa0OcAiX9HtGvqMg3YPnv4WTrNppXaHhMHlfUP2OowMbEKx4gxjgn8g
 +9QYPHIaGcMx6eBRay7gPNwBjJDwfrJKyUHsXl5zvHk8rsz/4CZoQwWXNM6gqcfKD0dT
 29Gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Puvvijg5
Subject: Re: [Buildroot] [PATCH] package/nginx: security bump to 1.30.3
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
> Changes with nginx 1.30.3
> 
>     *) Security: a heap memory buffer overflow might occur in a worker
>        process when using a configuration with "ignore_invalid_headers off;"
>        and "large_client_header_buffers" with large configured values when
>        proxying a specially crafted request to HTTP/2 or gRPC backend,
>        allowing an attacker to cause worker process memory corruption or
>        segmentation fault in a worker process (CVE-2026-42055).
>        Thanks to Mufeed VH of Winfunc Research.
> 
>     *) Security: a heap memory buffer overread might occur in a worker
>        process while handling a specially sent response with decoding from
>        UTF-8 via the "charset_map" directive, allowing an attacker to cause
>        a limited disclosure of worker proccess memory or segmentation fault
>        in a worker process (CVE-2026-48142).
>        Thanks to Han Yan of Xiaomi and p4p3r of CYBERONE.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  package/nginx/nginx.hash | 2 +-
>  package/nginx/nginx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
> index 5055b4bd57..6c3afa889d 100644
> --- a/package/nginx/nginx.hash
> +++ b/package/nginx/nginx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  7df3090907fca3cc0e456d6dc00ceb230da74ea88026ceff0affc29dbbd9ac4c  nginx-1.30.2.tar.gz
> +sha256  e5823dc6f45610993def93ebf6cfce68264af4958c77e874b7d20f3709001b8f  nginx-1.30.3.tar.gz
>  # License files, locally calculated
>  sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 3f6aecebef..ad61ef6140 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NGINX_VERSION = 1.30.2
> +NGINX_VERSION = 1.30.3
>  NGINX_SITE = https://nginx.org/download
>  NGINX_LICENSE = BSD-2-Clause
>  NGINX_LICENSE_FILES = LICENSE
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
