Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E641CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67ABD40DC2;
	Fri, 15 May 2026 13:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewL8dCZAlKGG; Fri, 15 May 2026 13:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3CD741155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852061;
	bh=pRfqNwkkUt1F3RzrKmYUfYD5vymWGrj6pYnsNPrPPBo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RS0eWCZcZNTopvetGpWQsIvJZKfG3kx775bY04QYDV/8RL0JmaBS426jUvoTGklRT
	 n/cre+qzCp2QxFiBlM8fWL/4tHOqkcsbuAnvqgCYQACkeOCuWuNGOdUQVIdmZ0VgNZ
	 +/SANW/HxjqQA4knkCE2d8zzyDYphRtPDavCAQX+sWKRc6Hu+DSj2rNJVb8J6rZQD4
	 3zrh3vusCGjpymHFI5S6YuS6M4FifiL6ITElMb5y2Ydw2XqncuPTo9gq6t1MWWteVF
	 j8FF3snWT3biqddm37K4fzqegndGZIMTLyFxW8L5LJGJ7VNNujpZeNId/pj6W9DOOZ
	 jPBuOPFzUQvvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3CD741155;
	Fri, 15 May 2026 13:34:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 344A436E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2612940E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIq6jiL6b8pj for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DFDF40E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DFDF40E23
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DFDF40E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso50185335e9.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852055; x=1779456855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HZ0M5xQdDAt+bbNWr7B/M4tZzbrPqJ903YXKWU057wU=;
 b=APA6qkx9A8j96NJd6h3RNgXQreBPclU4Ymttp2TOfiIxpls50wa/FDXdh22JgbrwCn
 T3r24OIO2JLjyhAtVudJm4w62WZ+tuudAI04c49ereAtu6AWndddSZW/EEFmaIyEe56m
 0LlAtFfGopMhYMxf6Zfxl8A8+m2qhl0Jvcgx0D3Ra9Zmak83NyayuG/WMTXJeokD2e0s
 DC/rTx9vcF6E8qlN+/7hrpUgXB21IPYC6R6WbIs6j39zdEsmqfXs+Nd2X9C5C82h/ht6
 pJXw4V7JVmN78WzfLB2mrKOO6HdLB0AQcnPD9TVJFPTmkeRS1Ok+cvrZt6mRjJhELAup
 XEfQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/akb2xNBEUY2I9JdTkwoU6vYVbQnTTVoU1E6w1Jp9QEBBqtq+eKBJtKq6yjPMFw7ZXXPj6F+NR/qU=@buildroot.org
X-Gm-Message-State: AOJu0YyRe3Cx+ITJur4R4Wa8fvXud0I7lMqvRX3AKIR5Y1GOqNZMm0p+
 JVCPA8GC7P6dr++LAsXOQkaekTFGl78/TXY7/PrQvNPCH4rx3aiZzNE1MfXiEVvlLFE=
X-Gm-Gg: Acq92OFGn4Zypou3atOiAufFcNL2BOuB/RMgSJMRkdWUj+QbLR2Rl5W/jTbjzLCnVnt
 sS6MC8pErhvCr+LLz+HIbmMofA2tFh0LX5jje6CtzoHRP1BGPoSYSBqZsXpeSb2g/1Y1KBKKt7/
 g7oE4hagIf/JEunZfuJev4LF7dTwDu2qkS3rSWXMDIcUHe+6fDzGuWMsaj8FXRNChhvTkx2KrjJ
 L1G05GyryO39+gSulZ6kAAlBKp5yODxSUcziPy6pr07qiR1SjTWXruwVaLqmnZ7kcDt0eTLRpHv
 ERlE7Y3UW8Vi+9895n6R1D9YQN60vn0HmTI8IDAyD9r9p+IJ+s602+YZocWWAl8hZQhnv/zQxF1
 R/9czKl2qBPIOH/XkAebetOCDu0Knc2MV9h2cmOPR36rQFV6xIX9DpcNS/fKOs+qCvx0YpOV/U+
 3o1IUJjWPEhWBiEW34I9JOKiaiMEhjtvRRPMN+qz4v7pNlaBHsCk2NKME=
X-Received: by 2002:a05:600c:3f0f:b0:48f:99a9:bbcc with SMTP id
 5b1f17b1804b1-48fe60ecb9cmr50689365e9.10.1778852055095; 
 Fri, 15 May 2026 06:34:15 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c90b27sm67339835e9.8.2026.05.15.06.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:14 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:14 +0200
Message-ID: <20260515133414.316613-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430044747.27619-1-bernd@kuhls.net>
References: <20260430044747.27619-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852055; x=1779456855; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZ0M5xQdDAt+bbNWr7B/M4tZzbrPqJ903YXKWU057wU=;
 b=gWXqXBoRFc4ZaaeJ0Q6OSIoG73pJjPBlGf0iqsu1wZ0Bg6kMvak8rFL3RPVze8i1Oo
 GewO0zzHCFDecKliGQUyFz/YWpweZfSDdJ85LTRNdYxAyF5qM7yuyxDiETlVWXfetNgX
 n3pQPujApOctRQZUVgOgqZblHd99IgrNEwZ2/TFVkH9J5o9sHSMeZo+mehA/WBQ6zHEd
 fpJ5ixAKNAx19f8NM/Atey+Qy1/7q48hZc6XpcxTWSBxiOdlH83xKRX2y3ueWTPhciXk
 I6ZTKoDtcTYj5WQ53cYh8tqOShp2bU6UKDRsnYjP+PWq7tdbMq8DqxyT3KT1YoJGS5xA
 hEHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gWXqXBoR
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: security bump to
 version 8.20.0
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
> https://curl.se/ch/8.20.0.html
> https://curl.se/docs/security.html
> 
> Fixes the following CVEs:
> https://curl.se/docs/CVE-2026-7168.html
> https://curl.se/docs/CVE-2026-7009.html
> https://curl.se/docs/CVE-2026-6429.html
> https://curl.se/docs/CVE-2026-6276.html
> https://curl.se/docs/CVE-2026-6253.html
> https://curl.se/docs/CVE-2026-5773.html
> https://curl.se/docs/CVE-2026-5545.html
> https://curl.se/docs/CVE-2026-4873.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libcurl/libcurl.hash | 6 +++---
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index ad34083745..549527b1af 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,7 +1,7 @@
> -# From https://github.com/curl/curl/releases/tag/curl-8_19_0
> +# From https://github.com/curl/curl/releases/tag/curl-8_20_0
>  # after checking pgp signature:
> -# https://curl.se/download/curl-8.19.0.tar.xz.asc
> +# https://curl.se/download/curl-8.20.0.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df  curl-8.19.0.tar.xz
> +sha256  63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896  curl-8.20.0.tar.xz
>  # Locally computed
>  sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 3d00a4a33a..94d7ec677c 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.19.0
> +LIBCURL_VERSION = 8.20.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
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
