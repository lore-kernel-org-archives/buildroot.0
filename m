Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4EBEFD206
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 08:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E6841E8B;
	Wed, 25 Feb 2026 08:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UTUMnV5KORC; Wed, 25 Feb 2026 08:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5054141E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772007009;
	bh=X+JgCjbREzx+fXnmZEuVlmv/V1pMXP0ia1lSMGRFdoA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LgeE41soghujxTmEABPUqzCqIs8tDZkEIZAocNQlrRx5E+wWWyuYU+8xvC/U2FxC4
	 Pq10pJEqB517CjqUI32mIND/DfiEWSYDXruMHL8EVI/inPRb+qANUsauvz3nj88nIU
	 eDsmLZpqJAtd+W/ouPADfTwjoBg/kbesEYOBijVnDlLIQM6/XIuzGubrmo+W77liaS
	 /NbfsOD3/g1PfI5Ctfvm1k/In0jyS0y8wr3D0BA1P205JAlzhv5DJJLSwS2i9AtdKH
	 lSfWkuo30WTep9VWZ1/FnXp02DwO1k1V2jnr57PJabnrQLP4e67t1u9Kw5q/xr0j0v
	 KeQAHLhl91u9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5054141E94;
	Wed, 25 Feb 2026 08:10:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A10801B8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 08:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9221441E94
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 08:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kv8gBkDIi1ku for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 08:10:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC3CA41E8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC3CA41E8B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC3CA41E8B
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 08:10:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso54232385e9.2
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 00:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772007003; x=1772611803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Esb0oxbcTeVNNKNINBTSWLvGAO+yc5hct8fAUPYY3tY=;
 b=C8s1opMEDtkUUruuzh2JY+5PxPolRhCCUZQXkR92e2ePBdmNbUc4jkBbNru+vzmglg
 izrJwVTflY1hUT0gER7lV2to4pPc4JNCJvu4agJJSs+dLAT2kom5xBkSpFMrEhP3vKSW
 Sy0zve1QixqAwMc7z4ykoj9ZHD21cZSBn/DyP9cvYMDqo+hUvB8xPDZsryE/TV20/hIL
 qCam0o1yOoIYYxIe5KtZID3qP7/o7URK/r0aEv2u7TBbPSSacLocFmLk82kfuFfkBrki
 DSG4sDMWbdiq6Wsf5MwaND7EuYqyoeBYfRQUhRJ3rtNxGX5jfndBOtVgO/pVgQS/EP/O
 1Xfg==
X-Gm-Message-State: AOJu0Ywu4ddvZbV+AC+IzW7pVAwO6ndHRg2Cuf3pTtnsHGt/8U3JqUmb
 8SX1uxpdPfkj2nzOgfpIxvEFcLuyoFHfZ8dNyC4K5kG4KtxokOm89Tml5vciidQfpHnNNWP/uk1
 f4QrG
X-Gm-Gg: ATEYQzxLWHQtTiB2NbCT+DfIBSVvfpVTtnkjVVS31AHGG3baQRto0u8S0w8vSQZ941X
 m9jn29FoXFIYUl7LlZAs2NE3SLe6xUqN6guJB0YlclFssFeisWv9HmundvEi6S1LNxJGXfUjtYA
 /OWmBsTEbKCprxxXrcmM6qJasLGtb25N7dKG+g971ic3PkiZGnL3Izu9d3rozi5kqqDwkJ603By
 fQptE/4DAqLhVfsvIKiWXzC0dx93fYE6+epqLn7iVlPtaMYTrSbUp2j5o5gB6tuZ4m/Iermt3AJ
 L9g+V3h1PuJEL/76aQx6NUcdul35IwD6z8SFC+bUMaG7FRXRtizJmtVGDZGKVAuDwd5Mf+2aHrO
 tH9nV/KhzEC/utqZV7Cigoe7j0x9RpXHWqPlsms7bgFM2S/+9DATYjIe8VHgnW/5L+OhWLTP+Ol
 9jo0UsmE1nSfz90TI=
X-Received: by 2002:a05:600c:8b88:b0:479:35e7:a0e3 with SMTP id
 5b1f17b1804b1-483a963d64bmr221308765e9.30.1772007002422; 
 Wed, 25 Feb 2026 00:10:02 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcbf673sm7558725e9.19.2026.02.25.00.10.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 00:10:02 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 09:10:01 +0100
Message-ID: <20260225081001.37745-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772007003; x=1772611803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Esb0oxbcTeVNNKNINBTSWLvGAO+yc5hct8fAUPYY3tY=;
 b=OCy5uhJtgEjAzZ54c0k2rh/gyHob2XjuYMdmZekbCb3i6Bcl9cVo3WC/Qd9RWlFIRR
 WQnhyTvLa+DB5pn0/uPQ5L+S5i8ccLaBFrqX+WdGz+3snjuZYqQu0wXzPajicp+Kv6z0
 GU9Rcd5HulEN+CKcjWuQjENiUMa4p+/5NdpKCUjwDHsx5pZf01NQUeM1BiI/87gNmtHP
 qJBgzqhldIgh1lDrbti5GBdViwxFHBPpB8XAg5rHr3CnZ0Vtgwd8GSmPGGglSNXiZGF0
 Q1+mwKCyiH80VcUvV0B4B6+2a8zl6m25JpNhe7EERMh/ps9MgTUlW3TdDRSkyPabuAQK
 Shag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OCy5uhJt
Subject: [Buildroot] [PATCH] package/imagemagick: security bump to v7.1.2-15
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

For more information on the version bump, see:
  - https://github.com/ImageMagick/Website/blob/main/ChangeLog.md
  - https://github.com/ImageMagick/ImageMagick/compare/7.1.2-12...7.1.2-15

Fixes the following vulnerabilities:

- CVE-2026-22770:
    The BilateralBlurImage method will allocate a set of double buffers
    inside AcquireBilateralTLS. But, in versions prior to 7.1.2-13, the
    last element in the set is not properly initialized. This will
    result in a release of an invalid pointer inside DestroyBilateralTLS
    when the memory allocation fails.

    https://www.cve.org/CVERecord?id=CVE-2026-22770

- CVE-2026-23874:
    Versions prior to 7.1.2-13 have a stack overflow via infinite
    recursion in MSL (Magick Scripting Language) `<write>` command when
    writing to MSL format.

    https://www.cve.org/CVERecord?id=CVE-2026-23874

- CVE-2026-23876:
    Prior to versions 7.1.2-13 and 6.9.13-38, a heap buffer overflow
    vulnerability in the XBM image decoder (ReadXBMImage) allows an
    attacker to write controlled data past the allocated heap buffer
    when processing a maliciously crafted image file. Any operation that
    reads or identifies an image can trigger the overflow, making it
    exploitable via common image upload and processing pipelines.

    https://www.cve.org/CVERecord?id=CVE-2026-23876

- CVE-2026-24481:
    Prior to versions 7.1.2-15 and 6.9.13-40, a heap information
    disclosure vulnerability exists in ImageMagick's PSD (Adobe
    Photoshop) format handler. When processing a maliciously crafted PSD
    file containing ZIP-compressed layer data that decompresses to less
    than the expected size, uninitialized heap memory is leaked into the
    output image.

    https://www.cve.org/CVERecord?id=CVE-2026-24481

- CVE-2026-25638:
    Prior to versions 7.1.2-15 and 6.9.13-40, memory leak exists in
    `coders/msl.c`. In the `WriteMSLImage` function of the `msl.c` file,
    resources are allocated. But the function returns early without
    releasing these allocated resources.

    https://www.cve.org/CVERecord?id=CVE-2026-25638

- CVE-2026-25794:
    `WriteUHDRImage` in `coders/uhdr.c` uses `int` arithmetic to compute
    the pixel buffer size. Prior to version 7.1.2-15, when image
    dimensions are large, the multiplication overflows 32-bit `int`,
    causing an undersized heap allocation followed by an out-of-bounds
    write. This can crash the process or potentially lead to an out of
    bounds heap write.

    https://www.cve.org/CVERecord?id=CVE-2026-25794

- CVE-2026-25795:
    Prior to versions 7.1.2-15 and 6.9.13-40, in `ReadSFWImage()`
    (`coders/sfw.c`), when temporary file creation fails, `read_info` is
    destroyed before its `filename` member is accessed, causing a NULL
    pointer dereference and crash.

    https://www.cve.org/CVERecord?id=CVE-2026-25795

- CVE-2026-25796:
    Prior to versions 7.1.2-15 and 6.9.13-40, in `ReadSTEGANOImage()`
    (`coders/stegano.c`), the `watermark` Image object is not freed on
    three early-return paths, resulting in a definite memory leak
    (~13.5KB+ per invocation) that can be exploited for denial of
    service.

    https://www.cve.org/CVERecord?id=CVE-2026-25796

- CVE-2026-25798:
    Prior to versions 7.1.2-15 and 6.9.13-40, a NULL pointer dereference
    in ClonePixelCacheRepository allows a remote attacker to crash any
    application linked against ImageMagick by supplying a crafted image
    file, resulting in denial of service.

    https://www.cve.org/CVERecord?id=CVE-2026-25798

- CVE-2026-25799:
    Prior to versions 7.1.2-15 and 6.9.13-40, a logic error in YUV
    sampling factor validation allows an invalid sampling factor to
    bypass checks and trigger a division-by-zero during image loading,
    resulting in a reliable denial-of-service.

    https://www.cve.org/CVERecord?id=CVE-2026-25799

- CVE-2026-25897:
    Prior to versions 7.1.2-15 and 6.9.13-40, an Integer Overflow
    vulnerability exists in the sun decoder. On 32-bit systems/builds, a
    carefully crafted image can lead to an out of bounds heap write.

    https://www.cve.org/CVERecord?id=CVE-2026-25897

- CVE-2026-25989:
    Prior to versions 7.1.2-15 and 6.9.13-40, a crafted SVG file can
    cause a denial of service. An off-by-one boundary check (`>` instead
    of `>=`) that allows bypass the guard and reach an undefined
    `(size_t)` cast.

    https://www.cve.org/CVERecord?id=CVE-2026-25989

- CVE-2026-26066:
    Prior to versions 7.1.2-15 and 6.9.13-40, a crafted profile contain
    invalid IPTC data may cause an infinite loop when writing it with
    `IPTCTEXT`.

    https://www.cve.org/CVERecord?id=CVE-2026-26066

- CVE-2026-26283:
    Prior to versions 7.1.2-15 and 6.9.13-40, a `continue` statement in
    the JPEG extent binary search loop in the jpeg encoder causes an
    infinite loop when writing persistently fails. An attacker can
    trigger a 100% CPU consumption and process hang (Denial of Service)
    with a crafted image.

    https://www.cve.org/CVERecord?id=CVE-2026-26283

- CVE-2026-26284:
    Prior to versions 7.1.2-15 and 6.9.13-40, ImageMagick lacks proper
    boundary checking when processing Huffman- coded data from PCD
    (Photo CD) files. The decoder contains an function that has an
    incorrect initialization that could cause an out of bounds read.

    https://www.cve.org/CVERecord?id=CVE-2026-26284

- CVE-2026-26983:
    Prior to versions 7.1.2-15 and 6.9.13-40, the MSL interpreter
    crashes when processing a invalid `<map>` element that causes it to
    use an image after it has been freed.

    https://www.cve.org/CVERecord?id=CVE-2026-26983

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index eead3a9f97..90383c4d17 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  521fa7a8c0f664a3f5cf7437cbcc219f12bd6d5fe0c1fb014f212fa145076e60  imagemagick-7.1.2-12.tar.gz
-sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
+sha256  bf646e7fffdf50b7d886eec6bbe51c3ced1c4d68fbabfcc534e014575359fe7f  imagemagick-7.1.2-15.tar.gz
+sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 0d5eb2aa34..5a03fbfd8f 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-12
+IMAGEMAGICK_VERSION = 7.1.2-15
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
