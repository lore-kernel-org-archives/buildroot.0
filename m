Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2596FCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B751E4209A;
	Fri,  6 Mar 2026 19:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y86u6JODmQRK; Fri,  6 Mar 2026 19:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7547B42079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826792;
	bh=WTc54x1S2dVg0Y0XL9CQDvPo+Wz5+znZRkh//To5YqQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gv9rTwJ9pYUoGNMC9+XANQoGtcrbLbEPYy22KJYHjD+yFSXKFSRWwhZAJMhnjsh9t
	 XuZEvty2IBiva+YYEa8lQrqhWqcRbXn4OHBdLVq6fjx71gs4RJWBTyF3Wmyvirv5fE
	 uKOASr9yKxd2PN11BfQPsQq6M9oO1EEPekoOVmU9yomeFha1byGYSeq/cPqx0OFtrd
	 0E/g9q3/9noi71li+vicmNEgzDxttY/DZCEWK9GNbjxQaXxtaNkwGe0LPI0mhCB8Ny
	 swPNvxtcfUUJjHkd+C6ZDUtdzIagqY+xeLl7FfVCMp5HfwJXXh2FfirWU5K92ULYrm
	 zxCzQWk0wDEcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7547B42079;
	Fri,  6 Mar 2026 19:53:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EDE1223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44D6A42049
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBdsAxiSY0V1 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A129542033
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A129542033
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A129542033
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:06 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439c5cce2c6so3437200f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826784; x=1773431584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8BFA56RHLQ2ydgAd6btN48n5eHO+eVuJmYfjqTQdiM0=;
 b=R2GY64wkRaraRpyHlwBTAX1joMtXjmxFZ0l7OiwhCgfJjP6Vjk9X1ejEJyCfr02ql7
 xMWsvrdIG5zB+9DLcR6o/mEF1XK7LXox5/f57eWnFquYA0IbTsb5ccu54Go3gANFqwQH
 K4Jlgt8Tilg+bLYLwa28qbK4VqVT033KoXxeMJMACqeZA574/mYsUOBvtvvMoRta9Gol
 ltHcJsg6uCS4PgtvutlURtaSGGCPvRY1YaNAxaeWWtM05ci+qeoMm1P7IEJ5bil2RUTP
 8Wcxifb7ny+NoRnU0WzDwU1eMxOz6aX+r9UgQESzpW9Gp1DHK7sLZdydGgFzywwsFLnD
 2FAQ==
X-Gm-Message-State: AOJu0Ywz9KG8SawbEJrsY+/qICLWBhCJHjGpDP1arjywMbXArZ3X8sOa
 3RVhP+Ga5n0iQAQxHNd0yJhgnOLw6mYmSwZf7tX3JTiYcp3RktHTIJ1PW+RiKGwn6MPgRw15Yvo
 /xGjq
X-Gm-Gg: ATEYQzx1W1qE+9MMTTGlgS/p1HR2lXAH4LDIiclvpBMMYOsXY+um3ph/Nz5PmkrOoj0
 xoTI67Pq1vZ8UjYAM90g1Wn8yuJYRfUnJe/MDK495RtLs6R71koDZOm9LjjM1B4Wn1GKl+hWg0S
 FLNhSM/M0Z2vBcnzabVxZGpVWQZBf2+OVYW156L1sduhBobUUqasiaQSCda/XsDiYw2lGZWBdch
 HgAM1D0pBXJxnYXZvG6HGCBWMYpcDCLj/eIhGUD38G/xsKncJve4SBY3d9T20XRfWlXGyHau2yx
 uHq/ILmCdeWEHM++b79KRLqPzVnlBlO+1zUXFNV9OjQv9AB5nqPsQrhq8dvn4OjTuLqo/NCB78J
 xjTByv+tInykqpAOA2NavItOeawI+vh//BvRNgHqrbHco7k49ntoUoG61sstSg+9iYH3xtjT9sM
 YyDD2pO2rbtqXR9Ak=
X-Received: by 2002:a05:6000:2312:b0:439:b1c3:84bc with SMTP id
 ffacd0b85a97d-439da6542ecmr5940886f8f.7.1772826784390; 
 Fri, 06 Mar 2026 11:53:04 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dada3b43sm5899060f8f.13.2026.03.06.11.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:04 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:03 +0100
Message-ID: <20260306195303.7388-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225081001.37745-1-thomas.perale@mind.be>
References: <20260225081001.37745-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826784; x=1773431584; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BFA56RHLQ2ydgAd6btN48n5eHO+eVuJmYfjqTQdiM0=;
 b=NeBl349i4f683SAfii6A1PYYGO2IOy8dIhiyT1mCSntZIE/P4qnjjb0UxNRMzpWKp5
 8dgFdrcGtb/JZhuFIa864AipvFFZQT/u9p4hwf924wppmUUtp05Cnik90Gr3k8Bazuq3
 fCSxl6cPTBX7auVmNOxqmfGtU+2vdyswZndAMey0VMbXPpL4XIYkRmr/80zSHCAh6nSJ
 930SYWTuOs9MUBz/F45O0EYiVMXduDLAcvB0IY5F6gIKqx8/ejVHixZtEnjeuPa6qUbX
 2+3CJvceXtrJocufknkpax13G55c4nKyETnlRSr5SY8cbDvWuWTsUPhApkDo3BrLyN6/
 5WEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NeBl349i
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-15
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
> For more information on the version bump, see:
>   - https://github.com/ImageMagick/Website/blob/main/ChangeLog.md
>   - https://github.com/ImageMagick/ImageMagick/compare/7.1.2-12...7.1.2-15
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-22770:
>     The BilateralBlurImage method will allocate a set of double buffers
>     inside AcquireBilateralTLS. But, in versions prior to 7.1.2-13, the
>     last element in the set is not properly initialized. This will
>     result in a release of an invalid pointer inside DestroyBilateralTLS
>     when the memory allocation fails.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-22770
> 
> - CVE-2026-23874:
>     Versions prior to 7.1.2-13 have a stack overflow via infinite
>     recursion in MSL (Magick Scripting Language) `<write>` command when
>     writing to MSL format.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-23874
> 
> - CVE-2026-23876:
>     Prior to versions 7.1.2-13 and 6.9.13-38, a heap buffer overflow
>     vulnerability in the XBM image decoder (ReadXBMImage) allows an
>     attacker to write controlled data past the allocated heap buffer
>     when processing a maliciously crafted image file. Any operation that
>     reads or identifies an image can trigger the overflow, making it
>     exploitable via common image upload and processing pipelines.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-23876
> 
> - CVE-2026-24481:
>     Prior to versions 7.1.2-15 and 6.9.13-40, a heap information
>     disclosure vulnerability exists in ImageMagick's PSD (Adobe
>     Photoshop) format handler. When processing a maliciously crafted PSD
>     file containing ZIP-compressed layer data that decompresses to less
>     than the expected size, uninitialized heap memory is leaked into the
>     output image.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-24481
> 
> - CVE-2026-25638:
>     Prior to versions 7.1.2-15 and 6.9.13-40, memory leak exists in
>     `coders/msl.c`. In the `WriteMSLImage` function of the `msl.c` file,
>     resources are allocated. But the function returns early without
>     releasing these allocated resources.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-25638
> 
> - CVE-2026-25794:
>     `WriteUHDRImage` in `coders/uhdr.c` uses `int` arithmetic to compute
>     the pixel buffer size. Prior to version 7.1.2-15, when image
>     dimensions are large, the multiplication overflows 32-bit `int`,
>     causing an undersized heap allocation followed by an out-of-bounds
>     write. This can crash the process or potentially lead to an out of
>     bounds heap write.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-25794
> 
> - CVE-2026-25795:
>     Prior to versions 7.1.2-15 and 6.9.13-40, in `ReadSFWImage()`
>     (`coders/sfw.c`), when temporary file creation fails, `read_info` is
>     destroyed before its `filename` member is accessed, causing a NULL
>     pointer dereference and crash.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-25795
> 
> - CVE-2026-25796:
>     Prior to versions 7.1.2-15 and 6.9.13-40, in `ReadSTEGANOImage()`
>     (`coders/stegano.c`), the `watermark` Image object is not freed on
>     three early-return paths, resulting in a definite memory leak
>     (~13.5KB+ per invocation) that can be exploited for denial of
>     service.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-25796
> 
> - CVE-2026-25798:
>     Prior to versions 7.1.2-15 and 6.9.13-40, a NULL pointer dereference
>     in ClonePixelCacheRepository allows a remote attacker to crash any
>     application linked against ImageMagick by supplying a crafted image
>     file, resulting in denial of service.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-25798
> 
> - CVE-2026-25799:
>     Prior to versions 7.1.2-15 and 6.9.13-40, a logic error in YUV
>     sampling factor validation allows an invalid sampling factor to
>     bypass checks and trigger a division-by-zero during image loading,
>     resulting in a reliable denial-of-service.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-25799
> 
> - CVE-2026-25897:
>     Prior to versions 7.1.2-15 and 6.9.13-40, an Integer Overflow
>     vulnerability exists in the sun decoder. On 32-bit systems/builds, a
>     carefully crafted image can lead to an out of bounds heap write.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-25897
> 
> - CVE-2026-25989:
>     Prior to versions 7.1.2-15 and 6.9.13-40, a crafted SVG file can
>     cause a denial of service. An off-by-one boundary check (`>` instead
>     of `>=`) that allows bypass the guard and reach an undefined
>     `(size_t)` cast.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-25989
> 
> - CVE-2026-26066:
>     Prior to versions 7.1.2-15 and 6.9.13-40, a crafted profile contain
>     invalid IPTC data may cause an infinite loop when writing it with
>     `IPTCTEXT`.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-26066
> 
> - CVE-2026-26283:
>     Prior to versions 7.1.2-15 and 6.9.13-40, a `continue` statement in
>     the JPEG extent binary search loop in the jpeg encoder causes an
>     infinite loop when writing persistently fails. An attacker can
>     trigger a 100% CPU consumption and process hang (Denial of Service)
>     with a crafted image.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-26283
> 
> - CVE-2026-26284:
>     Prior to versions 7.1.2-15 and 6.9.13-40, ImageMagick lacks proper
>     boundary checking when processing Huffman- coded data from PCD
>     (Photo CD) files. The decoder contains an function that has an
>     incorrect initialization that could cause an out of bounds read.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-26284
> 
> - CVE-2026-26983:
>     Prior to versions 7.1.2-15 and 6.9.13-40, the MSL interpreter
>     crashes when processing a invalid `<map>` element that causes it to
>     use an image after it has been freed.
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-26983
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/imagemagick/imagemagick.hash | 4 ++--
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index eead3a9f97..90383c4d17 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  521fa7a8c0f664a3f5cf7437cbcc219f12bd6d5fe0c1fb014f212fa145076e60  imagemagick-7.1.2-12.tar.gz
> -sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
> +sha256  bf646e7fffdf50b7d886eec6bbe51c3ced1c4d68fbabfcc534e014575359fe7f  imagemagick-7.1.2-15.tar.gz
> +sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 0d5eb2aa34..5a03fbfd8f 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 7.1.2-12
> +IMAGEMAGICK_VERSION = 7.1.2-15
>  IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
>  IMAGEMAGICK_LICENSE = Apache-2.0
>  IMAGEMAGICK_LICENSE_FILES = LICENSE
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
