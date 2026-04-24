Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00E9FED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5AAC42967;
	Fri, 24 Apr 2026 16:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgK4enKJeZAC; Fri, 24 Apr 2026 16:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E43B4296D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048003;
	bh=ZodHymfXaImMR8yg0SYCh+4Ec3OtOINW0JDckx48TO8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CJK5kBxcxnFckf7hHYY+m+eIaOZWJaFwJdnrJtk0LPQevmrWHBi1DWOHy0orFW36L
	 HiicozMd+D7WA4sIz+eJTOhNPrN3uIwfYNiGffzVxK+nBk0OI53047JNENBa+9+tDu
	 F8BuNTnkVBfNEh+3f8i5GYHGzHJ482WLQWQkiyPq1K6HVY732Y2d2/1cK339Klw6Np
	 cfdJpfFuvdDXtoEhvq97b54L3RxLXcANsXwjJfBOa4hIvq6zTYFmtDkeQXK20vTUJ8
	 CxAsU4pk5obnvwfBuHM/N80It99lXw/QiV5M9MuAHZ/dCFLtPutliPDZuw7D57y8K0
	 W20C6sMabhniA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E43B4296D;
	Fri, 24 Apr 2026 16:26:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B160194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20E51429A4
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOkPXQWt6tgR for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:26:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC1C642958
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC1C642958
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC1C642958
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43eada6d900so7829206f8f.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777047998; x=1777652798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MEI+P3nH/O/phf3AFKCEODJF8x2cDOPdLb/KtlAK4YY=;
 b=D5ud9SR8CFwDOzGDIK5kecfXYaTyxn4YXCUnExf5VOtdR3SZR5DOixMRf3TT2/blq0
 p25ZGACRMtzZVacWp7CvqT1QtfgoGH0AOYLc17/ayozEnms1pA5gyemF950JEzIQ7rl0
 YAoURGjU1qHmJq4+iJbRxNlON0xWJg+zbmfTFZFfEVkwU0Yk5ZArvM95pq6faoCveXwp
 W6GEUBQVcyBiG4txd2CR8M1qTFkT2Qfz/I0VmR4kH197CTLc2EdTKnJMFBeBqLkxOpwu
 cpWVePtU2PVL8Lwrq2qRZ+rSn5eeLWB5SjlQocjPI0J1dE3X9qtSF0gjITJuWiu7DSlh
 4VLA==
X-Gm-Message-State: AOJu0YzMs9JtkRcMAtO5kHx0zYafJBW7EIm+I0f+F87K+UKndeHaIfQh
 q9Dg36hSH8sQ8cws/irDHS79y8OLXqxMbsbQw4k2R7TXVmWtJ5BwUmTLmC+cYRPw0FUBDVmEw1U
 R5q2B
X-Gm-Gg: AeBDietlHxuc+xcRKfy2zWbl3sZDi4oJiX9fyoLUx0qCz6Speg7ZXqsxDZceV5HB31m
 pLR2XqKKIE02/HfozAG0yJbMDWWB9ZomEcQ69PLsObAPicsrZ0HFUsL5tBB2IXn2JfS4OBvvGJ8
 KJ9K88pwsCAcyNDUllMBiFMDXlHfhrAqjL2beJ7Y9lqnE9E8jUXll+gBAeB7q+IvNn7wpPwoqy/
 25zDlNDS2RW5NxkKcKO0Yfl/o69t8bnKHW86XDESfbLABeXfsnwBozmTocbJ+no7nHHkg+izLIr
 dZ+ipMvnK9HquM01WT9GMKUM8zZx/Ov8bxsHmqGBj77KkrcRnH/GtVzdUyyQlu68vTzM+S91AwM
 0U6V1a3NoniKNXrio0BAY2EABN5BqNPONoHWN+ebhRuG+ONop3J3S3T1uVqHh2sA/Ve5pIU1pow
 zFPf5ouLDTZzCrD8bnYvVVmCOmng==
X-Received: by 2002:a5d:5d0b:0:b0:43d:20e9:b0e1 with SMTP id
 ffacd0b85a97d-43fe3db9b22mr48488993f8f.7.1777047997557; 
 Fri, 24 Apr 2026 09:26:37 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc0f31sm60823329f8f.12.2026.04.24.09.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:26:36 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:26:36 +0200
Message-ID: <20260424162636.160866-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417102200.137169-1-thomas.perale@mind.be>
References: <20260417102200.137169-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777047998; x=1777652798; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MEI+P3nH/O/phf3AFKCEODJF8x2cDOPdLb/KtlAK4YY=;
 b=Nw/9GwLMnPTz8o4zBB1Lss1/ky8zcCFiA1GzTJ3sC0PPl6cVD/uebhKh3BtEx0E4D8
 SuNuyeMFpOx+fg6m/POomKhNx2vepdfz0IH362SKpToWJDjIucXaPXYy1RrV4X2Mgbgb
 uAPQYVDabCM4FOqtxGmVFIQmw63Wpc+5Js5ZNW7o5TJiCeFSsfwWMWEHGeEAGcRaLJz/
 3ys2gHJra310/Cmt9SiWfYyICNgyppzlpOZbOhix/vm4RND9ZBh7gzUFBs6Nqgo44B49
 HTwdLgEZP8YLJ07ls1FC3OM9NuNefNduDUyEEZLeo6Q+mjwENSFVxCcWPMVak2ojtouP
 jO2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Nw/9GwLM
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/giflib: patch
 CVE-2021-40633, CVE-2025-31344, CVE-2026-23868
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
> Fixes the following vulnerabilities:
> 
> - CVE-2021-40633:
>     A memory leak (out-of-memory) in gif2rgb in util/gif2rgb.c in giflib
>     5.1.4 allows remote attackers trigger an out of memory exception or
>     denial of service via a gif format file.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2021-40633
>   - https://sourceforge.net/p/giflib/code/ci/ccbc956432650734c91acb3fc88837f7b81267ff/
> 
> - CVE-2025-31344:
>     Heap-based Buffer Overflow vulnerability in openEuler giflib on Linux.
>     This vulnerability is associated with program files gif2rgb.C.  This
>     issue affects giflib: through 5.2.2.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-31344
>   - https://sourceforge.net/p/giflib/code/ci/7bbe8ea1a595bb7509ffa0a86b076e9b720e85af
> 
> - CVE-2026-23868:
>     Giflib contains a double-free vulnerability that is the result of a
>     shallow copy in GifMakeSavedImage and incorrect error handling. The
>     conditions needed to trigger this vulnerability are difficult but may
>     be possible.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-23868
>   - https://sourceforge.net/p/giflib/code/ci/f5b7267aed3665ef025c13823e454170d031c106
> 
> This package is still vulnerable to CVE-2024-45993 [1] & CVE-2026-26740
> [2] that doesn't have a documented fix yet.
> 
> [1] https://security-tracker.debian.org/tracker/CVE-2024-45993
> [2] https://security-tracker.debian.org/tracker/CVE-2026-26740
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/giflib/0003-CVE-2021-40633.patch | 24 ++++++++++++++++++++
>  package/giflib/0004-CVE-2025-31344.patch | 26 +++++++++++++++++++++
>  package/giflib/0005-CVE-2026-23868.patch | 29 ++++++++++++++++++++++++
>  package/giflib/giflib.mk                 |  9 ++++++++
>  4 files changed, 88 insertions(+)
>  create mode 100644 package/giflib/0003-CVE-2021-40633.patch
>  create mode 100644 package/giflib/0004-CVE-2025-31344.patch
>  create mode 100644 package/giflib/0005-CVE-2026-23868.patch
> 
> diff --git a/package/giflib/0003-CVE-2021-40633.patch b/package/giflib/0003-CVE-2021-40633.patch
> new file mode 100644
> index 0000000000..4e0070401e
> --- /dev/null
> +++ b/package/giflib/0003-CVE-2021-40633.patch
> @@ -0,0 +1,24 @@
> +commit ccbc956432650734c91acb3fc88837f7b81267ff
> +Author: Eric S. Raymond <esr@thyrsus.com>
> +Date:   Wed Feb 21 18:55:00 2024 -0500
> +
> +    Clean up memory better at end of run (CVE-2021-40633)
> +
> +CVE: CVE-2021-40633
> +Upstream: https://sourceforge.net/p/giflib/code/ci/ccbc956432650734c91acb3fc88837f7b81267ff/
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +
> +diff --git a/gif2rgb.c b/gif2rgb.c
> +index d51226d..fc2e683 100644
> +--- a/gif2rgb.c
> ++++ b/gif2rgb.c
> +@@ -525,6 +525,9 @@ static void GIF2RGB(int NumFiles, char *FileName, bool OneFileFlag,
> + 	DumpScreen2RGB(OutFileName, OneFileFlag, ColorMap, ScreenBuffer,
> + 	               GifFile->SWidth, GifFile->SHeight);
> + 
> ++	for (i = 0; i < GifFile->SHeight; i++) {
> ++        	(void)free(ScreenBuffer[i]);
> ++	}
> + 	(void)free(ScreenBuffer);
> + 
> + 	{
> diff --git a/package/giflib/0004-CVE-2025-31344.patch b/package/giflib/0004-CVE-2025-31344.patch
> new file mode 100644
> index 0000000000..2d74b526c4
> --- /dev/null
> +++ b/package/giflib/0004-CVE-2025-31344.patch
> @@ -0,0 +1,26 @@
> +commit 7bbe8ea1a595bb7509ffa0a86b076e9b720e85af
> +Author: Eric S. Raymond <esr@thyrsus.com>
> +Date:   Wed Feb 18 18:06:50 2026 -0500
> +
> +    Resolve SourceForge bug #187: CVE-2025-31344
> +
> +CVE: CVE-2025-31344
> +Upstream: https://sourceforge.net/p/giflib/code/ci/7bbe8ea1a595bb7509ffa0a86b076e9b720e85af
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +
> +diff --git a/gif2rgb.c b/gif2rgb.c
> +index b80ebcd..da4fa23 100644
> +--- a/gif2rgb.c
> ++++ b/gif2rgb.c
> +@@ -327,6 +327,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
> + 			GifRow = ScreenBuffer[i];
> + 			GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
> + 			for (j = 0; j < ScreenWidth; j++) {
> ++				/* Check if color is within color palete */
> ++				if (GifRow[j] >= ColorMap->ColorCount) {
> ++					GIF_EXIT(GifErrorString(
> ++					    D_GIF_ERR_IMAGE_DEFECT));
> ++				}
> + 				ColorMapEntry = &ColorMap->Colors[GifRow[j]];
> + 				Buffers[0][j] = ColorMapEntry->Red;
> + 				Buffers[1][j] = ColorMapEntry->Green;
> diff --git a/package/giflib/0005-CVE-2026-23868.patch b/package/giflib/0005-CVE-2026-23868.patch
> new file mode 100644
> index 0000000000..176325ef77
> --- /dev/null
> +++ b/package/giflib/0005-CVE-2026-23868.patch
> @@ -0,0 +1,29 @@
> +commit f5b7267aed3665ef025c13823e454170d031c106
> +Author: Eric S. Raymond <esr@thyrsus.com>
> +Date:   Wed Mar 4 18:49:49 2026 -0500
> +
> +    Avoid potentuial double-free on weird images.
> +
> +CVE: CVE-2026-23868
> +Upstream: https://sourceforge.net/p/giflib/code/ci/f5b7267aed3665ef025c13823e454170d031c106
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +
> +diff --git a/gifalloc.c b/gifalloc.c
> +index 01a845d..ff70cb0 100644
> +--- a/gifalloc.c
> ++++ b/gifalloc.c
> +@@ -349,6 +349,14 @@ SavedImage *GifMakeSavedImage(GifFileType *GifFile,
> + 			 * aliasing problems.
> + 			 */
> + 
> ++			/* Null out aliased pointers before any allocations
> ++			 * so that FreeLastSavedImage won't free CopyFrom's
> ++			 * data if an allocation fails partway through. */
> ++			sp->ImageDesc.ColorMap = NULL;
> ++			sp->RasterBits = NULL;
> ++			sp->ExtensionBlocks = NULL;
> ++			sp->ExtensionBlockCount = 0;
> ++ 
> + 			/* first, the local color map */
> + 			if (CopyFrom->ImageDesc.ColorMap != NULL) {
> + 				sp->ImageDesc.ColorMap = GifMakeMapObject(
> diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
> index 00922ce2db..db9886342c 100644
> --- a/package/giflib/giflib.mk
> +++ b/package/giflib/giflib.mk
> @@ -12,6 +12,15 @@ GIFLIB_LICENSE = MIT
>  GIFLIB_LICENSE_FILES = COPYING
>  GIFLIB_CPE_ID_VALID = YES
>  
> +# 0003-CVE-2021-40633.patch
> +GIFLIB_IGNORE_CVES += CVE-2021-40633
> +
> +# 0004-CVE-2025-31344.patch
> +GIFLIB_IGNORE_CVES += CVE-2025-31344
> +
> +# 0005-CVE-2026-23868.patch
> +GIFLIB_IGNORE_CVES += CVE-2026-23868
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  GIFLIB_BUILD_LIBS = static-lib
>  GIFLIB_INSTALL_LIBS = install-static-lib
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
