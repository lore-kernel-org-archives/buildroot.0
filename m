Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAD2CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B202F61341;
	Fri, 29 May 2026 08:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHJP0bNLKi-e; Fri, 29 May 2026 08:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD26614EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043353;
	bh=XVf9cYn7QJqpNT55G/R0pIZyg8ZnQxGJ6oT7k9vVT0c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lLwXTAuuK6OXHOM/JfEVyfg5Oo8RsjpwWPmtVz7eU3md/77DO2P3t3a+GEn2NECFK
	 ZWu8TVUIVeImTu0Zm/8MyCq/D3kubkPv9Dpjzm0GiY1wEdBE6G372U2/jIKkC48FRZ
	 au1yEXBAB0olBULInPF7fWlyO3QbMsE6IBlt91l6hRd6MB+7MP6iWbpYx+fnwp/CE+
	 ztpcmrl6abuRKhvCFkC3FACcsp7HjvjraIb5zsP6f9TEAZcciZ2vks3L0j3XWVQjhF
	 KBMpr7bZHV4bqfifV8YpSvRRt+Ug+ipLWdN1GlFivcWnGBjWtqFZgmNXMkuRbKjrqe
	 SV9kF1LkF7jgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD26614EF;
	Fri, 29 May 2026 08:29:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71F5528E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 614CA40B87
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2f3hsKASmQaC for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78797406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78797406F3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78797406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso68803175e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043347; x=1780648147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hNwHBcm0nJU30cCeZ5h1xZBlCGcY+vr+L6ZKyGMCdGI=;
 b=DLr9xBLhgHTwTiabVZuIXBZAEjizX5CX3gSMcK/o6WyiivHi2zUwdwrxgNOr9C25+R
 pHyCPzO0XXu9N5KESAFeeQVCqmxROYcwGBnGJJvC7qzTLOFp1iDpbSG/T5Qswqw67wp8
 ldEDxzTKA5cmTUJf+vyTgjwkSmdm7GXhwYrDJxDh9KZRtb9jWYlaHc2o3lAeiTNvzyAn
 Gv3EYvfqk8HIH6L1lHdeXL3bjfwa99u7DhEvv7tLDhNkQfTpQCzlONL9paYfaov4zZ8k
 B7+zvjMksMEpIInMH2L9pN9W0kewoQp/YUcQpLRJIRTgC8KH1n/5I69EmXvqc4N4zncv
 aIXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9z5zYpjaFIrQnoNLcp7Lysaw0kjASZqYIk/PuNnYhhpJZ7KXCopQl6t6ZduHDCfpae2aRW+0P0wOQ=@buildroot.org
X-Gm-Message-State: AOJu0YwJUmmIjwbcdY58decGyJQqUCRh0tKTMreRJdLiCkBKAaFXB+Yg
 kq/tIGpS6rotsjJ21b/cjTUyR0aT0KiwUkL8LBRo6WUbEzSN/nKzkkINiH7Ceb5x+1BuwpBf67G
 Yi3ey
X-Gm-Gg: Acq92OEgljwabQOlJQdVgMw65TMcUl4UImiSNkuVhALnwFda/nP2MgJlxKptMWFsOh7
 RnWtQITH7svdaHOrMw5ykBwYg1Du5tvifKY39yD0FStVJMZ8Ol0SVAH0vXbY3hYemjOzL6inaF4
 +h6D265idju3O5UG9lR6+lfpGZLH4CvyPr1HhbsK2xfWNbgF0Ei4MwG24aCJ7Eh78rCQZ/i9nh3
 k64+AkmASoGdfDMW8XCWuR7tLvQRM+nwKVY+NuUS+dRzcx2m+SYFP+do0JRLOGYtzrQ8Nzuba/O
 YQ2uQasjH0CO8mzWJPYqz/CyI7u8VnUdzV3xjN3B3Qoctw0r2kpccwgLW/WB3rA0F7IgUVbDqUd
 I88DzqOTA21ko4PXSYZlubzaurNRUNLS5Yy03MJ9zQaS4jxdbgtUQ24iFDdx9Rxl4hRMhM0cvPz
 tB2UNUTYMCxyhq67F5E5IVx+7oIcQZEKOkQ+BcbhUEXCU+lnJgOzNazX39sA==
X-Received: by 2002:a05:600c:4504:b0:490:548e:b854 with SMTP id
 5b1f17b1804b1-4909c0e4c60mr31548035e9.26.1780043347346; 
 Fri, 29 May 2026 01:29:07 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34c50f6sm2195821f8f.16.2026.05.29.01.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:07 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:06 +0200
Message-ID: <20260529082906.56463-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251019200644.3956464-1-peter@korsgaard.com>
References: <20251019200644.3956464-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043347; x=1780648147; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hNwHBcm0nJU30cCeZ5h1xZBlCGcY+vr+L6ZKyGMCdGI=;
 b=PCCinYVGscKrEnXe3/vkXCVw0lfSkHj0lD6Bq1Y8NCJvPp0cht4RCYQcY7rNuBTKwL
 Q79+1b/3zvngiJc+5CVCaXLo75F7bGNZLygxArhrT0tVOJt9Y/bujx5TyPwRsYiwVNKp
 SBe4V7UVY5sQxHK0zhIpjiKCKv8Mf195XhxXFFTb/VT9/ZKBELYYtCUjU1ICXq+vW690
 uswgKH9oyV8Sk1u4OACybr9+xW0ximaYZiiNtWIWP/H7Zzc9sj+4Pi/zAUjfmDNks6ac
 NO3jCoCGePxi4OUt0VhGjmESh/l6UcZJtpYhiiS0UbGr7k+/1bfgi6eVsiq6JhPRmFkg
 lW/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PCCinYVG
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.25.3
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
> go1.25.2 (released 2025-10-07) includes security fixes to the archive/tar,
> crypto/tls, crypto/x509, encoding/asn1, encoding/pem, net/http, net/mail,
> net/textproto, and net/url packages, as well as bug fixes to the compiler,
> the runtime, and the context, debug/pe, net/http, os, and sync/atomic
> packages.
> 
> go1.25.3 (released 2025-10-13) includes fixes to the crypto/x509 package.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 60d61433fc..1dc1b99756 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  d010c109cee94d80efe681eab46bdea491ac906bf46583c32e9f0dbb0bd1a594  go1.25.1.src.tar.gz
> -sha256  d03cdcbc9bd8baf5cf028de390478e9e2b3e4d0afe5a6582dedc19bfe6a263b2  go1.25.1.linux-386.tar.gz
> -sha256  7716a0d940a0f6ae8e1f3b3f4f36299dc53e31b16840dbd171254312c41ca12e  go1.25.1.linux-amd64.tar.gz
> -sha256  65a3e34fb2126f55b34e1edfc709121660e1be2dee6bdf405fc399a63a95a87d  go1.25.1.linux-arm64.tar.gz
> -sha256  eb949be683e82a99e9861dafd7057e31ea40b161eae6c4cd18fdc0e8c4ae6225  go1.25.1.linux-armv6l.tar.gz
> -sha256  8b0c8d3ee5b1b5c28b6bd63dc4438792012e01d03b4bf7a61d985c87edab7d1f  go1.25.1.linux-ppc64le.tar.gz
> -sha256  9cfe517ba423f59f3738ca5c3d907c103253cffbbcc2987142f79c5de8c1bf93  go1.25.1.linux-s390x.tar.gz
> +sha256  a81a4ba593d0015e10c51e267de3ff07c7ac914dfca037d9517d029517097795  go1.25.3.src.tar.gz
> +sha256  acb585c13e7acb10e3b53743c39a7996640c745dffd7d828758786bde92f44ca  go1.25.3.linux-386.tar.gz
> +sha256  0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f  go1.25.3.linux-amd64.tar.gz
> +sha256  1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5  go1.25.3.linux-arm64.tar.gz
> +sha256  3992bd28316484be0af36494124588581aa27e0659a436d607b11d534045bc1f  go1.25.3.linux-armv6l.tar.gz
> +sha256  68d1a08bf3567f330717d821b266a0be1c5080bd05dc238b5a43a24ca0c47d7c  go1.25.3.linux-ppc64le.tar.gz
> +sha256  a0b5ccd631743f01230030412fdc9252b18d96b4e63d44ba1c4e9469e79cfcb1  go1.25.3.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 535787c92a..85a40d4d36 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.25.1
> +GO_VERSION = 1.25.3
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
