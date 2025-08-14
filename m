Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B80CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A91096076A;
	Thu, 14 Aug 2025 20:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1NMRmYR-NIX; Thu, 14 Aug 2025 20:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C5876079A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C5876079A;
	Thu, 14 Aug 2025 20:32:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62C2D93E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48F37607A7
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llUHuTB9JjUw for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12CDD607CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12CDD607CD
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12CDD607CD
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b9edf504e6so703232f8f.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203531; x=1755808331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQS5j2iReIxhfm95zGL5ROilONRcULdNKRIRpVS+tno=;
 b=Of76kQZ9e217rNhly+yG5+oe/n1J17SgJ1D3sTapBuPIolo7dq6BzS+NTakEr1zM7J
 LIIM7J0DatU1jrv6Xf3iN+6k68SiNT6mfjmjb366xKDb1Z8jvvkhlche3FgcBbSn5A5U
 6ZQRPvW1BWA5ZIpYfdWQtl9tuzAd8qqxxozpkO7oNTbkG1yKSjQB1FhHHjgQWtzwCVNU
 aXodp+V9HQ+Kj6g5KFEfS4mFfldVwA2gE2Mq6QlHstXWns1tmg+/yCMSzpUIvM/JZRet
 rGDNF9wM4zOtcHy1Q98qGKmEkNvf8DuVOO8FNjCoIeIxbucL2MMw7Tn6wFqI8G5ZMWFL
 TrxA==
X-Gm-Message-State: AOJu0YznB8oCfYOf7wY3vf8y4h4vJqbXqzJ+67aUNOvtQ7Zfe5dLIJva
 GO/rkAwdJBmibbANStYMa4IBpztF9+hf/u2DLa4yOQQ237nbKFplo6/qqyh5b4WQS3zIJ4qFdGf
 zuJeNdKw=
X-Gm-Gg: ASbGncskwkcDMAZPX6C5KL0LmBwXbDHb/Bin4PpW+nfZBlmQT5DXjsHNpTZLx2skYnc
 ctRnqlbZd4YeAS/B7TdWj4BWQr1+0SFOfW6ieFhZZLpDMn9t5vkPnKF7QPSwvNUfeKb+FR6zZkL
 A3tVLA8jZJ62nZ91+dkbCi5uFsa65irPqRkmmUXkr5HjJ7ovbHZ1utw2hqinmMdbT2JIBWTe7ZS
 yRfmDJCJeD350tuUOfa7ubFuN3iDw8XLOG9tYAmbsiRzkAw46kmXXtGI9RIRlpk0I+OSzPaQ7aR
 NDfjmFVVpXT1L+eYlOwg6vPw777Y12J62KIzzjTSnPfvbDyXLgc48Kj6/+1HMfs1PNkmB07Z5nl
 X2SeKmI9zce9Ps6XJHcLoHpOc
X-Google-Smtp-Source: AGHT+IFluaevVnJQgRlHwMohSJHsVYzX9EQ1yBOBMPkXosXtOpmg2Ixiw9ijj930s7cD06ZUt0R+wA==
X-Received: by 2002:a5d:64e8:0:b0:3b9:16a3:cf9b with SMTP id
 ffacd0b85a97d-3b9e415873cmr3763461f8f.5.1755203531037; 
 Thu, 14 Aug 2025 13:32:11 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e054036bsm41961620f8f.31.2025.08.14.13.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:10 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:10 +0200
Message-ID: <20250814203210.2816597-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806202029.625736-1-thomas.perale@mind.be>
References: <20250806202029.625736-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203531; x=1755808331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LQS5j2iReIxhfm95zGL5ROilONRcULdNKRIRpVS+tno=;
 b=B2V2kvGUkSypc8N5/WlbucA5EQWYjlxz7XnKePFUzsc+ltGA6KH3zm/fOA4+HSprAX
 g4OLmCREnmA2NIUINqBXlTVYcc44DaclDvrou1PJf7+3de7JjUlKAcih6astXKQnHiPN
 IOMZRwGnBnVIyFzerRyW+9P7E2VU+5Q+ouWhAZWwWhGwevXw34mZJBV8msItDPTr+QED
 bNp6tI1IKbChlvq3JMaNkgZW8rYMjaw4OgeFItS7dlT2h7tcygZhTxf4/jQw0gV6ywCB
 xfspwomZdJzksj6XtQv3CLhVuHTjZhG3zD2wCb5Ebq9IgqJuNmZuqq89+33qJ+S0EcUG
 joSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B2V2kvGU
Subject: Re: [Buildroot] [PATCH 1/2] package/tiff: add patch to fix
 CVE-2025-8176
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
> Fix the following vulnerability:
> 
> - CVE-2025-8176
> 
>     A vulnerability was found in LibTIFF up to 4.7.0. It has been declared
>     as critical. This vulnerability affects the function get_histogram of
>     the file tools/tiffmedian.c. The manipulation leads to use after free.
>     The attack needs to be approached locally. The exploit has been
>     disclosed to the public and may be used. The patch is identified as
>     fe10872e53efba9cc36c66ac4ab3b41a839d5172. It is recommended to apply a
>     patch to fix this issue.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-8176
>   - https://gitlab.com/libtiff/libtiff/-/merge_requests/727
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> v1 -> v2: split the CVE-2025-8176 fix into multiple patches
> ---
>  ...ip-the-first-line-of-the-input-image.patch | 61 +++++++++++++++++++
>  package/tiff/0002-fix-tiffmedian-bug.patch    | 31 ++++++++++
>  package/tiff/0003-conflict-resolution.patch   | 28 +++++++++
>  package/tiff/tiff.mk                          |  3 +
>  4 files changed, 123 insertions(+)
>  create mode 100644 package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
>  create mode 100644 package/tiff/0002-fix-tiffmedian-bug.patch
>  create mode 100644 package/tiff/0003-conflict-resolution.patch
> 
> diff --git a/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
> new file mode 100644
> index 0000000000..bdf4bd8e94
> --- /dev/null
> +++ b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
> @@ -0,0 +1,61 @@
> +From 3994cf3b3bc6b54c32f240ca5a412cffa11633fa Mon Sep 17 00:00:00 2001
> +From: Lee Howard <faxguy@howardsilvan.com>
> +Date: Mon, 19 May 2025 10:53:30 -0700
> +Subject: [PATCH] Don't skip the first line of the input image.  Addresses
> + issue #703
> +
> +Upstream: https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa
> +CVE: CVE-2025-8176
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + tools/tiffdither.c | 4 ++--
> + tools/tiffmedian.c | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/tools/tiffdither.c b/tools/tiffdither.c
> +index 714fe03d4..bfed6df18 100644
> +--- a/tools/tiffdither.c
> ++++ b/tools/tiffdither.c
> +@@ -98,7 +98,7 @@ static int fsdither(TIFF *in, TIFF *out)
> +     nextptr = nextline;
> +     for (j = 0; j < imagewidth; ++j)
> +         *nextptr++ = *inptr++;
> +-    for (i = 1; i < imagelength; ++i)
> ++    for (i = 0; i < imagelength; ++i)
> +     {
> +         tmpptr = thisline;
> +         thisline = nextline;
> +@@ -146,7 +146,7 @@ static int fsdither(TIFF *in, TIFF *out)
> +                     nextptr[0] += v / 16;
> +             }
> +         }
> +-        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
> ++        if (TIFFWriteScanline(out, outline, i, 0) < 0)
> +             goto skip_on_error;
> +     }
> +     goto exit_label;
> +diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
> +index 02b0bc2b4..f6cf26c2c 100644
> +--- a/tools/tiffmedian.c
> ++++ b/tools/tiffmedian.c
> +@@ -917,7 +917,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
> +     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
> + 
> +     GetInputLine(in, 0, goto bad); /* get first line */
> +-    for (i = 1; i <= imagelength; ++i)
> ++    for (i = 0; i <= imagelength; ++i)
> +     {
> +         SWAP(short *, thisline, nextline);
> +         lastline = (i >= imax);
> +@@ -997,7 +997,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
> +                 nextptr += 3;
> +             }
> +         }
> +-        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
> ++        if (TIFFWriteScanline(out, outline, i, 0) < 0)
> +             break;
> +     }
> + bad:
> +-- 
> +GitLab
> +
> diff --git a/package/tiff/0002-fix-tiffmedian-bug.patch b/package/tiff/0002-fix-tiffmedian-bug.patch
> new file mode 100644
> index 0000000000..880bade7d8
> --- /dev/null
> +++ b/package/tiff/0002-fix-tiffmedian-bug.patch
> @@ -0,0 +1,31 @@
> +From ce46f002eca4148497363f80fab33f9396bcbeda Mon Sep 17 00:00:00 2001
> +From: Lee Howard <faxguy@howardsilvan.com>
> +Date: Sat, 24 May 2025 21:25:16 -0700
> +Subject: [PATCH] Fix tiffmedian bug #707
> +
> +Upstream: https://gitlab.com/libtiff/libtiff/-/merge_requests/727/diffs?commit_id=ce46f002eca4148497363f80fab33f9396bcbeda
> +CVE: CVE-2025-8176
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + tools/tiffmedian.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
> +index f6cf26c2c..8c9978bab 100644
> +--- a/tools/tiffmedian.c
> ++++ b/tools/tiffmedian.c
> +@@ -414,7 +414,10 @@ static void get_histogram(TIFF *in, Colorbox *box)
> +     for (i = 0; i < imagelength; i++)
> +     {
> +         if (TIFFReadScanline(in, inputline, i, 0) <= 0)
> +-            break;
> ++        {
> ++            fprintf(stderr, "Error reading scanline\n");
> ++            exit(EXIT_FAILURE);
> ++        }
> +         inptr = inputline;
> +         for (j = imagewidth; j-- > 0;)
> +         {
> +-- 
> +GitLab
> +
> diff --git a/package/tiff/0003-conflict-resolution.patch b/package/tiff/0003-conflict-resolution.patch
> new file mode 100644
> index 0000000000..0c16aa3271
> --- /dev/null
> +++ b/package/tiff/0003-conflict-resolution.patch
> @@ -0,0 +1,28 @@
> +From ecc4ddbf1f0fed7957d1e20361e37f01907898e0 Mon Sep 17 00:00:00 2001
> +From: Lee Howard <faxguy@howardsilvan.com>
> +Date: Sat, 24 May 2025 21:38:09 -0700
> +Subject: [PATCH] conflict resolution
> +
> +Upstream: https://gitlab.com/libtiff/libtiff/-/merge_requests/727/diffs?commit_id=ecc4ddbf1f0fed7957d1e20361e37f01907898e0
> +CVE: CVE-2025-8176
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + tools/tiffmedian.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
> +index 8c9978bab..47e0524bc 100644
> +--- a/tools/tiffmedian.c
> ++++ b/tools/tiffmedian.c
> +@@ -920,7 +920,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
> +     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
> + 
> +     GetInputLine(in, 0, goto bad); /* get first line */
> +-    for (i = 0; i <= imagelength; ++i)
> ++    for (i = 0; i < imagelength; ++i)
> +     {
> +         SWAP(short *, thisline, nextline);
> +         lastline = (i >= imax);
> +-- 
> +GitLab
> +
> diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
> index 5d7219d7da..bd95fdca7f 100644
> --- a/package/tiff/tiff.mk
> +++ b/package/tiff/tiff.mk
> @@ -13,6 +13,9 @@ TIFF_CPE_ID_VENDOR = libtiff
>  TIFF_CPE_ID_PRODUCT = libtiff
>  TIFF_INSTALL_STAGING = YES
>  
> +# 0001-don-t-skip-the-first-line-of-the-input-image.patch, 0002-fix-tiffmedian-bug.patch, 0003-conflict-resolution.patch
> +TIFF_IGNORE_CVES += CVE-2025-8176
> +
>  # webp has a (optional) dependency on tiff, so we can't have webp
>  # support in tiff, or that would create a circular dependency.
>  TIFF_CONF_OPTS = \
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
