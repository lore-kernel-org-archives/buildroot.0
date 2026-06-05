Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5366CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79DBE61133;
	Fri,  5 Jun 2026 12:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCdk5zq-yiE2; Fri,  5 Jun 2026 12:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8495D61119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663841;
	bh=sf57/+eO+b6JUGNrefA92vScVMSaudLRkQC4vjykhuA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=epasZBI4IQxORafFGMgfsGGOZPDT6RqpTwi3DYvQTreM4xk2XhLzJyc3pG4QC1Omy
	 U3iZn0kR74oNd4MguV6hXWDG3G2OYPDhYpjJqjqNo0euRZ9Tg/zLQoyjU2maLo3tPT
	 QlsfCE59k8FQZKAY9T/AXozWgFRlebeiyLAnX7HXSbmfzBY0mJ5hn+y+aWG0yfogHr
	 OkOUMZMoh/nkxt3taU66o/p3qLudUKXKwPk01RA2twE/EhpsZrTtI1KwT0kudDe3CE
	 me4wP02/3NJNpXH20fAwMXSLNdWDsT4/Ymy8LEDR91QwcCGRoYiZxCM+cit0cvHU3G
	 7347uW82Bhcrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8495D61119;
	Fri,  5 Jun 2026 12:50:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0854EF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDF5F4037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3VfDt4ON9U6 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C71AD4037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C71AD4037E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C71AD4037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49068493267so14188635e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663832; x=1781268632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3uLw7gmtgcqarozzpDPNpdXFNcJUxMktbhY+DIo2t0g=;
 b=iJzlM8UC1e7EHheaDKGUIIrSvG9K879O/6LTOAXMM5ouIlFCWjPjY8f1Bs/y2SRQ13
 QaF389z754q0ULWAPuAoLnlJIuSYhHrew3FKtZFzFr78lLt6pYqzFBIvyZLAXvExGi/F
 z3wT2tPkldg4IxZ+mGr6U4/l43YoXT+CHQ+EZoTjWYt4CArbK05hcoL2nMHSufBZ4hGI
 iT85k2E3TcBb2RYSMnIgPBw3mFaqB9yzmcyURd3Fef24Nzffotq0DlwXpJK9+E1BQMqL
 nh81/raCgBMncQqVHUto9qzazejOqDiPBdwr4ZqjMU5NOh7ALBAo98nmMQJDeHKn2UvE
 nhsw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/PPx9SuslD9/jwtA54L2XcjU3Bre6BQ3mHKJ6gpKMK0aL3T/IwtO1atdpzdJDsNOz0ol8sfWbf3yE=@buildroot.org
X-Gm-Message-State: AOJu0YyFu6mlIrcojdOo8cgo6xIgTJLRAUoC+MJuf3OfLX+WfQiXaq03
 jPDrMqC4V9ID8utfXr8TAe9vauLWzIA7RVr+wBp8ofpuw0meBniIqMw6/tnpESDJT+g=
X-Gm-Gg: Acq92OGDnU0b1bm2cDg8l9+Cr/+soOChA1VAGL8foJ2TMtRIUVoHils6yzDLDrqB/ta
 FfCUygFXq+kQhgcvcVdue/hdXVVjFmrcsjT07GyV1R17zcUDajQAXBAFhv3Xrd2pzKdeGPxLpp3
 1x/yE5qgcySFYFxQfD8XbVA0F0xwJyZrDvWW0ZwM47TgdK7eG6AiTe2gn23RfyVEypUN56J6LXy
 fUMe5xwVyJOicOufAlrLsNDu71BN/fnGg1ucKqM3UYN2g014oZxJFX1gPaAcSNf7KtvRGlTZWEn
 iYBnomItUTk5ncG6NBNYAl8WEOk/2YFIQSye9dsH2oWv4xvVQBJZXNHz70vCqrfkn89Fft/z8RD
 VGSo+0lxIb2CS3XZDcP3kY4csKJ9XYrIUus5YVyu5ymU751uFTwSTHInqzL+2IYmlLFdkUYTOfG
 iAAlSBmf+sRxpaJQK3KiDQmTVkVw==
X-Received: by 2002:a05:600c:4e09:b0:490:be14:bfda with SMTP id
 5b1f17b1804b1-490c259a003mr59499305e9.6.1780663831876; 
 Fri, 05 Jun 2026 05:50:31 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c4f73f62sm5436745e9.0.2026.06.05.05.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:31 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:30 +0200
Message-ID: <20260605125030.273700-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506163136.1330722-8-bernd@kuhls.net>
References: <20260506163136.1330722-8-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663832; x=1781268632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3uLw7gmtgcqarozzpDPNpdXFNcJUxMktbhY+DIo2t0g=;
 b=PrHBB267cbCslGrsTqu+MUCt+HBjjVjiRtoCxlam5AZEkRcVgaiGqBg6MRr5tbfcXZ
 d560qIkA3JZWa1B2Sq6g6Cg73Ob4Rmx9doCWamXe6U1C3CW+7ur3bwbVFggMtg1u5E6P
 MdqF1PiYqqDhJ5FWYpClnsOtoRMHQSYoTYRrmTqh/NCItGLZPT/uyrwtgU78YGFeTnTH
 ShXj1BBLmsOrLEqpdPk1eKaDoln7TpxgScbEB2/TjTHxsP4FNtvwUcq0TG4a3PDwfUQF
 a74mG7paAEk3YqEmHt/gzRFKJxbE/t9ZVUfHe3B8zLJh4oO0uL0yJ7wXEHSCvSPzveY0
 ERKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PrHBB267
Subject: Re: [Buildroot] [PATCH v5 07/22] package/cups-filters: add upstream
 patch to fix CVE-2025-64524
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...ix-infinite-loop-caused-by-crafted-f.patch | 83 +++++++++++++++++++
>  package/cups-filters/cups-filters.mk          |  3 +
>  2 files changed, 86 insertions(+)
>  create mode 100644 package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
> 
> diff --git a/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch b/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
> new file mode 100644
> index 0000000000..e9900e5672
> --- /dev/null
> +++ b/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
> @@ -0,0 +1,83 @@
> +From b03866fd2e251a6d822a5e8c807c8d47b4d2dce2 Mon Sep 17 00:00:00 2001
> +From: Zdenek Dohnal <zdohnal@redhat.com>
> +Date: Wed, 12 Nov 2025 16:02:20 +0100
> +Subject: [PATCH] rastertopclx.c: Fix infinite loop caused by crafted file
> +
> +Infinite loop happened because of crafted input raster file, which led
> +into heap buffer overflow of `CompressBuf` array.
> +
> +Based on comments there should be always some `count` when compressing
> +the data, and processing of crafted file ended with offset and count
> +being 0.
> +
> +Fixes CVE-2025-64524
> +
> +Upstream: https://github.com/OpenPrinting/cups-filters/commit/b03866fd2e251a6d822a5e8c807c8d47b4d2dce2
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + filter/rastertopclx.c | 25 +++++++++++++++++++++++--
> + 1 file changed, 23 insertions(+), 2 deletions(-)
> +
> +diff --git a/filter/rastertopclx.c b/filter/rastertopclx.c
> +index 3e7c129da..1015308da 100644
> +--- a/filter/rastertopclx.c
> ++++ b/filter/rastertopclx.c
> +@@ -818,10 +818,10 @@ StartPage(ppd_file_t         *ppd,	/* I - PPD file */
> +   }
> + 
> +   if (header->cupsCompression)
> +-    CompBuffer = malloc(DotBufferSize * 4);
> ++    CompBuffer = calloc(DotBufferSize * 4, sizeof(unsigned char));
> + 
> +   if (header->cupsCompression >= 3)
> +-    SeedBuffer = malloc(DotBufferSize);
> ++    SeedBuffer = calloc(DotBufferSize, sizeof(unsigned char));
> + 
> +   SeedInvalid = 1;
> + 
> +@@ -1152,6 +1152,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
> +               seed ++;
> +               count ++;
> +             }
> ++
> ++	    //
> ++	    // Bail out if we don't have count to compress
> ++	    //
> ++
> ++	    if (count == 0)
> ++	      break;
> + 	  }
> + 
> +          /*
> +@@ -1245,6 +1252,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
> + 
> +             count = line_ptr - start;
> + 
> ++	    //
> ++	    // Bail out if we don't have count to compress
> ++	    //
> ++
> ++	    if (count == 0)
> ++	      break;
> ++
> + #if 0
> +             fprintf(stderr, "DEBUG: offset=%d, count=%d, comp_ptr=%p(%d of %d)...\n",
> + 	            offset, count, comp_ptr, comp_ptr - CompBuffer,
> +@@ -1416,6 +1430,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
> + 
> +             count = (line_ptr - start) / 3;
> + 
> ++	    //
> ++	    // Bail out if we don't have count to compress
> ++	    //
> ++
> ++	    if (count == 0)
> ++	      break;
> ++
> +            /*
> +             * Place mode 10 compression data in the buffer; each sequence
> + 	    * starts with a command byte that looks like:
> +-- 
> +2.47.3
> +
> diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
> index dcfb2e9500..6bc4610376 100644
> --- a/package/cups-filters/cups-filters.mk
> +++ b/package/cups-filters/cups-filters.mk
> @@ -13,6 +13,9 @@ CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
>  # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
>  CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
>  
> +# 0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
> +CUPS_FILTERS_IGNORE_CVES += CVE-2025-64524
> +
>  CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
>  
>  CUPS_FILTERS_CONF_OPTS = \
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
