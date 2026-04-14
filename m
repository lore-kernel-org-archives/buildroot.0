Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A89F9D0D3
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD73E42B45;
	Tue, 14 Apr 2026 15:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIpWV2n5UpvC; Tue, 14 Apr 2026 15:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2DE742B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181467;
	bh=/c5a96UdaM8GulWgf/UMTQd0uxkBWofr1EEOLR+diEU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ILJTijG+DjnlEXaEecci/yrRRZqAIqpuqBMbAI+WQy12bcFpqvAF2bw6OoxXaL9Ci
	 WOvPgaTtMrKYsPkQooIP65hWQ/7CQY2HCQJSlD9SZlgxWYIQ1gjKtp63G8CjRBiEHn
	 dZAg0JZDf4QxYDTEwH2Tc9XY8J8QhNXVIFBiVI9UGqvOvGMm1l86fybnIpUexomRNB
	 QRAmRqDYhA7umWLm9vQ/5agGxgpvNE6WfKaCMrs9FtuwbC3tJhVxHaFMjfmavBT3cg
	 BM+DCpyltjGf0WpRABsGKcvaHGHX1BXln91QFpgh3T+MXees6oOBNlHyn5bMkqZuV8
	 mc5yBUcdTCxhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DE742B0A;
	Tue, 14 Apr 2026 15:44:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72499283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 584D342B08
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KID-TWO3bCQR for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4050E42B22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4050E42B22
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4050E42B22
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso61229645e9.0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181462; x=1776786262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KnNz+AlXXY/57sm/zr8aAoPt/juDPNMka08AOZ392fM=;
 b=Sijtgajn6eNkl1xNSSr/cWpsAe81CNHUZ/+KR5+IwVRAu1ISYkwrPRFcgmsKiN88S5
 ywhgTAy9wNVTdMdnpaXMmZVAnbnNuKYVEt7XgTwYH2U70xYWiNtQqplUGKF1sYzZyUMB
 E998lxS9rJ9oTh+rRbyfluYg7I25su1qyWsn6RnmjDUhK+JzZUZd27zM9emkrDAX4eRc
 KcsOTlRz6Cv3hcdQ1ANgHA1o6s8ONlpWn0pvE9mZP6Hebxacam/6zLh/RWa8OyypP2+x
 vZi2IKadbvedH+LQoQ0Cx86lKbrxHL4pidnNirFOiglQHiT561ioeDjwKMyqEZLZ3m+A
 SK8g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+BjujEINnbUXkyY+t8wORKpO+GTxfG0TkfVkUqeyyDi8c3rS7Br0UKatdOL7CxQQOrF0Okv/yTPMo=@buildroot.org
X-Gm-Message-State: AOJu0YzEM8gKY18bIPH+dM43PpQfZTVn0pcLJXjMwzOo8/O4KdAErAO2
 7LgvBrbfdN3PkpjuW/xawEDY4n6L+Y769vB0sTz0gPrvysc48oT0MkefvgfoCbOkwq0=
X-Gm-Gg: AeBDievdOnAHQGUfLmysG3djrcmQBSf2mk86W9Rp+Ksf+NzIGY964GpmqF/+4v5p5Y4
 S8bxkxVnpNgm7BH0h1+Lxts9OAtK6OGwIqxBkb/I8UMEiP7DizGsCdlTIQZx/R8D7g45SE7rHKY
 oB3E5ftTFS9gXtJ5DRhqKm15FoYLlDaWC7A6gN50QsEJY8WvyNLi/fq7Evtnc7aHlRswUdlwtFo
 hycNGsd46jaqf4bJSXdUX/+Uw/y/uAGtaNNs1nklWXaT2l3jrEIWCX1rWqYBb7Xvq/P7JXluPOK
 duzDh8NRMVPwMJJg+foC+qcEDVppeBz+CsJJ0339uKI3M1uRKyD+pFQ7W55/qQlr1saVLPNOH2s
 Zg7ldAaQnAix5DbjUZBC9ybOrHH0eAN16nPs1M+FmQ6MsH2U+VUi9D3w+c0UvIJEoPOHYUkLU2H
 MHa6Wok0TG+60xdRxP
X-Received: by 2002:a05:600c:4ecb:b0:485:3cef:d6ea with SMTP id
 5b1f17b1804b1-488dc76d45amr213544885e9.13.1776181462224; 
 Tue, 14 Apr 2026 08:44:22 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede1e826sm120503835e9.6.2026.04.14.08.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:44:21 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:44:21 +0200
Message-ID: <20260414154421.334823-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260203224414.192218-1-petr.vorel@gmail.com>
References: <20260203224414.192218-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181462; x=1776786262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnNz+AlXXY/57sm/zr8aAoPt/juDPNMka08AOZ392fM=;
 b=blG2U4nTQML2ZeR8FfLsgqEdRNDT2JwsBp7BSVQmBJ68m8fS6ziDyGMSb9wbpF0i7e
 MadpXQYYPcjdlANdgZVGzTdixWoSeQ+rSe/LZLJh02eX5WiVBfoxrnt4+DWfL7iGpqpl
 zST5ViRlumuzNDIxBbzqowi2qK/Ktmk/f2BFwhhajPhFA2Tt1C91v+/+2/rDp7JVWHAc
 +m8FENDa7gnW0zY5/n3su4IwBFHqSWZ+yikG1IuBtsdA9TzUuxaSQl3d/5c2I2To3j5G
 nHtebgFaEXQtqc4eoOyu9Ja7fVBjKsRkrdKY9FaoZouuYLxhs0cH+C3GnHSsru5CZM47
 jA1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=blG2U4nT
Subject: Re: [Buildroot] [PATCH 1/2] package/ltp-testsuite: Always require
 host-pkgconf
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
> Require host-pkgconf only for libtirpc is not enough because libmnl
> requires as well.
> 
> Upstream added it since 20200515 commit
> 553ca8ea3b ("net/route: Add netlink based route change tests")
> using it in m4/ltp-libmnl.m4.
> 
> Later, in 20210524 in commit
> 6e17e2ba13 ("configure: Improve error message on missing pkg-config")
> configure.ac required it explicitly:
> 
> m4_ifndef([PKG_CHECK_EXISTS],
> 	[m4_fatal([must install pkg-config or pkgconfig and pkg.m4 macro (usual dependency), see INSTALL])])
> 
> This fixes error:
> checking pkg-config is at least version 0.9.0... ./configure: line 7419: br-mips64r6-el-hf-glibc/host/bin/pkg-config: No such file or directory
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Hi all,
> 
> It fixes failures on these old toolchains:
> * br-mips64r6-el-hf-glibc [33/35]: FAILED
> * br-powerpc64-power7-glibc [35/35]: FAILED
> 
> Although both removed in 8bab0acff6 and 573a113edd it's a valid change.
> 
>  package/ltp-testsuite/ltp-testsuite.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index e4e3ff8717..12db8f2d3b 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -11,6 +11,8 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
>  LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
>  LTP_TESTSUITE_LICENSE_FILES = COPYING
>  
> +LTP_TESTSUITE_DEPENDENCIES += host-pkgconf
> +
>  LTP_TESTSUITE_CONF_OPTS += --disable-metadata
>  
>  ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
> @@ -51,7 +53,7 @@ LTP_TESTSUITE_CFLAGS = $(TARGET_CFLAGS)
>  LTP_TESTSUITE_LIBS =
>  
>  ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> -LTP_TESTSUITE_DEPENDENCIES += libtirpc host-pkgconf
> +LTP_TESTSUITE_DEPENDENCIES += libtirpc
>  LTP_TESTSUITE_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
>  LTP_TESTSUITE_LIBS += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
>  endif
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
