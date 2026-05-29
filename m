Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1592DCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E09AD422B6;
	Fri, 29 May 2026 08:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKSQsnaTkmSo; Fri, 29 May 2026 08:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8111422AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043386;
	bh=RGUfjlKq0QrQkeBRdorJjhN2/wOxwfWecJ71RhfD014=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GiE+kI1l4k5lSaP1yW0fRjRWVyuZv4eqccDqwM8VxenYuOfYCJERl+fuWxuFVQrhS
	 AozNuReeAoKYN9d1vRixi4jGpdXTiovl47FT4C6i50LPropkr8lQ+0kBbzknEhxVMA
	 EcSdJOCbNb1TniGIq38r7G2gApvgYeFIsB5MJEl1AOPEv/fdPQnis+DSOk3Qd/R4CL
	 0BqyEMkWBpyKosdQtBu7LveBEm81/Hk6oTaC6buEcgMZeDVagzHOsF8xmfBDLaPqyJ
	 MeB87UCjNdkO7ABkOyOZ6kveo8S8hrdGXYyLKEB7rFz8Y5ZXc1FdIqY4olXTjyG7y/
	 Er+HXadROfUHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8111422AB;
	Fri, 29 May 2026 08:29:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97103288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86A0661566
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUlYJbP3kcc4 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3DFAB61540
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DFAB61540
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DFAB61540
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:44 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49048e043e5so58564345e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043382; x=1780648182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5geFyNl8JI/wOA7vVd1nmGQRztA4VWVxOQ8l+NfL08w=;
 b=HE9IZG2TZ2IOpblvnxIj8fdMqL2rO69tUencF2cqRGx1/kyJkvxPtWq6jgeR7QaiCS
 vNhTg1hvjlvaXPpSem80BZCtS5+0qVGvBx12tVJYVuKMoJBQ4iYXPbDyo5XO14QCEty2
 VTBaxuP7NK8IJ3aP0xjf+NYMKaIzbqXUwNgCqPY6ovh5zkypprOdkHz+B/8Zuqagkqn1
 suCTcxh2Q1LtEzVB7/5us4tfV+x3VTN/HAoKfUp38BLNolmifkNZkj6KIyKYjBOvPTD1
 xtoXdwTWmM0Wyg841WQ5CeVBGucBxMMYUOOG9NtOBloIgwBP6oITpaacxsCodY9sPRes
 AthQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8MiqpBAooIAICm//jxJOwGvnPzQVrH6y31jBBfv82+JskgpM6n9756PQjE6Nk1wOdRTqk1GMFqysw=@buildroot.org
X-Gm-Message-State: AOJu0YwFCj7OHnWGsosF7fRFD5ITtGZEBz2OZOEyJZvi9fxuHeRIdwEX
 +x67yfuSKHhiUglc/0IPOfw1eRuKPx0wpFGR2rEDnPATEHU60bmZ5DpUJ6fFRusQhRqG6ezqQYm
 tmTAg
X-Gm-Gg: Acq92OHDEmIxdsrNiHDEIuwvE0kXwqgPNzThwRzbbGDXwIXvexF5UMiOumHqGP5/a+M
 k34+rEaUxzEXzYO5XmTN0BD2S58SGsuJRKYQNlIGY3nWTeG7mALIArv0XJ9dgKohMDTSXOGDQfC
 MvO5t6o1AH+prnTSakU2zutS3tVneWhZjMI8rQHxMdc3n+VGZRjGkSyQr+vZv8g6rtiss8EMx0H
 kkd3pHYJ5jYo1nFdCUE0p1SZgbMRjfqj5JSXZJQtLUGKT6Lr2b3DstsSGUC0hxqHmfcaQXkART1
 jb+WZINAeFFXkGO1/ZwiPJ+i7N8HQFZ6ElBKRkLGE/BfwSNzEeQ5W/XpKIg5cvdtwMFQYFDa/Zl
 UcfXUNMdQtJ69zyDiad+8ykGpvd1byzKwY4mttry1iZojkjslIgr35zGMItxbilMPqKONnTBAae
 FBoNGOHCtvwrxHASRGCD7JY+escnYXslNG31zOPKY682GV7MWFDi3xf6rE/A==
X-Received: by 2002:a05:600c:5298:b0:490:59cc:999f with SMTP id
 5b1f17b1804b1-4909c072254mr34089425e9.4.1780043381899; 
 Fri, 29 May 2026 01:29:41 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c13276dsm9534415e9.36.2026.05.29.01.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:41 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:41 +0200
Message-ID: <20260529082941.57892-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260406134106.4145818-1-dario.binacchi@amarulasolutions.com>
References: <20260406134106.4145818-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043382; x=1780648182; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5geFyNl8JI/wOA7vVd1nmGQRztA4VWVxOQ8l+NfL08w=;
 b=cFT9VrtAmiJDABIujsdSvghuRILd6HAdWX79LIbxBgMsZ+W7gUAfJ+0UpzfHfm4Xcj
 RSvLg9x4n2Oj5CMUFuE4xkR9lqZz/YcxoCEeDFdvSRSaKhC1aGYZzLsfxgiLkRC70xoF
 Q7TLqEAwPKQer3vtvVajMaylRC/ghTjb/Tv8GfJ00916xmzDNpJUxTtqqYAAdgQNR5mG
 Tt0LB+ZsG8Uj3l2sdxCYUpdOd5BCRvnALnasCTPP387Fnkguocs49STBVIBjuNWYW7CH
 yuxrFKq1yzyK0B9EySjt/gUG//PJ+joxSrb+JHLIg1ATgczbn9Ax71f5OtK3bhg+voDp
 qxeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cFT9VrtA
Subject: Re: [Buildroot] [PATCH 1/1] package/libgphoto2: fix build with gcc
 >= 14
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
> The commit adds an upstream patch to fix the following build failure:
> 
> jl2005c/jl2005bcd_decompress.c: In function 'jl2005bcd_decompress':
> jl2005c/jl2005bcd_decompress.c:161:46: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]
>   161 |         jpeg_mem_dest (&cinfo, &jpeg_header, &jpeg_header_size);
>       |                                              ^~~~~~~~~~~~~~~~~
>       |                                              |
>       |                                              long unsigned int *
> 
> Fixes:
> - https://autobuild.buildroot.org/results/cb983d9ad90170aa8d7f2b9a5dfc30055d83b5de
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2026.02.x. Thanks

> ---
>  ...s-for-the-size-type-of-jpeg_mem_dest.patch | 143 ++++++++++++++++++
>  package/libgphoto2/libgphoto2.mk              |   2 +
>  2 files changed, 145 insertions(+)
>  create mode 100644 package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
> 
> diff --git a/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch b/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
> new file mode 100644
> index 000000000000..543678181b06
> --- /dev/null
> +++ b/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
> @@ -0,0 +1,143 @@
> +From ca4441f48117c681cecfb3c883115e0546aed985 Mon Sep 17 00:00:00 2001
> +From: Marcus Meissner <marcus@jet.franken.de>
> +Date: Sun, 29 Mar 2026 21:31:49 +0200
> +Subject: [PATCH] autoconf checks for the size type of jpeg_mem_dest
> +
> +fixes https://github.com/gphoto/libgphoto2/pull/1176
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://github.com/gphoto/libgphoto2/commit/ca4441f48117c681cecfb3c883115e0546aed985
> +---
> + camlibs/ax203/ax203.c                   |  2 +-
> + camlibs/ax203/ax203_compress_jpeg.c     |  2 +-
> + camlibs/ax203/jpeg_memsrcdest.h         |  2 ++
> + camlibs/jl2005c/jl2005bcd_decompress.c  |  2 +-
> + camlibs/jl2005c/jpeg_memsrcdest.h       |  2 ++
> + camlibs/ptp2/chdk.c                     |  2 +-
> + libgphoto2_port/gphoto-m4/gp-libjpeg.m4 | 32 +++++++++++++++++++++++++
> + 7 files changed, 40 insertions(+), 4 deletions(-)
> +
> +diff --git a/camlibs/ax203/ax203.c b/camlibs/ax203/ax203.c
> +index 62f572686c44..b9db8ebdabf1 100644
> +--- a/camlibs/ax203/ax203.c
> ++++ b/camlibs/ax203/ax203.c
> +@@ -1202,7 +1202,7 @@ ax203_encode_image(Camera *camera, int **src, char *dest, unsigned int dest_size
> + 	struct jpeg_compress_struct cinfo;
> + 	struct jpeg_error_mgr jcerr;
> + 	JOCTET *jpeg_dest = NULL;
> +-	unsigned long jpeg_size = 0;
> ++	JPEG_SIZE jpeg_size = 0;
> + 	JSAMPLE row[camera->pl->width * 3];
> + 	JSAMPROW row_pointer[1] = { row };
> + #endif
> +diff --git a/camlibs/ax203/ax203_compress_jpeg.c b/camlibs/ax203/ax203_compress_jpeg.c
> +index 1ec7534ff484..22068afd79c0 100644
> +--- a/camlibs/ax203/ax203_compress_jpeg.c
> ++++ b/camlibs/ax203/ax203_compress_jpeg.c
> +@@ -124,7 +124,7 @@ ax206_compress_jpeg(Camera *camera, int **in, uint8_t *outbuf, int out_size,
> + 	jvirt_barray_ptr *in_coefficients;
> + 	unsigned int i, x, y;
> + 	int stop, size, ret, outc;
> +-	unsigned long regular_jpeg_size = 0, buf_size = 0;
> ++	JPEG_SIZE regular_jpeg_size = 0, buf_size = 0;
> + 	int last_dc_val[3] = { 0, 0, 0 };
> + 
> + 	/* We have a rgb24bit image in the desired dimensions, first we
> +diff --git a/camlibs/ax203/jpeg_memsrcdest.h b/camlibs/ax203/jpeg_memsrcdest.h
> +index 674ab7128f8e..22ba2ac1e2c7 100644
> +--- a/camlibs/ax203/jpeg_memsrcdest.h
> ++++ b/camlibs/ax203/jpeg_memsrcdest.h
> +@@ -5,6 +5,8 @@
> + 
> + #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
> + 
> ++#define JPEG_SIZE unsigned long
> ++
> + void
> + jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
> + 	unsigned long bufsize);
> +diff --git a/camlibs/jl2005c/jl2005bcd_decompress.c b/camlibs/jl2005c/jl2005bcd_decompress.c
> +index dff2d6264025..8c3307fd6098 100644
> +--- a/camlibs/jl2005c/jl2005bcd_decompress.c
> ++++ b/camlibs/jl2005c/jl2005bcd_decompress.c
> +@@ -85,7 +85,7 @@ jl2005bcd_decompress (unsigned char *output, unsigned char *input,
> + 	struct jpeg_error_mgr jcerr, jderr;
> + 	JOCTET *jpeg_header = NULL;
> + 	int outputsize = 0;
> +-	unsigned long jpeg_header_size = 0;
> ++	JPEG_SIZE jpeg_header_size = 0;
> + 	int i, x, y, x1, y1, jpeg_data_size, jpeg_data_idx, eoi, size, ret;
> + 	JSAMPLE green[8 * 16];
> + 	JSAMPLE red[8 * 8];
> +diff --git a/camlibs/jl2005c/jpeg_memsrcdest.h b/camlibs/jl2005c/jpeg_memsrcdest.h
> +index 4334e099688a..94fca070d05b 100644
> +--- a/camlibs/jl2005c/jpeg_memsrcdest.h
> ++++ b/camlibs/jl2005c/jpeg_memsrcdest.h
> +@@ -5,6 +5,8 @@
> + 
> + #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
> + 
> ++#define JPEG_SIZE unsigned long
> ++
> + void
> + jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
> + 	unsigned long bufsize);
> +diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
> +index 2787a7261c4a..2646c3ba0fb1 100644
> +--- a/camlibs/ptp2/chdk.c
> ++++ b/camlibs/ptp2/chdk.c
> +@@ -1145,7 +1145,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
> + 	struct		jpeg_error_mgr jerr;
> + 	JSAMPROW	row_ptr[1];
> + 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
> +-	unsigned long	outlen = 0;
> ++	JPEG_SIZE	outlen = 0;
> + 	unsigned int	row_inc;
> + 	int		sshift, dshift, xshift, skip;
> + 
> +diff --git a/libgphoto2_port/gphoto-m4/gp-libjpeg.m4 b/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
> +index ce9e816fdbce..4870882a686d 100644
> +--- a/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
> ++++ b/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
> +@@ -77,6 +77,38 @@ found and made to work.
> +     GP_CONFIG_MSG([JPEG mangling support],
> +                   [${have_libjpeg}])
> +   ])
> ++  dnl find type of memdest
> ++  AC_LANG_PUSH([C])
> ++
> ++  AC_MSG_CHECKING([type of jpeg_mem_dest size])
> ++  AC_COMPILE_IFELSE([
> ++    #include <stdio.h>
> ++    #include <unistd.h>
> ++    #include <jpeglib.h>
> ++    void f(j_compress_ptr cinfo, unsigned char ** outbuffer, unsigned long * outsize) {
> ++	    jpeg_mem_dest(cinfo, outbuffer, outsize);
> ++    }
> ++  ],[
> ++     AC_MSG_RESULT([unsigned long*])
> ++     AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
> ++  ],[
> ++     AC_COMPILE_IFELSE([
> ++    #include <stdio.h>
> ++    #include <unistd.h>
> ++    #include <jpeglib.h>
> ++    void f(j_compress_ptr cinfo, unsigned char ** outbuffer, size_t * outsize) {
> ++	    jpeg_mem_dest(cinfo, outbuffer, outsize);
> ++    }
> ++    ],[
> ++     AC_MSG_RESULT([size_t*])
> ++     AC_DEFINE([JPEG_SIZE],[size_t], "JPEG memdest size type")
> ++    ],[
> ++     AC_MSG_RESULT([unknown, using unsigned long*])
> ++     AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
> ++    ])
> ++  ]
> ++  )
> ++  AC_LANG_POP([C])
> + ],
> + [AC_MSG_ERROR([
> + Unhandled value given to --with-jpeg: ${with_jpeg}
> +-- 
> +2.43.0
> +
> diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
> index 95c0190ee63d..4265d1c57e10 100644
> --- a/package/libgphoto2/libgphoto2.mk
> +++ b/package/libgphoto2/libgphoto2.mk
> @@ -9,6 +9,8 @@ LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
>  LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
>  LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
>  	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
> +# 0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
> +LIBGPHOTO2_AUTORECONF = YES
>  # There is a single license file for the LGPL-2.1, no license files
>  # for other licenses
>  LIBGPHOTO2_LICENSE_FILES = COPYING
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
